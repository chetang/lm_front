attr = DS.attr
Liquidibles.Want = DS.Model.extend(
  title: attr('string')
  state: attr('string')
  max_wanted: attr('number')
  budget: attr('string')
  updated_at: attr('date')
  created_at: attr('date')
  account: DS.belongsTo("Liquidibles.Account")
)
