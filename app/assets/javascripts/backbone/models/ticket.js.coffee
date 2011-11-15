
class Tickets.Ticket extends Tickets.ModelBase

  urlRoot: '/tickets'

  # Use Duckbone.AssociableModel to create owner and comments associations
  initialize: ->
    this.hasOne (
      owner: { model: Tickets.User } )
    this.hasMany (
      comments: { collection: Tickets.TicketsCollection } )


class Tickets.TicketsCollection extends Tickets.CollectionBase

  model: Tickets.Ticket
  url: '/tickets'