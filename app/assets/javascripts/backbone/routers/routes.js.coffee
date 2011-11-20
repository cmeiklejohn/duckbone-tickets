
class Tickets.Application extends Backbone.Router

  initialize: (options) ->

    # Create the routes on the router
    @mapRoutes(
      '*default':          Tickets.TicketsView,
      'tickets/:id':       Tickets.ShowTicketView,
      'tickets/:id/edit':  Tickets.EditTicketView,
      'users':             Tickets.UsersView
    )


Duckbone.include(Tickets.Application.prototype,
  Duckbone.RouteableApplication,
  Duckbone.FlashableView)