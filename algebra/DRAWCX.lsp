
(SDEFUN |DRAWCX;makeArrow|
        ((|p1| |Point| (|DoubleFloat|)) (|p2| |Point| (|DoubleFloat|))
         (|len| |DoubleFloat|) (|arg| |DoubleFloat|)
         ($ |List| (|List| (|Point| (|DoubleFloat|)))))
        (SPROG
         ((|p4| #1=(|Point| (|DoubleFloat|))) (|p3| #1#)
          (|s2| #2=(|DoubleFloat|)) (|c2| #3=(|DoubleFloat|)) (|s1| #2#)
          (|c1| #3#))
         (SEQ (LETT |c1| (|cos_DF| (|add_DF| |arg| (QREFELT $ 13))))
              (LETT |s1| (|sin_DF| (|add_DF| |arg| (QREFELT $ 13))))
              (LETT |c2| (|cos_DF| (|sub_DF| |arg| (QREFELT $ 13))))
              (LETT |s2| (|sin_DF| (|sub_DF| |arg| (QREFELT $ 13))))
              (LETT |p3|
                    (SPADCALL
                     (LIST
                      (|add_DF| (SPADCALL |p2| 1 (QREFELT $ 19))
                                (|mul_DF| (|mul_DF| |c1| (QREFELT $ 12))
                                          |len|))
                      (|add_DF| (SPADCALL |p2| 2 (QREFELT $ 19))
                                (|mul_DF| (|mul_DF| |s1| (QREFELT $ 12))
                                          |len|))
                      (SPADCALL |p2| 3 (QREFELT $ 19))
                      (SPADCALL |p2| 4 (QREFELT $ 19)))
                     (QREFELT $ 21)))
              (LETT |p4|
                    (SPADCALL
                     (LIST
                      (|add_DF| (SPADCALL |p2| 1 (QREFELT $ 19))
                                (|mul_DF| (|mul_DF| |c2| (QREFELT $ 12))
                                          |len|))
                      (|add_DF| (SPADCALL |p2| 2 (QREFELT $ 19))
                                (|mul_DF| (|mul_DF| |s2| (QREFELT $ 12))
                                          |len|))
                      (SPADCALL |p2| 3 (QREFELT $ 19))
                      (SPADCALL |p2| 4 (QREFELT $ 19)))
                     (QREFELT $ 21)))
              (EXIT (LIST (LIST |p1| |p2| |p3|) (LIST |p2| |p4|)))))) 

(SDEFUN |DRAWCX;clipFun| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (|min_DF| (|max_DF| |x| (|minus_DF| (QREFELT $ 16))) (QREFELT $ 16))) 

(SDEFUN |DRAWCX;drawComplex;M2SBTdv;3|
        ((|f| |Mapping| #1=(|Complex| (|DoubleFloat|))
          (|Complex| (|DoubleFloat|)))
         (|realRange| |Segment| (|DoubleFloat|))
         (|imagRange| |Segment| (|DoubleFloat|)) (|arrows?| |Boolean|)
         ($ |ThreeDimensionalViewport|))
        (SPROG
         ((|real| #2=(|DoubleFloat|)) (|imag| #2#) (#3=#:G410 NIL) (|a| NIL)
          (|arrow| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|p2| #4=(|Point| (|DoubleFloat|))) (|len| (|DoubleFloat|))
          (|p1| #4#) (|arg| (|DoubleFloat|)) (#5=#:G409 NIL) (|j| NIL)
          (#6=#:G408 NIL) (|i| NIL) (|space| (|ThreeSpace| (|DoubleFloat|)))
          (|llp| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|lp| (|List| (|Point| (|DoubleFloat|)))) (|p| #4#) (#7=#:G407 NIL)
          (#8=#:G406 NIL) (|z| #1#) (#9=#:G405 NIL) (#10=#:G404 NIL)
          (|funTable|
           (|TwoDimensionalArray|
            (|Record| (|:| |rr| (|DoubleFloat|)) (|:| |th| (|DoubleFloat|)))))
          (#11=#:G384 NIL) (#12=#:G382 NIL) (|delImag| #13=(|DoubleFloat|))
          (|delReal| #13#))
         (SEQ
          (LETT |delReal|
                (|div_DF|
                 (|sub_DF| (SPADCALL |realRange| (QREFELT $ 23))
                           (SPADCALL |realRange| (QREFELT $ 24)))
                 (FLOAT (QREFELT $ 14) MOST-POSITIVE-DOUBLE-FLOAT)))
          (LETT |delImag|
                (|div_DF|
                 (|sub_DF| (SPADCALL |imagRange| (QREFELT $ 23))
                           (SPADCALL |imagRange| (QREFELT $ 24)))
                 (FLOAT (QREFELT $ 15) MOST-POSITIVE-DOUBLE-FLOAT)))
          (LETT |funTable|
                (MAKE_MATRIX1
                 (+
                  (PROG1 (LETT #12# (QREFELT $ 14))
                    (|check_subtype2| (>= #12# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #12#))
                  1)
                 (+
                  (PROG1 (LETT #11# (QREFELT $ 15))
                    (|check_subtype2| (>= #11# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #11#))
                  1)
                 (CONS 0.0 0.0)))
          (LETT |real| (SPADCALL |realRange| (QREFELT $ 24)))
          (SEQ (LETT |i| 1) (LETT #10# (+ (QREFELT $ 14) 1)) G190
               (COND ((|greater_SI| |i| #10#) (GO G191)))
               (SEQ (LETT |imag| (SPADCALL |imagRange| (QREFELT $ 24)))
                    (SEQ (LETT |j| 1) (LETT #9# (+ (QREFELT $ 15) 1)) G190
                         (COND ((|greater_SI| |j| #9#) (GO G191)))
                         (SEQ
                          (LETT |z|
                                (SPADCALL
                                 (SPADCALL |real| |imag| (QREFELT $ 27)) |f|))
                          (SPADCALL |funTable| |i| |j|
                                    (CONS
                                     (|DRAWCX;clipFun|
                                      (SPADCALL (SPADCALL |z| (QREFELT $ 28))
                                                (QREFELT $ 29))
                                      $)
                                     (SPADCALL |z| (QREFELT $ 30)))
                                    (QREFELT $ 33))
                          (EXIT (LETT |imag| (|add_DF| |imag| |delImag|))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |real| (|add_DF| |real| |delReal|))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |llp| NIL) (LETT |real| (SPADCALL |realRange| (QREFELT $ 24)))
          (SEQ (LETT |i| 1) (LETT #8# (+ (QREFELT $ 14) 1)) G190
               (COND ((|greater_SI| |i| #8#) (GO G191)))
               (SEQ (LETT |imag| (SPADCALL |imagRange| (QREFELT $ 24)))
                    (LETT |lp| NIL)
                    (SEQ (LETT |j| 1) (LETT #7# (+ (QREFELT $ 15) 1)) G190
                         (COND ((|greater_SI| |j| #7#) (GO G191)))
                         (SEQ
                          (LETT |p|
                                (SPADCALL
                                 (LIST |real| |imag|
                                       (QCAR
                                        (SPADCALL |funTable| |i| |j|
                                                  (QREFELT $ 34)))
                                       (QCDR
                                        (SPADCALL |funTable| |i| |j|
                                                  (QREFELT $ 34))))
                                 (QREFELT $ 21)))
                          (LETT |lp| (CONS |p| |lp|))
                          (EXIT (LETT |imag| (|add_DF| |imag| |delImag|))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (LETT |real| (|add_DF| |real| |delReal|))
                    (EXIT (LETT |llp| (CONS |lp| |llp|))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |space| (SPADCALL |llp| (QREFELT $ 37)))
          (COND
           (|arrows?|
            (SEQ (LETT |real| (SPADCALL |realRange| (QREFELT $ 24)))
                 (EXIT
                  (SEQ (LETT |i| 1) (LETT #6# (+ (QREFELT $ 14) 1)) G190
                       (COND ((|greater_SI| |i| #6#) (GO G191)))
                       (SEQ (LETT |imag| (SPADCALL |imagRange| (QREFELT $ 24)))
                            (SEQ (LETT |j| 1) (LETT #5# (+ (QREFELT $ 15) 1))
                                 G190 (COND ((|greater_SI| |j| #5#) (GO G191)))
                                 (SEQ
                                  (LETT |arg|
                                        (QCDR
                                         (SPADCALL |funTable| |i| |j|
                                                   (QREFELT $ 34))))
                                  (LETT |p1|
                                        (SPADCALL
                                         (LIST |real| |imag|
                                               (QCAR
                                                (SPADCALL |funTable| |i| |j|
                                                          (QREFELT $ 34)))
                                               |arg|)
                                         (QREFELT $ 21)))
                                  (LETT |len|
                                        (|mul_DF| |delReal|
                                                  (SPADCALL
                                                   (SPADCALL 2 0 10
                                                             (QREFELT $ 9))
                                                   (QREFELT $ 11))))
                                  (LETT |p2|
                                        (SPADCALL
                                         (LIST
                                          (|add_DF|
                                           (SPADCALL |p1| 1 (QREFELT $ 19))
                                           (|mul_DF| |len| (|cos_DF| |arg|)))
                                          (|add_DF|
                                           (SPADCALL |p1| 2 (QREFELT $ 19))
                                           (|mul_DF| |len| (|sin_DF| |arg|)))
                                          (SPADCALL |p1| 3 (QREFELT $ 19))
                                          (SPADCALL |p1| 4 (QREFELT $ 19)))
                                         (QREFELT $ 21)))
                                  (LETT |arrow|
                                        (|DRAWCX;makeArrow| |p1| |p2| |len|
                                         |arg| $))
                                  (SEQ (LETT |a| NIL) (LETT #3# |arrow|) G190
                                       (COND
                                        ((OR (ATOM #3#)
                                             (PROGN (LETT |a| (CAR #3#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |space| |a|
                                                   (QREFELT $ 39))))
                                       (LETT #3# (CDR #3#)) (GO G190) G191
                                       (EXIT NIL))
                                  (EXIT
                                   (LETT |imag| (|add_DF| |imag| |delImag|))))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT (LETT |real| (|add_DF| |real| |delReal|))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))))))
          (EXIT (SPADCALL |space| "Complex Function" (QREFELT $ 42)))))) 

(SDEFUN |DRAWCX;drawComplexVectorField;M2STdv;4|
        ((|f| |Mapping| #1=(|Complex| (|DoubleFloat|))
          (|Complex| (|DoubleFloat|)))
         (|realRange| |Segment| (|DoubleFloat|))
         (|imagRange| |Segment| (|DoubleFloat|))
         ($ |ThreeDimensionalViewport|))
        (SPROG
         ((|real| #2=(|DoubleFloat|)) (|imag| #2#) (#3=#:G420 NIL) (|a| NIL)
          (|arrow| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|p2| #4=(|Point| (|DoubleFloat|))) (|scaleLen| (|DoubleFloat|))
          (|p1| #4#) (|len| (|DoubleFloat|)) (|arg| (|DoubleFloat|)) (|z| #1#)
          (#5=#:G419 NIL) (|j| NIL) (#6=#:G418 NIL) (|i| NIL)
          (|space| (|ThreeSpace| (|DoubleFloat|)))
          (|delImag| #7=(|DoubleFloat|)) (|delReal| #7#))
         (SEQ
          (LETT |delReal|
                (|div_DF|
                 (|sub_DF| (SPADCALL |realRange| (QREFELT $ 23))
                           (SPADCALL |realRange| (QREFELT $ 24)))
                 (FLOAT (QREFELT $ 14) MOST-POSITIVE-DOUBLE-FLOAT)))
          (LETT |delImag|
                (|div_DF|
                 (|sub_DF| (SPADCALL |imagRange| (QREFELT $ 23))
                           (SPADCALL |imagRange| (QREFELT $ 24)))
                 (FLOAT (QREFELT $ 15) MOST-POSITIVE-DOUBLE-FLOAT)))
          (LETT |space| (SPADCALL (QREFELT $ 46)))
          (LETT |real| (SPADCALL |realRange| (QREFELT $ 24)))
          (SEQ (LETT |i| 1) (LETT #6# (+ (QREFELT $ 14) 1)) G190
               (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ (LETT |imag| (SPADCALL |imagRange| (QREFELT $ 24)))
                    (SEQ (LETT |j| 1) (LETT #5# (+ (QREFELT $ 15) 1)) G190
                         (COND ((|greater_SI| |j| #5#) (GO G191)))
                         (SEQ
                          (LETT |z|
                                (SPADCALL
                                 (SPADCALL |real| |imag| (QREFELT $ 27)) |f|))
                          (LETT |arg| (SPADCALL |z| (QREFELT $ 30)))
                          (LETT |len|
                                (|DRAWCX;clipFun|
                                 (SPADCALL (SPADCALL |z| (QREFELT $ 28))
                                           (QREFELT $ 29))
                                 $))
                          (LETT |p1|
                                (SPADCALL (LIST |real| |imag| 0.0 |arg|)
                                          (QREFELT $ 21)))
                          (LETT |scaleLen| (|mul_DF| |delReal| |len|))
                          (LETT |p2|
                                (SPADCALL
                                 (LIST
                                  (|add_DF| (SPADCALL |p1| 1 (QREFELT $ 19))
                                            (|mul_DF| |scaleLen|
                                                      (|cos_DF| |arg|)))
                                  (|add_DF| (SPADCALL |p1| 2 (QREFELT $ 19))
                                            (|mul_DF| |scaleLen|
                                                      (|sin_DF| |arg|)))
                                  0.0 |arg|)
                                 (QREFELT $ 21)))
                          (LETT |arrow|
                                (|DRAWCX;makeArrow| |p1| |p2| |scaleLen| |arg|
                                 $))
                          (SEQ (LETT |a| NIL) (LETT #3# |arrow|) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |a| (CAR #3#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT (SPADCALL |space| |a| (QREFELT $ 39))))
                               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                          (EXIT (LETT |imag| (|add_DF| |imag| |delImag|))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |real| (|add_DF| |real| |delReal|))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |space| "Complex Vector Field" (QREFELT $ 42)))))) 

(SDEFUN |DRAWCX;setRealSteps;2I;5| ((|n| |Integer|) ($ |Integer|))
        (SETELT $ 14 |n|)) 

(SDEFUN |DRAWCX;setImagSteps;2I;6| ((|n| |Integer|) ($ |Integer|))
        (SETELT $ 15 |n|)) 

(SDEFUN |DRAWCX;setClipValue;2Df;7| ((|clip| |DoubleFloat|) ($ |DoubleFloat|))
        (SETELT $ 16 |clip|)) 

(DECLAIM (NOTINLINE |DrawComplex;|)) 

(DEFUN |DrawComplex| ()
  (SPROG NIL
         (PROG (#1=#:G425)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|DrawComplex|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DrawComplex|
                             (LIST (CONS NIL (CONS 1 (|DrawComplex;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|DrawComplex|)))))))))) 

(DEFUN |DrawComplex;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DrawComplex|))
          (LETT $ (GETREFV 51))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DrawComplex| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 12
                    (SPADCALL (SPADCALL 125 -3 10 (QREFELT $ 9))
                              (QREFELT $ 11)))
          (QSETREFV $ 13
                    (|sub_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                              (|div_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                                        (FLOAT 20
                                               MOST-POSITIVE-DOUBLE-FLOAT))))
          (QSETREFV $ 14 11)
          (QSETREFV $ 15 11)
          (QSETREFV $ 16 (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT))
          $))) 

(MAKEPROP '|DrawComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|PositiveInteger|) (|Float|)
              (0 . |float|) (|DoubleFloat|) (7 . |coerce|) '|arrowScale|
              '|arrowAngle| '|realSteps| '|imagSteps| '|clipValue| (12 . |One|)
              (|Point| 10) (16 . |elt|) (|List| 10) (22 . |point|)
              (|Segment| 10) (27 . |high|) (32 . |low|) (37 . |Zero|)
              (|Complex| 10) (41 . |complex|) (47 . |norm|) (52 . |sqrt|)
              (57 . |argument|) (|Record| (|:| |rr| 10) (|:| |th| 10))
              (|TwoDimensionalArray| 31) (62 . |setelt!|) (70 . |elt|)
              (|List| 38) (|ThreeSpace| 10) (77 . |mesh|) (|List| 18)
              (82 . |curve|) (|String|) (|ThreeDimensionalViewport|)
              (88 . |makeViewport3D|) (|Mapping| 26 26) (|Boolean|)
              |DRAWCX;drawComplex;M2SBTdv;3| (94 . |create3Space|)
              |DRAWCX;drawComplexVectorField;M2STdv;4|
              |DRAWCX;setRealSteps;2I;5| |DRAWCX;setImagSteps;2I;6|
              |DRAWCX;setClipValue;2Df;7|)
           '#(|setRealSteps| 98 |setImagSteps| 103 |setClipValue| 108
              |drawComplexVectorField| 113 |drawComplex| 120)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|drawComplex|
                                 ((|ThreeDimensionalViewport|)
                                  (|Mapping| (|Complex| (|DoubleFloat|))
                                             (|Complex| (|DoubleFloat|)))
                                  (|Segment| (|DoubleFloat|))
                                  (|Segment| (|DoubleFloat|)) (|Boolean|)))
                                T)
                              '((|drawComplexVectorField|
                                 ((|ThreeDimensionalViewport|)
                                  (|Mapping| (|Complex| (|DoubleFloat|))
                                             (|Complex| (|DoubleFloat|)))
                                  (|Segment| (|DoubleFloat|))
                                  (|Segment| (|DoubleFloat|))))
                                T)
                              '((|setRealSteps| ((|Integer|) (|Integer|))) T)
                              '((|setImagSteps| ((|Integer|) (|Integer|))) T)
                              '((|setClipValue|
                                 ((|DoubleFloat|) (|DoubleFloat|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 50
                                            '(3 8 0 6 6 7 9 1 8 10 0 11 0 8 0
                                              17 2 18 10 0 6 19 1 18 0 20 21 1
                                              22 10 0 23 1 22 10 0 24 0 8 0 25
                                              2 26 0 10 10 27 1 26 10 0 28 1 10
                                              0 0 29 1 26 10 0 30 4 32 31 0 6 6
                                              31 33 3 32 31 0 6 6 34 1 36 0 35
                                              37 2 36 0 0 38 39 2 41 0 36 40 42
                                              0 36 0 46 1 0 6 6 48 1 0 6 6 49 1
                                              0 10 10 50 3 0 41 43 22 22 47 4 0
                                              41 43 22 22 44 45)))))
           '|lookupComplete|)) 

(MAKEPROP '|DrawComplex| 'NILADIC T) 
