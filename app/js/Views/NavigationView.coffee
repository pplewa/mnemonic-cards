class NavigationView extends Backbone.View

	el: 'nav'
	template: JST['app/templates/NavigationView.us']

	events: 
		'click #new-journey': 'newJourney'
		'click #show-journeys': 'showJourneys'

	render: ->
		@$el.html @template()
		@

	initialize: ->
		_.bindAll this, 'newJourney'

		app.on 'list', @showCards

		@render()

		@newButton = @$el.find '#new-journey'
		@listButton = @$el.find '#show-journeys'
		@listButton.hide()

	toggleView: ->
		@newButton.toggle()
		@listButton.toggle()

	newJourney: ->
		@toggleView()
		# add list
		# navigate to the new list
		app.registry.journeyCollection.create

		app.trigger 'navigate', 'list/' + app.registry.journeyCollection.last().id, trigger: true
		console.log 'newJourney'

	showCards: ->
		# app.registry.cards = new app.CardsView journey: {}
		# app.registry.cards.render();

	showJourneys: ->
		@toggleView()
		app.trigger 'navigate', '', trigger: true
		# app.registry.cards?.remove()
		app.registry.journeys.render()
		console.log 'showJourneys'

app.NavigationView = NavigationView