class BotController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def webhook
    body = params["Body"].downcase
    response = Twilio::TwiML::MessagingResponse.new
    response.message do |message|
      message.body("Did you say #{body}?")
    end
    render xml: response.to_xml
  end

  def callback
    head :ok
  end
end
