namespace :synchronize do
  task all: :environment do
    [Channel, Item].each &:synchronize_with_server
  end

  task channel: :environment do
    Channel.synchronize_with_server
  end

  task item: :environment do
    Item.synchronize_with_server
  end
end
