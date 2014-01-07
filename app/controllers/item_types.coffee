Liquidibles = require 'app'

Liquidibles.ItemTypesController = Ember.ArrayController.extend(
  needs: ['index']
  itemType: null
)
Liquidibles.ItemTypeController = Ember.ObjectController.extend(
  needs: ['index']
)
