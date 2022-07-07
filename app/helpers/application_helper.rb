# frozen_string_literal: true

module ApplicationHelper
  def mark_down_to_html(text)
    Kramdown::Document.new(text, input: 'GFM').to_html
  end
end
