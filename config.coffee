fs = require 'fs'
sysPath = require 'path'

# See docs at http://brunch.readthedocs.org/en/latest/config.html.


exports.config =
	paths:
		'public': "../liquidibles/public"

	files:
		javascripts:
			defaultExtension: 'coffee',
			joinTo:
				'javascripts/app.js': /^app(\/|\\)(?!(tests|store-test))/
				'javascripts/vendor.js': /^vendor/

			order:
				before: [
					'vendor/scripts/jquery-1.9.0.min.js',
					'vendor/scripts/jquery-ui.js',
					'vendor/scripts/handlebars-1.0.rc.1.js',
					'vendor/scripts/ember-latest.js',
					'vendor/scripts/ember-data-latest.js',
					'vendor/scripts/bootstrap.js',
					'vendor/scripts/bootstrap-slider.js',
					'jquery.jstree.js'
				]

		stylesheets:
			defaultExtension: 'css'
			joinTo: 'stylesheets/app.css'
			order:
				before:[
					'vendor/styles/slider.css'
					'vendor/styles/style.css'
				]

		templates:
			precompile: true
			root: 'templates'
			defaultExtension: 'hbs'
			joinTo:
				'javascripts/app.js': /^app/

# allow _ prefixed templates so partials work
	conventions:
		ignored: (path) ->
			startsWith = (string, substring) ->
				string.indexOf(substring, 0) is 0
			sep = sysPath.sep
			if path.indexOf('index.html') == 0 #index.html is only used in mobile app, otherwise it is served by Rails server
				return true
			if path.indexOf("app#{sep}templates#{sep}") is 0
				false
			else
				startsWith sysPath.basename(path), '_'
	sourceMaps: false
	server:
		port: 3333
		base: '/'
		run: no

