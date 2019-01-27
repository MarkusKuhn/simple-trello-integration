namespace :webhooks do
  desc "Start webhooks by resetting all individual webhooks"
  task :initialize => :environment do
    TrelloWebhooksInteraction.new.initialize_webhooks
  end
end