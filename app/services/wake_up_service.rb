require 'mechanize'

module WakeUpService
  class << self
    def run
      @agent = Mechanize.new

      @url_array = ['https://fintros-scraper1.herokuapp.com/search',
                    'https://fintros-scraper2.herokuapp.com/search',
                    'https://fintros-scraper3.herokuapp.com/search',
                    'https://fintros-scraper4.herokuapp.com/search']

      @url_array.each_with_index do |url, index|
        thread = Thread.new do
          index += 1
          p "Waking up app #{index}."
          @agent.get(url)
        end
        sleep 1
        thread.exit
      end
    end
  end
end
