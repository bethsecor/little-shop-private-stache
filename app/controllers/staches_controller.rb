class StachesController < ApplicationController
  helper :headshot
  before_action :stached_guard, only: [:stached]

  def index
    @staches = Stache.all
  end

  def show
    @stache = Stache.find(params[:id])
    session[:cam_stache_id] = @stache.id
  end

  def stached
    @photo = current_user.headshot_photos.last
  end

  private

  def stached_guard
    @stache = Stache.find(params[:stache_id])
    unless current_user && !current_user.headshot_photos.empty? && session[:cam_stache_id] == @stache.id
      redirect_to @stache
    end
  end
end
