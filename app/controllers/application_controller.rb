class ApplicationController < ActionController::Base
	protect_from_forgery
	rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    redirect_to root_path, :alert => exception.message
  end

	protected
  
  def set_locale
    logger.debug "LOCALE in session: #{session[:locale]}"
    I18n.locale = current_user.try(:locale) || session[:locale] || I18n.default_locale
  end

  def set_timezone
    Time.zone = current_user.try(:time_zone) || Time.zone
  end  

end
