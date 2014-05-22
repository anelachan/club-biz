class Verification < ActiveRecord::Base
  before_save :create_remember_token

  validates :name, presence: true
  validates :uni_club_id, presence: true
  validates :president_last_name, presence: true
  validates :president_first_name, presence: true
  validates :president_email, presence: true

  def Verification.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Verification.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = Verification.digest(Verification.new_remember_token)
    end
end
