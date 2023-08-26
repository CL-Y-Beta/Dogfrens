class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to listings_path, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :company_name, :email, :mobile, :address, :description, :password)
  end
end
