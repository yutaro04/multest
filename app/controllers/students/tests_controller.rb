class Students::TestsController < ApplicationController
  def new
    @contents = TestScraping.all
  end

  def show
  end

  def top
  end
  
end
