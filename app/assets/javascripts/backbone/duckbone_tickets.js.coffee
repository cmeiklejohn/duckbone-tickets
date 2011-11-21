#= require_self
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

# Create the top level namespaces
# All classes are defined on the top level namespace, Tickets
# Tickets.models and Tickets.views objects are for keeping instances

window.Tickets ?= {}
window.Tickets.models ?= {}
window.Tickets.views ?= {}
window.Tickets.collections ?= {}

# Create base classes for models, collections, and views.
# Include only those Duckbone mixins that we are using.

class Tickets.ModelBase extends Backbone.Model

Duckbone.include(Tickets.ModelBase.prototype,
  Duckbone.AssociableModel,
  Duckbone.ModelHelpers,
  Duckbone.Syncable
)

class Tickets.CollectionBase extends Backbone.Collection

Duckbone.include(Tickets.CollectionBase.prototype,
  Duckbone.CollectionHelpers,
  Duckbone.Syncable)

class Tickets.ViewBase extends Backbone.View

Duckbone.include(Tickets.ViewBase.prototype,
  Duckbone.TemplateableView,
  Duckbone.BindableView
)

class Tickets.FormViewBase extends Tickets.ViewBase

Duckbone.include(Tickets.FormViewBase.prototype, Duckbone.EditableView)


# Bootstrap Application on Document Ready
# Creates the application, assigns the container, and starts the history
$ ->
  Tickets.app = new Tickets.Application()
  Tickets.app.setContainer($('section.main_content').get(0))
  Tickets.app.configureFlash(
    container: $('div.flash').get(0)
  )
  Tickets.app.bindNavigationBars()
  Backbone.history.start()