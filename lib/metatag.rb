module Metatag

  def initialize
    @meta_data = {}
  end
  
  # returns title
  def title
    @meta_data[:title]
  end
  
  def render_meta_tags(options={})
   title = @meta_data[:title]
   site = options[:site]
   description = @meta_data[:description]
   keywords = @meta_data[:keywords]
   
   full_title = (site.nil?) ? title : "#{title} | #{site}"
   
   ret = []
   ret << content_tag(:title, full_title)
   ret << tag(:meta, :name => "description", :content => description)
   ret << tag(:meta, :name => "keywords", :content => keywords)
   return ret.join("\n")
  end

  # set any tag by options hash
  def set_meta_tags(options={})
    @meta_data[:title]       = options[:title]       if options[:title]
    #@meta_data[:site]        = options[:site]        if options[:site]
    @meta_data[:description] = options[:description] if options[:description]
    @meta_data[:keywords]    = options[:keywords]    if options[:keywords]
  end

  # method to quickly set the title tag
  def set_title(title)
    @meta_data[:title] = title
  end
  
end

