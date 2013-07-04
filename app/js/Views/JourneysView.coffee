class JourneysView extends Backbone.View

	# el: '#journeys'
	template: JST['app/templates/JourneysView.us']
	itemTemplate: JST['app/templates/JourneyItem.us']

	events: 
		'click li.journey': 'openCardsView'
		'tap li.journey': 'openCardsView'

	initialize: ->
		_.bindAll @, 'loadView'
		app.on 'journey', @loadView

	render: ->
		app.registry.cards.remove()
		this.setElement @template()
		$('section').html @el

		@ul = @el.firstElementChild
		fragment = document.createDocumentFragment()

		app.registry.journeyCollection.each (journey) =>
			guessed = _.reduce(journey.get('guessed'), (memo, num) -> memo + num)
			item = $ @itemTemplate
				id: journey.get 'id'
				date: @formatDate(journey.get 'timestamp')
				guessed: "#{guessed} / #{journey.get('guessed').length}"
				percent: Math.round(guessed / journey.get('guessed').length * 10000) / 100
			fragment.insertBefore item[0], fragment.firstChild
			journey.on 'remove', -> item.remove()
		$(@ul).append fragment

	loadView: (journey) ->
		unless journey
			$(document.body).removeClass().addClass 'journeys'
			@render()

	formatDate: (timestamp) ->
		date = new Date(timestamp)
		dateString = ('0' + date.getDate()).slice(-2) + '/' + ('0' + (date.getMonth()+1)).slice(-2) + '/' + date.getFullYear()
		hourString = ('0' + date.getHours()).slice(-2) + ':' + ('0' + (date.getMinutes()+1)).slice(-2)
		"#{dateString} - #{hourString}"

	openCardsView: (e) ->
		# prevent firing multiple events if touch is enabled
		return false if e.type is 'click' and typeof window.ontouchstart != 'undefined' 
		# route to the CardsView
		app.registry.router.navigate "journey/#{e.currentTarget.id}", trigger: true

app.JourneysView = JourneysView