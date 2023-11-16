# The following example uses Ruby and the Sinatra web framework to verify a webhook request:
require 'rubygems'
require 'base64'
require 'openssl'
require 'sinatra'

class ProductUpdateWebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  ACCESS_TOKEN = ''
  API_KEY = ''
  API_SECRET_KEY  =  ''

  CLIENT_SECRET = API_SECRET_KEY

  # Compare the computed HMAC digest based on the client secret and the request contents to the reported HMAC in the headers
  def verify_webhook(data, hmac_header)
    calculated_hmac = Base64.strict_encode64(OpenSSL::HMAC.digest('sha256', CLIENT_SECRET, data))
    ActiveSupport::SecurityUtils.secure_compare(calculated_hmac, hmac_header)
  end

  # Respond to HTTP POST requests sent to this web service
  def receive_webhook
    request.body.rewind
    data = request.body.read
    verified = verify_webhook(data, request.headers["HTTP_X_SHOPIFY_HMAC_SHA256"])
    head :unauthorized unless verified

    # Parse JSON payload
    payload = JSON.parse(data)

    handle_products_update(payload)
    
    head :ok
  end

  # The 'private' keyword is used to define methods that can only be called within the same class or module
  private

  def handle_products_update(payload)
    product_id = payload['id']
    updated_at = payload['updated_at']

    # Process the product update as needed
    # For example, you can fetch the updated product from Shopify using the product_id
    # and perform any necessary actions with the updated product data.

    # ...
    puts "Product with ID #{product_id} was updated at #{updated_at}"
  end
end