'use strict';

class HNThread.Views.Comment extends Backbone.View
  template: JST['app/scripts/templates/comment.ejs']

  initialize: () ->
    @listenTo @model, 'change', @render

  render: () ->
    @$el.html @template(@model.toJSON())

    # if @model.get('kids')?

    #   for kid in @model.get('kids')
    #     if (kid instanceof HNThread.Models.Item)
    #       kid_view = new HNThread.Views.Comment(model: kid)
    #       @$el.append kid_view.render().el

    @ 
