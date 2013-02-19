class UserHolidayController < ApplicationController
  load_and_authorize_resource

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_holiday }
    end
  end

  def edit
  end

  def create
    respond_to do |format|
      if @user_holiday.save
        format.html { redirect_to work_sites_path, notice: 'Users holiday was successfully created.' }
        format.json { render json: work_sites_path, status: :created, location: @user_holiday }
      else
        format.html { render action: "new" }
        format.json { render json: @user_holiday.errors, status: :unprocessable_entity }
      end
    end
  end
end
