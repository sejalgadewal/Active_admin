class PersonalDetail < ApplicationRecord
    has_one_attached :image
    has_one_attached :video
    

    def self.ransackable_attributes(auth_object = nil)
        %w[ mobile email gender dob marital_status blood_group image video] # Add other attributes you want to search on
      end
      def self.ransackable_associations(auth_object = nil)
        []
      end
end