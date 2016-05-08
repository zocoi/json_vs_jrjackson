# json_vs_jrjackson

Benchmarking to choose the fastest json library for jruby.

### Results

Drum roll please, and the winner is `jrjackson`! Although `json` gem does support java with its native java class, `jrjackson` is the clear winner which is on average 4x faster than `json` gem.
With both libraries, there is always performance gain if we allow the vm to warm up and and JIT to kick in

```
➜  json_vs_jrjackson git:(master) ✗ ruby json.rb
java jruby 9.1.0.0
MultiJson::Adapters::JsonGem
First run
       user     system      total        real
   2.220000   0.040000   2.260000 (  0.529982)
Second run, JIT kick-in
       user     system      total        real
   0.780000   0.030000   0.810000 (  0.260242)
MultiJson::Adapters::JrJackson
First run
       user     system      total        real
   1.430000   0.040000   1.470000 (  0.501093)
Second run, JIT kick-in
       user     system      total        real
   0.200000   0.000000   0.200000 (  0.159556)
```

### Bonus

With `jruby-9.0.1.0`

```
➜  json_vs_jrjackson git:(master) ✗ ruby json.rb
java jruby 9.0.1.0
MultiJson::Adapters::JsonGem
First run
       user     system      total        real
   2.260000   0.050000   2.310000 (  0.544161)
Second run, JIT kick-in
       user     system      total        real
   0.740000   0.010000   0.750000 (  0.249610)
MultiJson::Adapters::JrJackson
First run
       user     system      total        real
   1.460000   0.030000   1.490000 (  0.474544)
Second run, JIT kick-in
       user     system      total        real
   0.230000   0.020000   0.250000 (  0.191027)
```

Conclusion, there is not much of difference between the 2 versions
