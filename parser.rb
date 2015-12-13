require 'rubygems'
require 'net/http'
require 'nokogiri'

# Class for parsing skills on UpWork
# Simple usage :)

# skill_parser = Parsers::UpWork::SkillsParser.new ('a'..'z')
# skill_parser.scrape_pages
# p skill_parser.data

module Parsers
  module UpWork
    class SkillsParser
      attr_accessor :pages, :data

      # pages is array or range of pages
      def initialize(pages)
        fail ArgumentError 'Only array, or range' unless
          pages.is_a?(Array) || pages.is_a?(Range)
        @pages = pages || ('a'..'z')
        @data = []
      end

      def scrape_pages
        @pages.each do |page|
          uri = URI("https://www.upwork.com/i/freelancer-skills-#{page}/")
          doc = Nokogiri::HTML(Net::HTTP.get(uri)) do |config|
            config.strict.nonet.noblanks.noerror
          end

          doc.css('.skill-item').each do |list|
            skill = list.css('a').text
            @data << skill if skill
          end
        end
      end
    end
  end
end