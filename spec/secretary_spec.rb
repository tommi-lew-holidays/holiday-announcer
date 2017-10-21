require 'spec_helper'

describe Secretary do
  describe 'next day is a holiday' do
    def webhook_url
      ENV['ANNOUNCEMENT_WEBHOOK_URL']
    end

    def add_stubs
      stub_request(:get, webhook_url).
        with(query: { 'targets' => '#general', 'message' => "It's National Day in sg tomorrow. Happy National Day!" }).
        to_return(status: 200)
    end

    it 'triggers an annoucement' do
      add_stubs
      current_year = Date.today.year

      # Singapore's National Day
      Timecop.freeze(Date.new(Date.today.year, 8, 8)) do
        Secretary.new.call
      end

      expect(WebMock).to have_requested(:get, webhook_url).with(query: { 'targets' => '#general', 'message' => "It's National Day in sg tomorrow. Happy National Day!" })
    end
  end
end
