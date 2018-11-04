class HomeController < ApplicationController

  def top
    if params[:options].nil?
      @posts = Post.limit(6).order(created_at: :desc) #6件取得
      @likes = Post.joins(:likes).group("posts.id").limit(6).order('count(posts.id) desc')
    elsif params[:options][:allViews]
      @likes = Post.joins(:likes).group("posts.id").order('count(posts.id) desc')
      @posts = Post.all.order(created_at: :desc)
    elsif params[:options][:category] != nil
      @posts = Post.where(category: params[:options][:category].to_i)
      @likes = []
    end
  end

  def about
  end
end
