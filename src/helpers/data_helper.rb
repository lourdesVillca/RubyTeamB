class DataHelper

  def self.rehash_to_symbol_keys(hash)
    rehash = {}
    hash.each_pair do |key, value|
      rehash[key.to_sym] = value
    end
    rehash
  end
end