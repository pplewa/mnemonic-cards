class JourneysView extends Backbone.View
	el: 'section'
	template: JST['app/templates/JourneysView.us']
	itemTemplate: JST['app/templates/JourneyItem.us']

	# events: 
		# 'click #new-shuffle': 'shuffleCards'
		# 'click #shuffled-list': 'showShuffledList'

	render: ->
		@$el.html @template()
		@ul = @el.firstElementChild

		app.registry.journeyCollection.each (journey) =>
			$(@ul).append @itemTemplate({ name: journey.id })


	initialize: ->
		# _.bindAll @
		# app.registry.journeyCollection
		# _.bindAll(this, 'render')

		# @render()

app.JourneysView = JourneysView