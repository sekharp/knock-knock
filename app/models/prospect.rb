class Prospect < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :user

  validates :name, presence: true, length: { maximum: 100 }
  validates_presence_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates :notes, length: { maximum: 1000 }
end
