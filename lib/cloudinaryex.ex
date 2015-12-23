defmodule Cloudinaryex do

  use Timex

  def upload(config, file, options \\ %{}) do
    api_url = "https://api.cloudinary.com/v1_1/#{config.cloud_name}/image/upload"
    {_, sig} = signature(config, options)
  end

  defp build_upload_params do
  end



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
    options = Map.put_new(options, "timestamp", string_timestamp())
    sig_string = options
      |> Map.to_list
      |> Enum.map(fn(t) ->
        put_elem(t, 0, String.downcase(elem(t, 0)))
      end)
      |> Enum.sort(fn(a,b) ->
        elem(a, 0) <= elem(b, 0)
      end)
      |> Enum.map(fn(t) ->
        "#{elem(t,0)}=#{elem(t,1)}"
      end)
      |> Enum.join("&")

    "#{sig_string}#{config.api_secret}"
  end


  defp string_timestamp do
    Time.now
      |> Time.to_secs
      |> Kernel.trunc
      |> to_string
  end
end
