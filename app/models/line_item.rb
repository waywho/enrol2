class LineItem < ActiveRecord::Base
  belongs_to :session
  belongs_to :cart

  def get_cost
  	if session.free?
  		return 0
  	else
  		session.cost
  	end
  end

end
