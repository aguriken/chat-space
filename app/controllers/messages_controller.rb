class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
    @messages = @group.messages
  end

  def create
    @message = Messgae.new(message_params)
    if @message.save
      redirect_to group_messgaes_path(params[:group_id]), notice: "メッセージを送信"
    else
      redirect_to group_messages_path(params[:group_id]), alert: "メッセージを入力してください"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end

end
