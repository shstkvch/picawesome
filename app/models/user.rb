class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable    #:validatable # borked
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates_uniqueness_of   :email,    case_sensitive: false,     allow_blank: true, if: :email_changed?
  validates_format_of       :email,    with: Devise.email_regexp, allow_blank: true, if: :email_changed?
  validates_presence_of     :password, on: :create
  validates_confirmation_of :password, on: :create
  validates_length_of       :password, within: Devise.password_length, allow_blank: false, on: :create

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :username
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }


  has_many :pics
  has_many :votes
end
