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

  def linked_names_list_as_sentence(members)
    members.map { |member| (link_to member.name, member) }.to_sentence.html_safe
  end

  def interest_options_for_select(members, selected = nil)
    options_for_select(members.map { |m| [m.name, m.id] }, selected)
  end

  def excerpt(text, length = 250)
    sanitize text.truncate(length, escape: false, omission: '...')
  end

  def avatar(member)
    member.image || 'https://greenhost.net/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png'
  end
end
