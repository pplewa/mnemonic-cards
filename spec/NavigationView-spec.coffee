
describe "Navigation View", ->

	beforeEach -> affix 'nav'

	Given -> @navigation = new app.NavigationView
	Given -> @journeys = app.registry.journeyCollection
	Given -> @route = spyOn app.registry.router, 'navigate'
	Given -> @trigger = trigger: true

	describe "Renders template elements", ->

		When -> @buttons = $(@navigation.el).find('button')
		Then -> expect(@buttons.length).toEqual(4)

		When -> @buttons.ids = _.map @buttons, (b) -> b.id
		Then -> expect(@buttons.ids).toEqual(['addJourney', 'clearJourneys', 'showJourneys', 'guessed'])

	describe "Click Removes Journeys", ->

		Given -> spyOn(window, 'confirm').andReturn true
		When -> @journeys.add {}
		When -> runs -> @navigation.clearJourneys()
		When -> waits(1)
		Then -> runs -> expect(@journeys.length).toBeFalsy()

	describe "Click Add Journeys", ->

		Given -> spyOn(window, 'confirm').andReturn true
		When -> @navigation.addJourney()
		Then -> expect(@journeys.length).toBe(1)
		And -> @navigation.clearJourneys()

	describe "Click Show Journeys", ->

		When -> @navigation.showJourneys()
		Then -> expect(@route).toHaveBeenCalledWith('', @trigger)

	describe "Click Guessed", ->

		Given -> @guesed = spyOn app, 'trigger'
		When -> @navigation.guessed()
		Then -> expect(@guesed).toHaveBeenCalledWith('guessed', @trigger)