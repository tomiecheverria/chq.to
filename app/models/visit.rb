class Visit < ApplicationRecord
  belongs_to :link, counter_cache: true

  validates :link_id, presence: true
  validates :accessed_at, presence: true
  validate :valid_accessed_at_format
  validates :ip_address, presence: true, format: { with: /\A\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\z/,
                                                   message: 'should be a valid IP address' }

  private

  def valid_accessed_at_format
    formatted_date = accessed_at.strftime('%Y-%m-%d %H:%M:%S')
    return if formatted_date.match?(/\A\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\z/)

    errors.add(:accessed_at,
               'should be a valid datetime format (YYYY-MM-DD HH:MM:SS)')
  end
end
