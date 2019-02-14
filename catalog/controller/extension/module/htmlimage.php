<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleHtmlImage extends Controller {
	public function index($setting) {
		if (isset($setting['module_description'][$this->config->get('config_language_id')])) {
			$this->load->model('tool/image');
			
			if ($setting['image']) {
				$data['image'] = $this->model_tool_image->resize($setting['image'], $setting['width'], $setting['height']);
			} else {
				$data['image'] = '';
			}
			
			$data['html'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8');

			return $this->load->view('extension/module/htmlimage', $data);
		}
	}
}