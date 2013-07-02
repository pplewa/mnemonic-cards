class CardsView extends Backbone.View

	# el: '#cards'
	template: JST['app/templates/CardsView.us']
	itemTemplate: JST['app/templates/CardItem.us']

	events:
		'click li'  : 'toggleDone'

	render: (journey) ->
		this.setElement @template()
		$('section').html @el

		@ul = @el.firstElementChild
		@counter = @$el.find '#counter'
		@journey = app.registry.journeyCollection.get(journey)

		@journey.get('order').forEach (order) =>
			card = app.registry.cardCollection.at(order)
			$(@ul).append @itemTemplate 
				label: card.get 'label'
				value: card.get 'value'

		@swipe = Swipe @el, 
			disableScroll: true
			continuous: false
			callback: @updateCounter

		@updateCounter()

	updateCounter: ->
		@counter.html "#{@swipe.getPos()} / #{@swipe.getNumSlides()}"

	guessed: ->
		@journey.guessedCard(@swipe.getPos())
		@swipe.next()

	initialize: ->
		_.bindAll @, 'updateCounter', 'guessed'

		app.on 'list', @render
		app.on 'guessed', @guessed

app.CardsView = CardsView