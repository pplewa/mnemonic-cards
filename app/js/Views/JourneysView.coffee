class JourneysView extends Backbone.View

	# el: '#journeys'
	template: JST['app/templates/JourneysView.us']
	itemTemplate: JST['app/templates/JourneyItem.us']

	events: 
		'click li': 'openCardsView'

	formatDate: (timestamp) ->
		date = new Date(timestamp)
		"#{date.getDate()} / #{date.getMonth()} / #{date.getFullYear()} - #{date.getHours()}:#{date.getMinutes()}"

	render: ->
		# @$el.html @template()
		this.setElement @template()
		$('section').html @el

		@ul = @el.firstElementChild


		app.registry.journeyCollection.each (journey) =>
			guessed = _.reduce(journey.get('guessed'), (memo, num) -> memo + num)
			$(@ul).append @itemTemplate
				id: journey.get 'id'
				date: @formatDate(journey.get 'timestamp')
				guessed: "#{guessed} / #{journey.get('guessed').length}"
				percent: Math.round(guessed / journey.get('guessed').length * 10000) / 100

	# initialize: ->
		# this.setElement @template()

	openCardsView: (e) ->
		app.trigger 'navigate', 'journey/' + e.target.id, trigger: true

app.JourneysView = JourneysView