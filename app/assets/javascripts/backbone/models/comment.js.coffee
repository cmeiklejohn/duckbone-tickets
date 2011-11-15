
class Tickets.Comment extends Tickets.ModelBase

  # Use enhanced urlRoot to return a route to the nested resource
  urlRoot: ->
    '/tickets/' + @ticket.id + '/comments'


class Tickets.CommentsCollection extends Tickets.CollectionBase

  model: Tickets.Comment
  url: '/comments'