require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './course.rb'

class Scraper

    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  def get_page
    doc = Nokogiri::HTML(open('http://learn-co-curriculum.github.io/site-for-scraping/courses'))
  end

  def get_courses
    doc = Nokogiri::HTML(open('http://learn-co-curriculum.github.io/site-for-scraping/courses'))
     doc.css(".post")

    #  .each do
    #    |course|
    #   courses = Course.new
    #   courses.title = course.css('h2').text
    #   courses.schedule = course.css('em').text
    #   courses.description = course.css('p').text
    # end

  end

  def make_courses
    self.get_courses.each do
       |course|
      courses = Course.new
      courses.title = course.css('h2').text
      courses.schedule = course.css('em').text
      courses.description = course.css('p').text
    end

  end


end
