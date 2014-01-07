# To remove itemType name and '.' from the propertyName, which helps in distinguishing between same properties of different itemType.
# e.g:- "diamond.table_percentage" => "Table Percentage"
Ember.Handlebars.registerHelper "sliceAttr", (obj, type, opts) ->
	str = opts.data.keywords[obj][type]
	str = str.slice(str.indexOf('.')+1).replace('_',' ')
	if typeof (str) is "string" 
	  str.replace /\w\S*/g, (txt) ->
	    txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase()
	else 
		str
		
Ember.Handlebars.registerHelper "isSelected", (context, options) ->
  options.fn this  if Mab.loggedInUser and Mab.loggedInUser.id is @get("user_id")

# To remove prefixed numbers, which helps in sorting and filtering in ElasticSearch
# e.g:- "0004signature_ideal" => "Signature Ideal"
# Regular expression check for first 4 characters to be integer  
Ember.Handlebars.registerHelper "extract", (attr, item, opts) ->
	str = opts.data.keywords['item'].get('instance_attributes')[opts.data.keywords['attr']['prop_name']]
	regex = /[0-9]{4}/
	if typeof (str) is "string" and str.match(regex)
		return @controllerFor('index').toTitleCase(@controllerFor('index').slicedValues(str,regex).replace('_',' '))
	else
		return str