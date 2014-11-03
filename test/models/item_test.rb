require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  test 'should synchronize_with_server' do
    channel = create :channel, url: 'url', name: 'channel', avatar: nil, fetched_at: nil
    response = double
    body = {items: [
        {id: 1, title: 'title1', published: Time.now, author: nil, url: 'url1', content: 'content1', channel_id: channel.id},
        {id: 2, title: 'title2', published: Time.now, author: nil, url: 'url2', content: 'content2', channel_id: channel.id}
      ]}.to_json
    response.stub(:body) { body }
    RestClient.stub(:get) { response }
    Item.synchronize_with_server
    assert_equal Item.count, 2
  end

end
