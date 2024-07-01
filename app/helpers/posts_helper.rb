module PostsHelper
  def sort_link(label, image, sort_param)
    user_posts_param = params[:user_posts] == 'true' ? { user_posts: 'true' } : {}
    link_to image_tag(image, class: "image image--icon-header") + label, posts_path({ sort: sort_param }.merge(user_posts_param))
  end
end
