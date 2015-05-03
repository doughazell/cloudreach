desc "Setup all for app"

namespace :db do
  task :create do
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    #Rake::Task['load:categories'].invoke
    #Rake::Task['load:products'].invoke
    
    puts "#######################################################################################"
    puts "# The 'db:create' task has been hooked so no other commands are necessary for the setup"
    puts "#"
    puts "# Welcome aboard"
    puts "# You're riding Ruby on Rails!"
    puts "#"
    puts "# The app can be auto tested using RSpec/Capybara by entering: 'rspec'"
    puts "#"
    puts "# Please enter: 'rails s' now and point your browser to 'localhost:3000'"
    puts "#######################################################################################"
  end
end
