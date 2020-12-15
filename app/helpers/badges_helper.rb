module BadgesHelper
  def badge_notification(badges)
    @message = I18n.t('helpers.badges_helper.message', count: badges.count)
  end
  @message
end
