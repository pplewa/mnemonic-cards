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

		app.registry.journeyCollection.get(journey).get('order').forEach (order) =>
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

	initialize: ->
		_.bindAll @
		app.on 'list', @render

app.CardsView = CardsView