class App.Routers.RaystaskRouter extends Backbone.Router
  routes:
    '':'index'
    'tasks/new': 'new'

  index: ->
    allTasks = new App.Collections.Tasks
    allTasks.fetch().done =>
      tasksView = new App.Views.Tasks({collection: allTasks})
      $("#container").html(tasksView.render())

  new: ->
    newTask = new App.Views.NewTask()
    $("#container").html(newTask.render())
