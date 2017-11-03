
(SDEFUN |INPSIGN;signAround;UPRMU;1|
        ((|p| UP) (|x| R)
         (|rsign| |Mapping| (|Union| (|Integer|) #1="failed") R)
         ($ |Union| (|Integer|) #1#))
        (SPROG ((|ul| #2=(|Union| (|Integer|) #1#)) (|ur| #2#))
               (SEQ
                (LETT |ur| (SPADCALL |p| |x| 1 |rsign| (QREFELT $ 13))
                      . #3=(|INPSIGN;signAround;UPRMU;1|))
                (EXIT
                 (COND ((QEQCAR |ur| 1) (CONS 1 "failed"))
                       ('T
                        (SEQ
                         (LETT |ul|
                               (SPADCALL |p| |x| -1 |rsign| (QREFELT $ 13))
                               . #3#)
                         (EXIT
                          (COND
                           ((OR (QEQCAR |ul| 1)
                                (NULL (EQL (QCDR |ur|) (QCDR |ul|))))
                            (CONS 1 "failed"))
                           ('T |ur|)))))))))) 

(SDEFUN |INPSIGN;signAround;UPRIMU;2|
        ((|p| UP) (|x| R) (|dir| |Integer|)
         (|rsign| |Mapping| (|Union| (|Integer|) #1="failed") R)
         ($ |Union| (|Integer|) #1#))
        (SPROG ((|u| (|Union| (|Integer|) #1#)) (|r| (R)))
               (SEQ
                (COND ((SPADCALL |p| (QREFELT $ 16)) (CONS 0 0))
                      ((SPADCALL
                        (LETT |r| (SPADCALL |p| |x| (QREFELT $ 17))
                              . #2=(|INPSIGN;signAround;UPRIMU;2|))
                        (QREFELT $ 18))
                       (SEQ
                        (LETT |u|
                              (SPADCALL (SPADCALL |p| (QREFELT $ 19)) |x| |dir|
                                        |rsign| (QREFELT $ 13))
                              . #2#)
                        (EXIT
                         (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                               (#3='T (CONS 0 (* |dir| (QCDR |u|))))))))
                      (#3# (SPADCALL |r| |rsign|)))))) 

(SDEFUN |INPSIGN;signAround;UPIMU;3|
        ((|p| UP) (|dir| |Integer|)
         (|rsign| |Mapping| (|Union| (|Integer|) #1="failed") R)
         ($ |Union| (|Integer|) #1#))
        (SPROG ((|u| (|Union| (|Integer|) #1#)))
               (SEQ
                (COND ((SPADCALL |p| (QREFELT $ 16)) (CONS 0 0))
                      ('T
                       (SEQ
                        (LETT |u|
                              (SPADCALL (SPADCALL |p| (QREFELT $ 20)) |rsign|)
                              |INPSIGN;signAround;UPIMU;3|)
                        (EXIT
                         (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                               ((OR (SPADCALL |dir| 0 (QREFELT $ 23))
                                    (SPADCALL (SPADCALL |p| (QREFELT $ 25))
                                              (QREFELT $ 26)))
                                (CONS 0 (QCDR |u|)))
                               ('T (CONS 0 (- (QCDR |u|)))))))))))) 

(DECLAIM (NOTINLINE |InnerPolySign;|)) 

(DEFUN |InnerPolySign| (&REST #1=#:G721)
  (SPROG NIL
         (PROG (#2=#:G722)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerPolySign|)
                                               '|domainEqualList|)
                    . #3=(|InnerPolySign|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerPolySign;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|InnerPolySign|)))))))))) 

(DEFUN |InnerPolySign;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerPolySign|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|InnerPolySign| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 28) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|InnerPolySign| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|InnerPolySign| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (|Union| 11 '"failed") (|Integer|) (|Mapping| 10 6)
              |INPSIGN;signAround;UPRIMU;2| |INPSIGN;signAround;UPRMU;1|
              (|Boolean|) (8 . |zero?|) (13 . |elt|) (19 . |zero?|)
              (24 . |differentiate|) (29 . |leadingCoefficient|) (34 . |Zero|)
              (38 . |Zero|) (42 . >) (|NonNegativeInteger|) (48 . |degree|)
              (53 . |even?|) |INPSIGN;signAround;UPIMU;3|)
           '#(|signAround| 58) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 27
                                                 '(0 6 0 8 0 7 0 9 1 7 15 0 16
                                                   2 7 6 0 6 17 1 6 15 0 18 1 7
                                                   0 0 19 1 7 6 0 20 0 6 0 21 0
                                                   7 0 22 2 11 15 0 0 23 1 7 24
                                                   0 25 1 11 15 0 26 3 0 10 7
                                                   11 12 27 3 0 10 7 6 12 14 4
                                                   0 10 7 6 11 12 13)))))
           '|lookupComplete|)) 
