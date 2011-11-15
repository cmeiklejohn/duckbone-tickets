
class Tickets.User extends Tickets.ModelBase

  urlRoot: '/users'


class Tickets.UsersCollection extends Tickets.CollectionBase

  model: Tickets.User
  url: '/users'