require 'spec_helper'
require 'rails_helper'

describe ContactsController do

  context "POST #create" do
    let(:params) { {"contact" => {"first_name"=>"Fred", "last_name"=>"Blogs"}, 
                    "commit"=>"Submit", "controller"=>"contacts", "action"=>"create"} }
  
    it "receive contact parameters" do
      post :create, params
      expect(controller.instance_variable_get(:@contact)).to be_a Contact
    end
    
    it "contact parameters to include First Name" do
      post :create, params
      expect(controller.params[:contact]).to include "first_name"
    end

    it "contact parameters to include Last Name" do
      post :create, params
      expect(controller.params[:contact]).to include "last_name"
    end

    it "contact parameters does not include address" do
      post :create, params
      expect(controller.params[:contact]).not_to include "address"
    end

  end
  
end