module ApplicationHelper

  def serialize(data, options = {})
    ActiveModelSerializers::SerializableResource.new(data, options).as_json.values[0]
  end

  def mobile_app_request?
    request.env['HTTP_USER_AGENT'].match /(iPhone|Android)/
  end

  def phone_type
    if request.env['HTTP_USER_AGENT'].match /(iPhone)/
      "iPhone"
    elsif request.env['HTTP_USER_AGENT'].match /(Android)/
      "Android"
    else
      ""
    end
  end

  def full_url(url)
    if url
      unless url[0..6] == 'http://' || url[0..7] == 'https://'
        url.prepend 'http://'
      else
        url
      end
    else
      "NA"
    end
  end

  def current_page
    controller_name + action_name
  end

  def page_title(title)
    content_for :title, title.to_s
  end

  def after_sign_up_path_for(resource)
    '/'
  end
end
