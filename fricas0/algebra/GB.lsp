
(SDEFUN |GB;monicize| ((|p| |Dpol|) ($ |Dpol|))
        (SPROG ((|lc| (|Dom|)))
               (SEQ (LETT |lc| (SPADCALL |p| (QREFELT $ 10)) |GB;monicize|)
                    (EXIT
                     (COND
                      ((SPADCALL |lc| (|spadConstant| $ 11) (QREFELT $ 14))
                       |p|)
                      ('T
                       (SPADCALL (SPADCALL |lc| (QREFELT $ 15)) |p|
                                 (QREFELT $ 16)))))))) 

(SDEFUN |GB;normalForm;DpolLDpol;2|
        ((|p| |Dpol|) (|l| |List| |Dpol|) ($ |Dpol|))
        (SPADCALL |p|
                  (SPADCALL (CONS (|function| |GB;monicize|) $) |l|
                            (QREFELT $ 19))
                  (QREFELT $ 21))) 

(SDEFUN |GB;groebner;2L;3| ((|Pol| |List| |Dpol|) ($ |List| |Dpol|))
        (SPROG ((#1=#:G712 NIL) (|x| NIL) (#2=#:G711 NIL))
               (SEQ
                (COND ((SPADCALL |Pol| NIL (QREFELT $ 23)) |Pol|)
                      (#3='T
                       (SEQ
                        (LETT |Pol|
                              (PROGN
                               (LETT #2# NIL . #4=(|GB;groebner;2L;3|))
                               (SEQ (LETT |x| NIL . #4#) (LETT #1# |Pol| . #4#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |x| (CAR #1#) . #4#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL |x| (|spadConstant| $ 26)
                                                  (QREFELT $ 27))
                                        (LETT #2# (CONS |x| #2#) . #4#)))))
                                    (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |Pol| NIL (QREFELT $ 23))
                           (LIST (|spadConstant| $ 26)))
                          (#3#
                           (SPADCALL
                            (SPADCALL (CONS #'|GB;groebner;2L;3!0| $)
                                      (SPADCALL |Pol| 0 0 (QREFELT $ 31))
                                      (QREFELT $ 33))
                            (QREFELT $ 34))))))))))) 

(SDEFUN |GB;groebner;2L;3!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 28)) (SPADCALL |y| (QREFELT $ 28))
                  (QREFELT $ 29))) 

(SDEFUN |GB;groebner;LSL;4|
        ((|Pol| |List| |Dpol|) (|xx1| |String|) ($ |List| |Dpol|))
        (SPROG ((#1=#:G722 NIL) (|x| NIL) (#2=#:G721 NIL))
               (SEQ
                (COND ((SPADCALL |Pol| NIL (QREFELT $ 23)) |Pol|)
                      (#3='T
                       (SEQ
                        (LETT |Pol|
                              (PROGN
                               (LETT #2# NIL . #4=(|GB;groebner;LSL;4|))
                               (SEQ (LETT |x| NIL . #4#) (LETT #1# |Pol| . #4#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |x| (CAR #1#) . #4#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL |x| (|spadConstant| $ 26)
                                                  (QREFELT $ 27))
                                        (LETT #2# (CONS |x| #2#) . #4#)))))
                                    (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |Pol| NIL (QREFELT $ 23))
                           (LIST (|spadConstant| $ 26)))
                          ((EQUAL |xx1| "redcrit")
                           (SPADCALL
                            (SPADCALL (CONS #'|GB;groebner;LSL;4!0| $)
                                      (SPADCALL |Pol| 1 0 (QREFELT $ 31))
                                      (QREFELT $ 33))
                            (QREFELT $ 34)))
                          ((EQUAL |xx1| "info")
                           (SPADCALL
                            (SPADCALL (CONS #'|GB;groebner;LSL;4!1| $)
                                      (SPADCALL |Pol| 2 1 (QREFELT $ 31))
                                      (QREFELT $ 33))
                            (QREFELT $ 34)))
                          (#3#
                           (SEQ (SPADCALL "   " (QREFELT $ 39))
                                (SPADCALL
                                 "WARNING: options are - redcrit and/or info - "
                                 (QREFELT $ 39))
                                (SPADCALL
                                 "         you didn't type them correct"
                                 (QREFELT $ 39))
                                (SPADCALL "         please try again"
                                          (QREFELT $ 39))
                                (SPADCALL "   " (QREFELT $ 39))
                                (EXIT NIL))))))))))) 

(SDEFUN |GB;groebner;LSL;4!1| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 28)) (SPADCALL |y| (QREFELT $ 28))
                  (QREFELT $ 29))) 

(SDEFUN |GB;groebner;LSL;4!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 28)) (SPADCALL |y| (QREFELT $ 28))
                  (QREFELT $ 29))) 

(SDEFUN |GB;groebner;L2SL;5|
        ((|Pol| |List| |Dpol|) (|xx1| |String|) (|xx2| |String|)
         ($ |List| |Dpol|))
        (SPROG ((#1=#:G733 NIL) (|x| NIL) (#2=#:G732 NIL))
               (SEQ
                (COND ((SPADCALL |Pol| NIL (QREFELT $ 23)) |Pol|)
                      (#3='T
                       (SEQ
                        (LETT |Pol|
                              (PROGN
                               (LETT #2# NIL . #4=(|GB;groebner;L2SL;5|))
                               (SEQ (LETT |x| NIL . #4#) (LETT #1# |Pol| . #4#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |x| (CAR #1#) . #4#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL |x| (|spadConstant| $ 26)
                                                  (QREFELT $ 27))
                                        (LETT #2# (CONS |x| #2#) . #4#)))))
                                    (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |Pol| NIL (QREFELT $ 23))
                           (LIST (|spadConstant| $ 26)))
                          (#3#
                           (SEQ
                            (COND
                             ((EQUAL |xx1| "redcrit")
                              (COND
                               ((EQUAL |xx2| "info")
                                (EXIT
                                 (SPADCALL
                                  (SPADCALL (CONS #'|GB;groebner;L2SL;5!0| $)
                                            (SPADCALL |Pol| 1 1 (QREFELT $ 31))
                                            (QREFELT $ 33))
                                  (QREFELT $ 34))))
                               ((EQUAL |xx1| #5="info")
                                (COND
                                 ((EQUAL |xx2| #6="redcrit")
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL (CONS #'|GB;groebner;L2SL;5!1| $)
                                              (SPADCALL |Pol| 1 1
                                                        (QREFELT $ 31))
                                              (QREFELT $ 33))
                                    (QREFELT $ 34))))))))
                             ((EQUAL |xx1| #5#)
                              (COND
                               ((EQUAL |xx2| #6#)
                                (EXIT
                                 (SPADCALL
                                  (SPADCALL (CONS #'|GB;groebner;L2SL;5!2| $)
                                            (SPADCALL |Pol| 1 1 (QREFELT $ 31))
                                            (QREFELT $ 33))
                                  (QREFELT $ 34)))))))
                            (COND
                             ((EQUAL |xx1| "redcrit")
                              (COND
                               ((EQUAL |xx2| "redcrit")
                                (EXIT
                                 (SPADCALL
                                  (SPADCALL (CONS #'|GB;groebner;L2SL;5!3| $)
                                            (SPADCALL |Pol| 1 0 (QREFELT $ 31))
                                            (QREFELT $ 33))
                                  (QREFELT $ 34)))))))
                            (COND
                             ((EQUAL |xx1| "info")
                              (COND
                               ((EQUAL |xx2| "info")
                                (EXIT
                                 (SPADCALL
                                  (SPADCALL (CONS #'|GB;groebner;L2SL;5!4| $)
                                            (SPADCALL |Pol| 2 1 (QREFELT $ 31))
                                            (QREFELT $ 33))
                                  (QREFELT $ 34)))))))
                            (SPADCALL "   " (QREFELT $ 39))
                            (SPADCALL
                             "WARNING:  options are - redcrit and/or info - "
                             (QREFELT $ 39))
                            (SPADCALL
                             "          you didn't type them correctly"
                             (QREFELT $ 39))
                            (SPADCALL "          please try again "
                                      (QREFELT $ 39))
                            (SPADCALL "   " (QREFELT $ 39)) (EXIT NIL))))))))))) 

(SDEFUN |GB;groebner;L2SL;5!4| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 28)) (SPADCALL |y| (QREFELT $ 28))
                  (QREFELT $ 29))) 

(SDEFUN |GB;groebner;L2SL;5!3| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 28)) (SPADCALL |y| (QREFELT $ 28))
                  (QREFELT $ 29))) 

(SDEFUN |GB;groebner;L2SL;5!2| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 28)) (SPADCALL |y| (QREFELT $ 28))
                  (QREFELT $ 29))) 

(SDEFUN |GB;groebner;L2SL;5!1| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 28)) (SPADCALL |y| (QREFELT $ 28))
                  (QREFELT $ 29))) 

(SDEFUN |GB;groebner;L2SL;5!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 28)) (SPADCALL |y| (QREFELT $ 28))
                  (QREFELT $ 29))) 

(DECLAIM (NOTINLINE |GroebnerPackage;|)) 

(DEFUN |GroebnerPackage| (&REST #1=#:G734)
  (SPROG NIL
         (PROG (#2=#:G735)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GroebnerPackage|)
                                               '|domainEqualList|)
                    . #3=(|GroebnerPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GroebnerPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GroebnerPackage|)))))))))) 

(DEFUN |GroebnerPackage;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|GroebnerPackage|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|GroebnerPackage| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 42) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#1| '(|Field|))))
                    . #1#))
    (|haddProp| |$ConstructorCache| '|GroebnerPackage|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 22
                 (CONS (|dispatchFunction| |GB;normalForm;DpolLDpol;2|) $)))))
    $))) 

(MAKEPROP '|GroebnerPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |leadingCoefficient|)
              (5 . |One|) (9 . |One|) (|Boolean|) (13 . =) (19 . |inv|)
              (24 . *) (|Mapping| 9 9) (|List| 9) (30 . |map|)
              (|GroebnerInternalPackage| 6 7 8 9) (36 . |redPol|)
              (42 . |normalForm|) (48 . =) (54 . |Zero|) (58 . |Zero|)
              (62 . |Zero|) (66 . ~=) (72 . |degree|) (77 . >) (|Integer|)
              (83 . |gbasis|) (|Mapping| 13 9 9) (90 . |sort|)
              (96 . |minGbasis|) |GB;groebner;2L;3| (|Void|) (|String|)
              (|OutputForm|) (101 . |messagePrint|) |GB;groebner;LSL;4|
              |GB;groebner;L2SL;5|)
           '#(|normalForm| 106 |groebner| 112) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 41
                                                 '(1 9 6 0 10 0 6 0 11 0 9 0 12
                                                   2 6 13 0 0 14 1 6 0 0 15 2 9
                                                   0 6 0 16 2 18 0 17 0 19 2 20
                                                   9 9 18 21 2 0 9 9 18 22 2 18
                                                   13 0 0 23 0 6 0 24 0 7 0 25
                                                   0 9 0 26 2 9 13 0 0 27 1 9 7
                                                   0 28 2 7 13 0 0 29 3 20 18
                                                   18 30 30 31 2 18 0 32 0 33 1
                                                   20 18 18 34 1 38 36 37 39 2
                                                   1 9 9 18 22 2 0 18 18 37 40
                                                   1 0 18 18 35 3 0 18 18 37 37
                                                   41)))))
           '|lookupComplete|)) 
