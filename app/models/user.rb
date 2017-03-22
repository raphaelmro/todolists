class User < ActiveRecord::Base
  has_secure_password

  has_one :profile, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :todo_items, through: :todo_lists, source: :todo_items
  def get_completed_count
    todo_items.where(completed: TRUE).count
  end
  validates :username, presence: true
end