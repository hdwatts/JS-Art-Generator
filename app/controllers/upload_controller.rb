class UploadController < ApplicationController
  def index
    if params["album"] == "ufQyj"
      imgur_session = Imgurapi::Session.new(client_id: ENV['IMGUR_CLIENT_ID'], client_secret: ENV['IMGUR_CLIENT_SECRET'], access_token: ENV['IMGUR_ACCESS_TOKEN'], refresh_token: ENV['IMGUR_REFRESH_TOKEN'])
      imgur_session.image.image_upload_64_params({image: params['image'], album: params['album'], description: Faker::Hipster.sentence.titleize})
      render status: 200
    else
      render status: :forbidden
    end
  end

  def color
    xml = RestClient.get('www.colourlovers.com/api/palettes/random')
    xml_doc = Nokogiri::XML(xml)
    colors = xml_doc.css('colors hex')
    output_colors = []
    colors.each do |color|
      output_colors << "#" + color.children.to_s
    end

    render json: output_colors
  end
end
