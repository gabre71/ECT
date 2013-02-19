class PlannedHolidaysController < ApplicationController
  load_and_authorize_resource
    # GET /planned_holidays
  # GET /planned_holidays.json
  def index
    @planned_holidays = PlannedHoliday.all
    @user = current_user
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @planned_holidays }
    end
  end

  def load_user
    @user = User.find(params[:user])
    @planned_holidays = @user.planned_holidays 
    respond_to do |format|
      #format.html {redirect_to index2_user_planned_holidays_path(@user)}
      format.js
    end
  end

  def index2
    @owned_users = current_user.managed_users
    @subsituted_users = current_user.substituted_users
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @planned_holidays }
    end
  end

  # GET /planned_holidays/1
  # GET /planned_holidays/1.json
  def show
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @planned_holiday }
    end
  end

  # GET /planned_holidays/new
  # GET /planned_holidays/new.json
  def new
    @planned_holiday = PlannedHoliday.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @planned_holiday }
    end
  end

  # GET /planned_holidays/1/edit
  def edit
  end

  # POST /planned_holidays
  # POST /planned_holidays.json
  def create

    respond_to do |format|
      @planned_holiday.user = current_user
      if @planned_holiday.save
        format.html { redirect_to user_planned_holidays_path(current_user), notice: 'Planned holiday was successfully created.' }
        format.json { render json: @planned_holiday, status: :created, location: @planned_holiday }
      else
        format.html { render action: "new" }
        format.json { render json: @planned_holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /planned_holidays/1
  # PUT /planned_holidays/1.json
  def update

    respond_to do |format|
      if @planned_holiday.update_attributes(params[:planned_holiday])
        format.html { redirect_to user_planned_holidays_path(current_user), notice: 'Planned holiday was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @planned_holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planned_holidays/1
  # DELETE /planned_holidays/1.json
  def destroy
    @planned_holiday.destroy

    respond_to do |format|
      format.html { redirect_to user_planned_holidays_path(current_user) }
      format.json { head :no_content }
    end
  end
  
  def send_request
    @planned_holiday.status = "requested"
    @planned_holiday.save
    respond_to do |format|
      format.html { redirect_to user_planned_holidays_path(current_user) }
      format.json { head :no_content }
    end
  end

  def withdraw_request
    @planned_holiday.withdraw!
    respond_to do |format|
      format.html { redirect_to user_planned_holidays_path(current_user) }
      format.json { head :no_content }
    end
  end

  def accept_request
    @planned_holiday.accept!
    respond_to do |format|
      format.html { redirect_to index2_user_planned_holidays_path(current_user) }
      format.json { head :no_content }
    end
  end
  def reject_request
    if @planned_holiday.holiday_type_id == 2 
      @planned_holiday.reject!
    else
      @planned_holiday.status = "requested"
      @planned_holiday.holiday_type_id = 2
      @planned_holiday.save
    end
    respond_to do |format|
      format.html { redirect_to index2_user_planned_holidays_path(current_user) }
      format.json { head :no_content }
    end
  end
  def accept_withdraw
    @planned_holiday.accept_withdraw!
    respond_to do |format|
      format.html { redirect_to index2_user_planned_holidays_path(current_user) }
      format.json { head :no_content }
    end
  end
  def reject_withdraw
    @planned_holiday.reject_withdraw!
    respond_to do |format|
      format.html { redirect_to index2_user_planned_holidays_path(current_user) }
      format.json { head :no_content }
    end
  end
def cancel_request
    @planned_holiday.cancel!
    respond_to do |format|
      format.html { redirect_to user_planned_holidays_path(current_user) }
      format.json { head :no_content }
    end
  end

end
