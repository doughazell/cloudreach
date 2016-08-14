class Contact < ActiveRecord::Base
  has_one :address
  has_many :emails
  has_many :telephone_numbers
  
  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  
  # 13/8/16 DH: Before adding flash string to Contacts table
  #attr_accessor :flash
  
end
