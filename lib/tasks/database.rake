namespace :db do
  desc "Selectively remove passed in tables data from being imported on restore"
  task selective_restore: :environment do |_t, args|
    raise("Don't run in production") if Rails.env.production?

    config   = ActiveRecord::Base.configurations[Rails.env]
    database = config['database']
    user = config['username'] || nil
    password = config['password'] || nil
    port = config['port'] || 5432
    host = config['host'] || 'localhost'
    db_dump_filepath = Rails.root.join('lib', 'tasks', 'db.dump')
    db_list_filepath = Rails.root.join('lib', 'tasks', 'db.list')
    db_bak_filepath = Rails.root.join('lib', 'tasks', 'db.list.bak')

    `pg_restore -l #{db_dump_filepath} > #{db_list_filepath}`

    args.extras.each do |arg|
      `sed -i.bak '/TABLE DATA public #{arg.downcase}/ s/^/;/' #{db_list_filepath}`
    end

    pg_restore_command = [].tap { |rs|
      rs << "PGUSER=#{user}" if user
      rs << "PGPASSWORD=#{password}" if password
      rs << "pg_restore -h #{host} -d #{database}"
      rs << "--verbose --clean --no-acl --no-owner"
      rs << "-L #{db_list_filepath} #{db_dump_filepath}"
    }.join(' ')

    `#{pg_restore_command}`

    `rm #{db_list_filepath} #{db_bak_filepath}`
  end
end
