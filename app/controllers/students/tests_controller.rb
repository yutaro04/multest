class Students::TestsController < ApplicationController
  def new
    @contents = TestScraping.limit(63)
    @test = Test.new
  end

  def create
    test = Test.new
    num = 0
    visual = 1
    introspective = 1
    language = 1
    music = 1
    interpersonal = 1
    physical = 1
    museum = 1
    spirituality = 1
    logical = 1
    a_score = 0.57
    b_score = 0.43
    c_score = 0.29
    d_score = 0.14
    e_score = 0
    63.times do
      num += 1
      score = params["q_#{num}"]
      score = score[0]
      judge = params["q_#{num}"]
      judge.slice!(0)
      judge = judge.to_i
      if judge%9 == 1
        if score == "a"
          visual += a_score
        elsif score == "b"
          visual += b_score
        elsif score == "c"
          visual += c_score
        elsif score == "d"
          visual += d_score
        elsif score == "e"
          visual += e_score
        end
      end
      if judge%9 == 2
        if score == "a"
          introspective += a_score
        elsif score == "b"
          introspective += b_score
        elsif score == "c"
          introspective += c_score
        elsif score == "d"
          introspective += d_score
        elsif score == "e"
          introspective += e_score
        end
      end
      if judge%9 == 3
        if score == "a"
          language += a_score
        elsif score == "b"
          language += b_score
        elsif score == "c"
          language += c_score
        elsif score == "d"
          language += d_score
        elsif score == "e"
          language += e_score
        end
      end
      if judge%9 == 4
        if score == "a"
          music += a_score
        elsif score == "b"
          music += b_score
        elsif score == "c"
          music += c_score
        elsif score == "d"
          music += d_score
        elsif score == "e"
          music += e_score
        end
      end
      if judge%9 == 5
        if score == "a"
          interpersonal += a_score
        elsif score == "b"
          interpersonal += b_score
        elsif score == "c"
          interpersonal += c_score
        elsif score == "d"
          interpersonal += d_score
        elsif score == "e"
          interpersonal += e_score
        end
      end
      if judge%9 == 6
        if score == "a"
          physical += a_score
        elsif score == "b"
          physical += b_score
        elsif score == "c"
          physical += c_score
        elsif score == "d"
          physical += d_score
        elsif score == "e"
          physical += e_score
        end
      end
      if judge%9 == 7
        if score == "a"
          museum += a_score
        elsif score == "b"
          museum += b_score
        elsif score == "c"
          museum += c_score
        elsif score == "d"
          museum += d_score
        elsif score == "e"
          museum += e_score
        end
      end
      if judge%9 == 8
        if score == "a"
          spirituality += a_score
        elsif score == "b"
          spirituality += b_score
        elsif score == "c"
          spirituality += c_score
        elsif score == "d"
          spirituality += d_score
        elsif score == "e"
          spirituality += e_score
        end
      end
      if judge%9 == 0
        if score == "a"
          logical += a_score
        elsif score == "b"
          logical += b_score
        elsif score == "c"
          logical += c_score
        elsif score == "d"
          logical += d_score
        elsif score == "e"
          logical += e_score
        end
      end
    end
    if visual != 1
      visual += 0.01
    end
    if introspective != 1
      introspective += 0.01
    end
    if language!= 1
      language += 0.01
    end
    if music != 1
      music += 0.01
    end
    if interpersonal != 1
      interpersonal += 0.01
    end
    if physical != 1
      physical += 0.01
    end
    if museum != 1
      museum += 0.01
    end
    if spirituality != 1
      spirituality += 0.01
    end
    if logical != 1
      logical += 0.01
    end
    test.visual = visual.round(2)
    test.introspective = introspective.round(2)
    test.language = language.round(2)
    test.music = music.round(2)
    test.interpersonal = interpersonal.round(2)
    test.physical = physical.round(2)
    test.museum = museum.round(2)
    test.spirituality = spirituality.round(2)
    test.logical = logical.round(2)
    test.student_id = current_student.id
    test.save
    redirect_to students_test_path(test)
  end

  def show
    num = current_student.tests.count
    num -= 1
    @test = current_student.tests[num]
    @recomends = []
    if @test.visual >= 4
      @recomends.push(Lesson.find_by(genre: "visual"))
    end
    if @test.introspective >= 4
      @recomends.push(Lesson.find_by(genre: "introspective"))
    end
    if @test.language >= 4
      @recomends.push(Lesson.find_by(genre: "language"))
    end
    if @test.music >= 4
      @recomends.push(Lesson.find_by(genre: "music"))
    end
    if @test.interpersonal >= 4
      @recomends.push(Lesson.find_by(genre: "interpersonal"))
    end
    if @test.physical >= 4
      @recomends.push(Lesson.find_by(genre: "physical"))
    end
    if @test.museum >= 4
      @recomends.push(Lesson.find_by(genre: "museum"))
    end
    if @test.spirituality >= 4
      @recomends.push(Lesson.find_by(genre: "spirituality"))
    end
    if @test.logical >= 4
      @recomends.push(Lesson.find_by(genre: "logical"))
    end
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
