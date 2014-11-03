require 'test_helper'

class ChannelTest < ActiveSupport::TestCase

  test 'should synchronize_with_server' do
    response = double
    body = {channels: [
        {id: 1, url: 'url1', name: 'channel1', avatar: nil, fetched_at: nil},
        {id: 2, url: 'url2', name: 'channel2', avatar: nil, fetched_at: nil}
      ]}.to_json
    response.stub(:body) { body }
    RestClient.stub(:get) { response }
    Channel.synchronize_with_server
    assert_equal Channel.count, 2
  end

end
