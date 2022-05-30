class User < ApplicationRecord
    attr_accessor :password

    before_save :encrypt_password

    validates_confirmation_of :password, :on => :create, :message => "doesn't match confirmation"
    validates_presence_of :password, :on => :create, :message => "can't be blank"
    validates_presence_of :email, :on => :create, :message => "can't be blank"

    def authenticate(email, password)
        user = User.find_by_email(email)
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
            user
        else
            nil
        end
    end

    def encrypt_password
        if password.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
    end
end
