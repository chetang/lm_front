attr = DS.attr
Liquidibles.User = DS.Model.extend(
  name: attr('string')
  email: attr('string')
  admin: attr('boolean')
  roles: attr('string')
  state: attr('string')
  updated_at: attr('date')
  created_at: attr('date')
  account: DS.belongsTo("Liquidibles.Account")
  modifiedRoles:(->
    if @get('roles')
      rolesArray = @get('roles').split(',')
      modifiedRolesString = ""
      rolesArray.forEach (role) ->
        modifiedRolesString = modifiedRolesString + role.replace("_", " ") + ", "
      return modifiedRolesString.slice(0,-2)
    else
      return null
  ).property('roles')
)
