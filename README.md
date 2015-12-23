# Cloudinaryex

## Warning
This is my first Hex module and nearly my first experiment with Elixir. I'm cargo culting other Hex modules as much as possible, but don't expect anything close to perfection here.

## Overview
A wrapper around the Cloudinary HTTP API for uploading and interacting with images.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add cloudinaryex to your list of dependencies in `mix.exs`:

        def deps do
          [{:cloudinaryex, "~> 0.0.1"}]
        end

  2. Ensure cloudinaryex is started before your application:

        def application do
          [applications: [:cloudinaryex]]
        end

## Usage

To upload an image:

    config = %Cloudinaryex.Config{cloud_name: "my-cloud", api_key: "1234", api_secret: "abcd"}
    Cloudinaryex.upload(config, "/path/to/image.jpg", %{ "folder" => folder })

To delete an image:

    Cloudinaryex.delete(config, "image-public-id")

## TODO

* Binary image data uploads (as opposed to file on disk)
* Upload-via-URL
* Better wrapping of responses
* Fault tolerance and error handling
* Pretty much everything beyond basic upload and delete