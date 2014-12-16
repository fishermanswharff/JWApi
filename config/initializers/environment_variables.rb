module EnvironmentVariablesExample
  class Application < Rails::Application
    config.before_configuration do
      env_file = Rails.root.join("config", 'aws.yml').to_s
      if File.exists?(env_file)
        YAML.load_file(env_file)[Rails.env].each do |key, value|
          ENV[key.to_s] = value
        end
      end

      env_file = Rails.root.join("config", 'gmail.yml').to_s
      if File.exists?(env_file)
        YAML.load_file(env_file)[Rails.env].each do |key, value|
          ENV[key.to_s] = value
        end
      end
    end
  end
end