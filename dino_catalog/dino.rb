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
    properties.inject("") do |output_str, tuple|
      formatted_attribute = "#{tuple[0].capitalize}:".ljust(20)

      bad_value = tuple[1].nil? || tuple[1].strip == ''
      formatted_value = bad_value ? '---' : tuple[1]

      output_str << "#{formatted_attribute}#{formatted_value}\n"
    end
  end

  def big?
    weight.to_i >= 4001
  end

  def small?
    !big?
  end

  def equal?(field, compare_val)
    send(field).downcase == compare_val.downcase
  end

  def not_equal?(field, compare_val)
    !equal?(field, compare_val)
  end

  def like?(field, compare_val)
    dino_val = send(field)
    if dino_val.nil? || compare_val.nil?
      dino_val.nil? && compare_val.nil?
    else
      !!(dino_val.downcase =~ /#{compare_val.downcase}/)
    end
  end

  def not_like?(field, compare_val)
    !like?(field, compare_val)
  end
end
