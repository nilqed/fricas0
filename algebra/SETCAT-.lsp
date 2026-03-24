
(SDEFUN |SETCAT-;latex;SS;1| ((|s| (S)) (% (|String|)))
        (SPROG
         ((|sl| (|List| (|String|))) (|tf| (|TexFormat|))
          (|of| (|OutputForm|)))
         (SEQ (LETT |of| (SPADCALL |s| (QREFELT % 8)))
              (LETT |tf| (SPADCALL |of| (QREFELT % 10)))
              (LETT |sl| (SPADCALL |tf| (QREFELT % 12)))
              (EXIT (SPADCALL (ELT % 14) |sl| (QREFELT % 16)))))) 

(DECLAIM (NOTINLINE |SetCategory&;|)) 

(DEFUN |SetCategory&| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|SetCategory&| DV$1))
          (LETT % (GETREFV 18))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|SetCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|OutputForm|)
              (0 . |coerce|) (|TexFormat|) (5 . |coerce|) (|List| 13)
              (10 . |tex|) (|String|) (15 . |concat|) (|Mapping| 13 13 13)
              (21 . |reduce|) |SETCAT-;latex;SS;1|)
           '#(|latex| 27) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|latex| ((|String|) |#1|)) T)) (LIST) NIL
                             NIL)))
                        (|makeByteWordVec2| 17
                                            '(1 6 7 0 8 1 9 0 7 10 1 9 11 0 12
                                              2 13 0 0 0 14 2 11 13 15 0 16 1 0
                                              13 0 17)))))
           '|lookupComplete|)) 
