class User < ApplicationRecord
    has_many :recipes, dependent: :destroy
    validates :username, uniqueness: true, presence: true, length: { minimum: 3, maximum: 25 }
    validates :email, uniqueness: true, presence: true, length: { minimum: 5, maximum: 25 }, format: { with: URI::MailTo::EMAIL_REGEXP }
end