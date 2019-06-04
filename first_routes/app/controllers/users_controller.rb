
class UsersController < ApplicationController

  def index
    users = User.all

    render json: users
  end
  
  def create
    # user = User.new(params.require(:user).permit(:name, :email))
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render json: users.errors.full_messages, status: :unprocessable_entity
    end
  end

   def show
    user = User.find_by_id(params[:id])

    render json: user
  end

  def update
    user = User.find_by_id(params[:id])

    user.update_attributes(user_params)

    render json: user
    
  end

  def destroy
    user = User.find_by_id(params[:id])
    user.destroy
    render json: user
  end
  private
  def user_params
    # debugger
    # params.require(:user).permit(:name, :email)
    params.require(:user).permit(:username)
  end

 

end