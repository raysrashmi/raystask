class App.Routers.RaystaskRouter extends Backbone.Router
  routes:
    '':'index'

  index: ->
    tasksView = new App.Views.Tasks({collection: App.Alltasks})
    $("#container").html(tasksView.render())

  new: ->
    newTask = new App.Views.NewTask()
    $("#container").html(newTask.render())
