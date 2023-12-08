class Link < ApplicationRecord
  belongs_to :user
  enum link_type: { regular: 0, temporary: 1, private_link: 2, ephemeral: 3 }

  validates :url, presence: true, uniqueness: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :link_type, presence: true
  validates :expiration_date, presence: true, if: :temporary?
  validate :expiration_date_cannot_be_in_the_past, if: :temporary?
  validate :expiration_date_cannot_be_too_far_in_the_future, if: :temporary?
  validates :password, length: { in: 3..20 }, if: :custom_private_link?
  validates :password_confirmation, presence: true, if: :custom_private_link?
  validate :password_match?, if: :custom_private_link?
  validates :accessed, inclusion: { in: [true, false] }, if: :custom_ephemeral?

  before_validation :generate_unique_slug

  scope :temporary, -> { where(link_type: :temporary) }

  def expired?
    expiration_date.present? && expiration_date < DateTime.current 
  end

  private

  def expiration_date_cannot_be_in_the_past
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end

  def expiration_date_cannot_be_too_far_in_the_future
    if expiration_date.present? && expiration_date > 1.year.from_now
      errors.add(:expiration_date, "can't be more than 1 year in the future")
    end
  end

  def generate_unique_slug
    self.slug ||= generate_unique_slug_value
  end

  def generate_unique_slug_value
    loop do
      slug_candidate = SecureRandom.urlsafe_base64(5)
      break slug_candidate unless self.class.exists?(slug: slug_candidate)
    end
  end

  def temporary?
    link_type == 'temporary'
  end

  def custom_private_link?
    link_type == 'private_link'
  end

  def custom_ephemeral?
    link_type == 'ephemeral'
  end

  def password_match?
    errors.add(:password_confirmation, "doesn't match password") if password != password_confirmation
  end
end
