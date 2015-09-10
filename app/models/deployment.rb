class Deployment
  include Virtus.model

  attribute :type, String
  attribute :account_id, Integer
  attribute :name, Integer

  attribute :port, Integer
  attribute :host, String

  attribute :username, String
  attribute :password, String

  def self.find(id)
    response = Faraday.get("#{ENV['API_URL']}/deployments/#{id}")
    body = JSON.parse(response.body)
    class_by_type(body['type']).new(body)
  end

  def self.class_by_type(type)
    "#{type.classify}::Deployment".constantize
  end

end