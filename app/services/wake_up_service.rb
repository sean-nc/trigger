require 'mechanize'

module WakeUpService
  class << self
    def run
      @agent = Mechanize.new

      @url_array = ['https://finscrap1.herokuapp.com/search',
                    'https://finscrap2.herokuapp.com/search',
                    'https://finscrap3.herokuapp.com/search',
                    'https://finscrap4.herokuapp.com/search']

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
