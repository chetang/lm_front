Liquidibles = require 'app'

Liquidibles.IndexController = Ember.ObjectController.extend(
	content: null
	currentItemType: "all"
	contentObserver:(->
		if @content && @content.get('isLoaded')
			@set "currentItemType", @content.objectAt(0).get('prop_name')
	).observes('content.isLoaded')

	slicedValues: (value,regex) ->
		if typeof (value) is "string" and value.match(regex)
			return value.slice(4)
		else
			return value

	toTitleCase: (str) ->
		if typeof (str) is "string" 
		  str.replace /\w\S*/g, (txt) ->
		    txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase()
		else 
			str
)