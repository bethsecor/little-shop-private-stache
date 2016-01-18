class Admin::StachesController < Admin::BaseController
  def new
    @stache = Stache.new
  end

  def create
    categories = params[:stache][:categories]
    @stache = Stache.new(stache_params)
    @stache_creation = StacheCreation.new(@stache, categories)
    if @stache_creation.create
      flash[:notice] = "#{@stache.name} created!"
      redirect_to @stache
    else
      render :new
    end
  end

  # def create
  #   categories = params[:stache][:categories]
  #   @stache = Stache.new(stache_with_categories_params(categories))
  #   if @stache.save
  #     flash[:notice] = "#{@stache.name} created!"
  #     redirect_to @stache
  #   else
  #     render :new
  #   end
  # end

  private

  def stache_params
    params.require(:stache).permit(:name, :description, :price, :image_url, :categories)
  end

  # def stache_with_categories_params(categories)
  #   params = stache_params.dup
  #   params[:categories] = Category.find(categories)
  #   params
  # end

end
