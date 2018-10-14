class HomeController < ApplicationController

  def top
    if params[:options].nil?
      logger.debug 'こっち'
      @posts = Post.limit(6).order(created_at: :desc) #6件取得
    elsif
      if params[:options][:likes]
        logger.debug 'likes'
        @posts = Post.joins(:likes).group("likes.post_id").order('count(likes.post_id) desc')
      elsif params[:options][:allViews]
        logger.debug 'ok!'
        @posts = Post.all.order(created_at: :desc)
      elsif params[:options][:category] != nil
        @posts = Post.where(category: params[:options][:category].to_i)
      end
    end

  end

  def about
  end
end
