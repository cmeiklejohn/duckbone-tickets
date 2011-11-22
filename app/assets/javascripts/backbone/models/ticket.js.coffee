
class Tickets.Ticket extends Tickets.ModelBase

  urlRoot: '/tickets'

  # Use Duckbone.AssociableModel to create owner and comments associations
  initialize: () ->
    this.hasOne (
      owner: { model: Tickets.User } )
    this.hasMany (
      comments: { collection: Tickets.CommentsCollection, belongsTo: 'ticket' } )
    @bind 'change:owner_id', () =>
      @setOwner Tickets.collections.users.get(@get('owner_id'))

  defaults:
    severity: 'minor'
    status: 'open'

  isOpen: () ->
    @get('status') == 'open'

  isClosed: () ->
    @get('status') == 'closed'

  @severities:
    'minor': 'Minor'
    'major': 'Major'
    'ducky cry': 'Ducky Cry'

  @kinds:
    'feature': 'Feature'
    'bug': 'Bug'
    'chore': 'Chore'

class Tickets.TicketsCollection extends Tickets.CollectionBase

  model: Tickets.Ticket
  url: '/tickets'

  comparator: (m) ->
    return new Date(m.get('created_at')).getTime() * -1

Duckbone.include(Tickets.TicketsCollection.prototype, Duckbone.PageableCollection)