Liquidibles = require 'app'

Liquidibles.WantsRoute = Ember.Route.extend(
  setupController: (controller, want) ->
    if controller.controllerFor('index').get('content') is null
      controller.controllerFor('index').set('content',Liquidibles.store.findQuery(Liquidibles.ItemType,{current_item_type:true}))
    current_item_type = controller.controllerFor('index').currentItemType
    controller.controllerFor('items').set "itemType", Liquidibles.store.findQuery(Liquidibles.ItemType,{prop_name:current_item_type})
    controller.controllerFor('items').set "children", controller.controllerFor('items').get('itemType').get('children')
    controller.controllerFor('items').get('itemType').get('parent')
    controller.set "content", Liquidibles.Want.find()
)

Liquidibles.WantRoute = Ember.Route.extend(
	model: (want) ->
  	return Liquidibles.Want.find(want.want_id)

  setupController: (controller, want) ->
  	controller.set "content", Liquidibles.store.findById Liquidibles.Want,want.id
)