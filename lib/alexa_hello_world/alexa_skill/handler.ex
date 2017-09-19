defmodule AlexaHelloWorld.AlexaSkill.Handler do
  use Alexa.Skill

  def handle_launch(request, response) do
    response
    |> say("Welcome")
    |> Alexa.Response.should_end_session(false)
  end

  def handle_intent("SayHello", request, response) do
    response
    |> say("Hello World")
    |> Alexa.Response.should_end_session(true)
  end
end
