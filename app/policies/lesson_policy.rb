class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    @record.course.user_id == @user.id
  end

  def update?
    @record.course.user_id == @user.id
  end

  def show?
    @record.course.user_id == @user.id || @user.has_role?(:admin)
  end

  def new?
    #@user.has_role?(:admin) || @user.has_role?(:teacher)
  end

  def create?
    #@user.has_role?(:admin) || @user.has_role?(:teacher)
  end

  def destroy?
    @record.course.user_id == @user.id
  end
end