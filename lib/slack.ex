defmodule Slack do
  @moduledoc """
  Slack API 모듈
  """

  @doc """
  슬랙 메시지 전송
  """
  def send_message(channel, text) do
    url = "https://slack.com/api/chat.postMessage"
    headers = [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer xoxb-5933738371735-5945357304293-Jlxa74BbSvhhHnzuAHJtzsa9"}
    ]
    payload = %{
      channel: channel,
      text: text
    }
    case HTTPoison.post(url, Jason.encode!(payload), headers) do
      {:ok, %{body: body}} ->
        body
      {:error, %{body: body}} ->
        IO.puts(body)
    end
  end
end
