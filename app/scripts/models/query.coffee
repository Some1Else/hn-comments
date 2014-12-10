'use strict';

class HNThread.Models.Query extends Backbone.Model
  url: () ->
    root = 'http://hn.algolia.io/api/v1/search_by_date'
    params = 'tags=story&restrictSearchableAttributes=url'
    if @get('term')
      root + '?' + params + "&query=\"#{@get('term')}\""
    else
      root

  search: (search_term) ->
    @set(term: search_term)
    @fetch()

  exact_matches: () ->
    if @get('hits')
      exact_matches = []
      for hit in @get('hits')
        if hit.url == @get('term')
          exact_matches.push hit
      exact_matches
    else
      []

  top_hit: () ->
    @exact_matches()[0]
    
  broadcastFound: () ->
    @trigger 'found', @exact_matches()

  initialize: () ->
    @on 'change:hits', @broadcastFound
