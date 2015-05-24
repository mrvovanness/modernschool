class DocumentUploader < CarrierWave::Uploader::Base
  def store_dir
    "modernschool/#{model.class.to_s.underscore.pluralize}/#{mounted_as.to_s.pluralize}/#{model.id}"
  end

  def extension_white_list
    %w(doc pdf docx odt ppt pptx)
  end
end
