#!/usr/bin/env -S falcon serve --bind http://localhost:7070 --count 1 -c

require 'async/websocket/adapters/rack'

app = lambda { |env|
  Async::WebSocket::Adapters::Rack.open(env) do |connection|
    message = connection.read
    puts message
    connection.write("Thank you for your kind words.")
  end
}

run app

# require 'set'
# $connections = Set.new
# run lambda { |env|
#   Async::WebSocket::Adapters::Rack.open(env, protocols: ['ws']) do |connection|
#     $connections << connection
#
#     while message = connection.read
#       $connections.each do |connection|
#         connection.write(message)
#         connection.flush
#       end
#     end
#   ensure
#     @connections.delete(connection)
#   end or [200, {}, ['Hello world']]
# }
