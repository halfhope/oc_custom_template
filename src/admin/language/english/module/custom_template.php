<?php
/**
 * @author Shashakhmetov Talgat <talgatks@gmail.com>
 */

// Heading
$_['heading_title']        = 'Custom templates';
$_['module_heading_title'] = 'Custom templates';
$_['text_module']          = 'Modules';
$_['text_unregistered']    = 'Unregistered';

//Module Types
$_['module_types'] = array(
	0 => 'Layout template',
	1 => 'Category template',
	2 => 'Product template',
	3 => 'Information template',
	4 => 'Manufacturer template',
	5 => 'Product template of the selected category (only with SEO URL)',
	6 => 'Product template of the selected manufacturer'
);

//Entry
$_['entry_module_type']    = 'Template type:';
$_['entry_category']       = 'Categories:';
$_['entry_languages']      = 'Languages: <span class="help">Left empty if not used</span>';
$_['entry_layouts']        = 'Layouts:';
$_['entry_customer_group'] = 'Customer groups: <span class="help">Left empty if not used</span>';
$_['entry_information']    = 'Information pages:';
$_['entry_manufacturer']   = 'Manufacturers:';
$_['entry_product']        = 'Products (autocomplete):';
$_['entry_template']       = 'Template file:';
$_['entry_template_help']  = 'The path is relative to the theme directory. E.g. default/template/product/category.tpl';

//Buttons
$_['button_check_file']    = 'Check path';
$_['button_add_module']    = 'Add replacement';

//Success
$_['text_success'] = 'Success: You have modified module featured!';

// Error
$_['error_permission']     = 'Warning: You do not have permission to modify module сustom templates!';
$_['error_max_input_vars'] = 'Limit is exceeded <a href="http://devjew.com/2014/05/16/unknown-input-variables-exceeded-1000-opencart/" target="_blank">max_input_vars</a>';
$_['text_empty_field']     = 'Заполните обязательные поля!';

//ajax messages
$_['ajax_success'] = '%s success found';
$_['ajax_warning'] = '%s not found';
?>