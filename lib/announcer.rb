class Announcer
  attr_reader :message

  def initialize(message:)
    @message = message
  end

  def call
    connection = Excon.new(webhook_url)
    connection.get(query: { targets: targets, message: message })
  end

  private

  def webhook_url
    ENV['ANNOUNCEMENT_WEBHOOK_URL']
  end

  def targets
    ENV['ANNOUNCEMENT_WEBHOOK_TARGETS']
  end
end
