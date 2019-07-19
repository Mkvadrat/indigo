<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleBlogLatest extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/blog_latest');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_views'] = $this->language->get('text_views');
		$data['button_more'] = $this->language->get('button_more');
		
		$data['news_list'] = $this->url->link('blog/latest');

		$this->load->model('blog/article');

		$this->load->model('tool/image');

		$data['articles'] = array();

		$filter_data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);
		
		$data['html'] = html_entity_decode($setting['html'], ENT_QUOTES, 'UTF-8');

		$results = $this->model_blog_article->getArticles($filter_data);

		if ($results) {
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image']) && $result['image']){
					list($width_orig, $height_orig) = getimagesize(DIR_IMAGE . $result['image']);
					if ($width_orig>900) {
						$height_orig = $height_orig * 900 / $width_orig;
						$width_orig = 900;
					}
				}elseif($setting['height'] && $setting['width']){
					$height_orig = $setting['height'] ;
					$width_orig = $setting['width'];
				}
			
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $width_orig, $height_orig);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $width_orig, $height_orig);
				}
								
				$data['configblog_review_status'] = $this->config->get('configblog_review_status');

				$data['articles'][] = array(
					'article_id'  => $result['article_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('configblog_article_description_length')) . '..',
					'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
					'viewed'      => $result['viewed'],
					'href'        => $this->url->link('blog/article', 'article_id=' . $result['article_id']),
				);
			}

			return $this->load->view('extension/module/blog_latest', $data);
		}
	}
}