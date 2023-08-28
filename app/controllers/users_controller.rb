class UsersController < ApplicationController
  def new
    @user = current_user
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: 'Profile updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @user.destroy

    redirect_to root_path, status: :see_other, notice: 'Account deleted successfully'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :company_name, :email, :mobile, :address, :description, :password)
  end
end
