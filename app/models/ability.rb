# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
    return unless user.present?
    can :read, Category, author_id: user.id
    can :manage, Category, author_id: user.id

    can :read, Expense, category: { author_id: user.id }
    can :manage, Expense, category: { author_id: user.id }
  end
end
