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
    'click .remove' :'removeTask'

  render: ->
    @$el.html(@template())
    @renderAll()
    this

  renderAll: ->
    completed_tasks = @collection.where({completed: true})
    pending_tasks = @collection.where({completed: false})
    @renderTask(task,COMPLETED_KLASS) for task in completed_tasks 
    @renderTask(task, PENDING_KLASS) for task in pending_tasks 

  renderTask: (task, container_klass) =>
    taskView = new App.Views.TaskView(model: task, tagName: 'li', id: task.get('id'))
    taskView.render()
    @$(container_klass).prepend(taskView.el)
    
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
    task.save().done ->
      if task.get('completed')
        $(COMPLETED_KLASS).prepend($("li##{task.get('id')}"))
      else
        $(PENDING_KLASS).prepend($("li##{task.get('id')}"))

  removeTask: (e) ->
    current_task = e.currentTarget
    task = @collection.get($(current_task).parents("li").attr('id'))
    task.destroy().done ->
      $("li##{task.get('id')}").remove()

