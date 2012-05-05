class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  @fb_admins ="500208454"
  @og_title ="HelpMeDateYou.com"
  @og_url="http://www.helpmedateyou.com"
  @og_description ="Share avice anonymously with guys and girls"
  @og_type ="website"
  @og_image ="http://i.imgur.com/Mij1Q.png"
  @og_site_name ="HelpMeDateYou.com | Share avice anonymously with guys and girls"
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

