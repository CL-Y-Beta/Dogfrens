class UsersController < ApplicationController
  def new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @listings = @user.listings
  end

  def my_account
    @user = current_user
  end

  def change_password
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
      render :edit, notice: 'Your profile was not updated'
    end
  end

  def update_account
    @user = current_user
    if @user.update(user_params)
      redirect_to my_account_path, notice: 'Account updated successfully'
    else
      render :edit, notice: 'Your account was not updated'
    end
  end


  def destroy
    @user = current_user
    @user.destroy

    redirect_to root_path, status: :see_other, notice: 'Account deleted successfully'
  end

  private

  def user_params
    params.require(:user).permit(:username, :dog_description, :email, :mobile, :address, :description, :password, :profile_photo)
  end
end
