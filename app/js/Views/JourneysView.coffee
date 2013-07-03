class JourneysView extends Backbone.View

	# el: '#journeys'
	template: JST['app/templates/JourneysView.us']
	itemTemplate: JST['app/templates/JourneyItem.us']

	events: 
		# 'mousedown li.journey': 'openCardsView'
		'touchstart li.journey': 'openCardsView'

	formatDate: (timestamp) ->
		date = new Date(timestamp)
		dateString = ('0' + date.getDate()).slice(-2) + '/' + ('0' + (date.getMonth()+1)).slice(-2) + '/' + date.getFullYear()
		hourString = ('0' + date.getHours()).slice(-2) + ':' + ('0' + (date.getMinutes()+1)).slice(-2)
		"#{dateString} - #{hourString}"

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
			fragment.appendChild item[0]
			journey.on 'remove', -> item.remove()
		$(@ul).append fragment

	openCardsView: (e) ->
		id = e.target.id or $(e.target).parents('li[id]').attr('id')
		app.registry.router.navigate "journey/#{id}", trigger: true

app.JourneysView = JourneysView