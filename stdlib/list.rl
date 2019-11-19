$ 'list-reverse' ( a -- b ):
 \                                   /-(out)-#
  ---(!list!)n(!out!)---(list)nq-fq-<
                     /               \-(list)~(!head!)(!tail!)-(out)(head):-\
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


$ 'list-splat' ( a -- b... ):
 \                            /-#
  ---(!list!)---(list)nq-fq--<
   /                          \-(list)~-\
   |                                    |
   \----(tsil)---(a)---(!tsil!)---(!a!)-/

