module QuestionsHelper
  def form_header(question)
    if @question.new_record?
      "#{I18n.t('admin.create')} #{I18n.t('admin.question')} #{@test.title} "
    else
      "#{I18n.t('admin.edit')} #{I18n.t('admin.question')}"
    end
  end
end
