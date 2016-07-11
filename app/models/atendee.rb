class Atendee < ActiveRecord::Base
  belongs_to :visit
  belongs_to :workshop
  attr_accessor :password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  before_create :create_code
  before_save :encrypt_password
  after_save :clear_password

  scope :confirmed, -> { where(confirmado: true) }
  scope :not_confirmed, -> { where(confirmado: false) }

  # Class methods
  def self.authenticate(email="", login_password="")
    if  EMAIL_REGEX.match(email)
      atendee = Atendee.find_by_email(email)
    end
    if atendee && atendee.match_password(login_password)
      return atendee
    else
      return false
    end
  end

  def self.check_registration(params)
    params[:confirmado] = true
    params[:fecha_registro] = Date.current
    attendee = Atendee.where(:email => params[:email], :registration_code => params[:registration_code], :confirmado => false).first
    if !attendee.nil?
      attendee.update_attributes(params)
    end
  end

  # Instance methods
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  def create_code
    o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
    code = (0...24).map { o[rand(o.length)] }.join
    self.registration_code = code
  end
end
