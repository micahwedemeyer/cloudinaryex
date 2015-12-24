defmodule CloudinaryexSignatureTest do
  use ExUnit.Case
  doctest Cloudinaryex.Signature

  alias Cloudinaryex.Config

  setup do
    {:ok, [config: Config.default()] }
  end

  @doc """
  Test creation of the signature string
  """
  test "signature string creation", %{config: config} do
    options = %{"timestamp" => "1315060510", "public_id" => "sample"}
    assert "public_id=sample&timestamp=1315060510abcd" == Cloudinaryex.Signature.signature_string(config, options)
  end

  @doc """
  Duplicate the signature example from: http://cloudinary.com/documentation/upload_images#request_authentication
  """
  test "basic signature", %{config: config} do
    options = %{"timestamp" => "1315060510", "public_id" => "sample"}
    assert "c3470533147774275dd37996cc4d0e68fd03cd4f" == Cloudinaryex.Signature.signature(config, options)
  end
end
