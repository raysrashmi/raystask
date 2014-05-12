class App.Views.Tasks extends Backbone.View
  tasgName: 'ul'
  template: JST['tasks/index']

  render: ->
    @$el.html(@template(tasks: @collection))
