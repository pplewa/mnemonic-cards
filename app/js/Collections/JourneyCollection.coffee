class JourneyCollection extends Backbone.Collection

	model: app.Journey

	localStorage: new Backbone.LocalStorage 'journey-collection'

	initialize: ->
		@fetch()

app.JourneyCollection = JourneyCollection