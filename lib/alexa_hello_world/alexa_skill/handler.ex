defmodule AlexaHelloWorld.AlexaSkill.Handler do
  use Alexa.Skill

  def handle_launch(request, response) do
    response
    |> say("boo boo boo bop, do you want to hear a beat?")
    |> Alexa.Response.should_end_session(false)
  end

  def handle_intent("YesIntent", request, response) do
    beats = [
      "boots, cats, boots, cats, soup, soup, soup, soup",
      "poof, poof, poof, poof, gah gah gah gah gah gah gah gah"
    ]
    response
    |> say(Enum.random(beats))
    |> Alexa.Response.should_end_session(true)
  end

end
