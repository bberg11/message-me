class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)

    if message.save
      ActionCable.server.broadcast "chat_room_channel", html: message_html(message)
    end
  end

  private

  def message_params
    params.permit(:body)
  end

  def message_html(message)
    render(partial: "message", locals: { message: message })
  end
end
