# As of Jekyll 4.2.1, Jekyll still does not provide the right Content-Type for
# `.wasm` files. It needs to be `application/wasm` in order for the WebAssembly
# to work, but Jekyll is sending them (at least locally) as `text/html;
# charset=8859-1`.
#
# This plugin corrects that.
#
# Public discourse:
#
# (issue opened in July 2019, no response, auto-closed by a bot 5 months later)
# https://github.com/jekyll/jekyll/issues/7743
#
# (relevant even though we're using Jekyll directly on Netlify, instead of
# GitHub Pages)
# https://github.com/github/pages-gem/issues/695

# Reference:
# https://github.com/dekellum/jekyll-svg-plugin/blob/9857e0edda5714472d33094e8fea9734b5de3b49/lib/jekyll-svg-plugin.rb#L27-L30
# Unfortunately, this only succeeds in setting the content type to
# `application/wasm; charset=utf-8`. It needs to be `application/wasm` in order
# for WebAssembly to work.
# require 'webrick'
# WEBrick::HTTPUtils::DefaultMimeTypes.store 'wasm', 'application/wasm'

# I looked into using Jekyll Hooks (https://jekyllrb.com/docs/plugins/hooks/)
# but those don't seem to provide a way to customize the behavior of `jekyll
# serve`.
# Jekyll::Hooks.register :site, :after_init do |site|
#   p site
# end

# This line seems to be required in order to reopen this class:
#
#   class Servlet < WEBrick::HTTPServlet::FileHandler
#
# and have it understand what I mean by WEBrick. I'm not sure if the
# `< WEBrick::HTTPServlet::FileHandler` part is necessary, though.
require 'webrick'

module Jekyll
  module Commands
    class Serve
      # I attempted to customize the behavior of the `do_GET` method in
      # `Jekyll::Commands::Serve::Servlet`, but got this error for some reason:
      #
      # undefined method `do_GET' for class
      # `#<Class:Jekyll::Commands::Serve::Servlet>' (NameError)
      # class Servlet < WEBrick::HTTPServlet::FileHandler
      #   class << self
      #     alias :_original_do_GET :do_GET
      #   end

      #   def self.do_GET(req, res)
      #     puts "Calling original do_GET"
      #     res = original_do_GET(req, res)

      #     puts "Now we can do stuff"
      #     p res.body
      #   end
      # end

      # I _was_ able to redefine webrick_opts to provide a custom
      # RequestCallback, but that doesn't help because we need to customize the
      # response, not the request. It sure would be nice if WEBrick let you
      # provide a ResponseCallback, but they don't. WTF?

      # Reference:
      # https://github.com/fitztrev/jekyll-utf8/blob/master/lib/jekyll-utf8.rb
      #
      # Except they had it as `webrick_options` instead of `webrick_opts`, so I
      # had to rename it based on the current name of that method in the Jekyll
      # source code. It's not good that we're coupling to Jekyll implementation
      # details, but Jekyll doesn't seem to provide a more stable interface for
      # customizing the WEBrick options, so this will have to suffice for now.

      # class << self
      #   alias :_original_webrick_opts :webrick_opts
      # end

      # def self.webrick_opts(config)
      #   options = _original_webrick_opts(config)

      #   # This was my first attempt at fixing this, but WEBrick appears to be
      #   # further altering the Content-Type header, because it ends up being
      #   # `applciation/wasm; charset=utf-8`. That won't suffice; it needs to be
      #   # `application/wasm` in order for WebAssembly to work.
      #   # options[:MimeTypes].merge!({'wasm' => 'application/wasm'})

      #   # This might be nil, and we'll handle that scenario below.
      #   existing_callback = options[:RequestCallback] || ->(req, res) {}

      #   callback = ->(req, res) {
      #     existing_callback.call(req, res)

      #     # p res.body
      #   }

      #   options[:RequestCallback] = callback

      #   options
      # end
    end
  end
end
