class App.Views.TaskView extends Backbone.View
  className: 'task'

  template: JST['tasks/show']

  render: ->
    @$el.html(@template(task: @model))
    this
