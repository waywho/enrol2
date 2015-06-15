class LineItem < ActiveRecord::Base
  belongs_to :session
  belongs_to :cart
end
