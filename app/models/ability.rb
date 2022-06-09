# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Client, public: true

    return unless user.present?
    can :manage, :all
  end
end
