class ReadmeController < ApplicationController
  def index
    render html: markdown_file(Rails.root.join("README.md")), layout: true
  end

  private

  def markdown_file(path)
    markdown.render(File.read path).html_safe
  end

  def markdown
    Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(fenced_code_blocks: true))
  end
end
