class CardCollection extends Backbone.Collection

	model: app.Card

	localStorage: new Backbone.LocalStorage 'card-collection'

	initialize: ->
		console.log arguments
		# this

app.CardCollection = CardCollection