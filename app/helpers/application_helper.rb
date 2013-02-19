module ApplicationHelper
	def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
  
  def get_time_from(datetime)
    return datetime.strftime("%H:%M") if datetime
  end

  def user_name
    if current_user.name
      current_user.name
    else
      current_user.email
    end
  end

    def get_holiday_approvers
    users = Array[]
    User.all.each do |user|
      users << user if user.is_manager?
    end
    return users 
  end
end
