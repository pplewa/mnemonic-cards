class NavigationView extends Backbone.View

	el: 'nav'
	template: JST['app/templates/NavigationView.us']

	events: 
		'click #new-journey': 'addJourney'
		'click #show-journeys': 'showJourneys'
		'click #guessed': 'guessed'

	render: ->
		@$el.html @template()
		@

	initialize: ->
		_.bindAll this, 'addJourney', 'loadView'

		@render()

		app.on 'journey', @loadView

		@addJourneyButton = @$el.find '#new-journey'
		@backButton = @$el.find('#show-journeys').hide()
		@guessedButton = @$el.find('#guessed').hide()

	addJourney: ->
		# add list
		app.registry.journeyCollection.create()
		# navigate to the new list
		app.trigger 'navigate', 'journey/' + app.registry.journeyCollection.last().id, trigger: true

	guessed: ->
		app.registry.cards.swipe.next()

	loadView: (journey) ->
		if journey
			@addJourneyButton.hide()
			@backButton.show()
			@guessedButton.show()
			app.registry.journeys.remove()
			app.registry.cards.render(journey)
		else 
			@addJourneyButton.show()
			@backButton.hide()
			@guessedButton.hide()
			app.registry.cards.remove()
			app.registry.journeys.render()

	showJourneys: ->
		app.trigger 'navigate', '', trigger: true

app.NavigationView = NavigationView