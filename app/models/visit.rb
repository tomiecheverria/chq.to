# app/models/visit.rb
class Visit < ApplicationRecord
  belongs_to :link

  validates :link_id, presence: true
  validates :accessed_at, presence: true
  validates :ip_address, presence: true, format: { with: /\A\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\z/,
                                                   message: 'should be a valid IP address' }
end
