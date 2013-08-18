module UsersHelper
  def render_user(user)
    content_tag_string("span", user.name, {
      "class" => "author #{user.name}"
    })
  end
end
