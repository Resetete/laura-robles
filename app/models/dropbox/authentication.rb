module Dropbox
  class Authentication
    # TODO: need to store the access_token as long as it is valid
    def self.access_token
      url = 'https://api.dropbox.com/oauth2/token'

      # authenticate
      payload = {
        grant_type: 'refresh_token',
        refresh_token: Rails.application.credentials.dig(:dropbox, :refresh_token),
        client_id: Rails.application.credentials.dig(:dropbox, :app_key),
        client_secret: Rails.application.credentials.dig(:dropbox, :app_secret)
      }

      # get access_token
      response = RestClient.post(url, payload)
      JSON.parse(response.body)['access_token']
    end
  end
end
