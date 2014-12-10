window.HNThread =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    'use strict'

    @app = new HNThread.Routers.App 
    Backbone.history.start(pushState: false)

    console.log 'init'

$ ->
  'use strict'
  HNThread.init();
