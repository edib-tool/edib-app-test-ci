defmodule EdibAppTestCi do
  def hello do
    IO.puts "Hello from EDIB App Test CI!"
    :init.stop(0)
  end
end
