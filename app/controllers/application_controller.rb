class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_filter :set_request_from

  def set_request_from
    if session[:request_from]
      @request_from = session[:request_from]
    end
    # 現在のURLを保存しておく
    session[:request_from] = request.original_url
  end

  def return_back
    if request.referer
      redirect_to :back and return true
    elsif @request_from
      redirect_to @request_from and return true
    end
  end

  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
