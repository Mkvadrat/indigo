<?php
class ControllerInformationRequest extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('information/request');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/contact')
		);

		$data['heading_title'] = $this->language->get('heading_title');
		
		//remove all files after reload page
		$this->load->model('tool/upload');

		$this->model_tool_upload->removeAll();
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/request', $data));
	}
			
	public function sendRequest(){
		$json = array();
		
		$json = array(
			'status' => 0,
			'message' => ''
		);
		
		$site_url = $_SERVER['SERVER_NAME'];
			
		if (isset($this->request->post['name'])) {$name = $this->request->post['name']; if ($name == '') {unset($name);}}
		if (isset($this->request->post['tel'])) {$tel = $this->request->post['tel']; if ($tel == '') {unset($tel);}}
		if (isset($this->request->post['email'])) {$email = $this->request->post['email'];}
		if (isset($this->request->post['city'])) {$city = $this->request->post['city'];}
		if (isset($this->request->post['wishes'])) {$wishes = $this->request->post['wishes'];}
		if (isset($this->request->post['type'])) {$type = $this->request->post['type'];}
		if (isset($this->request->post['object'])) {$object = $this->request->post['object'];}
		if (isset($this->request->post['description'])) {$description = $this->request->post['description'];}
		
		if (isset($this->request->post['attach'])) {$attach = $this->request->post['attach'];}
	
		if (isset($name) && isset($tel)){
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			
			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($site_url);
			$mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode(sprintf($this->language->get($site_url), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
			
			if($wishes == 1){
				$wish = 'Купить';
			}elseif($wishes == 2){
				$wish = 'Продать';
			}elseif($wishes == 3){
				$wish = 'Обменять';
			}elseif($wishes == 4){
				$wish = 'Снять';
			}elseif($wishes == 5){
				$wish = 'Сдать';
			}
			
			if($type == 1){
				$types = 'Квартира';
			}elseif($type == 2){
				$types = 'Земельный участок';
			}elseif($type == 3){
				$types = 'Коммерческую недвижимость';
			}elseif($type == 4){
				$types = 'Другую недвижимость';
			}elseif($type == 'empty'){
				$types = 'Тип недвижимости не был выбран';
			}
			
			if(!empty($attach)){
				$exp = explode(',', $attach);
				
				$this->load->model('tool/upload');

				foreach($exp as $name){
					$filename = $this->model_tool_upload->getImageByName($name);
					
					foreach($filename as $image){
						if(file_exists(DIR_UPLOAD.$image['filename'])){
							copy(DIR_UPLOAD.$image['filename'], DIR_UPLOAD.$image['name']);
							
							$mail->addAttachment(DIR_UPLOAD.$image['name'], 'F');
						}
					}
				}
			}
			
			$mail->setHtml(
				html_entity_decode(
					sprintf(
							'Имя: ' . $name . '<br>' .
							'Телефон: ' . $tel . '<br>' .
							'Email: ' . $email . '<br>' .
							'Город: ' . $city . '<br>' .
							'Характер сделки: ' . $wish . '<br>' .
							'Тип недвижимости: ' . $types . '<br>' .
							'Номер обьекта: ' . $object . '<br>' .
							'Сообщение: ' . $description
						)
					, ENT_QUOTES, 'UTF-8'
				)
			);
			
			$send = $mail->send();
			
			if(!empty($attach)){
				$exp = explode(',', $attach);
				
				$this->load->model('tool/upload');

				foreach($exp as $name){
					$filename = $this->model_tool_upload->getImageByName($name);
					
					foreach($filename as $image){
						if(file_exists(DIR_UPLOAD.$image['name'])){
							unlink(DIR_UPLOAD.$image['name']);
						}
					}
				}
			}
		
			if ($mail){
				$json = array(
					'status' => 200,
					'message' => 'Ваше сообщение отправлено'
				);
				
				//remove all files after send missege
				$this->load->model('tool/upload');
		
				$this->model_tool_upload->removeAll();
			}else{
				$json = array(
					'status' => 500,
					'message' => 'Ошибка, сообщение не отправлено!'
				);
			}
		}
	
		if (isset($this->request->post['name']) && isset($this->request->post['tel'])){
			$name = $this->request->post['name'];
			$tel = $this->request->post['tel'];
			
			if ($name == '' || $tel == '') {
				unset($name);
				unset($tel);
			
				$json = array(
					'status' => 1,
					'message' => 'Ошибка, сообщение не отправлено! Заполните все поля!'
				);
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
