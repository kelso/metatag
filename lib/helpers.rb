module Metatag
  module Helpers

    def render_meta_tags(options={})
      @meta_data ||= {}
      site = @meta_data && @meta_data[:site] ? @meta_data[:site] : options[:site]
      full_title = [title_tag, site].compact.join(" | ")
      charset = options[:charset] || "utf-8"

      ret = []
      ret << content_tag(:title, full_title)
      ret << tag(:meta, :name => "description", :content => @meta_data[:description])
      ret << tag(:meta, :name => "keywords", :content => @meta_data[:keywords])
      ret << tag(:meta, :'http-equiv' => "Content-Type", :content => "text/html; charset=" + charset)
      ret.join("\n")
    end

    def set_meta_tags(*args)
      @meta_data = args.extract_options!.symbolize_keys
    end
    
    def set_title(title)
      set_meta_tags(:title => title)
    end
    
    def title
      @meta_data[:title].is_a?(Array) ? @meta_data[:title][0] : @meta_data[:title]
    end
    
    def title_tag
      @meta_data[:title].is_a?(Array) ? @meta_data[:title][1] : @meta_data[:title]
    end
    
  end
end

class ActionView::Base
  include Metatag::Helpers
end

