class Contact < ActiveRecord::Base
  has_one :address
  has_many :emails
  has_many :telephone_numbers
  
  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
end
