
class LandingsController < ApplicationController
  include Devise

  def index
    if current_user == nil
      @resource = resource
      render layout: false
    else
      redirect_to orders_path
    end
  end

end
