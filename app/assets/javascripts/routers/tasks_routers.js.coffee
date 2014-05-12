class App.Routers.RaystaskRouter extends Backbone.Router
  routes:
    '':'index'
    'tasks/:id':'show'

  index: ->
    tasksView = new App.Views.Tasks({collection: App.allTasks})    
    $("#container").html(tasksView.render())

  show:  (id) ->
    alert("Its show #{id}")
