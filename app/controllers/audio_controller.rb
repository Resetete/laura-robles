class AudioController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:show]
  skip_before_action :authenticate_admin!

  require 'streamio-ffmpeg'

  def show
    project = ProjectContent.find(params[:id])

    if project.audio_file.nil?
      render plain: "No audio file found", status: :not_found
      return
    end

    audio_url = "#{project.audio_file.url}?raw=1"
    Rails.logger.info("Fetching audio from: #{audio_url}")

    response = Faraday.get(audio_url)

    if response.success?
      Rails.logger.info("Fetched audio successfully.")

      # Convert the audio file if necessary
      converted_audio = convert_to_mp3(response.body)

      # Set response headers to serve the audio file
      headers['Content-Type'] = 'audio/mpeg'
      headers['Content-Disposition'] = 'inline'
      headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'

      send_data(converted_audio, type: 'audio/mpeg', disposition: 'inline')
    else
      render plain: "Error fetching audio: #{response.status}", status: :not_found
    end
  end

  private

  def convert_to_mp3(original_audio)
    Tempfile.create(['audio', '.mp3']) do |temp_file|
      # Write the original audio data to a temporary file
      File.open(temp_file.path, 'wb') do |f|
        f.write(original_audio)
      end

      output_path = "#{temp_file.path}.mp3"

      # Use ffmpeg to convert the original audio file to MP3
      movie = FFMPEG::Movie.new(temp_file.path)
      movie.transcode(output_path)

      # Read and return the converted audio file
      File.read(output_path)
    end
  end
end
