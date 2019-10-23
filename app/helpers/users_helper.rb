module UsersHelper
  def gravatar_for user, options = {size: Settings.user.gravatar.size}
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    image_tag Settings.user.gravatar.url, alt: user.name, class: "gravatar"
  end

  def build_active_relationship
    current_user.active_relationships.build
  end

  def find_active_relationship id
    current_user.active_relationships.find_by followed_id: id
  end
end
