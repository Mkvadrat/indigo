<?php
class ControllerInformationContact extends Controller {
	private $error = array();

	public function index() {
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
		
		$data['contacts_address'] = html_entity_decode($this->config->get('config_contacts_address'), ENT_QUOTES, 'UTF-8');
		$data['contacts_working'] = html_entity_decode($this->config->get('config_contacts_working'), ENT_QUOTES, 'UTF-8');
		$data['contacts_sales_tel'] = html_entity_decode($this->config->get('config_contacts_sales_tel'), ENT_QUOTES, 'UTF-8');
		$data['contacts_sales_emails'] = html_entity_decode($this->config->get('config_contacts_sales_emails'), ENT_QUOTES, 'UTF-8');
		$data['contacts_rents_tel'] = html_entity_decode($this->config->get('config_contacts_rents_tel'), ENT_QUOTES, 'UTF-8');
		$data['contacts_rents_emails'] = html_entity_decode($this->config->get('config_contacts_rents_emails'), ENT_QUOTES, 'UTF-8');
		$data['contacts_certificate'] = html_entity_decode($this->config->get('config_contacts_certificate'), ENT_QUOTES, 'UTF-8');
		$data['contacts_requisite'] = html_entity_decode($this->config->get('config_contacts_requisite'), ENT_QUOTES, 'UTF-8');
		$data['contacts_bank_card'] = html_entity_decode($this->config->get('config_contacts_bank_card'), ENT_QUOTES, 'UTF-8');
		
		$this->load->model('tool/image');
		
		if ($this->config->get('config_contacts_img')) {
			$data['image'] = $this->model_tool_image->resize($this->config->get('config_contacts_img'), 1402, 1025);
		} else {
			$data['image'] = '';
		}
		
		$data['geocode'] = $this->config->get('config_geocode');
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/contact', $data));
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
					'status' => 200,
					'message' => 'Ваше сообщение отправлено'
				);
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
					'status' => 500,
					'message' => 'Ошибка, сообщение не отправлено! Заполните все поля!'
				);
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
