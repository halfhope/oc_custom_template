<?php
/**
 * @author Shashakhmetov Talgat <talgatks@gmail.com>
 */
class ControllerModuleCustomTemplate extends Controller
{
	private $_version = '1.3.2.1';

	private $error = array();

	public function install()
	{
		
	}

	public function uninstall()
	{
		$this->load->model('setting/setting');
		$this->load->model('setting/store');
		$results = $this->model_setting_store->getStores();

		$stores[] = 0;
		foreach ($results as $result) {
			$stores[] = $result['store_id'];
		}

		foreach ($stores as $key => $value) {
			$this->model_setting_setting->deleteSetting('custom_template_module', $value);
		}
	}

	public function index()
	{
		$this->load->language('module/custom_template');
		$this->document->setTitle($this->language->get('module_heading_title'));

		$this->load->model('setting/setting');

		if (isset($this->request->get['store_id'])) {
			$this->data['selected_store_id'] = $this->request->get['store_id'];
		} else {
			$this->data['selected_store_id'] = 0;
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$this->data['selected_store_id'] = $this->request->post['selected_store_id'];

			unset($this->request->post['selected_store_id']);

			if (isset($this->request->post['custom_template_module'])) {
				foreach ($this->request->post['custom_template_module'] as $key => $module) {
					$this->request->post['custom_template_module'][$key]['template_name'] = str_replace(array(
						'//',
						'\\'
					), '/', $module['template_name']);
				}
				$this->model_setting_setting->editSetting('custom_template_module', $this->request->post, $this->data['selected_store_id']);
			} else {
				$this->model_setting_setting->deleteSetting('custom_template_module', $this->data['selected_store_id']);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('module/custom_template', 'token=' . $this->session->data['token'] . '&store_id=' . $this->data['selected_store_id'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('module_heading_title') . ' v' . $this->_version = '1.3.2';

		$this->data['button_save']       = $this->language->get('button_save');
		$this->data['button_cancel']     = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_check_file'] = $this->language->get('button_check_file');
		$this->data['button_remove']     = $this->language->get('button_remove');

		$this->data['text_select_all']   = $this->language->get('text_select_all');
		$this->data['text_unselect_all'] = $this->language->get('text_unselect_all');
		$this->data['text_unregistered'] = $this->language->get('text_unregistered');

		//Module types
		$this->data['module_types'] = $this->language->get('module_types');

		//Entry
		$this->data['entry_module_type']    = $this->language->get('entry_module_type');
		$this->data['entry_layouts']        = $this->language->get('entry_layouts');
		$this->data['entry_languages']      = $this->language->get('entry_languages');
		$this->data['entry_category']       = $this->language->get('entry_category');
		$this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$this->data['entry_information']    = $this->language->get('entry_information');
		$this->data['entry_manufacturer']   = $this->language->get('entry_manufacturer');
		$this->data['entry_product']        = $this->language->get('entry_product');
		$this->data['entry_template']       = $this->language->get('entry_template');
		$this->data['entry_template_help']  = $this->language->get('entry_template_help');

		$this->data['text_empty_field']  = $this->language->get('text_empty_field');
		$this->data['text_file_success'] = $this->language->get('text_file_success');
		$this->data['text_file_failed']  = $this->language->get('text_file_failed');
		$this->data['text_file_demo']    = $this->language->get('text_file_demo');

		//Load data from models (product, category, inforamtion)
		$this->load->model('catalog/category');
		$this->load->model('catalog/information');
		$this->load->model('catalog/manufacturer');
		$this->load->model('catalog/product');
		$this->load->model('design/layout');
		$this->load->model('setting/store');
		$this->load->model('sale/customer_group');
		$this->load->model('localisation/language');

		$this->data['categories']    = $this->model_catalog_category->getCategories(0);
		$this->data['informations']  = $this->model_catalog_information->getInformations();
		$this->data['manufacturers'] = $this->model_catalog_manufacturer->getManufacturers();
		$this->data['layouts']       = $this->model_design_layout->getLayouts(array(
			'sort' => 'sort',
			'order' => 'ASC',
			'start' => 0,
			'limit' => 300
		));
		$this->data['languages']     = $this->model_localisation_language->getLanguages();
		$customer_groups             = $this->model_sale_customer_group->getCustomerGroups();

		//add unregistered users
		$this->data['customer_groups'][] = array(
			'name' => $this->language->get('text_unregistered'),
			'customer_group_id' => null
		);

		foreach ($customer_groups as $key => $value) {
			$this->data['customer_groups'][] = $value;
		}
		// end add

		$this->data['stores'][] = array(
			'store_id' => 0,
			'name' => $this->config->get('config_name') . $this->language->get('text_default'),
			'link' => $this->url->link('module/custom_template', 'token=' . $this->session->data['token'] .'&store_id=0', 'SSL')
		);

		$results = $this->model_setting_store->getStores();

		foreach ($results as $result) {
			$this->data['stores'][] = array(
				'store_id' => $result['store_id'],
				'name' => $result['name'],
				'link' => $this->url->link('module/custom_template', 'token=' . $this->session->data['token'] .'&store_id=' . $result['store_id'], 'SSL')
			);
		}

		$modules = array();

		if (isset($this->request->post['custom_template_module'])) {
			$modules = $this->request->post['custom_template_module'];
		} else {
			$setting = $this->model_setting_setting->getSetting('custom_template_module', $this->data['selected_store_id']);
			$modules = isset($setting['custom_template_module']) ? $setting['custom_template_module'] : array();
		}

		$subset = array(
			'categories' => array(),
			'informations' => array(),
			'manufacturers' => array(),
			'customer_groups' => array(),
			'product_manufacturers' => array(),
			'layouts' => array(),
			'products' => '',
			'languages' => array(),
			'product_categories' => array(),
			'parsed_products' => array()
		);

		foreach ($modules as $key => $module) {
			foreach ($subset as $index => $set) {
				if (!isset($modules[$key][$index])) {
					$modules[$key][$index] = $set;
				}
			}
			if (isset($this->request->post['custom_template_module'][$key]['products'])) {
				$products = explode(',', $this->request->post['custom_template_module'][$key]['products']);
			} else {
				$products = explode(',', $module['products']);
			}
			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

				if ($product_info) {
					$modules[$key]['parsed_products'][] = array(
						'product_id' => $product_info['product_id'],
						'name' => $product_info['name']
					);
				}
			}
		}

		$this->data['modules'] = $modules;

		$this->data['check_rights']      = $this->url->link('module/custom_template/check_file', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['template_dir']      = DIR_CATALOG . 'view' . DIRECTORY_SEPARATOR . 'theme' . DIRECTORY_SEPARATOR;
		$this->data['js_entry_template'] = $this->jsAddSlashes(sprintf($this->data['entry_template'], $this->data['template_dir']));

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$this->data['token'] = $this->session->data['token'];

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('module_heading_title'),
			'href' => $this->url->link('module/custom_template', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['action'] = $this->url->link('module/custom_template', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->template = 'module/custom_template.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	private function jsAddSlashes($str)
	{
		$pattern = array(
			"/\\\\/",
			"/\n/",
			"/\r/",
			"/\"/",
			"/\'/",
			"/&/",
			"/</",
			"/>/"
		);
		$replace = array(
			"\\\\\\\\",
			"\\n",
			"\\r",
			"\\\"",
			"\\'",
			"\\x26",
			"\\x3C",
			"\\x3E"
		);
		return preg_replace($pattern, $replace, $str);
	}

	public function check_file()
	{
		$this->load->language('module/custom_template');

		if (isset($this->request->post['path']) && $this->validate()) {

			$config = file_get_contents('../config.php');

			$st = preg_match('/define\(\'DIR_TEMPLATE\'\,.?\'(.*)?\'\)\;/', $config, $match);

			if ($st) {
				$template_dir = $match[1];
			} else {
				$template_dir = '';
			}

			$path = $template_dir . $this->request->post['path'];

			if (is_file($path)) {
				$result['success'] = sprintf($this->language->get('ajax_success'), $path);
			} else {
				$result['warning'] = sprintf($this->language->get('ajax_warning'), $path);
			}

		} else {
			$result['warning'] = $this->language->get('error_permission');
		}

		$this->response->addHeader('Content-type: application/json');
		$this->response->setOutput(json_encode($result));
	}

	private function validate()
	{
		if (!$this->user->hasPermission('modify', 'module/custom_template')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (count($this->request->post, COUNT_RECURSIVE) >= ini_get('max_input_vars')) {
			$this->error['warning'] = $this->language->get('error_max_input_vars');
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

}
