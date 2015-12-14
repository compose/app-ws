class PostgreSQL::DatabasesController < PostgreSQL::BaseController

  def index
    render locals: {databases: current_deployment.databases}
  end

  def current_database
    return nil unless params[:name]
    PostgreSQL::Database.new(name: params[:name], deployment: current_deployment)
  end

end