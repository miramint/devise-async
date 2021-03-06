require "sneakers"

module Devise
  module Async
    module Backend
      class Sneakers < Base
        include ::Sneakers::Worker
        from_queue "devise_mailer",
                   :arguments => {
                       :'x-dead-letter-exchange' => 'devise_mailer-retry'
                   }

        def self.enqueue(*args)
          ::Sneakers::Publisher.new.publish(args.to_json, {:to_queue => self.queue_name})
        end

        def work(json_string)
          args = JSON.parse(json_string)

          perform(*args)

          ack!
        end
      end
    end
  end
end