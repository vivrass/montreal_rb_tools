module LoadEnvironment
  # These secret values cannot be commited to git
  def self.load_keys_from_file(keys_file_path="#{Rails.root}/.env_key.sh")
    # Won't be present on Heroku, see rake heroku:update_keys
    if File.exists?(keys_file_path)
      File.open(keys_file_path, "r") do |f|
        f.each_line do |line|
          next unless /export (\w+)=(.+)/ === line
          save_key($1, $2)
        end
      end
    end
  end

  def self.save_key(key, value)
    ENV[key.to_s] = value.to_s
  end
end
