# Cloudinaryex

## Warning
This is my first Hex module and nearly my first experiment with Elixir. I'm cargo culting other Hex modules as much as possible, but don't expect perfection here.

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
