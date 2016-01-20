module Admin
  class CategoriesController < Admin::BaseController
    def index
      @categories = Category.all
      if params[:category_id]
        @category = Category.find(params[:category_id])
        @title = "Editing #{@category.title}"
      else
        @title = "Create New Category"
        @category = Category.new
      end
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        flash[:notice] = "New category #{@category.title} created"
      end
      redirect_to admin_categories_path
    end

    def edit
      @category = Category.find(params[:id])
      redirect_to admin_categories_path(category_id: @category.id)
    end

    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        flash[:notice] = "#{@category.title} updated"
      end
      redirect_to admin_categories_path
    end

    def destroy
      @category = Category.find(params[:id]).destroy
      flash[:notice] = "#{@category.title} removed"
      redirect_to admin_categories_path
    end

    private

    def category_params
      params.require(:category).permit(:title)
    end
  end
end
