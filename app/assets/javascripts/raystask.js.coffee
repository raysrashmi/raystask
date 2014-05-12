window.Raystask =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @allTasks = new App.Collections.Tasks
    @allTasks.fetch().done =>
      new  @Routers.RaystaskRouter
      Backbone.history.start({pushState: true})

window.App = window.Raystask

$(document).ready ->
  Raystask.initialize()
