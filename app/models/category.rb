class Category < ApplicationRecord
    validates :title, presence:true, length: { minimum: 5}
    belongs_to :user
    has_many :tasks, dependent: :destroy
    
end
