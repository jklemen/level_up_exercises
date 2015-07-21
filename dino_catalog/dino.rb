class Dino
  ATTRIBUTES = %w(name period continent diet weight walking description)

  attr_accessor *ATTRIBUTES

  def initialize(data)
    data.each do |key, val|
      send("#{key}=", val)
    end
  end

  def properties
    ATTRIBUTES.each_with_object({}) do |attr, hash|
      hash[attr] = send(attr)
    end
  end

  def to_s
    properties.inject("") do |str, tuple|
      fattr = "#{tuple[0].capitalize}:".ljust(20)

      no_val = tuple[1].nil? || tuple[1].strip == ''
      fval = no_val ? '---' : tuple[1]

      str << "#{fattr}#{fval}\n"
    end
  end
end
