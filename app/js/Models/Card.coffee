class Card extends Backbone.Model

	defaults:
		label: ''
		value: 0
		guessed: false

	toggle: ->
        @save guessed: !@get('guessed')

app.Card = Card