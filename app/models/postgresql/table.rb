class PostgreSQL::Table
  include Virtus.model

  attribute :database, PostgreSQL::Database
  attribute :deployment, PostgreSQL::Deployment

  attribute :name, String
  attribute :rows_count, Integer # Estimated, since last VACUUM

end