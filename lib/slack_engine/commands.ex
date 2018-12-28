defmodule SlackEngine.Commands do
  alias __MODULE__

  @enforce_keys [:token]
  defstruct [:token]

  def new() do
    token = System.get_env("SLACK_TOKEN")
    %Commands{token: token}
  end

  def create_channel(%Commands{token: token}, name) do
    url = "https://slack.com/api/channels.create"
    params = %{"token" => token,
    	         "name" => name,
	             "validate" => "true"}
    headers = [{"Content-Type", "application/json;charset=utf-8"}]
    {:ok, res} = HTTPoison.post(url, "", headers, params: params)
    200 = res.status_code
    {:ok, body} = Poison.decode(res.body)
    case body["ok"] do
      true ->
        body["channel"] 
      false ->
        body["error"]  
    end
  end
end
