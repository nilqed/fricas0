
(SDEFUN |RETFROM-;retract;SA;1| ((|s| S) ($ A))
        (SPROG ((|u| (|Union| A "failed")))
               (SEQ
                (LETT |u| (SPADCALL |s| (QREFELT $ 9)) |RETFROM-;retract;SA;1|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (|error| "not retractable"))
                       ('T (QCDR |u|))))))) 

(DECLAIM (NOTINLINE |RetractableFrom&;|)) 

(DEFUN |RetractableFrom&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RetractableFrom&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|RetractableFrom&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 11) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RetractableFrom&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Union| $ '"failed") (0 . |retractIfCan|)
              |RETFROM-;retract;SA;1|)
           '#(|retract| 5) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 10 '(1 6 8 7 9 1 0 0 7 10)))))
           '|lookupComplete|)) 
