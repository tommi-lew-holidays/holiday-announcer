require 'spec_helper'

describe Announcer do
  def webhook_url
    ENV['ANNOUNCEMENT_WEBHOOK_URL']
  end

  def add_stubs
    stub_request(:get, webhook_url).
      with(query: { 'targets' => '#general', 'message' => 'This is an annoucement' }).
      to_return(status: 200)
  end

  it 'invokes a GET request with Excon' do
    add_stubs

    announcer = Announcer.new(message: 'This is an annoucement')
    announcer.call

    expect(WebMock).to have_requested(:get, webhook_url).with(query: { 'targets' => '#general', 'message' => 'This is an annoucement' })
  end
end
