desc "This task is called by the Heroku scheduler add-on to trigger each scraping application"
task trigger: :environment do
  puts "Starting Trigger"
  if SearchTerm.where(searched: false).count > 0
    TriggerService.run
  end
  puts "Trigger done."
end
