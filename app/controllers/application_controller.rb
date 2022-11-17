class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # メールとパスワード以外の値を保存できるように設定
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :self_introduction])
  end
end
