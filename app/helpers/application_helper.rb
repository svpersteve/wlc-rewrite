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
    if member.image.present?
      member.image
    else
      'https://greenhost.net/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png'
    end
  end

  def time_ago(time)
    a = (Time.now - time).to_i

    case a
      when 0 then '0m'
      when 1 then '1s'
      when 2..59 then a.to_s + 's'
      when 60..3540 then (a/60).to_i.to_s + 'm'
      when 3541..82800 then ((a+99)/3600).to_i.to_s + 'h'
      when 82801..518400 then ((a+800)/(60*60*24)).to_i.to_s + 'd'
      when 518400..1036800 then '1w'
      else ((a+180000)/(60*60*24*7)).to_i.to_s + 'w'
    end
  end
end
