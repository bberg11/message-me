class ChatRoomController < ApplicationController
  before_action :require_user

  def index
    @messages = Message.recent
  end
end
