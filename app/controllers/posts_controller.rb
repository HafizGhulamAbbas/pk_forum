class PostsController < ApplicationController

  skip_before_action :authorized, only: [:index]
  after_action :clear_sessions, only: [:show]

  def index
    # if params[:tag].present?
    #   @posts = Post.filter_by_tags(params[:tag]).page(params[:page]).per(Setting.post_per_page)
    # else
    #   @posts = Post.published.page(params[:page]).per(Setting.post_per_page)
    # end
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @visitor_comment = Visitor.new(comments: [Comment.new])
    # respond_to do |format|
    #   format.html
    #   format.pdf{
    #     render pdf: @post.id
    #   }
    # end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "show",
               template: "posts/show.pdf.erb",
               layout: false,
               title: @post.title,
               page_size: 'Letter'
      end
    end
  end

  private

  def clear_sessions
    [:visitor_errors, :visitor_params].each { |k| session.delete(k)}
  end
end
