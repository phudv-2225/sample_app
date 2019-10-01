module UsersHelper
  def gravatar_for user, options = {size: Settings.user.gravatar.size}
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    image_tag Settings.user.gravatar.url, alt: user.name, class: "gravatar"
  end
end
