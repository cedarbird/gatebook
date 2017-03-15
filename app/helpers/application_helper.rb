module ApplicationHelper
  def currentuser?(user)
    current_user.id == user.id
  end
end
