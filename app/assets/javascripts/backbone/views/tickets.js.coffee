
class Tickets.TicketsView extends Tickets.ViewBase

  templateName: 'tickets'

  # createChildren is called by the view lifecycle.
  # It is used to establish all of the subviews needed by a view.
  # Here, we create the PageableView that shows all of the tickets.
  createChildren: () ->
    @collection = new Tickets.TicketsCollection()
    @collection.fetch()
    pagedTickets = new PagedTicketsView(
      collection: @collection
    )
    $(@el).append(pagedTickets.el)

  # This is a top level page view, so define it's @routeName and @routeAction

  @routeName: 'tickets'

  @routeAction: () ->
    Tickets.app.loadView(Tickets.TicketsView)


# Internal

# A PageableView to manage the list of tickets

class PagedTicketsView extends Backbone.View
  viewClass: Tickets.TicketView

Duckbone.include(PagedTicketsView.prototype,
  Duckbone.PageableView, Duckbone.BindableView)

