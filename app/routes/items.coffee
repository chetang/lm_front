Liquidibles = require 'app'

Liquidibles.ItemsRoute = Ember.Route.extend(
  model: (params) ->
    filter_params = @controllerFor('index').get('filter_params')
    if jQuery.isEmptyObject(filter_params['item_filter']['from']) and jQuery.isEmptyObject(filter_params['item_filter']['from'])
      Liquidibles.store.findQuery(Liquidibles.Item,{'item_index_within_type_prop_name':this.controllerFor('index').get('currentItemType')})
    else
      Liquidibles.store.findQuery(Liquidibles.Item,filter_params)

  setupController: (controller, item_type) ->
    current_item_type = controller.controllerFor('index').currentItemType
    controller.set "itemType", Liquidibles.store.findQuery(Liquidibles.ItemType,{prop_name:current_item_type})
    controller.set "children", controller.get('itemType').get('children')
    controller.get('itemType').get('parent')
)

Liquidibles.ItemRoute = Ember.Route.extend(
	model: (item) ->
  	return Liquidibles.Item.find(item.item_id)

  setupController: (controller, item) ->
  	controller.set "content", Liquidibles.store.findById Liquidibles.Item,item.id
)