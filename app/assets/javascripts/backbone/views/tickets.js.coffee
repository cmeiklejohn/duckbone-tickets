
class Tickets.TicketsView extends Tickets.ViewBase

  templateName: 'tickets'

  # createChildren is called by the view lifecycle.
  # It is used to establish all of the subviews needed by a view.
  # Here, we create the PageableView that shows all of the tickets.
  createChildren: () =>
    @options.status ?= 'open'
    @collection.setParam('status', @options.status)
    @collection.fetchPage(1)
    @collection.bind('reset', @renderNotice, this)
    @pagedTickets = new PagedTicketsView(
      collection: @collection
    )
    $(@el).append(@pagedTickets.el)

  # If there is a saved search, then populate the input field
  afterInitialize: () =>
    @$('form.search input').val(@collection.params.q) if @collection.params.q

  # Render the notice of what kind of tickets we're viewing
  renderNotice: () =>
    notice = "#{@collection.totalCount} "
    notice += "open tickets " if @collection.params.status == "open"
    notice += "closed tickets " if @collection.params.status == "closed"
    notice += "matching #{@collection.params.q}" if @collection.params.q
    @$('div.ticket_notice').html(notice)

  events:
    'click a.open_tickets':    'showOpenTickets'
    'click a.closed_tickets':  'showClosedTickets'
    'click button.new_ticket': 'showNewTicket'
    'submit form.search':      'searchTickets'

  showOpenTickets: (e) =>
    e.preventDefault()
    @collection.setParam('status', 'open')
    @collection.fetchPage(1)
    @newTicketView.remove() if @newTicketView
    return false

  showClosedTickets: (e) =>
    e.preventDefault()
    @collection.setParam('status', 'closed')
    @collection.fetchPage(1)
    @newTicketView.remove() if @newTicketView
    return false

  showNewTicket: (e) =>
    e.preventDefault()
    @newTicketView.remove() if @newTicketView

    # Create a new ticket form. It will add the ticket to our collection when saved.
    # It will also remove itself neatly once it's saved.
    model = new Tickets.Ticket()
    @newTicketView = new Tickets.NewTicketView({model: model})
    @newTicketView.afterSaveDestination = {collection: @collection}
    @$('.new_ticket_container').append(@newTicketView.el)
    $(@newTicketView.el).hide().slideDown()

    @newTicketView.model.bind 'sync:success', =>
      $(@newTicketView.el).slideUp 400, () =>
        @newTicketView.remove()
        delete @newTicketView

    return false

  searchTickets: (e) =>
    e.preventDefault()
    @collection.setParam('q', $(@el).find('form.search input[name="q"]').val())
    @collection.fetchPage(1)
    $(@el).find('span.loading').fadeIn()
    @collection.bind 'sync:complete', =>
      $(@el).find('span.loading').fadeOut()
    return false

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

  # Hack in a loading spinner
  afterInitialize: () =>
    $(@el).append('<div class="loading"><img src="/assets/ajax_loader.gif"/></div>')
    @collection.bind('reset', () =>
      @$('div.loading').remove()
    )

Duckbone.include(PagedTicketsView.prototype,
  Duckbone.PageableView, Duckbone.BindableView)

