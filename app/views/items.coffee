Liquidibles.ItemsView = Ember.View.extend
	didInsertElement:->
		console.log 'Items view rendered'
		jQuery("#item_type_children_breadCrumb").change (eventObject) =>
			if eventObject.target.selectedOptions[0].getAttribute('value')
	  		@controller.updateBreadcrumb(eventObject.target.selectedOptions[0].getAttribute('value'))

Liquidibles.ItemView = Ember.View.extend
	didInsertElement:->
		console.log 'Item view rendered'

Liquidibles.ItemTypesView = Ember.View.extend
	didInsertElement:->
		console.log 'ItemTypes view rendered'
		jQuery( "#format" ).buttonset()
		
Liquidibles.InputEnumFilterView = Ember.View.extend
	templateName: 'input_enum_filter'
	didInsertElement:->
		jQuery('.slider_from').change ->
			upper_value = jQuery(jQuery(event.target.parentElement.parentElement.parentElement.parentElement.parentElement.children[0]).find('.slider_input_tag')).slider("values")[1]
			updated_lower_value = parseInt(event.target.value)
			if upper_value >= updated_lower_value
				jQuery(jQuery(event.target.parentElement.parentElement.parentElement.parentElement.parentElement.children[0]).find('.slider_input_tag')).slider("values", 0, updated_lower_value)	
			else
				jQuery(jQuery(event.target.parentElement.parentElement.parentElement.parentElement.parentElement.children[0]).find('.slider_input_tag')).slider("values", 0, upper_value)
				jQuery(event.target).val(jQuery(event.target.parentElement.parentElement.parentElement.parentElement).find('.to').val())			
			jQuery('.trigger_search_value').val(1)
			jQuery('.trigger_search_value').focusout()
		jQuery('.slider_to').change ->
			lower_value = jQuery(jQuery(event.target.parentElement.parentElement.parentElement.parentElement.parentElement.children[0]).find('.slider_input_tag')).slider("values")[0]
			updated_upper_value = parseInt(event.target.value)
			if updated_upper_value >= lower_value
				jQuery(jQuery(event.target.parentElement.parentElement.parentElement.parentElement.parentElement.children[0]).find('.slider_input_tag')).slider("values", 1, updated_upper_value)	
			else
				jQuery(jQuery(event.target.parentElement.parentElement.parentElement.parentElement.parentElement.children[0]).find('.slider_input_tag')).slider("values", 1, lower_value)
				jQuery(event.target).val(jQuery(event.target.parentElement.parentElement.parentElement.parentElement).find('.from').val())			
			jQuery('.trigger_search_value').val(1)
			jQuery('.trigger_search_value').focusout()
		jQuery("#"+@get('propNameModified')).slider
		  range: true
		  min: @get('lowerBound')
		  max: @get('upperBound')
		  step: @get('floatPrecision')
		  values: [@get('lowerBound'), @get('upperBound')]
		  stop: (event, ui) =>
		  	if @get('min') and typeof(@get('min')) is "string"
		  		if jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('input').length > 0
			  		jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('input')[0]).val(ui.values[0])
			  		jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('input')[1]).val(ui.values[1])
			  		console.log "From: " + ui.values[0] + " - To:" + ui.values[1] + "Min: " + @get("min")
			  		jQuery('.trigger_search_value').val(1)
			  		jQuery('.trigger_search_value').focusout()
			  	else
			  		jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('select')[0]).val(_this.get('allowedValues')[ui.values[0]])
			  		jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('select')[1]).val(_this.get('allowedValues')[ui.values[1]])
			  		console.log "From: " + ui.values[0] + " - To:" + ui.values[1] + "Min: " + @get("min")
			  		jQuery('.trigger_search_value').val(1)
			  		jQuery('.trigger_search_value').focusout()
		  	else
		  		if jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('input').length > 0
		  			jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('input')[0]).val(ui.values[0])
		  			jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('input')[1]).val(ui.values[1])
		  			jQuery('.trigger_search_value').val(1)
		  			jQuery('.trigger_search_value').focusout()
		  		else
		  			jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('select')[0]).val(_this.get('allowedValues')[ui.values[0]])
		  			jQuery(jQuery(event.target.parentElement.parentElement.parentElement.children[1]).find('select')[0]).val(_this.get('allowedValues')[ui.values[1]])
		  			jQuery('.trigger_search_value').val(1)
		  			jQuery('.trigger_search_value').focusout()

	modifiedAllowedValues:(->
		modifiedAllowedValuesArray = []
		if @get('allowedValues') and @get('allowedValues').length > 0
			i = 0
			while i < @get('allowedValues').get('length')
			  modifiedAllowedValuesArray.push 
			  	'label':@get("allowedValues")[i].slice(4).replace("_", " "),
			  	'value':@get('allowedValues')[i]
			  i++ 
		return modifiedAllowedValuesArray		
	).property('allowedValues')
	modifiedAllowedValuesMinSelection:(->
		modifiedAllowedValues = @get('modifiedAllowedValues')
		if modifiedAllowedValues and modifiedAllowedValues.length > 0
			i = 0
			while i < modifiedAllowedValues.length
				if modifiedAllowedValues[i]['value'] is @get('min')
					return modifiedAllowedValues[i]
				i++
	).property('modifiedAllowedValues','min')
	modifiedAllowedValuesMaxSelection:(->
		modifiedAllowedValues = @get('modifiedAllowedValues')
		if modifiedAllowedValues and modifiedAllowedValues.length > 0
			i = 0
			while i < modifiedAllowedValues.length
				if modifiedAllowedValues[i]['value'] is @get('max')
					return modifiedAllowedValues[i]
				i++
	).property('modifiedAllowedValues','max')
	floatPrecision:(->
		if @get('type') is 'float'
			return 0.01
		else
			return 1
	).property('float')
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


Liquidibles.InputFilterRangeTextView = Ember.View.extend
	templateName: 'input_filter_range_text'
	didInsertElement:->
		jQuery('.multiselectclass').multiselect 
			numberDisplayed: 4
			enableCaseInsensitiveFiltering: true
			onDropdownHide: (element) ->
				console.log  "Hide drop down event invoked!"

	showDropDown:(->
		if @get('type') is 'string' and @get('allowedValues')
			return true
		else
			return false
	).property('type','allowed_values','allowed_values.length')
	propNameUnderscored:(->
		if @get('propName')
			@get('propName').replace('.','_')
	).property('propName')
	modifiedAllowedValues:(->
		modifiedAllowedValuesArray = []
		if @get('allowedValues') and @get('allowedValues').length > 0
			i = 0
			while i < @get('allowedValues').get('length')
			  modifiedAllowedValuesArray.push 
			  	'label':@get("allowedValues")[i].slice(4).replace("_", " "),
			  	'value':@get('allowedValues')[i]
			  i++ 
		return modifiedAllowedValuesArray		
	).property('allowedValues')
	modifiedAllowedValuesMinSelection:(->
		modifiedAllowedValues = @get('modifiedAllowedValues')
		if modifiedAllowedValues and modifiedAllowedValues.length > 0
			i = 0
			while i < modifiedAllowedValues.length
				if modifiedAllowedValues[i]['value'] is @get('min')
					return modifiedAllowedValues[i]
				i++
	).property('modifiedAllowedValues','min')