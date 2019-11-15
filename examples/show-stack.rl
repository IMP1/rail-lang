$ 'main'
 \
  ---[1][2][1][2]ftn:::---{show-stack}-#


$ 'show-stack'
 \
  ---[Stack:\n\]o-u{print-item-info}---#


$ 'print-item-info'
 \                 /---#
  ---(!n!)--0(n)g-<
                   \
                    \-(!item!)-(item)-?-(!type!)-\
                                                 |
         /-o{tsujl}[21](epyt)--o{tsujl}4-p(n)[:]-/
         |
         \-(item){to-string}[48]{ljust}o--[\n\]o----1(n)s{print-item-info}-(item)---#


$ 'ljust' ( a b -- c ):
 \
  ---(!n!)-(!string!)-(string)z(!size!)--[ ]-(size)(n)s-{string-rep}-(!pad!)-(pad)(string)p---#


$ 'string-rep' ( a b -- c ):
 \                                        /-(out)---#
  ---(!n!)-(!string!)-[]-(!out!)---0(n)g-<
                                /         \-(string)(out)p-\
                                |                          |
                                \-(!n!)---s(n)1----(!tuo!)-/


$ 'to-string' ( a -- c ):
 \                                                 /-(value)---#
  ---(!value!)-(value)?(!type!)-(type)[string]qfq-<                  /-[\[\\]\]---#      /-(value)-{list-to-string}---#
                                                   \-(type)[nil]qfq-<                   /
                                                                     \-(type)[list]qfq-<                      /-(value)-{lambda-to-string}---#
                                                                                        \-(type)[lambda]qfq--<
                                                                                                              \-[unknown]---#

$ 'list-to-string' ( a -- c ):
 \                                                                                         /-[\]\](out)p---#
  ---(!value!)-[\[\]-(!out!)---(value)~-(!head!)(!tail!)-(head)(out)p-(!out!)-(tail)n-qfq-<
                            /                                                              \
                            |                                                              |
                            \----------------------(!eulav!)---(liat)--(!tuo!)--p(tuo)[ ,]-/
  


$ 'lambda-to-string' ( a -- c ):
 \
  -(!value!)-[<lambda>]---#