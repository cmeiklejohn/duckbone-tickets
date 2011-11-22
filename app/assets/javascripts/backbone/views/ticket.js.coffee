
# The view for a single row ticket display in the tickets view

class Tickets.TicketView extends Tickets.ViewBase

  templateName: 'ticket'
  tagName: 'li'

  afterInitialize: () ->
    @render()
    @weakBindToModel('change', @render)

  # Use bindings and render piece-meal for efficiency

  render: () =>
    if this.model.isOpen()
      @$('button.complete').show()
      @$('button.reopen').hide()
    else
      @$('button.complete').hide()
      @$('button.reopen').show()

  attributeChanges:
    'title':    'span.title_val',
    'severity': 'span.severity_val',
    'status':   'span.status_val'
    'kind':     'span.kind_val'

  events:
    'click a.show':          'showTicket'
    'click button.edit':     'editTicket'
    'click button.complete': 'completeTicket',
    'click button.reopen':   'reopenTicket',
    'click button.destroy':  'destroyTicket'

  showTicket: (e) ->
    e.preventDefault()
    Tickets.app.loadView(Tickets.ShowTicketView,
      model: @model
    )
    Tickets.app.navigate('tickets/' + @model.id, false)

  editTicket: (e) ->
    e.preventDefault()
    Tickets.app.loadView(Tickets.EditTicketView,
      model: @model
    )
    Tickets.app.navigate('tickets/' + @model.id + '/edit', false)

  completeTicket: (e) ->
    e.preventDefault()
    @model.save(
      status: 'closed'
    )

  reopenTicket: (e) ->
    e.preventDefault()
    @model.save(
      status: 'open'
    )

  destroyTicket: (e) ->
    e.preventDefault()
    @model.destroy()
    $(@el).fadeOut(400, () =>
      @remove()
    )


# The view for a full page ticket view

class Tickets.ShowTicketView extends Tickets.TicketView

  templateName: 'show_ticket'
  tagName: 'div'

  # Create the comments list view
  createChildren: () =>
    @commentsList = new Tickets.CommentsListView(
      el: $(@el).find('div.comments_block').get(0)
      collection: @model.comments
    )
    @createNewCommentView()

  # Create a new comment form that removes and regenerates itself
  createNewCommentView: () =>
    @newCommentView = new Tickets.NewCommentView
      model: new Tickets.Comment
        ticket_id: @model.id
    @newCommentView.afterSaveDestination = { collection: @model.comments }
    @$('div.comments_block').append(@newCommentView.el)
    @newCommentView.model.bind 'sync:success', () =>
      @newCommentView.remove()
      @createNewCommentView()

  # We're already on the page, so do nothing
  showTicket: (e) ->
    e.preventDefault()

  # Navigate away after destroying
  destroyTicket: (e) ->
    e.preventDefault()
    @model.destroy()
    $(@el).fadeOut(400, () =>
      Tickets.app.navigate('tickets', true)
    )

  @routeName: 'ticket'

  # The route action is only used when we navigate directly here on the first page view
  # If we have the ticket data already, then we should just load the view directly

  @routeAction: (id) ->
    model = new Tickets.Ticket(
      id: id
    )
    model.fetch(
      success: () ->
        Tickets.app.loadView(Tickets.ShowTicketView, {model: model})
    )
