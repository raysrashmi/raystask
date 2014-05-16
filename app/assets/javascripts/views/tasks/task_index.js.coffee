class App.Views.Tasks extends Backbone.View
  PENDING_KLASS='.pending-tasks'
  COMPLETED_KLASS='.completed-tasks'

  initialize: ->
    @collection.on('add', @renderPendingTask, this)

  template: JST['tasks/index']

  events :
    'submit': 'newTask'
    'click .complete' :'updateState'
    'click .remove' :'removeTask'
    'dblclick li.task' :'editTaskTitle'

  render: ->
    @$el.html(@template())
    @renderAll()
    this

  renderAll: ->
    completed_tasks = @collection.where({completed: true})
    pending_tasks = @collection.where({completed: false})
    @renderCompletedTask(task) for task in completed_tasks
    @renderPendingTask(task) for task in pending_tasks

  renderTask: (task) =>
    taskView = new App.Views.TaskView(model: task, tagName: 'li', id: task.get('id'))
    taskView.render()
    taskView.el

  renderPendingTask: (task) => 
    @$(PENDING_KLASS).prepend(@renderTask(task))

  renderCompletedTask: (task) => 
    @$(COMPLETED_KLASS).prepend(@renderTask(task))

  newTask: ->
    task_title = $('.task-title').val()
    if task_title
      new_task = new App.Models.Task({title: task_title})
      new_task.save().done =>
        new_task.set(id: new_task['id'])
        @collection.add(new_task)
        $('.task-title').val('')
    false
    
  updateState: (e)->
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

  editTaskTitle: (e)->
    task = @collection.get($(e.currentTarget).attr('id'))
    newTask = new App.Views.TaskNew(model: task)
    newTask.render()
    $(e.currentTarget).html(newTask.el)

