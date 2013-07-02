class Router extends Backbone.Router

	routes: 
		'journey/:id': 'journey'
		'': 'journey'

	journey: (param) ->
		app.trigger 'journey', param
	
app.Router = Router
