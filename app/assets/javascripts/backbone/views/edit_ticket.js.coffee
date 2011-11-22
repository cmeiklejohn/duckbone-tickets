
class Tickets.EditTicketView extends Tickets.FormViewBase

  templateName: 'edit_ticket'

  fields:
    kind:
      selectOptions: Tickets.Ticket.kinds
    title:
      elAttributes:
        size: "60"
        placeholder: "What's gone wrong?"
    description:
      elAttributes:
        rows: "3"
        cols: "60"
        placeholder: "Describe the ticket in detail..."
    severity:
      selectOptions: Tickets.Ticket.severities
    owner_id:
      selectOptions: ->
        Tickets.collections.users.toSelectOptions('full_name', true)

  modelSyncEvents:
    'sync:success': 'modelSaved'

  modelSaved: () =>
    Tickets.app.navigate('tickets/' + @model.id, true)

  # This is a top level, routeable page view, so define its @routeName, and @routeAction

  @routeName: 'editTicket'

  @routeAction: (id) ->
    model = new Tickets.Ticket(
      id: id
    )
    model.fetch(
      success: () ->
        Tickets.app.loadView(Tickets.EditTicketView, {model: model})
    )
