
(SDEFUN |FAMR-;pomopo!;SRE2S;1| ((|p1| S) (|r| R) (|e| E) (|p2| S) ($ S))
        (SPROG NIL
               (SPADCALL |p1|
                         (SPADCALL |r|
                                   (SPADCALL
                                    (CONS #'|FAMR-;pomopo!;SRE2S;1!0|
                                          (VECTOR $ |e|))
                                    |p2| (QREFELT $ 11))
                                   (QREFELT $ 12))
                         (QREFELT $ 13)))) 

(SDEFUN |FAMR-;pomopo!;SRE2S;1!0| ((|x1| NIL) ($$ NIL))
        (PROG (|e| $)
          (LETT |e| (QREFELT $$ 1) . #1=(|FAMR-;pomopo!;SRE2S;1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |e| (QREFELT $ 9)))))) 

(SDEFUN |FAMR-;fmecg;SER2S;2| ((|p1| S) (|e| E) (|r| R) (|p2| S) ($ S))
        (SPROG NIL
               (SPADCALL |p1|
                         (SPADCALL |r|
                                   (SPADCALL
                                    (CONS #'|FAMR-;fmecg;SER2S;2!0|
                                          (VECTOR $ |e|))
                                    |p2| (QREFELT $ 11))
                                   (QREFELT $ 12))
                         (QREFELT $ 15)))) 

(SDEFUN |FAMR-;fmecg;SER2S;2!0| ((|x1| NIL) ($$ NIL))
        (PROG (|e| $)
          (LETT |e| (QREFELT $$ 1) . #1=(|FAMR-;fmecg;SER2S;2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |e| (QREFELT $ 9)))))) 

(SDEFUN |FAMR-;binomThmExpt;2SNniS;3|
        ((|x| S) (|y| S) (|nn| |NonNegativeInteger|) ($ S))
        (SPROG
         ((|yn| (S)) (|i| (|NonNegativeInteger|)) (|bincoef| (|Integer|))
          (|ans| (S)) (#1=#:G735 NIL) (|xn| NIL) (|powl| (|List| S))
          (#2=#:G734 NIL))
         (SEQ
          (COND ((EQL |nn| 0) (|spadConstant| $ 19))
                ('T
                 (SEQ
                  (LETT |powl| (LIST |x|) . #3=(|FAMR-;binomThmExpt;2SNniS;3|))
                  (SEQ (LETT |i| 2 . #3#) (LETT #2# |nn| . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |powl|
                               (CONS
                                (SPADCALL |x| (|SPADfirst| |powl|)
                                          (QREFELT $ 20))
                                |powl|)
                               . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (LETT |yn| |y| . #3#) (LETT |ans| (|SPADfirst| |powl|) . #3#)
                  (LETT |i| 1 . #3#) (LETT |bincoef| |nn| . #3#)
                  (SEQ (LETT |xn| NIL . #3#) (LETT #1# (CDR |powl|) . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |xn| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ans|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |bincoef| |xn| (QREFELT $ 22)) |yn|
                                (QREFELT $ 20))
                               |ans| (QREFELT $ 13))
                              . #3#)
                        (LETT |bincoef|
                              (QUOTIENT2 (* (- |nn| |i|) |bincoef|) (+ |i| 1))
                              . #3#)
                        (LETT |i| (+ |i| 1) . #3#)
                        (EXIT
                         (LETT |yn| (SPADCALL |y| |yn| (QREFELT $ 20)) . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL |ans| |yn| (QREFELT $ 13))))))))) 

(SDEFUN |FAMR-;ground?;SB;4| ((|x| S) ($ |Boolean|))
        (NULL (QEQCAR (SPADCALL |x| (QREFELT $ 26)) 1))) 

(SDEFUN |FAMR-;ground;SR;5| ((|x| S) ($ R)) (SPADCALL |x| (QREFELT $ 29))) 

(SDEFUN |FAMR-;mapExponents;M2S;6| ((|fn| |Mapping| E E) (|x| S) ($ S))
        (COND ((SPADCALL |x| (QREFELT $ 31)) (|spadConstant| $ 17))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                          (SPADCALL (SPADCALL |x| (QREFELT $ 33)) |fn|)
                          (QREFELT $ 34))
                (SPADCALL |fn| (SPADCALL |x| (QREFELT $ 35)) (QREFELT $ 11))
                (QREFELT $ 13))))) 

(SDEFUN |FAMR-;coefficients;SL;7| ((|x| S) ($ |List| R))
        (COND ((SPADCALL |x| (QREFELT $ 31)) NIL)
              ('T
               (CONS (SPADCALL |x| (QREFELT $ 32))
                     (SPADCALL (SPADCALL |x| (QREFELT $ 35)) (QREFELT $ 38)))))) 

(SDEFUN |FAMR-;/;SRS;8| ((|x| S) (|r| R) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|FAMR-;/;SRS;8!0| (VECTOR $ |r|)) |x|
                         (QREFELT $ 42)))) 

(SDEFUN |FAMR-;/;SRS;8!0| ((|x1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|FAMR-;/;SRS;8|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |r| (QREFELT $ 40)))))) 

(SDEFUN |FAMR-;exquo;SRU;9| ((|x| S) (|r| R) ($ |Union| S "failed"))
        (SPROG ((|ans| (S)) (#1=#:G763 NIL) (|t| (|Union| R "failed")))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |r| (QREFELT $ 44)) (|error| "Division by 0"))
                  ((SPADCALL |x| (QREFELT $ 31))
                   (CONS 0 (|spadConstant| $ 17)))
                  ('T
                   (SEQ
                    (LETT |ans| (|spadConstant| $ 17)
                          . #2=(|FAMR-;exquo;SRU;9|))
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |x| (QREFELT $ 31))))
                           (GO G191)))
                         (SEQ
                          (LETT |t|
                                (SPADCALL (SPADCALL |x| (QREFELT $ 32)) |r|
                                          (QREFELT $ 46))
                                . #2#)
                          (EXIT
                           (COND
                            ((QEQCAR |t| 1)
                             (PROGN
                              (LETT #1# (CONS 1 "failed") . #2#)
                              (GO #3=#:G762)))
                            ('T
                             (SEQ
                              (LETT |ans|
                                    (SPADCALL |ans|
                                              (SPADCALL (QCDR |t|)
                                                        (SPADCALL |x|
                                                                  (QREFELT $
                                                                           33))
                                                        (QREFELT $ 34))
                                              (QREFELT $ 13))
                                    . #2#)
                              (EXIT
                               (LETT |x| (SPADCALL |x| (QREFELT $ 35))
                                     . #2#)))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS 0 |ans|))))))
                #3# (EXIT #1#)))) 

(SDEFUN |FAMR-;content;SR;10| ((|x| S) ($ R))
        (SPROG ((|r| (R)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 31)) (|spadConstant| $ 18))
                      ('T
                       (SEQ
                        (LETT |r| (SPADCALL |x| (QREFELT $ 32))
                              . #1=(|FAMR-;content;SR;10|))
                        (LETT |x| (SPADCALL |x| (QREFELT $ 35)) . #1#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (NULL
                                 (OR (SPADCALL |x| (QREFELT $ 31))
                                     (SPADCALL |r| (|spadConstant| $ 48)
                                               (QREFELT $ 49)))))
                               (GO G191)))
                             (SEQ
                              (LETT |r|
                                    (SPADCALL |r| (SPADCALL |x| (QREFELT $ 32))
                                              (QREFELT $ 50))
                                    . #1#)
                              (EXIT
                               (LETT |x| (SPADCALL |x| (QREFELT $ 35)) . #1#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT |r|))))))) 

(SDEFUN |FAMR-;primitivePart;2S;11| ((|x| S) ($ S))
        (SPROG ((#1=#:G771 NIL) (|c| (R)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 31)) |x|)
                      ('T
                       (SEQ
                        (LETT |c| (SPADCALL |x| (QREFELT $ 52))
                              . #2=(|FAMR-;primitivePart;2S;11|))
                        (EXIT
                         (SPADCALL
                          (PROG2
                              (LETT #1# (SPADCALL |x| |c| (QREFELT $ 53))
                                    . #2#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                            (|Union| (QREFELT $ 6) "failed")
                                            #1#))
                          (QREFELT $ 54))))))))) 

(DECLAIM (NOTINLINE |FiniteAbelianMonoidRing&;|)) 

(DEFUN |FiniteAbelianMonoidRing&| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteAbelianMonoidRing&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|FiniteAbelianMonoidRing&| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 56) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|GcdDomain|))
                                              (|HasCategory| |#2|
                                                             '(|EntireRing|))
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#2| '(|Ring|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 4)
            (QSETREFV $ 16
                      (CONS (|dispatchFunction| |FAMR-;fmecg;SER2S;2|) $))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 24
                      (CONS (|dispatchFunction| |FAMR-;binomThmExpt;2SNniS;3|)
                            $))))
          (COND
           ((|HasCategory| |#2| '(|Field|))
            (QSETREFV $ 43 (CONS (|dispatchFunction| |FAMR-;/;SRS;8|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (QSETREFV $ 47 (CONS (|dispatchFunction| |FAMR-;exquo;SRU;9|) $))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 51
                       (CONS (|dispatchFunction| |FAMR-;content;SR;10|) $))
             (QSETREFV $ 55
                       (CONS (|dispatchFunction| |FAMR-;primitivePart;2S;11|)
                             $)))))
          $))) 

(MAKEPROP '|FiniteAbelianMonoidRing&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . +) (|Mapping| 8 8) (6 . |mapExponents|)
              (12 . *) (18 . +) |FAMR-;pomopo!;SRE2S;1| (24 . -) (30 . |fmecg|)
              (38 . |Zero|) (42 . |Zero|) (46 . |One|) (50 . *) (|Integer|)
              (56 . *) (|NonNegativeInteger|) (62 . |binomThmExpt|)
              (|Union| 7 '"failed") (69 . |retractIfCan|) (|Boolean|)
              |FAMR-;ground?;SB;4| (74 . |retract|) |FAMR-;ground;SR;5|
              (79 . |zero?|) (84 . |leadingCoefficient|) (89 . |degree|)
              (94 . |monomial|) (100 . |reductum|) |FAMR-;mapExponents;M2S;6|
              (|List| 7) (105 . |coefficients|) |FAMR-;coefficients;SL;7|
              (110 . /) (|Mapping| 7 7) (116 . |map|) (122 . /) (128 . |zero?|)
              (|Union| $ '"failed") (133 . |exquo|) (139 . |exquo|)
              (145 . |One|) (149 . =) (155 . |gcd|) (161 . |content|)
              (166 . |content|) (171 . |exquo|) (177 . |unitCanonical|)
              (182 . |primitivePart|))
           '#(|primitivePart| 187 |pomopo!| 192 |mapExponents| 200 |ground?|
              206 |ground| 211 |fmecg| 216 |exquo| 224 |content| 230
              |coefficients| 235 |binomThmExpt| 240 / 247)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 55
                                                 '(2 8 0 0 0 9 2 6 0 10 0 11 2
                                                   6 0 7 0 12 2 6 0 0 0 13 2 6
                                                   0 0 0 15 4 0 0 0 8 7 0 16 0
                                                   6 0 17 0 7 0 18 0 6 0 19 2 6
                                                   0 0 0 20 2 6 0 21 0 22 3 0 0
                                                   0 0 23 24 1 6 25 0 26 1 6 7
                                                   0 29 1 6 27 0 31 1 6 7 0 32
                                                   1 6 8 0 33 2 6 0 7 8 34 1 6
                                                   0 0 35 1 6 37 0 38 2 7 0 0 0
                                                   40 2 6 0 41 0 42 2 0 0 0 7
                                                   43 1 7 27 0 44 2 7 45 0 0 46
                                                   2 0 45 0 7 47 0 7 0 48 2 7
                                                   27 0 0 49 2 7 0 0 0 50 1 0 7
                                                   0 51 1 6 7 0 52 2 6 45 0 7
                                                   53 1 6 0 0 54 1 0 0 0 55 1 0
                                                   0 0 55 4 0 0 0 7 8 0 14 2 0
                                                   0 10 0 36 1 0 27 0 28 1 0 7
                                                   0 30 4 0 0 0 8 7 0 16 2 0 45
                                                   0 7 47 1 0 7 0 51 1 0 37 0
                                                   39 3 0 0 0 0 23 24 2 0 0 0 7
                                                   43)))))
           '|lookupComplete|)) 
