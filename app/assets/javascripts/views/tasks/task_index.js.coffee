class App.Views.Tasks extends Backbone.View
  template: JST['tasks/index']
  
  events :
    'submit': 'newTask'

  render: ->
    @$el.html(@template(tasks: @collection))

  renderTask: (task) =>
    taskView = new App.Views.TaskView(model: task, tagName: 'li')
    @$('.tasks').append(taskView.render().el)

  newTask: ->
    new_task = new App.Models.Task
    new_task.set({title: $('.task-title').val()})
    new_task.save()
    Backbone.history.navigate('/')
    

