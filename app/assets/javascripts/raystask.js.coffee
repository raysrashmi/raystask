window.Raystask =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @allTasks = [
      {title: 'Task 1'}
      {title: 'Task 2'}
      {title: 'Task 3'}
    ]
    new  @Routers.RaystaskRouter
    Backbone.history.start({pushState: true})

window.App = window.Raystask

$(document).ready ->
  Raystask.initialize()
