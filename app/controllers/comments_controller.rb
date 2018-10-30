class CommentsController < ApplicationController
  def create
    if visitor.save
      flash[:notice] = 'New comment was created successfully'
    else
      flash[:alert] = 'There was a problem in creating new comment'
      set_visitor_sessions
    end

    redirect_back fallback_location: :create
  end

  private
  def visitor_comments_params
    params.require(:visitor).permit(:full_name, :email, comments_attributes: %i[message post_id])
  end

  def visitor
    build_existing_visitor_comment || build_new_visitor_comment
  end

  def existing_visitor
    @visitor ||= Visitor.find_by(email: visitor_comments_params[:email])
  end

  def build_new_visitor_comment
    Visitor.new(visitor_comments_params)
  end

  def comment
    visitor_comments_params[:comments_attributes]['0']
  end

  def build_existing_visitor_comment
    return unless existing_visitor
    existing_visitor.tap do |v|
      v.comments << Comment.new(comment)
    end
  end

  def set_visitor_sessions
    session[:visitor_errors] = visitor.errors.full_messages
    session[:visitor_params] = visitor_comments_params
  end
end
