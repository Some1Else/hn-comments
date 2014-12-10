'use strict';

class HNThread.Routers.App extends Backbone.Router
  routes:
    '': 'index'
    'story/:story_id': 'story'
    'no_story': 'no_story'

  index: ->
    @query = new HNThread.Models.Query()

    view = new HNThread.Views.Query(model: @query, el: $('#query'), router: @)
    @swap(view)


  story: (story_id) ->
    @story = new HNThread.Models.Item(id: story_id)
    
    view = new HNThread.Views.Story(model: @story, el: $('#results'))
    @swap(view)

    @story.fetch()


  no_story: ->
    view = new HNThread.Views.NoStory(model: null, el: $('#results'))
    @swap(view)
    


  swap: (view) ->
    # if @view?
    #   if @view.remove?
    #     @view.remove()
    
    view.render()

    @view = view