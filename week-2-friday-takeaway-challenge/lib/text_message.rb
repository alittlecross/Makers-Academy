# frozen_string_literal: true

require 'twilio-ruby'

# text message functionality
class TextMessage
  attr_reader :client

  def initialize
    @account_sid = 'REMOVED - Get from twilio.com'
    @auth_token = 'REMOVED - Get from twilio.com'
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send(phone_number, content)
    to = ('+44' + phone_number.to_s).to_i
    from = ('+44' + 'REMOVED - Get from twilio.com'.to_s).to_i
    client.messages.create(body: content, to: to, from: from)
    'sent'
  end
end
