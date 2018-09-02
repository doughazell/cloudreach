# 25/5/16 DH: Adding in bits to FnordMetric railscast Show Notes
require 'active_support'
require 'active_support/core_ext'

require "fnordmetric"
require 'byebug'

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
    observe :popular_contacts, data[:first_name] + " " + data[:last_name]
  end
end

# 30/8/16 DH: Solving Ctrl-C block for when Thin is started via Rack
=begin
---------------------------------------------------------------------------
'~/.rvm/gems/ruby-2.2.2/gems/fnordmetric-1.2.9/lib/fnordmetric/web/web.rb':

class FnordMetric::Web
  def initialize(opts)
    @opts = opts

    @opts[:server] ||= "thin"
    @opts[:host]   ||= "0.0.0.0"
    @opts[:port]   ||= "4242"

    FnordMetric.register(self)
  end

  def initialized
    ...
    Rack::Server.start(
      :app => dispatch,
      :server => server,
      :Host => host,
      :Port => port,

      # 30/8/16 DH: Allowing Ctrl-C to work with Thin recent versions
      # 27/7/18 DH: If 'FnordMetric::Web.new(...,signals: false)' then Thin won't catch the INT signal 
      #             (thin-1.7.0/lib/thin/server.rb:136)
      #             and it will propagate to the FnordMetric Rack wrapper
      :signals => @opts[:signals]
    )
  end
end
-------------------------------------------------------------------
'~/.rvm/gems/ruby-2.2.2/gems/fnordmetric-1.2.9/lib/fnordmetric.rb':
module FnordMetric
  def self.register(obj)
    @@pool.push(obj)
  end

  def self.run
    start_em
    ...
  end

  def self.start_em
    EM.run do

      trap("TERM", &method(:shutdown))
      trap("INT",  &method(:shutdown))

      EM.next_tick do
        (@@pool || []).map(&:initialized)
      end

    end
  end
end
-------------------------------------------------------------------
=end

#FnordMetric::Web.new(port: 4242)
FnordMetric::Web.new(port: 4242, signals: false)

FnordMetric::Worker.new
FnordMetric.run()
