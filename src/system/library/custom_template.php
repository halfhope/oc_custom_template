<?php
/**
 * @author Shashakhmetov Talgat <talgatks@gmail.com>
 */
final class CustomTemplate
{
	private $layout_id;

	public function __construct($registry)
	{
		$this->registry = $registry;
		$this->config   = $registry->get('config');
		$this->customer = $registry->get('customer');
		$this->request  = $registry->get('request');
		$this->load     = $registry->get('load');
	}

	private function isEmpty($data, $index)
	{
		return !isset($data[$index]) || empty($data[$index]);
	}

	public function filterCommon($module, $customer_group_id)
	{
		return $this->filterCustomerGroups($module, $customer_group_id) && $this->filterLanguages($module);
	}

	// General checks
	public function filterCustomerGroups($module, $customer_group_id)
	{
		return $this->isEmpty($module, 'customer_groups') || (isset($module['customer_groups']) && in_array($customer_group_id, $module['customer_groups']));
	}

	public function filterLanguages($module)
	{
		return $this->isEmpty($module, 'languages') || (isset($module['languages']) && in_array($this->config->get('config_language_id'), $module['languages']));
	}

	// 0
	public function filterLayouts($module)
	{
		if (is_null($this->layout_id)) {
			$layout_id = 0;

			if (!$this->isEmpty($module, 'layouts')) {

				if (isset($this->request->get['route'])) {
					$route = (string) $this->request->get['route'];
				} else {
					$route = 'common/home';
				}

				if ($route == 'product/category' && isset($this->request->get['path'])) {
					$path = explode('_', (string) $this->request->get['path']);
					$this->load->model('catalog/category');
					$layout_id = $this->registry->get('model_catalog_category')->getCategoryLayoutId(end($path));
				}
				if ($route == 'product/product' && isset($this->request->get['product_id'])) {
					$this->load->model('catalog/product');
					$layout_id = $this->registry->get('model_catalog_product')->getProductLayoutId($this->request->get['product_id']);
				}
				if ($route == 'information/information' && isset($this->request->get['information_id'])) {
					$this->load->model('catalog/information');
					$layout_id = $this->registry->get('model_catalog_information')->getInformationLayoutId($this->request->get['information_id']);
				}
				if (!$layout_id) {
					$this->load->model('design/layout');
					$layout_id = $this->registry->get('model_design_layout')->getLayout($route);
				}
				if (!$layout_id) {
					$layout_id = $this->config->get('config_layout_id');
				}
			}
			$this->layout_id = $layout_id;
		}

		return !$this->isEmpty($module, 'layouts') && in_array($this->layout_id, $module['layouts']);
	}

	// 1
	public function filterCategories($module, $category_id)
	{
		return !$this->isEmpty($module, 'categories') && in_array($category_id, $module['categories']);
	}

	// 2
	public function filterProducts($module, $product_id)
	{
		return !$this->isEmpty($module, 'products') && in_array($product_id, explode(',', $module['products']));
	}

	// 3
	public function filterInformations($module, $information_id)
	{
		return !$this->isEmpty($module, 'informations') && in_array($information_id, $module['informations']);
	}

	// 4
	public function filterManufacturers($module, $manufacturer_id)
	{
		return !$this->isEmpty($module, 'manufacturers') && in_array($manufacturer_id, $module['manufacturers']);
	}

	// 5
	public function filterProductCategories($module, $category_id)
	{
		if (!$this->isEmpty($module, 'product_categories')) {
			$category_id = explode('_', $this->request->get['path']);
			$category_id = (int) end($category_id);
			if (in_array($category_id, $module['product_categories'])) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	// 6
	public function filterProductManufacturers($module, $manufacturer_id)
	{
		return !$this->isEmpty($module, 'product_manufacturers') && in_array($manufacturer_id, $module['product_manufacturers']);
	}

}
