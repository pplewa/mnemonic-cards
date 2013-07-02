class CardsView extends Backbone.View

	el: 'section'
	template: JST['app/templates/CardsView.us']
	itemTemplate: JST['app/templates/CardItem.us']

	events:
		'click li'  : 'toggleDone'

	render: (journey) ->
		@$el.html @template()
		@ul = @el.firstElementChild

		app.registry.journeyCollection.get(journey).get('order').forEach (order) =>
			card = app.registry.cardCollection.at(order)
			$(@ul).append @itemTemplate({ name: card.get 'value' })


	initialize: ->
		_.bindAll @

		app.on 'list', @render
		# @render()

app.CardsView = CardsView