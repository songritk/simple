set terminal postscript eps enhanced  solid "Helvetica" 14
set output '| epstopdf --filter --outfile=function.pdf'

# Line width of the axes
set border linewidth 1
# Line styles

set style line 1 linecolor rgb '#0060ad' linetype 1 linewidth 2
set style line 2 linecolor rgb '#dd181f' linetype 1 linewidth 2

W=32.0
N=10

set xrange [0.0:1.0]
set yrange [0:0.5]
set xtics 0.1
set mytics 2
set tics nomirror out 

IGNORE_MORTHAN=0.9999999
filter(x)=(x<=IGNORE_MORTHAN)?(x):(1/0)

pow(a,b) = a**b

eq19(p,N) = 1-pow(1-p,1.0/(N-1))
eq17(p,W) = 2*(1-2*p)/(W*(1-p)+1-2*p)
eq42(p,r,M,W) = 2/(1+W*(sum [j=0:M] pow(r*p,j))/(sum [j=0:M] pow(p,j)))

set xlabel 'probability of collision p_c'
set ylabel 'p_t'

i=6
set style line 10 linetype 1 dashtype 1 linewidth 2
set style line 11 linetype 1 dashtype 1 linewidth 2
set style line 12 linetype 1 dashtype 3 linewidth 2

set label "W_0=4"  at 0.1,0.38
set label "W_0=8"  at 0.1,0.21
set label "W_0=16"  at 0.09,0.11
set label "32"  at 0.03,0.07
set label "64"  at 0.02,0.035
set label "N=5" at 0.8,0.4
set label "N=10" at 0.8,0.21
set label "N=20" at 0.8,0.1
set label "30" at 0.8,0.07
set label "50" at 0.9,0.035

# Plot
plot filter(eq19(x,5)) notitle 'N=5' with lines ls 10,\
     filter(eq19(x,10)) notitle 'N=10' with lines ls 10,\
     filter(eq19(x,20)) notitle 'N=20' with lines ls 10,\
     filter(eq19(x,30)) notitle 'N=30' with lines ls 10,\
     filter(eq19(x,50)) notitle 'N=50' with lines ls 10,\
     eq17(x,4) notitle 'W=4' with lines linetype 10 dashtype i lw 2,\
     eq17(x,8) notitle 'W=8' with lines linetype 11 dashtype i lw 2,\
     eq17(x,16) notitle 'W=16' with lines linetype 12 dashtype i lw 2,\
     eq17(x,32) notitle 'W=32' with lines linetype 13 lc rgb 'green' dashtype i lw 2,\
     eq17(x,64) notitle 'W=64' with lines linetype 14 dashtype i lw 2,\
     eq42(x,2,6,4) notitle 'W=4' with lines ls 12,\
     eq42(x,2,6,8) notitle 'W=8' with lines ls 12,\
     eq42(x,2,6,16) notitle 'W=16' with lines ls 12,\
     eq42(x,2,6,32) notitle 'W=32' with lines ls 12,\
     eq42(x,2,6,64) notitle 'W=64'  with lines ls 12\

