require 'spec_helper'
require 'rails_helper'

describe Contact do

  context "Valid contact names" do
    let(:contact_params) { {"first_name"=>"Fred", "last_name"=>"Blogs"} }
    subject { Contact.new(contact_params) }
    
    it "should create a contact" do
      expect(subject.save).to eq(true)
      expect(subject.first_name).to eq("Fred")
      expect(subject.last_name).to eq("Blogs")
    end
    
  end

  context "Missing firstname" do
    let(:contact_params) { {"first_name"=>"", "last_name"=>"Blogs"} }
    subject { Contact.new(contact_params).save }
    
    it "should not create a contact" do
      expect(subject).to eq(false)
    end
  end

  context "Missing lastname" do
    let(:contact_params) { {"first_name"=>"Fred", "last_name"=>""} }
    subject { Contact.new(contact_params).save }
    
    it "should not create a contact" do
      expect(subject).to eq(false)
    end
    
  end
  
  
end