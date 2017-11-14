
(PUT '|SCELL;samplePoint;$TheField;1| '|SPADreplace|
     '(XLAM (|c|) (QVELT |c| 0))) 

(SDEFUN |SCELL;samplePoint;$TheField;1| ((|c| $) ($ |TheField|)) (QVELT |c| 0)) 

(PUT '|SCELL;hasDimension?;$B;2| '|SPADreplace| '(XLAM (|c|) (QVELT |c| 1))) 

(SDEFUN |SCELL;hasDimension?;$B;2| ((|c| $) ($ |Boolean|)) (QVELT |c| 1)) 

(PUT '|SCELL;variableOf;$S;3| '|SPADreplace| '(XLAM (|c|) (QVELT |c| 2))) 

(SDEFUN |SCELL;variableOf;$S;3| ((|c| $) ($ |Symbol|)) (QVELT |c| 2)) 

(SDEFUN |SCELL;coerce;$Of;4| ((|c| $) ($ |OutputForm|))
        (SPROG ((|o| (|OutputForm|)))
               (SEQ
                (LETT |o|
                      (SPADCALL (SPADCALL (QVELT |c| 2) (QREFELT $ 15))
                                (SPADCALL (QVELT |c| 0) (QREFELT $ 16))
                                (QREFELT $ 17))
                      |SCELL;coerce;$Of;4|)
                (EXIT
                 (SPADCALL (LIST |o| (SPADCALL (QVELT |c| 1) (QREFELT $ 18)))
                           (QREFELT $ 20)))))) 

(SDEFUN |SCELL;separate|
        ((|liste| |List| |TheField|) (|left| |TheField|) (|right| |TheField|)
         ($ |List| |TheField|))
        (SPROG
         ((|new_left| (|TheField|)) (|new_right| (|TheField|))
          (|lr| (|List| |TheField|)) (|sg| (|Integer|)) (|nbe| (|TheField|))
          (#1=#:G737 NIL) (|ll| (|List| |TheField|)) (|middle| (|TheField|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |middle|
                  (SPADCALL (SPADCALL |left| |right| (QREFELT $ 22))
                            (SPADCALL 2 (QREFELT $ 24)) (QREFELT $ 25))
                  . #2=(|SCELL;separate|))
            (EXIT
             (COND ((SPADCALL |liste| NIL (QREFELT $ 27)) (LIST |middle|))
                   ((EQL (LENGTH |liste|) 1)
                    (LIST |left| (|SPADfirst| |liste|) |right|))
                   (#3='T
                    (SEQ (LETT |nbe| (|SPADfirst| |liste|) . #2#)
                         (LETT |ll| NIL . #2#) (LETT |lr| (CDR |liste|) . #2#)
                         (LETT |sg|
                               (SPADCALL
                                (SPADCALL |middle| |nbe| (QREFELT $ 28))
                                (QREFELT $ 29))
                               . #2#)
                         (SEQ G190
                              (COND
                               ((NULL (SPADCALL |sg| 0 (QREFELT $ 32)))
                                (GO G191)))
                              (SEQ (LETT |ll| (CONS |nbe| |ll|) . #2#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |lr| NIL (QREFELT $ 27))
                                      (PROGN
                                       (LETT #1#
                                             (|SCELL;separate| (REVERSE |ll|)
                                              |left| |middle| $)
                                             . #2#)
                                       (GO #4=#:G736)))
                                     ('T
                                      (SEQ
                                       (LETT |nbe| (|SPADfirst| |lr|) . #2#)
                                       (LETT |sg|
                                             (SPADCALL
                                              (SPADCALL |middle| |nbe|
                                                        (QREFELT $ 28))
                                              (QREFELT $ 29))
                                             . #2#)
                                       (EXIT (LETT |lr| (CDR |lr|) . #2#)))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (COND
                           ((< |sg| 0)
                            (SPADCALL
                             (|SCELL;separate| (REVERSE |ll|) |left| |middle|
                              $)
                             (CDR
                              (|SCELL;separate| (CONS |nbe| |lr|) |middle|
                               |right| $))
                             (QREFELT $ 33)))
                           (#3#
                            (SEQ
                             (LETT |new_right|
                                   (SPADCALL
                                    (SPADCALL |left| |middle| (QREFELT $ 22))
                                    (SPADCALL 2 (QREFELT $ 24)) (QREFELT $ 25))
                                   . #2#)
                             (EXIT
                              (COND
                               ((NULL |ll|)
                                (SEQ
                                 (LETT |new_left|
                                       (SPADCALL
                                        (SPADCALL |middle| |right|
                                                  (QREFELT $ 22))
                                        (SPADCALL 2 (QREFELT $ 24))
                                        (QREFELT $ 25))
                                       . #2#)
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (SPADCALL |new_left|
                                                   (|SPADfirst| |lr|)
                                                   (QREFELT $ 34)))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT |new_left|
                                              (SPADCALL
                                               (SPADCALL |middle| |new_left|
                                                         (QREFELT $ 22))
                                               (SPADCALL 2 (QREFELT $ 24))
                                               (QREFELT $ 25))
                                              . #2#)))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (EXIT
                                  (SPADCALL (LIST |left| |middle|)
                                            (|SCELL;separate| |lr| |new_left|
                                             |right| $)
                                            (QREFELT $ 33)))))
                               (#3#
                                (SEQ
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (SPADCALL |new_right|
                                                   (|SPADfirst| |ll|)
                                                   (QREFELT $ 35)))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT |new_right|
                                              (SPADCALL
                                               (SPADCALL |new_right| |middle|
                                                         (QREFELT $ 22))
                                               (SPADCALL 2 (QREFELT $ 24))
                                               (QREFELT $ 25))
                                              . #2#)))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (LETT |new_left|
                                       (SPADCALL
                                        (SPADCALL |middle| |right|
                                                  (QREFELT $ 22))
                                        (SPADCALL 2 (QREFELT $ 24))
                                        (QREFELT $ 25))
                                       . #2#)
                                 (EXIT
                                  (COND
                                   ((NULL |lr|)
                                    (SPADCALL
                                     (|SCELL;separate| (REVERSE |ll|) |left|
                                      |new_right| $)
                                     (LIST |middle| |right|) (QREFELT $ 33)))
                                   (#3#
                                    (SEQ
                                     (SEQ G190
                                          (COND
                                           ((NULL
                                             (SPADCALL |new_left|
                                                       (|SPADfirst| |lr|)
                                                       (QREFELT $ 34)))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |new_left|
                                                  (SPADCALL
                                                   (SPADCALL |middle|
                                                             |new_left|
                                                             (QREFELT $ 22))
                                                   (SPADCALL 2 (QREFELT $ 24))
                                                   (QREFELT $ 25))
                                                  . #2#)))
                                          NIL (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (SPADCALL
                                       (|SCELL;separate| (REVERSE |ll|) |left|
                                        |new_right| $)
                                       (CONS |middle|
                                             (|SCELL;separate| |lr| |new_left|
                                              |right| $))
                                       (QREFELT $ 33)))))))))))))))))))))
          #4# (EXIT #1#)))) 

(PUT '|SCELL;pointToCell| '|SPADreplace| 'VECTOR) 

(SDEFUN |SCELL;pointToCell|
        ((|sp| |TheField|) (|hasDim?| |Boolean|) (|varName| |Symbol|) ($ $))
        (VECTOR |sp| |hasDim?| |varName|)) 

(SDEFUN |SCELL;allSimpleCells;ThePolsSL;7|
        ((|p| |ThePols|) (|var| |Symbol|) ($ |List| $))
        (SPADCALL (LIST |p|) |var| (QREFELT $ 37))) 

(SDEFUN |SCELL;allSimpleCells;LSL;8|
        ((|lp| |List| |ThePols|) (|var| |Symbol|) ($ |List| $))
        (SPROG
         ((|l1| (|List| |TheField|)) (|res| (|List| $))
          (|l| #1=(|List| |TheField|)) (#2=#:G745 NIL) (#3=#:G744 #1#)
          (#4=#:G746 #1#) (#5=#:G756 NIL) (|p| NIL) (|b| (|TheField|))
          (#6=#:G742 NIL) (#7=#:G741 (|TheField|)) (#8=#:G743 (|TheField|))
          (#9=#:G755 NIL) (|lp1| (|List| |ThePols|)))
         (SEQ
          (LETT |lp1| (SPADCALL |lp| (QREFELT $ 40))
                . #10=(|SCELL;allSimpleCells;LSL;8|))
          (EXIT
           (COND
            ((NULL |lp1|)
             (LIST (|SCELL;pointToCell| (|spadConstant| $ 30) 'T |var| $)))
            (#11='T
             (SEQ
              (LETT |b|
                    (PROGN
                     (LETT #6# NIL . #10#)
                     (SEQ (LETT |p| NIL . #10#) (LETT #9# |lp1| . #10#) G190
                          (COND
                           ((OR (ATOM #9#)
                                (PROGN (LETT |p| (CAR #9#) . #10#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #8# (SPADCALL |p| (QREFELT $ 42)) . #10#)
                             (COND
                              (#6#
                               (LETT #7# (SPADCALL #7# #8# (QREFELT $ 43))
                                     . #10#))
                              ('T
                               (PROGN
                                (LETT #7# #8# . #10#)
                                (LETT #6# 'T . #10#)))))))
                          (LETT #9# (CDR #9#) . #10#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#6# #7#) (#11# (|IdentityError| '|max|))))
                    . #10#)
              (LETT |l|
                    (PROGN
                     (LETT #2# NIL . #10#)
                     (SEQ (LETT |p| NIL . #10#) (LETT #5# |lp1| . #10#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |p| (CAR #5#) . #10#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4#
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |p| (QREFELT $ 44))
                                              (QREFELT $ 46))
                                    (QREFELT $ 48))
                                   . #10#)
                             (COND
                              (#2#
                               (LETT #3# (SPADCALL #3# #4# (QREFELT $ 33))
                                     . #10#))
                              ('T
                               (PROGN
                                (LETT #3# #4# . #10#)
                                (LETT #2# 'T . #10#)))))))
                          (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#2# #3#) (#11# NIL)))
                    . #10#)
              (LETT |l| (SPADCALL |l| (QREFELT $ 49)) . #10#)
              (LETT |l1|
                    (|SCELL;separate| |l| (SPADCALL |b| (QREFELT $ 50)) |b| $)
                    . #10#)
              (LETT |res|
                    (LIST (|SCELL;pointToCell| (|SPADfirst| |l1|) 'T |var| $))
                    . #10#)
              (LETT |l1| (CDR |l1|) . #10#)
              (SEQ G190 (COND ((NULL (NULL (NULL |l1|))) (GO G191)))
                   (SEQ
                    (LETT |res|
                          (SPADCALL
                           (|SCELL;pointToCell| (|SPADfirst| |l1|) NIL |var| $)
                           |res| (QREFELT $ 52))
                          . #10#)
                    (LETT |l1| (CDR |l1|) . #10#)
                    (EXIT
                     (COND
                      ((SPADCALL |l1| NIL (QREFELT $ 27))
                       (|error| "Impossible, empty list"))
                      ('T
                       (SEQ
                        (LETT |res|
                              (SPADCALL
                               (|SCELL;pointToCell| (|SPADfirst| |l1|) 'T |var|
                                $)
                               |res| (QREFELT $ 52))
                              . #10#)
                        (EXIT (LETT |l1| (CDR |l1|) . #10#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 53)))))))))) 

(DECLAIM (NOTINLINE |SimpleCell;|)) 

(DEFUN |SimpleCell| (&REST #1=#:G757)
  (SPROG NIL
         (PROG (#2=#:G758)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SimpleCell|)
                                               '|domainEqualList|)
                    . #3=(|SimpleCell|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SimpleCell;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|SimpleCell|)))))))))) 

(DEFUN |SimpleCell;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SimpleCell|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|SimpleCell| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 54) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SimpleCell| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|Record| (|:| |samplePoint| |#1|)
                              (|:| |hasDim| (|Boolean|))
                              (|:| |varOf| (|Symbol|))))
          $))) 

(MAKEPROP '|SimpleCell| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              |SCELL;samplePoint;$TheField;1| (|Boolean|)
              |SCELL;hasDimension?;$B;2| (|Symbol|) |SCELL;variableOf;$S;3|
              (|OutputForm|) (0 . |coerce|) (5 . |coerce|) (10 . =)
              (16 . |coerce|) (|List| $) (21 . |brace|) |SCELL;coerce;$Of;4|
              (26 . +) (|Integer|) (32 . |coerce|) (37 . /) (|List| 6) (43 . =)
              (49 . -) (55 . |sign|) (60 . |Zero|) (64 . |Zero|) (68 . >)
              (74 . |append|) (80 . >=) (86 . <=) (|List| 7)
              |SCELL;allSimpleCells;LSL;8| |SCELL;allSimpleCells;ThePolsSL;7|
              (|CylindricalAlgebraicDecompositionUtilities| 6 7)
              (92 . |gcdBasis|) (|RealPolynomialUtilitiesPackage| 6 7)
              (97 . |boundOfCauchy|) (102 . |max|) (108 . |unitCanonical|)
              (|SparseUnivariatePolynomial| 6) (113 . |makeSUP|)
              (|SparseUnivariatePolynomial| $) (118 . |allRootsOf|)
              (123 . |sort|) (128 . -) (|List| $$) (133 . |cons|)
              (139 . |reverse!|))
           '#(|variableOf| 144 |samplePoint| 149 |hasDimension?| 154 |coerce|
              159 |allSimpleCells| 164)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|CoercibleTo| 14))
                             (|makeByteWordVec2| 53
                                                 '(1 12 14 0 15 1 6 14 0 16 2
                                                   14 0 0 0 17 1 10 14 0 18 1
                                                   14 0 19 20 2 6 0 0 0 22 1 6
                                                   0 23 24 2 6 0 0 0 25 2 26 10
                                                   0 0 27 2 6 0 0 0 28 1 6 23 0
                                                   29 0 6 0 30 0 7 0 31 2 23 10
                                                   0 0 32 2 26 0 0 0 33 2 6 10
                                                   0 0 34 2 6 10 0 0 35 1 39 36
                                                   36 40 1 41 6 7 42 2 6 0 0 0
                                                   43 1 7 0 0 44 1 7 45 0 46 1
                                                   6 19 47 48 1 26 0 0 49 1 6 0
                                                   0 50 2 51 0 2 0 52 1 51 0 0
                                                   53 1 0 12 0 13 1 0 6 0 9 1 0
                                                   10 0 11 1 0 14 0 21 2 0 19
                                                   36 12 37 2 0 19 7 12 38)))))
           '|lookupComplete|)) 
