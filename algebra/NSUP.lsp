
(PUT '|NSUP;rep| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |NSUP;rep|
        ((|s| (%))
         (% (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R)))))
        |s|) 

(PUT '|NSUP;per| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |NSUP;per|
        ((|l| (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
         (% (%)))
        |l|) 

(PUT '|NSUP;coerce;%Sup;3| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NSUP;coerce;%Sup;3| ((|p| (%)) (% (|SparseUnivariatePolynomial| R)))
        |p|) 

(PUT '|NSUP;coerce;Sup%;4| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NSUP;coerce;Sup%;4| ((|p| (|SparseUnivariatePolynomial| R)) (% (%)))
        |p|) 

(PUT '|NSUP;retractIfCan;%U;5| '|SPADreplace| '(XLAM (|p|) (CONS 0 |p|))) 

(SDEFUN |NSUP;retractIfCan;%U;5|
        ((|p| (%)) (% (|Union| (|SparseUnivariatePolynomial| R) "failed")))
        (CONS 0 |p|)) 

(SDEFUN |NSUP;monicModulo;3%;6| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((#1=#:G49 NIL)
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|e| (|NonNegativeInteger|)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT % 12))
            (|error| "in monicModulo$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT % 13))
            (|error| "in monicModulo$NSUP: ground? #2"))
           (#3='T
            (SEQ (LETT |yy| (|NSUP;rep| |y| %))
                 (COND
                  ((NULL
                    (SPADCALL (QCDR (|SPADfirst| |yy|)) (|spadConstant| % 14)
                              (QREFELT % 15)))
                   (EXIT (|error| "in monicModulo$NSUP: not monic #2"))))
                 (LETT |xx| (|NSUP;rep| |x| %))
                 (EXIT
                  (COND ((NULL |xx|) |x|)
                        (#3#
                         (SEQ (LETT |e| (QCAR (|SPADfirst| |yy|)))
                              (LETT |y| (|NSUP;per| (CDR |yy|) %))
                              (SEQ
                               (EXIT
                                (SEQ G190 NIL
                                     (SEQ
                                      (SEQ
                                       (LETT |u|
                                             (SPADCALL
                                              (QCAR (|SPADfirst| |xx|)) |e|
                                              (QREFELT % 18)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |u| 1)
                                          (PROGN
                                           (LETT #1# 1)
                                           (GO #4=#:G43))))))
                                      (LETT |xx|
                                            (|NSUP;rep|
                                             (SPADCALL
                                              (|NSUP;per| (CDR |xx|) %)
                                              (QCDR |u|)
                                              (QCDR (|SPADfirst| |xx|)) |y|
                                              (QREFELT % 19))
                                             %))
                                      (EXIT
                                       (COND
                                        ((NULL |xx|)
                                         (PROGN (LETT #1# 1) (GO #4#))))))
                                     NIL (GO G190) G191 (EXIT NIL)))
                               #4# (EXIT #1#))
                              (EXIT (|NSUP;per| |xx| %)))))))))))) 

(SDEFUN |NSUP;lazyResidueClass;2%R;7|
        ((|x| (%)) (|y| (%))
         (%
          (|Record| (|:| |polnum| %) (|:| |polden| R)
                    (|:| |power| (|NonNegativeInteger|)))))
        (SPROG
         ((#1=#:G64 NIL) (|pow| (|NonNegativeInteger|))
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|e| (|NonNegativeInteger|)) (|co| (R)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT % 12))
            (|error| "in lazyResidueClass$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT % 13))
            (|error| "in lazyResidueClass$NSUP: ground? #2"))
           (#3='T
            (SEQ (LETT |yy| (|NSUP;rep| |y| %))
                 (LETT |co| (QCDR (|SPADfirst| |yy|)))
                 (LETT |xx| (|NSUP;rep| |x| %))
                 (EXIT
                  (COND ((NULL |xx|) (VECTOR |x| |co| 0))
                        (#3#
                         (SEQ (LETT |pow| 0)
                              (LETT |e| (QCAR (|SPADfirst| |yy|)))
                              (LETT |y| (|NSUP;per| (CDR |yy|) %))
                              (SEQ
                               (EXIT
                                (SEQ G190 NIL
                                     (SEQ
                                      (SEQ
                                       (LETT |u|
                                             (SPADCALL
                                              (QCAR (|SPADfirst| |xx|)) |e|
                                              (QREFELT % 18)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |u| 1)
                                          (PROGN
                                           (LETT #1# 1)
                                           (GO #4=#:G57))))))
                                      (LETT |xx|
                                            (|NSUP;rep|
                                             (SPADCALL
                                              (SPADCALL |co|
                                                        (|NSUP;per| (CDR |xx|)
                                                         %)
                                                        (QREFELT % 23))
                                              (QCDR |u|)
                                              (QCDR (|SPADfirst| |xx|)) |y|
                                              (QREFELT % 19))
                                             %))
                                      (LETT |pow| (+ |pow| 1))
                                      (EXIT
                                       (COND
                                        ((NULL |xx|)
                                         (PROGN (LETT #1# 1) (GO #4#))))))
                                     NIL (GO G190) G191 (EXIT NIL)))
                               #4# (EXIT #1#))
                              (EXIT
                               (VECTOR (|NSUP;per| |xx| %) |co|
                                       |pow|)))))))))))) 

(SDEFUN |NSUP;lazyPseudoRemainder;3%;8| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((#1=#:G79 NIL)
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|e| (|NonNegativeInteger|)) (|co| (R)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT % 12))
            (|error| "in lazyPseudoRemainder$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT % 13))
            (|error| "in lazyPseudoRemainder$NSUP: ground? #2"))
           ((SPADCALL |x| (QREFELT % 13)) |x|)
           (#3='T
            (SEQ (LETT |yy| (|NSUP;rep| |y| %))
                 (LETT |co| (QCDR (|SPADfirst| |yy|)))
                 (EXIT
                  (COND
                   ((SPADCALL |co| (|spadConstant| % 14) (QREFELT % 15))
                    (SPADCALL |x| |y| (QREFELT % 20)))
                   ((SPADCALL |co|
                              (SPADCALL (|spadConstant| % 14) (QREFELT % 27))
                              (QREFELT % 15))
                    (SPADCALL
                     (SPADCALL (SPADCALL |x| (QREFELT % 28))
                               (SPADCALL |y| (QREFELT % 28)) (QREFELT % 20))
                     (QREFELT % 28)))
                   (#3#
                    (SEQ (LETT |xx| (|NSUP;rep| |x| %))
                         (LETT |e| (QCAR (|SPADfirst| |yy|)))
                         (LETT |y| (|NSUP;per| (CDR |yy|) %))
                         (SEQ
                          (EXIT
                           (SEQ G190 NIL
                                (SEQ
                                 (SEQ
                                  (LETT |u|
                                        (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                                  (QREFELT % 18)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |u| 1)
                                     (PROGN (LETT #1# 1) (GO #4=#:G71))))))
                                 (LETT |xx|
                                       (|NSUP;rep|
                                        (SPADCALL
                                         (SPADCALL |co|
                                                   (|NSUP;per| (CDR |xx|) %)
                                                   (QREFELT % 23))
                                         (QCDR |u|) (QCDR (|SPADfirst| |xx|))
                                         |y| (QREFELT % 19))
                                        %))
                                 (EXIT
                                  (COND
                                   ((NULL |xx|)
                                    (PROGN (LETT #1# 1) (GO #4#))))))
                                NIL (GO G190) G191 (EXIT NIL)))
                          #4# (EXIT #1#))
                         (EXIT (|NSUP;per| |xx| %)))))))))))) 

(SDEFUN |NSUP;lazyPseudoDivide;2%R;9|
        ((|x| (%)) (|y| (%))
         (%
          (|Record| (|:| |coef| R) (|:| |gap| (|NonNegativeInteger|))
                    (|:| |quotient| %) (|:| |remainder| %))))
        (SPROG
         ((#1=#:G96 NIL) (|pow| (|NonNegativeInteger|)) (#2=#:G84 NIL)
          (|xx|
           #3=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|qq|
           (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) #4="failed")) (|co| (R))
          (|e| (|NonNegativeInteger|)) (|yy| #3#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT % 12))
            (|error| "in lazyPseudoDivide$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT % 13))
            (|error| "in lazyPseudoDivide$NSUP: ground? #2"))
           ('T
            (SEQ (LETT |yy| (|NSUP;rep| |y| %))
                 (LETT |e| (QCAR (|SPADfirst| |yy|)))
                 (LETT |xx| (|NSUP;rep| |x| %))
                 (LETT |co| (QCDR (|SPADfirst| |yy|)))
                 (COND
                  ((OR (NULL |xx|) (< (QCAR (|SPADfirst| |xx|)) |e|))
                   (EXIT (VECTOR |co| 0 (|spadConstant| % 21) |x|))))
                 (LETT |pow|
                       (+
                        (PROG2
                            (LETT #2#
                                  (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                            (QREFELT % 18)))
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                          (|Union| (|NonNegativeInteger|) #4#)
                                          #2#))
                        1))
                 (LETT |qq| NIL) (LETT |y| (|NSUP;per| (CDR |yy|) %))
                 (SEQ
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (SEQ
                          (LETT |u|
                                (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                          (QREFELT % 18)))
                          (EXIT
                           (COND
                            ((QEQCAR |u| 1)
                             (PROGN (LETT #1# 1) (GO #5=#:G89))))))
                         (LETT |qq|
                               (CONS
                                (CONS (QCDR |u|) (QCDR (|SPADfirst| |xx|)))
                                (|NSUP;rep|
                                 (SPADCALL |co| (|NSUP;per| |qq| %)
                                           (QREFELT % 23))
                                 %)))
                         (LETT |xx|
                               (|NSUP;rep|
                                (SPADCALL
                                 (SPADCALL |co| (|NSUP;per| (CDR |xx|) %)
                                           (QREFELT % 23))
                                 (QCDR |u|) (QCDR (|SPADfirst| |xx|)) |y|
                                 (QREFELT % 19))
                                %))
                         (LETT |pow|
                               (PROG2
                                   (LETT #2# (SPADCALL |pow| 1 (QREFELT % 18)))
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0)
                                                 (|NonNegativeInteger|)
                                                 (|Union|
                                                  (|NonNegativeInteger|) #4#)
                                                 #2#)))
                         (EXIT
                          (COND ((NULL |xx|) (PROGN (LETT #1# 1) (GO #5#))))))
                        NIL (GO G190) G191 (EXIT NIL)))
                  #5# (EXIT #1#))
                 (EXIT
                  (VECTOR |co| |pow| (|NSUP;per| (REVERSE |qq|) %)
                          (|NSUP;per| |xx| %))))))))) 

(SDEFUN |NSUP;lazyPseudoQuotient;3%;10| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((#1=#:G111 NIL)
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|qq|
           (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed")) (|co| (R))
          (|e| (|NonNegativeInteger|)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT % 12))
            (|error| "in lazyPseudoQuotient$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT % 13))
            (|error| "in lazyPseudoQuotient$NSUP: ground? #2"))
           ('T
            (SEQ (LETT |yy| (|NSUP;rep| |y| %))
                 (LETT |e| (QCAR (|SPADfirst| |yy|)))
                 (LETT |xx| (|NSUP;rep| |x| %))
                 (COND
                  ((OR (NULL |xx|) (< (QCAR (|SPADfirst| |xx|)) |e|))
                   (EXIT (|spadConstant| % 21))))
                 (LETT |qq| NIL) (LETT |co| (QCDR (|SPADfirst| |yy|)))
                 (LETT |y| (|NSUP;per| (CDR |yy|) %))
                 (SEQ
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (SEQ
                          (LETT |u|
                                (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                          (QREFELT % 18)))
                          (EXIT
                           (COND
                            ((QEQCAR |u| 1)
                             (PROGN (LETT #1# 1) (GO #3=#:G105))))))
                         (LETT |qq|
                               (CONS
                                (CONS (QCDR |u|) (QCDR (|SPADfirst| |xx|)))
                                (|NSUP;rep|
                                 (SPADCALL |co| (|NSUP;per| |qq| %)
                                           (QREFELT % 23))
                                 %)))
                         (LETT |xx|
                               (|NSUP;rep|
                                (SPADCALL
                                 (SPADCALL |co| (|NSUP;per| (CDR |xx|) %)
                                           (QREFELT % 23))
                                 (QCDR |u|) (QCDR (|SPADfirst| |xx|)) |y|
                                 (QREFELT % 19))
                                %))
                         (EXIT
                          (COND ((NULL |xx|) (PROGN (LETT #1# 1) (GO #3#))))))
                        NIL (GO G190) G191 (EXIT NIL)))
                  #3# (EXIT #1#))
                 (EXIT (|NSUP;per| (REVERSE |qq|) %)))))))) 

(SDEFUN |NSUP;subResultantGcd;3%;11| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPADCALL |p1| |p2| (QREFELT % 34))) 

(SDEFUN |NSUP;subResultantsChain;2%L;12| ((|p1| (%)) (|p2| (%)) (% (|List| %)))
        (SPADCALL |p1| |p2| (QREFELT % 37))) 

(SDEFUN |NSUP;lastSubResultant;3%;13| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPADCALL |p1| |p2| (QREFELT % 40))) 

(SDEFUN |NSUP;resultant;2%R;14| ((|p1| (%)) (|p2| (%)) (% (R)))
        (SPADCALL |p1| |p2| (QREFELT % 42))) 

(SDEFUN |NSUP;extendedResultant;2%R;15|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |resultant| R) (|:| |coef1| %) (|:| |coef2| %))))
        (SPROG
         ((|re|
           (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |resultant| R))))
         (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 45)))
              (EXIT (VECTOR (QVELT |re| 2) (QVELT |re| 0) (QVELT |re| 1)))))) 

(SDEFUN |NSUP;halfExtendedResultant1;2%R;16|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |resultant| R) (|:| |coef1| %))))
        (SPROG ((|re| (|Record| (|:| |coef1| %) (|:| |resultant| R))))
               (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 49)))
                    (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;halfExtendedResultant2;2%R;17|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |resultant| R) (|:| |coef2| %))))
        (SPROG ((|re| (|Record| (|:| |coef2| %) (|:| |resultant| R))))
               (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 53)))
                    (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;extendedSubResultantGcd;2%R;18|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |gcd| %) (|:| |coef1| %) (|:| |coef2| %))))
        (SPROG
         ((|re| (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |gcd| %))))
         (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 57)))
              (EXIT (VECTOR (QVELT |re| 2) (QVELT |re| 0) (QVELT |re| 1)))))) 

(SDEFUN |NSUP;halfExtendedSubResultantGcd1;2%R;19|
        ((|p1| (%)) (|p2| (%)) (% (|Record| (|:| |gcd| %) (|:| |coef1| %))))
        (SPROG ((|re| (|Record| (|:| |coef1| %) (|:| |gcd| %))))
               (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 61)))
                    (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;halfExtendedSubResultantGcd2;2%R;20|
        ((|p1| (%)) (|p2| (%)) (% (|Record| (|:| |gcd| %) (|:| |coef2| %))))
        (SPROG ((|re| (|Record| (|:| |coef2| %) (|:| |gcd| %))))
               (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 65)))
                    (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(DECLAIM (NOTINLINE |NewSparseUnivariatePolynomial;|)) 

(DEFUN |NewSparseUnivariatePolynomial;| (|#1|)
  (SPROG
   ((#1=#:G201 NIL) (|pv$| NIL) (#2=#:G192 NIL) (#3=#:G194 NIL) (#4=#:G193 NIL)
    (#5=#:G195 NIL) (#6=#:G196 NIL) (#7=#:G197 NIL) (#8=#:G198 NIL)
    (#9=#:G199 NIL) (#10=#:G200 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|NewSparseUnivariatePolynomial| DV$1))
    (LETT % (GETREFV 124))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory|
                                              (|SingletonAsOrderedSet|)
                                              '(|Hashable|)))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #10#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #10#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #10#)
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|Field|)) #10#
                                         #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #10# #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #10# #9#)
                                        (|HasCategory| |#1| '(|StepThrough|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #10#
                                         #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Float|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         #8#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Integer|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #5#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #4#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         (AND #4#
                                              (|HasCategory| |#1| '(|Field|)))
                                         (AND #4# #10#) (AND #4# #9#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#)))))
    (|haddProp| |$ConstructorCache| '|NewSparseUnivariatePolynomial|
                (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 70368744177664))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 140737488355328))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| % 281474976710656))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 562949953421312))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #10#
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1125899906842624))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #10# (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#1| '(|AbelianMonoid|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #2#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 144115188075855872))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 20)
      (PROGN
       (QSETREFV % 35
                 (CONS (|dispatchFunction| |NSUP;subResultantGcd;3%;11|) %))
       (QSETREFV % 39
                 (CONS (|dispatchFunction| |NSUP;subResultantsChain;2%L;12|)
                       %))
       (QSETREFV % 41
                 (CONS (|dispatchFunction| |NSUP;lastSubResultant;3%;13|) %))
       (QSETREFV % 43 (CONS (|dispatchFunction| |NSUP;resultant;2%R;14|) %))
       (QSETREFV % 47
                 (CONS (|dispatchFunction| |NSUP;extendedResultant;2%R;15|) %))
       (QSETREFV % 51
                 (CONS
                  (|dispatchFunction| |NSUP;halfExtendedResultant1;2%R;16|) %))
       (QSETREFV % 55
                 (CONS
                  (|dispatchFunction| |NSUP;halfExtendedResultant2;2%R;17|) %))
       (QSETREFV % 59
                 (CONS
                  (|dispatchFunction| |NSUP;extendedSubResultantGcd;2%R;18|)
                  %))
       (QSETREFV % 63
                 (CONS
                  (|dispatchFunction|
                   |NSUP;halfExtendedSubResultantGcd1;2%R;19|)
                  %))
       (QSETREFV % 67
                 (CONS
                  (|dispatchFunction|
                   |NSUP;halfExtendedSubResultantGcd2;2%R;20|)
                  %)))))
    %))) 

(DEFUN |NewSparseUnivariatePolynomial| (#1=#:G202)
  (SPROG NIL
         (PROG (#2=#:G203)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|NewSparseUnivariatePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|NewSparseUnivariatePolynomial;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|NewSparseUnivariatePolynomial|)))))))))) 

(MAKEPROP '|NewSparseUnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 6)
              (|local| |#1|) |NSUP;coerce;%Sup;3| |NSUP;coerce;Sup%;4|
              (|Union| 5 '"failed") |NSUP;retractIfCan;%U;5| (|Boolean|)
              (0 . |zero?|) (5 . |ground?|) (10 . |One|) (14 . =)
              (|Union| % '"failed") (|NonNegativeInteger|)
              (20 . |subtractIfCan|) (26 . |fmecg|) |NSUP;monicModulo;3%;6|
              (34 . |Zero|) (38 . |Zero|) (42 . *) (48 . |One|)
              (|Record| (|:| |polnum| %) (|:| |polden| 6) (|:| |power| 17))
              |NSUP;lazyResidueClass;2%R;7| (52 . -) (57 . -)
              |NSUP;lazyPseudoRemainder;3%;8|
              (|Record| (|:| |coef| 6) (|:| |gap| 17) (|:| |quotient| %)
                        (|:| |remainder| %))
              |NSUP;lazyPseudoDivide;2%R;9| |NSUP;lazyPseudoQuotient;3%;10|
              (|PseudoRemainderSequence| 6 $$) (62 . |subResultantGcd|)
              (68 . |subResultantGcd|) (|List| $$) (74 . |chainSubResultants|)
              (|List| %) (80 . |subResultantsChain|) (86 . |lastSubResultant|)
              (92 . |lastSubResultant|) (98 . |resultant|) (104 . |resultant|)
              (|Record| (|:| |coef1| $$) (|:| |coef2| $$) (|:| |resultant| 6))
              (110 . |resultantEuclidean|)
              (|Record| (|:| |resultant| 6) (|:| |coef1| %) (|:| |coef2| %))
              (116 . |extendedResultant|)
              (|Record| (|:| |coef1| $$) (|:| |resultant| 6))
              (122 . |semiResultantEuclidean1|)
              (|Record| (|:| |resultant| 6) (|:| |coef1| %))
              (128 . |halfExtendedResultant1|)
              (|Record| (|:| |coef2| $$) (|:| |resultant| 6))
              (134 . |semiResultantEuclidean2|)
              (|Record| (|:| |resultant| 6) (|:| |coef2| %))
              (140 . |halfExtendedResultant2|)
              (|Record| (|:| |coef1| $$) (|:| |coef2| $$) (|:| |gcd| $$))
              (146 . |subResultantGcdEuclidean|)
              (|Record| (|:| |gcd| %) (|:| |coef1| %) (|:| |coef2| %))
              (152 . |extendedSubResultantGcd|)
              (|Record| (|:| |coef1| $$) (|:| |gcd| $$))
              (158 . |semiSubResultantGcdEuclidean1|)
              (|Record| (|:| |gcd| %) (|:| |coef1| %))
              (164 . |halfExtendedSubResultantGcd1|)
              (|Record| (|:| |coef2| $$) (|:| |gcd| $$))
              (170 . |semiSubResultantGcdEuclidean2|)
              (|Record| (|:| |gcd| %) (|:| |coef2| %))
              (176 . |halfExtendedSubResultantGcd2|) (|String|) (|OutputForm|)
              (|PositiveInteger|) (|Record| (|:| |k| 17) (|:| |c| 6))
              (|List| 71) (|Mapping| 6 6) (|List| 17) (|List| 6)
              (|Union| 6 '#1="failed") (|Mapping| 17 17) (|List| 79)
              (|SingletonAsOrderedSet|) (|Union| 79 '"failed")
              (|SparseUnivariatePolynomial| %) (|Union| 38 '#2="failed")
              (|Vector| 6) (|Union| 94 '#3="failed") (|Matrix| %) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 92) (|HashState|)
              (|SingleInteger|) (|Matrix| 92) (|Integer|)
              (|Record| (|:| |mat| 91) (|:| |vec| (|Vector| 92))) (|Vector| %)
              (|Symbol|) (|List| 95) (|PatternMatchResult| (|Float|) %)
              (|PatternMatchResult| 92 %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 92) (|Mapping| 6 17) (|Fraction| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 104 '"failed")
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 38) (|:| |generator| %)) (|Factored| %)
              (|Record| (|:| |primePart| %) (|:| |commonPart| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Union| 102 '"failed")
              (|Record| (|:| |coef| 6) (|:| |quotient| %) (|:| |remainder| %))
              (|Factored| 81) (|Union| 115 '#3#) (|List| 81) (|Union| 100 '#1#)
              (|Union| 92 '#1#) (|Record| (|:| |mat| 119) (|:| |vec| 83))
              (|Matrix| 6) (|Record| (|:| |var| 79) (|:| |exponent| 17))
              (|Union| 120 '#2#) (|List| 123) (|Equation| %))
           '#(~= 182 |zero?| 188 |vectorise| 193 |variables| 199 |unvectorise|
              204 |unmakeSUP| 209 |univariate| 214 |unitNormal| 225
              |unitCanonical| 230 |unit?| 235 |totalDegreeSorted| 240
              |totalDegree| 246 |support| 257 |subtractIfCan| 262
              |subResultantsChain| 268 |subResultantGcd| 274
              |squareFreePolynomial| 280 |squareFreePart| 285 |squareFree| 290
              |solveLinearPolynomialEquation| 295 |smaller?| 301 |sizeLess?|
              307 |shiftRight| 313 |shiftLeft| 319 |separate| 325 |sample| 331
              |rightRecip| 335 |rightPower| 340 |retractIfCan| 352 |retract|
              377 |resultant| 402 |rem| 415 |reductum| 421 |reducedSystem| 426
              |recip| 448 |quo| 453 |pseudoRemainder| 459 |pseudoQuotient| 465
              |pseudoDivide| 471 |principalIdeal| 477 |primitivePart| 482
              |primitiveMonomials| 493 |prime?| 498 |pomopo!| 503
              |plenaryPower| 511 |patternMatch| 517 |order| 531 |opposite?| 537
              |one?| 543 |numberOfMonomials| 548 |nextItem| 553 |multivariate|
              558 |multiplyExponents| 570 |multiEuclidean| 576 |monomials| 582
              |monomial?| 587 |monomial| 592 |monicModulo| 612 |monicDivide|
              618 |minimumDegree| 631 |mapExponents| 648 |map| 654 |makeSUP|
              660 |mainVariable| 665 |listOfTerms| 670 |linearExtend| 675
              |leftRecip| 681 |leftPower| 686 |leadingTerm| 698
              |leadingSupport| 703 |leadingMonomial| 708 |leadingCoefficient|
              713 |lcmCoef| 718 |lcm| 724 |lazyResidueClass| 735
              |lazyPseudoRemainder| 741 |lazyPseudoQuotient| 747
              |lazyPseudoDivide| 753 |latex| 759 |lastSubResultant| 764
              |karatsubaDivide| 770 |isTimes| 776 |isPlus| 781 |isExpt| 786
              |integrate| 791 |init| 796 |hashUpdate!| 800 |hash| 806
              |halfExtendedSubResultantGcd2| 811 |halfExtendedSubResultantGcd1|
              817 |halfExtendedResultant2| 823 |halfExtendedResultant1| 829
              |ground?| 835 |ground| 840 |gcdPolynomial| 845 |gcd| 851 |fmecg|
              862 |factorSquareFreePolynomial| 870 |factorPolynomial| 875
              |factor| 880 |extendedSubResultantGcd| 885 |extendedResultant|
              891 |extendedEuclidean| 897 |exquo| 910 |expressIdealMember| 922
              |eval| 928 |euclideanSize| 982 |elt| 987 |divideExponents| 1017
              |divide| 1023 |discriminant| 1029 |differentiate| 1040 |degree|
              1123 |convert| 1140 |content| 1155 |constructOrdered| 1166
              |construct| 1171 |conditionP| 1176 |composite| 1181 |commutator|
              1193 |coerce| 1199 |coefficients| 1239 |coefficient| 1244
              |charthRoot| 1264 |characteristic| 1269 |binomThmExpt| 1273
              |associator| 1280 |associates?| 1287 |antiCommutator| 1293
              |annihilate?| 1299 ^ 1305 |Zero| 1317 |One| 1321 D 1325 = 1401 /
              1407 - 1413 + 1424 * 1430)
           'NIL
           (CONS
            (|makeByteWordVec2| 46
                                '(0 0 14 10 0 14 10 0 18 0 22 4 17 21 4 25 19
                                  23 4 21 3 2 1 26 26 23 13 21 1 0 23 4 5 1 0 0
                                  40 4 4 1 0 0 0 26 40 1 1 0 0 0 0 0 15 13 13
                                  46 13 45 0 0 24 32 30 9 0 0 0 23 13 13 12 7 6
                                  0 0 0 20 16 23 14 13 13 11 36 34 8 7 6 4 0 0
                                  0 0 0 0 0 0 0 0))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&|
                |MaybeSkewPolynomialCategory&| NIL |UniqueFactorizationDomain&|
                |FiniteAbelianMonoidRing&| |GcdDomain&| |AbelianMonoidRing&|
                NIL |DifferentialExtension&| NIL NIL |DifferentialRing&|
                |PartialDifferentialRing&| |EntireRing&| |Algebra&|
                |PartialDifferentialRing&| |Algebra&| NIL NIL |Algebra&| NIL
                |Rng&| |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&| |Module&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL NIL NIL
                NIL |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |MagmaWithUnit&| |AbelianMonoid&| NIL |NonAssociativeSemiRng&|
                NIL NIL NIL NIL |AbelianSemiGroup&| |Magma&|
                |FullyRetractableTo&| NIL |RetractableTo&| |Evalable&|
                |Hashable&| |RetractableTo&| |RetractableTo&| |SetCategory&|
                |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL NIL
                |InnerEvalable&| NIL NIL NIL NIL NIL NIL NIL NIL |BasicType&|
                NIL |InnerEvalable&| |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 17 79) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 6 17 79)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|FiniteAbelianMonoidRing| 6 17) (|GcdDomain|)
                 (|AbelianMonoidRing| 6 17) (|IntegralDomain|)
                 (|DifferentialExtension| 6) (|LeftOreRing|)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 95) (|EntireRing|) (|Algebra| $$)
                 (|PartialDifferentialRing| 79) (|Algebra| 6)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| 100) (|Ring|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|SemiRing|) (|NonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| 100) (|FreeModuleCategory| 6 17)
                 (|Module| $$) (|FullyLinearlyExplicitOver| 6) (|Module| 6)
                 (|Module| 100) (|IndexedDirectProductCategory| 6 17)
                 (|SemiRng|) (|LinearlyExplicitOver| 92)
                 (|LinearlyExplicitOver| 6) (|NonAssociativeRing|)
                 (|BiModule| 100 100) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 17) (|NonAssociativeRng|)
                 (|RightModule| 92) (|RightModule| 100) (|LeftModule| 100)
                 (|LeftModule| $$) (|RightModule| $$) (|RightModule| 6)
                 (|LeftModule| 6) (|AbelianProductCategory| 6) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|StepThrough|) (|PatternMatchable| 92)
                 (|PatternMatchable| (|Float|)) (|Comparable|)
                 (|AbelianSemiGroup|) (|Magma|) (|FullyRetractableTo| 6)
                 (|CommutativeStar|) (|RetractableTo| 79) (|Evalable| $$)
                 (|Hashable|) (|RetractableTo| 92) (|RetractableTo| 100)
                 (|SetCategory|) (|RetractableTo| 6)
                 (|RetractableTo| (|SparseUnivariatePolynomial| 6))
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|additiveValuation|) (|CoercibleFrom| 79)
                 (|InnerEvalable| $$ $$) (|ConvertibleTo| 86)
                 (|ConvertibleTo| 88) (|ConvertibleTo| 87)
                 (|canonicalUnitNormal|) (|CoercibleFrom| 92)
                 (|CoercibleFrom| 100) (|unitsKnown|) (|CoercibleTo| 69)
                 (|BasicType|) (|CoercibleFrom| 6) (|InnerEvalable| 79 6)
                 (|InnerEvalable| 79 $$) (|VariablesCommuteWithCoefficients|)
                 (|Eltable| 6 6) (|Eltable| $$ $$)
                 (|CoercibleTo| (|SparseUnivariatePolynomial| 6))
                 (|CoercibleFrom| (|SparseUnivariatePolynomial| 6)))
              (|makeByteWordVec2| 123
                                  '(1 0 11 0 12 1 0 11 0 13 0 6 0 14 2 6 11 0 0
                                    15 2 17 16 0 0 18 4 0 0 0 17 6 0 19 0 0 0
                                    21 0 6 0 22 2 0 0 6 0 23 0 0 0 24 1 6 0 0
                                    27 1 0 0 0 28 2 33 2 2 2 34 2 0 0 0 0 35 2
                                    33 36 2 2 37 2 0 38 0 0 39 2 33 2 2 2 40 2
                                    0 0 0 0 41 2 33 6 2 2 42 2 0 6 0 0 43 2 33
                                    44 2 2 45 2 0 46 0 0 47 2 33 48 2 2 49 2 0
                                    50 0 0 51 2 33 52 2 2 53 2 0 54 0 0 55 2 33
                                    56 2 2 57 2 0 58 0 0 59 2 33 60 2 2 61 2 0
                                    62 0 0 63 2 33 64 2 2 65 2 0 66 0 0 67 2 0
                                    11 0 0 1 1 56 11 0 12 2 0 83 0 17 1 1 0 78
                                    0 1 1 0 0 83 1 1 0 0 5 1 1 0 5 0 1 2 0 81 0
                                    79 1 1 50 99 0 1 1 50 0 0 1 1 50 11 0 1 2 0
                                    17 0 78 1 2 0 17 0 78 1 1 0 17 0 1 1 0 74 0
                                    1 2 57 16 0 0 1 2 20 38 0 0 39 2 20 0 0 0
                                    35 1 10 113 81 1 1 17 0 0 1 1 17 108 0 1 2
                                    10 114 115 81 1 2 9 11 0 0 1 2 14 11 0 0 1
                                    2 4 0 0 17 1 2 0 0 0 17 1 2 17 109 0 0 1 0
                                    56 0 1 1 54 16 0 1 2 0 0 0 70 1 2 54 0 0 17
                                    1 1 0 76 0 1 1 0 9 0 10 1 6 116 0 1 1 7 117
                                    0 1 1 13 80 0 1 1 0 6 0 1 1 0 5 0 1 1 6 100
                                    0 1 1 7 92 0 1 1 13 79 0 1 3 5 0 0 0 79 1 2
                                    5 6 0 0 43 2 14 0 0 0 1 1 27 0 0 1 1 39 91
                                    85 1 2 39 93 85 94 1 2 4 118 85 94 1 1 4
                                    119 85 1 1 54 16 0 1 2 14 0 0 0 1 2 4 0 0 0
                                    1 2 20 0 0 0 1 2 20 112 0 0 1 1 14 107 38 1
                                    1 17 0 0 1 2 17 0 0 79 1 1 13 38 0 1 1 10
                                    11 0 1 4 0 0 0 6 17 0 1 2 51 0 0 70 1 3 29
                                    97 0 87 97 1 3 31 98 0 88 98 1 2 20 17 0 0
                                    1 2 56 11 0 0 1 1 54 11 0 1 1 0 17 0 1 1 24
                                    16 0 1 2 0 0 81 79 1 2 0 0 5 79 1 2 0 0 0
                                    17 1 2 14 82 38 0 1 1 0 38 0 1 1 0 11 0 1 2
                                    0 0 6 17 1 3 0 0 0 78 74 1 3 0 0 0 79 17 1
                                    2 0 0 0 0 20 3 4 106 0 0 79 1 2 4 106 0 0 1
                                    1 0 17 0 1 2 0 74 0 78 1 2 0 17 0 79 1 2 0
                                    0 77 0 1 2 0 0 73 0 1 1 0 5 0 1 1 0 80 0 1
                                    1 0 72 0 1 2 5 6 101 0 1 1 54 16 0 1 2 0 0
                                    0 70 1 2 54 0 0 17 1 1 27 71 0 1 1 27 17 0
                                    1 1 27 0 0 1 1 27 6 0 1 2 17 110 0 0 1 2 17
                                    0 0 0 1 1 17 0 38 1 2 0 25 0 0 26 2 0 0 0 0
                                    29 2 0 0 0 0 32 2 0 30 0 0 31 1 0 68 0 1 2
                                    20 0 0 0 41 2 4 106 0 17 1 1 13 82 0 1 1 0
                                    82 0 1 1 13 121 0 1 1 1 0 0 1 0 24 0 1 2 12
                                    89 89 0 1 1 12 90 0 1 2 20 66 0 0 67 2 20
                                    62 0 0 63 2 20 54 0 0 55 2 20 50 0 0 51 1 0
                                    11 0 13 1 0 6 0 1 2 17 81 81 81 1 2 17 0 0
                                    0 1 1 17 0 38 1 4 4 0 0 17 6 0 19 1 10 113
                                    81 1 1 10 113 81 1 1 10 108 0 1 2 20 58 0 0
                                    59 2 20 46 0 0 47 2 14 103 0 0 1 3 14 105 0
                                    0 0 1 2 50 16 0 0 1 2 16 16 0 6 1 2 14 82
                                    38 0 1 3 0 0 0 79 6 1 3 0 0 0 78 75 1 3 0 0
                                    0 78 38 1 3 0 0 0 79 0 1 2 13 0 0 122 1 3
                                    13 0 0 0 0 1 2 13 0 0 123 1 3 13 0 0 38 38
                                    1 1 14 17 0 1 2 0 0 0 0 1 2 0 6 0 6 1 2 14
                                    6 102 6 1 2 20 102 102 102 1 2 20 102 0 102
                                    1 2 0 16 0 17 1 2 14 106 0 0 1 2 5 0 0 79 1
                                    1 5 6 0 1 2 37 0 0 95 1 3 37 0 0 95 17 1 2
                                    37 0 0 96 1 3 37 0 0 96 74 1 3 4 0 0 79 17
                                    1 3 4 0 0 78 74 1 2 4 0 0 79 1 2 4 0 0 78 1
                                    3 4 0 0 73 0 1 2 4 0 0 73 1 3 4 0 0 73 17 1
                                    2 4 0 0 17 1 1 4 0 0 1 1 0 17 0 1 2 0 74 0
                                    78 1 2 0 17 0 79 1 1 11 86 0 1 1 33 87 0 1
                                    1 35 88 0 1 1 17 6 0 1 2 17 0 0 79 1 1 27 0
                                    72 1 1 0 0 72 1 1 48 84 85 1 2 20 16 0 0 1
                                    2 20 111 102 0 1 2 55 0 0 0 1 1 0 69 0 1 1
                                    0 0 6 1 1 0 5 0 7 1 0 0 5 8 1 52 0 0 1 1 53
                                    0 92 1 1 28 0 100 1 1 13 0 79 1 1 0 75 0 1
                                    2 0 6 0 17 1 3 0 0 0 78 74 1 3 0 0 0 79 17
                                    1 1 49 16 0 1 0 55 17 1 3 47 0 0 0 17 1 3
                                    55 0 0 0 0 1 2 50 11 0 0 1 2 0 0 0 0 1 2 55
                                    11 0 0 1 2 0 0 0 70 1 2 54 0 0 17 1 0 56 0
                                    21 0 54 0 24 2 37 0 0 95 1 2 37 0 0 96 1 3
                                    37 0 0 96 74 1 3 37 0 0 95 17 1 3 4 0 0 78
                                    74 1 3 4 0 0 79 17 1 2 4 0 0 79 1 2 4 0 0
                                    78 1 2 4 0 0 73 1 3 4 0 0 73 17 1 2 4 0 0
                                    17 1 1 4 0 0 1 2 0 11 0 0 1 2 14 0 0 6 1 1
                                    58 0 0 28 2 58 0 0 0 1 2 0 0 0 0 1 2 0 0 70
                                    0 1 2 0 0 0 0 1 2 0 0 0 6 1 2 0 0 6 0 23 2
                                    39 0 0 92 1 2 58 0 92 0 1 2 56 0 17 0 1 2 1
                                    0 100 0 1 2 1 0 0 100 1)))))
           '|lookupComplete|)) 
