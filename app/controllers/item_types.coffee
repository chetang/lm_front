Liquidibles = require 'app'

Liquidibles.ItemTypesController = Ember.ArrayController.extend(
  content: null
  item_type_tree_array: (->
    if @content && @content.get('isLoaded') 
      b = buildHierarchy @content.toArray()
      jQuery("#demo1").jstree(
        json_data: b
        plugins: ["themes", "json_data", "ui"]
      ).bind "select_node.jstree", (event, data) =>
        attr_object_for_filter = Liquidibles.ItemType.find(data.rslt.obj.attr('id')).get('instance_attributes')
        @set "attr_object_for_filter", attr_object_for_filter    
        @updateFilter()
  ).observes("content.isLoaded")

  updateFilter: ->
    filter_attr = @get('attr_object_for_filter')
    for key of filter_attr
      @render_filter [key,filter_attr[key]]  if filter_attr.hasOwnProperty(key)

  render_filter:(attr) ->
    alert('yah')

)
Liquidibles.ItemTypeController = Ember.ObjectController.extend(soundVolume: 1)
