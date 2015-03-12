class String
  def to_price
    /[\d\.]+/.match(self).to_s.to_f
  end
end
