class UsersController < ApplicationController
  def search
    @users = User.where("id != #{ current_user.id } and name LIKE(?)", "%#{ params[:keyword] }%")
    respond_to do |format|
        format.json
    end
  end
end
