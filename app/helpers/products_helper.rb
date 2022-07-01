module ProductsHelper

  def date_format(date)
    date.strftime("%d/%m/%Y")    
  end

  def simple_description(description)
    description.truncate(100) unless description.nil?    
  end
end
