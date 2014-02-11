Liquidibles = require 'app'

Liquidibles.AccountsRoute = Ember.Route.extend(
  setupController: (controller, account) ->
    if controller.controllerFor('index').get('content') is null
      controller.controllerFor('index').set('content',Liquidibles.store.findQuery(Liquidibles.ItemType,{current_item_type:true}))
    current_item_type = controller.controllerFor('index').currentItemType
    controller.controllerFor('items').set "itemType", Liquidibles.store.findQuery(Liquidibles.ItemType,{prop_name:current_item_type})
    controller.controllerFor('items').set "children", controller.controllerFor('items').get('itemType').get('children')
    controller.controllerFor('items').get('itemType').get('parent')
    controller.set "content", Liquidibles.Account.find()
)

Liquidibles.AccountRoute = Ember.Route.extend(
	model: (account) ->
  	return Liquidibles.Account.find(account.account_id)

  setupController: (controller, account) ->
  	controller.set "content", Liquidibles.store.findById Liquidibles.Account,account.id
)

Liquidibles.AccountnewRoute = Ember.Route.extend(
  model: ->
    return Liquidibles.Account.createRecord()
  setupController: (controller, model) ->
    controller.set "content", model
  exit: ->
    @_super()
    @get("currentModel.transaction").rollback()
)
Liquidibles.AccounteditRoute = Ember.Route.extend(
  model: (account) ->
    return Liquidibles.Account.find(account.account_id)

  setupController: (controller, account) ->
    controller.set "content", Liquidibles.store.findById Liquidibles.Account,account.id
)