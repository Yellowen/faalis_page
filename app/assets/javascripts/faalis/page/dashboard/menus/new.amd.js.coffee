define "faalis/page/dashboard/menus/new", ['bootstrap-treeview/bootstrap-treeview', 'icon-selector/icon-selector'], (bt, icon_selector) ->

  $form        = $('.form.details')
  $main_form   = $('#new_menu')
  $tree        = null

  try
    data = JSON.parse($("#menu-data").val())
  catch error
    if error instanceof SyntaxError
      data = [{ text: 'Chane me', icon: 'fa fa-user', selectable: true, nodes: [] }]
    else
      thow error

  save_json = ->
    json  = $tree.toJSON(0)
    title = $tree.getNode(0).text

    $("#menu-data").val(json)
    $("#menu-title").val(title)

  node_selected = (event, data) ->
    $form.attr('data-current', data.nodeId)

    $form.find('#text').val(data.text)
    $form.find('#icon').val(data.icon)
    $form.find('#href').val(data.href)
    $form.find('#text').focus()

  add_node = ->
    parent_id = parseInt($form.attr('data-current'))

    new_node  = { text: '' }
    $tree.addNode(parent_id, new_node)
    $tree.expandNode(parent_id)
    save_json()

  save_node = ->
    node_id = parseInt($form.attr('data-current'))
    node    = $tree.getNode(node_id)

    node.text = $form.find('#text').val()
    node.icon = $form.find('#icon').val()
    node.href = $form.find('#href').val()
    $tree.render()
    save_json()

  delete_node = ->
    node_id = parseInt($form.attr('data-current'))
    $tree.removeNode(node_id)
    save_json()

  initialize = ->

    console.log('Initializing menu new interface')

    $('#tree').treeview {
      data: data
      levels: 5,
      onNodeSelected: node_selected
    }

    $tree = $('#tree').data('treeview')

    $('.add_empty_item').on('click', add_node)
    $('#icon-btn').iconSelector({input: '#icon'});
    $('.save-item').on('click', save_node)
    $('.remove-item').on('click', delete_node)

  $ ->
    initialize()

  return this
