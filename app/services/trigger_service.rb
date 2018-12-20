require 'mechanize'

module TriggerService
  class << self
    def run
      @agent = Mechanize.new

      @url_array = ['https://fintros-scraper1.herokuapp.com/search',
                    'https://fintros-scraper2.herokuapp.com/search',
                    'https://fintros-scraper3.herokuapp.com/search',
                    'https://fintros-scraper4.herokuapp.com/search']

      p 'Starting infinite loop'

      @url_array.each_with_index do |url, index|
        begin
          index += 1
          p "Starting app#{index}."
          @agent.get(url)
          p "No more search terms."
          next
        rescue
          p 'Blocked by Google, next app.'
          next
        end
      end
    end
  end
end
