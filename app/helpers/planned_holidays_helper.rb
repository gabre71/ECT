module PlannedHolidaysHelper

	def get_statuses(ph)
		if ph.new_record?
			["planned", "requested"]
		end
	end

	def set_default_status(ph)
		if ph.new_record?
			"planned"
		end	
	end

	def planned_holiday_actions_helper(planned_holiday, type)
		ret = ""
		if type == "request"
			ret += "<small><li>" + link_to("Send request", send_request_user_planned_holiday_path(planned_holiday.user,planned_holiday)) +"</li></small>" if planned_holiday.editable?
			ret += "<small><li>" + link_to("Withdraw", withdraw_request_user_planned_holiday_path(planned_holiday.user,planned_holiday)) +"</li></small>" if planned_holiday.withdrawable?
			ret += "<small><li>" + link_to("Withdraw", cancel_request_user_planned_holiday_path(planned_holiday.user,planned_holiday)) +"</li></small>" if planned_holiday.cancelable?
			ret += "<small><li>" + link_to("Edit", edit_user_planned_holiday_path(planned_holiday.user,planned_holiday)) +"</li></small>" if planned_holiday.editable?
			ret += "<small><li>" + link_to('Destroy', user_planned_holiday_path(current_user,planned_holiday), method: :delete, data: { confirm: 'Are you sure?' }) +"</li></small>" if planned_holiday.deleteable?
		else
			ret += "<small><li>" + link_to("Accept", accept_request_user_planned_holiday_path(planned_holiday.user,planned_holiday)) +"</li></small>" if planned_holiday.accessible? 
			ret += "<small><li>" + link_to("Reject", reject_request_user_planned_holiday_path(planned_holiday.user,planned_holiday)) +"</li></small>" if planned_holiday.rejectable? 
			ret += "<small><li>" + link_to("Accept withdraw", accept_withdraw_user_planned_holiday_path(planned_holiday.user,planned_holiday)) +"</li></small>" if planned_holiday.withdraw_accessible?
			ret += "<small><li>" + link_to("Reject withdraw", reject_withdraw_user_planned_holiday_path(planned_holiday.user,planned_holiday)) +"</li></small>" if planned_holiday.withdraw_rejectable?
		end
		return ret.html_safe
	end

	def planned_holiday_status_helper(planned_holiday)
		ret = "Planned" if planned_holiday.planned?
		ret = "Waiting for confirmation" if planned_holiday.requested? || planned_holiday.withdrawn?
		ret = "Accepted" if planned_holiday.accepted?
		ret = "Rejected" if planned_holiday.rejected?
		return ret
	end
	
	def planned_holiday_color_helper(planned_holiday)
		ret = "" if planned_holiday.planned?
		ret = "info" if planned_holiday.requested? || planned_holiday.withdrawn?
		ret = "success" if planned_holiday.accepted?
		ret = "error" if planned_holiday.rejected?
		return ret
	end	
end
