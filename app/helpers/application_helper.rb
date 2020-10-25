module ApplicationHelper
  def current_year
    Date.today.year
  end

  def github
    link_to 'Test-Guru', "https://github.com/birzhans/test-guru"
  end
end
