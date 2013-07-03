class NavigationView extends Backbone.View

	el: 'nav'
	template: JST['app/templates/NavigationView.us']

	events: 
		'mousedown button': 'handleEvents'
		'touchstart button': 'handleEvents'

	render: ->
		@$el.html @template()
		@

	initialize: ->
		_.bindAll @, 'addJourney', 'loadView'
		app.on 'journey', @loadView

		# disable scrolling on dragging @el
		@$el.on 'touchmove', (e) -> e.preventDefault()

		@render()

	handleEvents: (e) ->
		@[e.currentTarget.id]()

	addJourney: ->
		# add list
		app.registry.journeyCollection.create()
		# navigate to the new list
		app.registry.router.navigate 'journey/' + app.registry.journeyCollection.last().id, trigger: true

	clearJourneys: ->
		if confirm 'Remove All Journeys?'
			app.registry.journeyCollection.each (journey) -> setTimeout(journey.destroy, 1)

	guessed: ->
		app.trigger 'guessed', trigger: true

	loadView: (journey) ->
		view = if not journey then 'journeys' else 'cards'
		@$el.removeClass().addClass(view)
		app.registry[view].render(journey)

	showJourneys: ->
		app.registry.router.navigate '', trigger: true

app.NavigationView = NavigationView