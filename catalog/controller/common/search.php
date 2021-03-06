<?php
class ControllerCommonSearch extends Controller {
	public function index() {
		$this->load->language('common/search');

		$data['text_search'] = $this->language->get('text_search');

		if (isset($this->request->get['model'])) {
			$data['search'] = $this->request->get['model'];
		} else {
			$data['search'] = '';
		}

		return $this->load->view('common/search', $data);
	}
}