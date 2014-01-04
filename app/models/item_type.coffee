prefixAllowedValue = (index) ->
  if index < 10
    return "000" + index
  else if index < 100
    return "00" + index
  else if index < 1000
    return "0" + index
  else if index < 10000
    return index

attr = DS.attr
Liquidibles.ItemType = DS.Model.extend(
  prop_name: attr('string')
  description: attr('string')
  type: attr('string')
  lft: attr('number')
  depth: attr('number')
  rgt: attr('number')
  instance_attributes: attr('hash')
  children: DS.hasMany("Liquidibles.ItemType")
  parent: DS.belongsTo("Liquidibles.ItemType")
  modifiedInstanceAttributes:(->
  	obj = @get "instance_attributes"
  	for prop of obj
  		if obj.hasOwnProperty(prop)
    		allowedValues = obj[prop]['allowed_values']
      if allowedValues and allowedValues.length > 0
    			i = 0
  					while i < allowedValues.length
  					  allowedValues[i] = prefixAllowedValue(i) + allowedValues[i]
  					  i++  			

	  return obj
  ).property('instance_attributes')
)