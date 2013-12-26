Liquidibles.IndexView = Ember.View.extend
	didInsertElement:->
		console.log 'Index view rendered'

	willDestroyElement:->
		console.log 'Index view destroyed'