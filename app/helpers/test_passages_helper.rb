module TestPassagesHelper
  def progress(test_passage)
    (test_passage.question_index - 1) * 100 /  test_passage.test.questions.count
  end
end
