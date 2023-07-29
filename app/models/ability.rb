# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Tournament
    can :read, Team
    can :read, Article
    can :read, Statistic
    can :read, Announcement
    can :read, Calendar

    if user&.isPresident?
      return (can :manage, User)
    end

    if user&.isVice?
      return(can :manage, Tournament)
    end

    if user&.isInternacional?
      if user&.team_id&.present?
        return(can :edit, Team.find(user.team_id))
      end
      if user&.tournament_id&.present?
        return(can :create, Team)
      end
    end

    if user&.isDivulgation?
      divulgationBasicsAbilities(Article, user)
      divulgationBasicsAbilities(Statistic, user)
      divulgationBasicsAbilities(Announcement, user)
      return(can :manage, Calendar)
    end
  end

  private
  def divulgationBasicsAbilities(model, user)
    can :create, model
    if model&.find_by(user_id: user.id)&.present?
      return(can :manage, model.find_by(user_id: user.id))
    end
  end
end
