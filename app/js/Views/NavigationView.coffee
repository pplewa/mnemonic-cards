class NavigationView extends Backbone.View

	el: 'nav'
	template: JST['app/templates/NavigationView.us']

	events: 
		'click button': 'handleEvents'
		'tap button': 'handleEvents'

	render: ->
		@$el.html @template()
		@

	initialize: ->
		_.bindAll @, 'addJourney'

		# disable scrolling on dragging @el
		@$el.on 'touchmove', (e) -> e.preventDefault()

		@render()

	handleEvents: (e) ->
		# prevent firing multiple events if touch is enabled
		return false if e.type is 'click' and typeof window.ontouchstart != 'undefined' 
		# call proper button method
		@[e.currentTarget.id]()

	addJourney: ->
		# add list
		app.registry.journeyCollection.create()
		# navigate to the new list
		app.registry.router.navigate 'journey/' + app.registry.journeyCollection.last().id, trigger: true

	clearJourneys: ->
		# prompt confirmation
		if confirm 'Remove All Journeys?'
			app.registry.journeyCollection.each (journey) -> setTimeout(journey.destroy, 1)

	guessed: ->
		app.trigger 'guessed', trigger: true

	showJourneys: ->
		app.registry.router.navigate '', trigger: true

app.NavigationView = NavigationView