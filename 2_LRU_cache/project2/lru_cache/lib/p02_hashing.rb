class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    output = 1
    self.each_with_index do |el, index|
      if el.class == String
        mod_el = el.ord.hash
      elsif el.class
        mod_el = el.hash
      end

      output ^= (index % mod_el)
    end
    output
  end
end

class String
  def hash
    chr_array = self.split('')
    chr_array.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    output = 1
    self.each do |key, val|
      output ^= key.hash
      output ^=val.hash
    end

    output
  end
end
