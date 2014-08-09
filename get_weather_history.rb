require 'wunderground'
require 'soda/client'
require 'yaml'

config  = YAML.load_file('cfg.yml')

w_api = Wunderground.new( config[:wunderground][:api_token] )

# API Client for bath hacked
client = SODA::Client.new({
                        :domain => config[:datastore][:domain],
                        :username => config[:datastore][:username],
                        :password => config[:datastore][:password],
                        :app_token => config[:datastore][:app_token] })

(Date.new(2014, 4, 14)..Date.new(2014, 8, 1)).each do |date|
   date_in_history = date.strftime("%Y%m%d")
   puts "Pulling data for %s" % date_in_history

   history = w_api.history_for(date_in_history, config[:wunderground][:location_id])
   puts "   found %d events" % history['history']['observations'].length
   history['history']['observations'].each_slice( config[:batchsize] ) do |obs|

      batch = []
      obs.each do |observation|
     
        utc = observation['utcdate']
        observation.delete('date')
        observation.delete('utcdate')
     
        observation['id']   = "%s-%s%s%s%s%s" % [ config[:wunderground][:location_id] , utc['year'], utc['mon'], utc['mday'], utc['hour'], utc['min'] ]
     
        observation['time'] = "%s-%s-%sT%s:%s:00Z" % [ utc['year'], utc['mon'], utc['mday'], utc['hour'], utc['min'] ]
   
        batch << observation
     end
     puts "Pushing a batch (%d) at time: %s" % [batch.length, batch[0]['time']]
     response = client.post(config[:datastore][:dataset], batch)
     puts response
   end
end
