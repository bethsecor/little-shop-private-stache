class StachesController < ApplicationController
  def index
    @staches = Stache.all
  end
end
