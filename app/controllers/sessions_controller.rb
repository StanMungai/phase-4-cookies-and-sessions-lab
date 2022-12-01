class SessionsController < ApplicationController
  def index
    if !session[:page_views]
      session[:page_views] ||= 0
    else 
      session[:page_views] += 1
      if session[:page_views] < 3
        render json: { session: session}
      else
        render json: { error: "Maximum pageview limit reached"}, status: :unauthorized.
      end
    end
  end
end
