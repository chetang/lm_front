Liquidibles = require 'app'

Liquidibles.ItemsController = Ember.ArrayController.extend(
  needs: ['index']
  itemType: null 
  mergedFilterAttrArray: []
  item_filter:{'from':{},'to':{}}
  itemTypeTreeArray: (->
    if @itemType && @itemType.get('isLoaded')
      @set "childrens", @itemType.objectAt(0).get('children')
  ).observes("itemType.isLoaded")

  updateBreadcrumb: (selectedItemType) ->
    selectedItemType = Liquidibles.ItemType.find(selectedItemType)
    @set "controllers.index.currentItemType", selectedItemType.get('prop_name')
    mergedFilterAttrArray = []
    mergedFilterAttrObject = {}
    @set "mergedFilterAttrArray", @updateFilter(selectedItemType,mergedFilterAttrArray,mergedFilterAttrObject)
    parent_tree = []
    @set "ancestors", @buildParentTree(selectedItemType,parent_tree)
    @set "childrens", selectedItemType.get('children')
    @set('content',Liquidibles.store.findQuery(Liquidibles.Item,{'item_index_within_type_prop_name':selectedItemType.get('prop_name')}))
    jQuery(".ancestor_item_type").click (eventObject) =>
      if eventObject.target.selectedOptions[0].getAttribute('id')
          @controller.updateFilter(eventObject)

  updateFilter: (selectedItemType,mergedFilterAttrArray,mergedFilterAttrObject) ->
    filterAttr = selectedItemType.get('modifiedInstanceAttributes')
    for key of filterAttr
      if filterAttr.hasOwnProperty(key) and mergedFilterAttrObject[key] is undefined
        filterAttr[key]['key'] = key.replace('.','_')
        mergedFilterAttrArray.pushObject filterAttr[key]
        mergedFilterAttrObject[key] = filterAttr[key]
    if selectedItemType.get('parent.id')
      parent_item_type = Liquidibles.ItemType.find(selectedItemType.get('parent.id'))
      @updateFilter(parent_item_type,mergedFilterAttrArray,mergedFilterAttrObject)
    return mergedFilterAttrArray

  buildParentTree: (item_type, parent_tree) ->
    if item_type.get('parent')
      ancestor_hash = {}
      ancestor_hash['prop_name'] = item_type.get('parent.prop_name')
      ancestor_hash['id'] = item_type.get('parent.id')
      parent_tree.pushObject ancestor_hash
      @buildParentTree(item_type.get('parent'),parent_tree)
    else
      return parent_tree.reverse() 

  searchItems: (params) ->
    jQuery(jQuery(jQuery('.from')[0].parentElement.parentElement.parentElement.parentElement.parentElement.parentElement).children()[0]).text()
    item_filter = @get 'item_filter'
    a = jQuery(".from").toArray()
    a.forEach (element) ->
      from_filter_key = jQuery(jQuery(element.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement).children()[0]).text()
      item_filter["from"][from_filter_key.trim()] = jQuery(element).val()

    b = jQuery(".to").toArray()
    b.forEach (element) ->
      from_filter_key = jQuery(jQuery(element.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement).children()[0]).text()
      item_filter["to"][from_filter_key.trim()] = jQuery(element).val()
    within_type = @controllerFor('index').get('currentItemType')
    query_string = jQuery('.item_filter_query_string').val()
    @controllerFor('index').set('filter_params',{'item_filter':item_filter,'within_type':within_type,'q':query_string})
    @set('item_filter',{'from':{},'to':{}})
    @set('content',Liquidibles.store.findQuery(Liquidibles.Item,{'item_filter':item_filter,'within_type':within_type,'q':query_string}))

)

Liquidibles.ItemController = Ember.ObjectController.extend(
  content: null
  needs: ['index','items']
  key_arrays: (->
    attr_hash = @content.get("instance_attributes")
    key_arrays = []
    for item_attr of attr_hash
      key_arrays.push @controllerFor('index').toTitleCase(item_attr.slice(item_attr.indexOf('.')+1).replace("_"," "))
    return key_arrays
  ).property("content.isLoaded")

  value_arrays: (->
    attr_hash = @content.get("instance_attributes")
    value_arrays = []
    regex = /[0-9]{4}/
    for item_attr of attr_hash
      item_attr_value = attr_hash[item_attr]
      # item_attr_value = @controllerFor('index').slicedValues(item_attr_value,regex)
      # if typeof (item_attr_value) is "string"
      #   item_attr_value=item_attr_value.replace("_"," ")
      value_arrays.push @controllerFor('index').toTitleCase(item_attr_value)
    return value_arrays
  ).property("content.isLoaded")
)
