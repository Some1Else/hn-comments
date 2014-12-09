'use strict';

class HNThread.Collections.TopStories extends Backbone.Firebase.Collection
  url: 'https://hacker-news.firebaseio.com/v0/topstories'
  model: HNThread.Models.Item
