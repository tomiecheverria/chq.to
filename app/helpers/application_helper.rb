module ApplicationHelper
  def build_link_url(slug)
    base_url = Rails.env.development? ? "http://127.0.0.1:3000" : "https://chq.to"
    "#{base_url}/l/#{slug}"
  end
end
