
class Tickets.NewTicketView extends Tickets.FormViewBase

  templateName: 'new_ticket'

  fields: {}

  @routeName: 'newTicket'

  @routeAction: ->
    Tickets.app.loadView(Tickets.NewTicketView)