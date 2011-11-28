
class Tickets.Comment extends Tickets.ModelBase

  # Use enhanced urlRoot to return a route to the nested resource
  urlRoot: () ->
    '/tickets/' + @get('ticket_id') + '/comments'

  # Define associations in initialize
  initialize: () ->
    @hasOne(
      ticket: {model: Tickets.Ticket}
    )

  prettyTimeAgo: () ->
    Duckbone.helpers.dateToPrettyTimeAgo new Date(@get('created_at'))

class Tickets.CommentsCollection extends Tickets.CollectionBase

  model: Tickets.Comment
  url: () ->
    '/tickets/' + @ticket.id + '/comments'