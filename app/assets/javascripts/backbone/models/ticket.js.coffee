
class Tickets.Ticket extends Tickets.ModelBase

  urlRoot: '/tickets'

  # Use Duckbone.AssociableModel to create owner and comments associations
  initialize: () ->
    this.hasOne (
      owner: { model: Tickets.User } )
    this.hasMany (
      comments: { collection: Tickets.CommentsCollection, belongsTo: 'ticket' } )

  isOpen: () ->
    @get('status') == 'open'

  isClosed: () ->
    @get('status') == 'closed'


class Tickets.TicketsCollection extends Tickets.CollectionBase

  model: Tickets.Ticket
  url: '/tickets'