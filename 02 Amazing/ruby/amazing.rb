# frozen_string_literal: true

# BASIC arrays are 1-based, unlike Ruby 0-based arrays
class BasicArrayTwoD
  def initialize(width, height)
    @val = Array.new(height) { Array.new(width, 0) }
  end

  def [](x, y)
    @val[y - 1][x - 1]
  end

  def []=(x, y, n)
    @val[y - 1][x - 1] = n
  end

  def to_s
    @val.map { |r| r.join(' ') }.join("\n")
  end
end

# 10 PRINT TAB(28);"AMAZING PROGRAM"
# 20 PRINT TAB(15);"CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY"
# 30 PRINT:PRINT:PRINT:PRINT
puts ' ' * 28 + 'AMAZING PROGRAM'
puts ' ' * 15 + 'CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY'
puts "\n" * 4

# 100 INPUT "WHAT ARE YOUR WIDTH AND LENGTH";H,V
# 102 IF H<>1 AND V<>1 THEN 110
# 104 PRINT "MEANINGLESS DIMENSIONS.  TRY AGAIN.":GOTO 100
def ask_dimensions
  print 'WHAT ARE YOUR WIDTH AND LENGTH? '
  h = gets.to_i
  print '?? '
  v = gets.to_i
  [h, v]
end

h, v = ask_dimensions
while h < 1 || v < 1
  puts "MEANINGLESS DIMENSIONS.  TRY AGAIN."
  h, v = ask_dimensions
end

# 110 DIM W(H,V),V(H,V)
# BASIC programs can have the same variable names for different types,
#   so the v array is not the same as the v int. Here we're using suffixes.
w_arr = BasicArrayTwoD.new(h, v)
v_arr = BasicArrayTwoD.new(h, v)

# 120 PRINT
# 130 PRINT
# 140 PRINT
# 150 PRINT
puts "\n" * 4

# 160 Q=0:Z=0:X=INT(RND(1)*H+1)
q = 0
z = 0

def draw_top(x, h)
  # 165 FOR I=1 TO H
  # 170 IF I=X THEN 173
  # 171 PRINT ".--";:GOTO 180
  # 173 PRINT ".  ";
  # 180 NEXT I
  (1..h).each do |i|
    if i == x
      print i == 1 ? '┏  ' : '┳  '
    else
      print i == 1 ? '┏━━' : '┳━━'
    end
  end

  # 190 PRINT "."
  puts '┓'

  x # return this because we need it
end

# x represents the location of the opening
x = (rand * h).round + 1
draw_top(x, h)

# 195 C=1:W(X,1)=C:C=C+1
c = 1
w_arr[x, 1] = c # This marks the opening in the first row
c += 1

puts w_arr

# 200 R=X:S=1:GOTO 260
r = x
s = 1
# 260 IF R-1=0 THEN 530
if r - 1 == 0
  # 530 IF S-1=0 THEN 670
  if s - 1 == 0
    # 670 IF R=H THEN 740
    if r == h
      # 740 IF S<>V THEN 760
      if s != v
        # 760 IF W(R,S+1)<>0 THEN 780
        if w_arr[r, s + 1] != 0
          # 780 GOTO 1000
          # Well, we'll just go directly to 1000
          # 1000 GOTO 210
          # Well, now. I just got here, now back to 210
          # 210 IF R<>H THEN 240
          if r != h
            # 240 R=R+1
            r += 1
            # 250 IF W(R,S)=0 THEN 210
            if w_arr[r, s] == 0
              # GOTO 210 -- this is a loop
            end
            # 260 IF R-1=0 THEN 530
            if r - 1 == 0
              # 530 IF S-1=0 THEN 670
              # 540 IF W(R,S-1)<>0 THEN 670
              if s - 1 == 0 || w_arr[r, s - 1] != 0
                # 670 IF R=H THEN 740
                # 680 IF W(R+1,S)<>0 THEN 740
                # 685 IF S<>V THEN 700
                # 690 IF Z=1 THEN 730
                # 695 Q=1:GOTO 710
              end
              # 545 IF R=H THEN 610
              # 547 IF W(R+1,S)<>0 THEN 610
              if r == h || w_arr[r + 1, s] != 0
                # 610 IF S<>V THEN 630
                # 620 IF Z=1 THEN 660
                # 625 Q=1:GOTO 640
              end
              # 550 IF S<>V THEN 560
              if s != v
                # 560 IF W(R,S+1)<>0 THEN 590
                # 570 X=INT(RND(1)*3+1)
                # 580 ON X GOTO 820,860,910
              end
              # 552 IF Z=1 THEN 590
              if z == 1
                # 590 X=INT(RND(1)*2+1)
                # 600 ON X GOTO 820,860
              end
              # 554 Q=1:GOTO 570
              q = 1
              # 570 X=INT(RND(1)*3+1)
              # 580 ON X GOTO 820,860,910
            end
          end
        end
      end
    end
  end
end

# 210 IF R<>H THEN 240
# 215 IF S<>V THEN 230
# 220 R=1:S=1:GOTO 250
# 230 R=1:S=S+1:GOTO 250
# 240 R=R+1
# 250 IF W(R,S)=0 THEN 210
# 260 IF R-1=0 THEN 530
# 265 IF W(R-1,S)<>0 THEN 530
# 270 IF S-1=0 THEN 390
# 280 IF W(R,S-1)<>0 THEN 390
# 290 IF R=H THEN 330
# 300 IF W(R+1,S)<>0 THEN 330
# 310 X=INT(RND(1)*3+1)
# 320 ON X GOTO 790,820,860
# 330 IF S<>V THEN 340
# 334 IF Z=1 THEN 370
# 338 Q=1:GOTO 350
# 340 IF W(R,S+1)<>0 THEN 370
# 350 X=INT(RND(1)*3+1)
# 360 ON X GOTO 790,820,910
# 370 X=INT(RND(1)*2+1)
# 380 ON X GOTO 790,820
# 390 IF R=H THEN 470
# 400 IF W(R+1,S)<>0 THEN 470
# 405 IF S<>V THEN 420
# 410 IF Z=1 THEN 450
# 415 Q=1:GOTO 430
# 420 IF W(R,S+1)<>0 THEN 450
# 430 X=INT(RND(1)*3+1)
# 440 ON X GOTO 790,860,910
# 450 X=INT(RND(1)*2+1)
# 460 ON X GOTO 790,860
# 470 IF S<>V THEN 490
# 480 IF Z=1 THEN 520
# 485 Q=1:GOTO 500
# 490 IF W(R,S+1)<>0 THEN 520
# 500 X=INT(RND(1)*2+1)
# 510 ON X GOTO 790,910
# 520 GOTO 790
# 530 IF S-1=0 THEN 670
# 540 IF W(R,S-1)<>0 THEN 670
# 545 IF R=H THEN 610
# 547 IF W(R+1,S)<>0 THEN 610
# 550 IF S<>V THEN 560
# 552 IF Z=1 THEN 590
# 554 Q=1:GOTO 570
# 560 IF W(R,S+1)<>0 THEN 590
# 570 X=INT(RND(1)*3+1)
# 580 ON X GOTO 820,860,910
# 590 X=INT(RND(1)*2+1)
# 600 ON X GOTO 820,860
# 610 IF S<>V THEN 630
# 620 IF Z=1 THEN 660
# 625 Q=1:GOTO 640
# 630 IF W(R,S+1)<>0 THEN 660
# 640 X=INT(RND(1)*2+1)
# 650 ON X GOTO 820,910
# 660 GOTO 820
# 670 IF R=H THEN 740
# 680 IF W(R+1,S)<>0 THEN 740
# 685 IF S<>V THEN 700
# 690 IF Z=1 THEN 730
# 695 Q=1:GOTO 710
# 700 IF W(R,S+1)<>0 THEN 730
# 710 X=INT(RND(1)*2+1)
# 720 ON X GOTO 860,910
# 730 GOTO 860
# 740 IF S<>V THEN 760
# 750 IF Z=1 THEN 780
# 755 Q=1:GOTO 770
# 760 IF W(R,S+1)<>0 THEN 780
# 770 GOTO 910
# 780 GOTO 1000
# 790 W(R-1,S)=C
# 800 C=C+1:V(R-1,S)=2:R=R-1
# 810 IF C=H*V+1 THEN 1010
# 815 Q=0:GOTO 260
# 820 W(R,S-1)=C
# 830 C=C+1
# 840 V(R,S-1)=1:S=S-1:IF C=H*V+1 THEN 1010
# 850 Q=0:GOTO 260
# 860 W(R+1,S)=C
# 870 C=C+1:IF V(R,S)=0 THEN 880
# 875 V(R,S)=3:GOTO 890
# 880 V(R,S)=2
# 890 R=R+1
# 900 IF C=H*V+1 THEN 1010
# 905 GOTO 530
# 910 IF Q=1 THEN 960
# 920 W(R,S+1)=C:C=C+1:IF V(R,S)=0 THEN 940
# 930 V(R,S)=3:GOTO 950
# 940 V(R,S)=1
# 950 S=S+1:IF C=H*V+1 THEN 1010
# 955 GOTO 260
# 960 Z=1
# 970 IF V(R,S)=0 THEN 980
# 975 V(R,S)=3:Q=0:GOTO 1000
# 980 V(R,S)=1:Q=0:R=1:S=1:GOTO 250
# 1000 GOTO 210
# 1010 FOR J=1 TO V
# 1011 PRINT "I";
# 1012 FOR I=1 TO H
# 1013 IF V(I,J)<2 THEN 1030
# 1020 PRINT "   ";
# 1021 GOTO 1040
# 1030 PRINT "  I";
# 1040 NEXT I
# 1041 PRINT
# 1043 FOR I=1 TO H
# 1045 IF V(I,J)=0 THEN 1060
# 1050 IF V(I,J)=2 THEN 1060
# 1051 PRINT ":  ";
# 1052 GOTO 1070
# 1060 PRINT ":--";
# 1070 NEXT I
# 1071 PRINT "."
# 1072 NEXT J
# 1073 END
