Liquidibles = require 'app'

Liquidibles.ItemTypesRoute = Ember.Route.extend(
  setupController: (controller, item_type) ->
  	current_item_type = controller.controllerFor('index').currentItemType
  	controller.set "content", Liquidibles.store.findQuery(Liquidibles.ItemType,{prop_name:current_item_type})
  	controller.set "children", controller.get('content').get('children')
)

Liquidibles.ItemTypeRoute = Ember.Route.extend(
	model: (item_type) ->
  	return Liquidibles.ItemType.find(item_type.item_type_id)

  setupController: (controller, item_type) ->
  	controller.set "content", Liquidibles.store.findById Liquidibles.ItemType.item_type.id
)