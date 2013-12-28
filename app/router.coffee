Liquidibles = require("app")
Liquidibles.Router.map ->
	@route "index",
		path: "/"
	@resource "items"
	@resource 'item',
		path: '/items/:item_id'
	@resource "item_types"
