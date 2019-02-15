<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleSmainblock extends Controller {
	public function index($setting) {
		if (isset($setting['module_description'][$this->config->get('config_language_id')])) {
			$data['fblock'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['fblock'], ENT_QUOTES, 'UTF-8');
			$data['sblock'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['sblock'], ENT_QUOTES, 'UTF-8');
			$data['tblock'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['tblock'], ENT_QUOTES, 'UTF-8');
			$data['fhblock'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['fhblock'], ENT_QUOTES, 'UTF-8');
			$data['fvblock'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['fvblock'], ENT_QUOTES, 'UTF-8');
			$data['sxblock'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['sxblock'], ENT_QUOTES, 'UTF-8');
			$data['snblock'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['snblock'], ENT_QUOTES, 'UTF-8');

			return $this->load->view('extension/module/smainblock', $data);
		}
	}
}