class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update]
  def index
    @tests = Test.all
  end

  def show
    @test
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
    @test
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :new
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

end