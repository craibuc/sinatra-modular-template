# puts "#{__FILE__}"

module ApplicationHelper

  # support title in layout.erb
  def title(value = nil)
    @title = value if value
    @title ? "Template - #{@title}" : "Template"
  end

  # support logging
  def logger
    request.logger
  end

end