class MessagesController < ApplicationController

  before_action :set_varriable, only: [:index]

  def index
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(params[:group_id]), notice:  "メッセージ送信成功"}
        format.json
      end
    else
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_varriable
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.includes(:messages)
    @message = Message.new
    @messages = @group.messages
  end

end
