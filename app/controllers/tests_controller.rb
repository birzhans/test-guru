class TestsController < ApplicationController
  def index
    render html: '<h1>Test-guru: website for running tests</h1>'.html_safe
  end

  def show
    redirect_to root_path
  end
end
