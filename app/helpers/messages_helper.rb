module MessagesHelper
  def wall_link(wall)
    content_tag(:li) do
      link_to "#{wall.user.email}", wall_path(wall)
    end
  end

  def back_to_root
    link_to "Back", root_path
  end
end
