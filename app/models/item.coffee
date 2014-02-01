attr = DS.attr
Liquidibles.Item = DS.Model.extend(
  name: attr('string')
  account: DS.belongsTo("Liquidibles.Account")
  self_and_ancestors: attr('array')
  item_type_prop_name: attr('string')
  item_type_id: attr('number')
  item_type_description: attr('string')
  instance_attributes: attr('hash')
  modified_instance_attributes:(->
  	obj = @get "instance_attributes"
  	if obj
  		for prop of obj
  			if obj.hasOwnProperty(prop)
  				prop = prop.replace('.','_')
  	return obj
  ).property('instance_attributes')
)
