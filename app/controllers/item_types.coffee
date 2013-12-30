Liquidibles = require 'app'

Liquidibles.ItemTypesController = Ember.ArrayController.extend(
  content: null
  mergedFilterAttr: {}
  itemTypeTreeArray: (->
    if @content && @content.get('isLoaded') 
      b = buildHierarchy @content.toArray()
      jQuery("#demo1").jstree(
        json_data: b
        plugins: ["themes", "json_data", "ui"]
      ).bind "select_node.jstree", (event, data) =>
        selectedItemType = Liquidibles.ItemType.find(data.rslt.obj.attr('id'))
        @updateFilter(selectedItemType)
        containerView = Em.View.views['my_container_view']
        l = containerView.get("childViews").length
        i = 0
        while i < l
          containerView.get("childViews").popObject()
          i++
        mergedFilterAttr = @get "mergedFilterAttr"
        for key of mergedFilterAttr
          @renderFilter [key,mergedFilterAttr[key]]  if mergedFilterAttr.hasOwnProperty(key)
        @set "mergedFilterAttr", {}
  ).observes("content.isLoaded")

  updateFilter: (selectedItemType) ->
    filterAttr = selectedItemType.get('instance_attributes')
    parent_id = selectedItemType.get('parent_id')
    mergedFilterAttr = @get "mergedFilterAttr"
    for key of filterAttr
      if filterAttr.hasOwnProperty(key) and mergedFilterAttr[key] is undefined
        mergedFilterAttr[key] = filterAttr[key]
        @set "mergedFilterAttr", mergedFilterAttr 
    if parent_id
      parent_item_type = Liquidibles.ItemType.find(parent_id)
      @updateFilter(parent_item_type)

  renderFilter:(attr) ->
    containerView = Em.View.views['my_container_view']
    if attr[1]['variable']
      if attr[1]['slider']
        childView = Liquidibles.InputFilterRangeTextView.create(
          content: attr[1]
        )
      else
        if attr[1]['allowed_values'] && attr[1]['allowed_values'].length > 0
          childView = Liquidibles.InputEnumFilterView.create(
            content: attr[1]
          )
        else
          childView = Liquidibles.InputFilterRangeTextView.create(
            content: attr[1]
          )
      containerView.get('childViews').pushObject(childView)
      @set "mergedFilterAttr", {}

)
Liquidibles.ItemTypeController = Ember.ObjectController.extend(soundVolume: 1)
