attr = DS.attr
Liquidibles.Account = DS.Model.extend(
  name: attr('string')
  state: attr('string')
  updated_at: attr('date')
  created_at: attr('date')
  users: DS.hasMany("Liquidibles.User")
  items: DS.hasMany("Liquidibles.Item")
)
