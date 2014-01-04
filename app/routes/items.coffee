Liquidibles = require 'app'

Liquidibles.ItemsRoute = Ember.Route.extend(model: (params) ->
	unless @controllerFor('items').get('content')
  		return Liquidibles.store.findQuery(Liquidibles.Item,{item_index_within_type_prop_name:this.controllerFor('index').currentItemType})
)

Liquidibles.ItemRoute = Ember.Route.extend(
	model: (item) ->
  	return Liquidibles.Item.find(item.item_id)

  setupController: (controller, item) ->
  	controller.set "content", Liquidibles.store.findById Liquidibles.Item,item.id
)