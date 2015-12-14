class PostgreSQL::TablesController < PostgreSQL::BaseController

  def index
    render locals: {tables: current_database.tables}
  end

end