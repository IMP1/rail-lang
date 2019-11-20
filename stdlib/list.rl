$ 'list-reverse' ( a -- b ):
 \                                   /-(out)-#
  ---(!list!)n(!out!)---(list)nq-fq-<
                     /               \-(list)~(!head!)(!list!)-(out)(head):-\
                     |                                                      |
                     \---------------------------------------------(!tuo!)--/


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



$ 'list-each' ( a b -- c ):
 \                                     /-#
  ---(!lambda!)(!list!)---(list)nq-fq-<
                       /               \-(list)~(!head!)(!list!)-\
                       |                                         |
                       \------------------------{}(adbmal)(daeh)-/


$ 'list-map' ( a b -- c ):
 \                                              /-(out)-{list-reverse}-#
  ---(!lambda!)(!list!)-n(!out!)---(list)nq-fq-<
                                /               \-(list)~(!head!)(!list!)-\
                                |                                         |
                                \-(!tuo!)-:(a)(tuo)(!a!)-{}(adbmal)(daeh)-/


$ 'list-filter' ( a b -- c ):
 \                                              /-(out)-{list-reverse}-#
  ---(!lambda!)(!list!)-n(!out!)---(list)nq-fq-<
                               /                \-(list)~(!head!)(!list!)-\
                              /                                           |
                              | /(!tuo!)-:(daeh)(tuo)-\                   |
                              \-                       >-{}(adbmal)(daeh)-/
                                \---------------------/
                  

$ 'list-reduce' ( a b c -- d ):
 \                                            /-(out)-#
  ---(!lambda!)(!out!)(!list!)---(list)nq-fq-<
                              /               \-(list)~(!head!)(!list!)-\
                              |                                         |
                              \-----------(!tuo!)-{}(adbmal)(daeh)(tuo)-/
