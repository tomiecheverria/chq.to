module ApplicationHelper
  def build_link_url(slug)
    base_url = Rails.env.development? ? "http://127.0.0.1:3000" : "https://chq.to"
    "#{base_url}/l/#{slug}"
  end

  def flash_class(type)
    case type
    when 'notice' then 'alert-success'
    when 'alert'  then 'alert-warning'
    when 'error'  then 'alert-danger'
    else 'alert-secondary'
    end
  end
end
