
(SDEFUN |UTSSOL;seriesSolve;MLUTSF;1|
        ((|f| |Mapping| UTSSMPF UTSSMPF) (|l| |List| F) ($ UTSF))
        (SPROG
         ((|next| (|Mapping| F))
          (|st|
           (|List|
            #1=(|Stream| (|SparseMultivariatePolynomialExpressions| F))))
          (|coeffs| #1#)
          (|l2| (|Stream| (|SparseMultivariatePolynomialExpressions| F)))
          (|s1| (|Stream| (|Integer|)))
          (|l1| (|Stream| (|SparseMultivariatePolynomialExpressions| F)))
          (#2=#:G860 NIL) (|e| NIL) (#3=#:G859 NIL))
         (SEQ
          (LETT |l1|
                (SPADCALL
                 (PROGN
                  (LETT #3# NIL . #4=(|UTSSOL;seriesSolve;MLUTSF;1|))
                  (SEQ (LETT |e| NIL . #4#) (LETT #2# |l| . #4#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #3# (CONS (SPADCALL |e| (QREFELT $ 10)) #3#)
                               . #4#)))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #3#))))
                 (QREFELT $ 13))
                . #4#)
          (LETT |s1| (SPADCALL (ELT $ 15) 0 (QREFELT $ 18)) . #4#)
          (LETT |l2|
                (SPADCALL (CONS #'|UTSSOL;seriesSolve;MLUTSF;1!0| $) |s1|
                          (QREFELT $ 28))
                . #4#)
          (LETT |coeffs| (SPADCALL |l1| |l2| (QREFELT $ 29)) . #4#)
          (LETT |st| (LIST |coeffs| |coeffs|) . #4#)
          (LETT |next|
                (CONS #'|UTSSOL;seriesSolve;MLUTSF;1!1| (VECTOR |f| $ |st|))
                . #4#)
          (EXIT (SPADCALL (SPADCALL |next| (QREFELT $ 75)) (QREFELT $ 76)))))) 

(SDEFUN |UTSSOL;seriesSolve;MLUTSF;1!1| (($$ NIL))
        (PROG (|st| $ |f|)
          (LETT |st| (QREFELT $$ 2) . #1=(|UTSSOL;seriesSolve;MLUTSF;1|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|nr| NIL) (|coeff| NIL) (|eq| NIL) (|eqs| NIL) (|vars| NIL)
              (#2=#:G853 NIL) (|var| NIL) (#3=#:G854 NIL) (|i| NIL)
              (|res| NIL))
             (SEQ
              (LETT |nr| (SPADCALL |st| (|spadConstant| $ 59) (QREFELT $ 31))
                    NIL)
              (COND
               ((SPADCALL (LETT |coeff| (SPADCALL |nr| (QREFELT $ 32)) NIL)
                          (QREFELT $ 34))
                (SEQ (LETT |res| (SPADCALL |coeff| (QREFELT $ 35)) NIL)
                     (EXIT
                      (SPADCALL |st| (|spadConstant| $ 59)
                                (SPADCALL |nr| (QREFELT $ 36))
                                (QREFELT $ 37)))))
               ('T
                (SEQ
                 (LETT |eqs|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |st| 2 (QREFELT $ 31))
                                   (QREFELT $ 38))
                         |f|)
                        (QREFELT $ 39))
                       NIL)
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL
                          (LETT |eq| (SPADCALL |eqs| (QREFELT $ 32)) NIL)
                          (QREFELT $ 40)))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT |eqs| (SPADCALL |eqs| (QREFELT $ 36)) NIL)))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |vars| (SPADCALL |eq| (QREFELT $ 42)) NIL)
                 (COND
                  ((NULL
                    (SPADCALL (SPADCALL |coeff| (QREFELT $ 43)) |vars|
                              (QREFELT $ 44)))
                   (SEQ
                    (SPADCALL "The variable is:"
                              (SPADCALL |coeff| (QREFELT $ 46)) (QREFELT $ 50))
                    (SPADCALL "The next equations are:"
                              (SPADCALL (SPADCALL |st| 2 (QREFELT $ 31))
                                        (QREFELT $ 51))
                              (QREFELT $ 50))
                    (EXIT
                     (COND
                      ((SPADCALL |vars| (QREFELT $ 52))
                       (|error|
                        (SPADCALL "seriesSolve: there is no solution with"
                                  " the given initial values" (QREFELT $ 53))))
                      ('T
                       (|error|
                        (SPADCALL "seriesSolve: coefficient does not appear"
                                  " in equation" (QREFELT $ 53)))))))))
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL |vars| (QREFELT $ 54)) (QREFELT $ 55))
                    (COND
                     ((SPADCALL
                       (SPADCALL |eq| (SPADCALL |vars| (QREFELT $ 56))
                                 (QREFELT $ 57))
                       (|spadConstant| $ 59) (QREFELT $ 60))
                      (COND
                       ((SPADCALL |eq| (QREFELT $ 61))
                        (SEQ
                         (SEQ (LETT |var| NIL NIL) (LETT #2# |vars| NIL) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |var| (CAR #2#) NIL) NIL))
                                (GO G191)))
                              (SEQ (LETT |i| (|spadConstant| $ 59) NIL)
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |nr| |i|
                                                        (QREFELT $ 62))
                                              (QREFELT $ 34))
                                             'T)
                                            ('T
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |nr| |i|
                                                         (QREFELT $ 62))
                                               (QREFELT $ 43))
                                              |var| (QREFELT $ 63)))))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |i|
                                                (SPADCALL |i|
                                                          (|spadConstant| $ 59)
                                                          (QREFELT $ 64))
                                                NIL)))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (SPADCALL |nr| |i| (|spadConstant| $ 67)
                                              (QREFELT $ 68))))
                              (LETT #2# (CDR #2#) NIL) (GO G190) G191
                              (EXIT NIL))
                         (SPADCALL |st| (|spadConstant| $ 59)
                                   (SPADCALL |nr| (QREFELT $ 36))
                                   (QREFELT $ 37))
                         (EXIT (LETT |res| (|spadConstant| $ 65) NIL))))
                       ('T
                        (SEQ
                         (SPADCALL #4="The variable is:"
                                   (SPADCALL |coeff| (QREFELT $ 46))
                                   (QREFELT $ 50))
                         (SPADCALL #5="The equation is:"
                                   (SPADCALL |eq| (QREFELT $ 46))
                                   (QREFELT $ 50))
                         (EXIT
                          (|error|
                           (SPADCALL #6="seriesSolve: coefficient not uniquely"
                                     #7=" determined" (QREFELT $ 53))))))))
                     ('T
                      (SEQ
                       (LETT |res|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL |eq|
                                         (SPADCALL (|spadConstant| $ 69)
                                                   (SPADCALL |vars|
                                                             (QREFELT $ 56))
                                                   (QREFELT $ 24))
                                         (QREFELT $ 70))
                               (SPADCALL |eq|
                                         (SPADCALL (|spadConstant| $ 22)
                                                   (SPADCALL |vars|
                                                             (QREFELT $ 56))
                                                   (QREFELT $ 24))
                                         (QREFELT $ 70))
                               (QREFELT $ 71))
                              (QREFELT $ 72))
                             NIL)
                       (SPADCALL |nr| (|spadConstant| $ 59)
                                 (SPADCALL |res| (QREFELT $ 10))
                                 (QREFELT $ 68))
                       (EXIT
                        (SPADCALL |st| (|spadConstant| $ 59)
                                  (SPADCALL |nr| (QREFELT $ 36))
                                  (QREFELT $ 37)))))))
                   ((SPADCALL |eq| (QREFELT $ 61))
                    (SEQ
                     (SEQ (LETT |var| NIL NIL) (LETT #3# |vars| NIL) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |var| (CAR #3#) NIL) NIL))
                            (GO G191)))
                          (SEQ (LETT |i| (|spadConstant| $ 59) NIL)
                               (SEQ G190
                                    (COND
                                     ((NULL
                                       (COND
                                        ((SPADCALL
                                          (SPADCALL |nr| |i| (QREFELT $ 62))
                                          (QREFELT $ 34))
                                         'T)
                                        ('T
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |nr| |i| (QREFELT $ 62))
                                           (QREFELT $ 43))
                                          |var| (QREFELT $ 63)))))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |i|
                                            (SPADCALL |i| (|spadConstant| $ 59)
                                                      (QREFELT $ 64))
                                            NIL)))
                                    NIL (GO G190) G191 (EXIT NIL))
                               (EXIT
                                (SPADCALL |nr| |i| (|spadConstant| $ 67)
                                          (QREFELT $ 68))))
                          (LETT #3# (CDR #3#) NIL) (GO G190) G191 (EXIT NIL))
                     (SPADCALL |st| (|spadConstant| $ 59)
                               (SPADCALL |nr| (QREFELT $ 36)) (QREFELT $ 37))
                     (EXIT (LETT |res| (|spadConstant| $ 65) NIL))))
                   ('T
                    (SEQ
                     (SPADCALL #4# (SPADCALL |coeff| (QREFELT $ 46))
                               (QREFELT $ 50))
                     (SPADCALL #5# (SPADCALL |eq| (QREFELT $ 46))
                               (QREFELT $ 50))
                     (EXIT (|error| (SPADCALL #6# #7# (QREFELT $ 53)))))))))))
              (EXIT |res|))))))) 

(SDEFUN |UTSSOL;seriesSolve;MLUTSF;1!0| ((|i| NIL) ($ NIL))
        (SPROG ((#1=#:G710 NIL))
               (SPADCALL (|spadConstant| $ 19)
                         (SPADCALL (|spadConstant| $ 22)
                                   (PROG1 (LETT #1# |i| NIL)
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   (QREFELT $ 24))
                         (QREFELT $ 25)))) 

(DECLAIM (NOTINLINE |TaylorSolve;|)) 

(DEFUN |TaylorSolve| (&REST #1=#:G861)
  (SPROG NIL
         (PROG (#2=#:G862)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TaylorSolve|)
                                               '|domainEqualList|)
                    . #3=(|TaylorSolve|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |TaylorSolve;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|TaylorSolve|)))))))))) 

(DEFUN |TaylorSolve;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TaylorSolve|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|TaylorSolve| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 80) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TaylorSolve| (LIST DV$1 DV$2 DV$3)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|TaylorSolve| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|SparseMultivariatePolynomialExpressions| 6)
              (0 . |coerce|) (|List| 9) (|Stream| 9) (5 . |coerce|) (|Integer|)
              (10 . |inc|) (|Mapping| 14 14) (|Stream| 14) (15 . |stream|)
              (21 . |One|) (25 . |One|) (|NonNegativeInteger|) (29 . |One|)
              (|IndexedExponents| 21) (33 . |monomial|) (39 . |monomial|)
              (|Mapping| 9 14) (|StreamFunctions2| 14 9) (45 . |map|)
              (51 . |concat|) (|List| 12) (57 . |elt|) (63 . |first|)
              (|Boolean|) (68 . |ground?|) (73 . |ground|) (78 . |rest|)
              (83 . |setelt!|) (90 . |series|) (95 . |coefficients|)
              (100 . |zero?|) (|List| 21) (105 . |variables|) (110 . |retract|)
              (115 . |member?|) (|OutputForm|) (121 . |coerce|) (|Void|)
              (|String|) (|OutputPackage|) (126 . |output|) (132 . |coerce|)
              (137 . |empty?|) (142 . |elt|) (148 . |#|) (153 . |one?|)
              (158 . |first|) (163 . |degree|) (|PositiveInteger|)
              (169 . |One|) (173 . >) (179 . |monomial?|) (184 . |elt|)
              (190 . ~=) (196 . +) (202 . |Zero|) (206 . |Zero|) (210 . |Zero|)
              (214 . |setelt!|) (221 . |Zero|) (225 . |coefficient|) (231 . /)
              (237 . -) (|Mapping| 6) (|Stream| 6) (242 . |stream|)
              (247 . |series|) (|Mapping| 8 8) (|List| 6)
              |UTSSOL;seriesSolve;MLUTSF;1|)
           '#(|seriesSolve| 252) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 79
                                                 '(1 9 0 6 10 1 12 0 11 13 1 14
                                                   0 0 15 2 17 0 16 14 18 0 6 0
                                                   19 0 7 0 20 0 21 0 22 2 23 0
                                                   21 21 24 2 9 0 6 23 25 2 27
                                                   12 26 17 28 2 12 0 0 0 29 2
                                                   30 12 0 14 31 1 12 9 0 32 1
                                                   9 33 0 34 1 9 6 0 35 1 12 0
                                                   0 36 3 30 12 0 14 12 37 1 8
                                                   0 12 38 1 8 12 0 39 1 9 33 0
                                                   40 1 9 41 0 42 1 9 21 0 43 2
                                                   41 33 21 0 44 1 9 45 0 46 2
                                                   49 47 48 45 50 1 12 45 0 51
                                                   1 41 33 0 52 2 48 0 0 0 53 1
                                                   41 21 0 54 1 21 33 0 55 1 41
                                                   21 0 56 2 9 21 0 21 57 0 58
                                                   0 59 2 21 33 0 0 60 1 9 33 0
                                                   61 2 12 9 0 14 62 2 21 33 0
                                                   0 63 2 14 0 0 0 64 0 6 0 65
                                                   0 7 0 66 0 9 0 67 3 12 9 0
                                                   14 9 68 0 21 0 69 2 9 6 0 23
                                                   70 2 6 0 0 0 71 1 6 0 0 72 1
                                                   74 0 73 75 1 7 0 74 76 2 0 7
                                                   77 78 79)))))
           '|lookupComplete|)) 
