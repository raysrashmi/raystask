class App.Views.NewTask extends Backbone.View
  template: JST['tasks/new']
  tagName: 'form'

  events:
    'submit': 'addtask'

  render: ->
    @$el.html(@template)

  addtask: ->
    new_task = new App.Models.Task
    new_task.set({title: $('.task-title').val()})
    new_task.save()
    Backbone.history.navigate('/', trigger: true)
    false

