defmodule Cloudinaryex.Config do
  defstruct cloud_name: nil, api_key: nil, api_secret: nil

  def default do
    %Cloudinaryex.Config{
      cloud_name: Application.fetch_env!(:cloudinaryex, :cloud_name),
      api_key: Application.fetch_env!(:cloudinaryex, :api_key),
      api_secret: Application.fetch_env!(:cloudinaryex, :api_secret)
    }
  end
end