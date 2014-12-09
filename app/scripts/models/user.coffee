'use strict';

class HNThread.Models.User extends Backbone.Firebase.Model
  urlRoot: 'https://hacker-news.firebaseio.com/v0/user'
  autoSync: false

  initialize: () ->

  defaults: {}

  validate: (attrs, options) ->

  parse: (response, options) ->
    response
