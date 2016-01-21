module Admin
  class CategoriesController < Admin::BaseController
    before_action :set_categories, only: [:edit, :index, :create]
    before_action :set_category, only: [:edit, :update, :destroy]

    def index
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        flash[:notice] = "New category #{@category.title} created"
        redirect_to admin_categories_path
      else
        render "index"
      end
    end

    def edit
      # @category = Category.find(params[:id])
    end

    def update
      # @category = Category.find(params[:id])
      if @category.update(category_params)
        flash[:notice] = "#{@category.title} updated"
        redirect_to admin_categories_path
      else
        render "edit"
      end
    end

    def destroy
      @category.destroy
      flash[:notice] = "#{@category.title} removed"
      redirect_to admin_categories_path
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    def category_params
      params.require(:category).permit(:title)
    end
  end
end
