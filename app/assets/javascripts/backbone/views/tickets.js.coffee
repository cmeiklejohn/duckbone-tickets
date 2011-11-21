
class Tickets.TicketsView extends Tickets.ViewBase

  templateName: 'tickets'

  # createChildren is called by the view lifecycle.
  # It is used to establish all of the subviews needed by a view.
  # Here, we create the PageableView that shows all of the tickets.
  createChildren: () ->
    @options.status ?= 'open'
    @collection.setParam('status', @options.status)
    @collection.fetchPage(1)
    @pagedTickets = new PagedTicketsView(
      collection: @collection
    )
    $(@el).append(@pagedTickets.el)

  events:
    'click a.open_tickets': 'showOpenTickets',
    'click a.closed_tickets': 'showClosedTickets',
    'click a.new_ticket': 'showNewTicket'

  showOpenTickets: (e) ->
    e.preventDefault()
    @collection.setParam('status', 'open')
    @collection.fetchPage(1)
    @newTicketView.remove() if @newTicketView

  showClosedTickets: (e) ->
    e.preventDefault()
    @collection.setParam('status', 'closed')
    @collection.fetchPage(1)
    @newTicketView.remove() if @newTicketView

  showNewTicket: (e) ->
    e.preventDefault()
    @newTicketView.remove() if @newTicketView
    model = new Tickets.Ticket()
    @newTicketView = new Tickets.NewTicketView({model: model})
    @newTicketView.afterSaveDestination = {collection: @collection}
    @$('.new_ticket_container').append(@newTicketView.el)

  # This is a top level page view, so define its @routeName and @routeAction

  @routeName: 'tickets'

  @routeAction: () ->
    Tickets.collections.tickets ?= new Tickets.TicketsCollection()
    Tickets.app.loadView(Tickets.TicketsView,
      collection: Tickets.collections.tickets
    )


# A PageableView to manage the list of tickets

class PagedTicketsView extends Backbone.View
  viewClass: Tickets.TicketView
  className: 'paged_tickets'

Duckbone.include(PagedTicketsView.prototype,
  Duckbone.PageableView, Duckbone.BindableView)

