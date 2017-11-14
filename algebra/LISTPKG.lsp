
(SDEFUN |LISTPKG;splitList;MLR;1|
        ((|f| |Mapping| (|Boolean|) T$) (|l| |List| T$)
         ($ |Record| (|:| |yes| (|List| T$)) (|:| |no| (|List| T$))))
        (SPROG
         ((|resno| #1=(|List| T$)) (|resyes| #1#) (#2=#:G722 NIL) (|t| NIL))
         (SEQ
          (COND ((NULL |l|) (CONS NIL NIL))
                ('T
                 (SEQ (LETT |resyes| NIL . #3=(|LISTPKG;splitList;MLR;1|))
                      (LETT |resno| NIL . #3#)
                      (SEQ (LETT |t| NIL . #3#) (LETT #2# |l| . #3#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |t| (CAR #2#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |t| |f|)
                               (LETT |resyes| (CONS |t| |resyes|) . #3#))
                              ('T (LETT |resno| (CONS |t| |resno|) . #3#)))))
                           (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (CONS (NREVERSE |resyes|) (NREVERSE |resno|))))))))) 

(SDEFUN |LISTPKG;topologicalSort!;M2L;2|
        ((|f| |Mapping| (|Boolean|) T$ T$) (|xx| |List| T$) ($ |List| T$))
        (SPROG
         ((|res| (|List| (|List| T$))) (|xx1| #1=(|List| T$)) (|bucket| #1#)
          (#2=#:G739 NIL) (|x| NIL) (|x0| (T$)))
         (SEQ (LETT |bucket| NIL . #3=(|LISTPKG;topologicalSort!;M2L;2|))
              (LETT |res| NIL . #3#)
              (SEQ G190 (COND ((NULL (NULL (NULL |xx|))) (GO G191)))
                   (SEQ (LETT |x0| (|SPADfirst| |xx|) . #3#)
                        (LETT |xx| (CDR |xx|) . #3#)
                        (LETT |bucket| (LIST |x0|) . #3#)
                        (LETT |xx1| NIL . #3#)
                        (SEQ (LETT |x| NIL . #3#) (LETT #2# |xx| . #3#) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |x0| |x| |f|)
                                 (LETT |bucket| (CONS |x| |bucket|) . #3#))
                                ('T (LETT |xx1| (CONS |x| |xx1|) . #3#)))))
                             (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |res| (CONS (REVERSE |bucket|) |res|) . #3#)
                        (EXIT (LETT |xx| (REVERSE |xx1|) . #3#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 12)))))) 

(SDEFUN |LISTPKG;topologicalSort;M2L;3|
        ((|f| |Mapping| (|Boolean|) T$ T$) (|xx| |List| T$) ($ |List| T$))
        (SPROG ((|xx1| (|List| T$)))
               (SEQ
                (LETT |xx1| (SPADCALL |xx| (QREFELT $ 15))
                      |LISTPKG;topologicalSort;M2L;3|)
                (EXIT (SPADCALL |f| |xx1| (QREFELT $ 14)))))) 

(SDEFUN |LISTPKG;topologicalSort;L2L;4|
        ((|adjacency| |List| (|List| (|Boolean|))) (|xx| |List| T$)
         ($ |List| T$))
        (SPROG
         ((#1=#:G760 NIL) (|p| NIL) (#2=#:G759 NIL)
          (|r| (|List| (|NonNegativeInteger|)))
          (|xi| (|List| (|NonNegativeInteger|)))
          (|res| (|List| (|List| (|NonNegativeInteger|))))
          (|xx1| #3=(|List| (|NonNegativeInteger|))) (|bucket| #3#)
          (#4=#:G758 NIL) (|x| NIL) (|x0| (|NonNegativeInteger|))
          (#5=#:G757 NIL) (|n| NIL) (#6=#:G756 NIL))
         (SEQ
          (LETT |xi|
                (PROGN
                 (LETT #6# NIL . #7=(|LISTPKG;topologicalSort;L2L;4|))
                 (SEQ (LETT |n| 1 . #7#) (LETT #5# (LENGTH |xx|) . #7#) G190
                      (COND ((|greater_SI| |n| #5#) (GO G191)))
                      (SEQ (EXIT (LETT #6# (CONS |n| #6#) . #7#)))
                      (LETT |n| (|inc_SI| |n|) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (LETT |bucket| NIL . #7#) (LETT |res| NIL . #7#)
          (SEQ G190 (COND ((NULL (NULL (NULL |xi|))) (GO G191)))
               (SEQ (LETT |x0| (|SPADfirst| |xi|) . #7#)
                    (LETT |xi| (CDR |xi|) . #7#)
                    (LETT |bucket| (LIST |x0|) . #7#) (LETT |xx1| NIL . #7#)
                    (SEQ (LETT |x| NIL . #7#) (LETT #4# |xi| . #7#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |x| (CAR #4#) . #7#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL
                              (SPADCALL |adjacency| |x0| (QREFELT $ 20)) |x|
                              (QREFELT $ 22))
                             (LETT |bucket| (CONS |x| |bucket|) . #7#))
                            ('T (LETT |xx1| (CONS |x| |xx1|) . #7#)))))
                         (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
                    (LETT |res| (CONS (REVERSE |bucket|) |res|) . #7#)
                    (EXIT (LETT |xi| (REVERSE |xx1|) . #7#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |r| (SPADCALL |res| (QREFELT $ 24)) . #7#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #7#)
            (SEQ (LETT |p| NIL . #7#) (LETT #1# |r| . #7#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #7#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |xx| |p| (QREFELT $ 25)) #2#)
                         . #7#)))
                 (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |LISTPKG;shiftLeft;2L;5| ((|xx| |List| T$) ($ |List| T$))
        (SPROG ((#1=#:G763 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((NULL |xx|)
                   (PROGN
                    (LETT #1# |xx| |LISTPKG;shiftLeft;2L;5|)
                    (GO #2=#:G762)))
                  ('T
                   (SPADCALL (CDR |xx|) (|SPADfirst| |xx|) (QREFELT $ 27)))))
                #2# (EXIT #1#)))) 

(SDEFUN |LISTPKG;minShift;2L;6| ((|xx| . #1=(|List| T$)) ($ |List| T$))
        (SPROG
         ((|res| #1#) (|xx1| #1#) (#2=#:G771 NIL) (|k| NIL) (#3=#:G770 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR (NULL |xx|) (NULL (CDR |xx|)))
             (PROGN
              (LETT #3# |xx| . #4=(|LISTPKG;minShift;2L;6|))
              (GO #5=#:G769)))
            ('T
             (SEQ (LETT |res| |xx| . #4#) (LETT |xx1| |xx| . #4#)
                  (SEQ (LETT |k| 2 . #4#) (LETT #2# (LENGTH |xx|) . #4#) G190
                       (COND ((|greater_SI| |k| #2#) (GO G191)))
                       (SEQ (LETT |xx1| (SPADCALL |xx1| (QREFELT $ 28)) . #4#)
                            (EXIT
                             (COND
                              ((SPADCALL |xx1| |res| (QREFELT $ 29))
                               (LETT |res| |xx1| . #4#)))))
                       (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |res|)))))
          #5# (EXIT #3#)))) 

(SDEFUN |LISTPKG;cartesian;2L;7|
        ((SS |List| (|List| T$)) ($ |List| (|List| T$)))
        (SPROG
         ((|res| (|List| (|List| T$))) (#1=#:G782 NIL) (|s| NIL)
          (#2=#:G781 NIL) (|x| NIL) (#3=#:G778 NIL) (#4=#:G780 NIL)
          (#5=#:G779 NIL))
         (SEQ
          (EXIT
           (COND
            ((EQL (LENGTH SS) 1)
             (PROGN
              (LETT #3#
                    (PROGN
                     (LETT #5# NIL . #6=(|LISTPKG;cartesian;2L;7|))
                     (SEQ (LETT |s| NIL . #6#)
                          (LETT #4# (|SPADfirst| SS) . #6#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |s| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #5# (CONS (LIST |s|) #5#) . #6#)))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #6#)
              (GO #7=#:G777)))
            ('T
             (SEQ (LETT |res| NIL . #6#)
                  (SEQ (LETT |x| NIL . #6#)
                       (LETT #2# (SPADCALL (CDR SS) (QREFELT $ 32)) . #6#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |s| NIL . #6#)
                              (LETT #1# (|SPADfirst| SS) . #6#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |s| (CAR #1#) . #6#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |res| (CONS (CONS |s| |x|) |res|)
                                      . #6#)))
                              (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))))
          #7# (EXIT #3#)))) 

(SDEFUN |LISTPKG;cartesianPower;LNniL;8|
        ((S |List| T$) (|n| |NonNegativeInteger|) ($ |List| (|List| T$)))
        (SPROG
         ((|res| (|List| (|List| T$))) (#1=#:G795 NIL) (|s| NIL)
          (#2=#:G794 NIL) (|x| NIL) (#3=#:G791 NIL) (#4=#:G793 NIL)
          (#5=#:G792 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR (NULL S) (ZEROP |n|))
             (PROGN
              (LETT #3# NIL . #6=(|LISTPKG;cartesianPower;LNniL;8|))
              (GO #7=#:G790)))
            ('T
             (COND
              ((EQL |n| 1)
               (PROGN
                (LETT #3#
                      (PROGN
                       (LETT #5# NIL . #6#)
                       (SEQ (LETT |s| NIL . #6#) (LETT #4# S . #6#) G190
                            (COND
                             ((OR (ATOM #4#)
                                  (PROGN (LETT |s| (CAR #4#) . #6#) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT #5# (CONS (LIST |s|) #5#) . #6#)))
                            (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                            (EXIT (NREVERSE #5#))))
                      . #6#)
                (GO #7#)))
              ('T
               (SEQ (LETT |res| NIL . #6#)
                    (SEQ (LETT |x| NIL . #6#)
                         (LETT #2# (SPADCALL S (- |n| 1) (QREFELT $ 34)) . #6#)
                         G190
                         (COND
                          ((OR (ATOM #2#)
                               (PROGN (LETT |x| (CAR #2#) . #6#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |s| NIL . #6#) (LETT #1# S . #6#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |s| (CAR #1#) . #6#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |res| (CONS (CONS |s| |x|) |res|)
                                        . #6#)))
                                (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))))))
          #7# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |ListPackage;|)) 

(DEFUN |ListPackage| (#1=#:G796)
  (SPROG NIL
         (PROG (#2=#:G797)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ListPackage|)
                                               '|domainEqualList|)
                    . #3=(|ListPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|ListPackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|ListPackage|)))))))))) 

(DEFUN |ListPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ListPackage|))
          (LETT |dv$| (LIST '|ListPackage| DV$1) . #1#)
          (LETT $ (GETREFV 35) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|OrderedSet|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|ListPackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 30
                      (CONS (|dispatchFunction| |LISTPKG;minShift;2L;6|) $))))
          $))) 

(MAKEPROP '|ListPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|Record| (|:| |yes| 9) (|:| |no| 9)) (|Mapping| 21 6) (|List| 6)
              |LISTPKG;splitList;MLR;1| (|List| $) (0 . |concat|)
              (|Mapping| 21 6 6) |LISTPKG;topologicalSort!;M2L;2| (5 . |copy|)
              |LISTPKG;topologicalSort;M2L;3| (|List| 21) (|Integer|)
              (|List| 17) (10 . |elt|) (|Boolean|) (16 . |elt|) (|List| 33)
              (22 . |concat|) (27 . |elt|) |LISTPKG;topologicalSort;L2L;4|
              (33 . |concat|) |LISTPKG;shiftLeft;2L;5| (39 . <)
              (45 . |minShift|) (|List| 9) |LISTPKG;cartesian;2L;7|
              (|NonNegativeInteger|) |LISTPKG;cartesianPower;LNniL;8|)
           '#(|topologicalSort!| 50 |topologicalSort| 56 |splitList| 68
              |shiftLeft| 74 |minShift| 79 |cartesianPower| 84 |cartesian| 90)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 34
                                                 '(1 9 0 11 12 1 9 0 0 15 2 19
                                                   17 0 18 20 2 17 21 0 18 22 1
                                                   23 0 11 24 2 9 6 0 18 25 2 9
                                                   0 0 6 27 2 9 21 0 0 29 1 0 9
                                                   9 30 2 0 9 13 9 14 2 0 9 19
                                                   9 26 2 0 9 13 9 16 2 0 7 8 9
                                                   10 1 0 9 9 28 1 1 9 9 30 2 0
                                                   31 9 33 34 1 0 31 31 32)))))
           '|lookupComplete|)) 
