
(SDEFUN |INCALG;incidenceAlgebra;MOda$;1|
        ((|Ai| |Matrix| R) (|ssa| |OneDimensionalArray| S) ($ $))
        (SEQ
         (COND
          ((OR (SPADCALL (ANROWS |Ai|) (QVSIZE |ssa|) (QREFELT $ 11))
               (SPADCALL (ANCOLS |Ai|) (QVSIZE |ssa|) (QREFELT $ 11)))
           (|error| "Sizes not compatible")))
         (EXIT (CONS |Ai| |ssa|)))) 

(SDEFUN |INCALG;incidenceAlgebra;ML$;2|
        ((|Ai| |Matrix| R) (|ss| |List| S) ($ $))
        (SPADCALL |Ai| (SPADCALL |ss| (QREFELT $ 16)) (QREFELT $ 14))) 

(PUT '|INCALG;indices;$Oda;3| '|SPADreplace| 'QCDR) 

(SDEFUN |INCALG;indices;$Oda;3| ((A $) ($ |OneDimensionalArray| S)) (QCDR A)) 

(PUT '|INCALG;matrix;$M;4| '|SPADreplace| 'QCAR) 

(SDEFUN |INCALG;matrix;$M;4| ((A $) ($ |Matrix| R)) (QCAR A)) 

(SDEFUN |INCALG;apply;$2IR;5| ((A $) (|i| |Integer|) (|j| |Integer|) ($ R))
        (SPADCALL (QCAR A) |i| |j| (QREFELT $ 20))) 

(SDEFUN |INCALG;apply;$2SR;6| ((A $) (|u| S) (|v| S) ($ R))
        (SPROG ((|j| #1=(|Integer|)) (|i| #1#))
               (SEQ
                (LETT |i|
                      (SPADCALL |u| (SPADCALL A (QREFELT $ 18)) (QREFELT $ 22))
                      . #2=(|INCALG;apply;$2SR;6|))
                (EXIT
                 (COND ((ZEROP |i|) (|error| "First index is not a vertex"))
                       (#3='T
                        (SEQ
                         (LETT |j|
                               (SPADCALL |v| (SPADCALL A (QREFELT $ 18))
                                         (QREFELT $ 22))
                               . #2#)
                         (EXIT
                          (COND
                           ((ZEROP |j|)
                            (|error| "Second index is not a vertex"))
                           (#3#
                            (SPADCALL (QCAR A) |i| |j| (QREFELT $ 20)))))))))))) 

(SDEFUN |INCALG;*;P2$;7| ((|p| |Permutation| (|Integer|)) (A $) ($ $))
        (SPROG
         ((|newA| (|Matrix| R)) (|indic| (|List| (|Integer|))) (#1=#:G731 NIL)
          (|i| NIL) (#2=#:G730 NIL) (|newindices| (|OneDimensionalArray| S))
          (#3=#:G729 NIL) (#4=#:G728 NIL) (|n| (|Integer|))
          (|mp| (|Set| (|Integer|))))
         (SEQ (LETT |mp| (SPADCALL |p| (QREFELT $ 26)) . #5=(|INCALG;*;P2$;7|))
              (LETT |n| (QVSIZE (SPADCALL A (QREFELT $ 18))) . #5#)
              (COND
               ((OR (< (SPADCALL |mp| (QREFELT $ 27)) 1)
                    (SPADCALL (SPADCALL |mp| (QREFELT $ 28)) |n|
                              (QREFELT $ 29)))
                (|error| "Permutation out of range")))
              (LETT |newindices|
                    (SPADCALL
                     (PROGN
                      (LETT #4# NIL . #5#)
                      (SEQ (LETT |i| 1 . #5#) (LETT #3# |n| . #5#) G190
                           (COND ((|greater_SI| |i| #3#) (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4#
                                   (CONS
                                    (SPADCALL (SPADCALL A (QREFELT $ 18))
                                              (SPADCALL |p| |i| (QREFELT $ 30))
                                              (QREFELT $ 31))
                                    #4#)
                                   . #5#)))
                           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     (QREFELT $ 16))
                    . #5#)
              (LETT |indic|
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |i| 1 . #5#) (LETT #1# |n| . #5#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (SPADCALL |p| |i| (QREFELT $ 30)) #2#)
                                  . #5#)))
                          (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #5#)
              (LETT |newA|
                    (SPADCALL (SPADCALL A (QREFELT $ 19)) |indic| |indic|
                              (QREFELT $ 33))
                    . #5#)
              (EXIT (CONS |newA| |newindices|))))) 

(SDEFUN |INCALG;coerce;$Of;8| ((A $) ($ |OutputForm|))
        (SPADCALL
         (SPADCALL
          (LIST (SPADCALL (SPADCALL A (QREFELT $ 19)) (QREFELT $ 36))
                (SPADCALL (SPADCALL A (QREFELT $ 18)) (QREFELT $ 37)))
          (QREFELT $ 39))
         (QREFELT $ 40))) 

(SDEFUN |INCALG;=;2$B;9| ((A1 $) (A2 $) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL A1 (QREFELT $ 18)) (SPADCALL A2 (QREFELT $ 18))
                    (QREFELT $ 42))
          (SPADCALL (SPADCALL A1 (QREFELT $ 19)) (SPADCALL A2 (QREFELT $ 19))
                    (QREFELT $ 43)))
         ('T NIL))) 

(SDEFUN |INCALG;+;3$;10| ((A $) (B $) ($ $))
        (SPROG
         ((|Ci| (|Matrix| R)) (|Bind| #1=(|OneDimensionalArray| S))
          (|Aind| #1#))
         (SEQ (LETT |Aind| (SPADCALL A (QREFELT $ 18)) . #2=(|INCALG;+;3$;10|))
              (LETT |Bind| (SPADCALL B (QREFELT $ 18)) . #2#)
              (COND
               ((SPADCALL |Aind| |Bind| (QREFELT $ 45))
                (|error| "incompatible indices")))
              (LETT |Ci|
                    (SPADCALL (SPADCALL A (QREFELT $ 19))
                              (SPADCALL B (QREFELT $ 19)) (QREFELT $ 46))
                    . #2#)
              (EXIT (SPADCALL |Ci| |Aind| (QREFELT $ 14)))))) 

(SDEFUN |INCALG;*;3$;11| ((A $) (B $) ($ $))
        (SPROG
         ((|Ci| (|Matrix| R)) (|Bind| #1=(|OneDimensionalArray| S))
          (|Aind| #1#))
         (SEQ (LETT |Aind| (SPADCALL A (QREFELT $ 18)) . #2=(|INCALG;*;3$;11|))
              (LETT |Bind| (SPADCALL B (QREFELT $ 18)) . #2#)
              (COND
               ((SPADCALL |Aind| |Bind| (QREFELT $ 45))
                (|error| "incompatible indices")))
              (LETT |Ci|
                    (SPADCALL (SPADCALL A (QREFELT $ 19))
                              (SPADCALL B (QREFELT $ 19)) (QREFELT $ 48))
                    . #2#)
              (EXIT (SPADCALL |Ci| |Aind| (QREFELT $ 14)))))) 

(SDEFUN |INCALG;*;R2$;12| ((|r| R) (A $) ($ $))
        (SPROG ((|Ci| (|Matrix| R)) (|Aind| (|OneDimensionalArray| S)))
               (SEQ
                (LETT |Aind| (SPADCALL A (QREFELT $ 18))
                      . #1=(|INCALG;*;R2$;12|))
                (LETT |Ci|
                      (SPADCALL |r| (SPADCALL A (QREFELT $ 19)) (QREFELT $ 50))
                      . #1#)
                (EXIT (SPADCALL |Ci| |Aind| (QREFELT $ 14)))))) 

(SDEFUN |INCALG;*;$R$;13| ((A $) (|r| R) ($ $))
        (SPROG ((|Ci| (|Matrix| R)) (|Aind| (|OneDimensionalArray| S)))
               (SEQ
                (LETT |Aind| (SPADCALL A (QREFELT $ 18))
                      . #1=(|INCALG;*;$R$;13|))
                (LETT |Ci|
                      (SPADCALL (SPADCALL A (QREFELT $ 19)) |r| (QREFELT $ 52))
                      . #1#)
                (EXIT (SPADCALL |Ci| |Aind| (QREFELT $ 14)))))) 

(SDEFUN |INCALG;^;$Nni$;14| ((A $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|Ci| (|Matrix| R)) (|Aind| (|OneDimensionalArray| S)))
               (SEQ
                (LETT |Aind| (SPADCALL A (QREFELT $ 18))
                      . #1=(|INCALG;^;$Nni$;14|))
                (LETT |Ci|
                      (SPADCALL (SPADCALL A (QREFELT $ 19)) |n| (QREFELT $ 55))
                      . #1#)
                (EXIT (SPADCALL |Ci| |Aind| (QREFELT $ 14)))))) 

(DECLAIM (NOTINLINE |IncidenceAlgebra;|)) 

(DEFUN |IncidenceAlgebra| (&REST #1=#:G748)
  (SPROG NIL
         (PROG (#2=#:G749)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IncidenceAlgebra|)
                                               '|domainEqualList|)
                    . #3=(|IncidenceAlgebra|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IncidenceAlgebra;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|IncidenceAlgebra|)))))))))) 

(DEFUN |IncidenceAlgebra;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|IncidenceAlgebra|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|IncidenceAlgebra| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 60) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|IncidenceAlgebra| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|Record| (|:| |matrix| (|Matrix| |#1|))
                              (|:| |indices| (|OneDimensionalArray| |#2|))))
          $))) 

(MAKEPROP '|IncidenceAlgebra| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Boolean|) (|Integer|) (0 . ~=) (|Matrix| 6)
              (|OneDimensionalArray| 7) |INCALG;incidenceAlgebra;MOda$;1|
              (|List| 7) (6 . |oneDimensionalArray|)
              |INCALG;incidenceAlgebra;ML$;2| |INCALG;indices;$Oda;3|
              |INCALG;matrix;$M;4| (11 . |elt|) |INCALG;apply;$2IR;5|
              (18 . |position|) |INCALG;apply;$2SR;6| (|Set| 10)
              (|Permutation| 10) (24 . |movedPoints|) (29 . |min|) (34 . |max|)
              (39 . >) (45 . |eval|) (51 . |elt|) (|List| 10) (57 . |elt|)
              |INCALG;*;P2$;7| (|OutputForm|) (64 . |coerce|) (69 . |coerce|)
              (|List| $) (74 . |commaSeparate|) (79 . |bracket|)
              |INCALG;coerce;$Of;8| (84 . =) (90 . =) |INCALG;=;2$B;9|
              (96 . ~=) (102 . +) |INCALG;+;3$;10| (108 . *) |INCALG;*;3$;11|
              (114 . *) |INCALG;*;R2$;12| (120 . *) |INCALG;*;$R$;13|
              (|NonNegativeInteger|) (126 . ^) |INCALG;^;$Nni$;14| (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 132 |matrix| 138 |latex| 143 |indices| 148 |incidenceAlgebra|
              153 |hashUpdate!| 165 |hash| 171 |coerce| 176 |apply| 181 ^ 195 =
              201 + 207 * 213)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 35))
                        (|makeByteWordVec2| 59
                                            '(2 10 9 0 0 11 1 13 0 15 16 3 12 6
                                              0 10 10 20 2 13 10 7 0 22 1 25 24
                                              0 26 1 24 10 0 27 1 24 10 0 28 2
                                              10 9 0 0 29 2 25 10 0 10 30 2 13
                                              7 0 10 31 3 12 0 0 32 32 33 1 12
                                              35 0 36 1 13 35 0 37 1 35 0 38 39
                                              1 35 0 0 40 2 13 9 0 0 42 2 12 9
                                              0 0 43 2 13 9 0 0 45 2 12 0 0 0
                                              46 2 12 0 0 0 48 2 12 0 6 0 50 2
                                              12 0 0 6 52 2 12 0 0 54 55 2 0 9
                                              0 0 1 1 0 12 0 19 1 0 57 0 1 1 0
                                              13 0 18 2 0 0 12 13 14 2 0 0 12
                                              15 17 2 0 59 59 0 1 1 0 58 0 1 1
                                              0 35 0 41 3 0 6 0 7 7 23 3 0 6 0
                                              10 10 21 2 0 0 0 54 56 2 0 9 0 0
                                              44 2 0 0 0 0 47 2 0 0 0 6 53 2 0
                                              0 0 0 49 2 0 0 6 0 51 2 0 0 25 0
                                              34)))))
           '|lookupComplete|)) 
