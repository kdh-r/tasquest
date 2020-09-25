class Task < ApplicationRecord
  belongs_to :user

  validates :content, presence: { message: "can`t be blank"}
end
