'use strict';

class HNThread.Views.Query extends Backbone.View

  template: JST['app/scripts/templates/query.ejs']

  events:
    'keyup #term': 'searchForTerm'

  searchForTerm: (e) ->
    if e.keyCode is 13
      e.preventDefault()
      @model.search @$el.find('#term').val()
      @model.once 'found', @showResults, @

  initialize: (options) ->
    @router = options.router

  showResults: (results) ->
    if results?.length >= 1
      id = results[0].objectID
      @router.navigate "story/#{id}", trigger: true
    else
      @router.navigate "no_story", trigger: true

  render: () ->
    @$el.html @template(@model.toJSON())
