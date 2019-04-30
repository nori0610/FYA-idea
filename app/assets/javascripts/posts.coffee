$ ->
  # posts/index用のjs
  class PostIndex
    # 初期化
    constructor: ->
      @setEventListener()

    # 各種イベントをセット
    setEventListener: ->
      # イベントがあればここで登録

  window.postIndex = ->
    new PostIndex()
