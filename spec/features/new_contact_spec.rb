require 'spec_helper'
require 'rails_helper'

describe 'new_contact' do
  it "can add new contact from root page" do |example|
    #puts "\n\n--TEST--\n\"#{example.description}\" <<."

    Capybara.current_driver = :webkit

    visit "/"
        
    expect(page).to have_content 'Contacts'
    click_link 'New Contact'
    expect(page).to have_content 'New Contact'
  end
  
  it "can add new email to contact details" do |example|
    #puts "\n\n--TEST--\n\"#{example.description}\" <<."
    
    Capybara.current_driver = :webkit
    Capybara.javascript_driver = :webkit

    visit "/"
    
    sleep 1
    
    expect(page).to have_content 'Contacts'
    #puts "\nAdding new contact in \"#{example.description}\""
    click_link 'New Contact'
    
    sleep 1
    
    expect(page).to have_content 'New Contact'
    
    fill_in('contact_first_name', :with => 'Doug')
    fill_in('contact_last_name', :with => 'Hazell')
    puts "\nSubmitting new contact in \"#{example.description}\""
    click_button 'Submit'
    
    sleep 1
    
    expect(page).to have_content 'Successfully created contact'
    expect(page).to have_content 'Doug Hazell'
    
    fill_in('email_email', :with => 'doughazell@gmail.com')
    fill_in('email_label', :with => 'Work')
    click_button 'Add Email'
    
    # 3/5/15 DH: Need to sleep for 1 sec to allow AJAX time to alter text
    sleep 1
    expect(find(:id, 'emails').text).to have_content 'doughazell@gmail.com'
    expect(find(:id, 'emails').text).to have_content 'Work'
  end
  

end
