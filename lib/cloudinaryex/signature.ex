defmodule Cloudinaryex.Signature do
  @doc """
  Creates the hashed signature value for the Cloudinary request.
  """
  def signature(config, options) do
    :crypto.hash(:sha, signature_string(config, options)) |> Base.encode16 |> String.downcase
  end

  @doc """
  Creates the un-hashed signature string used for signing the Cloudinary request.
  """
  def signature_string(config, options) do
    sig_string = options
      |> Map.put_new("timestamp", Cloudinaryex.Timestamp.string_timestamp())
      |> Map.to_list
      |> Enum.map(fn(t) ->
        put_elem(t, 0, String.downcase(elem(t, 0)))
      end)
      |> Enum.sort(&(elem(&1, 0) <= elem(&2, 0)))
      |> Enum.map(&("#{elem(&1, 0)}=#{elem(&1, 1)}"))
      |> Enum.join("&")

    "#{sig_string}#{config.api_secret}"
  end
end
