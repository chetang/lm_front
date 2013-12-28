Liquidibles = require 'app'

Liquidibles.ItemsController = Ember.ArrayController.extend(soundVolume: 1)
Liquidibles.ItemController = Ember.ObjectController.extend(
  content: null
  item_attr_array: (->
    attr_hash = @content.get("instance_attributes")
    attr_arrays = []
    regex = /[0-9]{4}/
    for item_attr of attr_hash
      item_attr_value = attr_hash[item_attr]
      item_attr_value = item_attr_value.slice(4)  if typeof (item_attr_value) is "string" and item_attr_value.match(regex)
      attr_array = [item_attr, item_attr_value]
      attr_arrays.push attr_array
    return attr_arrays
  ).property("content.isLoaded")
)
