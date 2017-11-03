
(SDEFUN |FFP;generator;$;1| (($ $))
        (SPADCALL (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 33))
                  (QREFELT $ 34))) 

(SDEFUN |FFP;norm;$GF;2| ((|x| $) ($ GF))
        (SPADCALL (QREFELT $ 7) (SPADCALL |x| (QREFELT $ 36)) (QREFELT $ 37))) 

(SDEFUN |FFP;basis;PiV;3| ((|n| |PositiveInteger|) ($ |Vector| $))
        (SPROG ((#1=#:G728 NIL) (|i| NIL) (#2=#:G727 NIL) (|a| ($)))
               (SEQ
                (COND
                 ((SPADCALL (REM (QREFELT $ 12) |n|) 0 (QREFELT $ 40))
                  (|error| "argument must divide extension degree"))
                 ('T
                  (SEQ
                   (LETT |a|
                         (SPADCALL (SPADCALL (QREFELT $ 41)) |n|
                                   (QREFELT $ 42))
                         . #3=(|FFP;basis;PiV;3|))
                   (EXIT
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |n| 1) . #3#) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |a| |i| (QREFELT $ 43)) #2#)
                                   . #3#)))
                           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 46))))))))) 

(SDEFUN |FFP;degree;$Pi;4| ((|x| $) ($ |PositiveInteger|))
        (SPROG
         ((#1=#:G732 NIL) (|y| ($)) (#2=#:G735 NIL) (|i| NIL)
          (|m| (|Matrix| GF)))
         (SEQ (LETT |y| (|spadConstant| $ 31) . #3=(|FFP;degree;$Pi;4|))
              (LETT |m|
                    (SPADCALL (QREFELT $ 12) (+ (QREFELT $ 12) 1)
                              (QREFELT $ 50))
                    . #3#)
              (SEQ (LETT |i| 1 . #3#) (LETT #2# (+ (QREFELT $ 12) 1) . #3#)
                   G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (SPADCALL |m| |i| (SPADCALL |y| (QREFELT $ 52))
                              (QREFELT $ 54))
                    (EXIT (LETT |y| (SPADCALL |y| |x| (QREFELT $ 55)) . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROG1 (LETT #1# (SPADCALL |m| (QREFELT $ 57)) . #3#)
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))))) 

(SDEFUN |FFP;minimalPolynomial;$Sup;5|
        ((|x| $) ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((#1=#:G739 NIL) (#2=#:G738 #3=(|SparseUnivariatePolynomial| GF))
          (#4=#:G740 #3#) (#5=#:G744 NIL) (|i| NIL) (|v| (|Vector| GF))
          (|y| ($)) (#6=#:G743 NIL) (|m| (|Matrix| GF)))
         (SEQ
          (LETT |y| (|spadConstant| $ 31)
                . #7=(|FFP;minimalPolynomial;$Sup;5|))
          (LETT |m|
                (SPADCALL (QREFELT $ 12) (+ (QREFELT $ 12) 1) (QREFELT $ 50))
                . #7#)
          (SEQ (LETT |i| 1 . #7#) (LETT #6# (+ (QREFELT $ 12) 1) . #7#) G190
               (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ
                (SPADCALL |m| |i| (SPADCALL |y| (QREFELT $ 52)) (QREFELT $ 54))
                (EXIT (LETT |y| (SPADCALL |y| |x| (QREFELT $ 55)) . #7#)))
               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
          (LETT |v| (|SPADfirst| (SPADCALL |m| (QREFELT $ 60))) . #7#)
          (EXIT
           (PROGN
            (LETT #1# NIL . #7#)
            (SEQ (LETT |i| 0 . #7#) (LETT #5# (QREFELT $ 12) . #7#) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #4#
                          (SPADCALL (SPADCALL |v| (+ |i| 1) (QREFELT $ 61)) |i|
                                    (QREFELT $ 33))
                          . #7#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 62)) . #7#))
                     ('T (PROGN (LETT #2# #4# . #7#) (LETT #1# 'T . #7#)))))))
                 (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 63)))))))) 

(SDEFUN |FFP;normal?;$B;6| ((|x| $) ($ |Boolean|))
        (SPROG ((|l| (|List| (|List| GF))) (|a| ($)) (#1=#:G761 NIL) (|i| NIL))
               (SEQ
                (LETT |l|
                      (LIST
                       (SPADCALL (SPADCALL |x| (QREFELT $ 52)) (QREFELT $ 66)))
                      . #2=(|FFP;normal?;$B;6|))
                (LETT |a| |x| . #2#)
                (SEQ (LETT |i| 2 . #2#) (LETT #1# (QREFELT $ 12) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (LETT |a| (SPADCALL |a| (QREFELT $ 67)) . #2#)
                          (EXIT
                           (LETT |l|
                                 (SPADCALL |l|
                                           (SPADCALL
                                            (SPADCALL |a| (QREFELT $ 52))
                                            (QREFELT $ 66))
                                           (QREFELT $ 69))
                                 . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((EQL (SPADCALL (SPADCALL |l| (QREFELT $ 70)) (QREFELT $ 57))
                        (QREFELT $ 12))
                   'T)
                  ('T NIL)))))) 

(SDEFUN |FFP;*;GF2$;7| ((|a| GF) (|x| $) ($ $))
        (SPADCALL |a| |x| (QREFELT $ 74))) 

(SDEFUN |FFP;*;I2$;8| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |n| |x| (QREFELT $ 76))) 

(SDEFUN |FFP;-;2$;9| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 78))) 

(SDEFUN |FFP;random;$;10| (($ $)) (SPADCALL (QREFELT $ 80))) 

(SDEFUN |FFP;coordinates;$V;11| ((|x| $) ($ |Vector| GF))
        (SPADCALL |x| (QREFELT $ 82))) 

(SDEFUN |FFP;represents;V$;12| ((|v| |Vector| GF) ($ $))
        (SPADCALL |v| (QREFELT $ 83))) 

(SDEFUN |FFP;coerce;GF$;13| ((|x| GF) ($ $)) (SPADCALL |x| (QREFELT $ 85))) 

(SDEFUN |FFP;definingPolynomial;Sup;14| (($ |SparseUnivariatePolynomial| GF))
        (QREFELT $ 7)) 

(SDEFUN |FFP;retract;$GF;15| ((|x| $) ($ GF)) (SPADCALL |x| (QREFELT $ 88))) 

(SDEFUN |FFP;retractIfCan;$U;16| ((|x| $) ($ |Union| GF "failed"))
        (SPADCALL |x| (QREFELT $ 91))) 

(SDEFUN |FFP;index;Pi$;17| ((|x| |PositiveInteger|) ($ $))
        (SPADCALL |x| (QREFELT $ 93))) 

(SDEFUN |FFP;lookup;$Pi;18| ((|x| $) ($ |PositiveInteger|))
        (SPADCALL |x| (QREFELT $ 95))) 

(SDEFUN |FFP;/;3$;19| ((|x| $) (|y| $) ($ $)) (SPADCALL |x| |y| (QREFELT $ 97))) 

(SDEFUN |FFP;/;$GF$;20| ((|x| $) (|a| GF) ($ $))
        (SPADCALL |x| (SPADCALL |a| (QREFELT $ 86)) (QREFELT $ 98))) 

(SDEFUN |FFP;*;3$;21| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 100))) 

(SDEFUN |FFP;+;3$;22| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 101))) 

(SDEFUN |FFP;-;3$;23| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 103))) 

(SDEFUN |FFP;=;2$B;24| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 105))) 

(SDEFUN |FFP;basis;V;25| (($ |Vector| $)) (SPADCALL (QREFELT $ 107))) 

(SDEFUN |FFP;Zero;$;26| (($ $)) (|spadConstant| $ 109)) 

(SDEFUN |FFP;One;$;27| (($ $)) (|spadConstant| $ 111)) 

(SDEFUN |FFP;factorsOfCyclicGroupSize;L;28|
        (($ |List|
          (|Record| (|:| |factor| #1=(|Integer|)) (|:| |exponent| #1#))))
        (SEQ (COND ((NULL (QREFELT $ 22)) (|FFP;initializeElt| $)))
             (EXIT (QREFELT $ 22)))) 

(PUT '|FFP;representationType;U;29| '|SPADreplace|
     '(XLAM NIL (CONS 1 "polynomial"))) 

(SDEFUN |FFP;representationType;U;29|
        (($ |Union| "prime" "polynomial" "normal" "cyclic"))
        (CONS 1 "polynomial")) 

(SDEFUN |FFP;tableForDiscreteLogarithm;IT;30|
        ((|fac| |Integer|)
         ($ |Table| (|PositiveInteger|) (|NonNegativeInteger|)))
        (SPROG
         ((|tbl|
           (|Union| (|Table| (|PositiveInteger|) (|NonNegativeInteger|))
                    "failed"))
          (#1=#:G803 NIL))
         (SEQ (COND ((QREFELT $ 25) (|FFP;initializeLog| $)))
              (LETT |tbl|
                    (SPADCALL
                     (PROG1
                         (LETT #1# |fac|
                               . #2=(|FFP;tableForDiscreteLogarithm;IT;30|))
                       (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                         '(|Integer|) #1#))
                     (QREFELT $ 29) (QREFELT $ 118))
                    . #2#)
              (EXIT
               (COND
                ((QEQCAR |tbl| 1)
                 (|error|
                  "tableForDiscreteLogarithm: argument must be prime divisor of the order of the multiplicative group"))
                ('T (QCDR |tbl|))))))) 

(SDEFUN |FFP;primitiveElement;$;31| (($ $))
        (SEQ (COND ((QREFELT $ 26) (|FFP;initializeElt| $)))
             (EXIT (SPADCALL (QREFELT $ 24) (QREFELT $ 94))))) 

(SDEFUN |FFP;normalElement;$;32| (($ $))
        (SEQ (COND ((QREFELT $ 26) (|FFP;initializeElt| $)))
             (EXIT (SPADCALL (QREFELT $ 23) (QREFELT $ 94))))) 

(SDEFUN |FFP;initializeElt| (($ |Void|))
        (SPROG ((|nElt| ($)) (|pE| ($)))
               (SEQ
                (SETELT $ 22
                        (SPADCALL (SPADCALL (QREFELT $ 21) (QREFELT $ 123))
                                  (QREFELT $ 125)))
                (LETT |pE| (SPADCALL (QREFELT $ 126))
                      . #1=(|FFP;initializeElt|))
                (SETELT $ 24 (SPADCALL |pE| (QREFELT $ 96)))
                (LETT |nElt| (SPADCALL (QREFELT $ 35)) . #1#)
                (SEQ G190
                     (COND
                      ((NULL (NULL (SPADCALL |nElt| (QREFELT $ 73))))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |nElt| (SPADCALL |nElt| |pE| (QREFELT $ 55))
                             . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (SETELT $ 23 (SPADCALL |nElt| (QREFELT $ 96)))
                (SETELT $ 26 NIL) (EXIT (SPADCALL (QREFELT $ 128)))))) 

(SDEFUN |FFP;initializeLog| (($ |Void|))
        (SPROG
         ((#1=#:G834 NIL) (|a| ($)) (#2=#:G840 NIL) (#3=#:G828 NIL) (|i| NIL)
          (|tbl| (|Table| (|PositiveInteger|) (|NonNegativeInteger|)))
          (|n| (|Integer|)) (|d| (|Integer|)) (|l| (|Integer|)) (|base| ($))
          (|fac| (|Integer|)) (#4=#:G839 NIL) (|f| NIL) (|limit| (|Integer|)))
         (SEQ (COND ((QREFELT $ 26) (|FFP;initializeElt| $)))
              (LETT |limit| 30 . #5=(|FFP;initializeLog|))
              (SEQ (LETT |f| NIL . #5#) (LETT #4# (QREFELT $ 22) . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |fac| (QCAR |f|) . #5#)
                        (LETT |base|
                              (SPADCALL (SPADCALL (QREFELT $ 41))
                                        (QUOTIENT2 (QREFELT $ 21) |fac|)
                                        (QREFELT $ 129))
                              . #5#)
                        (LETT |l| (INTEGER-LENGTH |fac|) . #5#)
                        (LETT |n| 0 . #5#)
                        (COND
                         ((ODDP |l|)
                          (LETT |n| (ASH |fac| (- (QUOTIENT2 |l| 2))) . #5#))
                         ('T (LETT |n| (ASH 1 (QUOTIENT2 |l| 2)) . #5#)))
                        (COND
                         ((< |n| |limit|)
                          (SEQ
                           (LETT |d| (+ (QUOTIENT2 (- |fac| 1) |limit|) 1)
                                 . #5#)
                           (EXIT
                            (LETT |n| (+ (QUOTIENT2 (- |fac| 1) |d|) 1)
                                  . #5#)))))
                        (LETT |tbl| (SPADCALL (QREFELT $ 130)) . #5#)
                        (LETT |a| (|spadConstant| $ 31) . #5#)
                        (SEQ (LETT |i| 0 . #5#)
                             (LETT #2#
                                   (PROG1 (LETT #3# (- |n| 1) . #5#)
                                     (|check_subtype2| (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#))
                                   . #5#)
                             G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (SPADCALL
                               (CONS (SPADCALL |a| (QREFELT $ 96)) |i|) |tbl|
                               (QREFELT $ 132))
                              (EXIT
                               (LETT |a| (SPADCALL |a| |base| (QREFELT $ 55))
                                     . #5#)))
                             (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SPADCALL
                          (CONS
                           (PROG1 (LETT #1# |fac| . #5#)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|Integer|) #1#))
                           (SPADCALL |tbl| (QREFELT $ 133)))
                          (QREFELT $ 29) (QREFELT $ 135))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (SETELT $ 25 NIL) (EXIT (SPADCALL (QREFELT $ 128)))))) 

(SDEFUN |FFP;coerce;$Of;35| ((|e| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL |e| (QREFELT $ 36)) (QREFELT $ 17) (QREFELT $ 136))) 

(SDEFUN |FFP;extensionDegree;Pi;36| (($ |PositiveInteger|)) (QREFELT $ 12)) 

(SDEFUN |FFP;size;Nni;37| (($ |NonNegativeInteger|)) (+ (QREFELT $ 21) 1)) 

(SDEFUN |FFP;inGroundField?;$B;38| ((|x| $) ($ |Boolean|))
        (NULL
         (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (CONS 1 "failed")
                   (QREFELT $ 140)))) 

(SDEFUN |FFP;characteristic;Nni;39| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 142))) 

(DECLAIM (NOTINLINE |FiniteFieldExtensionByPolynomial;|)) 

(DEFUN |FiniteFieldExtensionByPolynomial| (&REST #1=#:G879)
  (SPROG NIL
         (PROG (#2=#:G880)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldExtensionByPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|FiniteFieldExtensionByPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |FiniteFieldExtensionByPolynomial;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldExtensionByPolynomial|)))))))))) 

(DEFUN |FiniteFieldExtensionByPolynomial;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G878 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|FiniteFieldExtensionByPolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|FiniteFieldExtensionByPolynomial| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 169) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #1#
                                              (|HasCategory| |#1| '(|Finite|))
                                              . #2#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         #1#)))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|FiniteFieldExtensionByPolynomial|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND #1# (|HasCategory| $ '(|CharacteristicNonZero|))
         (|augmentPredVector| $ 8))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8
              (|SimpleAlgebraicExtension| |#1|
                                          (|SparseUnivariatePolynomial| |#1|)
                                          |#2|))
    (QSETREFV $ 12 (SPADCALL |#2| (QREFELT $ 11)))
    (QSETREFV $ 17 (SPADCALL (SPADCALL (QREFELT $ 14)) (QREFELT $ 16)))
    (QSETREFV $ 21
              (-
               (SPADCALL (SPADCALL (QREFELT $ 18)) (QREFELT $ 12)
                         (QREFELT $ 20))
               1))
    (QSETREFV $ 22 NIL)
    (QSETREFV $ 23 1)
    (QSETREFV $ 24 1)
    (QSETREFV $ 25 'T)
    (QSETREFV $ 26 'T)
    (QSETREFV $ 29 (SPADCALL (QREFELT $ 28)))
    $))) 

(MAKEPROP '|FiniteFieldExtensionByPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 6)
              (0 . |degree|) '|extdeg| (|Symbol|) (5 . |new|) (|OutputForm|)
              (9 . |coerce|) '|alpha| (14 . |size|) (|PositiveInteger|)
              (18 . ^) '|sizeCG| '|facOfGroupSize| '|normalElt| '|primitiveElt|
              '|initlog?| '|initelt?| (|Table| 19 119) (24 . |table|)
              '|discLogTable| (28 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FFP;One;$;27|) $))
              (32 . |One|) (36 . |monomial|) (42 . |reduce|)
              |FFP;generator;$;1| (47 . |lift|) (52 . |resultant|)
              |FFP;norm;$GF;2| (|Boolean|) (58 . ~=)
              |FFP;primitiveElement;$;31| (64 . |norm|) (70 . ^) (|List| $$)
              (|Vector| $$) (76 . |vector|) (|Vector| $) |FFP;basis;PiV;3|
              (|Matrix| 6) (81 . |zero|) (|Vector| 6) |FFP;coordinates;$V;11|
              (|Integer|) (87 . |setColumn!|) |FFP;*;3$;21| (94 . |rank|)
              (98 . |rank|) |FFP;degree;$Pi;4| (|List| 51) (103 . |nullSpace|)
              (108 . |elt|) (114 . +) (120 . |Zero|)
              |FFP;minimalPolynomial;$Sup;5| (|List| 6) (124 . |entries|)
              (129 . |Frobenius|) (|List| 65) (134 . |concat|) (140 . |matrix|)
              (|SimpleAlgebraicExtension| 6 10 (NRTEVAL (QREFELT $ 7)))
              (145 . |rank|) |FFP;normal?;$B;6| (149 . *) |FFP;*;GF2$;7|
              (155 . *) |FFP;*;I2$;8| (161 . -) |FFP;-;2$;9| (166 . |random|)
              |FFP;random;$;10| (170 . |coordinates|) (175 . |represents|)
              |FFP;represents;V$;12| (180 . |coerce|) |FFP;coerce;GF$;13|
              |FFP;definingPolynomial;Sup;14| (185 . |retract|)
              |FFP;retract;$GF;15| (|Union| 6 '"failed") (190 . |retractIfCan|)
              |FFP;retractIfCan;$U;16| (195 . |index|) |FFP;index;Pi$;17|
              (200 . |lookup|) |FFP;lookup;$Pi;18| (205 . /) |FFP;/;3$;19|
              |FFP;/;$GF$;20| (211 . *) (217 . +) |FFP;+;3$;22| (223 . -)
              |FFP;-;3$;23| (229 . =) |FFP;=;2$B;24| (235 . |basis|)
              |FFP;basis;V;25| (239 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FFP;Zero;$;26|) $))
              (243 . |One|) (|Record| (|:| |factor| 53) (|:| |exponent| 53))
              (|List| 112) |FFP;factorsOfCyclicGroupSize;L;28|
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              |FFP;representationType;U;29| (|Union| 119 '"failed")
              (247 . |search|) (|Table| 19 9)
              |FFP;tableForDiscreteLogarithm;IT;30| |FFP;normalElement;$;32|
              (|Factored| $) (253 . |factor|) (|Factored| 53) (258 . |factors|)
              (263 . |createPrimitiveElement|) (|Void|) (267 . |void|)
              (271 . ^) (277 . |table|)
              (|Record| (|:| |key| 19) (|:| |entry| 9)) (281 . |insert!|)
              (287 . |copy|) (|Record| (|:| |key| 19) (|:| |entry| 119))
              (292 . |insert!|) (298 . |outputForm|) |FFP;coerce;$Of;35|
              |FFP;extensionDegree;Pi;36| |FFP;size;Nni;37| (304 . =)
              |FFP;inGroundField?;$B;38| (310 . |characteristic|)
              |FFP;characteristic;Nni;39| (|Union| 47 '#1="failed")
              (|Matrix| $) (|OnePointCompletion| 19) (|Union| $ '"failed")
              (|Union| 9 '"failed") (|List| $) (|InputForm|) (|Factored| 152)
              (|SparseUnivariatePolynomial| $) (|Union| 154 '#1#) (|List| 152)
              (|Union| 10 '"failed") (|CardinalNumber|) (|Fraction| 53)
              (|Union| 149 '#2="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 160 '#2#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 149) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 314 |zero?| 320 |unitNormal| 325 |unitCanonical| 330 |unit?|
              335 |transcendent?| 340 |transcendenceDegree| 345 |trace| 349
              |tableForDiscreteLogarithm| 360 |subtractIfCan| 365
              |squareFreePolynomial| 371 |squareFreePart| 376 |squareFree| 381
              |solveLinearPolynomialEquation| 386 |smaller?| 392 |sizeLess?|
              398 |size| 404 |sample| 408 |rightRecip| 412 |rightPower| 417
              |retractIfCan| 429 |retract| 434 |represents| 439
              |representationType| 444 |rem| 448 |recip| 454 |random| 459 |quo|
              463 |principalIdeal| 469 |primitiveElement| 474 |primitive?| 478
              |primeFrobenius| 483 |prime?| 494 |order| 499 |opposite?| 509
              |one?| 515 |normalElement| 520 |normal?| 524 |norm| 529
              |nextItem| 540 |multiEuclidean| 545 |minimalPolynomial| 551
              |lookup| 562 |linearAssociatedOrder| 567 |linearAssociatedLog|
              572 |linearAssociatedExp| 583 |leftRecip| 589 |leftPower| 594
              |lcmCoef| 606 |lcm| 612 |latex| 623 |inv| 628 |init| 633 |index|
              637 |inGroundField?| 642 |hashUpdate!| 647 |hash| 653 |generator|
              658 |gcdPolynomial| 662 |gcd| 668 |factorsOfCyclicGroupSize| 679
              |factorSquareFreePolynomial| 683 |factorPolynomial| 688 |factor|
              693 |extensionDegree| 698 |extendedEuclidean| 706 |exquo| 719
              |expressIdealMember| 725 |euclideanSize| 731 |enumerate| 736
              |divide| 740 |discreteLog| 746 |dimension| 757 |differentiate|
              761 |degree| 772 |definingPolynomial| 782
              |createPrimitiveElement| 786 |createNormalElement| 790
              |coordinates| 794 |convert| 804 |conditionP| 809 |commutator| 814
              |coerce| 820 |charthRoot| 845 |characteristic| 855 |basis| 859
              |associator| 868 |associates?| 875 |antiCommutator| 881
              |annihilate?| 887 |algebraic?| 893 ^ 898 |Zero| 916 |One| 920
              |Frobenius| 924 D 935 = 946 / 952 - 964 + 975 * 981)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 2 3 0 0 2 0 0 0 0 0 0 0 0 0 0 3 1 2 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 2 0 0 2 2 0 0 0 0 0 0 0 0 0 2))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |ExtensionField&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL |DivisionRing&|
                NIL NIL |Algebra&| |EntireRing&| |Algebra&| NIL NIL
                |DifferentialRing&| NIL |VectorSpace&| |Rng&| NIL |Module&|
                |Module&| |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL
                NIL NIL NIL NIL |NonAssociativeRng&| NIL |AbelianGroup&| NIL
                NIL NIL NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| |Finite&| |Magma&| |AbelianSemiGroup&| NIL NIL
                |SetCategory&| |RetractableTo&| NIL NIL NIL NIL NIL
                |BasicType&| NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| 6) (|ExtensionField| 6)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 157) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|) (|Ring|) (|VectorSpace| 6) (|Rng|)
                 (|SemiRing|) (|Module| 6) (|Module| 157) (|Module| $$)
                 (|SemiRng|) (|BiModule| 6 6) (|BiModule| 157 157)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|RightModule| 6)
                 (|LeftModule| 6) (|RightModule| 157) (|LeftModule| 157)
                 (|LeftModule| $$) (|NonAssociativeRng|) (|RightModule| $$)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Finite|)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|SetCategory|) (|RetractableTo| 6) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 15)
                 (|ConvertibleTo| 150))
              (|makeByteWordVec2| 168
                                  '(1 10 9 0 11 0 13 0 14 1 13 15 0 16 0 6 9 18
                                    2 9 0 0 19 20 0 27 0 28 0 10 0 30 0 6 0 32
                                    2 10 0 6 9 33 1 8 0 10 34 1 8 10 0 36 2 10
                                    6 0 0 37 2 9 39 0 0 40 2 0 0 0 19 42 2 0 0
                                    0 9 43 1 45 0 44 46 2 49 0 9 9 50 3 49 0 0
                                    53 51 54 0 8 19 56 1 49 9 0 57 1 49 59 0 60
                                    2 51 6 0 53 61 2 10 0 0 0 62 0 10 0 63 1 51
                                    65 0 66 1 0 0 0 67 2 68 0 0 65 69 1 49 0 68
                                    70 0 71 19 72 2 8 0 6 0 74 2 8 0 53 0 76 1
                                    8 0 0 78 0 8 0 80 1 8 51 0 82 1 8 0 51 83 1
                                    8 0 6 85 1 8 6 0 88 1 8 90 0 91 1 8 0 19 93
                                    1 8 19 0 95 2 8 0 0 0 97 2 8 0 0 0 100 2 8
                                    0 0 0 101 2 8 0 0 0 103 2 8 39 0 0 105 0 8
                                    47 107 0 8 0 109 0 8 0 111 2 27 117 19 0
                                    118 1 53 122 0 123 1 124 113 0 125 0 0 0
                                    126 0 127 0 128 2 0 0 0 53 129 0 119 0 130
                                    2 119 0 131 0 132 1 119 0 0 133 2 27 0 134
                                    0 135 2 10 15 0 15 136 2 90 39 0 0 140 0 6
                                    9 142 2 0 39 0 0 1 1 0 39 0 1 1 0 165 0 1 1
                                    0 0 0 1 1 0 39 0 1 1 0 39 0 1 0 0 9 1 2 2 0
                                    0 19 1 1 0 6 0 1 1 2 119 53 120 2 0 147 0 0
                                    1 1 2 151 152 1 1 0 0 0 1 1 0 122 0 1 2 2
                                    153 154 152 1 2 2 39 0 0 1 2 0 39 0 0 1 0 2
                                    9 139 0 0 0 1 1 0 147 0 1 2 0 0 0 9 1 2 0 0
                                    0 19 1 1 0 90 0 92 1 0 6 0 89 1 0 0 51 84 0
                                    2 115 116 2 0 0 0 0 1 1 0 147 0 1 0 2 0 81
                                    2 0 0 0 0 1 1 0 163 149 1 0 2 0 41 1 2 39 0
                                    1 1 3 0 0 1 2 3 0 0 9 1 1 0 39 0 1 1 3 146
                                    0 1 1 2 19 0 1 2 0 39 0 0 1 1 0 39 0 1 0 2
                                    0 121 1 2 39 0 73 2 2 0 0 19 42 1 0 6 0 38
                                    1 2 147 0 1 2 0 158 149 0 1 2 2 152 0 19 1
                                    1 0 10 0 64 1 2 19 0 96 1 2 10 0 1 1 2 10 0
                                    1 2 2 155 0 0 1 2 2 0 0 10 1 1 0 147 0 1 2
                                    0 0 0 9 1 2 0 0 0 19 1 2 0 164 0 0 1 1 0 0
                                    149 1 2 0 0 0 0 1 1 0 166 0 1 1 0 0 0 1 0 2
                                    0 1 1 2 0 19 94 1 0 39 0 141 2 0 168 168 0
                                    1 1 0 167 0 1 0 2 0 35 2 0 152 152 152 1 1
                                    0 0 149 1 2 0 0 0 0 1 0 2 113 114 1 2 151
                                    152 1 1 2 151 152 1 1 0 122 0 1 0 0 19 138
                                    0 0 146 1 2 0 159 0 0 1 3 0 161 0 0 0 1 2 0
                                    147 0 0 1 2 0 158 149 0 1 1 0 9 0 1 0 2 149
                                    1 2 0 162 0 0 1 2 3 148 0 0 1 1 2 9 0 1 0 0
                                    156 1 2 2 0 0 9 1 1 2 0 0 1 1 0 19 0 58 1 0
                                    146 0 1 0 0 10 87 0 2 0 126 0 2 0 1 1 0 49
                                    47 1 1 0 51 0 52 1 2 150 0 1 1 4 144 145 1
                                    2 0 0 0 0 1 1 0 0 6 86 1 0 0 157 1 1 0 0 0
                                    1 1 0 0 53 1 1 0 15 0 137 1 3 147 0 1 1 2 0
                                    0 1 0 0 9 143 1 0 47 19 48 0 0 47 108 3 0 0
                                    0 0 0 1 2 0 39 0 0 1 2 0 0 0 0 1 2 0 39 0 0
                                    1 1 0 39 0 1 2 0 0 0 53 129 2 0 0 0 9 43 2
                                    0 0 0 19 1 0 0 0 110 0 0 0 31 2 2 0 0 9 1 1
                                    2 0 0 67 2 2 0 0 9 1 1 2 0 0 1 2 0 39 0 0
                                    106 2 0 0 0 6 99 2 0 0 0 0 98 1 0 0 0 79 2
                                    0 0 0 0 104 2 0 0 0 0 102 2 0 0 6 0 75 2 0
                                    0 0 6 1 2 0 0 157 0 1 2 0 0 0 157 1 2 0 0 9
                                    0 1 2 0 0 53 0 77 2 0 0 0 0 55 2 0 0 19 0
                                    1)))))
           '|lookupComplete|)) 
