class RegistrationsController < Devise::RegistrationsController
	def new
    super
	end

	def create
		super
	end	

  def edit
  	# @user = User.find(current_user)
  end

  def update
    # @user = User.find(current_user)

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end  
  end

  def edit_employee
    @user = User.find(current_user)
    respond_to do |format|
      format.html { render "users/edit_employee" }
      format.json { head :no_content }
    end
  end

end