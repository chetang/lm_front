Liquidibles = require 'app'

Liquidibles.ItemsRoute = Ember.Route.extend(model: (params) ->
  return Liquidibles.Item.find()
)

Liquidibles.ItemRoute = Ember.Route.extend(
  setupController: (controller, item) ->
  	controller.set "content", Liquidibles.store.findById Liquidibles.Item,item.id
)