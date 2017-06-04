class MessagesController < ApplicationController

  def index
    @message = "aaaa"
    @groups = current_user.groups
  end

end
