
class Tickets.NewTicketView extends Tickets.FormViewBase

  templateName: 'new_ticket'

  fields:
    kind:
      required: true
      selectOptions:
        'feature': 'Feature',
        'bug': 'Bug',
        'chore': 'Chore'
    title:
      required: true
      elAttributes:
        size: "60"
        placeholder: "What's gone wrong?"
    description:
      elAttributes:
        rows: "3"
        cols: "60"
        placeholder: "Describe the ticket in detail..."

  events:
    'click a.close': 'close'

  close: () =>
    $(@el).slideUp(400, () =>
      @remove()
    )

