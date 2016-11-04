module RepliesHelper

  def replies_tree_for(replies)
    replies.map do |reply, nested_replies|
      render(reply)+
        (nested_replies.size > 0 ? content_tag(:div, replies_tree_for(nested_replies), class: "replies") : nil)
    end.join.html_safe
  end
end
