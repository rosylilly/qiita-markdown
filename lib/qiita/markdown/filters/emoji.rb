module Qiita
  module Markdown
    module Filters
      class Emoji < HTML::Pipeline::EmojiFilter
        private

        def emoji_url(name)
          url = emoji_url_generator.call(name) if emoji_url_generator
          url || super
        end

        def emoji_url_generator
          context[:emoji_url]
        end

        def emoji_pattern
          @emoji_pattern ||= /:(#{emoji_names.map { |name| Regexp.escape(name) }.join('|')}):/
        end

        def emoji_names
          if context[:emoji_names]
            context[:emoji_names].sort
          else
            self.class.emoji_names
          end
        end
      end
    end
  end
end