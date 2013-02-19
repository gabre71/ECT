worker_processes 1
preload_app true
timeout 60
working_directory "/ebs/frontend/ect/"
#listen "/ebs/frontend/redmine2/tmp/sockets/unicorn.sock", :backlog => 64
listen 8081, :tcp_nopush => true
pid "/ebs/frontend/ect/tmp/pids/unicorn.pid"
stderr_path "/ebs/frontend/ect/log/unicorn.stderr.log"
stdout_path "/ebs/frontend/ect/log/unicorn.stdout.log"

Configurator::DEFAULTS[:logger].formatter = Logger::Formatter.new

#GC.respond_to?(:copy_on_write_friendly=) and
#  GC.copy_on_write_friendly = true

#before_fork do |server, worker|
#    defined?(ActiveRecord::Base) and
#    ActiveRecord::Base.connection.disconnect!
#end


#before_fork do |server, worker|
#  old_pid = '/mnt/WebApps/KipuEdu/current/tmp/pids/unicorn.pid.oldbin'
#  if File.exists?(old_pid) && server.pid != old_pid
#    begin
#      Process.kill("QUIT", File.read(old_pid).to_i)
#    rescue Errno::ENOENT, Errno::ESRCH
#      # someone else did our job for us
#    end
 # end
#end

after_fork do |server, worker|
    ActiveRecord::Base.establish_connection
end
