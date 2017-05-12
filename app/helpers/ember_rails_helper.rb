require "html_page/capture"

module EmberRailsHelper
  def render_ember_app(name, &block)
    EmberCli[name].build

    markup_capturer = HtmlPage::Capture.new(self, &block)

    head, body = markup_capturer.capture

    content = EmberCli[name].index_html(head: head, body: body).html_safe

    if Gem::Version.new(Rails.version) >= Gem::Version.new('5.1.0')
      render plain: content
    else
      render text: content
    end
  end
end
