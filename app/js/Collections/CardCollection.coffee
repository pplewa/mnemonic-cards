class CardCollection extends Backbone.Collection

	model: app.Card

	localStorage: new Backbone.LocalStorage 'card-collection'

	initialize: ->
		@fetch()
		@add app.cards unless @length isnt 0

app.CardCollection = CardCollection