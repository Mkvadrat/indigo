<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerExtensionModuleBlogLatestIn extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/blog_latest_in');

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
			'limit' => 4
		);
		
		$results = $this->model_blog_article->getArticles($filter_data);

		if ($results) {
			foreach ($results as $result) {						
				$data['configblog_review_status'] = $this->config->get('configblog_review_status');

				$data['articles'][] = array(
					'article_id'  => $result['article_id'],
					'name'        => $result['name'],
					'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
					'viewed'      => $result['viewed'],
					'href'        => $this->url->link('blog/article', 'article_id=' . $result['article_id']),
				);
			}

			return $this->load->view('extension/module/blog_latest_in', $data);
		}
	}
}