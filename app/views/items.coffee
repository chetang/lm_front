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
		