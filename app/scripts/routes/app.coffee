'use strict';

class HNThread.Routers.App extends Backbone.Router
  routes:
    '': 'index'
    'story/:story_id': 'story'
    'no_story': 'no_story'

  index: ->
    $('#results').empty()

  story: (story_id) ->
    @story = new HNThread.Models.Item(id: story_id)
    
    view = new HNThread.Views.Story(el: $('#results'), model: @story)
    @swap(view)
    @query_view.update(@story)

    @story.fetch()

  no_story: ->
    view = new HNThread.Views.NoStory(el: $('#results'))
    @swap(view)
  
  init_query: ->
    @query = new HNThread.Models.Query()
    @query_view = new HNThread.Views.Query(model: @query, el: $('#query'), router: @)
    @query_view.render()

  initialize: () ->
    @init_query()

  swap: (view) ->
    view.render()

    @view = view