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
		
		$this->load->model('catalog/request');
		
		$images = $this->model_catalog_request->getImage();
		
		$data['images'] = $images;

		
		
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/request', $data));
	}
		
	protected function validate() {
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!preg_match($this->config->get('config_mail_regexp'), $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ((utf8_strlen($this->request->post['enquiry']) < 10) || (utf8_strlen($this->request->post['enquiry']) > 3000)) {
			$this->error['enquiry'] = $this->language->get('error_enquiry');
		}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
			$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

			if ($captcha) {
				$this->error['captcha'] = $captcha;
			}
		}

		return !$this->error;
	}

	public function success() {
		$this->load->language('information/contact');

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

		$data['text_message'] = $this->language->get('text_success');

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/success', $data));
	}
	
	public function sendContactsForm(){
		$json = array();
		
		$json = array(
			'status' => 0,
			'message' => ''
		);
		
		$site_url = $_SERVER['SERVER_NAME'];
	
		if (isset($this->request->post['name'])) {$name = $this->request->post['name']; if ($name == '') {unset($name);}}
		if (isset($this->request->post['tel'])) {$tel = $this->request->post['tel']; if ($tel == '') {unset($tel);}}
		if (isset($this->request->post['email'])) {$email = $this->request->post['email'];}
		if (isset($this->request->post['message'])) {$message = $this->request->post['message'];}
	
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
			
			$mail->setHtml(html_entity_decode(sprintf('Имя: ' . $name . '<br>' . 'Телефон: ' . $tel . '<br>' . 'Email: ' . $email . '<br>' . 'Сообщение: ' . $message), ENT_QUOTES, 'UTF-8'));
			$send = $mail->send();
						
			if ($mail){
				$json = array(
					'status' => 1,
					'message' => 'Ваше сообщение отправлено'
				);
			}else{
				$json = array(
					'status' => 1,
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
	
	public function sendFormAgent(){
		$json = array();
		
		$json = array(
			'status' => 0,
			'message' => ''
		);
		
		$site_url = $_SERVER['SERVER_NAME'];
	
		if (isset($this->request->post['name'])) {$name = $this->request->post['name']; if ($name == '') {unset($name);}}
		if (isset($this->request->post['tel'])) {$tel = $this->request->post['tel']; if ($tel == '') {unset($tel);}}
		if (isset($this->request->post['email'])) {$email = $this->request->post['email'];}
		if (isset($this->request->post['message'])) {$message = $this->request->post['message'];}
		
		if (isset($this->request->post['email_agent'])) {
			$email_agent = $this->request->post['email_agent'];
		}else{
			$email_agent = $this->config->get('config_email');
		}
	
		if (isset($name) && isset($tel)){
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($email_agent);
			$mail->setFrom($site_url);
			$mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode(sprintf($this->language->get($site_url), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
			
			$mail->setHtml(html_entity_decode(sprintf('Имя: ' . $name . '<br>' . 'Телефон: ' . $tel . '<br>' . 'Email: ' . $email . '<br>' . 'Сообщение: ' . $message), ENT_QUOTES, 'UTF-8'));
			$send = $mail->send();
						
			if ($mail){
				$json = array(
					'status' => 1,
					'message' => 'Ваше сообщение отправлено'
				);
			}else{
				$json = array(
					'status' => 1,
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
