class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def total_price
		line_items.to_a.sum(&:get_cost)
	end

	def paypal_url(return_url, notify_url)
	 values = {
	    :business => 'weihsi.hu-facilitator@logical-thinking.co.uk',
	    :cmd => '_cart',
	    :upload => 1,
	    :return => return_url,
	    :invoice => id,
	    :currency_code => 'GBP',
	    :notify_url => notify_url
	  }
	  line_items.each_with_index do |item, index|
	    values.merge!({
	      "amount_#{index+1}" => item.session.cost,
	      "item_name_#{index+1}" => item.session.date,
	      "item_number_#{index+1}" => item.id,
	    })
	  end
	  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query		
	end
end
