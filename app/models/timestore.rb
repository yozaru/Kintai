class Timestore < ActiveRecord::Base
 def test
 Dir::foreach("/home/user/csv/") do |v|
    next if v == "." or v == ".."
    if path =~ /\/$/
      v = path + v
    else
      v = path + "/" + v
    end
    p v
    if FileTest::directory?(v)
      recursive_dir(v) #再帰呼び出し リカーシブ　コール/Recursive Call
    end
  end
 end
end
