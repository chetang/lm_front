Liquidibles = require 'app'

Liquidibles.ItemsController = Ember.ArrayController.extend(soundVolume: 1)
Liquidibles.ItemController = Ember.ObjectController.extend(
	content: null
)