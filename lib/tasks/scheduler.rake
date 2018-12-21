desc "This task is called by the Heroku scheduler add-on to trigger each scraping application"
task trigger_task: :environment do
  puts "Starting Trigger"
  if SearchTerm.where(searched: false).count > 0
    10.times do |i|
      p i
      TriggerService.run
      sleep 30
    end
  end
  puts "Trigger done."
end
