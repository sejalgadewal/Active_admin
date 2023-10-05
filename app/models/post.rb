class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user, optional: :true
  
  def self.ransackable_attributes(auth_object = nil)
    %w[id title body user_id created_at updated_at image] # Add other attributes you want to search on
  end
  
  def self.ransackable_associations(auth_object = nil)
    []
  end
end


