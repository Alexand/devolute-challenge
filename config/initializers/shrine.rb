# frozen_string_literal: true

require "shrine"

Shrine.plugin :determine_mime_type

if ENV["RACK_ENV"] == "test"
  require "shrine/storage/memory"

  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new,
  }
else
  require "shrine/storage/s3"

  s3_options = {
    access_key_id:     ENV["S3_ACCESS_KEY_ID"],
    secret_access_key: ENV["S3_SECRET_ACCESS_KEY"],
    bucket:            ENV["S3_BUCKET"],
    region:            ENV["S3_REGION"],
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(**s3_options),
  }
end
