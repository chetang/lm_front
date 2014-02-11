Liquidibles.IndexView = Ember.View.extend
	templateName: 'index'
Liquidibles.FooterView = Ember.View.extend
	templateName: 'footer'
Liquidibles.HeaderView = Ember.View.extend
	templateName: 'header'
Liquidibles.UsersView = Ember.View.extend
	templateName: 'users'
Liquidibles.UserView = Ember.View.extend
	templateName: 'user'
Liquidibles.AccountsView = Ember.View.extend
	templateName: 'accounts'
Liquidibles.AccountView = Ember.View.extend
	templateName: 'account'
Liquidibles.AccountnewView = Ember.View.extend
	templateName: 'account_new'
	didInsertElement:->
		console.log 'Account new view rendered'
Liquidibles.AccounteditView = Ember.View.extend
	templateName: 'account_edit'
	didInsertElement:->
		console.log 'Account edit view rendered'
Liquidibles.WantsView = Ember.View.extend
	templateName: 'wants/index'
Liquidibles.WantView = Ember.View.extend
	templateName: 'wants/show'
