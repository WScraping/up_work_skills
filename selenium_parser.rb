require 'rubygems'
require 'selenium-webdriver'


# skill_parser = Parsers::UpWork::SkillsParser.new('a'...'c')
# skill_parser.scrape_pages
# p skill_parser.data

module Parsers
  module UpWork
    class SkillsParser
      attr_accessor :pages, :browser, :data

      # pages is array or range of pages
      def initialize(pages)
        fail ArgumentError 'Only array, or range' unless
          pages.is_a?(Array) || pages.is_a?(Range)
        @pages = pages || ('a'..'z')
        @browser = Selenium::WebDriver.for :firefox
        @data = []
      end

      def scrape_pages
        @pages.each do |page|
          @browser.get "https://www.upwork.com/i/freelancer-skills-#{page}/"
          links_xpath = "//*[contains(@class, 'skill-item')]/a"
          links = @browser.find_elements(:xpath, links_xpath).map(&:text)
          @data.concat(links)
        end
        @browser.quit
      end
    end
  end
end
