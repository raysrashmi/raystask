window.Raystask =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @Alltasks =  new @Collections.Tasks(@tasksJson)
    new  @Routers.RaystaskRouter
    Backbone.history.start({pushState: true})

window.App = window.Raystask

$(document).ready ->
  Raystask.initialize()
