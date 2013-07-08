
describe "Journeys View", ->

	beforeEach -> affix 'section'

	Given -> @journeysView = new app.JourneysView
	Given -> @journeys = app.registry.journeyCollection
	Given -> @route = spyOn app.registry.router, 'navigate'

	describe "Renders template elements", ->

		Given -> @removeCardsView = spyOn app.registry.cards, 'remove'
		When -> @journeys.reset()
		When -> @journeys.add {}
		When -> @journeysView.render()
		Then -> expect(@removeCardsView).toHaveBeenCalled()
		Then -> expect(@journeysView.$el.find('ul')).toBeTruthy()
		Then -> expect(@journeysView.$el.find('li').length).toEqual(1)

	describe "Remove Journey", ->

		When -> @journeysView.render()
		When -> @journeys.at(0).trigger 'remove'
		Then -> expect(@journeysView.$el.find('li').length).toBeFalsy()
