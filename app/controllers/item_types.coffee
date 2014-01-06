Liquidibles = require 'app'

Liquidibles.ItemTypesController = Ember.ArrayController.extend(
  needs: ['index']
  content: null
  mergedFilterAttrArray: []
  item_filter:{'from':{},'to':{}}
  itemTypeTreeArray: (->
    if @content && @content.get('isLoaded')
      @set "childrens", @content.objectAt(0).get('children')
  ).observes("content.isLoaded")

  updateBreadcrumb: (selectedItemType) ->
    selectedItemType = Liquidibles.ItemType.find(selectedItemType)
    @set "controllers.index.currentItemType", selectedItemType.get('prop_name')
    mergedFilterAttrArray = []
    mergedFilterAttrObject = {}
    @set "mergedFilterAttrArray", @updateFilter(selectedItemType,mergedFilterAttrArray,mergedFilterAttrObject)
    parent_tree = []
    @set "ancestors", @buildParentTree(selectedItemType,parent_tree)
    @set "childrens", selectedItemType.get('children')
    jQuery(".ancestor_item_type").click (eventObject) =>
      if eventObject.target.selectedOptions[0].getAttribute('id')
          @controller.updateFilter(eventObject)

  updateFilter: (selectedItemType,mergedFilterAttrArray,mergedFilterAttrObject) ->
    filterAttr = selectedItemType.get('modifiedInstanceAttributes')
    for key of filterAttr
      if filterAttr.hasOwnProperty(key) and mergedFilterAttrObject[key] is undefined
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
    @transitionToRoute('items')

)
Liquidibles.ItemTypeController = Ember.ObjectController.extend(
  needs: ['index']
)
