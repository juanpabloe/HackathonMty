class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :ensure_domain

  APP_DOMAIN = 'www.hackathonmty.org'

  def ensure_domain
    if request.env['HTTP_HOST'] != APP_DOMAIN && Rails.env == 'production'
      # HTTP 301 is a "permanent" redirect
      redirect_to "http://#{APP_DOMAIN}", :status => 301
    end
  end
  
  def current_ability
    @current_member ||= Ability.new(current_member)
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
  
end
