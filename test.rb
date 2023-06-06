require 'fluent-logger'

# Configura el logger de Fluentd para enviar eventos a localhost en el puerto 24224
logger = Fluent::Logger::FluentLogger.new(nil, host: 'localhost', port: 24224)

# Envía un evento de prueba al flujo de datos
logger.post('myapp.access', { 'message' => 'This is a test log message' })

# Cierra la conexión del logger de Fluentd
logger.close
