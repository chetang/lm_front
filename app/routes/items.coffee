Liquidibles = require 'app'

Liquidibles.ItemsRoute = Ember.Route.extend(
	model: (params) ->
		filter_params = @controllerFor('index').get('filter_params')
		return Liquidibles.store.findQuery(Liquidibles.Item,filter_params)

	setupController: (controller, item_type) ->
  	current_item_type = controller.controllerFor('index').currentItemType
  	controller.set "itemType", Liquidibles.store.findQuery(Liquidibles.ItemType,{prop_name:current_item_type})
  	controller.set "children", controller.get('itemType').get('children')
)

Liquidibles.ItemRoute = Ember.Route.extend(
	model: (item) ->
  	return Liquidibles.Item.find(item.item_id)

  setupController: (controller, item) ->
  	controller.set "content", Liquidibles.store.findById Liquidibles.Item,item.id
)