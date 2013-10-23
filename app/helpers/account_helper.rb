module AccountHelper
	def to_dollar(amount)
		number_to_currency(amount, :precision => 2)
	end
end