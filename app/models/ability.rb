class Ability
  include CanCan::Ability

  def initialize(member)
    member ||= Member.new

    if member.admin?
      can :manage, :all
    else
      # Let members read everything
      can :read, :all
      # Let members manage their own profiles
      can :manage, member
      # Let members manage their own notes
      can :manage, Note, member: member
      # Let members join and leave hackrooms
      can :join, Hackroom

      can :create, ForumThread
      can :create, ForumPost
      can :manage, ForumPost, member: member
      can :manage, ForumThread, member: member
      can :like, ForumThread
      can :like, ForumPost
    end
  end
end