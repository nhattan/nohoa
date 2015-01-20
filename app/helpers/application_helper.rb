require "htmlwith_pygments"

module ApplicationHelper
	def markdown(text)
	  # options =     options = {
   #    filter_html:     true,
   #    hard_wrap:       true, 
   #    link_attributes: { rel: 'nofollow', target: "_blank" },
   #    space_after_headers: true, 
   #    fenced_code_blocks: true
   #  }

    # extensions = {
    #   autolink:           true,
    #   superscript:        true,
    #   disable_indented_code_blocks: false
    # }

    markdown = Redcarpet::Markdown.new(HTMLwithPygments, fenced_code_blocks: true)

	  markdown.render(text).html_safe
	end

	def syntax_highlighter(html)
	  doc = Nokogiri::HTML(html)
	  doc.search("//pre[@lang]").each do |pre|
	    pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
	  end
	  doc.to_s
	end
end


