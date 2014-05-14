class App.Views.Tasks extends Backbone.View
  tasgName: 'ul'
  template: JST['tasks/index']

  render: ->
    @$el.html(@template(tasks: @collection))

  renderTask: (task) =>
    taskView = new App.Views.TaskView(model: task, tagName: 'li')
    @$('.tasks').append(taskView.render().el)

