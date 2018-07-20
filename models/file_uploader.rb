# frozen_string_literal: true

class FileUploader < Shrine
  plugin :upload_options, store: (lambda { |_io, _context|
    { acl: "public-read" }
  })

  def self.s3_path(file_id)
    "https://s3.#{ENV['S3_REGION']}.amazonaws.com/#{ENV['S3_BUCKET']}/#{file_id}"
  end
end
