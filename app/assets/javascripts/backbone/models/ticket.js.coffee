
class Tickets.Ticket extends Tickets.ModelBase

  urlRoot: '/tickets'

  # Use Duckbone.AssociableModel to create owner and comments associations
  initialize: () ->
    this.hasOne (
      owner: { model: Tickets.User } )
    this.hasMany (
      comments: { collection: Tickets.CommentsCollection, belongsTo: 'ticket' } )

  defaults:
    severity: 'minor'
    status: 'open'

  isOpen: () ->
    @get('status') == 'open'

  isClosed: () ->
    @get('status') == 'closed'


class Tickets.TicketsCollection extends Tickets.CollectionBase

  model: Tickets.Ticket
  url: '/tickets'

  comparator: (m) ->
    new Date(m.get('created_at')).getTime() * -1

Duckbone.include(Tickets.TicketsCollection.prototype, Duckbone.PageableCollection)