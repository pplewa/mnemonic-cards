class CardsView extends Backbone.View

	# el: '#cards'
	template: JST['app/templates/CardsView.us']
	itemTemplate: JST['app/templates/CardItem.us']


	initialize: ->
		_.bindAll @, 'updateCounter', 'guessed', 'handleKeys', 'loadView'
		app.on 'journey', @loadView
		app.on 'list', @render
		app.on 'guessed', @guessed

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
			item.on 'doubleTap', (e) => 
				@journey.toggleGuess(@swipe.getPos())
				@updateCounter()
			fragment.appendChild item[0]
		$(@ul).append fragment

		@swipe = Swipe @el, 
			disableScroll: true
			callback: @updateCounter

		@updateCounter()

	loadView: (journey) ->
		if journey
			$(document.body).on 'keydown', @handleKeys
			$(document.body).removeClass().addClass 'cards'
			@render(journey)
		else $(document.body).off 'keydown'

	handleKeys: (e) ->
		switch e.keyIdentifier
			when 'Right' then @swipe.next()
			when 'Left' then @swipe.prev()

	updateCounter: ->
		guessed = if @journey.get('guessed')[@swipe.getPos()] then 'icon-ok' else 'icon-remove'
		@counter.html "<i class='#{guessed}'></i> #{@swipe.getPos() + 1} / #{@swipe.getNumSlides()}"

	guessed: ->
		@journey.guessedCard(@swipe.getPos())
		@swipe.next()

app.CardsView = CardsView