<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleFmainblock extends Controller {
	public function index($setting) {
		if (isset($setting['module_description'][$this->config->get('config_language_id')])) {
			if ($setting['fimage']) {
				$data['fthumb'] = $this->model_tool_image->resize($setting['fimage'], 2446, 1214);
			} else {
				$data['fthumb'] = '';
			}
			
			if ($setting['simage']) {
				$data['sthumb'] = $this->model_tool_image->resize($setting['simage'], 1855, 1239);
			} else {
				$data['sthumb'] = '';
			}

			$data['fblock'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['fblock'], ENT_QUOTES, 'UTF-8');
			$data['sblock'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['sblock'], ENT_QUOTES, 'UTF-8');
			$data['tblock'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['tblock'], ENT_QUOTES, 'UTF-8');
			$data['fhblock'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['fhblock'], ENT_QUOTES, 'UTF-8');

			return $this->load->view('extension/module/fmainblock', $data);
		}
	}
}