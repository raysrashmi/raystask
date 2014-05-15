class App.Views.Tasks extends Backbone.View
  PENDING_KLASS='.pending-tasks'
  COMPLETED_KLASS='.completed-tasks'

  initialize: ->
    @collection.on('add', @renderTask, this)
    @collection.on('reset', @render, this)
    
  template: JST['tasks/index']
  
  events :
    'submit': 'newTask'
    'click .complete' :'updateTask'

  render: ->
    completed_tasks = @collection.where({completed: true})
    pending_tasks = @collection.where({completed: false})
    @$el.html(@template({completed_tasks: completed_tasks, pending_tasks: pending_tasks}))

  renderTask: (task) =>
    taskView = new App.Views.TaskView(model: task, tagName: 'li')
    $(PENDING_KLASS).prepend(taskView.render().el)

  newTask: ->
    task_title = $('.task-title').val()
    if task_title
      new_task = new App.Models.Task({title: task_title})
      new_task.save()
      @collection.add(new_task)
      $('.task-title').val('')
    false
    
  updateTask: (e)->
    current_task = e.currentTarget
    task = @collection.get($(current_task).attr('id'))
    task.set({completed:  current_task.checked})
    task.save()
    if task.get('completed')
      $(COMPLETED_KLASS).prepend($("li##{task.get('id')}"))
    else
      $(PENDING_KLASS).prepend($("li##{task.get('id')}"))

