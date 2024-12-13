<?php
/**
 * @author Shashakhmetov Talgat <talgatks@gmail.com>
 */

// Heading
$_['heading_title']        = 'Персонализованные шаблоны';
$_['module_heading_title'] = 'Персонализованные шаблоны';
$_['text_module']          = 'Модули';
$_['text_unregistered']    = 'Незарегистрированные';

//Module Types
$_['module_types'] = array(
	0 => 'Шаблон для схем',
	1 => 'Шаблон для категорий',
	2 => 'Шаблон для товаров',
	3 => 'Шаблон для информационных страниц',
	4 => 'Шаблон для производителя',
	5 => 'Шаблон для товаров из определенной категории (Только с SEO URL)',
	6 => 'Шаблон для товаров определенного производителя',
	7 => 'Шаблон для товаров определенного производителя и категории'
);

//Entry
$_['entry_module_type']    = 'Тип шаблона:';
$_['entry_category']       = 'Категориии:';
$_['entry_languages']      = 'Языки: <span class="help">Оставьте пустым, если не используется</span>';
$_['entry_layouts']        = 'Схемы:';
$_['entry_customer_group'] = 'Группы пользователей: <span class="help">Оставьте пустым, если не используется</span>';
$_['entry_information']    = 'Информационные страницы:';
$_['entry_manufacturer']   = 'Производители:';
$_['entry_product']        = 'Товары (автозаполнение):';
$_['entry_template']       = 'Файл нового шаблона:';
$_['entry_template_help']  = 'Путь задается относительно директории шаблона. Например, default/template/product/category.tpl';

//Buttons
$_['button_check_file'] = 'Проверить путь';
$_['button_add_module'] = 'Добавить замену';

//Success
$_['text_success'] = 'Настройки модуля успешно сохранены.';

// Error
$_['error_permission']     = 'У вас нет прав для изменения модуля, обратитесь к администратору!';
$_['error_max_input_vars'] = 'Превышен лимит <a href="http://devjew.com/2014/05/16/unknown-input-variables-exceeded-1000-opencart/" target="_blank">max_input_vars</a>';
$_['text_empty_field']     = 'Заполните обязательные поля!';

//ajax messages
$_['ajax_success'] = 'Файл %s найден';
$_['ajax_warning'] = 'Файл %s не найден';
?>