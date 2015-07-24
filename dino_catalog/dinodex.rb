require 'json'
require './dino.rb'

class Dinodex
  OPERATIONS = %w(equal not_equal big small like not_like)

  attr_accessor :dinos

  def initialize(dinos)
    @dinos = dinos || []
  end

  def index
    @dinos.each { |dino| puts "#{dino}\n" }
  end

  def method_missing(name, *args, &block) 
    return unless OPERATIONS.include?(name.to_s)

    match = @dinos.select do |dino|
      dino.send("#{name}?", *args)
    end
    Dinodex.new(match)
  end

  def search(hash)
    hash.inject(self) do |ddex, pair|
      ddex.equal(pair[0], pair[1])
    end
  end

  def sort(field)
    sorted = @dinos.sort do |a, b|
      a.send(field) <=> b.send(field)
    end
    Dinodex.new(sorted)
  end

  def to_json
    {
      'dinos' => @dinos.map(&:properties)
    }.to_json
  end

  def inspect
    dinos.inspect
  end
end
