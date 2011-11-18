
class Tickets.Comment extends Tickets.ModelBase

  # Use enhanced urlRoot to return a route to the nested resource
  urlRoot: () ->
    '/tickets/' + @ticket.id + '/comments'

  # Define associations in initialize
  initialize: () ->
    @hasOne(
      ticket: {model: Tickets.Ticket}
    )

class Tickets.CommentsCollection extends Tickets.CollectionBase

  model: Tickets.Comment
  url: '/comments'