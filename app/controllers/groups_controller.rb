class GroupsController < ApplicationController

  before_action :set_current_group, only: [:edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      flash.now[:alert] = "グループ名を入力してください"
      render action: :new
    end
  end

  def edit
    @users = User.all
    @group_users = @group.users
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: "グループ更新しました"
    else
      flash.now[:alert] = "グループ更新に失敗しました"
      render action: :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

  def set_current_group
    @group = Group.find(params[:id])
  end

end
