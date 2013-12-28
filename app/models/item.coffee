attr = DS.attr
Liquidibles.Item = DS.Model.extend(
  name: attr('string')
  account_id: attr('number')
  self_and_ancestors: attr('array')
  item_type_prop_name: attr('string')
  item_type_id: attr('number')
  item_type_description: attr('string')
  instance_attributes: attr('hash')
)
