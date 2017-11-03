
(PUT '|NSUP;rep| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |NSUP;rep|
        ((|s| $)
         ($ |List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
        |s|) 

(PUT '|NSUP;per| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |NSUP;per|
        ((|l| |List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R)))
         ($ $))
        |l|) 

(PUT '|NSUP;coerce;$Sup;3| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NSUP;coerce;$Sup;3| ((|p| $) ($ |SparseUnivariatePolynomial| R)) |p|) 

(PUT '|NSUP;coerce;Sup$;4| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NSUP;coerce;Sup$;4| ((|p| |SparseUnivariatePolynomial| R) ($ $)) |p|) 

(PUT '|NSUP;retractIfCan;$U;5| '|SPADreplace| '(XLAM (|p|) (CONS 0 |p|))) 

(SDEFUN |NSUP;retractIfCan;$U;5|
        ((|p| $) ($ |Union| (|SparseUnivariatePolynomial| R) "failed"))
        (CONS 0 |p|)) 

(SDEFUN |NSUP;monicModulo;3$;6| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G751 NIL)
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|e| (|NonNegativeInteger|)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 12))
            (|error| "in monicModulo$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT $ 13))
            (|error| "in monicModulo$NSUP: ground? #2"))
           (#3='T
            (SEQ (LETT |yy| (|NSUP;rep| |y| $) . #4=(|NSUP;monicModulo;3$;6|))
                 (COND
                  ((NULL
                    (SPADCALL (QCDR (|SPADfirst| |yy|)) (|spadConstant| $ 14)
                              (QREFELT $ 15)))
                   (EXIT (|error| "in monicModulo$NSUP: not monic #2"))))
                 (LETT |xx| (|NSUP;rep| |x| $) . #4#)
                 (EXIT
                  (COND ((NULL |xx|) |x|)
                        (#3#
                         (SEQ (LETT |e| (QCAR (|SPADfirst| |yy|)) . #4#)
                              (LETT |y| (|NSUP;per| (CDR |yy|) $) . #4#)
                              (SEQ
                               (EXIT
                                (SEQ G190 NIL
                                     (SEQ
                                      (SEQ
                                       (LETT |u|
                                             (SPADCALL
                                              (QCAR (|SPADfirst| |xx|)) |e|
                                              (QREFELT $ 18))
                                             . #4#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR |u| 1)
                                          (PROGN
                                           (LETT #1# |$NoValue| . #4#)
                                           (GO #5=#:G745))))))
                                      (LETT |xx|
                                            (|NSUP;rep|
                                             (SPADCALL
                                              (|NSUP;per| (CDR |xx|) $)
                                              (QCDR |u|)
                                              (QCDR (|SPADfirst| |xx|)) |y|
                                              (QREFELT $ 19))
                                             $)
                                            . #4#)
                                      (EXIT
                                       (COND
                                        ((NULL |xx|)
                                         (PROGN
                                          (LETT #1# |$NoValue| . #4#)
                                          (GO #5#))))))
                                     NIL (GO G190) G191 (EXIT NIL)))
                               #5# (EXIT #1#))
                              (EXIT (|NSUP;per| |xx| $)))))))))))) 

(SDEFUN |NSUP;lazyResidueClass;2$R;7|
        ((|x| $) (|y| $)
         ($ |Record| (|:| |polnum| $) (|:| |polden| R)
          (|:| |power| (|NonNegativeInteger|))))
        (SPROG
         ((#1=#:G765 NIL) (|pow| (|NonNegativeInteger|))
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|e| (|NonNegativeInteger|)) (|co| (R)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 12))
            (|error| "in lazyResidueClass$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT $ 13))
            (|error| "in lazyResidueClass$NSUP: ground? #2"))
           (#3='T
            (SEQ
             (LETT |yy| (|NSUP;rep| |y| $)
                   . #4=(|NSUP;lazyResidueClass;2$R;7|))
             (LETT |co| (QCDR (|SPADfirst| |yy|)) . #4#)
             (LETT |xx| (|NSUP;rep| |x| $) . #4#)
             (EXIT
              (COND ((NULL |xx|) (VECTOR |x| |co| 0))
                    (#3#
                     (SEQ (LETT |pow| 0 . #4#)
                          (LETT |e| (QCAR (|SPADfirst| |yy|)) . #4#)
                          (LETT |y| (|NSUP;per| (CDR |yy|) $) . #4#)
                          (SEQ
                           (EXIT
                            (SEQ G190 NIL
                                 (SEQ
                                  (SEQ
                                   (LETT |u|
                                         (SPADCALL (QCAR (|SPADfirst| |xx|))
                                                   |e| (QREFELT $ 18))
                                         . #4#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR |u| 1)
                                      (PROGN
                                       (LETT #1# |$NoValue| . #4#)
                                       (GO #5=#:G758))))))
                                  (LETT |xx|
                                        (|NSUP;rep|
                                         (SPADCALL
                                          (SPADCALL |co|
                                                    (|NSUP;per| (CDR |xx|) $)
                                                    (QREFELT $ 23))
                                          (QCDR |u|) (QCDR (|SPADfirst| |xx|))
                                          |y| (QREFELT $ 19))
                                         $)
                                        . #4#)
                                  (LETT |pow| (+ |pow| 1) . #4#)
                                  (EXIT
                                   (COND
                                    ((NULL |xx|)
                                     (PROGN
                                      (LETT #1# |$NoValue| . #4#)
                                      (GO #5#))))))
                                 NIL (GO G190) G191 (EXIT NIL)))
                           #5# (EXIT #1#))
                          (EXIT
                           (VECTOR (|NSUP;per| |xx| $) |co| |pow|)))))))))))) 

(SDEFUN |NSUP;lazyPseudoRemainder;3$;8| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G779 NIL)
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|e| (|NonNegativeInteger|)) (|co| (R)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 12))
            (|error| "in lazyPseudoRemainder$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT $ 13))
            (|error| "in lazyPseudoRemainder$NSUP: ground? #2"))
           ((SPADCALL |x| (QREFELT $ 13)) |x|)
           (#3='T
            (SEQ
             (LETT |yy| (|NSUP;rep| |y| $)
                   . #4=(|NSUP;lazyPseudoRemainder;3$;8|))
             (LETT |co| (QCDR (|SPADfirst| |yy|)) . #4#)
             (EXIT
              (COND
               ((SPADCALL |co| (|spadConstant| $ 14) (QREFELT $ 15))
                (SPADCALL |x| |y| (QREFELT $ 20)))
               ((SPADCALL |co| (SPADCALL (|spadConstant| $ 14) (QREFELT $ 27))
                          (QREFELT $ 15))
                (SPADCALL
                 (SPADCALL (SPADCALL |x| (QREFELT $ 28))
                           (SPADCALL |y| (QREFELT $ 28)) (QREFELT $ 20))
                 (QREFELT $ 28)))
               (#3#
                (SEQ (LETT |xx| (|NSUP;rep| |x| $) . #4#)
                     (LETT |e| (QCAR (|SPADfirst| |yy|)) . #4#)
                     (LETT |y| (|NSUP;per| (CDR |yy|) $) . #4#)
                     (SEQ
                      (EXIT
                       (SEQ G190 NIL
                            (SEQ
                             (SEQ
                              (LETT |u|
                                    (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                              (QREFELT $ 18))
                                    . #4#)
                              (EXIT
                               (COND
                                ((QEQCAR |u| 1)
                                 (PROGN
                                  (LETT #1# |$NoValue| . #4#)
                                  (GO #5=#:G771))))))
                             (LETT |xx|
                                   (|NSUP;rep|
                                    (SPADCALL
                                     (SPADCALL |co| (|NSUP;per| (CDR |xx|) $)
                                               (QREFELT $ 23))
                                     (QCDR |u|) (QCDR (|SPADfirst| |xx|)) |y|
                                     (QREFELT $ 19))
                                    $)
                                   . #4#)
                             (EXIT
                              (COND
                               ((NULL |xx|)
                                (PROGN
                                 (LETT #1# |$NoValue| . #4#)
                                 (GO #5#))))))
                            NIL (GO G190) G191 (EXIT NIL)))
                      #5# (EXIT #1#))
                     (EXIT (|NSUP;per| |xx| $)))))))))))) 

(SDEFUN |NSUP;lazyPseudoDivide;2$R;9|
        ((|x| $) (|y| $)
         ($ |Record| (|:| |coef| R) (|:| |gap| (|NonNegativeInteger|))
          (|:| |quotient| $) (|:| |remainder| $)))
        (SPROG
         ((#1=#:G795 NIL) (|pow| (|NonNegativeInteger|)) (#2=#:G784 NIL)
          (|xx|
           #3=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|qq|
           (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) #4="failed")) (|co| (R))
          (|e| (|NonNegativeInteger|)) (|yy| #3#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 12))
            (|error| "in lazyPseudoDivide$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT $ 13))
            (|error| "in lazyPseudoDivide$NSUP: ground? #2"))
           ('T
            (SEQ
             (LETT |yy| (|NSUP;rep| |y| $)
                   . #5=(|NSUP;lazyPseudoDivide;2$R;9|))
             (LETT |e| (QCAR (|SPADfirst| |yy|)) . #5#)
             (LETT |xx| (|NSUP;rep| |x| $) . #5#)
             (LETT |co| (QCDR (|SPADfirst| |yy|)) . #5#)
             (COND
              ((OR (NULL |xx|) (< (QCAR (|SPADfirst| |xx|)) |e|))
               (EXIT (VECTOR |co| 0 (|spadConstant| $ 21) |x|))))
             (LETT |pow|
                   (+
                    (PROG2
                        (LETT #2#
                              (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                        (QREFELT $ 18))
                              . #5#)
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                      (|Union| (|NonNegativeInteger|) #4#)
                                      #2#))
                    1)
                   . #5#)
             (LETT |qq| NIL . #5#) (LETT |y| (|NSUP;per| (CDR |yy|) $) . #5#)
             (SEQ
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (SEQ
                      (LETT |u|
                            (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                      (QREFELT $ 18))
                            . #5#)
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (PROGN (LETT #1# |$NoValue| . #5#) (GO #6=#:G788))))))
                     (LETT |qq|
                           (CONS (CONS (QCDR |u|) (QCDR (|SPADfirst| |xx|)))
                                 (|NSUP;rep|
                                  (SPADCALL |co| (|NSUP;per| |qq| $)
                                            (QREFELT $ 23))
                                  $))
                           . #5#)
                     (LETT |xx|
                           (|NSUP;rep|
                            (SPADCALL
                             (SPADCALL |co| (|NSUP;per| (CDR |xx|) $)
                                       (QREFELT $ 23))
                             (QCDR |u|) (QCDR (|SPADfirst| |xx|)) |y|
                             (QREFELT $ 19))
                            $)
                           . #5#)
                     (LETT |pow|
                           (PROG2
                               (LETT #2# (SPADCALL |pow| 1 (QREFELT $ 18))
                                     . #5#)
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0)
                                             (|NonNegativeInteger|)
                                             (|Union| (|NonNegativeInteger|)
                                                      #4#)
                                             #2#))
                           . #5#)
                     (EXIT
                      (COND
                       ((NULL |xx|)
                        (PROGN (LETT #1# |$NoValue| . #5#) (GO #6#))))))
                    NIL (GO G190) G191 (EXIT NIL)))
              #6# (EXIT #1#))
             (EXIT
              (VECTOR |co| |pow| (|NSUP;per| (REVERSE |qq|) $)
                      (|NSUP;per| |xx| $))))))))) 

(SDEFUN |NSUP;lazyPseudoQuotient;3$;10| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G809 NIL)
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|qq|
           (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed")) (|co| (R))
          (|e| (|NonNegativeInteger|)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 12))
            (|error| "in lazyPseudoQuotient$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT $ 13))
            (|error| "in lazyPseudoQuotient$NSUP: ground? #2"))
           ('T
            (SEQ
             (LETT |yy| (|NSUP;rep| |y| $)
                   . #3=(|NSUP;lazyPseudoQuotient;3$;10|))
             (LETT |e| (QCAR (|SPADfirst| |yy|)) . #3#)
             (LETT |xx| (|NSUP;rep| |x| $) . #3#)
             (COND
              ((OR (NULL |xx|) (< (QCAR (|SPADfirst| |xx|)) |e|))
               (EXIT (|spadConstant| $ 21))))
             (LETT |qq| NIL . #3#) (LETT |co| (QCDR (|SPADfirst| |yy|)) . #3#)
             (LETT |y| (|NSUP;per| (CDR |yy|) $) . #3#)
             (SEQ
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (SEQ
                      (LETT |u|
                            (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                      (QREFELT $ 18))
                            . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (PROGN (LETT #1# |$NoValue| . #3#) (GO #4=#:G803))))))
                     (LETT |qq|
                           (CONS (CONS (QCDR |u|) (QCDR (|SPADfirst| |xx|)))
                                 (|NSUP;rep|
                                  (SPADCALL |co| (|NSUP;per| |qq| $)
                                            (QREFELT $ 23))
                                  $))
                           . #3#)
                     (LETT |xx|
                           (|NSUP;rep|
                            (SPADCALL
                             (SPADCALL |co| (|NSUP;per| (CDR |xx|) $)
                                       (QREFELT $ 23))
                             (QCDR |u|) (QCDR (|SPADfirst| |xx|)) |y|
                             (QREFELT $ 19))
                            $)
                           . #3#)
                     (EXIT
                      (COND
                       ((NULL |xx|)
                        (PROGN (LETT #1# |$NoValue| . #3#) (GO #4#))))))
                    NIL (GO G190) G191 (EXIT NIL)))
              #4# (EXIT #1#))
             (EXIT (|NSUP;per| (REVERSE |qq|) $)))))))) 

(SDEFUN |NSUP;subResultantGcd;3$;11| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 34))) 

(SDEFUN |NSUP;subResultantsChain;2$L;12| ((|p1| $) (|p2| $) ($ |List| $))
        (SPADCALL |p1| |p2| (QREFELT $ 37))) 

(SDEFUN |NSUP;lastSubResultant;3$;13| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 40))) 

(SDEFUN |NSUP;resultant;2$R;14| ((|p1| $) (|p2| $) ($ R))
        (SPADCALL |p1| |p2| (QREFELT $ 42))) 

(SDEFUN |NSUP;extendedResultant;2$R;15|
        ((|p1| $) (|p2| $)
         ($ |Record| (|:| |resultant| R) (|:| |coef1| $) (|:| |coef2| $)))
        (SPROG
         ((|re|
           (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |resultant| R))))
         (SEQ
          (LETT |re| (SPADCALL |p1| |p2| (QREFELT $ 45))
                |NSUP;extendedResultant;2$R;15|)
          (EXIT (VECTOR (QVELT |re| 2) (QVELT |re| 0) (QVELT |re| 1)))))) 

(SDEFUN |NSUP;halfExtendedResultant1;2$R;16|
        ((|p1| $) (|p2| $) ($ |Record| (|:| |resultant| R) (|:| |coef1| $)))
        (SPROG ((|re| (|Record| (|:| |coef1| $) (|:| |resultant| R))))
               (SEQ
                (LETT |re| (SPADCALL |p1| |p2| (QREFELT $ 49))
                      |NSUP;halfExtendedResultant1;2$R;16|)
                (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;halfExtendedResultant2;2$R;17|
        ((|p1| $) (|p2| $) ($ |Record| (|:| |resultant| R) (|:| |coef2| $)))
        (SPROG ((|re| (|Record| (|:| |coef2| $) (|:| |resultant| R))))
               (SEQ
                (LETT |re| (SPADCALL |p1| |p2| (QREFELT $ 53))
                      |NSUP;halfExtendedResultant2;2$R;17|)
                (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;extendedSubResultantGcd;2$R;18|
        ((|p1| $) (|p2| $)
         ($ |Record| (|:| |gcd| $) (|:| |coef1| $) (|:| |coef2| $)))
        (SPROG
         ((|re| (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |gcd| $))))
         (SEQ
          (LETT |re| (SPADCALL |p1| |p2| (QREFELT $ 57))
                |NSUP;extendedSubResultantGcd;2$R;18|)
          (EXIT (VECTOR (QVELT |re| 2) (QVELT |re| 0) (QVELT |re| 1)))))) 

(SDEFUN |NSUP;halfExtendedSubResultantGcd1;2$R;19|
        ((|p1| $) (|p2| $) ($ |Record| (|:| |gcd| $) (|:| |coef1| $)))
        (SPROG ((|re| (|Record| (|:| |coef1| $) (|:| |gcd| $))))
               (SEQ
                (LETT |re| (SPADCALL |p1| |p2| (QREFELT $ 61))
                      |NSUP;halfExtendedSubResultantGcd1;2$R;19|)
                (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;halfExtendedSubResultantGcd2;2$R;20|
        ((|p1| $) (|p2| $) ($ |Record| (|:| |gcd| $) (|:| |coef2| $)))
        (SPROG ((|re| (|Record| (|:| |coef2| $) (|:| |gcd| $))))
               (SEQ
                (LETT |re| (SPADCALL |p1| |p2| (QREFELT $ 65))
                      |NSUP;halfExtendedSubResultantGcd2;2$R;20|)
                (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(DECLAIM (NOTINLINE |NewSparseUnivariatePolynomial;|)) 

(DEFUN |NewSparseUnivariatePolynomial| (#1=#:G915)
  (SPROG NIL
         (PROG (#2=#:G916)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|NewSparseUnivariatePolynomial|)
                                               '|domainEqualList|)
                    . #3=(|NewSparseUnivariatePolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|NewSparseUnivariatePolynomial;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|NewSparseUnivariatePolynomial|)))))))))) 

(DEFUN |NewSparseUnivariatePolynomial;| (|#1|)
  (SPROG
   ((#1=#:G914 NIL) (|pv$| NIL) (#2=#:G906 NIL) (#3=#:G907 NIL) (#4=#:G908 NIL)
    (#5=#:G909 NIL) (#6=#:G910 NIL) (#7=#:G911 NIL) (#8=#:G912 NIL)
    (#9=#:G913 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #10=(|NewSparseUnivariatePolynomial|))
    (LETT |dv$| (LIST '|NewSparseUnivariatePolynomial| DV$1) . #10#)
    (LETT $ (GETREFV 121) . #10#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
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
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              . #10#)
                                        (OR (|HasCategory| |#1| '(|Field|)) #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #9#)
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #10#)
                                        (OR (|HasCategory| |#1| '(|Field|)) #9#
                                            #8#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
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
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Float|))))
                                              . #10#)
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
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
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
                                          (|HasCategory| |#1| '(|Field|))
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
                                          #8#
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
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Integer|))))
                                              . #10#)
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
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
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
                                          (|HasCategory| |#1| '(|Field|))
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
                                          #8#
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
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|)))))
                                              . #10#)
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
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
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
                                          #8#
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
                                         #5#)
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|)))))
                                              . #10#)
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
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
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
                                          #8#
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
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #10#)
                                        (OR #3# (|HasCategory| |#1| '(|Field|))
                                            #9# #8#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #3# #9# #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #3#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #9#
                                         #8#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #10#)
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
                                         #2#)))
                    . #10#))
    (|haddProp| |$ConstructorCache| '|NewSparseUnivariatePolynomial|
                (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 2199023255552))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #10#)
     (|augmentPredVector| $ 4398046511104))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 8796093022208))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 17592186044416))
    (AND
     (OR (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #9#
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 35184372088832))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 70368744177664))
    (AND
     (OR (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 140737488355328))
    (AND
     (OR (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 281474976710656))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 562949953421312))
    (AND
     (OR #2# (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 2251799813685248))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 19)
      (PROGN
       (QSETREFV $ 35
                 (CONS (|dispatchFunction| |NSUP;subResultantGcd;3$;11|) $))
       (QSETREFV $ 39
                 (CONS (|dispatchFunction| |NSUP;subResultantsChain;2$L;12|)
                       $))
       (QSETREFV $ 41
                 (CONS (|dispatchFunction| |NSUP;lastSubResultant;3$;13|) $))
       (QSETREFV $ 43 (CONS (|dispatchFunction| |NSUP;resultant;2$R;14|) $))
       (QSETREFV $ 47
                 (CONS (|dispatchFunction| |NSUP;extendedResultant;2$R;15|) $))
       (QSETREFV $ 51
                 (CONS
                  (|dispatchFunction| |NSUP;halfExtendedResultant1;2$R;16|) $))
       (QSETREFV $ 55
                 (CONS
                  (|dispatchFunction| |NSUP;halfExtendedResultant2;2$R;17|) $))
       (QSETREFV $ 59
                 (CONS
                  (|dispatchFunction| |NSUP;extendedSubResultantGcd;2$R;18|)
                  $))
       (QSETREFV $ 63
                 (CONS
                  (|dispatchFunction|
                   |NSUP;halfExtendedSubResultantGcd1;2$R;19|)
                  $))
       (QSETREFV $ 67
                 (CONS
                  (|dispatchFunction|
                   |NSUP;halfExtendedSubResultantGcd2;2$R;20|)
                  $)))))
    $))) 

(MAKEPROP '|NewSparseUnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 6)
              (|local| |#1|) |NSUP;coerce;$Sup;3| |NSUP;coerce;Sup$;4|
              (|Union| 5 '"failed") |NSUP;retractIfCan;$U;5| (|Boolean|)
              (0 . |zero?|) (5 . |ground?|) (10 . |One|) (14 . =)
              (|Union| $ '"failed") (|NonNegativeInteger|)
              (20 . |subtractIfCan|) (26 . |fmecg|) |NSUP;monicModulo;3$;6|
              (34 . |Zero|) (38 . |Zero|) (42 . *) (48 . |One|)
              (|Record| (|:| |polnum| $) (|:| |polden| 6) (|:| |power| 17))
              |NSUP;lazyResidueClass;2$R;7| (52 . -) (57 . -)
              |NSUP;lazyPseudoRemainder;3$;8|
              (|Record| (|:| |coef| 6) (|:| |gap| 17) (|:| |quotient| $)
                        (|:| |remainder| $))
              |NSUP;lazyPseudoDivide;2$R;9| |NSUP;lazyPseudoQuotient;3$;10|
              (|PseudoRemainderSequence| 6 $$) (62 . |subResultantGcd|)
              (68 . |subResultantGcd|) (|List| $$) (74 . |chainSubResultants|)
              (|List| $) (80 . |subResultantsChain|) (86 . |lastSubResultant|)
              (92 . |lastSubResultant|) (98 . |resultant|) (104 . |resultant|)
              (|Record| (|:| |coef1| $$) (|:| |coef2| $$) (|:| |resultant| 6))
              (110 . |resultantEuclidean|)
              (|Record| (|:| |resultant| 6) (|:| |coef1| $) (|:| |coef2| $))
              (116 . |extendedResultant|)
              (|Record| (|:| |coef1| $$) (|:| |resultant| 6))
              (122 . |semiResultantEuclidean1|)
              (|Record| (|:| |resultant| 6) (|:| |coef1| $))
              (128 . |halfExtendedResultant1|)
              (|Record| (|:| |coef2| $$) (|:| |resultant| 6))
              (134 . |semiResultantEuclidean2|)
              (|Record| (|:| |resultant| 6) (|:| |coef2| $))
              (140 . |halfExtendedResultant2|)
              (|Record| (|:| |coef1| $$) (|:| |coef2| $$) (|:| |gcd| $$))
              (146 . |subResultantGcdEuclidean|)
              (|Record| (|:| |gcd| $) (|:| |coef1| $) (|:| |coef2| $))
              (152 . |extendedSubResultantGcd|)
              (|Record| (|:| |coef1| $$) (|:| |gcd| $$))
              (158 . |semiSubResultantGcdEuclidean1|)
              (|Record| (|:| |gcd| $) (|:| |coef1| $))
              (164 . |halfExtendedSubResultantGcd1|)
              (|Record| (|:| |coef2| $$) (|:| |gcd| $$))
              (170 . |semiSubResultantGcdEuclidean2|)
              (|Record| (|:| |gcd| $) (|:| |coef2| $))
              (176 . |halfExtendedSubResultantGcd2|) (|Union| 74 '#1="failed")
              (|Matrix| $) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 81)
              (|Record| (|:| |mat| 75) (|:| |vec| (|Vector| 81))) (|Vector| $)
              (|Matrix| 81) (|List| 78) (|List| 17) (|Symbol|)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 81 $)
              (|Integer|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 81) (|SingletonAsOrderedSet|) (|Union| 38 '"failed")
              (|Record| (|:| |coef| 38) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 88 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Fraction| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (|Factored| $)
              (|Record| (|:| |coef| 6) (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 91 '"failed") (|Factored| 93) (|Union| 100 '#1#)
              (|List| 93) (|Union| 83 '#2="failed") (|Union| 81 '#2#)
              (|Mapping| 6 6) (|List| 84)
              (|Record| (|:| |mat| 106) (|:| |vec| 112)) (|Matrix| 6)
              (|Union| 84 '#2#) (|Equation| $) (|List| 108)
              (|Record| (|:| |var| 84) (|:| |exponent| 17))
              (|Union| 110 '"failed") (|Vector| 6) (|List| 6) (|Mapping| 17 17)
              (|Union| 6 '#2#) (|PositiveInteger|) (|HashState|) (|String|)
              (|OutputForm|) (|SingleInteger|))
           '#(~= 182 |zero?| 188 |vectorise| 193 |variables| 199 |unvectorise|
              204 |unmakeSUP| 209 |univariate| 214 |unitNormal| 225
              |unitCanonical| 230 |unit?| 235 |totalDegreeSorted| 240
              |totalDegree| 246 |subtractIfCan| 257 |subResultantsChain| 263
              |subResultantGcd| 269 |squareFreePolynomial| 275 |squareFreePart|
              280 |squareFree| 285 |solveLinearPolynomialEquation| 290
              |smaller?| 296 |sizeLess?| 302 |shiftRight| 308 |shiftLeft| 314
              |separate| 320 |sample| 326 |rightRecip| 330 |rightPower| 335
              |retractIfCan| 347 |retract| 372 |resultant| 397 |rem| 410
              |reductum| 416 |reducedSystem| 421 |recip| 443 |quo| 448
              |pseudoRemainder| 454 |pseudoQuotient| 460 |pseudoDivide| 466
              |principalIdeal| 472 |primitivePart| 477 |primitiveMonomials| 488
              |prime?| 493 |pomopo!| 498 |patternMatch| 506 |order| 520
              |opposite?| 526 |one?| 532 |numberOfMonomials| 537 |nextItem| 542
              |multivariate| 547 |multiplyExponents| 559 |multiEuclidean| 565
              |monomials| 571 |monomial?| 576 |monomial| 581 |monicModulo| 601
              |monicDivide| 607 |minimumDegree| 620 |mapExponents| 637 |map|
              643 |makeSUP| 649 |mainVariable| 654 |leftRecip| 659 |leftPower|
              664 |leadingMonomial| 676 |leadingCoefficient| 681 |lcmCoef| 686
              |lcm| 692 |lazyResidueClass| 703 |lazyPseudoRemainder| 709
              |lazyPseudoQuotient| 715 |lazyPseudoDivide| 721 |latex| 727
              |lastSubResultant| 732 |karatsubaDivide| 738 |isTimes| 744
              |isPlus| 749 |isExpt| 754 |integrate| 759 |init| 764
              |hashUpdate!| 768 |hash| 774 |halfExtendedSubResultantGcd2| 779
              |halfExtendedSubResultantGcd1| 785 |halfExtendedResultant2| 791
              |halfExtendedResultant1| 797 |ground?| 803 |ground| 808
              |gcdPolynomial| 813 |gcd| 819 |fmecg| 830
              |factorSquareFreePolynomial| 838 |factorPolynomial| 843 |factor|
              848 |extendedSubResultantGcd| 853 |extendedResultant| 859
              |extendedEuclidean| 865 |exquo| 878 |expressIdealMember| 890
              |eval| 896 |euclideanSize| 950 |elt| 955 |divideExponents| 985
              |divide| 991 |discriminant| 997 |differentiate| 1008 |degree|
              1091 |convert| 1108 |content| 1123 |conditionP| 1134 |composite|
              1139 |commutator| 1151 |coerce| 1157 |coefficients| 1197
              |coefficient| 1202 |charthRoot| 1222 |characteristic| 1227
              |binomThmExpt| 1231 |associator| 1238 |associates?| 1245
              |antiCommutator| 1251 |annihilate?| 1257 ^ 1263 |Zero| 1275 |One|
              1279 D 1283 = 1359 / 1365 - 1371 + 1382 * 1388)
           'NIL
           (CONS
            (|makeByteWordVec2| 41
                                '(0 0 0 10 13 0 10 13 0 17 20 4 34 16 4 1 2 3
                                  34 4 9 4 35 18 22 4 36 12 36 0 1 34 35 0 0 1
                                  4 0 0 0 0 1 1 36 14 41 12 12 0 0 40 12 0 0 8
                                  26 28 21 0 0 12 0 0 0 0 0 0 0 0 0 0 4 5 6 7
                                  30 32 11 12 12 13 35 15 19))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL
                |FullyLinearlyExplicitOver&| NIL NIL |DifferentialExtension&|
                |Algebra&| NIL NIL |Algebra&| NIL NIL
                |PartialDifferentialRing&| |Algebra&| |EntireRing&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL |Rng&|
                NIL |Module&| |Module&| |Module&| NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |Magma&| |AbelianSemiGroup&| NIL NIL NIL NIL
                |FullyRetractableTo&| |SetCategory&| |Evalable&|
                |RetractableTo&| NIL NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| |BasicType&| NIL NIL
                |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL
                |InnerEvalable&| |RetractableTo&| NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 17 84)
                 (|MaybeSkewPolynomialCategory| 6 17 84)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 6 17) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 6 17)
                 (|GcdDomain|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitOver| 6) (|CommutativeRing|)
                 (|LeftOreRing|) (|DifferentialExtension| 6) (|Algebra| 83)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Algebra| 6)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 81)
                 (|PartialDifferentialRing| 84) (|Algebra| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 78) (|DifferentialRing|) (|Ring|)
                 (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 83) (|Module| 6)
                 (|Module| $$) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|BiModule| 83 83) (|NonAssociativeRing|) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 83) (|RightModule| 83) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 81) (|StepThrough|)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|Evalable| $$)
                 (|RetractableTo| (|SparseUnivariatePolynomial| 6))
                 (|CoercibleTo| (|SparseUnivariatePolynomial| 6))
                 (|Eltable| $$ $$) (|Eltable| 6 6)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 84 $$)
                 (|InnerEvalable| 84 6) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 119) (|unitsKnown|) (|RetractableTo| 83)
                 (|RetractableTo| 81) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 71) (|ConvertibleTo| 72) (|ConvertibleTo| 70)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 84)
                 (|additiveValuation|) (|CommutativeStar|) (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)))
              (|makeByteWordVec2| 120
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
                                    11 0 0 1 1 50 11 0 12 2 0 112 0 17 1 1 0
                                    104 0 1 1 0 0 112 1 1 0 0 5 1 1 0 5 0 1 2 0
                                    93 0 84 1 1 45 82 0 1 1 45 0 0 1 1 45 11 0
                                    1 2 0 17 0 104 1 2 0 17 0 104 1 1 0 17 0 1
                                    2 51 16 0 0 1 2 19 38 0 0 39 2 19 0 0 0 35
                                    1 10 98 93 1 1 16 0 0 1 1 16 95 0 1 2 10 99
                                    100 93 1 2 8 11 0 0 1 2 13 11 0 0 1 2 4 0 0
                                    17 1 2 0 0 0 17 1 2 16 94 0 0 1 0 50 0 1 1
                                    48 16 0 1 2 48 0 0 17 1 2 0 0 0 116 1 1 5
                                    101 0 1 1 6 102 0 1 1 12 107 0 1 1 0 9 0 10
                                    1 0 115 0 1 1 5 83 0 1 1 6 81 0 1 1 12 84 0
                                    1 1 0 5 0 1 1 0 6 0 1 2 33 6 0 0 43 3 33 0
                                    0 0 84 1 2 13 0 0 0 1 1 0 0 0 1 2 24 73 69
                                    74 1 1 24 75 69 1 2 4 105 69 74 1 1 4 106
                                    69 1 1 48 16 0 1 2 13 0 0 0 1 2 4 0 0 0 1 2
                                    19 0 0 0 1 2 19 96 0 0 1 1 13 86 38 1 2 16
                                    0 0 84 1 1 16 0 0 1 1 12 38 0 1 1 10 11 0 1
                                    4 0 0 0 6 17 0 1 3 25 79 0 71 79 1 3 27 80
                                    0 72 80 1 2 19 17 0 0 1 2 50 11 0 0 1 1 48
                                    11 0 1 1 0 17 0 1 1 21 16 0 1 2 0 0 5 84 1
                                    2 0 0 93 84 1 2 0 0 0 17 1 2 13 85 38 0 1 1
                                    0 38 0 1 1 0 11 0 1 3 0 0 0 84 17 1 3 0 0 0
                                    104 77 1 2 0 0 6 17 1 2 0 0 0 0 20 2 4 87 0
                                    0 1 3 4 87 0 0 84 1 2 0 77 0 104 1 2 0 17 0
                                    84 1 1 0 17 0 1 2 0 0 114 0 1 2 0 0 103 0 1
                                    1 0 5 0 1 1 0 107 0 1 1 48 16 0 1 2 48 0 0
                                    17 1 2 0 0 0 116 1 1 0 0 0 1 1 0 6 0 1 2 16
                                    92 0 0 1 2 16 0 0 0 1 1 16 0 38 1 2 0 25 0
                                    0 26 2 0 0 0 0 29 2 0 0 0 0 32 2 0 30 0 0
                                    31 1 0 118 0 1 2 19 0 0 0 41 2 4 87 0 17 1
                                    1 12 85 0 1 1 0 85 0 1 1 12 111 0 1 1 1 0 0
                                    1 0 21 0 1 2 0 117 117 0 1 1 0 120 0 1 2 19
                                    66 0 0 67 2 19 62 0 0 63 2 19 54 0 0 55 2
                                    19 50 0 0 51 1 0 11 0 13 1 0 6 0 1 2 16 93
                                    93 93 1 1 16 0 38 1 2 16 0 0 0 1 4 4 0 0 17
                                    6 0 19 1 10 98 93 1 1 10 98 93 1 1 10 95 0
                                    1 2 19 58 0 0 59 2 19 46 0 0 47 3 13 89 0 0
                                    0 1 2 13 90 0 0 1 2 45 16 0 0 1 2 15 16 0 6
                                    1 2 13 85 38 0 1 3 12 0 0 38 38 1 2 12 0 0
                                    108 1 3 12 0 0 0 0 1 2 12 0 0 109 1 3 0 0 0
                                    84 0 1 3 0 0 0 104 38 1 3 0 0 0 84 6 1 3 0
                                    0 0 104 113 1 1 13 17 0 1 2 13 6 91 6 1 2
                                    19 91 0 91 1 2 19 91 91 91 1 2 0 0 0 0 1 2
                                    0 6 0 6 1 2 0 16 0 17 1 2 13 87 0 0 1 1 33
                                    6 0 1 2 33 0 0 84 1 3 37 0 0 76 77 1 2 37 0
                                    0 76 1 3 37 0 0 78 17 1 2 37 0 0 78 1 1 4 0
                                    0 1 2 4 0 0 17 1 3 4 0 0 103 17 1 2 4 0 0
                                    103 1 3 4 0 0 103 0 1 2 4 0 0 104 1 2 4 0 0
                                    84 1 3 4 0 0 84 17 1 3 4 0 0 104 77 1 2 0
                                    17 0 84 1 2 0 77 0 104 1 1 0 17 0 1 1 11 70
                                    0 1 1 29 71 0 1 1 31 72 0 1 2 16 0 0 84 1 1
                                    16 6 0 1 1 43 68 69 1 2 19 97 91 0 1 2 19
                                    16 0 0 1 2 49 0 0 0 1 1 46 0 0 1 1 47 0 81
                                    1 1 23 0 83 1 1 12 0 84 1 1 0 0 5 8 1 0 5 0
                                    7 1 0 0 6 1 1 0 119 0 1 1 0 113 0 1 3 0 0 0
                                    104 77 1 3 0 0 0 84 17 1 2 0 6 0 17 1 1 44
                                    16 0 1 0 49 17 1 3 42 0 0 0 17 1 3 49 0 0 0
                                    0 1 2 45 11 0 0 1 2 0 0 0 0 1 2 49 11 0 0 1
                                    2 48 0 0 17 1 2 0 0 0 116 1 0 50 0 21 0 48
                                    0 24 3 37 0 0 76 77 1 2 37 0 0 76 1 3 37 0
                                    0 78 17 1 2 37 0 0 78 1 1 4 0 0 1 2 4 0 0
                                    17 1 3 4 0 0 103 17 1 2 4 0 0 103 1 2 4 0 0
                                    84 1 3 4 0 0 84 17 1 2 4 0 0 104 1 3 4 0 0
                                    104 77 1 2 0 11 0 0 1 2 13 0 0 6 1 1 52 0 0
                                    28 2 52 0 0 0 1 2 0 0 0 0 1 2 52 0 81 0 1 2
                                    50 0 17 0 1 2 1 0 0 83 1 2 1 0 83 0 1 2 0 0
                                    6 0 23 2 0 0 0 6 1 2 0 0 0 0 1 2 0 0 116 0
                                    1)))))
           '|lookupComplete|)) 
