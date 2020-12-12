class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[edit update]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path, notice: t('.success')
    else
      redirect_to admin_badges_path, notice: t('.failure')
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :octicon, :color)
  end
end
