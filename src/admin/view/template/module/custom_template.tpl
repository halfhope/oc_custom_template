<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <?php if (count($stores) > 1): ?>
        <select name="store_id" id="store_id" style="width:160px;">
        <?php foreach ($stores as $store_id => $store_data): ?>
          <?php if ($selected_store_id == $store_id): ?>
          <option value="<?php echo $store_data['link'] ?>" selected><?php echo $store_data['name'] ?></option>
          <?php else: ?>
          <option value="<?php echo $store_data['link'] ?>"><?php echo $store_data['name'] ?></option>
          <?php endif ?>
        <?php endforeach ?>
        </select>
        <?php endif ?>
        <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <input type="hidden" name="selected_store_id" value="<?php echo $selected_store_id ?>">
        <table class="form" id="form">
          <?php $module_row = 0; ?>
          <?php foreach ($modules as $module): ?>
          <tr class="module<?php echo $module_row ?>">
          <input class="module<?php echo $module_row ?>" type="hidden" name="custom_template_module[<?php echo $module_row ?>][enabled]" value="0">
          <input class="module<?php echo $module_row ?>" type="hidden" name="custom_template_module[<?php echo $module_row ?>][layout_id]" value="0">
            <td colspan="2"></td>
          </tr>
            <tr class="module<?php echo $module_row ?> general<?php echo $module_row ?>">
              <td><?php echo $entry_module_type ?></td>
              <td>
                <select class="select_type" data-id="<?php echo $module_row ?>" name="custom_template_module[<?php echo $module_row ?>][type]" id="custom_template_module[<?php echo $module_row ?>][type]">
                  <?php foreach ($module_types as $type_id => $type_caption): ?>
                    <?php if ($type_id == $module['type']){ ?>
                      <option value="<?php echo $type_id ?>" selected="selected"><?php echo $type_caption ?></option>  
                    <?php } else { ?>
                      <option value="<?php echo $type_id ?>"><?php echo $type_caption ?></option>
                    <?php } ?>
                  <?php endforeach ?>
                </select>
              </td>
            </tr>
            <tr class="categories module<?php echo $module_row ?>">
              <td><?php echo $entry_category ?></td>
              <td>
                <div class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php foreach ($categories as $category_key => $category_data) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($category_data['category_id'], $module['categories'])) { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][categories][<?php echo $category_data['category_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][categories][<?php echo $category_data['category_id']; ?>]" value="<?php echo $category_data['category_id']; ?>" checked="checked" />
                  <label for="custom_template_module[<?php echo $module_row ?>][categories][<?php echo $category_data['category_id']; ?>]"><?php echo $category_data['name']; ?></label>
                  <?php } else { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][categories][<?php echo $category_data['category_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][categories][<?php echo $category_data['category_id']; ?>]" value="<?php echo $category_data['category_id']; ?>" />
                  <label for="custom_template_module[<?php echo $module_row ?>][categories][<?php echo $category_data['category_id']; ?>]"><?php echo $category_data['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
              </td>
            </tr>
            <tr class="informations module<?php echo $module_row ?>">
              <td><?php echo $entry_information ?></td>
              <td>
                <div class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php foreach ($informations as $information_key => $information_data) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($information_data['information_id'], $module['informations'])) { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][informations][<?php echo $information_data['information_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][informations][<?php echo $information_data['information_id']; ?>]" value="<?php echo $information_data['information_id']; ?>" checked="checked" />
                  <label for="custom_template_module[<?php echo $module_row ?>][informations][<?php echo $information_data['information_id']; ?>]"><?php echo $information_data['title']; ?></label>
                  <?php } else { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][informations][<?php echo $information_data['information_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][informations][<?php echo $information_data['information_id']; ?>]" value="<?php echo $information_data['information_id']; ?>" />
                  <label for="custom_template_module[<?php echo $module_row ?>][informations][<?php echo $information_data['information_id']; ?>]"><?php echo $information_data['title']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
              </td>
            </tr>
            <tr class="manufacturers module<?php echo $module_row ?>">
              <td><?php echo $entry_manufacturer ?></td>
              <td>
                <div class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php foreach ($manufacturers as $manufacturer_key => $manufacturer_data) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($manufacturer_data['manufacturer_id'], $module['manufacturers'])) { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" value="<?php echo $manufacturer_data['manufacturer_id']; ?>" checked="checked" />
                  <label for="custom_template_module[<?php echo $module_row ?>][manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]"><?php echo $manufacturer_data['name']; ?></label>
                  <?php } else { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" value="<?php echo $manufacturer_data['manufacturer_id']; ?>" />
                  <label for="custom_template_module[<?php echo $module_row ?>][manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]"><?php echo $manufacturer_data['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
              </td>
            </tr>
            <tr class="products module<?php echo $module_row ?>">
              <td><?php echo $entry_product ?></td>
              <td><input type="text" class="product_autocomplete" id="autocomplete<?php echo $module_row ?>" data-id="<?php echo $module_row ?>" value="" /></td>
            </tr>
            <tr class="products module<?php echo $module_row ?>">
              <td>&nbsp;</td>
              <td>
                <div id="custom-template-product<?php echo $module_row ?>" class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php if (isset($module['parsed_products'])): ?>
                  <?php foreach ($module['parsed_products'] as $product): ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div id="custom-template-product<?php echo $module_row ?><?php echo $product['product_id']; ?>" class="<?php echo $class; ?>" data-id="<?php echo $module_row ?>"><?php echo $product['name']; ?> <img src="view/image/delete.png" class="delete" data-id="<?php echo $module_row ?>" alt="" />
                    <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                  </div>
                  <?php endforeach ?>
                <?php endif ?>
                </div>
              <input type="hidden" name="custom_template_module[<?php echo $module_row ?>][products]" value="<?php echo $module['products']; ?>" /></td>
              </td>
            </tr>
            <tr class="product_categories module<?php echo $module_row ?>">
              <td><?php echo $entry_category ?></td>
              <td>
                <div class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php foreach ($categories as $category_key => $category_data) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($category_data['category_id'], $module['product_categories'])) { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][product_categories][<?php echo $category_data['category_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][product_categories][<?php echo $category_data['category_id']; ?>]" value="<?php echo $category_data['category_id']; ?>" checked="checked" />
                  <label for="custom_template_module[<?php echo $module_row ?>][product_categories][<?php echo $category_data['category_id']; ?>]"><?php echo $category_data['name']; ?></label>
                  <?php } else { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][product_categories][<?php echo $category_data['category_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][product_categories][<?php echo $category_data['category_id']; ?>]" value="<?php echo $category_data['category_id']; ?>" />
                  <label for="custom_template_module[<?php echo $module_row ?>][product_categories][<?php echo $category_data['category_id']; ?>]"><?php echo $category_data['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
              </td>
            </tr>
            <tr class="product_manufacturers module<?php echo $module_row ?>">
              <td><?php echo $entry_manufacturer ?></td>
              <td>
                <div class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php foreach ($manufacturers as $manufacturer_key => $manufacturer_data) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($manufacturer_data['manufacturer_id'], $module['product_manufacturers'])) { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][product_manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][product_manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" value="<?php echo $manufacturer_data['manufacturer_id']; ?>" checked="checked" />
                  <label for="custom_template_module[<?php echo $module_row ?>][product_manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]"><?php echo $manufacturer_data['name']; ?></label>
                  <?php } else { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][product_manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][product_manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" value="<?php echo $manufacturer_data['manufacturer_id']; ?>" />
                  <label for="custom_template_module[<?php echo $module_row ?>][product_manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]"><?php echo $manufacturer_data['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
              </td>
            </tr>
            <tr class="layouts module<?php echo $module_row ?>">
              <td><?php echo $entry_layouts ?></td>
              <td>
                <div class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php foreach ($layouts as $layout_key => $layout) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($layout['layout_id'], $module['layouts'])) { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][layouts][<?php echo $layout['layout_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][layouts][<?php echo $layout['layout_id']; ?>]" value="<?php echo $layout['layout_id']; ?>" checked="checked" />
                  <label for="custom_template_module[<?php echo $module_row ?>][layouts][<?php echo $layout['layout_id']; ?>]"><?php echo $layout['name']; ?></label>
                  <?php } else { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][layouts][<?php echo $layout['layout_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][layouts][<?php echo $layout['layout_id']; ?>]" value="<?php echo $layout['layout_id']; ?>" />
                  <label for="custom_template_module[<?php echo $module_row ?>][layouts][<?php echo $layout['layout_id']; ?>]"><?php echo $layout['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
              </td>
            </tr>
            <tr class="customer_groups module<?php echo $module_row ?> general<?php echo $module_row ?>">
              <td><?php echo $entry_customer_group ?></td>
              <td>
                <div class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php foreach ($customer_groups as $customer_group_key => $customer_group_data) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($customer_group_data['customer_group_id'], $module['customer_groups'])) { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][customer_groups][<?php echo $customer_group_data['customer_group_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][customer_groups][<?php echo $customer_group_data['customer_group_id']; ?>]" value="<?php echo $customer_group_data['customer_group_id']; ?>" checked="checked" />
                  <label for="custom_template_module[<?php echo $module_row ?>][customer_groups][<?php echo $customer_group_data['customer_group_id']; ?>]"><?php echo $customer_group_data['name']; ?></label>
                  <?php } else { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][customer_groups][<?php echo $customer_group_data['customer_group_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][customer_groups][<?php echo $customer_group_data['customer_group_id']; ?>]" value="<?php echo $customer_group_data['customer_group_id']; ?>" />
                  <label for="custom_template_module[<?php echo $module_row ?>][customer_groups][<?php echo $customer_group_data['customer_group_id']; ?>]"><?php echo $customer_group_data['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
              </td>
            </tr>
            <tr class="languages module<?php echo $module_row ?> general<?php echo $module_row ?>">
              <td><?php echo $entry_languages ?></td>
              <td>
                <div class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php foreach ($languages as $language_key => $language) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($language['language_id'], $module['languages'])) { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][languages][<?php echo $language['language_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][languages][<?php echo $language['language_id']; ?>]" value="<?php echo $language['language_id']; ?>" checked="checked" />
                  <label for="custom_template_module[<?php echo $module_row ?>][languages][<?php echo $language['language_id']; ?>]"><?php echo $language['name']; ?></label>
                  <?php } else { ?>
                  <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][languages][<?php echo $language['language_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][languages][<?php echo $language['language_id']; ?>]" value="<?php echo $language['language_id']; ?>" />
                  <label for="custom_template_module[<?php echo $module_row ?>][languages][<?php echo $language['language_id']; ?>]"><?php echo $language['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
              </td>
            </tr>
            <tr class="template module<?php echo $module_row ?> general<?php echo $module_row ?>">
              <td><?php printf($entry_template, $template_dir) ?></td>
              <td><input type="text" name="custom_template_module[<?php echo $module_row ?>][template_name]" value="<?php echo $module['template_name'] ?>">
              <a onclick="checkfile(<?php echo $module_row ?>);" class="button"><?php echo $button_check_file; ?></a><a style="float:right;" onclick="$('.module<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a>
              </td>
            </tr>
          <?php $module_row++ ?>

          <?php endforeach ?>
          <tr id="add_module">
            <td class="left" colspan="2"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var toc = ['layouts', 'categories', 'products', 'informations', 'manufacturers', 'product_categories', 'product_manufacturers'];
function showActive(value, elem_id){
  $.each(toc, function(index, val) {
    if(value == index){
      $('.general'+elem_id).addClass(val);
      $.each(toc, function(index2, val2) {
        if(index2 !== index){
          $('.general'+elem_id).removeClass(val2);
          $('.'+val2+'.module'+elem_id).hide();
        }
        $('.'+val+'.module'+elem_id).show();
      });
    }
  });
}

$(document).ready(function(){
  $('#store_id').on('change', function(event) {
    event.preventDefault();
    window.location = $(this).val();
  }); 
  init_form();
});

$('#form').submit(function(event){
  $.each($('.select_type'), function(){
    var elem_id = $(this).attr('data-id');
    var elem = $('input[name=\'custom_template_module['+elem_id+'][template_name]\']');
    if (empty($(elem).val())) {
      $(elem).parents('tr').addClass('highlight_error');
      $(elem).focus();
      event.preventDefault();
    }else{
      return;
    }
  });
});
function init_related(){
  $('.product_autocomplete').autocomplete({
    delay: 500,
    source: function(request, response) {
      $.ajax({
        url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item.name,
              value: item.product_id
            }
          }));
        }
      });
    },
    select: function(event, ui) {
      $('#custom-template-product'+$(this).attr('data-id') + ui.item.value).remove();

      $('#custom-template-product'+$(this).attr('data-id')).append('<div id="custom-template-product'+$(this).attr('data-id') + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" class="delete" data-id="'+$(this).attr('data-id')+'" /><input type="hidden" value="' + ui.item.value + '" /></div>');

      $('#custom-template-product'+$(this).attr('data-id')+' div:odd').attr('class', 'odd');
      $('#custom-template-product'+$(this).attr('data-id')+' div:even').attr('class', 'even');

      data = $.map($('#custom-template-product'+$(this).attr('data-id')+' input'), function(element){
        return $(element).attr('value');
      });

      $('input[name=\'custom_template_module['+$(this).attr('data-id')+'][products]\']').attr('value', data.join());

      return false;
    },
    focus: function(event, ui) {
          return false;
      }
  });

  $('img.delete').live('click', function() {
    var elem_id = $(this).attr('data-id');
    $(this).parent().remove();

    $('#custom-template-product'+elem_id+' div:odd').attr('class', 'odd');
    $('#custom-template-product'+elem_id+' div:even').attr('class', 'even');

    data = $.map($('#custom-template-product'+elem_id+' input'), function(element){
      return $(element).attr('value');
    });

    $('input[name=\'custom_template_module['+elem_id+'][products]\']').attr('value', data.join());
  });
}
function empty( mixed_var ) {
  return ( mixed_var === "" || mixed_var === 0   || mixed_var === "0" || mixed_var === null  || mixed_var === false );
}
function init_form(){
  $.each($('.select_type'), function(){
    var elem_id = $(this).attr('data-id');
    $('.template').find('input').on('change keyup paste', function(event){
      if (empty($(this).val())) {
        $(this).parents('tr').addClass('highlight_error');
      }else{
        $(this).parents('tr').removeClass('highlight_error');
      }
    });
    showActive(parseInt($(this).val()), elem_id);
  });
}
$('.select_type').change(function(){
  init_form();
});
init_related();
//--></script>
<script type="text/javascript"><!--
//custom_template_module[<?php echo $module_row ?>][template_name]
function checkfile(elem_id){
  var elem = $('input[name=\'custom_template_module['+elem_id+'][template_name]\']');
  event.preventDefault();
  $.ajax({
    url: 'index.php?route=module/custom_template/check_file&token=<?php echo $token ?>',
    type: 'POST',
    dataType: 'json',
    data: {path: $(elem).val()},
  })
  .success(function(data){
    if (data['success']) {
      $(elem).parent('td').append('<div class="success" style="margin:10px 0px;">'+ data['success'] +'<a class="close"><img src="view/image/delete.png"/></a></div>');
    };

    if (data['warning']) {
      $(elem).parent('td').append('<div class="warning" style="margin:10px 0px;">'+ data['warning'] +'<a class="close"><img src="view/image/delete.png"/></a></div>');
    }
    $('a.close').click(function(event) {
      event.preventDefault();
      $(this).parent('div').remove();
    });
  })
}
//--></script>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {
  html = '';
  html += '<tr class="module'+ module_row +'">';
  html += '<input class="module'+ module_row +'" type="hidden" name="custom_template_module['+ module_row +'][enabled]" value="0">';
  html += '<input class="module'+ module_row +'" type="hidden" name="custom_template_module['+ module_row +'][layout_id]" value="0">';        
  html += '<td colspan="2"></td>';
  html += '</tr>';
  html += '<tr class="module'+ module_row +' general'+ module_row +'">';
  html +='<td><?php echo $entry_module_type ?></td>';
  html +='<td>';
  html +='<select class="select_type" data-id="'+ module_row +'" name="custom_template_module['+ module_row +'][type]" id="custom_template_module['+ module_row +'][type]">';
  <?php foreach ($module_types as $type_id => $type_caption): ?>
  html +='<option value="<?php echo $type_id ?>"><?php echo $type_caption ?></option>';
  <?php endforeach ?>
  html +='</select>';
  html +='</td>';
  html +='</tr>';
  html +='<tr class="categories module'+ module_row +'">';
  html +='<td><?php echo $entry_category ?></td>';
  html +='<td>';
  html +='<div class="scrollbox">';
  <?php $class = 'odd'; ?>
  <?php foreach ($categories as $category_key => $category_data): ?>
    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
    html +='<div class="<?php echo $class; ?>">';
    html +='<input type="checkbox" name="custom_template_module['+ module_row +'][categories][<?php echo $category_data['category_id'] ?>]" id="custom_template_module['+ module_row +'][categories][<?php echo $category_data['category_id'] ?>]" value="<?php echo $category_data['category_id']; ?>" />';
    html +='<label for="custom_template_module['+ module_row +'][categories][<?php echo $category_data['category_id'] ?>]"><?php echo addslashes($category_data['name']); ?></label>';
    html +='</div>';
  <?php endforeach ?>
  html +='</div>';
  html +='<a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
  html +='</td>';
  html +='</tr>'
  html +='<tr class="informations module'+ module_row +'">';
  html +='<td><?php echo $entry_information ?></td>';
  html +='<td>';
  html +='<div class="scrollbox">';
  <?php $class = 'odd'; ?>
  <?php foreach ($informations as $information_key => $information_data): ?>
    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
    html +='<div class="<?php echo $class; ?>">';
    html +='<input type="checkbox" name="custom_template_module['+ module_row +'][informations][<?php echo $information_data['information_id'] ?>]" id="custom_template_module['+ module_row +'][informations][<?php echo $information_data['information_id'] ?>]" value="<?php echo $information_data['information_id']; ?>" />';
    html +='<label for="custom_template_module['+ module_row +'][informations][<?php echo $information_data['information_id'] ?>]"><?php echo addslashes($information_data['title']); ?></label>';
    html +='</div>';
  <?php endforeach ?>
  html +='</div>';
  html +='<a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
  html +='</td>';
  html +='</tr>';
  html +='<tr class="manufacturers module'+ module_row +'">';
  html +='<td><?php echo $entry_manufacturer ?></td>';
  html +='<td>';
  html +='<div class="scrollbox">';
  <?php $class = 'odd'; ?>
  <?php foreach ($manufacturers as $manufacturer_key => $manufacturer_data) : ?>
    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
    html +='<div class="<?php echo $class; ?>">';
    html +='<input type="checkbox" name="custom_template_module['+ module_row +'][manufacturers][<?php echo $manufacturer_data['manufacturer_id'] ?>]" id="custom_template_module['+ module_row +'][manufacturers][<?php echo $manufacturer_data['manufacturer_id'] ?>]" value="<?php echo $manufacturer_data['manufacturer_id']; ?>" />';
    html +='<label for="custom_template_module['+ module_row +'][manufacturers][<?php echo $manufacturer_data['manufacturer_id'] ?>]"><?php echo addslashes($manufacturer_data['name']); ?></label>';
    html +='</div>';
  <?php endforeach ?>
  html +='</div>';
  html +='<a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
  html +='</td>';
  html +='</tr>';
  html +='<tr class="products module'+ module_row +'">';
  html +='<td><?php echo $entry_product ?></td>';
  html +='<td><input type="text" class="product_autocomplete" id="autocomplete'+ module_row +'" data-id="'+ module_row +'" value="" /></td>';
  html +='</tr>';
  html +='<tr class="products module'+ module_row +'">';
  html +='<td>&nbsp;</td>';
  html +='<td>';
  html +='<div id="custom-template-product'+ module_row +'" class="scrollbox"></div>';
  html +='<input type="hidden" name="custom_template_module['+ module_row +'][products]" value="" />';
  html +='</td>';
  html +='</tr>';
  html +='<tr class="product_categories module'+ module_row +'">';
  html +='<td><?php echo $entry_category ?></td>';
  html +='<td>';
  html +='<div class="scrollbox">';
  <?php $class = 'odd'; ?>
  <?php foreach ($categories as $category_key => $category_data) { ?>
    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
    html +='<div class="<?php echo $class; ?>">';
    html +='<input type="checkbox" name="custom_template_module['+ module_row +'][product_categories][<?php echo $category_data['category_id']; ?>]" id="custom_template_module['+ module_row +'][product_categories][<?php echo $category_data['category_id']; ?>]" value="<?php echo $category_data['category_id']; ?>" />';
    html +='<label for="custom_template_module['+ module_row +'][product_categories][<?php echo $category_data['category_id']; ?>]"><?php echo addslashes($category_data['name']); ?></label>';
    html +='</div>';
  <?php } ?>
  html +='</div>';
  html +='<a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
  html +='</td>';
  html +='</tr>';

  html +='<tr class="product_manufacturers module'+ module_row +'">';
  html +='<td><?php echo $entry_manufacturer ?></td>';
  html +='<td>';
  html +='<div class="scrollbox">';
  <?php $class = 'odd'; ?>
  <?php foreach ($manufacturers as $manufacturer_key => $manufacturer_data) : ?>
    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
    html +='<div class="<?php echo $class; ?>">';
    html +='<input type="checkbox" name="custom_template_module['+ module_row +'][product_manufacturers][<?php echo $manufacturer_data['manufacturer_id'] ?>]" id="custom_template_module['+ module_row +'][product_manufacturers][<?php echo $manufacturer_data['manufacturer_id'] ?>]" value="<?php echo $manufacturer_data['manufacturer_id']; ?>" />';
    html +='<label for="custom_template_module['+ module_row +'][product_manufacturers][<?php echo $manufacturer_data['manufacturer_id'] ?>]"><?php echo addslashes($manufacturer_data['name']); ?></label>';
    html +='</div>';
  <?php endforeach ?>
  html +='</div>';
  html +='<a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
  html +='</td>';
  html +='</tr>';

  html +='<tr class="layouts module'+ module_row +'">';
  html +='<td><?php echo $entry_layouts ?></td>';
  html +='<td>';
  html +='<div class="scrollbox">';
  <?php $class = 'odd'; ?>
  <?php foreach ($layouts as $layout_key => $layout_data) : ?>
    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
    html +='<div class="<?php echo $class; ?>">';
    html +='<input type="checkbox" name="custom_template_module['+ module_row +'][layouts][<?php echo $layout_data['layout_id'] ?>]" id="custom_template_module['+ module_row +'][layouts][<?php echo $layout_data['layout_id'] ?>]" value="<?php echo $layout_data['layout_id']; ?>" />';
    html +='<label for="custom_template_module['+ module_row +'][layouts][<?php echo $layout_data['layout_id'] ?>]"><?php echo addslashes($layout_data['name']); ?></label>';
    html +='</div>';
  <?php endforeach ?>
  html +='</div>';
  html +='<a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
  html +='</td>';
  html +='</tr>';

  html +='<tr class="customer_groups module'+ module_row +' general'+ module_row +'">';
  html +='<td><?php echo $entry_customer_group ?></td>';
  html +='<td>';
  html +='<div class="scrollbox">';
  <?php $class = 'odd'; ?>
  <?php foreach ($customer_groups as $customer_group_key => $customer_group_data) { ?>
  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
  html +='<div class="<?php echo $class; ?>">';
  html +='<input type="checkbox" name="custom_template_module['+ module_row +'][customer_groups][<?php echo $customer_group_data['customer_group_id']; ?>]" id="custom_template_module['+ module_row +'][customer_groups][<?php echo $customer_group_data['customer_group_id']; ?>]" value="<?php echo $customer_group_data['customer_group_id']; ?>" />';
  html +='<label for="custom_template_module['+ module_row +'][customer_groups][<?php echo $customer_group_data['customer_group_id']; ?>]"><?php echo $customer_group_data['name']; ?></label>';
  html +='</div>';
  <?php } ?>
  html +='</div>';
  html +='<a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
  html +='</td>';
  html +='</tr>';
  	
  html +='<tr class="languages module'+ module_row +' general'+ module_row +'">';
  html +='<td><?php echo $entry_languages ?></td>';
  html +='<td>';
  html +='<div class="scrollbox">';
  <?php $class = 'odd'; ?>
  <?php foreach ($languages as $language_key => $language_data) { ?>
  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
  html +='<div class="<?php echo $class; ?>">';
  html +='<input type="checkbox" name="custom_template_module['+ module_row +'][languages][<?php echo $language_data['language_id']; ?>]" id="custom_template_module['+ module_row +'][languages][<?php echo $language_data['language_id']; ?>]" value="<?php echo $language_data['language_id']; ?>" />';
  html +='<label for="custom_template_module['+ module_row +'][languages][<?php echo $language_data['language_id']; ?>]"><?php echo $language_data['name']; ?></label>';
  html +='</div>';
  <?php } ?>
  html +='</div>';
  html +='<a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
  html +='</td>';
  html +='</tr>';

  html +='<tr class="template module'+ module_row +' general'+ module_row +'">';
  html +='<td><?php echo $js_entry_template ?></td>';
  html +='<td><input type="text" name="custom_template_module['+ module_row +'][template_name]">';
  html +='<a onclick="checkfile('+ module_row +');" class="button"><?php echo $button_check_file; ?></a>';
  html +='<a style="float:right;" onclick="$(\'.module'+ module_row +'\').remove();" class="button"><?php echo $button_remove; ?></a>';
  html +='</td>';
  html +='</tr>';
  
	$('#add_module').before(html);

init_form();
init_related();
$('.select_type').change(function(){
  init_form();
});
module_row++;
}
//--></script> 
<style>
.categories{
  background-color: #fff4d9;
  border-left: 5px solid #ffd166;
}
.informations{
  background-color: #f4ffed;
  border-left: 5px solid #b1db95;
}
.manufacturers{
  background-color: #ebfcff;
  border-left: 5px solid #4d90fe;
}
.products{
  background-color: #f7f2ff;
  border-left: 5px solid #c4a0ff;
}
.product_categories{
  background-color: #ffeded;
  border-left: 5px solid #ffcece;
}
.product_manufacturers{
  background-color: #CFFFD7;
  border-left: 5px solid #4D814A;
}
.layouts{
  background-color: #CFFFD7;
  border-left: 5px solid #4D814A;
}
.highlight_error{
  border-left: 5px solid #CE4C38;
  background: #ffc9c9;
}
a.close{
  float: right;
}
select{
  width: 350px;
}
input[type="text"]{
  width: 340px;
}
</style>
<?php echo $footer; ?>