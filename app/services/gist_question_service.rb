class GistQuestionService

  attr_reader :client

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV["ACCESS_TOKEN"])
  end

  def call
    @client.create_gist(gist_params)
  end

  def url
    self.client.last_response.headers[:location]
  end

  private

  def gist_params
    {
      description: I18n.t('gist.description', title: @test.title),
      files: {
        "test_guru_#{@question.body}.txt" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
