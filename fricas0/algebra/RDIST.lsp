
(SDEFUN |RDIST;weighted;LM;1|
        ((|lvw| |List| (|Record| (|:| |value| S) (|:| |weight| (|Integer|))))
         ($ |Mapping| S))
        (SPROG
         ((|totwt| (|Integer|)) (#1=#:G714 NIL) (|k| NIL) (#2=#:G715 NIL)
          (|i| NIL) (|wv| (|Vector| (|Integer|))) (|kv| (|Vector| S))
          (|n| (|NonNegativeInteger|)) (|kl| (|List| S)) (|w| (|Integer|))
          (|u| (|Union| (|Integer|) "failed")) (#3=#:G713 NIL) (|r| NIL)
          (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |t| (SPADCALL (QREFELT $ 8)) . #4=(|RDIST;weighted;LM;1|))
              (SEQ (LETT |r| NIL . #4#) (LETT #3# |lvw| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |r| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |u| (SPADCALL (QCAR |r|) |t| (QREFELT $ 10)) . #4#)
                    (LETT |w|
                          (COND ((QEQCAR |u| 1) (|spadConstant| $ 12))
                                ('T (QCDR |u|)))
                          . #4#)
                    (EXIT
                     (SPADCALL |t| (QCAR |r|)
                               (SPADCALL |w| (QCDR |r|) (QREFELT $ 13))
                               (QREFELT $ 14))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |kl| (SPADCALL |t| (QREFELT $ 16)) . #4#)
              (LETT |n| (SPADCALL |kl| (QREFELT $ 18)) . #4#)
              (EXIT
               (COND
                ((SPADCALL |n| (|spadConstant| $ 19) (QREFELT $ 21))
                 (|error| "Cannot select from empty set"))
                ('T
                 (SEQ
                  (LETT |kv|
                        (SPADCALL |n|
                                  (SPADCALL |kl| (|spadConstant| $ 19)
                                            (QREFELT $ 22))
                                  (QREFELT $ 24))
                        . #4#)
                  (LETT |wv|
                        (SPADCALL |n| (|spadConstant| $ 19) (QREFELT $ 26))
                        . #4#)
                  (LETT |totwt| (|spadConstant| $ 19) . #4#)
                  (SEQ (LETT |i| (|spadConstant| $ 29) . #4#)
                       (LETT #2# |n| . #4#) (LETT |k| NIL . #4#)
                       (LETT #1# |kl| . #4#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #4#) NIL)
                             (> |i| #2#))
                         (GO G191)))
                       (SEQ (SPADCALL |kv| |i| |k| (QREFELT $ 30))
                            (LETT |totwt|
                                  (SPADCALL |totwt|
                                            (SPADCALL |t| |k| (QREFELT $ 31))
                                            (QREFELT $ 13))
                                  . #4#)
                            (EXIT (SPADCALL |wv| |i| |totwt| (QREFELT $ 32))))
                       (LETT #1# (PROG1 (CDR #1#) (LETT |i| (+ |i| 1) . #4#))
                             . #4#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL |kv| |wv| |totwt| (QREFELT $ 34)))))))))) 

(SDEFUN |RDIST;rdHack1;VVIM;2|
        ((|kv| |Vector| S) (|wv| |Vector| (|Integer|)) (|totwt| |Integer|)
         ($ |Mapping| S))
        (SPROG NIL
               (SEQ (CONS #'|RDIST;rdHack1;VVIM;2!0| (VECTOR |kv| $ |totwt|))))) 

(SDEFUN |RDIST;rdHack1;VVIM;2!0| (($$ NIL))
        (PROG (|totwt| $ |kv|)
          (LETT |totwt| (QREFELT $$ 2) . #1=(|RDIST;rdHack1;VVIM;2|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |kv| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|w| NIL))
                   (SEQ (LETT |w| (SPADCALL |totwt| (QREFELT $ 39)) NIL)
                        (EXIT
                         (SPADCALL |kv| (|spadConstant| $ 40)
                                   (QREFELT $ 41))))))))) 

(SDEFUN |RDIST;uniform;SM;3| ((|fset| |Set| S) ($ |Mapping| S))
        (SPROG NIL (SEQ (CONS #'|RDIST;uniform;SM;3!0| (VECTOR $ |fset|))))) 

(SDEFUN |RDIST;uniform;SM;3!0| (($$ NIL))
        (PROG (|fset| $)
          (LETT |fset| (QREFELT $$ 1) . #1=(|RDIST;uniform;SM;3|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|l| NIL) (|n| NIL))
                   (SEQ (LETT |l| (SPADCALL |fset| (QREFELT $ 43)) NIL)
                        (LETT |n| (SPADCALL |l| (QREFELT $ 18)) NIL)
                        (EXIT
                         (SPADCALL |l|
                                   (SPADCALL (SPADCALL |n| (QREFELT $ 39))
                                             (|spadConstant| $ 29)
                                             (QREFELT $ 13))
                                   (QREFELT $ 22))))))))) 

(DECLAIM (NOTINLINE |RandomDistributions;|)) 

(DEFUN |RandomDistributions| (#1=#:G732)
  (SPROG NIL
         (PROG (#2=#:G733)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RandomDistributions|)
                                               '|domainEqualList|)
                    . #3=(|RandomDistributions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|RandomDistributions;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RandomDistributions|)))))))))) 

(DEFUN |RandomDistributions;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RandomDistributions|))
          (LETT |dv$| (LIST '|RandomDistributions| DV$1) . #1#)
          (LETT $ (GETREFV 46) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RandomDistributions| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RandomDistributions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Table| 6 11)
              (0 . |table|) (|Union| 11 '"failed") (4 . |search|) (|Integer|)
              (10 . |Zero|) (14 . +) (20 . |setelt!|) (|List| 6) (27 . |keys|)
              (|NonNegativeInteger|) (32 . |#|) (37 . |Zero|) (|Boolean|)
              (41 . =) (47 . |elt|) (|Vector| 6) (53 . |new|) (|Vector| 11)
              (59 . |new|) (|SingleInteger|) (65 . |One|) (69 . |One|)
              (73 . |setelt!|) (80 . |elt|) (86 . |setelt!|) (|Mapping| 6)
              |RDIST;rdHack1;VVIM;2|
              (|Record| (|:| |value| 6) (|:| |weight| 11)) (|List| 35)
              |RDIST;weighted;LM;1| (|RandomNumberSource|) (93 . |randnum|)
              (98 . |One|) (102 . |elt|) (|Set| 6) (108 . |members|)
              (113 . |randnum|) |RDIST;uniform;SM;3|)
           '#(|weighted| 117 |uniform| 122 |rdHack1| 127) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 45
                                                 '(0 7 0 8 2 7 9 6 0 10 0 11 0
                                                   12 2 11 0 0 0 13 3 7 11 0 6
                                                   11 14 1 7 15 0 16 1 15 17 0
                                                   18 0 17 0 19 2 17 20 0 0 21
                                                   2 15 6 0 11 22 2 23 0 17 6
                                                   24 2 25 0 17 11 26 0 27 0 28
                                                   0 17 0 29 3 23 6 0 11 6 30 2
                                                   7 11 0 6 31 3 25 11 0 11 11
                                                   32 1 38 11 11 39 0 11 0 40 2
                                                   23 6 0 11 41 1 42 15 0 43 0
                                                   38 11 44 1 0 33 36 37 1 0 33
                                                   42 45 3 0 33 23 25 11
                                                   34)))))
           '|lookupComplete|)) 
