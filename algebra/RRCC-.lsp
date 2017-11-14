
(SDEFUN |RRCC-;zero?;ThePolsSB;1|
        ((|toTest| |ThePols|) (|rootChar| S) ($ |Boolean|))
        (EQL (SPADCALL |toTest| |rootChar| (QREFELT $ 10)) 0)) 

(SDEFUN |RRCC-;negative?;ThePolsSB;2|
        ((|toTest| |ThePols|) (|rootChar| S) ($ |Boolean|))
        (< (SPADCALL |toTest| |rootChar| (QREFELT $ 10)) 0)) 

(SDEFUN |RRCC-;positive?;ThePolsSB;3|
        ((|toTest| |ThePols|) (|rootChar| S) ($ |Boolean|))
        (SPADCALL (SPADCALL |toTest| |rootChar| (QREFELT $ 10)) 0
                  (QREFELT $ 14))) 

(SDEFUN |RRCC-;rootOf;ThePolsPiU;4|
        ((|pol| |ThePols|) (|n| |PositiveInteger|) ($ |Union| S "failed"))
        (SPROG ((|liste| (|List| S)))
               (SEQ
                (LETT |liste| (SPADCALL |pol| (QREFELT $ 17))
                      |RRCC-;rootOf;ThePolsPiU;4|)
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |liste|) |n| (QREFELT $ 19))
                   (CONS 1 "failed"))
                  ('T (CONS 0 (SPADCALL |liste| |n| (QREFELT $ 21))))))))) 

(SDEFUN |RRCC-;recip;ThePolsSU;5|
        ((|toInv| |ThePols|) (|rootChar| S) ($ |Union| |ThePols| #1="failed"))
        (SPROG
         ((|d|
           (|Record| (|:| |coef| (|List| |ThePols|))
                     (|:| |generator| |ThePols|)))
          (|defPol| (|ThePols|)) (#2=#:G738 NIL)
          (|res| (|Union| |TheField| "failed")))
         (SEQ
          (COND
           ((EQL (SPADCALL |toInv| (QREFELT $ 25)) 0)
            (SEQ
             (LETT |res|
                   (SPADCALL (SPADCALL |toInv| (QREFELT $ 26)) (QREFELT $ 27))
                   . #3=(|RRCC-;recip;ThePolsSU;5|))
             (EXIT
              (COND ((QEQCAR |res| 1) (CONS 1 "failed"))
                    (#4='T (CONS 0 (SPADCALL (QCDR |res|) (QREFELT $ 28))))))))
           (#4#
            (SEQ (LETT |defPol| (SPADCALL |rootChar| (QREFELT $ 29)) . #3#)
                 (LETT |d| (SPADCALL (LIST |defPol| |toInv|) (QREFELT $ 31))
                       . #3#)
                 (EXIT
                  (COND
                   ((SPADCALL (QCDR |d|) |rootChar| (QREFELT $ 32))
                    (CONS 1 "failed"))
                   (#4#
                    (SEQ
                     (COND
                      ((SPADCALL (SPADCALL (QCDR |d|) (QREFELT $ 25)) 0
                                 (QREFELT $ 33))
                       (SEQ
                        (LETT |defPol|
                              (PROG2
                                  (LETT #2#
                                        (SPADCALL |defPol| (QCDR |d|)
                                                  (QREFELT $ 34))
                                        . #3#)
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 0) (QREFELT $ 8)
                                                (|Union| (QREFELT $ 8) #1#)
                                                #2#))
                              . #3#)
                        (EXIT
                         (LETT |d|
                               (SPADCALL (LIST |defPol| |toInv|)
                                         (QREFELT $ 31))
                               . #3#)))))
                     (EXIT
                      (CONS 0 (SPADCALL (QCAR |d|) 2 (QREFELT $ 36)))))))))))))) 

(DECLAIM (NOTINLINE |RealRootCharacterizationCategory&;|)) 

(DEFUN |RealRootCharacterizationCategory&| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|RealRootCharacterizationCategory&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$|
                (LIST '|RealRootCharacterizationCategory&| DV$1 DV$2 DV$3)
                . #1#)
          (LETT $ (GETREFV 39) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RealRootCharacterizationCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Integer|) (0 . |sign|) (|Boolean|)
              |RRCC-;zero?;ThePolsSB;1| |RRCC-;negative?;ThePolsSB;2| (6 . >)
              |RRCC-;positive?;ThePolsSB;3| (|List| $) (12 . |allRootsOf|)
              (|NonNegativeInteger|) (17 . >) (|List| 6) (23 . |elt|)
              (|Union| $ '"failed") (|PositiveInteger|)
              |RRCC-;rootOf;ThePolsPiU;4| (29 . |degree|)
              (34 . |leadingCoefficient|) (39 . |recip|) (44 . |coerce|)
              (49 . |definingPolynomial|)
              (|Record| (|:| |coef| 16) (|:| |generator| $))
              (54 . |principalIdeal|) (59 . |zero?|) (65 . ~=) (71 . |exquo|)
              (|List| 8) (77 . |elt|) (|Union| 8 '"failed")
              |RRCC-;recip;ThePolsSU;5|)
           '#(|zero?| 83 |rootOf| 89 |recip| 95 |positive?| 101 |negative?|
              107)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 38
                                                 '(2 6 9 8 0 10 2 9 11 0 0 14 1
                                                   6 16 8 17 2 18 11 0 0 19 2
                                                   20 6 0 9 21 1 8 18 0 25 1 8
                                                   7 0 26 1 7 22 0 27 1 8 0 7
                                                   28 1 6 8 0 29 1 8 30 16 31 2
                                                   6 11 8 0 32 2 9 11 0 0 33 2
                                                   8 22 0 0 34 2 35 8 0 9 36 2
                                                   0 11 8 0 12 2 0 22 8 23 24 2
                                                   0 37 8 0 38 2 0 11 8 0 15 2
                                                   0 11 8 0 13)))))
           '|lookupComplete|)) 
