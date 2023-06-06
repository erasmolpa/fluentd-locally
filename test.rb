require 'fluent-logger'

logger = Fluent::Logger::FluentLogger.new(nil, host: 'localhost', port: 24224)

logger.post('myapp.access', { 'message' => 'This is a test log message' })

logger.close
