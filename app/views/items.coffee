Liquidibles.ItemsView = Ember.View.extend
	didInsertElement:->
		console.log 'Items view rendered'

Liquidibles.ItemView = Ember.View.extend
	didInsertElement:->
		console.log 'Item view rendered'

Liquidibles.ItemTypesView = Ember.View.extend
	didInsertElement:->
		console.log 'ItemTypes view rendered'
		jQuery("#item_type_children_breadCrumb").change (eventObject) =>
			if eventObject.target.selectedOptions[0].getAttribute('value')
	  			@controller.updateBreadcrumb(eventObject.target.selectedOptions[0].getAttribute('value'))
		
Liquidibles.InputEnumFilterView = Ember.View.extend
	templateName: 'input_enum_filter'
	didInsertElement:->
		jQuery('.from').change ->
			console.log('hi')
			upper_value = jQuery(jQuery(event.target.parentElement.parentElement.parentElement.parentElement.parentElement.children[0]).find('.slider_input_tag')).slider("values")[1]
			updated_lower_value = parseInt(event.target.value)
			if upper_value >= updated_lower_value
				jQuery(jQuery(event.target.parentElement.parentElement.parentElement.parentElement.parentElement.children[0]).find('.slider_input_tag')).slider("values", 0, updated_lower_value)	
			else
				jQuery(jQuery(event.target.parentElement.parentElement.parentElement.parentElement.parentElement.children[0]).find('.slider_input_tag')).slider("values", 0, upper_value)
				jQuery(event.target).val(jQuery(event.target.parentElement.parentElement.parentElement.parentElement).find('.to').val())			
		jQuery('.to').change ->
			console.log('hi')
			lower_value = jQuery(jQuery(event.target.parentElement.parentElement.parentElement.parentElement.parentElement.children[0]).find('.slider_input_tag')).slider("values")[0]
			updated_upper_value = parseInt(event.target.value)
			if updated_upper_value >= lower_value
				jQuery(jQuery(event.target.parentElement.parentElement.parentElement.parentElement.parentElement.children[0]).find('.slider_input_tag')).slider("values", 1, updated_upper_value)	
			else
				jQuery(jQuery(event.target.parentElement.parentElement.parentElement.parentElement.parentElement.children[0]).find('.slider_input_tag')).slider("values", 1, lower_value)
				jQuery(event.target).val(jQuery(event.target.parentElement.parentElement.parentElement.parentElement).find('.from').val())			

		jQuery("#"+@get('propNameModified')).slider
		  range: true
		  min: @get('lowerBound')
		  max: @get('upperBound')
		  values: [@get('lowerBound'), @get('upperBound')]
		  slide: (event, ui) =>
		  	if @get('min') and typeof(@get('min')) is "string"
		  		if jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('input').length > 0
			  		jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('input')[0]).val(ui.values[0])
			  		jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('input')[1]).val(ui.values[1])
			  		console.log "From: " + ui.values[0] + " - To:" + ui.values[1] + "Min: " + @get("min")
			  	else
			  		jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('select')[0]).val(_this.get('allowedValues')[ui.values[0]])
			  		jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('select')[1]).val(_this.get('allowedValues')[ui.values[1]])
			  		console.log "From: " + ui.values[0] + " - To:" + ui.values[1] + "Min: " + @get("min")
		  	else
		  		if jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('input').length > 0
		  			jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('input')[0]).val(ui.values[0])
		  			jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('input')[1]).val(ui.values[1])
		  		else
		  			jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('select')[0]).val(_this.get('allowedValues')[ui.values[0]])
		  			jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('select')[0]).val(_this.get('allowedValues')[ui.values[1]])

	# modifiedAllowedValues:(->
	# 	modifiedAllowedValuesArray = @get('allowedValues')
	# 	if @get('allowedValues') and @get('allowedValues').length > 0
	# 		i = 0
	# 		while i < modifiedAllowedValuesArray.length
	# 		  modifiedAllowedValuesArray[i] = modifiedAllowedValuesArray[i].slice(4)
	# 		  i++ 
	# 	return modifiedAllowedValuesArray		
	# ).property('allowedValues')

	lowerBound:(->
		if typeof(@get('min')) is 'string'
			parseInt(@get('min'))
		else
			@get('min')
	).property('min')

	upperBound:(->
		if typeof(@get('max')) is 'string'
			parseInt(@get('max'))
		else
			@get('max')
	).property('max')

	showDropDown:(->
		if @get('type') is 'string' and @get('allowedValues')
			return true
		else
			return false
	).property('type','allowed_values','allowed_values.length')

	propNameModified:(->
		if @get('propName')
			@get('propName').slice(@get('propName').indexOf('.')+1)
	).property('propName')

	propNameUnderscored:(->
		if @get('propName')
			@get('propName').replace('.','_')
	).property('propName')


Liquidibles.InputFilterRangeSliderView = Ember.View.extend
	templateName: 'input_filter_range_slider'
	content: null
	didInsertElement:->
		console.log 'InputFilterRangeSliderView view rendered'

	showDropDown:(->
		if @get('type') is 'string' and @get('allowedValues')
			return true
		else
			return false
	).property('type','allowed_values','allowed_values.length')

	propNameModified:(->
		if @get('propName')
			@get('propName').slice(@get('propName').indexOf('.')+1)
	).property('propName')
	propNameUnderscored:(->
		if @get('propName')
			@get('propName').replace('.','_')
	).property('propName')


Liquidibles.InputFilterRangeTextView = Ember.View.extend
	templateName: 'input_filter_range_text'
	didInsertElement:->
		console.log 'InputFilterRangeTextView view rendered'
	
	showDropDown:(->
		if @get('type') is 'string' and @get('allowedValues')
			return true
		else
			return false
	).property('type','allowed_values','allowed_values.length')

	propNameModified:(->
		if @get('propName')
			@get('propName').slice(@get('propName').indexOf('.')+1)
	).property('propName')
	propNameUnderscored:(->
		if @get('propName')
			@get('propName').replace('.','_')
	).property('propName')
	# modifiedAllowedValues:(->
	# 	modifiedAllowedValuesArray = @get('allowedValues')
	# 	if @get('allowedValues') and @get('allowedValues').length > 0
	# 		i = 0
	# 		while i < modifiedAllowedValuesArray.length
	# 		  modifiedAllowedValuesArray[i] = modifiedAllowedValuesArray[i].slice(4)
	# 		  i++ 
	# 	return modifiedAllowedValuesArray		
	# ).property('allowedValues')

