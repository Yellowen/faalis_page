define "faalis/page/dashboard/menus/new", ['bootstrap-treeview/bootstrap-treeview', 'icon-selector/icon-selector'], (bt, icon_selector) ->
  console.log('Initializing menu new interface')

  $form        = $('.form.details')
  $parent_form = $('form.parent.form')
  $main_form   = $('form.new_menu')

  data = [{
    text: 'Chane me',
    icon: 'fa fa-user',
    selectedIcon: 'fa fa-group',
    selectable: true,
    nodes: [],
  },
  {
    text: 'Chane me',
    icon: 'fa fa-user',
    href: '#asd'
    selectedIcon: 'fa fa-group',
    selectable: true,
    nodes: [],
  }]

  node_selected = (event, data) ->
    $form.attr('data-current', data.nodeId)
    $parent_form.attr('data-id', data.nodeId)

    $parent_form.find('#parent_text').val(data.text)
    $parent_form.find('#parent_icon').val(data.icon)
    $parent_form.find('#parent_href').val(data.href)

  add_node = ->
    parent_id = $form.data('current')

    new_node  = Object.fromQueryString($form.serialize())
    $tree.addNode(parent_id, new_node)

  $('#tree').treeview {
    data: data
    onNodeSelected: node_selected
  }
  $tree = $('#tree').data('treeview')

  $('.add_button').on('click', add_node)
  $("#icon-btn").iconSelector({input: '#icon'});
  $("#parent-icon-btn").iconSelector({input: '#parent_icon'});

  return $tree
