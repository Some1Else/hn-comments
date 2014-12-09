'use strict';

class HNThread.Models.Item extends Backbone.Firebase.Model

  urlRoot: "https://hacker-news.firebaseio.com/v0/item"
  autoSync: false

  initialize: () ->

  defaults: {}

  validate: (attrs, options) ->

  parse: (response, options) ->
    if response.type is 'story'
      if response.kids?.length > 0
        kids = []

        for kid_id in response.kids
          kid = new HNThread.Models.Item(id: kid_id)
          kid.fetch()
          kids.push kid

        response.kids = kids

    response
