require 'twilio-ruby'

# put your own credentials here
account_sid = ENV["SPOTIFY_ACCOUNT_SID"]
auth_token = ENV["SPOTIFY_AUTH_TOKEN"]

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
	:from => '+18329240395',
	:to => '123456789',
	:body => 'https://p.scdn.co/mp3-preview/6b00000be293e6b25f61c33e206a0c522b5cbc87',
})
