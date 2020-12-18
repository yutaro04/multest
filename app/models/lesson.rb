class Lesson < ApplicationRecord
  require "selenium-webdriver"
  driver = Selenium::WebDriver.for :chrome
  driver.navigate.to "https://j29-asw.osaka-sandai.ac.jp/uniasv2/UnSSOLoginControlFree"
  select1 = Selenium::WebDriver::Support::Select.new(driver.find_element(:name, 'selLsnOpcFcy'))
  select1.select_by(:value, '2020')
  select2 = Selenium::WebDriver::Support::Select.new(driver.find_element(:name, 'selEsorNm'))
  select2.select_by(:value, '2')
  select2 = Selenium::WebDriver::Support::Select.new(driver.find_element(:name, 'selSlbaflNm'))
  select2.select_by(:value, '53 02 00')
  unless driver.find_element(:id, 'chkPlrlSpcflnp_01_1').selected?
    driver.find_element(:id, 'chkPlrlSpcflnp_01_1').click
  end
  
  driver.find_element(:name, 'ESearch').click
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until { driver.find_element(:id, 'contents').displayed? }
  rows1 = driver.find_elements(:xpath, "//div[@class='tablearea']/div[@class='scrl']//tr")
  rows = rows1.map {|row1| row1.text.split }
  genre = ["visual","introspective","language","music","interpersonal","physical","museum","pirituality","logical"]
  num = 0
  rows.each do |row|
      search = Lesson.new
      search.genre = genre.sample
      search.name = row[1]
      search.professor = row[7]
      search.time = row[5] + row[6]
      search.period = row[4]
      # search.evaluation = 
      search.save
  end
byebug
  driver.quit

end
