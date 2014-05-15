class App.Views.Tasks extends Backbone.View

  initialize: ->
    @collection.on('add', @renderTask, this)
    @collection.on('reset', @render, this)
    
  template: JST['tasks/index']
  
  events :
    'submit': 'newTask'

  render: ->
    @$el.html(@template(tasks: @collection))

  renderTask: (task) =>
    taskView = new App.Views.TaskView(model: task, tagName: 'li')
    @$('.tasks').append(taskView.render().el)

  newTask: ->
    task_title = $('.task-title').val()
    if task_title
      new_task = new App.Models.Task
      new_task.set({title: task_title})
      new_task.save()
      @collection.add(new_task)
      $('.task-title').val('')
    false
