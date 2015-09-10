class Account
  include Virtus.model

  attribute :id, Integer
  attribute :slug, String

  def self.find(id)
    new JSON.parse(Faraday.get("#{ENV['API_URL']}/accounts/#{id}").body)
  end

end