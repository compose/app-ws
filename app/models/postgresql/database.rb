class PostgreSQL::Database
  include Virtus.model

  attribute :deployment, PostgreSQL::Deployment
  attribute :name, String
  attribute :size, Integer

  def client
    deployment.client(name)
  end

  def tables
    client.exec(<<-eos
      SELECT 
        nspname AS schemaname,relname,reltuples
      FROM pg_class C
      LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
      WHERE 
        nspname NOT IN ('pg_catalog', 'information_schema') AND
        relkind='r' 
      ORDER BY reltuples DESC;
    eos
    ).map do |row|
      PostgreSQL::Table.new(name: row['relname'], rows_count: row['reltuples'], database: self, deployment: deployment)
    end
  end

end