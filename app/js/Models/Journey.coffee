class Journey extends Backbone.Model

	defaults:
		order: []
		guessed: []
		timestamp: new Date

	initialize: ->
		# @cards = new app.CardCollection
		unless @get 'id'
			@set 'order', _.shuffle([0...app.cards.length])
			@set 'guessed', Array.apply(null, new Array(app.cards.length)).map(Number.prototype.valueOf, 0)

app.Journey = Journey
