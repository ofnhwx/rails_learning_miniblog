module ApplicationHelper
  def convert_to_bootstrap_alert_type(type)
    case type
    when 'notice'
      'success'
    when 'alert'
      'warning'
    when 'error'
      'danger'
    else
      type
    end
  end
end
