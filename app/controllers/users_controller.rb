class UsersController < ApplicationController

  def search
    @user = User.where("id != #{current_user.id} and name LIKE(?)", "%#{params[:keyword]}%")
    respond to do |format|
      format.html
      format.json
    end
  end

end
