# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  prepend_before_action :authenticate_scope!, only: [:edit_profile, :edit, :update, :destroy]

  def edit_profile
    @user = current_user
  end

  def create_profile
    @user = current_user
  end
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def user_params
    params.require(:user).permit(:description, :dog_description) # Replace with your user attributes
  end
  # def update_resource(resource, params)
  #   if params[:current_password]
  #     if current_user.valid_password?(params[:current_password])
  #       resource.update_with_password(params)
  #     else
  #       set_flash_message(:alert, 'invalid', scope: 'devise.failure', authentication_keys: 'New password')
  #       # redirect_to change_password_path and return
  #     end
  #   else
  #     set_flash_message(:alert, 'unauthenticated', scope: 'devise.failure')
  #   end
  # end

  def update_resource(resource, params)
    if params[:current_password]
      if current_user.valid_password?(params[:current_password])
        resource.update_with_password(params)
        set_flash_message(:notice, :updated_not_active, scope: 'devise.passwords', now: true)
      else
        set_flash_message(:alert, 'invalid', scope: 'devise.failure', authentication_keys: "username")
      end
    else
      resource.update_without_password(params)
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
    edit_profile_path
  end

  def after_update_path_for(resource)
    if params["user"][:current_password]
      change_password_path(resource)
    elsif params["user"][:email]
      set_flash_message(:notice, :email_updated, {})
      edit_user_registration_path(resource)
    elsif params["user"][:description]
      root_path
    else
      set_flash_message(:notice, :profile_updated, {})
      edit_profile_path(resource)
    end
  end

  # def after_update_path_  for(resource)
  #   edit_user_registration_path(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
