Ember.Handlebars.registerHelper "sliceAttr", (obj, opts) ->
	return opts.data.keywords[obj].slice(4).toUpperCase().replace('_',' ')

Ember.Handlebars.registerHelper "isSelected", (context, options) ->
  options.fn this  if Mab.loggedInUser and Mab.loggedInUser.id is @get("user_id")
