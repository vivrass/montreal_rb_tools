namespace :heroku do
  desc "Save environment variable to heroku server (see .env_key.sh)"
  task :update_keys do
    keys = %w{MONTREALRB_CONSUMER_KEY MONTREALRB_CONSUMER_SECRET}

    puts "Updating keys: #{keys.join(", ")}"
    `heroku config:add #{keys.map{|k| "#{k}=#{ENV[k]}"}.join(" ")}`
  end

  desc "Deploy to heroku"
  task :deploy do
    Rake::Task["heroku:update_keys"]

    puts "Pushing to server"
    `git push heroku master`

    puts "Updating database"
    `heroku rake db:migrate`
  end
end
