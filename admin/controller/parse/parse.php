<?php
class ControllerParseParse extends Controller {
	public function index() {
		$this->load->language('parse/parse');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		//len
		$data['heading_title'] = $this->language->get('heading_title');
		
		//text
		$data['text_resource'] = $this->language->get('text_resource');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_form'] = $this->language->get('text_form');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_category_import'] = $this->language->get('text_category_import');
		$data['text_form_agency3d'] = $this->language->get('text_form_agency3d');
		$data['text_table'] = $this->language->get('text_table');
		$data['text_house'] = $this->language->get('text_house');
		$data['text_land'] = $this->language->get('text_land');
		$data['text_apartment'] = $this->language->get('text_apartment');
		$data['text_hotels'] = $this->language->get('text_hotels');
		
		//button
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		//breadcrumbs
		$url = '';
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('parse/parse', 'token=' . $this->session->data['token'] . $url, true)
		);
		
		if (isset($this->request->post['data_resource'])){
			$data_resource = $this->request->post['data_resource'];
		}else{
			$data_resource = '';
		}
				

		if(($this->request->server['REQUEST_METHOD'] == 'POST')){
			/*$message_data = $this->getPresentIndigo();

			foreach($message_data as $value){
				$this->session->data['message'][] = array(
					'id' => $value['id'],
					'title' => $value['title']
				);
			}*/
			
			$this->load->model('parse/parse');
			
			$message_data = $this->model_parse_parse->addObject();

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('parse/parse', 'token=' . $this->session->data['token'], true));
		}
		
		//variables		
		$data['data_category'] = array('0'=>'Не использовать', '1' => 'Импорт только для одной конкретной категории (Пункт 1)');
				
		$data['action'] = $this->url->link('parse/parse', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true);

		$data['token'] = $this->session->data['token'];
		 		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		if (isset($this->session->data['message'])) {
			$data['message'] = $this->session->data['message'];

			unset($this->session->data['message']);
		} else {
			$data['message'] = '';
		}
	
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('parse/parse', $data));
	}
			
	public function getParseFromIndigo(){
		$data = array();
		
		//add lib
		require(DIR_SYSTEM . '/library/libs/phpQuery-master/phpQuery/phpQuery.php');
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$catalog_protocol = HTTPS_CATALOG;
		} else {
			$catalog_protocol = HTTP_CATALOG;
		}
		
		if (isset($this->request->post['sitemap']) && !$_FILES['userfile']['name']) {
			$sitemap = $catalog_protocol . 'sitemap/' . $this->request->post['sitemap'];
			
			$file = $this->file_get_contents_curl($sitemap);
		}else{
			$uploaddir = DIR_SITEMAP;
			$uploadfile = $uploaddir . basename($_FILES['userfile']['name']);
			$upload = move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile);
			$sitemap = DIR_SITEMAP . $_FILES['userfile']['name'];
			
			$file = file_get_contents($sitemap);
		}
		
		preg_match_all("/loc>(.*)<\/loc>/Usi", $file, $link);
		
		for($i=0; $i<count($link[1]); $i++){
			$url = $link[1][$i];
			if(!empty($url)){
				$page = $this->file_get_contents_curl($url);
				
				$element = $page;    
				
				$html = phpQuery::newDocument($element);
				
				$div_card = $html->find('div.estate-wrapper');
				
				$href_arr = array();
				$id_arr = array();
				$name_arr = array();
				$value_arr = array();
				$path = array();
				$external_url = array();
				$external_url[] = $url;
				
				foreach($div_card as $div){
					$pg = pq($div);
					
					//Поиск
					$href_array = $pg->find("ul.estate-photos-list li a");
					$ids = $pg->find("div.estate-id");
					$title = $pg->find("div.estate-title h1");
					$descr = $pg->find("div.estate-description p");
					//$rm1 = $pg->find("div.estate-price span")->remove();
					$price = $pg->find("div.estate-price span");
					$option_name = $pg->find("ul.specifications-list li.specification-item span.title");
					$option_value = $pg->find("ul.specifications-list li.specification-item span.value");
					
					//Преобразование
					foreach($href_array as $href){
						$href_array = pq($href);
						$href_arr[] = $href_array->attr('href');
					}
					
					foreach($href_arr as $image){
						$ex = explode('/', $image);
						
						$path[] = 'catalog/'.$ex[4].'/'.$ex[5].'/'.$ex[6].'/'.$ex[7];
					}
					
					//Массив с названием опций
					foreach($option_name as $name){
						$name_array = pq($name);
						$name_arr[] = $name_array->text();
					}
					
					//Массив с значением опций
					foreach($option_value as $value){
						$value_array = pq($value);
						$value_arr[] = $value_array->text();
					}
					
					//Преобразование в переменную
					$ids = pq($ids);
					$title = pq($title);
					$descr = pq($descr);
					$price = pq($price);
					
					//Представление в массив
					$image = $path;
					$ids = $ids->text();
					$title = $title->text();
					$descr = $descr->text();
					$price = $price->text();
					
					//Опции      
					$data[] = array(
						'image'  => $image,
						'ids'     => $ids,
						'url'   => $external_url,
						'title'  => $title,
						'descr'  => $descr,
						'price' => $price,
						'massive' => array_combine($name_arr, $value_arr),
						'name' => $name_arr,
						'value' => $value_arr
					);
				}
			}
			unset($page);
		}
		
		return $data;
	}

	//Controller
	public function getPresentIndigo(){
		$objects = array();
		$opname = array();
		
		if (isset($this->request->post['data_category'])){
			$data_category = $this->request->post['data_category'];
		}else{
			$data_category = 0;
		}
		
		if (isset($this->request->post['category'])){
			$single_category = $this->request->post['category'];
		}else{
			$single_category = '';
		}
		
		$data = $this->getParseFromIndigo();
		
		foreach($data as $present){
			$ids = $present['ids'];
			$external_url = $present['url'];
			$images = $present['image'];
			$title = $present['title'];
			$description = '<p>' . $present['descr'] . '</p>';
			$curent_price = $present['price'];
			$options = $present['massive'];
			$options_name = $present['name'];
			$options_value = $present['value'];
			
			//Удаляем номер
			$curent_id = $ids;
			$explode_id = explode('№',$curent_id);
			$ids = isset($explode_id[1]) ? $explode_id[1] : null;
			
			//Цена
			$price = preg_replace("/[^x\d|*\.]/", "", $curent_price);
			
			//url
			foreach($external_url as $url){
				$curent_url[] = $url;
				$explode_url = explode('/',$url);
				$label_url = array();
				$label_url[] = $explode_url[4];
			}
			
			//удаляем двоеточие
			foreach($options_name as $name){
				$ename = explode(':', $name);
				$opname[] = $ename[0];
			}
			
			$table = '';
			$table .= '<table border="1">';
			
			foreach($options as $name => $value){
				$table .= '<tr>';
				$table .= '<td>'.$name.'</td>';
				$table .= '<td>'.$value.'</td>';
				$table .= '</tr>';
			}
			
			$table .= '</table>';
			
			$min = min(count($opname), count($options_value));
			$result = array_combine(array_slice($opname, 0, $min), array_slice($options_value, 0, $min));
			
			//Опции      
			$objects[] = array(
				'id'     => $ids,
				'url'    => $curent_url,
				'label'  => $label_url,
				'images'  => $images,
				'title'  => $title,
				'description'  => $description,
				'price' => $price,
				'tbloption' => $table,
				'options' => $result,
				'data_category' => $data_category,
				'single_category' => $single_category,
				'currency_id' => ''
			);
	
			$this->load->model('parse/parse');
		}
		
		$message_data = $this->model_parse_parse->addObject($objects);
			
		return $message_data;
	}
	
	//Controller
	public function file_get_contents_curl($url){
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_AUTOREFERER, TRUE);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 3);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		$data = curl_exec($ch);
		curl_close($ch);
		return $data;
	}
}