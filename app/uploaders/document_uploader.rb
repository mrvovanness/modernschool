# encoding: utf-8

class DocumentUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(doc pdf docx odt, ppt, pptx)
  end
end
