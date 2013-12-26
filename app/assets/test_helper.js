var head = document.getElementsByTagName("head")[0];
head.innerHTML = head.innerHTML + "<link rel='stylesheet' href='/stylesheets/app.css'>";
document.write('<div id="ember-testing-container"><div id="ember-testing"></div></div>');
document.write('<style>#ember-testing-container { position: absolute; background: white; bottom: 0; right: 0; width: 0px; height: 0px; overflow: auto; z-index: 9999; border: 1px solid #ccc; } #ember-testing { zoom: 50%; }</style>');

window.Liquidibles = require('app');
require('templates');
require('router');
require('constants');
require ('helper');
require('routes');
require('models');
require('controllers');
require('views');
require('store-test');


Ember.testing = true
Liquidibles.rootElement = '#ember-testing';
Liquidibles.setupForTesting();
Liquidibles.injectTestHelpers();

function exists(selector) {
	return !!find(selector).length;
}