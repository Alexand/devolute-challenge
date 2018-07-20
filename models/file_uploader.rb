# frozen_string_literal: true

class FileUploader < Shrine
  plugin :upload_options, store: (lambda { |_io, _context|
    { acl: "public-read" }
  })
end
