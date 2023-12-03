class Link < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :user

  validates :name, presence: true
  validates :url, presence: true, uniqueness: true

  private

  def slug_candidates
    [
      :name,
      %i[name user_id]
    ]
  end
end
