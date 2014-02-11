Liquidibles = require 'app'

Liquidibles.UsersController = Ember.ArrayController.extend(
  needs: ['index','items']
  content: null
)
Liquidibles.UserController = Ember.ObjectController.extend(
  needs: ['index','items']
)
Liquidibles.AccountsController = Ember.ArrayController.extend(
  needs: ['index','items']
  content: null
)
Liquidibles.AccountController = Ember.ObjectController.extend(
  needs: ['index','items']
)
Liquidibles.AccountnewController = Ember.ObjectController.extend(
  needs: ['index','items']
)
Liquidibles.AccounteditController = Ember.ObjectController.extend(
  needs: ['index','items']
)
Liquidibles.WantsController = Ember.ArrayController.extend(
  needs: ['index','items']
  content: null
)
Liquidibles.WantController = Ember.ObjectController.extend(
  needs: ['index','items']
)
