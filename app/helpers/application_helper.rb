module ApplicationHelper
  def set_page_title(title)
    @page_title = title + " | West London Coders"
  end

  def set_page_description(description)
    @page_description = description || "Dive into web development with relaxed and friendly developers at the stunning NET-A-PORTER HQ in Westfield, White City."
  end

  def set_page_image(image)
    @page_image = image || "http://westlondoncoders.com/img/general/twitter.jpg"
  end

  def page_twitter(twitter)
    @page_twitter = twitter || @user.twitter || @post.created_by.twitter || "@westlondoncode"
  end

  def social_url(handle, site)
    link_to "https://#{site}.com/#{handle}", target: '_blank' do
      content_tag(:i, nil, class: ["fa", "fa-#{site}"])
    end
  end
end
