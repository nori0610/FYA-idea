$ ->
  # 共通のjs
  class Common
    # 初期化
    constructor: ->
      @setEventListener()

    # 各種イベントをセット
    setEventListener: ->
      @__clickCardHandler()

    # カードをクリックした時のイベント
    __clickCardHandler: ->
      $('.link-box').click (e) ->
        # ライクの場合は遷移させない
        if $(e.target).parents(".fav-link").length == 1
          return
        # カード全体をクリック可能に
        $(e.target).closest(".card")
                   .find(".link")[0]
                   .click()

  window.common = ->
    new Common()

