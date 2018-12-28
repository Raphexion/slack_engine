defmodule SlackEngineTest do
  use ExUnit.Case
  doctest SlackEngine

  test "greets the world" do
    assert SlackEngine.hello() == :world
  end
end
