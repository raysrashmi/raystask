class App.Routers.RaystaskRouter extends Backbone.Router
  routes:
    '':'index'
    'tasks/new': 'new'

  index: ->
    tasksView = new App.Views.Tasks({collection: App.Alltasks})
    $("#container").html(tasksView.render())

  new: ->
    newTask = new App.Views.NewTask()
    $("#container").html(newTask.render())
