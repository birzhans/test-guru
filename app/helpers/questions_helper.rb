module QuestionsHelper
  def form_header(question)
    if @question.new_record?
      "Create new #{@test.title} question"
    else
      "Edit #{@test.title} question"
    end
  end
end
