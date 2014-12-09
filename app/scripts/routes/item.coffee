'use strict';

class HNThread.Routers.Item extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    @item = new HNThread.Models.Item(id:8831)
    @item.fetch()
    # console.log @item