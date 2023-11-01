class User < ApplicationRecord
  belongs_to :tournament, optional: true
  belongs_to :team, optional: true
  has_many :articles
  has_many :announcements
  has_many :statistics
  has_many :games

  validates :user_name, presence: true, length: { maximum: 25 }, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  TYPE_PERMISSION = {
    president: 'A',
    vice: 'V',
    internacional: 'I',
    divulgation:'D',
    guest: 'G'
  }

  def isPresident?
    permission == TYPE_PERMISSION[:president]
  end

  def isVice?
    permission == TYPE_PERMISSION[:vice]
  end

  def isInternacional?
    permission == TYPE_PERMISSION[:internacional]
  end

  def isDivulgation?
    permission == TYPE_PERMISSION[:divulgation]
  end

  def isGuest?
    permission == TYPE_PERMISSION[:guest]
  end

  def permission_name
    I18n.translate(TYPE_PERMISSION.key(permission))
  end
end
