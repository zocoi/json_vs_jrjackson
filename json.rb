require 'multi_json'
require 'json'
require 'jrjackson'
require 'benchmark'

# Dummy hash
hash = {"who"=>"Mikoto Okumura!",
 "site"=>"https://github.com/mikoto/bind",
 "array"=>
  [{"v"=>"sat1-hoge", "id"=>"adsa"}, {"v"=>"sat2-hoge"}, {"v"=>"sat3-hoge"}],
 "obj"=>
  {"x"=>{"y"=>"obj.x.y", "z"=>"obj.x.z"},
   "array"=>["sat2-hoge", "sat2-foo", "sat2-bar"],
   "people"=>
    [{"who"=>"Susan Braunhardt",
      "id"=>1,
      "dummy"=>"Dummy Data",
      "dummyArray"=>[]},
     {"who"=>"Denny Puckett", "id"=>2, "obj"=>{"x"=>"test"}},
     {"who"=>"Thomas Seay",
      "id"=>3,
      "team"=>
       [{"who"=>"Kristen Characklis", "id"=>425},
        {"who"=>"Jane Tatum", "id"=>426},
        {"who"=>"Kelly Gonzalez", "id"=>427},
        {"who"=>"Deanne Feldman", "id"=>428},
        {"who"=>"Greg Harrigan", "id"=>429},
        {"who"=>"Jack Lacy", "id"=>430},
        {"who"=>"Shaun Currie", "id"=>431},
        {"who"=>"Peter Glaze", "id"=>432},
        {"who"=>"Sam Reiten", "id"=>433}]},
     {"who"=>"Joel Ruhlin",
      "id"=>4,
      "dummy"=>"Dummy Data 4",
      "dummyArray"=>["Dummy"]},
     {"who"=>"Dorothy Nugent", "id"=>5},
     {"who"=>"Duane Freymann",
      "id"=>6,
      "team"=>
       [{"who"=>"Marc O'Brien", "id"=>458},
        {"who"=>"Duane Millam", "id"=>459},
        {"who"=>"Jennifer Lee", "id"=>460},
        {"who"=>"Alex Bloomfield", "id"=>461},
        {"who"=>"Jennifer Bolton", "id"=>462},
        {"who"=>"Larry Moss", "id"=>463}]}]},
 "dummy"=>"dummy data",
 "dummyObj"=>{},
 "dummyObj2"=>{"v"=>"dummy"},
 "dummyArray"=>["dummy"],
 "dummyArray2"=>[{"v"=>"dummy"}],
 "color"=>"white",
 "backgroundColor"=>"red"
}

n = 10000

puts "#{RUBY_PLATFORM} #{RUBY_ENGINE} #{JRUBY_VERSION}"

MultiJson.use :json_gem
puts MultiJson.current_adapter
puts "First run"
Benchmark.bm do |x|
  x.report { n.times { MultiJson.dump(hash) } }
end

puts "Second run, JIT kick-in"
Benchmark.bm do |x|
  x.report { n.times { MultiJson.dump(hash) } }
end

MultiJson.use :jr_jackson
puts MultiJson.current_adapter
puts "First run"
Benchmark.bm do |x|
  x.report { n.times { MultiJson.dump(hash) } }
end

puts "Second run, JIT kick-in"
Benchmark.bm do |x|
  x.report { n.times { MultiJson.dump(hash) } }
end
