nestCollection = (model, attributeName, nestedCollection) ->
  
  #setup nested references
  i = 0

  while i < nestedCollection.length
    model.attributes[attributeName][i] = nestedCollection.at(i).attributes
    i++
  
  #create empty arrays if none
  nestedCollection.bind "add", (initiative) ->
    model.attributes[attributeName] = []  unless model.get(attributeName)
    model.get(attributeName).push initiative.attributes

  nestedCollection.bind "remove", (initiative) ->
    updateObj = {}
    updateObj[attributeName] = _.without(model.get(attributeName), initiative.attributes)
    model.set updateObj

  nestedCollection

class Journey extends Backbone.Model

	initialize: ->
		@cards = nestCollection(this, 'cards', new app.CardCollection(this.get('cards')))
		# @cards.create _.shuffle(app.cards)

app.Journey = Journey