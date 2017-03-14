class MessagesController < ApplicationController
  before_action :require_user

  def index
    @messages = Message.all
  end

  def create
    @message = current_user.messages.create! body: params[:message][:body]
    redirect_to messages_path
  end
end
