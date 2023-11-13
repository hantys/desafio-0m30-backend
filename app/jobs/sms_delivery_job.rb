class SmsDeliveryJob < ApplicationJob
  queue_as :default

  def perform(phone_number, message)
    return if Rails.env.test?

    client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])

    client.messages.create(
      from: ENV['PHONE_NUMBER'],
      to: phone_number,
      body: message
    )
  end
end