require 'google/apis/androidpublisher_v2'
require 'googleauth'
require 'googleauth/stores/file_token_store'

class AndroidVerification
  AUTH_URI = 'https://accounts.google.com/o/oauth2/auth'.freeze
  TOKEN_CREDENTIAL_URI = 'https://accounts.google.com/o/oauth2/token'.freeze
  API_SCOPE = 'https://www.googleapis.com/auth/androidpublisher'.freeze

  Androidpublisher = Google::Apis::AndroidpublisherV2

  def initialize(package_name, product_id, purchase_token)
    @package_name = package_name
    @product_id = product_id
    @purchase_token = purchase_token
  end

  def verify
    android_publisher.get_purchase_product(@package_name, @product_id, @purchase_token)
  end

  private

  def android_publisher
    android_publisher = Androidpublisher::AndroidPublisherService.new.tap do |publisher|
      publisher.authorization = client
    end
  end

  def client(scopes = [API_SCOPE])
    Signet::OAuth2::Client.new(
      authorization_uri: AUTH_URI,
      token_credential_uri: TOKEN_CREDENTIAL_URI,
      client_id: Rails.application.secrets.google_key,
      client_secret: Rails.application.secrets.google_secret,
      access_token: Rails.application.secrets.google_access_token,
      refresh_token: Rails.application.secrets.google_refresh_token,
      scope: scopes,
    )
  end
end
