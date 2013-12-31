Liquidibles = require 'app'

Liquidibles.IndexController = Ember.ObjectController.extend(
	slicedValues: (value,regex) ->
		if typeof (value) is "string" and value.match(regex)
			return value.slice(4)
		else
			return value

)