class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}

  def top
    if params[:options].nil?
      logger.debug 'こっち'
      @posts = Post.limit(6).order(created_at: :desc) #6件取得
    elsif
      if params[:options][:likes]
        logger.debug 'likes'
        #likes = Post.likes
        @posts = Post.all
      elsif params[:options][:allViews]
        logger.debug 'ok!'
        @posts = Post.all.order(created_at: :desc)
      end
    end

  end

  def about
  end
end
