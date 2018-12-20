desc "This task is called by the Heroku scheduler add-on to trigger each scraping application"
task trigger: :environment do
  puts "Starting Trigger"
  TriggerService.run
  puts "Trigger done."
end
