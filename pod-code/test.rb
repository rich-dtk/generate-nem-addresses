require('kubeclient')
ssl_options = { verify_ssl: OpenSSL::SSL::VERIFY_NONE }
auth_options = {
  bearer_token_file: '/var/run/secrets/kubernetes.io/serviceaccount/token'
}
client = Kubeclient::Client.new(
  'https://kubernetes.default.svc:443/api/', 'v1', ssl_options: ssl_options,  auth_options: auth_options
)
namespace = File.read('/var/run/secrets/kubernetes.io/serviceaccount/namespace')
require 'pp'
pp "namespace = #{namespace}"
pp client.get_pods(namespace: namespace)

require('json')
cm = {
  metadata: {
    name: 'test',
    namespace: 'test'
  },
  data: {
    val: JSON.generate([:a, :b])
  }
}
client.create_config_map(cm)
