module ApplicationHelper
  def build_link_url(slug)
    if Rails.env.development?
      "http://127.0.0.1:3000/l/#{slug}"
    else
      "https://chq.to/l/#{slug}"
    end
  end
end
