class PostgreSQL::Deployment < Deployment
  
  def client(db_name = 'postgres')
    PG::Connection.new({
      host: host,
      port: port,
      user: username,
      password: password,
      dbname: db_name
    })
  end

  def databases
    client.exec(<<-eos
      SELECT pg_database.datname
      FROM pg_database
      WHERE datistemplate = false;
    eos
    ).select {|row| row['datname'] != 'postgres'}.map do |row|
      PostgreSQL::Database.new(name: row['datname'], deployment: self)
    end
  end

end