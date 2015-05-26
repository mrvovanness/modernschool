class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "modernschool/#{model.class.to_s.underscore.pluralize}/#{mounted_as.to_s.pluralize}/"
  end

  def default_url(*args)
    "/fallback/avatar/" + [version_name, "default.jpg"].compact.join('_')
  end

  process resize_to_fill: [160, 160]

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
