class University < ApplicationRecord
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
  # rows = driver.find_elements(:xpath, "//div[@class='tablearea']/div[@class='scrl']//tr/td[2]")
  rows = driver.find_elements(:xpath, "//div[@class='tablearea']/div[@class='scrl']//tr")
  byebug
  
  rows.each do |row|
    search = Lesson.new
    search.name = row.find_element(:xpath, "//div[@class='tablearea']/div[@class='scrl']//tr/td[2]").text
    search.professor = row.find_element(:xpath, "//div[@class='tablearea']/div[@class='scrl']//tr/td[6]").text
    search.time = row.find_element(:xpath, "//div[@class='tablearea']/div[@class='scrl']//tr/td[5]").text
    search.period = row.find_element(:xpath, "//div[@class='tablearea']/div[@class='scrl']//tr/td[4]").text
    # search.evaluation = 
    search.save
  end  

  # rows.each do |row|
  #   search = University.new
  #   search.name = diver.find_elements(:xpath, "td[1]")
  #   search.save
  # end  

  driver.quit
end
