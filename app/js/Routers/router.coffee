class Router extends Backbone.Router

	routes: 
		'list/:id': 'list'

	list: (param) ->
		app.trigger 'list', param
	
app.Router = Router
