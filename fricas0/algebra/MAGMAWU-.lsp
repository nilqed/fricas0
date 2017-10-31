
(SDEFUN |MAGMAWU-;one?;SB;1| ((|x| S) ($ |Boolean|))
        (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 9))) 

(SDEFUN |MAGMAWU-;sample;S;2| (($ S)) (|spadConstant| $ 7)) 

(SDEFUN |MAGMAWU-;^;SNniS;3| ((|x| S) (|n| |NonNegativeInteger|) ($ S))
        (COND ((ZEROP |n|) (|spadConstant| $ 7))
              ('T (SPADCALL |x| |n| (QREFELT $ 14))))) 

(SDEFUN |MAGMAWU-;rightPower;SNniS;4|
        ((|a| S) (|n| |NonNegativeInteger|) ($ S))
        (SPROG ((|res| (S)) (#1=#:G715 NIL) (|i| NIL))
               (SEQ
                (COND ((ZEROP |n|) (|spadConstant| $ 7))
                      ('T
                       (SEQ
                        (LETT |res| (|spadConstant| $ 7)
                              . #2=(|MAGMAWU-;rightPower;SNniS;4|))
                        (SEQ (LETT |i| 1 . #2#) (LETT #1# |n| . #2#) G190
                             (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |res| (SPADCALL |res| |a| (QREFELT $ 17))
                                     . #2#)))
                             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |res|))))))) 

(SDEFUN |MAGMAWU-;leftPower;SNniS;5| ((|a| S) (|n| |NonNegativeInteger|) ($ S))
        (SPROG ((|res| (S)) (#1=#:G720 NIL) (|i| NIL))
               (SEQ
                (COND ((ZEROP |n|) (|spadConstant| $ 7))
                      ('T
                       (SEQ
                        (LETT |res| (|spadConstant| $ 7)
                              . #2=(|MAGMAWU-;leftPower;SNniS;5|))
                        (SEQ (LETT |i| 1 . #2#) (LETT #1# |n| . #2#) G190
                             (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |res| (SPADCALL |a| |res| (QREFELT $ 17))
                                     . #2#)))
                             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |res|))))))) 

(SDEFUN |MAGMAWU-;recip;SU;6| ((|x| S) ($ |Union| S "failed"))
        (COND ((SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 9)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(DECLAIM (NOTINLINE |MagmaWithUnit&;|)) 

(DEFUN |MagmaWithUnit&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|MagmaWithUnit&|))
          (LETT |dv$| (LIST '|MagmaWithUnit&| DV$1) . #1#)
          (LETT $ (GETREFV 22) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|MagmaWithUnit&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|) (|Boolean|)
              (4 . =) |MAGMAWU-;one?;SB;1| |MAGMAWU-;sample;S;2|
              (|PositiveInteger|) (|RepeatedSquaring| 6) (10 . |expt|)
              (|NonNegativeInteger|) |MAGMAWU-;^;SNniS;3| (16 . *)
              |MAGMAWU-;rightPower;SNniS;4| |MAGMAWU-;leftPower;SNniS;5|
              (|Union| $ '"failed") |MAGMAWU-;recip;SU;6|)
           '#(|sample| 22 |rightPower| 26 |recip| 32 |one?| 37 |leftPower| 42 ^
              48)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 21
                                                 '(0 6 0 7 2 6 8 0 0 9 2 13 6 6
                                                   12 14 2 6 0 0 0 17 0 0 0 11
                                                   2 0 0 0 15 18 1 0 20 0 21 1
                                                   0 8 0 10 2 0 0 0 15 19 2 0 0
                                                   0 15 16)))))
           '|lookupComplete|)) 
