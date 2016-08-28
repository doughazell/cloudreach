# 25/5/16 DH: Adding in bits to FnordMetric railscast Show Notes
require 'active_support'
require 'active_support/core_ext'

require "fnordmetric"
require 'byebug'

#trap "SIGINT" do
#  puts "Exiting"
#  exit 130
#end

FnordMetric.namespace :store do
  hide_active_users

  toplist_gauge :popular_contacts, title: "Popular Contacts"

=begin
  toplist_gauge :popular_products, title: "Popular Products"

  distribution_gauge :popular_prices, title: "Popular Prices",
    value_ranges: [0..5, 5..10, 10..20, 20..50, 50..10000]

  gauge :product_views_per_second, tick: 1.second
  
  widget "Product Views",
    title: "Views per Second",
    type: :timeline,
    width: 100,
    gauges: :product_views_per_second,
    include_current: true,
    autoupdate: 1

  event :view_product do
    observe :popular_products, data[:name]
    observe :popular_prices, data[:price]
    incr :product_views_per_second
  end
=end
  
  event :view_contact do
#debugger
    observe :popular_contacts, data[:first_name] + " " + data[:last_name]
  end
end

FnordMetric::Web.new(port: 4242)
FnordMetric::Worker.new
FnordMetric.run

