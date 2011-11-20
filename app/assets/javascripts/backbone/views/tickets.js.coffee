
class Tickets.TicketsView extends Tickets.ViewBase

  templateName: 'tickets'

  # createChildren is called by the view lifecycle.
  # It is used to establish all of the subviews needed by a view.
  # Here, we create the PageableView that shows all of the tickets.
  createChildren: () ->
    @collection = new Tickets.TicketsCollection()
    @collection.setParam('status', 'open')
    @collection.fetchPage(1)
    @pagedTickets = new PagedTicketsView(
      collection: @collection
    )
    $(@el).append(@pagedTickets.el)

  events:
    'click a.open_tickets': 'showOpenTickets',
    'click a.closed_tickets': 'showClosedTickets'

  showOpenTickets: (e) =>
    e.preventDefault()
    @collection.setParam('status', 'open')
    @collection.fetchPage(1)

  showClosedTickets: (e) =>
    e.preventDefault()
    @collection.setParam('status', 'closed')
    @collection.fetchPage(1)


  # This is a top level page view, so define its @routeName and @routeAction

  @routeName: 'tickets'

  @routeAction: () ->
    Tickets.app.loadView(Tickets.TicketsView)


# Internal

# A PageableView to manage the list of tickets

class PagedTicketsView extends Backbone.View
  viewClass: Tickets.TicketView

Duckbone.include(PagedTicketsView.prototype,
  Duckbone.PageableView, Duckbone.BindableView)

