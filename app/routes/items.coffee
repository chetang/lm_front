Liquidibles = require 'app'

Liquidibles.ItemsRoute = Ember.Route.extend(model: (params) ->
	filter_params = @controllerFor('index').get('filter_params')
	return Liquidibles.store.findQuery(Liquidibles.Item,filter_params)
)

Liquidibles.ItemRoute = Ember.Route.extend(
	model: (item) ->
  	return Liquidibles.Item.find(item.item_id)

  setupController: (controller, item) ->
  	controller.set "content", Liquidibles.store.findById Liquidibles.Item,item.id
)