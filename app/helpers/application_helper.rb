module ApplicationHelper

  NOTICE_KEYS = {
    alert: "alert alert-danger", notice: "alert alert-info", success: "alert alert-success",
    warning: "alert alert-warning", primary: "alert alert-primary"
  }

  def current_year
    Date.today.year
  end

  def github
    link_to 'Test-Guru', "https://github.com/birzhans/test-guru"
  end

  def message_class(key)
    NOTICE_KEYS[key.to_sym]
  end
end
