
(SDEFUN |FFP;generator;%;1| ((% (%)))
        (SPADCALL (SPADCALL (|spadConstant| % 30) 1 (QREFELT % 31))
                  (QREFELT % 32))) 

(SDEFUN |FFP;norm;%GF;2| ((|x| (%)) (% (GF)))
        (SPADCALL (QREFELT % 7) (SPADCALL |x| (QREFELT % 34)) (QREFELT % 35))) 

(SDEFUN |FFP;basis;PiV;3| ((|n| (|PositiveInteger|)) (% (|Vector| %)))
        (SPROG ((#1=#:G15 NIL) (|i| NIL) (#2=#:G14 NIL) (|a| (%)))
               (SEQ
                (COND
                 ((SPADCALL (REM (QREFELT % 12) |n|) 0 (QREFELT % 38))
                  (|error| "argument must divide extension degree"))
                 ('T
                  (SEQ
                   (LETT |a|
                         (SPADCALL (SPADCALL (QREFELT % 39)) |n|
                                   (QREFELT % 41)))
                   (EXIT
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |a| |i| (QREFELT % 42))
                                         #2#))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT % 45))))))))) 

(SDEFUN |FFP;degree;%Pi;4| ((|x| (%)) (% (|PositiveInteger|)))
        (SPROG
         ((#1=#:G19 NIL) (|y| (%)) (#2=#:G22 NIL) (|i| NIL)
          (|m| (|Matrix| GF)))
         (SEQ (LETT |y| (|spadConstant| % 29))
              (LETT |m|
                    (SPADCALL (QREFELT % 12) (+ (QREFELT % 12) 1)
                              (QREFELT % 49)))
              (SEQ (LETT |i| 1) (LETT #2# (+ (QREFELT % 12) 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (SPADCALL |m| |i| (SPADCALL |y| (QREFELT % 51))
                              (QREFELT % 53))
                    (EXIT (LETT |y| (SPADCALL |y| |x| (QREFELT % 54)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROG1 (LETT #1# (SPADCALL |m| (QREFELT % 56)))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))))) 

(SDEFUN |FFP;minimalPolynomial;%Sup;5|
        ((|x| (%)) (% (|SparseUnivariatePolynomial| GF)))
        (SPROG
         ((#1=#:G27 NIL) (#2=#:G26 #3=(|SparseUnivariatePolynomial| GF))
          (#4=#:G28 #3#) (#5=#:G32 NIL) (|i| NIL) (|v| (|Vector| GF)) (|y| (%))
          (#6=#:G31 NIL) (|m| (|Matrix| GF)))
         (SEQ (LETT |y| (|spadConstant| % 29))
              (LETT |m|
                    (SPADCALL (QREFELT % 12) (+ (QREFELT % 12) 1)
                              (QREFELT % 49)))
              (SEQ (LETT |i| 1) (LETT #6# (+ (QREFELT % 12) 1)) G190
                   (COND ((|greater_SI| |i| #6#) (GO G191)))
                   (SEQ
                    (SPADCALL |m| |i| (SPADCALL |y| (QREFELT % 51))
                              (QREFELT % 53))
                    (EXIT (LETT |y| (SPADCALL |y| |x| (QREFELT % 54)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |v| (|SPADfirst| (SPADCALL |m| (QREFELT % 59))))
              (EXIT
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |i| 0) (LETT #5# (QREFELT % 12)) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #4#
                              (SPADCALL (SPADCALL |v| (+ |i| 1) (QREFELT % 60))
                                        |i| (QREFELT % 31)))
                        (COND
                         (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT % 61))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) ('T (|spadConstant| % 62)))))))) 

(SDEFUN |FFP;normal?;%B;6| ((|x| (%)) (% (|Boolean|)))
        (SPROG ((|l| (|List| (|List| GF))) (|a| (%)) (#1=#:G38 NIL) (|i| NIL))
               (SEQ
                (LETT |l|
                      (LIST
                       (SPADCALL (SPADCALL |x| (QREFELT % 51))
                                 (QREFELT % 65))))
                (LETT |a| |x|)
                (SEQ (LETT |i| 2) (LETT #1# (QREFELT % 12)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (LETT |a| (SPADCALL |a| (QREFELT % 66)))
                          (EXIT
                           (LETT |l|
                                 (SPADCALL |l|
                                           (SPADCALL
                                            (SPADCALL |a| (QREFELT % 51))
                                            (QREFELT % 65))
                                           (QREFELT % 68)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((EQL (SPADCALL (SPADCALL |l| (QREFELT % 70)) (QREFELT % 56))
                        (QREFELT % 12))
                   'T)
                  ('T NIL)))))) 

(SDEFUN |FFP;*;GF2%;7| ((|a| (GF)) (|x| (%)) (% (%)))
        (SPADCALL |a| |x| (QREFELT % 74))) 

(SDEFUN |FFP;*;I2%;8| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPADCALL |n| |x| (QREFELT % 76))) 

(SDEFUN |FFP;-;2%;9| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 78))) 

(SDEFUN |FFP;random;%;10| ((% (%))) (SPADCALL (QREFELT % 80))) 

(SDEFUN |FFP;coordinates;%V;11| ((|x| (%)) (% (|Vector| GF)))
        (SPADCALL |x| (QREFELT % 82))) 

(SDEFUN |FFP;represents;V%;12| ((|v| (|Vector| GF)) (% (%)))
        (SPADCALL |v| (QREFELT % 83))) 

(SDEFUN |FFP;coerce;GF%;13| ((|x| (GF)) (% (%))) (SPADCALL |x| (QREFELT % 85))) 

(SDEFUN |FFP;definingPolynomial;Sup;14| ((% (|SparseUnivariatePolynomial| GF)))
        (QREFELT % 7)) 

(SDEFUN |FFP;retract;%GF;15| ((|x| (%)) (% (GF))) (SPADCALL |x| (QREFELT % 88))) 

(SDEFUN |FFP;retractIfCan;%U;16| ((|x| (%)) (% (|Union| GF "failed")))
        (SPADCALL |x| (QREFELT % 91))) 

(SDEFUN |FFP;index;Pi%;17| ((|x| (|PositiveInteger|)) (% (%)))
        (SPADCALL |x| (QREFELT % 93))) 

(SDEFUN |FFP;lookup;%Pi;18| ((|x| (%)) (% (|PositiveInteger|)))
        (SPADCALL |x| (QREFELT % 95))) 

(SDEFUN |FFP;/;3%;19| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 97))) 

(SDEFUN |FFP;/;%GF%;20| ((|x| (%)) (|a| (GF)) (% (%)))
        (SPADCALL |x| (SPADCALL |a| (QREFELT % 86)) (QREFELT % 98))) 

(SDEFUN |FFP;*;3%;21| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 100))) 

(SDEFUN |FFP;+;3%;22| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 101))) 

(SDEFUN |FFP;-;3%;23| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 103))) 

(SDEFUN |FFP;=;2%B;24| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 105))) 

(SDEFUN |FFP;basis;V;25| ((% (|Vector| %))) (SPADCALL (QREFELT % 107))) 

(SDEFUN |FFP;Zero;%;26| ((% (%))) (|spadConstant| % 109)) 

(SDEFUN |FFP;One;%;27| ((% (%))) (|spadConstant| % 111)) 

(SDEFUN |FFP;factorsOfCyclicGroupSize;L;28|
        ((%
          (|List|
           (|Record| (|:| |factor| (|Integer|))
                     (|:| |exponent| (|NonNegativeInteger|))))))
        (SEQ (COND ((NULL (QREFELT % 20)) (|FFP;initializeElt| %)))
             (EXIT (QREFELT % 20)))) 

(PUT '|FFP;representationType;U;29| '|SPADreplace|
     '(XLAM NIL (CONS 1 "polynomial"))) 

(SDEFUN |FFP;representationType;U;29|
        ((% (|Union| "prime" "polynomial" "normal" "cyclic")))
        (CONS 1 "polynomial")) 

(SDEFUN |FFP;tableForDiscreteLogarithm;IT;30|
        ((|fac| (|Integer|))
         (% (|Table| (|PositiveInteger|) (|NonNegativeInteger|))))
        (SPROG
         ((|tbl|
           (|Union| (|Table| (|PositiveInteger|) (|NonNegativeInteger|))
                    "failed"))
          (#1=#:G80 NIL))
         (SEQ (COND ((QREFELT % 23) (|FFP;initializeLog| %)))
              (LETT |tbl|
                    (SPADCALL
                     (PROG1 (LETT #1# |fac|)
                       (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                         '(|Integer|) #1#))
                     (QREFELT % 27) (QREFELT % 118)))
              (EXIT
               (COND
                ((QEQCAR |tbl| 1)
                 (|error|
                  "tableForDiscreteLogarithm: argument must be prime divisor of the order of the multiplicative group"))
                ('T (QCDR |tbl|))))))) 

(SDEFUN |FFP;primitiveElement;%;31| ((% (%)))
        (SEQ (COND ((QREFELT % 24) (|FFP;initializeElt| %)))
             (EXIT (SPADCALL (QREFELT % 22) (QREFELT % 94))))) 

(SDEFUN |FFP;normalElement;%;32| ((% (%)))
        (SEQ (COND ((QREFELT % 24) (|FFP;initializeElt| %)))
             (EXIT (SPADCALL (QREFELT % 21) (QREFELT % 94))))) 

(SDEFUN |FFP;initializeElt| ((% (|Void|)))
        (SPROG ((|nElt| (%)) (|pE| (%)))
               (SEQ
                (SETELT % 20
                        (SPADCALL (SPADCALL (QREFELT % 19) (QREFELT % 123))
                                  (QREFELT % 125)))
                (LETT |pE| (SPADCALL (QREFELT % 126)))
                (SETELT % 22 (SPADCALL |pE| (QREFELT % 96)))
                (LETT |nElt| (SPADCALL (QREFELT % 33)))
                (SEQ G190
                     (COND
                      ((NULL (NULL (SPADCALL |nElt| (QREFELT % 73))))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |nElt| (SPADCALL |nElt| |pE| (QREFELT % 54)))))
                     NIL (GO G190) G191 (EXIT NIL))
                (SETELT % 21 (SPADCALL |nElt| (QREFELT % 96)))
                (SETELT % 24 NIL) (EXIT (SPADCALL (QREFELT % 128)))))) 

(SDEFUN |FFP;initializeLog| ((% (|Void|)))
        (SPROG
         ((#1=#:G105 NIL) (|a| (%)) (#2=#:G111 NIL) (#3=#:G99 NIL) (|i| NIL)
          (|tbl| (|Table| (|PositiveInteger|) (|NonNegativeInteger|)))
          (|n| (|Integer|)) (|d| (|Integer|)) (|l| (|Integer|)) (|base| (%))
          (|fac| (|Integer|)) (#4=#:G110 NIL) (|f| NIL) (|limit| (|Integer|)))
         (SEQ (COND ((QREFELT % 24) (|FFP;initializeElt| %))) (LETT |limit| 30)
              (SEQ (LETT |f| NIL) (LETT #4# (QREFELT % 20)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |fac| (QCAR |f|))
                        (LETT |base|
                              (SPADCALL (SPADCALL (QREFELT % 39))
                                        (QUOTIENT2 (QREFELT % 19) |fac|)
                                        (QREFELT % 129)))
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
                        (LETT |tbl| (SPADCALL (QREFELT % 130)))
                        (LETT |a| (|spadConstant| % 29))
                        (SEQ (LETT |i| 0)
                             (LETT #2#
                                   (PROG1 (LETT #3# (- |n| 1))
                                     (|check_subtype2| (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#)))
                             G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (SPADCALL
                               (CONS (SPADCALL |a| (QREFELT % 96)) |i|) |tbl|
                               (QREFELT % 132))
                              (EXIT
                               (LETT |a|
                                     (SPADCALL |a| |base| (QREFELT % 54)))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SPADCALL
                          (CONS
                           (PROG1 (LETT #1# |fac|)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|Integer|) #1#))
                           (SPADCALL |tbl| (QREFELT % 133)))
                          (QREFELT % 27) (QREFELT % 135))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (SETELT % 23 NIL) (EXIT (SPADCALL (QREFELT % 128)))))) 

(SDEFUN |FFP;coerce;%Of;35| ((|e| (%)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL |e| (QREFELT % 34)) (QREFELT % 17) (QREFELT % 136))) 

(SDEFUN |FFP;extensionDegree;Pi;36| ((% (|PositiveInteger|))) (QREFELT % 12)) 

(SDEFUN |FFP;size;Nni;37| ((% (|NonNegativeInteger|))) (+ (QREFELT % 19) 1)) 

(SDEFUN |FFP;inGroundField?;%B;38| ((|x| (%)) (% (|Boolean|)))
        (NULL
         (SPADCALL (SPADCALL |x| (QREFELT % 92)) (CONS 1 "failed")
                   (QREFELT % 140)))) 

(SDEFUN |FFP;characteristic;Nni;39| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 142))) 

(DECLAIM (NOTINLINE |FiniteFieldExtensionByPolynomial;|)) 

(DEFUN |FiniteFieldExtensionByPolynomial;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G148 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT |dv$| (LIST '|FiniteFieldExtensionByPolynomial| DV$1 DV$2))
    (LETT % (GETREFV 168))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
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
                                         #1#)
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|FiniteFieldExtensionByPolynomial|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND #1# (|HasCategory| % '(|CharacteristicNonZero|))
         (|augmentPredVector| % 32))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8
              (|SimpleAlgebraicExtension| |#1|
                                          (|SparseUnivariatePolynomial| |#1|)
                                          |#2|))
    (QSETREFV % 12 (SPADCALL |#2| (QREFELT % 11)))
    (QSETREFV % 17 (SPADCALL (SPADCALL (QREFELT % 14)) (QREFELT % 16)))
    (QSETREFV % 19 (- (EXPT (SPADCALL (QREFELT % 18)) (QREFELT % 12)) 1))
    (QSETREFV % 20 NIL)
    (QSETREFV % 21 1)
    (QSETREFV % 22 1)
    (QSETREFV % 23 'T)
    (QSETREFV % 24 'T)
    (QSETREFV % 27 (SPADCALL (QREFELT % 26)))
    %))) 

(DEFUN |FiniteFieldExtensionByPolynomial| (&REST #1=#:G149)
  (SPROG NIL
         (PROG (#2=#:G150)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T NIL))
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

(MAKEPROP '|FiniteFieldExtensionByPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 6)
              (0 . |degree|) '|extdeg| (|Symbol|) (5 . |new|) (|OutputForm|)
              (9 . |coerce|) '|alpha| (14 . |size|) '|sizeCG| '|facOfGroupSize|
              '|normalElt| '|primitiveElt| '|initlog?| '|initelt?|
              (|Table| 40 119) (18 . |table|) '|discLogTable| (22 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FFP;One;%;27|) %))
              (26 . |One|) (30 . |monomial|) (36 . |reduce|)
              |FFP;generator;%;1| (41 . |lift|) (46 . |resultant|)
              |FFP;norm;%GF;2| (|Boolean|) (52 . ~=)
              |FFP;primitiveElement;%;31| (|PositiveInteger|) (58 . |norm|)
              (64 . ^) (|List| $$) (|Vector| $$) (70 . |vector|) (|Vector| %)
              |FFP;basis;PiV;3| (|Matrix| 6) (75 . |zero|) (|Vector| 6)
              |FFP;coordinates;%V;11| (|Integer|) (81 . |setColumn!|)
              |FFP;*;3%;21| (88 . |rank|) (92 . |rank|) |FFP;degree;%Pi;4|
              (|List| 50) (97 . |nullSpace|) (102 . |elt|) (108 . +)
              (114 . |Zero|) |FFP;minimalPolynomial;%Sup;5| (|List| 6)
              (118 . |entries|) (123 . |Frobenius|) (|List| 64)
              (128 . |concat|) (134 . |rank|) (138 . |matrix|)
              (|SimpleAlgebraicExtension| 6 10 (NRTEVAL (QREFELT % 7)))
              (143 . |rank|) |FFP;normal?;%B;6| (147 . *) |FFP;*;GF2%;7|
              (153 . *) |FFP;*;I2%;8| (159 . -) |FFP;-;2%;9| (164 . |random|)
              |FFP;random;%;10| (168 . |coordinates|) (173 . |represents|)
              |FFP;represents;V%;12| (178 . |coerce|) |FFP;coerce;GF%;13|
              |FFP;definingPolynomial;Sup;14| (183 . |retract|)
              |FFP;retract;%GF;15| (|Union| 6 '"failed") (188 . |retractIfCan|)
              |FFP;retractIfCan;%U;16| (193 . |index|) |FFP;index;Pi%;17|
              (198 . |lookup|) |FFP;lookup;%Pi;18| (203 . /) |FFP;/;3%;19|
              |FFP;/;%GF%;20| (209 . *) (215 . +) |FFP;+;3%;22| (221 . -)
              |FFP;-;3%;23| (227 . =) |FFP;=;2%B;24| (233 . |basis|)
              |FFP;basis;V;25| (237 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FFP;Zero;%;26|) %))
              (241 . |One|) (|Record| (|:| |factor| 52) (|:| |exponent| 9))
              (|List| 112) |FFP;factorsOfCyclicGroupSize;L;28|
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              |FFP;representationType;U;29| (|Union| 119 '"failed")
              (245 . |search|) (|Table| 40 9)
              |FFP;tableForDiscreteLogarithm;IT;30| |FFP;normalElement;%;32|
              (|Factored| %) (251 . |factor|) (|Factored| 52) (256 . |factors|)
              (261 . |createPrimitiveElement|) (|Void|) (265 . |void|)
              (269 . ^) (275 . |table|)
              (|Record| (|:| |key| 40) (|:| |entry| 9)) (279 . |insert!|)
              (285 . |copy|) (|Record| (|:| |key| 40) (|:| |entry| 119))
              (290 . |insert!|) (296 . |outputForm|) |FFP;coerce;%Of;35|
              |FFP;extensionDegree;Pi;36| |FFP;size;Nni;37| (302 . =)
              |FFP;inGroundField?;%B;38| (308 . |characteristic|)
              |FFP;characteristic;Nni;39| (|String|) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 148 '"failed")
              (|Record| (|:| |coef| 148) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 153 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Fraction| 52) (|OnePointCompletion| 40)
              (|Union| 46 '#1="failed") (|Matrix| %) (|Union| 9 '"failed")
              (|InputForm|) (|Union| 10 '"failed") (|Factored| 149)
              (|Union| 165 '#1#) (|List| 149) (|HashState|) (|SingleInteger|))
           '#(~= 312 |zero?| 318 |unitNormal| 323 |unitCanonical| 328 |unit?|
              333 |transcendent?| 338 |transcendenceDegree| 343 |traceMatrix|
              347 |trace| 356 |tableForDiscreteLogarithm| 367 |subtractIfCan|
              372 |squareFreePolynomial| 378 |squareFreePart| 383 |squareFree|
              388 |solveLinearPolynomialEquation| 393 |smaller?| 399
              |sizeLess?| 405 |size| 411 |sample| 415 |rightRecip| 419
              |rightPower| 424 |retractIfCan| 436 |retract| 441 |represents|
              446 |representationType| 457 |rem| 461 |regularRepresentation|
              467 |recip| 478 |rank| 483 |random| 487 |quo| 491
              |principalIdeal| 497 |primitiveElement| 502 |primitive?| 506
              |primeFrobenius| 511 |prime?| 522 |plenaryPower| 527 |order| 533
              |opposite?| 543 |one?| 549 |normalElement| 554 |normal?| 558
              |norm| 563 |nextItem| 574 |multiEuclidean| 579
              |minimalPolynomial| 585 |lookup| 596 |linearAssociatedOrder| 601
              |linearAssociatedLog| 606 |linearAssociatedExp| 617 |leftRecip|
              623 |leftPower| 628 |lcmCoef| 640 |lcm| 646 |latex| 657 |inv| 662
              |init| 667 |index| 671 |inGroundField?| 676 |hashUpdate!| 681
              |hash| 687 |generator| 692 |gcdPolynomial| 696 |gcd| 702
              |factorsOfCyclicGroupSize| 713 |factorSquareFreePolynomial| 717
              |factorPolynomial| 722 |factor| 727 |extensionDegree| 732
              |extendedEuclidean| 740 |exquo| 753 |expressIdealMember| 759
              |euclideanSize| 765 |enumerate| 770 |divide| 774 |discriminant|
              780 |discreteLog| 789 |differentiate| 800 |degree| 811
              |definingPolynomial| 821 |createPrimitiveElement| 825
              |createNormalElement| 829 |coordinates| 833 |convert| 855
              |conditionP| 870 |commutator| 875 |coerce| 881 |charthRoot| 906
              |characteristicPolynomial| 916 |characteristic| 921 |basis| 925
              |associator| 934 |associates?| 941 |antiCommutator| 947
              |annihilate?| 953 |algebraic?| 959 ^ 964 |Zero| 982 |One| 986
              |Frobenius| 990 D 1001 = 1012 / 1018 - 1030 + 1041 * 1047)
           'NIL
           (CONS
            (|makeByteWordVec2| 4
                                '(0 2 0 3 0 2 0 0 0 0 0 0 0 0 0 0 2 1 3 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 2 0 0 0 0 2 2 0 0 4 0 0 0 2 0 0 0 0 0 0
                                  0 0))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |FiniteFieldCategory&|
                |ExtensionField&| |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL
                |FramedAlgebra&| NIL NIL |DivisionRing&| |FiniteRankAlgebra&|
                |DifferentialRing&| NIL NIL |Algebra&| |EntireRing&| |Algebra&|
                |Algebra&| NIL NIL |Rng&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| NIL |Module&|
                |Module&| |Module&| |NonAssociativeRing&| NIL NIL NIL
                |FramedModule&| NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |Finite&| |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL NIL NIL
                |AbelianSemiGroup&| |Magma&| |Hashable&| |SetCategory&| NIL
                |RetractableTo&| NIL NIL |BasicType&| NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| 6) (|FiniteFieldCategory|)
                 (|ExtensionField| 6) (|FieldOfPrimeCharacteristic|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|)
                 (|FramedAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|FiniteRankAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|DifferentialRing|) (|CharacteristicZero|)
                 (|CharacteristicNonZero|) (|Algebra| $$) (|EntireRing|)
                 (|Algebra| 156) (|Algebra| 6) (|Ring|) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 156)
                 (|NonAssociativeAlgebra| 6) (|SemiRng|) (|Module| $$)
                 (|Module| 156) (|Module| 6) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|BiModule| 156 156) (|BiModule| 6 6)
                 (|FramedModule| 6) (|RightModule| $$) (|NonAssociativeRng|)
                 (|LeftModule| $$) (|LeftModule| 156) (|RightModule| 156)
                 (|LeftModule| 6) (|RightModule| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|Finite|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|StepThrough|) (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|Hashable|) (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| 6) (|ConvertibleTo| 161) (|CoercibleTo| 15)
                 (|BasicType|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|CoercibleFrom| 6))
              (|makeByteWordVec2| 167
                                  '(1 10 9 0 11 0 13 0 14 1 13 15 0 16 0 6 9 18
                                    0 25 0 26 0 10 0 28 0 6 0 30 2 10 0 6 9 31
                                    1 8 0 10 32 1 8 10 0 34 2 10 6 0 0 35 2 9
                                    37 0 0 38 2 0 0 0 40 41 2 0 0 0 9 42 1 44 0
                                    43 45 2 48 0 9 9 49 3 48 0 0 52 50 53 0 0
                                    40 55 1 48 9 0 56 1 48 58 0 59 2 50 6 0 52
                                    60 2 10 0 0 0 61 0 10 0 62 1 50 64 0 65 1 0
                                    0 0 66 2 67 0 0 64 68 0 8 40 69 1 48 0 67
                                    70 0 71 40 72 2 8 0 6 0 74 2 8 0 52 0 76 1
                                    8 0 0 78 0 8 0 80 1 8 50 0 82 1 8 0 50 83 1
                                    8 0 6 85 1 8 6 0 88 1 8 90 0 91 1 8 0 40 93
                                    1 8 40 0 95 2 8 0 0 0 97 2 8 0 0 0 100 2 8
                                    0 0 0 101 2 8 0 0 0 103 2 8 37 0 0 105 0 8
                                    46 107 0 8 0 109 0 8 0 111 2 25 117 40 0
                                    118 1 52 122 0 123 1 124 113 0 125 0 0 0
                                    126 0 127 0 128 2 0 0 0 52 129 0 119 0 130
                                    2 119 0 131 0 132 1 119 0 0 133 2 25 0 134
                                    0 135 2 10 15 0 15 136 2 90 37 0 0 140 0 6
                                    9 142 2 0 37 0 0 1 1 0 37 0 1 1 0 146 0 1 1
                                    0 0 0 1 1 0 37 0 1 1 0 37 0 1 0 0 9 1 0 0
                                    48 1 1 0 48 46 1 1 0 6 0 1 2 2 0 0 40 1 1 2
                                    119 52 120 2 0 145 0 0 1 1 2 163 149 1 1 0
                                    0 0 1 1 0 122 0 1 2 2 164 165 149 1 2 2 37
                                    0 0 1 2 0 37 0 0 1 0 2 9 139 0 0 0 1 1 0
                                    145 0 1 2 0 0 0 40 1 2 0 0 0 9 1 1 0 90 0
                                    92 1 0 6 0 89 1 0 0 50 84 2 0 0 50 46 1 0 2
                                    115 116 2 0 0 0 0 1 1 0 48 0 1 2 0 48 0 46
                                    1 1 0 145 0 1 0 0 40 55 0 2 0 81 2 0 0 0 0
                                    1 1 0 151 148 1 0 2 0 39 1 2 37 0 1 2 3 0 0
                                    9 1 1 3 0 0 1 1 0 37 0 1 2 0 0 0 40 1 1 3
                                    157 0 1 1 2 40 0 1 2 0 37 0 0 1 1 0 37 0 1
                                    0 2 0 121 1 2 37 0 73 1 0 6 0 36 2 2 0 0 40
                                    41 1 2 145 0 1 2 0 150 148 0 1 1 5 10 0 63
                                    2 2 149 0 40 1 1 2 40 0 96 1 2 10 0 1 2 2
                                    162 0 0 1 1 2 10 0 1 2 2 0 0 10 1 1 0 145 0
                                    1 2 0 0 0 40 1 2 0 0 0 9 1 2 0 147 0 0 1 1
                                    0 0 148 1 2 0 0 0 0 1 1 0 144 0 1 1 0 0 0 1
                                    0 2 0 1 1 2 0 40 94 1 0 37 0 141 2 4 166
                                    166 0 1 1 4 167 0 1 0 2 0 33 2 0 149 149
                                    149 1 1 0 0 148 1 2 0 0 0 0 1 0 2 113 114 1
                                    2 163 149 1 1 2 163 149 1 1 0 122 0 1 0 0
                                    157 1 0 0 40 138 3 0 154 0 0 0 1 2 0 155 0
                                    0 1 2 0 145 0 0 1 2 0 150 148 0 1 1 0 9 0 1
                                    0 2 148 1 2 0 152 0 0 1 0 0 6 1 1 0 6 46 1
                                    2 3 160 0 0 1 1 2 9 0 1 1 2 0 0 1 2 2 0 0 9
                                    1 1 0 157 0 1 1 0 40 0 57 0 0 10 87 0 2 0
                                    126 0 2 0 1 1 0 50 0 51 1 0 48 46 1 2 0 50
                                    0 46 1 2 0 48 46 46 1 1 0 50 0 1 1 0 0 50 1
                                    1 2 161 0 1 1 6 158 159 1 2 0 0 0 0 1 1 0
                                    15 0 137 1 0 0 52 1 1 0 0 0 1 1 0 0 156 1 1
                                    0 0 6 86 1 3 145 0 1 1 2 0 0 1 1 0 10 0 1 0
                                    0 9 143 0 0 46 108 1 2 46 40 47 3 0 0 0 0 0
                                    1 2 0 37 0 0 1 2 0 0 0 0 1 2 0 37 0 0 1 1 0
                                    37 0 1 2 0 0 0 40 1 2 0 0 0 9 42 2 0 0 0 52
                                    129 0 0 0 110 0 0 0 29 2 2 0 0 9 1 1 2 0 0
                                    66 1 2 0 0 1 2 2 0 0 9 1 2 0 37 0 0 106 2 0
                                    0 0 0 98 2 0 0 0 6 99 2 0 0 0 0 104 1 0 0 0
                                    79 2 0 0 0 0 102 2 0 0 40 0 1 2 0 0 0 0 54
                                    2 0 0 52 0 77 2 0 0 9 0 1 2 0 0 0 156 1 2 0
                                    0 156 0 1 2 0 0 6 0 75 2 0 0 0 6 1)))))
           '|lookupComplete|)) 
