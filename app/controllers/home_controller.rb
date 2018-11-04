class HomeController < ApplicationController

  def index
    @posts = Post.published.first(8)
  end

  def welcome; end

end
