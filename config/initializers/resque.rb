ENV["REDISTOGO_URL"] ||= "redis://redistogo:23f1313d9c311dc967021e31295f3758@guppy.redistogo.com:9037/"

uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password, :thread_safe => true)
