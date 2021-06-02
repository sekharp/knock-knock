class Prospect < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, format: { with: /^(.+)@(.+)$/, message: "Email invalid" }, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 254 }
  validates :notes, length: { maximum: 1000 }
end
