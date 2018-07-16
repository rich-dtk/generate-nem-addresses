module Catapult
  class ConfigMap
    def initialize
      require('kubeclient')
      @kube_client = ret_kube_client
      @namespace   = ret_namespace
    end

    def create_config_map(name, data_hash)
      params = {
        metadata: {
          name: name,
          namespace: self.namespace,
        },
        data: data_hash
      }
      self.kube_client.create_config_map(params)
    end
    
    def exists?(name)
      self.kube_client.get_config_map(name, namespace)
    end
    
    protected
    
    attr_reader :kube_client, :namespace
    
    private
    
    def ret_kube_client
      ssl_options = { verify_ssl: OpenSSL::SSL::VERIFY_NONE }
      auth_options = {
        bearer_token_file: '/var/run/secrets/kubernetes.io/serviceaccount/token'
      }
      ::Kubeclient::Client.new(
        'https://kubernetes.default.svc:443/api/', 'v1', ssl_options: ssl_options,  auth_options: auth_options
      )
    end
    
    def ret_namespace 
      File.read('/var/run/secrets/kubernetes.io/serviceaccount/namespace')
    end

  end
end
