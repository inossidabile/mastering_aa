namespace :db do
  desc 'Remove and install new database from scratch'
  task :install => [:drop_tables, :'db:migrate', :'db:seed'] do
  end

  task :drop_tables => :environment do
    puts "Droping all tables..."
    puts "-"*10

    ActiveRecord::Base.connection.drop_table "schema_migrations" rescue nil

    root   = File.expand_path('../../../app/models/', __FILE__)
    models = Dir["#{root}/**"].each{|x| require x; }
    tables = ActiveRecord::Base.connection.tables

    ActiveRecord::Base.subclasses.map{|x| x.table_name}.each do |x|
      ActiveRecord::Base.connection.drop_table x if tables.include? x
      puts "#{x} droped;"
    end
    puts "-"*10
  end
end
