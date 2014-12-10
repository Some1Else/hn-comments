'use strict';

class HNThread.Views.Story extends Backbone.View
  template: JST['app/scripts/templates/story.ejs']

  initialize: () ->
    @listenTo @model, 'change', @render

  render: () ->
    @$el.html @template(@model.toJSON())

    if @model.get('kids')?

      for kid in @model.get('kids')
        kid_view = new HNThread.Views.Comment(model: kid)
        @$el.append kid_view.render().el

    @