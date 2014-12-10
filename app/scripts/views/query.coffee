'use strict';

class HNThread.Views.Query extends Backbone.View

  template: JST['app/scripts/templates/query.ejs']

  events:
    'keyup #term': 'handleKeypress'
    'click .btn': 'searchForTerm'

  handleKeypress: (e) ->
    if e.keyCode is 13
      @searchForTerm(e)

  searchForTerm: (e) ->
    e.preventDefault()
    @model.search @$el.find('#term').val()
    @model.once 'found', @showResults, @


  showResults: (results) ->
    if results?.length >= 1
      id = results[0].objectID
      @router.navigate "story/#{id}", trigger: true
    else
      @router.navigate "no_story", trigger: true

  update: (story) ->
    $('#term').val(story.get('url'))
    story.once 'change:url', ->
      $('#term').val(story.get('url'))

  initialize: (options) ->
    @router = options.router

  render: () ->
    @$el.html @template(@model.toJSON())
