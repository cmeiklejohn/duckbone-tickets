
class Tickets.CommentView extends Tickets.ViewBase

  templateName: 'comment'


class Tickets.CommentsListView extends Backbone.View

  viewClass: Tickets.CommentView

Duckbone.include(Tickets.CommentsListView.prototype, Duckbone.ListableView)