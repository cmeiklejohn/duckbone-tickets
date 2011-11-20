
class Tickets.NewTicketView extends Tickets.FormViewBase

  templateName: 'new_ticket'

  fields:
    kind:
      selectOptions:
        'feature': 'Feature',
        'bug': 'Bug',
        'chore': 'Chore'
    title:
      elAttributes:
        size: "60"
        placeholder: "What's gone wrong?"
    description:
      elAttributes:
        rows: "3"
        cols: "60"
        placeholder: "Describe the ticket in detail..."

  modelSyncEvents:
    'sync:success': 'remove'