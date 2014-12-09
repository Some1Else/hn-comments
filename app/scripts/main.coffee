window.HNThread =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    'use strict'

    @router = new HNThread.Routers.Item 
    Backbone.history.start(pushtate: true)

    console.log 'init'

$ ->
  'use strict'
  HNThread.init();
