class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)

    if !message.save
      flash[:error] = "There was a problem saving your message"
    end

    redirect_to root_path
  end

  private

  def message_params
    params.permit(:body)
  end
end
