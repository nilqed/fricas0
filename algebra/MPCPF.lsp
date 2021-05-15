
(SDEFUN |MPCPF;factor;PPRF;1| ((|p| PPR) ($ |Factored| PPR))
        (SPROG
         ((#1=#:G392 NIL) (#2=#:G391 #3=(|Factored| PPR)) (#4=#:G393 #3#)
          (#5=#:G399 NIL) (|ff| NIL) (|fcont| (PPR))
          (|ffact|
           (|List|
            (|Record| (|:| |irr| PPR) (|:| |pow| (|NonNegativeInteger|)))))
          (#6=#:G398 NIL) (|u| NIL) (#7=#:G397 NIL)
          (|flist| (|Factored| (|Polynomial| R))) (|g| (|Polynomial| R))
          (|vars| (|List| OV)) (#8=#:G380 NIL) (|c| (|Polynomial| R)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 11)) (SPADCALL |p| 1 (QREFELT $ 16)))
                (#9='T
                 (SEQ (LETT |c| (SPADCALL |p| (QREFELT $ 18)))
                      (LETT |p|
                            (PROG2 (LETT #8# (SPADCALL |p| |c| (QREFELT $ 20)))
                                (QCDR #8#)
                              (|check_union2| (QEQCAR #8# 0) (QREFELT $ 9)
                                              (|Union| (QREFELT $ 9) "failed")
                                              #8#)))
                      (LETT |vars| (SPADCALL |p| (QREFELT $ 22)))
                      (LETT |g|
                            (SPADCALL (SPADCALL |p| |vars| (QREFELT $ 24))
                                      (QREFELT $ 25)))
                      (LETT |flist| (SPADCALL |g| (QREFELT $ 28)))
                      (LETT |ffact|
                            (PROGN
                             (LETT #7# NIL)
                             (SEQ (LETT |u| NIL)
                                  (LETT #6# (SPADCALL |flist| (QREFELT $ 32)))
                                  G190
                                  (COND
                                   ((OR (ATOM #6#)
                                        (PROGN (LETT |u| (CAR #6#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #7#
                                          (CONS
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL (QVELT |u| 1)
                                                       (QREFELT $ 33))
                                             |vars| (QREFELT $ 34))
                                            (QVELT |u| 2))
                                           #7#))))
                                  (LETT #6# (CDR #6#)) (GO G190) G191
                                  (EXIT (NREVERSE #7#)))))
                      (LETT |fcont|
                            (SPADCALL (SPADCALL |flist| (QREFELT $ 35))
                                      (QREFELT $ 33)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |c| |fcont| (QREFELT $ 36)) 1
                                  (QREFELT $ 16))
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |ff| NIL) (LETT #5# |ffact|) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |ff| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4#
                                       (SPADCALL (QCAR |ff|) (QCDR |ff|)
                                                 (QREFELT $ 37)))
                                 (COND
                                  (#1#
                                   (LETT #2#
                                         (SPADCALL #2# #4# (QREFELT $ 38))))
                                  ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#1# #2#) (#9# (|spadConstant| $ 39))))
                        (QREFELT $ 38))))))))) 

(DECLAIM (NOTINLINE |MPolyCatPolyFactorizer;|)) 

(DEFUN |MPolyCatPolyFactorizer| (&REST #1=#:G400)
  (SPROG NIL
         (PROG (#2=#:G401)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MPolyCatPolyFactorizer|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MPolyCatPolyFactorizer;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MPolyCatPolyFactorizer|)))))))))) 

(DEFUN |MPolyCatPolyFactorizer;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|MPolyCatPolyFactorizer| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 41))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|MPolyCatPolyFactorizer|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|MPolyCatPolyFactorizer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Boolean|) (0 . |ground?|)
              (5 . |One|) (9 . |One|) (|NonNegativeInteger|) (|Factored| 9)
              (13 . |nilFactor|) (|Polynomial| 8) (19 . |content|)
              (|Union| $ '"failed") (24 . |exquo|) (|List| 7)
              (30 . |variables|) (|PushVariables| 8 6 7 9) (35 . |pushdown|)
              (41 . |retract|) (|Factored| 17)
              (|GeneralizedMultivariateFactorize| (|Symbol|)
                                                  (|IndexedExponents|
                                                   (|Symbol|))
                                                  8 8 17)
              (46 . |factor|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 29) (|:| |factor| 17) (|:| |exponent| 14))
              (|List| 30) (51 . |factorList|) (56 . |coerce|) (61 . |pushup|)
              (67 . |unit|) (72 . *) (78 . |primeFactor|) (84 . *) (90 . |One|)
              |MPCPF;factor;PPRF;1|)
           '#(|factor| 94) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|factor| ((|Factored| |#4|) |#4|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 40
                                            '(1 9 10 0 11 0 8 0 12 0 9 0 13 2
                                              15 0 9 14 16 1 9 17 0 18 2 9 19 0
                                              17 20 1 9 21 0 22 2 23 9 9 21 24
                                              1 9 17 0 25 1 27 26 17 28 1 26 31
                                              0 32 1 9 0 17 33 2 23 9 9 21 34 1
                                              26 17 0 35 2 9 0 17 0 36 2 15 0 9
                                              14 37 2 15 0 0 0 38 0 15 0 39 1 0
                                              15 9 40)))))
           '|lookupComplete|)) 
