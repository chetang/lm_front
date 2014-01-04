Liquidibles = require 'app'

Liquidibles.IndexRoute = Ember.Route.extend(
	setupController: (controller) ->
		controller.set "content", Liquidibles.store.findQuery(Liquidibles.ItemType,{current_item_type:true})
  # Set the IndexController's `title`
  
)