Liquidibles = require 'app'

Liquidibles.ItemsController = Ember.ArrayController.extend(soundVolume: 1)
Liquidibles.ItemController = Ember.ObjectController.extend(
  content: null
  key_arrays: (->
    attr_hash = @content.get("instance_attributes")
    key_arrays = []
    for item_attr of attr_hash
      key_arrays.push item_attr.slice(item_attr.indexOf('.')+1).toUpperCase()
    return key_arrays
  ).property("content.isLoaded")

  value_arrays: (->
    attr_hash = @content.get("instance_attributes")
    value_arrays = []
    regex = /[0-9]{4}/
    for item_attr of attr_hash
      item_attr_value = attr_hash[item_attr]
      item_attr_value = @controllerFor('index').slicedValues(item_attr_value,regex)
      value_arrays.push item_attr_value
    return value_arrays
  ).property("content.isLoaded")
)
