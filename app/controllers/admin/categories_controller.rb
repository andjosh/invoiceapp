class Admin::CategoriesController < Admin::BaseController

  helper_method :sort_column, :sort_direction, :search_params

  before_filter :find_category, :only => [:edit, :update, :show, :destroy]

  def index
    @search = Category.search(params[:search])
    search_relation = @search.relation
    @categories = search_relation.order(sort_column + " " + sort_direction).page params[:page]
  end

  def show
  end

  def edit
  end

  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_category_path(@category), notice: 'Category was successfully created. Rake in that money.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @category.update_attributes(params[:user])
      redirect_to admin_categories_path, :notice => "Category successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, :notice => "Category deleted."
  end

  protected

  def find_category
    @category = Category.find(params[:id])
  end

  private

  def sort_column
    Category.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def search_params
    { :search => params[:search] }
  end

end
