class HomeController < ApplicationController

  def top
    if params[:options].nil?
      @posts = Post.limit(6).order(created_at: :desc) #6件取得
      @likes = Post.joins(:likes).group("posts.id").limit(6).order('count(posts.id) desc')
      @posts_updated_order = Post.limit(6).order(Post::SELECT_MAP_FOR_SORT[:'更新順'])
      @posts_random = Post.all.sample(6)
    elsif params[:options][:allViews]
      @likes = Post.joins(:likes).group("posts.id").order('count(posts.id) desc')
      @posts = Post.all.order(created_at: :desc)
      @posts_updated_order = Post.order(Post::SELECT_MAP_FOR_SORT[:'更新順'])
      @posts_random = Post.all.sample(6)
    elsif params[:options][:category] != nil
      @posts = Post.where(category: params[:options][:category].to_i)
      @likes = []
      @posts_updated_order = []
      @posts_random = Post.where(category: params[:options][:category].to_i).sample(6)
    end
  end

  def about
  end
end
