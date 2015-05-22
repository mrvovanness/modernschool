class PictureUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    "/fallback/" + [version_name, "default.jpg"].compact.join('_')
  end

  process resize_to_fill: [500, 500]
  
  version :thumb do
    process :resize_to_fill => [160, 160]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
