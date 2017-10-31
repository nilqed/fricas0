
(SDEFUN |FACTCAT-;empty?;SB;1| ((|orf| S) ($ |Boolean|))
        (SPROG ((#1=#:G705 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQL (SPADCALL |orf| (QREFELT $ 8)) 0)
                    (PROGN
                     (LETT #1# 'T |FACTCAT-;empty?;SB;1|)
                     (GO #2=#:G704))))
                  (EXIT (EQL (SPADCALL |orf| (QREFELT $ 10)) 0))))
                #2# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |FacetCategory&;|)) 

(DEFUN |FacetCategory&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FacetCategory&|))
          (LETT |dv$| (LIST '|FacetCategory&| DV$1) . #1#)
          (LETT $ (GETREFV 13) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FacetCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (0 . |order|) (|Integer|) (5 . |getMult|) (|Boolean|)
              |FACTCAT-;empty?;SB;1|)
           '#(|empty?| 10) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 12
                                                 '(1 6 7 0 8 1 6 9 0 10 1 0 11
                                                   0 12)))))
           '|lookupComplete|)) 
