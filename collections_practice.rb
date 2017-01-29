=begin
require 'pry'
def begins_with_r(array)
  array.all? {|word| word.start_with?('r')}
end
def contain_a(array)
  new_array=[]
  array.each do |word|
    if word.include?('a')
      new_array<<word
  end
end
new_array
end
def first_wa(array)
  new_array=[]
    array.find do |word|
      if word.class==String
        if word.start_with?('wa')
          new_array << word
        end
      end
    end
end
def remove_non_strings(array)
  new_array=[]
  array.each do |item|
    if item.class == String
      new_array << item
    end
  end
  new_array
end
def count_elements(array)
  clone=array.clone
  clone.uniq!
  clone_count=-1
  answer_array=[]
  answer=[]
  clone.each do |item|
    counter = 0
    clone_count+=1
    for i in (0...array.count)
      if item == array[i]
        counter += 1
      end
    end
    answer_array[clone_count]={clone[clone_count].values[0]=>counter}
  end
  answer_array.each do |hash|
    hash.each do |prenom,number|
      answer<<{:name=>prenom,:count=>number}
    end
  end
answer
end

def merge_data(keys,data)
  for i in (0..data.count)
    data[0][data[0].keys[i]][:first_name]=data[0].keys[i]
  end
  data[0].values
end

def find_cool(cool)
  answer=[]
  for i in (0...cool.count)
    if cool[i].values.include?("cool")
    answer<<cool[i]
    end
  end
  answer
end

def organize_schools(schools)
  new_hash={}
  school_by_city_array=[]
  cities_array=[]
  arrayof_cities_array=schools.values
  for i in (0...arrayof_cities_array.count)
    cities_array<<arrayof_cities_array[i].values[0]
  end
  simple_city_array=cities_array.uniq
  for k in (0...simple_city_array.count)
    school_by_city_array<<[]
  end
  schools.each do |school_name,location_hash|
    for j in (0...simple_city_array.count)
      if schools[school_name][:location]==simple_city_array[j]
        school_by_city_array[j]<<school_name
      end
    end
    for l in (0...simple_city_array.count)
      new_hash[simple_city_array[l]]=school_by_city_array[l]
    end
  end
  new_hash
end
=end


require 'pry'
def begins_with_r(array)
  array.all? {|ele| ele.start_with?('r')}
end

def contain_a(array)
  array.select {|ele| ele.include?('a')}
end

def first_wa(array)
  array.find {|ele| ele.to_s.start_with?('wa')}
end

def remove_non_strings(array)
  array.delete_if {|ele| ele.class!=String}
end


def count_elements(array)
  array.uniq.each do |name_hash1|
    name_hash1[:count]=0
    array.each do |name_hash2|
      if name_hash1[:name]==name_hash2[:name]
        name_hash1[:count]+=1
      end
    end
  end
end

def merge_data(keys,data)
  new_hash={}
  new_array=[]
  keys.each do |hash|
    hash.each do |key,value|
      data.each do |datahash|
        datahash.each do |k,v|
          new_hash=v
          if k==value
            new_hash[:first_name]=value
            new_array<<new_hash
          end
        end
      end
    end
  end
new_array
end

def find_cool(array)
  array.select do |hash|
    hash.values.include?("cool")
  end
end

def organize_schools(schools)
  new_hash={}
  schools.each do |school_name,location_hash|
      new_hash[location_hash[:location]]||=[]
      new_hash[location_hash[:location]]<<school_name
  end
new_hash
end
