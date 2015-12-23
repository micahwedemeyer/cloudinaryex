defmodule Cloudinaryex.Timestamp do
  use Timex
  
  def string_timestamp do
    Time.now
      |> Time.to_secs
      |> Kernel.trunc
      |> to_string
  end
end
