class Chemical_name < String
  def find_position

    # regular expression definition
    all_pos=/((?>\d|-|,|\s)*\d+)(?>\s|-)*\z/
    single_pos=/^(?>\s|-|,)*(\d+)/

    # match for position at the end of the chemical_name
    if pos=self.match(all_pos)
      ret=[$`]
      pos[1].match(single_pos)
    end

    #if positions found, loop to extract each integer
    while $1
      n=$'
      ret<<$1.to_i
      n.match(single_pos)
    end
    # return the array, if ret is nil (no match) return [self]
    ret || [self]
  end

end

#a=gets
a=Chemical_name.new(gets.chomp)

#a= Chemical_name 
puts a.find_position.to_s

Suffix=
{
  :alkane => "ane",
  :alcohol => "ol",
  :carboxy_acid => "oic acid",
  :aldehyde => "al",
  :ketones=> "one",
  :amines=> "amine",
  :ethers=> "ether",
  :alkene=> "ene",
  :alkyne=> "yne",

}

#this would search the whole strings of compound and search the

Suffix.each_pair do |k,v|
  a=~/#{v}/
  puts "The given compound is an #{k}" if $&
end

find_length =
{
  :metha => "1",
  :etha => "2",
  :propa => "3",
  :buta => "4",
  :penta => "5",
  :hexa => "6",
  :hepta => "7",
  :octa=> "8",
  :nona=> "9",
  :deca=> "10",
  :undeca=> "11",
  :dodeca=> "12",

}


puts a
find_length.each_pair do |k,v|
  a=~/#{k}/
  puts "The given compound has #{v} carbons" if $&
end

find_abc=
{
  :bi=> "2",
  :tri=> "3",
  :tetra=> "4",
  :penta=> "5",
  :hex=> "6",
  
}