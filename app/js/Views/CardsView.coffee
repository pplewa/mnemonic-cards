class CardsView extends Backbone.View

	el: 'section'
	template: JST['app/templates/CardsView.us']
	itemTemplate: JST['app/templates/CardItem.us']

	# events:
	# 	'click .toggle'  : 'toggleDone'
	# 	'dblclick .view' : 'edit'
	# 	'click a.destroy': 'clear'
	# 	'keypress .edit' : 'updateOnEnter'
	# 	'blur .edit'     : 'close'

	render: (journey) ->
		@$el.html @template()
		@ul = @el.firstElementChild

		app.registry.journeyCollection.get(journey).cards.each (card) =>
			$(@ul).append @itemTemplate({ name: card.get 'value' })


	initialize: ->
		_.bindAll @

		app.on 'list', @render
		# @render()

app.CardsView = CardsView