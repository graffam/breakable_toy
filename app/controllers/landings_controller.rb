class LandingsController < ApplicationController
  include LogHelper

  def index
    if current_user
      redirect_to orders_path
    else
      @resource = resource
      render layout: false
    end
  end
end
