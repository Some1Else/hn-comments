'use strict';

class HNThread.Models.Item extends Backbone.Firebase.Model

  urlRoot: "https://hacker-news.firebaseio.com/v0/item"
  autoSync: false

  parse: (response, options) ->
    response = _.extend({kids: []}, response)

    # only fetch first level comments
    if response.type is 'story'
      kids = []
      
      for kid_id in response.kids
        kid = new HNThread.Models.Item(id: kid_id)
        kid.fetch()

        kids.push kid

      response.kids = kids

    response