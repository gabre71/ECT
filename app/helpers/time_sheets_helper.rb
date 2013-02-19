module TimeSheetsHelper
	def disable_control_for(time_sheet, field = "")
		enabled_fields = Array["start_time", "end_time", "lateness"]
    if ((current_user.has_role? :admin) || (current_user.has_role? :secretar))
    	return false
    else
    	unless (time_sheet.start_time || time_sheet.work_date.to_date < Date.today || time_sheet.user != current_user || enabled_fields.include?(field))
	    	return false
			else
	        return true
			end
    end
  end

  def get_holiday_color(time_sheet)
  	if time_sheet.work_time_type_id == 1
  		"work" 
  	else	
  		if time_sheet.work_time_type_id == 3
  			"sick" 
  		else
  			if time_sheet.planned_holiday.accepted?
	  			"accepted"
	  		else	 
	  			unless time_sheet.planned_holiday.planned?
	  				"planned"
		  		else
		  			unless time_sheet.planned_holiday.planned?
	  				"requested"
	  				end
	  			end
	  		end
	  	end
	  end
	end
end
