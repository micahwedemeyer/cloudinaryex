defmodule CloudinaryexTest do
  use ExUnit.Case
  doctest Cloudinaryex

  alias Cloudinaryex.Config

  setup do
    {:ok, [config: Config.default()] }
  end

  @doc """
  Test creation of the upload options
  """
  test "build upload options", %{config: config} do
    options = %{"public_id" => "sample", "folder" => "users/99/images"}
    opts = Cloudinaryex.build_upload_opts(config, "/tmp/some/file.png", options)

    assert (opts |> Enum.find(&(elem(&1, 0) == :file)) |> elem(1)) == "/tmp/some/file.png"
    assert (opts |> Enum.find(&(elem(&1, 0) == "public_id")) |> elem(1)) == "sample"
    assert (opts |> Enum.find(&(elem(&1, 0) == "folder")) |> elem(1)) == "users/99/images"

    ~w(signature timestamp api_key)
      |> Enum.each(fn(key) ->
        assert (opts |> Enum.find(&(elem(&1, 0) == key)))
      end)
  end

  test "build delete options", %{config: config} do
    opts = Cloudinaryex.build_delete_opts(config, "sample")

    assert (opts |> Enum.find(&(elem(&1, 0) == "public_id")) |> elem(1)) == "sample"
    ~w(signature timestamp api_key)
      |> Enum.each(fn(key) ->
        assert (opts |> Enum.find(&(elem(&1, 0) == key)))
      end)
  end
end
