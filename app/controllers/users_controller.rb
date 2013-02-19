class UsersController < ApplicationController
	before_filter :authenticate_user!
  load_and_authorize_resource :only => :index
  
  def show
  end
  def index
    @users = User.order("name")
  end

  def edit
     @user = User.find(params[:id])
     @user_holiday = UserHoliday.new
  end
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to request.referer, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def show_employee 
    @users = User.all
    respond_to do |format|
      format.html # show_employee.html.erb
      format.json { render json: @user }
    end
  end

  def edit_employee
    @user = User.find(params[:id])
  end

  def index_workflow
    @users = User.all
    respond_to do |format|
      format.html # index_workflow.html.erb
      format.json { render json: @users }
    end
  end

  def edit_workflow
    @user = User.find(params[:id])
  end

  def add_holiday
    @user = User.find_by_id(params[:id])
    @user.add_holiday(params[:add_holiday][:year], params[:add_holiday][:holidays])
    respond_to do |format|
      format.html {redirect_to edit_user_path(@user)}
      format.json { render json: @user }
    end
  end
end
