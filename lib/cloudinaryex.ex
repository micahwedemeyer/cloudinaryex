defmodule Cloudinaryex do
  @doc """
  Uploads an image to Cloudinary. Expects the file to be a path to an image file on disk.
  """
  def upload(config, file, options \\ %{}) do
    # TODO: If file is a binary (ie. not a path) save to a tmp file and then stream
    post_opts = build_upload_opts(config, file, options)
    api_url = "https://api.cloudinary.com/v1_1/#{config.cloud_name}/image/upload"
    HTTPoison.post!(api_url, {:multipart, post_opts})
  end

  @doc """
  Creates the HTTPoison options needed for the post
  """
  def build_upload_opts(config, file, options) do
    options
      |> timestamp
      |> sign(config)
      |> Map.merge(%{"api_key" => config.api_key, :file => file})
      |> Map.to_list
  end


  @doc """
  Deletes an image from Cloudinary.
  """
  def delete(config, public_id) do
    api_url = "https://api.cloudinary.com/v1_1/#{config.cloud_name}/image/destroy"
    HTTPoison.post!(api_url, {:form, build_delete_opts(config, public_id)})
  end

  @doc """
  Creates the HTTPoison options needed to delete
  """
  def build_delete_opts(config, public_id) do
    %{ "public_id" => public_id }
      |> timestamp
      |> sign(config)
      |> Map.merge(%{"api_key" => config.api_key})
      |> Map.to_list
  end

  defp sign(options, config) do
    sig = Cloudinaryex.Signature.signature(config, options)
    Map.put_new(options, "signature", sig)
  end

  defp timestamp(options) do
    Map.put_new(options, "timestamp", Cloudinaryex.Timestamp.string_timestamp())
  end
end
