class MessagesController < ApplicationController
  def new
    @visitor_message = Visitor.new(messages: [Message.new])
  end

  def create
    # if visitor.save
    #   flash[:notice] = 'Message sent successfully'
    #   redirect_to new_message_path
    # else
    #   @visitor_message = visitor
    #   render :new
    # end
  end

  private
  def strong_params
    params.require(:visitor).permit(:full_name, :email, messages_attributes: [:content])
  end

  def visitor
    @visitor ||= Visitor
  end
end
