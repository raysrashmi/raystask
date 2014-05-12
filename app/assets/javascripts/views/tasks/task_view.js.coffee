class Raystask.TaskView extends Backbone.View
  tagName: 'li'
  className: 'task'
  template: _.template('<dl><dt><%= title %></dl></dt>' )
  render: ->
    this.$el.html(this.template(this.model.toJSON()))
