class ApiKey
  TOKENS = ['abc']

  def self.exists?(access_token:)
    TOKENS.include? access_token
  end
end
