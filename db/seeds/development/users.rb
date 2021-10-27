10.times do |n|
  name = "user#{n}"
  email = "#{name}@example.com"
  # find_byでオブジェクトが存在していれば => 取得、存在しない場合はfind_byをnewとしてオブジェクトを生成
  user = User.find_or_initialize_by(email: email, activated: true)

  if user.new_record?
    user.name = name
    user.password = "password"
    user.save!
  end
end

puts "users = #{User.count}"