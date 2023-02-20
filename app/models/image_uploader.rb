class ImageUploader < CarrierWave::Uploader::Base
  storage :dropbox
end