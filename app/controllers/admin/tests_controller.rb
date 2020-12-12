class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[destroy show edit update start update_inline update_publish]
  before_action :find_tests, only: %i[index update_inline]

  def index
  end

  def show
    @test
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.tests_created.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def edit
    @test
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def update_publish
    if @test.update(complete: true)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
