class VideoUploader < CarrierWave::Uploader::Base

  def store_dir
    "#{ENV['APP_NAME']}/#{model.class.to_s.underscore.pluralize}/#{mounted_as.to_s.pluralize}/"
  end

  def extension_white_list
    %w(mp4 ogg)
  end

end
