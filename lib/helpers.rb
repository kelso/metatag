module Metatag
  module Helpers
    
    def render_meta_tags(options={})
      site = @meta_data[:site] ? @meta_data[:site] : options[:site]
      full_title = [title_tag, site].compact.join(" | ")

      ret = []
      ret << content_tag(:title, full_title)
      ret << tag(:meta, :name => "description", :content => @meta_data[:description])
      ret << tag(:meta, :name => "keywords", :content => @meta_data[:keywords])
      return ret.join("\n")
    end

    def set_meta_tags(*args)    
      @meta_data = args.extract_options!.symbolize_keys
    end

    def set_title(title)
      @meta_data[:title] = title
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

