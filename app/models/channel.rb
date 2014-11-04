class Channel < ActiveRecord::Base

  has_many :items, dependent: :destroy

  def self.synchronize_with_server
    server_url = "#{server_api_url}/channels"
    id = order(id: :desc).first.try :id
    response = RestClient.get server_url, {params: {after_id: id}}
    ActiveRecord::Base.transaction do
      JSON.parse(response.body)['channels'].each do |data|
        create data
      end
    end
  end

  def self.server_api_url
    api_url = ENV['READER_SERVER_API_URL']
    raise "requires ENV['READER_SERVER_API_URL']" unless api_url
    api_url
  end

end
