
# Paginated Users List

class Tickets.UsersView extends Tickets.ViewBase

  templateName: 'users'

  # This is a top level, routeable page view, so define it's @routeName, and @routeAction

  @routeName: 'users'

  @routeAction: ->
    Tickets.app.loadView(Tickets.UsersView)