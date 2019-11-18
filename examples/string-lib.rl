$ 'main'
 \
  ---[hello world][orl]---{string-find}--o-#


$ 'list-reverse' ( a -- b ):
 \                                   /-(out)-#
  ---(!list!)n(!out!)---(list)nq-fq-<
                     /               \-(list)~(!head!)(!tail!)-(head)(out):-\
                     |                                                      |
                     \----------------------------(!tsil!)(liat)---(!tuo!)--/


$ 'list-length' ( a -- b ):
 \                           /-0-#
  ---(!list!)---(list)nq-fq-<
                             \-(list)~(!_!)(!list!)---1(list){list-length}a---#


$ 'list-index' ( a b -- c ):
 \                                                           /-[Out of bouuunds!]-b-#
  ---(!index!)(!list!)(list)~(!head!)(!tail!)---(list)nq-fq-<
                                                             \                 /-(head)-#
                                                              \--(index)0q-fq-<
                                                                               \-(tail)-1(index)s-{list-index}-#

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
  ---(!start!)(!end!)(!string!)---(end)(string)c(!_!)(!string!)---(start)(string)c(!string!)(!_!)---(string)---#


$ 'string-chars' ( a -- b ):
 \                                                       /-(out)---{list-reverse}---#
  ---(!string!)n(!out!)---(string)z(!size!)---0(size)g--<
                        /                                \-1(string)c(!string!)(out):--\
                        |                                                              |
                        \-----------------------------------------------------(!tuo!)--/


$ 'string-find' ( a b -- c ):
 \
  ---0{string-find-from}---#


$ 'string-find-from' ( a b c -- d ):
 \
  ---(!start!)(!target!)(!string!)---(start)(string)c(!string!)(!_!)---(string){string-chars}(!chars!)---(chars)[10]{list-index}---#


$ 'string-replace' ( a b -- c ):
$ 'string-upper' ( a -- b ):
$ 'string-lower' ( a -- b ):
$ 'string-split' ( a b -- c ):

