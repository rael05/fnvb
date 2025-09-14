# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :index, Tournament
    can :index, Team
    can :index, Article
    can :index, Statistic
    can :index, Announcement
    can :index, Calendar
    can :index, Player
    can :index, Game

    can :show, Tournament.where(enabled: true)
    can :show, Team.where(enabled: true)
    can :show, Article.where(enabled: true)
    can :show, Statistic.where(enabled: true)
    can :show, Announcement.where(enabled: true)
    can :show, Calendar.where(enabled: true)
    can :show, Player.where(enabled: true)
    can :show, Game.where(enabled: true)

    can :get_players, Player

    if user&.present?
      can :read, User.find(user.id)
      can :edit, User.find(user.id)
      can :change_password_yourself, User.find(user.id)
    end

    if user&.isPresident?
      can :get_teams_by_tournament, Calendar
      return (can :manage, User)
    end

    if user&.isVice?
      can :manage, Game
      can :game_details, Game
      return(can :manage, Tournament)
    end

    if user&.isInternacional?
      if user&.team_id&.present?
        can :create, Player
        can :manage, Player.where(team_id: user.team_id)
        return(can :manage, Team.find(user.team_id))
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
    can :enable_change, model
    if model&.find_by(user_id: user.id)&.present?
      return(can :manage, model.find_by(user_id: user.id))
    end
  end
end
