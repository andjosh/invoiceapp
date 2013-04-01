class UsersController < ApplicationController

  before_filter :find_user, :only => [:edit, :update, :show, :destroy]
  before_filter :check_user, :only => [:edit, :update, :show, :destroy]

  def index
    @search = User.search(params[:search])
    search_relation = @search.relation
    @users = search_relation.order(sort_column + " " + sort_direction).page params[:page]
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to edit_user_path(@user), :notice => "Information successfully updated. Way to go!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, :notice => "User deleted."
  end

  protected

  def find_user
    @user = User.find(params[:id])
  end

  def check_user
  	if @user != current_user
  		redirect_to root_path, :notice => "Sorry, you can't access that information. Life is full of disappointment."
  	end
  end

end
