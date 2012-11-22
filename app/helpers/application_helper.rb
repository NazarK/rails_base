module ApplicationHelper

  def uses file

    if file.downcase.match /.js$/
      return javascript_include_tag file
    end

    if file.downcase.match /.css$/
      return stylesheet_link_tag file
    end

    throw "unknown file type: #{file}"

  end

end
