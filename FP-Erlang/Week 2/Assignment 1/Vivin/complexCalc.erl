-module(complexCalc).
-import(math,[sin/1,cos/1,sqrt/1,pow/2,atan/1,pi/0]).
-export([add/2,sub/2,mul/4,div/4,arg/2,arginv/1,abs/2,print/1]).
add(r1,i1,r2,i2)->[r1+r2,i1+i2].
sub(r1,i1,r2,i2)->add(r1,i1,-r2,-i2).
mul(r1,i1,r2,i2)->
[r3,_]=add(r1*r2,0,(-i1*i2),0),
[_,i3]=add(0,i1*r2,0,r1*i2),
add(r3,i3,0,0).
div(r1,i1,r2,i2)->
[n, _] = multiply(-1, 0, i2, 0),
[d, _] = multiply(r2, i2, r2, n),
mul(r1, i1, r2/d, n/d).
arg([r,i])->math:atan(i/r)*180/pi().
arginv(n)->[math:cos(n),math:sin(n)].
abs([r,i]) -> sqrt(pow(r,2) + pow(i,2)).
print([r,i]) ->
io:fwrite("Complex Number= ~w+ i~w ~n Real value : ~w ~n maginary value : ~w ~n Argument : ~w ~n magnitude : ~w ~n",[r,i,r,i, arg([r,i]), abs([r,i])]).