<p> <%= link_to  portfolio_item.title, portfolio_show_path(portfolio_item) %> </p>
<p> <%= portfolio_item.subtitle %> </p>
<p> <%= portfolio_item.body %> </p>
<%= image_tag portfolio_item.thumb_image unless portfolio_item.thumb_image.nil? %>
<%= link_to "Edit", edit_portfolio_path(portfolio_item) %>
<%= link_to 'Delete', portfolio_path(portfolio_item), method: :delete, data: { confirm: 'Are you sure?' } %>
