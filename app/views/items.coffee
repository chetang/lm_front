Liquidibles.ItemsView = Ember.View.extend
	didInsertElement:->
		console.log 'Items view rendered'

	willDestroyElement:->
		console.log 'Items view destroyed'		
		
Liquidibles.ItemView = Ember.View.extend
	didInsertElement:->
		console.log 'Item view rendered'

	willDestroyElement:->
		console.log 'Item view destroyed'		

Liquidibles.ItemTypesView = Ember.View.extend
	didInsertElement:->
		console.log 'ItemTypes view rendered'

	willDestroyElement:->
		console.log 'ItemTypes view destroyed'		
		
Liquidibles.InputEnumFilterView = Ember.View.extend
	templateName: 'input_enum_filter'
	didInsertElement:->
		console.log 'InputEnumFilterView view rendered'
		jQuery(".slider_for_enum").slider()

	willDestroyElement:->
		console.log 'InputEnumFilterView view destroyed'		

	contentObserver:(->
		alert('alert')
	).property('content')

Liquidibles.InputFilterRangeSliderView = Ember.View.extend
	templateName: 'input_filter_range_slider'
	content: null
	didInsertElement:->
		console.log 'InputFilterRangeSliderView view rendered'
		jQuery(".slider_for_enum").slider()

	willDestroyElement:->
		console.log 'InputFilterRangeSliderView view destroyed'		

	contentObserver:(->
		alert('alert1')
	).property('content')

Liquidibles.InputFilterRangeTextView = Ember.View.extend
	templateName: 'input_filter_range_text'
	didInsertElement:->
		console.log 'InputFilterRangeTextView view rendered'
		jQuery(".slider_for_enum").slider()

	willDestroyElement:->
		console.log 'InputFilterRangeTextView view destroyed'		

	contentObserver:(->
		alert('alert2')
	).property('content')

Liquidibles.ContainerView = Ember.ContainerView.extend({})