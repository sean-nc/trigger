require 'mechanize'

module TriggerService
  class << self
    def run
      @agent = Mechanize.new

      @url_array = ['https://finscrap1.herokuapp.com/search',
                    'https://finscrap2.herokuapp.com/search',
                    'https://finscrap3.herokuapp.com/search',
                    'https://finscrap4.herokuapp.com/search',
                    'https://finscrap5.herokuapp.com/search']

      while true
        p 'Starting infinite loop'

        @url_array.each_with_index do |url, index|
          begin
            index += 1
            p "Starting app#{index}."
            @agent.get(url)
            sleep 10
            p "No more search terms."
            return
          rescue
            p 'Blocked by Google, next app.'
            next
          end
        end
      end
    end
  end
end
