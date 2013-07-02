class Card extends Backbone.Model

	defaults:
		label: ''
		value: 0

	initialize: ->
		@save()

app.Card = Card