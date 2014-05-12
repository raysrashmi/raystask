class App.Routers.RaystaskRouter extends Backbone.Router
  routes:
    '':'index'
    'tasks/:id':'show'

  index: ->
    #taskList = new App.Collections.Tasks()
    #taskList.fetch()
    #console.log(taskList.length)
    #tasksView = new App.Views.Tasks({collection: taskList})
    tasksView = new App.Views.Tasks({collection: App.allTasks})    
    $("#container").html(tasksView.render())

  show:  (id) ->
    alert("Its show #{id}")
