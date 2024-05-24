class ImagesController < ApplicationController
  def show
    img = Image.find_by id: params[:id]

    if img
      image = img.image

      data = image.download
      type = image.content_type
      ext = image.filename.to_s.split('.').last
      filename = "image_#{img.id}.#{ext}"
    else
      image_path = Rails.public_path.join('missing.png')
      image = image_path.open('rb')

      data = image.read
      type = 'image/png'
      filename = 'missing.png'
    end

    send_data data, type:, filename:, disposition: 'inline'
  end
end
