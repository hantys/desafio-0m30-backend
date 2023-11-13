module ApplicationHelper
  def status_citizen(status)
    if status == 'active'
      icon = 'check'
      class_status = 'success'
    else
      icon = 'x'
      class_status = 'danger'
    end

    "
      <span class='text-#{class_status}'>
        <i class='bi bi-#{icon}-circle-fill'></i>
      </span>
    ".html_safe
  end

end
