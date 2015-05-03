#! /usr/bin/env ruby

def sortkeys(hash)
  hashArray = hash.sort_by { |k,v| k.to_s.length }
  
  newHash = hashArray.to_h
  
  newHash.keys.map { |key| key.to_s }
end

# Run the code if executed directly from shell
if __FILE__ == $0
  
  hash =  { abc: "hello", "another_key" => 123, 4567 => "third" }
  puts "#{hash}"
  sortedKeyArray = sortkeys(hash)
  puts "#{sortedKeyArray}"

end #if __FILE__ == $0

