class ApplicationController < ActionController::Base
  #deviseコントローラーにストロングパラメーターを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    #サインアップ時にuniversity, undergraduate, department, class, nameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:university, :undergraduate, :department, :schoolcount, :name])
    #アカウント編集の時にuniversity, undergraduate, department, class, nameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:university, :undergraduate, :department, :schoolcount, :name])
  end
end
