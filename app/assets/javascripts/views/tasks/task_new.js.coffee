class App.Views.TaskNew extends Backbone.View
  tagName: 'form'

  template: JST['tasks/new']

  events: ->
    'submit' :'saveTask'

  render: ->
    @$el.html(@template(task: @model))

  saveTask: (e)->
    task_title = $(e.currentTarget).find('input').val()
    @model.set({title: task_title})
    @model.save().done =>
      taskView = new App.Views.TaskView(model: @model, tagName: 'li', id: @model.get('id'))
      taskView.render()
      $(e.currentTarget).parent('li').replaceWith(taskView.el)
