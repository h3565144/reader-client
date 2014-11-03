class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :postgresql_lo

  # def store_dir
  #   dir = 'uploads'
  #   dir = "#{Rails.env}_#{dir}" unless Rails.env.production?
  #   "#{dir}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  version :thumb do
    process convert: 'jpg', resize_to_fill: [16, 16]
    def full_filename(for_file = nil) 
      'thumb.jpg'
    end 
  end

end
