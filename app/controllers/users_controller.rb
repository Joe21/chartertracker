class UsersController < Devise::RegistrationsController

  def new
		super
  end

  def create
		super
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
		super
  end

  def cancel
		super
  end

  protected

  def update_needs_confirmation?(resource, previous)
		super
  end

  def update_resource(resource, params)
    super
  end

  def build_resource(hash=nil)
    super
  end

  def sign_up(resource_name, resource)
    super
  end

  def after_sign_up_path_for(resource)
    super
  end

  def after_inactive_sign_up_path_for(resource)
    super
  end

  def after_update_path_for(resource)
    super
  end

  def authenticate_scope!
    super
  end

  def sign_up_params
    super
  end

  def account_update_params
    super
  end
end