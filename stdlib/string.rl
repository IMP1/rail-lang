$ 'string-length' ( a b -- c ):
 \
  ---z---#


$ 'string-add' ( a b -- c ):
 \
  ---p---#


$ 'string-repeat' ( a b -- c ):
 \                                        /-(out)---#
  ---(!n!)(!string!)---[](!out!)---0(n)g-<
                                /         \-(string)(out)p-\
                                |                          |
                                \-(!n!)---s(n)1----(!tuo!)-/


$ 'string-substring' ( a b c -- d ):
 \
  ---(!start!)(!end!)(!string!)---(string)(end)c(!_!)(!string!)---(string)(start)c(!string!)(!_!)---(string)---#


$ 'string-chars' ( a -- b ):
 \                                                       /-(out)---{list-reverse}---#
  ---(!string!)n(!out!)---(string)z(!size!)---(size)0g--<
                        /                                \-(out)(string)1c(!string!):--\
                        |                                                              |
                        \-----------------------------------------------------(!tuo!)--/


$ 'string-find' ( a b -- c ):
 \
  ---0{string-find-from}---#


$ 'string-find-from' ( a b c -- d ):
 \
  ---(!start!)(!target!)(!string!)---(string)(start)c(!string!)(!_!)---(string){string-chars}(!chars!)---(chars)[10]{list-index}---#


$ 'string-replace' ( a b -- c ):
$ 'string-upper' ( a -- b ):
$ 'string-lower' ( a -- b ):
$ 'string-split' ( a b -- c ):

