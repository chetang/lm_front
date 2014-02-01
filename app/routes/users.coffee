Liquidibles = require 'app'

Liquidibles.UsersRoute = Ember.Route.extend(
  setupController: (controller, user) ->
    if controller.controllerFor('index').get('content') is null
      controller.controllerFor('index').set('content',Liquidibles.store.findQuery(Liquidibles.ItemType,{current_item_type:true}))
    current_item_type = controller.controllerFor('index').currentItemType
    controller.controllerFor('items').set "itemType", Liquidibles.store.findQuery(Liquidibles.ItemType,{prop_name:current_item_type})
    controller.controllerFor('items').set "children", controller.controllerFor('items').get('itemType').get('children')
    controller.controllerFor('items').get('itemType').get('parent')
    controller.set "content", Liquidibles.User.find()
)

Liquidibles.UserRoute = Ember.Route.extend(
	model: (user) ->
  	return Liquidibles.User.find(user.user_id)

  setupController: (controller, user) ->
  	controller.set "content", Liquidibles.store.findById Liquidibles.User,user.id
)