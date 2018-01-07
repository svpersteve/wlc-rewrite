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

  def timestamp_to_date(timestamp)
    seconds = (timestamp.to_f / 1000).to_s
    date = Date.strptime(seconds, '%s')
    date.strftime("%A #{date.day.ordinalize} %B")
  end

  def timestamp_to_full_date(timestamp)
    seconds = (timestamp.to_f / 1000).to_s
    date = Date.strptime(seconds, '%s')
    date.strftime("#{date.day.ordinalize} %B %Y")
  end

  def google_maps_link_for(address)
    "http://maps.google.com/?q=#{address}"
  end

  def social_link(link)
    case link[0]
    when 'twitter'
      content_tag(:a, 'Twitter', href: "https://twitter.com/#{link[1]['identifier']}", target: '__blank')
    when 'facebook'
      content_tag(:a, 'Facebook', href: link[1]['identifier'], target: '__blank')
    end
  end
end
