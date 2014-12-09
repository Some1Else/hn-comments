'use strict';

class HNThread.Views.Item extends Backbone.View

  template: JST['app/scripts/templates/item.ejs']

  tagName: 'div'

  id: ''

  className: ''

  events: {}

  initialize: () ->
    @listenTo @model, 'change', @render

  render: () ->
    @$el.html @template(@model.toJSON())
