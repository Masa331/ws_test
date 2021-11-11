#!/usr/bin/env ruby

require 'async'
require 'async/http/endpoint'
require 'async/websocket/client'
require 'async/io/stream'
require 'pry'

USER = 'anonymous'
URL = 'http://localhost:7070'

Async do |task|
  # stdin = Async::IO::Stream.new(Async::IO::Generic.new($stdin))

  endpoint = Async::HTTP::Endpoint.parse(URL)

  res = Async::WebSocket::Client.connect(endpoint) do |connection|
    # input_task = task.async do
    #   while line = stdin.read_until("\n")
    #     puts 'foobar'
    #     connection.write({ user: USER, test: line })
    #     connection.flush
    #   end
    # end

    # task.async do
    #   # while true
    #     connection.write('ping')
    #     # task.sleep 1
    #   # end
    # end

    connection.write('ping')
    connection.write('ping 2')
    connection.flush

    # task.async do
    #   # if connection
    #   # message = connection.read
    #   # p(message) if message
    #   # end
    #   while true
    #     task.sleep 1
    #     message = connection.read
    #     p(message) if message
    #   end
    # end
  end
end
