
(SDEFUN |SUBRESP;primitivePart;UPRUP;1| ((|p| UP) (|q| R) ($ UP))
        (SPROG
         ((|rec| (|Record| (|:| |coef1| R) (|:| |coef2| R))) (#1=#:G701 NIL))
         (SEQ
          (LETT |rec|
                (PROG2
                    (LETT #1#
                          (SPADCALL (SPADCALL |p| (QREFELT $ 8)) |q|
                                    (|spadConstant| $ 9) (QREFELT $ 12))
                          . #2=(|SUBRESP;primitivePart;UPRUP;1|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|Record| (|:| |coef1| (QREFELT $ 6))
                                            (|:| |coef2| (QREFELT $ 6)))
                                  (|Union|
                                   (|Record| (|:| |coef1| (QREFELT $ 6))
                                             (|:| |coef2| (QREFELT $ 6)))
                                   "failed")
                                  #1#))
                . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (CONS #'|SUBRESP;primitivePart;UPRUP;1!0| (VECTOR |q| $ |rec|))
              |p| (QREFELT $ 16))
             (QREFELT $ 17))
            (QREFELT $ 18)))))) 

(SDEFUN |SUBRESP;primitivePart;UPRUP;1!0| ((|x1| NIL) ($$ NIL))
        (PROG (|rec| $ |q|)
          (LETT |rec| (QREFELT $$ 2) . #1=(|SUBRESP;primitivePart;UPRUP;1|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL (QCAR |rec|) |x1| (QREFELT $ 13)) |q|
                      (QREFELT $ 14)))))) 

(SDEFUN |SUBRESP;subresultantVector;2UPPa;2|
        ((|p1| UP) (|p2| UP) ($ |PrimitiveArray| UP))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|Sn| (UP)) (#1=#:G729 NIL)
          (|l| (|List| UP)) (F (UP)) (#2=#:G718 NIL) (#3=#:G713 NIL)
          (|res| (|PrimitiveArray| UP)))
         (SEQ
          (LETT |res|
                (MAKEARR1
                 (+ 2
                    (MAX (SPADCALL |p1| (QREFELT $ 21))
                         (SPADCALL |p2| (QREFELT $ 21))))
                 (|spadConstant| $ 22))
                . #4=(|SUBRESP;subresultantVector;2UPPa;2|))
          (LETT |l| (SPADCALL |p1| |p2| (QREFELT $ 25)) . #4#)
          (EXIT
           (COND
            ((NULL |l|)
             (COND
              ((ZEROP (SPADCALL |p1| (QREFELT $ 21)))
               (SEQ (QSETAREF1 |res| (SPADCALL |p2| (QREFELT $ 21)) |p2|)
                    (COND
                     ((SPADCALL (SPADCALL |p2| (QREFELT $ 21)) 0
                                (QREFELT $ 27))
                      (SEQ
                       (QSETAREF1 |res|
                                  (PROG1
                                      (LETT #3#
                                            (- (SPADCALL |p2| (QREFELT $ 21))
                                               1)
                                            . #4#)
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                  |p1|)
                       (EXIT
                        (QSETAREF1 |res| 0
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |p1| (QREFELT $ 8))
                                              (SPADCALL |p2| (QREFELT $ 21))
                                              (QREFELT $ 29))
                                    (QREFELT $ 30))))))
                     (#5='T (QSETAREF1 |res| 0 (|spadConstant| $ 31))))
                    (EXIT |res|)))
              ((ZEROP (SPADCALL |p2| (QREFELT $ 21)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |p1| (QREFELT $ 21)) 0 (QREFELT $ 27))
                  (SEQ
                   (QSETAREF1 |res|
                              (PROG1
                                  (LETT #2#
                                        (- (SPADCALL |p1| (QREFELT $ 21)) 1)
                                        . #4#)
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              |p2|)
                   (EXIT
                    (QSETAREF1 |res| 0
                               (SPADCALL
                                (SPADCALL (SPADCALL |p2| (QREFELT $ 8))
                                          (SPADCALL |p1| (QREFELT $ 21))
                                          (QREFELT $ 29))
                                (QREFELT $ 30))))))
                 (#5# (QSETAREF1 |res| 0 (|spadConstant| $ 31))))
                (EXIT |res|)))
              (#5# (|error| "SUBRESP: strange Subresultant chain from PRS"))))
            (#5#
             (SEQ (LETT |Sn| (|SPADfirst| |l|) . #4#)
                  (LETT |l| (CDR |l|) . #4#)
                  (LETT |n| (SPADCALL |Sn| (QREFELT $ 21)) . #4#)
                  (LETT F |Sn| . #4#)
                  (EXIT
                   (COND
                    ((OR (NULL |l|) (SPADCALL |Sn| (QREFELT $ 32)))
                     (|error| "SUBRESP: strange Subresultant chain from PRS"))
                    ('T
                     (SEQ
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |l| NIL (QREFELT $ 33)))
                             (GO G191)))
                           (SEQ (QSETAREF1 |res| |n| |Sn|)
                                (LETT F (|SPADfirst| |l|) . #4#)
                                (LETT |l| (CDR |l|) . #4#)
                                (EXIT
                                 (COND
                                  ((EQL (SPADCALL F (QREFELT $ 21)) |n|)
                                   (COND
                                    ((NULL |l|)
                                     (|error|
                                      "SUBRESP: strange Subresultant chain from PRS"))
                                    ('T
                                     (SEQ (LETT |Sn| (|SPADfirst| |l|) . #4#)
                                          (LETT |l| (CDR |l|) . #4#)
                                          (LETT |n|
                                                (SPADCALL |Sn| (QREFELT $ 21))
                                                . #4#)
                                          (EXIT
                                           (QSETAREF1 |res|
                                                      (PROG1
                                                          (LETT #1# (- |n| 1)
                                                                . #4#)
                                                        (|check_subtype2|
                                                         (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                                      F))))))
                                  ((< (SPADCALL F (QREFELT $ 21)) |n|)
                                   (|error| "strange result !"))
                                  ('T
                                   (SEQ (LETT |Sn| F . #4#)
                                        (EXIT
                                         (LETT |n|
                                               (SPADCALL |Sn| (QREFELT $ 21))
                                               . #4#)))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (QSETAREF1 |res| |n| |Sn|)
                      (COND
                       ((EQL (SPADCALL |p1| (QREFELT $ 21))
                             (SPADCALL |p2| (QREFELT $ 21)))
                        (QSETAREF1 |res| (+ (SPADCALL |p1| (QREFELT $ 21)) 1)
                                   |p1|))
                       ((SPADCALL (SPADCALL |p1| (QREFELT $ 21))
                                  (SPADCALL |p2| (QREFELT $ 21))
                                  (QREFELT $ 27))
                        (QSETAREF1 |res| (SPADCALL |p1| (QREFELT $ 21)) |p1|))
                       (#5#
                        (QSETAREF1 |res| (SPADCALL |p2| (QREFELT $ 21)) |p2|)))
                      (EXIT |res|)))))))))))) 

(DECLAIM (NOTINLINE |SubResultantPackage;|)) 

(DEFUN |SubResultantPackage| (&REST #1=#:G742)
  (SPROG NIL
         (PROG (#2=#:G743)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SubResultantPackage|)
                                               '|domainEqualList|)
                    . #3=(|SubResultantPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SubResultantPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SubResultantPackage|)))))))))) 

(DEFUN |SubResultantPackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SubResultantPackage|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|SubResultantPackage| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 36) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|EuclideanDomain|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|SubResultantPackage|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 19
                      (CONS
                       (|dispatchFunction| |SUBRESP;primitivePart;UPRUP;1|)
                       $))))
          $))) 

(MAKEPROP '|SubResultantPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |leadingCoefficient|) (5 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 10 '"failed")
              (9 . |extendedEuclidean|) (16 . *) (22 . |rem|) (|Mapping| 6 6)
              (28 . |map|) (34 . |primitivePart|) (39 . |unitCanonical|)
              (44 . |primitivePart|) (|NonNegativeInteger|) (50 . |degree|)
              (55 . |Zero|) (|List| 7) (|PseudoRemainderSequence| 6 7)
              (59 . |chainSubResultants|) (|Boolean|) (65 . >) (71 . |Zero|)
              (75 . ^) (81 . |coerce|) (86 . |One|) (90 . |zero?|) (95 . ~=)
              (|PrimitiveArray| 7) |SUBRESP;subresultantVector;2UPPa;2|)
           '#(|subresultantVector| 101 |primitivePart| 107) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 35
                                                 '(1 7 6 0 8 0 6 0 9 3 6 11 0 0
                                                   0 12 2 6 0 0 0 13 2 6 0 0 0
                                                   14 2 7 0 15 0 16 1 7 0 0 17
                                                   1 7 0 0 18 2 0 7 7 6 19 1 7
                                                   20 0 21 0 7 0 22 2 24 23 7 7
                                                   25 2 20 26 0 0 27 0 6 0 28 2
                                                   6 0 0 20 29 1 7 0 6 30 0 7 0
                                                   31 1 7 26 0 32 2 23 26 0 0
                                                   33 2 0 34 7 7 35 2 1 7 7 6
                                                   19)))))
           '|lookupComplete|)) 
