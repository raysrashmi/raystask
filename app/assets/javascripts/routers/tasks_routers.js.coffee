class App.Routers.RaystaskRouter extends Backbone.Router
  routes:
    '':'index'

  index: ->
    tasksView = new App.Views.Tasks({collection: App.Alltasks})
    tasksView.render()
    $("#container").html(tasksView.el)
