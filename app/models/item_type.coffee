attr = DS.attr
Liquidibles.ItemType = DS.Model.extend(
  prop_name: attr('string')
  parent_id: attr('number')
  description: attr('string')
  type: attr('string')
  lft: attr('number')
  depth: attr('number')
  rgt: attr('number')
  instance_attributes: attr('hash')
)
