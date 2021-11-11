require 'async'

Async do |task|
  while true
    puts Time.now
    task.sleep 1
  end
end
