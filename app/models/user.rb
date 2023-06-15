class User < ApplicationRecord
  belongs_to :tournament, optional: true
  belongs_to :team, optional: true

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
end
