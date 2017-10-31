
(PUT '|FMOEBF;rep| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |FMOEBF;rep| ((|x| $) ($ |Rep|)) |x|) 

(PUT '|FMOEBF;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(SDEFUN |FMOEBF;per| ((|r| |Rep|) ($ $)) |r|) 

(SDEFUN |FMOEBF;members;$L;3| ((|mf| $) ($ |List| P))
        (QCDR (|FMOEBF;rep| |mf| $))) 

(SDEFUN |FMOEBF;moebiusFunction;L$;4| ((|xx| |List| P) ($ $))
        (SPROG
         ((|mf| (|Matrix| (|Integer|))) (|zf| (|Matrix| (|Integer|)))
          (#1=#:G720 NIL) (|y| NIL) (#2=#:G719 NIL) (#3=#:G718 NIL) (|x| NIL)
          (#4=#:G717 NIL) (|xxo| (|List| P)))
         (SEQ
          (LETT |xxo|
                (SPADCALL (SPADCALL (ELT $ 11) |xx| (QREFELT $ 14))
                          (QREFELT $ 15))
                . #5=(|FMOEBF;moebiusFunction;L$;4|))
          (LETT |zf|
                (SPADCALL
                 (PROGN
                  (LETT #4# NIL . #5#)
                  (SEQ (LETT |x| NIL . #5#) (LETT #3# |xxo| . #5#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4#
                               (CONS
                                (PROGN
                                 (LETT #2# NIL . #5#)
                                 (SEQ (LETT |y| NIL . #5#)
                                      (LETT #1# |xxo| . #5#) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |y| (CAR #1#) . #5#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (COND
                                                ((SPADCALL |x| |y|
                                                           (QREFELT $ 11))
                                                 1)
                                                ('T 0))
                                               #2#)
                                              . #5#)))
                                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                #4#)
                               . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 (QREFELT $ 18))
                . #5#)
          (LETT |mf| (SPADCALL |zf| 1 (QREFELT $ 21)) . #5#)
          (EXIT (|FMOEBF;per| (CONS |mf| |xxo|) $))))) 

(SDEFUN |FMOEBF;canonicalZeta| ((|pi| P) (|si| P) ($ |Integer|))
        (SPROG ((#1=#:G723 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |pi| |si| (QREFELT $ 11))
                    (PROGN
                     (LETT #1# 1 |FMOEBF;canonicalZeta|)
                     (GO #2=#:G722))))
                  (EXIT 0)))
                #2# (EXIT #1#)))) 

(SDEFUN |FMOEBF;moebiusMu;$2PI;6| ((|mf| $) (|x| P) (|y| P) ($ |Integer|))
        (SPROG
         ((#1=#:G729 NIL) (|ky| #2=(|Integer|)) (|kx| #2#)
          (|mfn| (|Matrix| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mfn| (QCAR (|FMOEBF;rep| |mf| $))
                  . #3=(|FMOEBF;moebiusMu;$2PI;6|))
            (LETT |kx|
                  (SPADCALL |x| (SPADCALL |mf| (QREFELT $ 9)) (QREFELT $ 23))
                  . #3#)
            (LETT |ky|
                  (SPADCALL |y| (SPADCALL |mf| (QREFELT $ 9)) (QREFELT $ 23))
                  . #3#)
            (COND
             ((OR (ZEROP |kx|) (ZEROP |ky|)) (EXIT (|error| "not members"))))
            (EXIT
             (PROGN
              (LETT #1# (SPADCALL |mfn| |kx| |ky| (QREFELT $ 24)) . #3#)
              (GO #4=#:G728)))))
          #4# (EXIT #1#)))) 

(SDEFUN |FMOEBF;apply;$2PI;7| ((|mf| $) (|x| P) (|y| P) ($ |Integer|))
        (SPROG
         ((#1=#:G735 NIL) (|ky| #2=(|Integer|)) (|kx| #2#)
          (|mfn| (|Matrix| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mfn| (QCAR (|FMOEBF;rep| |mf| $))
                  . #3=(|FMOEBF;apply;$2PI;7|))
            (LETT |kx|
                  (SPADCALL |x| (SPADCALL |mf| (QREFELT $ 9)) (QREFELT $ 23))
                  . #3#)
            (LETT |ky|
                  (SPADCALL |y| (SPADCALL |mf| (QREFELT $ 9)) (QREFELT $ 23))
                  . #3#)
            (COND
             ((OR (ZEROP |kx|) (ZEROP |ky|)) (EXIT (|error| "not members"))))
            (EXIT
             (PROGN
              (LETT #1# (SPADCALL |mfn| |kx| |ky| (QREFELT $ 24)) . #3#)
              (GO #4=#:G734)))))
          #4# (EXIT #1#)))) 

(SDEFUN |FMOEBF;moebiusMatrix;$M;8| ((|mf| $) ($ |Matrix| (|Integer|)))
        (QCAR (|FMOEBF;rep| |mf| $))) 

(SDEFUN |FMOEBF;coerce;$Of;9| ((|mf| $) ($ |OutputForm|))
        (SPADCALL "Moebius Function"
                  (SPADCALL (SPADCALL |mf| (QREFELT $ 9)) (QREFELT $ 29))
                  (QREFELT $ 30))) 

(DECLAIM (NOTINLINE |FiniteMoebiusFunction;|)) 

(DEFUN |FiniteMoebiusFunction| (#1=#:G741)
  (SPROG NIL
         (PROG (#2=#:G742)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteMoebiusFunction|)
                                               '|domainEqualList|)
                    . #3=(|FiniteMoebiusFunction|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FiniteMoebiusFunction;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FiniteMoebiusFunction|)))))))))) 

(DEFUN |FiniteMoebiusFunction;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteMoebiusFunction|))
          (LETT |dv$| (LIST '|FiniteMoebiusFunction| DV$1) . #1#)
          (LETT $ (GETREFV 35) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FiniteMoebiusFunction| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |matrix| (|Matrix| (|Integer|)))
                              (|:| |indices| (|List| |#1|))))
          $))) 

(MAKEPROP '|FiniteMoebiusFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              |FMOEBF;members;$L;3| (|Boolean|) (0 . <=) (|Mapping| 10 6 6)
              (|ListPackage| 6) (6 . |topologicalSort|)
              (12 . |removeDuplicates|) (|List| (|List| 19)) (|Matrix| 19)
              (17 . |matrix|) (|Integer|)
              (|TriangularMatrixOperations| 19 (|Vector| 19) (|Vector| 19) 17)
              (22 . |UpTriBddDenomInv|) |FMOEBF;moebiusFunction;L$;4|
              (28 . |position|) (34 . |elt|) |FMOEBF;moebiusMu;$2PI;6|
              |FMOEBF;apply;$2PI;7| |FMOEBF;moebiusMatrix;$M;8| (|OutputForm|)
              (41 . |coerce|) (46 . |hconcat|) |FMOEBF;coerce;$Of;9| (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 52 |moebiusMu| 58 |moebiusMatrix| 65 |moebiusFunction| 70
              |members| 75 |latex| 80 |hashUpdate!| 85 |hash| 91 |coerce| 96
              |apply| 101 = 108)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 28))
                        (|makeByteWordVec2| 34
                                            '(2 6 10 0 0 11 2 13 8 12 8 14 1 8
                                              0 0 15 1 17 0 16 18 2 20 17 17 19
                                              21 2 8 19 6 0 23 3 17 19 0 19 19
                                              24 1 8 28 0 29 2 28 0 0 0 30 2 0
                                              10 0 0 1 3 0 19 0 6 6 25 1 0 17 0
                                              27 1 0 0 8 22 1 0 8 0 9 1 0 32 0
                                              1 2 0 34 34 0 1 1 0 33 0 1 1 0 28
                                              0 31 3 0 19 0 6 6 26 2 0 10 0 0
                                              1)))))
           '|lookupComplete|)) 
