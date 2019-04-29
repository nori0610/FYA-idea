$ ->
  class PostIndex
    constructor: ->
      @setEventListener()

    setEventListener: ->
      $('.link-box').click (e) ->
        # ライクの場合は遷移させない
        if $(e.target).parents(".fav-link").length == 1
          return
        # カード全体をクリック可能に
        $(e.target).closest(".card")
                   .find(".link")[0]
                   .click()

  window.postIndex = ->
    new PostIndex()
