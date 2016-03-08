class Session < ActiveRecord::Base
	belongs_to :course
	has_many :users, through: :enrollments
	has_many :enrollments
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	def free?
		cost.nil? || cost.zero?
	end

	private

	def ensure_not_referenced_by_any_line_item
		if line_item.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end

end
