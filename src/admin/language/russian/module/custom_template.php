<?php
/**
 * @author Shashakhmetov Talgat <talgatks@gmail.com>
 */

// Heading
$_['heading_title']        = 'Персонализованные шаблоны <span style="float:right;color:#ddd;">[shtt.blog]</span>';
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
    5 => 'Шаблон для всех товаров из определенной категории (Только с SEO URL)',
    6 => 'Шаблон для всех товаров определенного производителя'
);

//Entry
$_['entry_module_type']    = 'Тип шаблона:';
$_['entry_category']       = 'Категориии: <span class="help">Если оставить пустым, то будет выбран шаблон для всех категорий.</span>';
$_['entry_stores']         = 'Магазины: <span class="help">Если оставить пустым, то будет выбран шаблон для всех магазинов.</span>';
$_['entry_languages']      = 'Языки: <span class="help">Если оставить пустым, то будет выбран шаблон для всех языков.</span>';
$_['entry_layouts']        = 'Схемы:';
$_['entry_customer_group'] = 'Группы пользователей: <span class="help">Если оставить пустым, то будет выбран шаблон для всех групп пользователей.</span>';
$_['entry_information']    = 'Информационные страницы: <span class="help">Если оставить пустым, то будет выбран шаблон для всех информационных страниц.</span>';
$_['entry_manufacturer']   = 'Производители: <span class="help">Если оставить пустым, то будет выбран шаблон для всех производителей.</span>';
$_['entry_product']        = 'Товары (автозаполнение): <span class="help">Если оставить пустым, то будет выбран шаблон для всех товаров.</span>';
$_['entry_template']       = 'Файл нового шаблона: <span class="help"> Путь задается относительно директории:%s <br>Например, default/template/product/category.tpl</span>';

//Buttons
$_['button_check_file'] = 'Проверить путь';
$_['button_add_module'] = 'Добавить модуль';

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