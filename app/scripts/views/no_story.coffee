'use strict';

class HNThread.Views.NoStory extends Backbone.View
  template: JST['app/scripts/templates/no_story.ejs']

  render: () ->
    @$el.html @template()
    @ 
