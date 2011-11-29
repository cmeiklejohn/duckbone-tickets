
class Tickets.UsersView extends Tickets.ViewBase

  templateName: 'users'

  # Create a model object, give it the global users collection,
  # before rendering for the first time
  beforeTwirl: () =>
    @model = { users: Tickets.collections.users }

  # This is a top level, routeable page view, so define it's @routeName, and @routeAction

  @routeName: 'users'

  @routeAction: (params) ->
    Tickets.app.loadView(Tickets.UsersView, {params: params})