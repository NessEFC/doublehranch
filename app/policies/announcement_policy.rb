class AnnouncementPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin? or @current_user == @user
  end

  def update?
    @current_user.admin?
  end

  def edit?
    user.admin? || record.user == user
  end

  def destroy?
    user.admin? || record.user == user
  end

  def upload
    user.admin?
  end

  def import
    user.admin?
  end


end
