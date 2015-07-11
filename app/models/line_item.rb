class LineItem < ActiveRecord::Base
  belongs_to :session
  belongs_to :cart

  def get_cost
  	session.cost
  end

end
