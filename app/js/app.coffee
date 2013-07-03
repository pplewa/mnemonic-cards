$ ->
	# app.mainEvent = if (typeof window.ontouchstart isnt 'undefined') then 'touchstart' else 'mousedown'

	app.registry = 
		journeyCollection: new app.JourneyCollection
		cardCollection: new app.CardCollection
		navigation: new app.NavigationView 
		cards: new app.CardsView
		journeys: new app.JourneysView
		router: new app.Router

	Backbone.history.start pushState: false