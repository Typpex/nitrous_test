class Admin::UsersController < Admin::AdminController
  expose :user
  respond_to :html

  def index
    @users = User.all
    respond_with(@users)
  end
end