module ApplicationHelper
  def current_year
    Date.today.year
  end

  def github
    link_to 'Test-Guru', "https://github.com/birzhans/test-guru"
  end

  def flash_message(alert)
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
end
