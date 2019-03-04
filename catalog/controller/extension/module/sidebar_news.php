<?php
class ControllerExtensionModuleSidebarNews extends Controller {

	public function index($setting) {
		$this->load->language('extension/module/sidebar_news');
	
		$this->load->model('localisation/language');
	
		$languages = $this->model_localisation_language->getLanguages();
		
		$this->load->model('catalog/news');
	
		$data['text_more'] = $this->language->get('text_more');

		$data['text_date_added'] = $this->language->get('text_date_added');
			
		$data['button_list'] = $this->language->get('button_list');
	
		$data['sidebar_news_list'] = $this->url->link('information/news');
		
		$data['sidebar_news'] = array();
		
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['html'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8');

		$results = $this->model_catalog_news->getNewsShorts($setting['limit']);
		
		$this->load->model('tool/image');
	
		foreach ($results as $result) {			
			$data['news'][] = array(
				'title'        		=> $result['title'],
				'viewed' 			=> sprintf($this->language->get('text_viewed'), $result['viewed']),
				'href'         		=> $this->url->link('information/news/info', 'news_id=' . $result['news_id']),
				'posted'   			=> date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}
	
		if ($data['news']) {
			return $this->load->view('extension/module/sidebar_news', $data);
		}
	}
}
