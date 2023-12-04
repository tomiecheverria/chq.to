class Link < ApplicationRecord
  belongs_to :user

  validates :url, presence: true, uniqueness: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])

  before_validation :generate_unique_slug

  private

  def generate_unique_slug
    self.slug ||= generate_unique_slug_value
  end

  def generate_unique_slug_value
    loop do
      slug_candidate = SecureRandom.urlsafe_base64(5)
      break slug_candidate unless self.class.exists?(slug: slug_candidate)
    end
  end
end
