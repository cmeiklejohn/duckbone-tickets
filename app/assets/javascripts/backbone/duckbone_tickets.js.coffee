#= require_self
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

# Create the top level namespaces. Rails suggests that this is the same as the
# application name, but that's verbose isn't it?
window.Tickets =
  models: {}
  views: {}

# Create base classes for models, collections, and views.
# Include only those Duckbone mixins that we are using.

class Tickets.ModelBase extends Backbone.Model

Duckbone.include(Tickets.ModelBase.prototype,
  Duckbone.AssociableModel, Duckbone.ModelHelpers
)

# Use useful whitepace stripping on string attributes
Tickets.ModelBase.prototype.stripWhitespaceOnSet();

class Tickets.CollectionBase extends Backbone.Collection

Duckbone.include(Tickets.CollectionBase.prototype, Duckbone.CollectionHelpers)

class Tickets.ViewBase extends Backbone.View

Duckbone.include(Tickets.ViewBase.prototype,
  Duckbone.TemplateableView,
  Duckbone.BindableView
)

class Tickets.FormViewBase extends Tickets.ViewBase

Duckbone.include(Tickets.FormViewBase.prototype, Duckbone.EditableView)
