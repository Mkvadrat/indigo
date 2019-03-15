<?php
class ModelParseParse extends Model {
    //Model
    public function addObject(/*$objects*/){
        //Connect to remotedb
        $dbrsql = new DB(DB_DRIVER_VC, DB_HOSTNAME_VC, DB_USERNAME_VC, DB_PASSWORD_VC, DB_DATABASE_VC, DB_PORT_VC);

        $result = $dbrsql->query("SELECT * FROM brain_records AS br JOIN brain_record_categories AS brc JOIN brain_categories AS bc
                                ON (br.id_record = brc.id_record) AND (brc.id_category = bc.id_category) AND br.id_type= 11 GROUP BY br.id_record");
                                
        foreach($result->rows as $result){
            $existing_models = $this->getCurentModel($result['id_record']);
            
            if(!in_array($result['id_record'], $existing_models)){
                $sql = ("INSERT INTO " . DB_PREFIX . "product SET model = '" . $result['id_record'] . "', agent= '1', uniq_options = '0', sku = '', upc = '', ean = '', jan = '', isbn = '', mpn = '', location = '44.4982,34.1693',
                        quantity = '1', stock_status_id = '7', manufacturer_id = '', shipping = '', tax_class_id = '', points = '', date_available = NOW(), weight = '', weight_class_id = '', length = '',
                        width = '', height = '', length_class_id = '', subtract = '', minimum = '', sort_order = '', status = '1', viewed = '', date_added = NOW()")  ;
                    
                $dbsql = $this->db->query($sql);
                    
                if($dbsql){
                    $product_id = $this->getCurentId();
                }
                
                //Prices
                if(!empty($result['rub_total'])){
                    $rub_total = (float)$result['rub_total'];
                    $this->db->query("UPDATE " . DB_PREFIX . "product SET price='" . $result['rub_total'] . "', currency_id = '1' WHERE product_id = '" . (int)$product_id . "'");
                }
                elseif(!empty($result['usd_total'])){
                    $usd_total = (float)$result['usd_total'];
                    $this->db->query("UPDATE " . DB_PREFIX . "product SET price='" . $usd_total . "', currency_id = '2' WHERE product_id = '" . (int)$product_id . "'");
                }
            
                //Thumbnails
                $thumbnails = $dbrsql->query("SELECT * FROM brain_documents WHERE bind_id = '" . $result['id_record'] . "' AND bind_field = 'thumbnail'");
                
                foreach($thumbnails->rows as $thumbnail){
                    $checking_thumbnail = isset($thumbnail['resized_path']) ? 'catalog/' . $thumbnail['resized_path'] : null;
                    
                    $this->db->query("UPDATE " . DB_PREFIX . "product SET image='" . $checking_thumbnail . "' WHERE product_id = '" . (int)$product_id . "'");
                }
            
                //Images
                $images = $dbrsql->query("SELECT * FROM brain_documents WHERE bind_id = '" . $result['id_record'] . "' AND bind_field = 'images'");
                
                foreach($images->rows as $key => $image){
                    if(!empty($image['resized_path'])){
                        $this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$product_id . "', image = '" . 'catalog/' . $image['resized_path'] . "', sort_order = '" . $key . "'");
                    }
                }

                //Descriptions                
                $xml_file_data = json_decode(json_encode(simplexml_load_string($result['xml'], 'SimpleXMLElement', LIBXML_NOCDATA),true), true);
                
                //options
                $total_area_val = isset($xml_file_data['total_area']) ? $xml_file_data['total_area'] : '';
                $usefull_area_val = isset($xml_file_data['usefull_area']) ? $xml_file_data['usefull_area'] : '';
                $kitchen_area_val = isset($xml_file_data['kitchen_area']) ? $xml_file_data['kitchen_area'] : '';
                $lodgia_area_val = isset($xml_file_data['lodgia_area']) ? $xml_file_data['lodgia_area'] : '';
                $total_floors_val = isset($xml_file_data['total_floors']) ? $xml_file_data['total_floors'] : '';
                $app_floor_val = isset($xml_file_data['app_floor']) ? $xml_file_data['app_floor'] : '';
                
                if(!empty($xml_file_data['state_new']) && $xml_file_data['state_new'] == "Y"){
                    $state_new = 'Да';
                }else{
                    $state_new = 'Нет';
                }
                
                $options_tbl = array(
                    'Общая площадь' => $total_area_val,
                    'Жилая площадь' => $usefull_area_val,
                    'Площадь кухни' => $kitchen_area_val,
                    'Площадь балкона' => $lodgia_area_val,
                    'Этажность' => $total_floors_val,
                    'Этаж' => $app_floor_val,
                    'Новый дом' => $state_new,
                );
                
                $table = '';
                $table .= '<table border="1">';
                
                foreach($options_tbl as $name => $value){
                    $table .= '<tr>';
                    $table .= '<td>'.$name.'</td>';
                    $table .= '<td>'.$value.'</td>';
                    $table .= '</tr>';
                }
			
                $table .= '</table>';
                                
                $hiddenannotation = isset($xml_file_data['hiddenannotation']) ? $xml_file_data['hiddenannotation'] : '';
                $short_content = isset($xml_file_data['short_content']) ? $xml_file_data['short_content'] : '';
                
                $this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$product_id . "', language_id = '1',name = '" . $result['title'] . "',
                                description = '" . '<p>' . strip_tags($xml_file_data['content']) . '</p>' .  "', hiddenannotation = '" . '<p>' . strip_tags($hiddenannotation) . '</p>' . '<br>' . $table . "',
                                features = '" . '<p>' . strip_tags($short_content) . '</p>' . "', tag = '', meta_title = '" . $result['title'] . "', meta_h1 = '" . $result['title'] . "',
                                meta_description = '', meta_keyword = ''");
                
                //Maps address
                if(!empty($xml_file_data['maplocation'])){
                    $this->db->query("UPDATE " . DB_PREFIX . "product SET address='" . $xml_file_data['maplocation'] . "' WHERE product_id = '" . (int)$product_id . "'");
                }
                
                //Status
                if(!empty($xml_file_data['state_new']) && $xml_file_data['state_new'] == "Y"){
                    $this->db->query("UPDATE " . DB_PREFIX . "product SET status = '0' WHERE product_id = '" . (int)$product_id . "'");
                }
                
                //Categories
                if($result['id_category'] == '5'){
                    //main
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '80'");
                    
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '81'");
                    
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '82'");
                }
                elseif($result['id_category'] == '6'){
                    //main
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '80'");
                    
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '81'");
                    
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '83'");
                }
                elseif($result['id_category'] == '7'){
                    //main
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '80'");
                    
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '81'");
                    
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '84'");
                }
                elseif($result['id_category'] == '8'){
                    //main
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '80'");
                                    
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '86'");
                }
                elseif($result['id_category'] == '9'){
                    //main
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '80'");
                                    
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '87'");
                }
                elseif($result['id_category'] == '10'){
                    //main
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '80'");
                                    
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '88'");
                }
                elseif($result['id_category'] == '11' || $result['id_category'] == '19'){
                    //main
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '80'");
                                    
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '89'");
                }
                elseif($result['id_category'] == '23'){
                    //main
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '80'");
                                    
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '85'");
                }
                
                //Current layot and store
                $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$product_id . "', store_id = '0'");
                
                $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$product_id . "', store_id = '0', layout_id = '0'");
                
                //Current url
                $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$product_id . "', keyword = '" . $result['uri'] . "'");
            }
        }
        
        /*$message_data = array();
        
        foreach($objects as $object){
            $existing_prices = $this->getPrice($object['price']);
                        
            if(!in_array($object['price'], $existing_prices) && $object['id']){
                
                $sql = ("INSERT INTO " . DB_PREFIX . "product SET model = '" . $object['id'] . "', agent= '1', uniq_options = '0', sku = '', upc = '', ean = '', jan = '', isbn = '', mpn = '', location = '44.4982,34.1693',
                        quantity = '1', stock_status_id = '7', manufacturer_id = '', shipping = '', price = " . (float)$object['price'] . ", currency_id = '1', tax_class_id = '', points = '', date_available = '',
                        weight = '', weight_class_id = '', length = '', width = '', height = '', length_class_id = '', subtract = '', minimum = '', sort_order = '', status = '0', viewed = '', date_added = NOW()")  ;
                
                $dbsql = $this->db->query($sql);
                
                if($dbsql){
                    $product_id = $this->getCurentId();
                }
                            
                $checking_image = isset($object['images'][0]) ? $object['images'][0] : null;
                
                $this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $checking_image . "' WHERE product_id = '" . (int)$product_id . "'");
                 
                $this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$product_id . "', language_id = '1',name = '" . $object['title'] . "',
                        description = '" . $object['description'] . "', features = '" . $object['tbloption'] . "', tag = '', meta_title = '" . $object['title'] . "',
                        meta_h1 = '" . $object['title'] . "', meta_description = '', meta_keyword = ''");
                                
                $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$product_id . "', store_id = '0'");
                
                $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$product_id . "', store_id = '0', layout_id = '0'");

                foreach($object['images'] as $key => $image){
                   $this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$product_id . "', image = '" . $image . "', sort_order = '" . $key . "'");
                }
                
                if($object['data_category'] == '1'){                    
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '" . (int)$object['single_category'] . "'");
                }
                                
                $message_data[] = array(
                    'id' => $object['id'],
                    'title' => $object['title']
                );
                
                foreach($object['label'] as $key => $url){
                   $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$product_id . "', keyword = '" . $url . "'");
                }
            }
        }
        
        return $message_data;*/
    }

    public function addOption($options){
        $i=0;
        foreach($options as $nameoption => $valueoption){
            $i++;
            $opt = $this->getNameOption();
            
            $exists_opt_id = $this->getExistsOptions($nameoption);
            
            if(!in_array($nameoption, $opt) && !empty($exists_opt_id)){
                //Значения опций
                foreach($exists_opt_id as $option_id){
                    $sql = ("INSERT INTO " . DB_PREFIX . "ocfilter_option_value SET option_id = '" . (int)$option_id . "', sort_order = '" . (int)$i . "', `keyword` = '" . $this->translit($valueoption) . "', parse_keyword = '" . $this->translit($nameoption) . "', color = '', image = ''");
        
                    $dbsql = $this->db->query($sql);
                    
                    if($dbsql){
                      $value_id = $this->getCurentOptionValueId();
                    }
                    
                    $this->db->query("INSERT INTO " . DB_PREFIX . "ocfilter_option_value_description SET value_id = '" . $value_id . "', option_id = '" . (int)$option_id . "', language_id = '1', name = '" . $valueoption . "'");
                }
            }else{
                $sql = ("INSERT INTO " . DB_PREFIX . "ocfilter_option SET status = '1', sort_order = '" . (int)$i . "', type = 'select', grouping = '0', selectbox = '0', color = '0', image = '0'");
                
                $dbsql = $this->db->query($sql);
                
                if($dbsql){
                    $option_id = $this->getCurentOptionId();
                }
                
                $this->db->query("INSERT INTO " . DB_PREFIX . "ocfilter_option_description SET option_id = '" . (int)$option_id . "', language_id = '1', name = '" . $nameoption . "', description = '', postfix = ''");
                
                $this->db->query("INSERT INTO " . DB_PREFIX . "ocfilter_option_to_store SET option_id = '" . (int)$option_id . "', store_id = '0'");
                
                $this->db->query("UPDATE " . DB_PREFIX . "ocfilter_option SET `keyword` = '" . $this->translit($nameoption) . "' WHERE option_id = '" . (int)$option_id . "'");
    
                //Значения опций
                $sql = ("INSERT INTO " . DB_PREFIX . "ocfilter_option_value SET option_id = '" . (int)$option_id . "', sort_order = '" . (int)$i . "', `keyword` = '" . $this->translit($valueoption) . "', parse_keyword = '" . $this->translit($nameoption) . "', color = '', image = ''");
    
                $dbsql = $this->db->query($sql);
                
                if($dbsql){
                  $value_id = $this->getCurentOptionValueId();
                }
                
                $this->db->query("INSERT INTO " . DB_PREFIX . "ocfilter_option_value_description SET value_id = '" . $value_id . "', option_id = '" . (int)$option_id . "', language_id = '1', name = '" . $valueoption . "'");
            }
        }
    }

    //Model
    public function getPrice($price){        
        $query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product WHERE price = '" . $price . "'");
            
        return $query->row;
    }
    
    public function getCurentModel($model_id){        
         $query = $this->db->query("SELECT model FROM " . DB_PREFIX . "product WHERE model = '" . (int)$model_id . "'");
                
        $models = $query->row;
        
        return $models;
    }

    //Model
    public function getCurentId(){      
        $query = $this->db->query("SELECT MAX(product_id) FROM  " . DB_PREFIX . "product");
                
        $curent_id = $query->row['MAX(product_id)'];
        
        $product_id = $curent_id;
        
        return $product_id;
    }

    public function getCurentOptionId(){
        $query = $this->db->query("SELECT MAX(option_id) FROM  " . DB_PREFIX . "ocfilter_option");

        $curent_id = $query->row['MAX(option_id)'];
        
        $option_id = $curent_id;
        
        return $option_id;
    }

    public function getCurentOptionValueId(){ 
        $query = $this->db->query("SELECT MAX(value_id) FROM  " . DB_PREFIX . "ocfilter_option_value");
                
        $curent_id = $query->row['MAX(value_id)'];
        
        $value_id = $curent_id;
        
        return $value_id;
    }
    
    public function getCurentUrlAliasId(){ 
        $query = $this->db->query("SELECT MAX(url_alias_id) FROM  " . DB_PREFIX . "url_alias");
                
        $curent_id = $query->row['MAX(url_alias_id)'];
        
        $value_id = $curent_id;
        
        return $value_id;
    }

    public function getNameOption(){
        $query = $this->db->query("SELECT name FROM " . DB_PREFIX . "ocfilter_option_description");
                
        return  $query->rows;
    }
    
    public function getExistsOptions($noption){
        $query = $this->db->query("SELECT option_id FROM " . DB_PREFIX . "ocfilter_option_description WHERE name = '" . $noption . "'");
                
        return $query->row;
    }

    public function translit($string) {
        $replace = array(
            'а' => 'a',
            'б' => 'b',
            'в' => 'v',
            'г' => 'g',
            'ґ' => 'g',
            'д' => 'd',
            'е' => 'e',
            'є' => 'je',
            'ё' => 'e',
            'ж' => 'zh',
            'з' => 'z',
            'и' => 'i',
            'і' => 'i',
            'ї' => 'ji',
            'й' => 'j',
            'к' => 'k',
            'л' => 'l',
            'м' => 'm',
            'н' => 'n',
            'о' => 'o',
            'п' => 'p',
            'р' => 'r',
            'с' => 's',
            'т' => 't',
            'у' => 'u',
            'ф' => 'f',
            'х' => 'h',
            'ц' => 'ts',
            'ч' => 'ch',
            'ш' => 'sh',
            'щ' => 'sch',
            'ъ' => '',
            'ы' => 'y',
            'ь' => '',
            'э' => 'e',
            'ю' => 'ju',
            'я' => 'ja',
            ' ' => '-',
            '+' => 'plus'
        );
        
        $string = mb_strtolower($string, 'UTF-8');
        $string = strtr($string, $replace);
        $string = preg_replace('![^a-zа-яёйъ0-9]+!isu', '-', $string);
        $string = preg_replace('!\-{2,}!si', '-', $string);
        
        return $string;
    }
}