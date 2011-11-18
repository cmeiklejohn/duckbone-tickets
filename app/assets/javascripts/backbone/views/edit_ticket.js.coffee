
class Tickets.EditTicketView extends Tickets.FormViewBase

  templateName: 'edit_tickets'

  fields: {}

  # This is a top level, routeable page view, so define it's @routeName, and @routeAction

  @routeName: 'editTicket'

  @routeAction: ->
    Tickets.app.loadView(Tickets.EditTicketView)