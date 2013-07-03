class CardsView extends Backbone.View

	# el: '#cards'
	template: JST['app/templates/CardsView.us']
	itemTemplate: JST['app/templates/CardItem.us']

	render: (journey) ->
		app.registry.journeys.remove()
		this.setElement @template()
		$('section').html @el

		@ul = @el.firstElementChild
		fragment = document.createDocumentFragment()
		@counter = @$el.find '#counter'
		@journey = app.registry.journeyCollection.get(journey)

		@journey.get('order').forEach (order) =>
			card = app.registry.cardCollection.at(order)
			item = $ @itemTemplate 
				label: card.get 'label'
				value: card.get 'value'
			fragment.appendChild item[0]
		$(@ul).append fragment

		@swipe = Swipe @el, 
			disableScroll: true
			callback: @updateCounter

		@updateCounter()

	updateCounter: ->
		@counter.html "#{@swipe.getPos() + 1} / #{@swipe.getNumSlides()}"

	guessed: ->
		@journey.guessedCard(@swipe.getPos())
		@swipe.next()

	initialize: ->
		_.bindAll @, 'updateCounter', 'guessed'

		app.on 'list', @render
		app.on 'guessed', @guessed

app.CardsView = CardsView