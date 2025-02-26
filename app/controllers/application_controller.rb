class ApplicationController < ActionController::Base
  include Pagy::Backend # Inclui Pagy para paginação
  before_action :authenticate_user!
  before_action :set_layout_by_controller # Define o layout dinamicamente

  private

  def set_layout_by_controller
    self.class.layout case controller_name
     when "home"
      "application" # Aplica home_application para HomeController
     when "landing"
      "home_application" # Aplica home_application para LandingController
     else
    devise_controller? ? "devise_application" : "application"
      end
  end
end
