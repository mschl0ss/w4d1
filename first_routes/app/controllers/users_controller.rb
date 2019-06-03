
class UsersController < ApplicationController

  def index
    users = User.all

    render json: users
  end
  
  def create
    # user = User.new(user_params)
    user = User.new(params.require(:user).permit(:name, :email))

    if user.save
      render json: user
    else
      render json: users.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def user_params
    # debugger
    params.require(:user).permit(:name, :email)
  end
end