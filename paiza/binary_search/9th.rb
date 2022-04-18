require "stringio"

$stdin = StringIO.new("5
0 1 2 3 4
4
-3 -1 1 3
12")

n = gets.chomp.to_i

arr_A = gets.chomp.split.map!{|n| n.to_i}

m = gets.chomp.to_i

arr_B = gets.chomp.split.map!{|n| n.to_i}

k = gets.chomp.to_i


ok = 10**8 + 10 **8
ng = -1

while (ok - ng).abs > 1
  mid = (ok + ng) / 2 
  cnt = 0
  arr_A.each do |elem_a|
    arr_B.each do |elem_b|
      if elem_a >= elem_b - mid &&  elem_a <= mid - elem_b 
        cnt += 1
      end
    end
  end

  puts "cnt:#{cnt}"
  if k <= cnt
    ok = mid
  else
    ng = mid
  end
  puts "ok:#{ok}, ng:#{ng}, mid:#{mid}"
end

puts ok

# x 以下の値がk個以上含まれる最小値がx
# x 以下の値が k 個以上含まれるなら、x <= y を満たすすべての y について、 y 以下の値が k 個含まれる
# x 以下の値が何個あるか調べて、条件を満たす最小の x を探索する。
# A を固定したとき（＝列を固定）、A_i - B_j .abs <= x であればよい。
# abs を外すと -(A_i - B_j) <= x or (A_i - B_j) <= x
# つまり -A_i + B_j <= x or A_I - B_j <= x
# A_i - B_j >= -x or A_i <= x - B_j
# A_i >= B_j - x or A_i <= x - B_j
# 含まれている x 以下の個数を w とすると、 k <= w となる（k番目 = x 以下の値が k 個）最小値 x を求める








# A =  1,2,3,4

# B = 6,7,8,9 があった時、
# 1行目1列には、A1 - B1 = 1 - 6 abs = 5
# 2行名1列には、A2 - B1 = 2 - 6 abs = 4
# 3行名1列には、A3 - B1 = 3 - 6 abs = 3 
# 4行目1列には、A4 - B1 = 4 - 6 abs = 2
# 1行目2列には、1 - 7 abs = 6
# 2 - 7 = 5
# 3 - 7 = 4
# 4 - 7 = 3
# 1 - 8 = 7
# 2 - 8 = 6
# .....
# まともにやるとO(n^2 + n) なのできつい？
# 制約は双方 <= 30,000なので 30,000^2 なら別に？
# abs なので
# 5,4,3,2
# 6,5,4,3
# 7,6,5,4
# 8
