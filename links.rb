#!/usr/bin/ruby

require 'rubygems'
require 'twitter'

search_term = ARGV[0]
pages = ARGV[1]

search_term = '#sxsw' if search_term.empty?
pages = 25 if pages.empty?

(1..pages.to_i).each do |page_number|
  results = Twitter.search(search_term, :page => page_number)

  results.each do |result|
    if result.text.include?('http://') && !result.text.include?('RT')
      p "#{result.from_user} : #{result.text}"
    end
  end
end
