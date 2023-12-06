class Link < ApplicationRecord
  belongs_to :user
  enum link_type: { regular: 0, temporary: 1, private_link: 2, ephemeral: 3 }

  validates :url, presence: true, uniqueness: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :link_type, presence: true
  validates :expiration_date, presence: true, if: -> { temporary? }

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
