class Students::TestsController < ApplicationController
  def new
    @contents = TestScraping.limit(63)
    @test = Test.new
  end

  def crate
    test = 
  end

  def show
  end

  def destroy
  end

  def top
  end

  private
  def test_params
    params.require(:test).permit(:visual,:introspective,:language,:music,:interpersonal,:physical,:museum,:spirituality,:logical)
  end
  
end
