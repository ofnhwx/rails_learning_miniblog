# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: :png
  process resize_to_limit: [2048, 2048]

  version :thumb do
    process resize_to_fill: [80, 80, 'Center']
  end
end
