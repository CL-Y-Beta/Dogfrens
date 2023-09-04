# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  prepend_before_action :require_no_authentication, except: [:index, :update]
  # append_before_action :assert_reset_token_passed, only: :edit

  def index
    if !user_signed_in?
      set_flash_message(:alert, 'unauthenticated', scope: 'devise.failure')
      redirect_to root_path
    end
    self.resource = current_user
    set_minimum_password_length
  end
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
