
describe "Cards View", ->

	beforeEach -> affix 'section'

	Given -> @cards = new app.CardsView
	Given -> @journeys = app.registry.journeyCollection
	Given -> @route = spyOn app.registry.router, 'navigate'

	describe "Renders template elements", ->

		Given -> @removeJourneysView = spyOn app.registry.journeys, 'remove'
		When -> @journeys.add {}
		When -> @cards.render(@journeys.at(0))
		Then -> expect(@removeJourneysView).toHaveBeenCalled()
		Then -> expect(@cards.$el.find('#cards')).toBeTruthy()
		Then -> expect(@cards.$el.find('li').length).toEqual(app.cards.length)
		Then -> expect(@cards.$el.find('#counter').text()).toContain('1 / 48')
		Then -> expect(@cards.swipe).toBeDefined()
