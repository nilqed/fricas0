
(SDEFUN |FFP;generator;$;1| (($ $))
        (SPADCALL (SPADCALL (|spadConstant| $ 30) 1 (QREFELT $ 31))
                  (QREFELT $ 32))) 

(SDEFUN |FFP;norm;$GF;2| ((|x| $) ($ GF))
        (SPADCALL (QREFELT $ 7) (SPADCALL |x| (QREFELT $ 34)) (QREFELT $ 35))) 

(SDEFUN |FFP;basis;PiV;3| ((|n| |PositiveInteger|) ($ |Vector| $))
        (SPROG ((#1=#:G392 NIL) (|i| NIL) (#2=#:G391 NIL) (|a| ($)))
               (SEQ
                (COND
                 ((SPADCALL (REM (QREFELT $ 12) |n|) 0 (QREFELT $ 38))
                  (|error| "argument must divide extension degree"))
                 ('T
                  (SEQ
                   (LETT |a|
                         (SPADCALL (SPADCALL (QREFELT $ 39)) |n|
                                   (QREFELT $ 41)))
                   (EXIT
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |a| |i| (QREFELT $ 42))
                                         #2#))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 45))))))))) 

(SDEFUN |FFP;degree;$Pi;4| ((|x| $) ($ |PositiveInteger|))
        (SPROG
         ((#1=#:G395 NIL) (|y| ($)) (#2=#:G398 NIL) (|i| NIL)
          (|m| (|Matrix| GF)))
         (SEQ (LETT |y| (|spadConstant| $ 29))
              (LETT |m|
                    (SPADCALL (QREFELT $ 12) (+ (QREFELT $ 12) 1)
                              (QREFELT $ 49)))
              (SEQ (LETT |i| 1) (LETT #2# (+ (QREFELT $ 12) 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (SPADCALL |m| |i| (SPADCALL |y| (QREFELT $ 51))
                              (QREFELT $ 53))
                    (EXIT (LETT |y| (SPADCALL |y| |x| (QREFELT $ 54)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROG1 (LETT #1# (SPADCALL |m| (QREFELT $ 56)))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))))) 

(SDEFUN |FFP;minimalPolynomial;$Sup;5|
        ((|x| $) ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((#1=#:G402 NIL) (#2=#:G401 #3=(|SparseUnivariatePolynomial| GF))
          (#4=#:G403 #3#) (#5=#:G407 NIL) (|i| NIL) (|v| (|Vector| GF))
          (|y| ($)) (#6=#:G406 NIL) (|m| (|Matrix| GF)))
         (SEQ (LETT |y| (|spadConstant| $ 29))
              (LETT |m|
                    (SPADCALL (QREFELT $ 12) (+ (QREFELT $ 12) 1)
                              (QREFELT $ 49)))
              (SEQ (LETT |i| 1) (LETT #6# (+ (QREFELT $ 12) 1)) G190
                   (COND ((|greater_SI| |i| #6#) (GO G191)))
                   (SEQ
                    (SPADCALL |m| |i| (SPADCALL |y| (QREFELT $ 51))
                              (QREFELT $ 53))
                    (EXIT (LETT |y| (SPADCALL |y| |x| (QREFELT $ 54)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |v| (|SPADfirst| (SPADCALL |m| (QREFELT $ 59))))
              (EXIT
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |i| 0) (LETT #5# (QREFELT $ 12)) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #4#
                              (SPADCALL (SPADCALL |v| (+ |i| 1) (QREFELT $ 60))
                                        |i| (QREFELT $ 31)))
                        (COND
                         (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 61))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) ('T (|spadConstant| $ 62)))))))) 

(SDEFUN |FFP;normal?;$B;6| ((|x| $) ($ |Boolean|))
        (SPROG ((|l| (|List| (|List| GF))) (|a| ($)) (#1=#:G412 NIL) (|i| NIL))
               (SEQ
                (LETT |l|
                      (LIST
                       (SPADCALL (SPADCALL |x| (QREFELT $ 51))
                                 (QREFELT $ 65))))
                (LETT |a| |x|)
                (SEQ (LETT |i| 2) (LETT #1# (QREFELT $ 12)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (LETT |a| (SPADCALL |a| (QREFELT $ 66)))
                          (EXIT
                           (LETT |l|
                                 (SPADCALL |l|
                                           (SPADCALL
                                            (SPADCALL |a| (QREFELT $ 51))
                                            (QREFELT $ 65))
                                           (QREFELT $ 68)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((EQL (SPADCALL (SPADCALL |l| (QREFELT $ 69)) (QREFELT $ 56))
                        (QREFELT $ 12))
                   'T)
                  ('T NIL)))))) 

(SDEFUN |FFP;*;GF2$;7| ((|a| GF) (|x| $) ($ $))
        (SPADCALL |a| |x| (QREFELT $ 73))) 

(SDEFUN |FFP;*;I2$;8| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |n| |x| (QREFELT $ 75))) 

(SDEFUN |FFP;-;2$;9| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 77))) 

(SDEFUN |FFP;random;$;10| (($ $)) (SPADCALL (QREFELT $ 79))) 

(SDEFUN |FFP;coordinates;$V;11| ((|x| $) ($ |Vector| GF))
        (SPADCALL |x| (QREFELT $ 81))) 

(SDEFUN |FFP;represents;V$;12| ((|v| |Vector| GF) ($ $))
        (SPADCALL |v| (QREFELT $ 82))) 

(SDEFUN |FFP;coerce;GF$;13| ((|x| GF) ($ $)) (SPADCALL |x| (QREFELT $ 84))) 

(SDEFUN |FFP;definingPolynomial;Sup;14| (($ |SparseUnivariatePolynomial| GF))
        (QREFELT $ 7)) 

(SDEFUN |FFP;retract;$GF;15| ((|x| $) ($ GF)) (SPADCALL |x| (QREFELT $ 87))) 

(SDEFUN |FFP;retractIfCan;$U;16| ((|x| $) ($ |Union| GF "failed"))
        (SPADCALL |x| (QREFELT $ 90))) 

(SDEFUN |FFP;index;Pi$;17| ((|x| |PositiveInteger|) ($ $))
        (SPADCALL |x| (QREFELT $ 92))) 

(SDEFUN |FFP;lookup;$Pi;18| ((|x| $) ($ |PositiveInteger|))
        (SPADCALL |x| (QREFELT $ 94))) 

(SDEFUN |FFP;/;3$;19| ((|x| $) (|y| $) ($ $)) (SPADCALL |x| |y| (QREFELT $ 96))) 

(SDEFUN |FFP;/;$GF$;20| ((|x| $) (|a| GF) ($ $))
        (SPADCALL |x| (SPADCALL |a| (QREFELT $ 85)) (QREFELT $ 97))) 

(SDEFUN |FFP;*;3$;21| ((|x| $) (|y| $) ($ $)) (SPADCALL |x| |y| (QREFELT $ 99))) 

(SDEFUN |FFP;+;3$;22| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 100))) 

(SDEFUN |FFP;-;3$;23| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 102))) 

(SDEFUN |FFP;=;2$B;24| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 104))) 

(SDEFUN |FFP;basis;V;25| (($ |Vector| $)) (SPADCALL (QREFELT $ 106))) 

(SDEFUN |FFP;Zero;$;26| (($ $)) (|spadConstant| $ 108)) 

(SDEFUN |FFP;One;$;27| (($ $)) (|spadConstant| $ 110)) 

(SDEFUN |FFP;factorsOfCyclicGroupSize;L;28|
        (($ |List|
          (|Record| (|:| |factor| (|Integer|))
                    (|:| |exponent| (|NonNegativeInteger|)))))
        (SEQ (COND ((NULL (QREFELT $ 20)) (|FFP;initializeElt| $)))
             (EXIT (QREFELT $ 20)))) 

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
          (#1=#:G454 NIL))
         (SEQ (COND ((QREFELT $ 23) (|FFP;initializeLog| $)))
              (LETT |tbl|
                    (SPADCALL
                     (PROG1 (LETT #1# |fac|)
                       (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                         '(|Integer|) #1#))
                     (QREFELT $ 27) (QREFELT $ 117)))
              (EXIT
               (COND
                ((QEQCAR |tbl| 1)
                 (|error|
                  "tableForDiscreteLogarithm: argument must be prime divisor of the order of the multiplicative group"))
                ('T (QCDR |tbl|))))))) 

(SDEFUN |FFP;primitiveElement;$;31| (($ $))
        (SEQ (COND ((QREFELT $ 24) (|FFP;initializeElt| $)))
             (EXIT (SPADCALL (QREFELT $ 22) (QREFELT $ 93))))) 

(SDEFUN |FFP;normalElement;$;32| (($ $))
        (SEQ (COND ((QREFELT $ 24) (|FFP;initializeElt| $)))
             (EXIT (SPADCALL (QREFELT $ 21) (QREFELT $ 93))))) 

(SDEFUN |FFP;initializeElt| (($ |Void|))
        (SPROG ((|nElt| ($)) (|pE| ($)))
               (SEQ
                (SETELT $ 20
                        (SPADCALL (SPADCALL (QREFELT $ 19) (QREFELT $ 122))
                                  (QREFELT $ 124)))
                (LETT |pE| (SPADCALL (QREFELT $ 125)))
                (SETELT $ 22 (SPADCALL |pE| (QREFELT $ 95)))
                (LETT |nElt| (SPADCALL (QREFELT $ 33)))
                (SEQ G190
                     (COND
                      ((NULL (NULL (SPADCALL |nElt| (QREFELT $ 72))))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |nElt| (SPADCALL |nElt| |pE| (QREFELT $ 54)))))
                     NIL (GO G190) G191 (EXIT NIL))
                (SETELT $ 21 (SPADCALL |nElt| (QREFELT $ 95)))
                (SETELT $ 24 NIL) (EXIT (SPADCALL (QREFELT $ 127)))))) 

(SDEFUN |FFP;initializeLog| (($ |Void|))
        (SPROG
         ((#1=#:G476 NIL) (|a| ($)) (#2=#:G482 NIL) (#3=#:G470 NIL) (|i| NIL)
          (|tbl| (|Table| (|PositiveInteger|) (|NonNegativeInteger|)))
          (|n| (|Integer|)) (|d| (|Integer|)) (|l| (|Integer|)) (|base| ($))
          (|fac| (|Integer|)) (#4=#:G481 NIL) (|f| NIL) (|limit| (|Integer|)))
         (SEQ (COND ((QREFELT $ 24) (|FFP;initializeElt| $))) (LETT |limit| 30)
              (SEQ (LETT |f| NIL) (LETT #4# (QREFELT $ 20)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |fac| (QCAR |f|))
                        (LETT |base|
                              (SPADCALL (SPADCALL (QREFELT $ 39))
                                        (QUOTIENT2 (QREFELT $ 19) |fac|)
                                        (QREFELT $ 128)))
                        (LETT |l| (INTEGER-LENGTH |fac|)) (LETT |n| 0)
                        (COND
                         ((ODDP |l|)
                          (LETT |n| (ASH |fac| (- (QUOTIENT2 |l| 2)))))
                         ('T (LETT |n| (ASH 1 (QUOTIENT2 |l| 2)))))
                        (COND
                         ((< |n| |limit|)
                          (SEQ (LETT |d| (+ (QUOTIENT2 (- |fac| 1) |limit|) 1))
                               (EXIT
                                (LETT |n|
                                      (+ (QUOTIENT2 (- |fac| 1) |d|) 1))))))
                        (LETT |tbl| (SPADCALL (QREFELT $ 129)))
                        (LETT |a| (|spadConstant| $ 29))
                        (SEQ (LETT |i| 0)
                             (LETT #2#
                                   (PROG1 (LETT #3# (- |n| 1))
                                     (|check_subtype2| (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#)))
                             G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (SPADCALL
                               (CONS (SPADCALL |a| (QREFELT $ 95)) |i|) |tbl|
                               (QREFELT $ 131))
                              (EXIT
                               (LETT |a|
                                     (SPADCALL |a| |base| (QREFELT $ 54)))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SPADCALL
                          (CONS
                           (PROG1 (LETT #1# |fac|)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|Integer|) #1#))
                           (SPADCALL |tbl| (QREFELT $ 132)))
                          (QREFELT $ 27) (QREFELT $ 134))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (SETELT $ 23 NIL) (EXIT (SPADCALL (QREFELT $ 127)))))) 

(SDEFUN |FFP;coerce;$Of;35| ((|e| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL |e| (QREFELT $ 34)) (QREFELT $ 17) (QREFELT $ 135))) 

(SDEFUN |FFP;extensionDegree;Pi;36| (($ |PositiveInteger|)) (QREFELT $ 12)) 

(SDEFUN |FFP;size;Nni;37| (($ |NonNegativeInteger|)) (+ (QREFELT $ 19) 1)) 

(SDEFUN |FFP;inGroundField?;$B;38| ((|x| $) ($ |Boolean|))
        (NULL
         (SPADCALL (SPADCALL |x| (QREFELT $ 91)) (CONS 1 "failed")
                   (QREFELT $ 139)))) 

(SDEFUN |FFP;characteristic;Nni;39| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 141))) 

(DECLAIM (NOTINLINE |FiniteFieldExtensionByPolynomial;|)) 

(DEFUN |FiniteFieldExtensionByPolynomial| (&REST #1=#:G520)
  (SPROG NIL
         (PROG (#2=#:G521)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldExtensionByPolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |FiniteFieldExtensionByPolynomial;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldExtensionByPolynomial|)))))))))) 

(DEFUN |FiniteFieldExtensionByPolynomial;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G519 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|FiniteFieldExtensionByPolynomial| DV$1 DV$2))
    (LETT $ (GETREFV 168))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #1#
                                              (|HasCategory| |#1| '(|Finite|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         #1#)))))
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
    (QSETREFV $ 19 (- (EXPT (SPADCALL (QREFELT $ 18)) (QREFELT $ 12)) 1))
    (QSETREFV $ 20 NIL)
    (QSETREFV $ 21 1)
    (QSETREFV $ 22 1)
    (QSETREFV $ 23 'T)
    (QSETREFV $ 24 'T)
    (QSETREFV $ 27 (SPADCALL (QREFELT $ 26)))
    $))) 

(MAKEPROP '|FiniteFieldExtensionByPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 6)
              (0 . |degree|) '|extdeg| (|Symbol|) (5 . |new|) (|OutputForm|)
              (9 . |coerce|) '|alpha| (14 . |size|) '|sizeCG| '|facOfGroupSize|
              '|normalElt| '|primitiveElt| '|initlog?| '|initelt?|
              (|Table| 40 118) (18 . |table|) '|discLogTable| (22 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FFP;One;$;27|) $))
              (26 . |One|) (30 . |monomial|) (36 . |reduce|)
              |FFP;generator;$;1| (41 . |lift|) (46 . |resultant|)
              |FFP;norm;$GF;2| (|Boolean|) (52 . ~=)
              |FFP;primitiveElement;$;31| (|PositiveInteger|) (58 . |norm|)
              (64 . ^) (|List| $$) (|Vector| $$) (70 . |vector|) (|Vector| $)
              |FFP;basis;PiV;3| (|Matrix| 6) (75 . |zero|) (|Vector| 6)
              |FFP;coordinates;$V;11| (|Integer|) (81 . |setColumn!|)
              |FFP;*;3$;21| (88 . |rank|) (92 . |rank|) |FFP;degree;$Pi;4|
              (|List| 50) (97 . |nullSpace|) (102 . |elt|) (108 . +)
              (114 . |Zero|) |FFP;minimalPolynomial;$Sup;5| (|List| 6)
              (118 . |entries|) (123 . |Frobenius|) (|List| 64)
              (128 . |concat|) (134 . |matrix|)
              (|SimpleAlgebraicExtension| 6 10 (NRTEVAL (QREFELT $ 7)))
              (139 . |rank|) |FFP;normal?;$B;6| (143 . *) |FFP;*;GF2$;7|
              (149 . *) |FFP;*;I2$;8| (155 . -) |FFP;-;2$;9| (160 . |random|)
              |FFP;random;$;10| (164 . |coordinates|) (169 . |represents|)
              |FFP;represents;V$;12| (174 . |coerce|) |FFP;coerce;GF$;13|
              |FFP;definingPolynomial;Sup;14| (179 . |retract|)
              |FFP;retract;$GF;15| (|Union| 6 '"failed") (184 . |retractIfCan|)
              |FFP;retractIfCan;$U;16| (189 . |index|) |FFP;index;Pi$;17|
              (194 . |lookup|) |FFP;lookup;$Pi;18| (199 . /) |FFP;/;3$;19|
              |FFP;/;$GF$;20| (205 . *) (211 . +) |FFP;+;3$;22| (217 . -)
              |FFP;-;3$;23| (223 . =) |FFP;=;2$B;24| (229 . |basis|)
              |FFP;basis;V;25| (233 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FFP;Zero;$;26|) $))
              (237 . |One|) (|Record| (|:| |factor| 52) (|:| |exponent| 9))
              (|List| 111) |FFP;factorsOfCyclicGroupSize;L;28|
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              |FFP;representationType;U;29| (|Union| 118 '"failed")
              (241 . |search|) (|Table| 40 9)
              |FFP;tableForDiscreteLogarithm;IT;30| |FFP;normalElement;$;32|
              (|Factored| $) (247 . |factor|) (|Factored| 52) (252 . |factors|)
              (257 . |createPrimitiveElement|) (|Void|) (261 . |void|)
              (265 . ^) (271 . |table|)
              (|Record| (|:| |key| 40) (|:| |entry| 9)) (275 . |insert!|)
              (281 . |copy|) (|Record| (|:| |key| 40) (|:| |entry| 118))
              (286 . |insert!|) (292 . |outputForm|) |FFP;coerce;$Of;35|
              |FFP;extensionDegree;Pi;36| |FFP;size;Nni;37| (298 . =)
              |FFP;inGroundField?;$B;38| (304 . |characteristic|)
              |FFP;characteristic;Nni;39| (|Union| 46 '#1="failed")
              (|Matrix| $) (|OnePointCompletion| 40) (|Union| $ '"failed")
              (|Union| 9 '"failed") (|List| $) (|InputForm|) (|Factored| 151)
              (|SparseUnivariatePolynomial| $) (|Union| 153 '#1#) (|List| 151)
              (|Union| 10 '"failed") (|CardinalNumber|) (|Fraction| 52)
              (|Union| 148 '#2="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 159 '#2#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 148) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 308 |zero?| 314 |unitNormal| 319 |unitCanonical| 324 |unit?|
              329 |transcendent?| 334 |transcendenceDegree| 339 |trace| 343
              |tableForDiscreteLogarithm| 354 |subtractIfCan| 359
              |squareFreePolynomial| 365 |squareFreePart| 370 |squareFree| 375
              |solveLinearPolynomialEquation| 380 |smaller?| 386 |sizeLess?|
              392 |size| 398 |sample| 402 |rightRecip| 406 |rightPower| 411
              |retractIfCan| 423 |retract| 428 |represents| 433
              |representationType| 438 |rem| 442 |recip| 448 |random| 453 |quo|
              457 |principalIdeal| 463 |primitiveElement| 468 |primitive?| 472
              |primeFrobenius| 477 |prime?| 488 |order| 493 |opposite?| 503
              |one?| 509 |normalElement| 514 |normal?| 518 |norm| 523
              |nextItem| 534 |multiEuclidean| 539 |minimalPolynomial| 545
              |lookup| 556 |linearAssociatedOrder| 561 |linearAssociatedLog|
              566 |linearAssociatedExp| 577 |leftRecip| 583 |leftPower| 588
              |lcmCoef| 600 |lcm| 606 |latex| 617 |inv| 622 |init| 627 |index|
              631 |inGroundField?| 636 |hashUpdate!| 641 |hash| 647 |generator|
              652 |gcdPolynomial| 656 |gcd| 662 |factorsOfCyclicGroupSize| 673
              |factorSquareFreePolynomial| 677 |factorPolynomial| 682 |factor|
              687 |extensionDegree| 692 |extendedEuclidean| 700 |exquo| 713
              |expressIdealMember| 719 |euclideanSize| 725 |enumerate| 730
              |divide| 734 |discreteLog| 740 |dimension| 751 |differentiate|
              755 |degree| 766 |definingPolynomial| 776
              |createPrimitiveElement| 780 |createNormalElement| 784
              |coordinates| 788 |convert| 798 |conditionP| 803 |commutator| 808
              |coerce| 814 |charthRoot| 839 |characteristic| 849 |basis| 853
              |associator| 862 |associates?| 869 |antiCommutator| 875
              |annihilate?| 881 |algebraic?| 887 ^ 892 |Zero| 910 |One| 914
              |Frobenius| 918 D 929 = 940 / 946 - 958 + 969 * 975)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 2 3 0 0 2 0 0 0 0 0 0 0 0 0 0 3 1 2 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 2 0 0 2 2 0 0 0 0 0 0 0 0 0 0 2))
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
                NIL |SetCategory&| |RetractableTo&| NIL NIL NIL NIL NIL
                |BasicType&| NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| 6) (|ExtensionField| 6)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 156) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|) (|Ring|) (|VectorSpace| 6) (|Rng|)
                 (|SemiRing|) (|Module| 6) (|Module| 156) (|Module| $$)
                 (|SemiRng|) (|BiModule| 6 6) (|BiModule| 156 156)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|RightModule| 6)
                 (|LeftModule| 6) (|RightModule| 156) (|LeftModule| 156)
                 (|LeftModule| $$) (|NonAssociativeRng|) (|RightModule| $$)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Finite|)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|CommutativeStar|) (|SetCategory|) (|RetractableTo| 6)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 15) (|ConvertibleTo| 149))
              (|makeByteWordVec2| 167
                                  '(1 10 9 0 11 0 13 0 14 1 13 15 0 16 0 6 9 18
                                    0 25 0 26 0 10 0 28 0 6 0 30 2 10 0 6 9 31
                                    1 8 0 10 32 1 8 10 0 34 2 10 6 0 0 35 2 9
                                    37 0 0 38 2 0 0 0 40 41 2 0 0 0 9 42 1 44 0
                                    43 45 2 48 0 9 9 49 3 48 0 0 52 50 53 0 8
                                    40 55 1 48 9 0 56 1 48 58 0 59 2 50 6 0 52
                                    60 2 10 0 0 0 61 0 10 0 62 1 50 64 0 65 1 0
                                    0 0 66 2 67 0 0 64 68 1 48 0 67 69 0 70 40
                                    71 2 8 0 6 0 73 2 8 0 52 0 75 1 8 0 0 77 0
                                    8 0 79 1 8 50 0 81 1 8 0 50 82 1 8 0 6 84 1
                                    8 6 0 87 1 8 89 0 90 1 8 0 40 92 1 8 40 0
                                    94 2 8 0 0 0 96 2 8 0 0 0 99 2 8 0 0 0 100
                                    2 8 0 0 0 102 2 8 37 0 0 104 0 8 46 106 0 8
                                    0 108 0 8 0 110 2 25 116 40 0 117 1 52 121
                                    0 122 1 123 112 0 124 0 0 0 125 0 126 0 127
                                    2 0 0 0 52 128 0 118 0 129 2 118 0 130 0
                                    131 1 118 0 0 132 2 25 0 133 0 134 2 10 15
                                    0 15 135 2 89 37 0 0 139 0 6 9 141 2 0 37 0
                                    0 1 1 0 37 0 1 1 0 164 0 1 1 0 0 0 1 1 0 37
                                    0 1 1 0 37 0 1 0 0 9 1 2 2 0 0 40 1 1 0 6 0
                                    1 1 2 118 52 119 2 0 146 0 0 1 1 2 150 151
                                    1 1 0 0 0 1 1 0 121 0 1 2 2 152 153 151 1 2
                                    2 37 0 0 1 2 0 37 0 0 1 0 2 9 138 0 0 0 1 1
                                    0 146 0 1 2 0 0 0 9 1 2 0 0 0 40 1 1 0 89 0
                                    91 1 0 6 0 88 1 0 0 50 83 0 2 114 115 2 0 0
                                    0 0 1 1 0 146 0 1 0 2 0 80 2 0 0 0 0 1 1 0
                                    162 148 1 0 2 0 39 1 2 37 0 1 1 3 0 0 1 2 3
                                    0 0 9 1 1 0 37 0 1 1 3 145 0 1 1 2 40 0 1 2
                                    0 37 0 0 1 1 0 37 0 1 0 2 0 120 1 2 37 0 72
                                    2 2 0 0 40 41 1 0 6 0 36 1 2 146 0 1 2 0
                                    157 148 0 1 2 2 151 0 40 1 1 0 10 0 63 1 2
                                    40 0 95 1 2 10 0 1 1 2 10 0 1 2 2 154 0 0 1
                                    2 2 0 0 10 1 1 0 146 0 1 2 0 0 0 9 1 2 0 0
                                    0 40 1 2 0 163 0 0 1 1 0 0 148 1 2 0 0 0 0
                                    1 1 0 165 0 1 1 0 0 0 1 0 2 0 1 1 2 0 40 93
                                    1 0 37 0 140 2 0 167 167 0 1 1 0 166 0 1 0
                                    2 0 33 2 0 151 151 151 1 1 0 0 148 1 2 0 0
                                    0 0 1 0 2 112 113 1 2 150 151 1 1 2 150 151
                                    1 1 0 121 0 1 0 0 40 137 0 0 145 1 2 0 158
                                    0 0 1 3 0 160 0 0 0 1 2 0 146 0 0 1 2 0 157
                                    148 0 1 1 0 9 0 1 0 2 148 1 2 0 161 0 0 1 2
                                    3 147 0 0 1 1 2 9 0 1 0 0 155 1 2 2 0 0 9 1
                                    1 2 0 0 1 1 0 40 0 57 1 0 145 0 1 0 0 10 86
                                    0 2 0 125 0 2 0 1 1 0 48 46 1 1 0 50 0 51 1
                                    2 149 0 1 1 4 143 144 1 2 0 0 0 0 1 1 0 0 6
                                    85 1 0 0 156 1 1 0 0 0 1 1 0 0 52 1 1 0 15
                                    0 136 1 3 146 0 1 1 2 0 0 1 0 0 9 142 1 0
                                    46 40 47 0 0 46 107 3 0 0 0 0 0 1 2 0 37 0
                                    0 1 2 0 0 0 0 1 2 0 37 0 0 1 1 0 37 0 1 2 0
                                    0 0 52 128 2 0 0 0 9 42 2 0 0 0 40 1 0 0 0
                                    109 0 0 0 29 2 2 0 0 9 1 1 2 0 0 66 2 2 0 0
                                    9 1 1 2 0 0 1 2 0 37 0 0 105 2 0 0 0 6 98 2
                                    0 0 0 0 97 1 0 0 0 78 2 0 0 0 0 103 2 0 0 0
                                    0 101 2 0 0 6 0 74 2 0 0 0 6 1 2 0 0 156 0
                                    1 2 0 0 0 156 1 2 0 0 9 0 1 2 0 0 52 0 76 2
                                    0 0 0 0 54 2 0 0 40 0 1)))))
           '|lookupComplete|)) 
