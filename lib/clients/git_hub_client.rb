class GitHubClient

  ROOT_ENDPOINT = "https://api.github.com"
  ACCESS_TOKEN = "c9769775002f74b8f5a2322769329871197204ae"

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists', params) do |request|
      request.headers["Authorization"] = "token #{ACCESS_TOKEN}"
      request.headers["Content-Type"] = "application/json"
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
