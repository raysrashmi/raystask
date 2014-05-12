window.Raystask =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new  @Routers.RaystaskRouter
    Backbone.history.start({pushState: true})

window.App = window.Raystask

$(document).ready ->
  Raystask.initialize()
