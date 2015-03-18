require 'digest/sha2'

class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :password, :presence => true, :confirmation => true, :length => {minimum: 4, maximum: 30}
  validates :password_confirmation, :presence => true
  validate :password_must_be_present
  attr_reader :password

  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end

  end

  class << self
    def authenticate(name, password)
      user = find_by_name(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end

    def encrypt_password(password, salt)
      Digest::SHA2.hexdigest(password + "fuck" + salt)
    end
  end

  private
    def password_must_be_present
      errors.add(:password, "Missing Password") unless hashed_password.present?
    end

    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end

end
