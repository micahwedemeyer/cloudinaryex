defmodule CloudinaryexTest do
  use ExUnit.Case
  doctest Cloudinaryex

  alias Cloudinaryex.Config

  setup do
    {:ok, [config: %Config{cloud_name: "my-cloud", api_key: "1234", api_secret: "abcd"}] }
  end

  @doc """
  Test creation of the signature string
  """
  test "signature string creation", %{config: config} do
    options = %{"timestamp" => "1315060510", "public_id" => "sample"}
    assert "public_id=sample&timestamp=1315060510abcd" == Cloudinaryex.signature_string(config, options)
  end

  @doc """
  Duplicate the signature example from: http://cloudinary.com/documentation/upload_images#request_authentication
  """
  test "basic signature", %{config: config} do
    options = %{"timestamp" => "1315060510", "public_id" => "sample"}
    assert "c3470533147774275dd37996cc4d0e68fd03cd4f" == Cloudinaryex.signature(config, options)
  end
end
