
(SDEFUN |FRNAALG-;min_poly_from_matrix|
        ((|mx| |Matrix| (|Polynomial| R)) (|x| |Matrix| (|Polynomial| R))
         ($ |SparseUnivariatePolynomial| (|Polynomial| R)))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| (|Polynomial| R)))
          (#1=#:G730 NIL) (|i| NIL)
          (|vectorOfCoef| (|Vector| (|Polynomial| R)))
          (|cond| (|Matrix| (|Polynomial| R))) (|k| (|PositiveInteger|)))
         (SEQ (LETT |k| 1 . #2=(|FRNAALG-;min_poly_from_matrix|))
              (LETT |cond| (SPADCALL |x| (QREFELT $ 9)) . #2#)
              (SEQ G190
                   (COND
                    ((NULL (EQL (SPADCALL |cond| (QREFELT $ 13)) |k|))
                     (GO G191)))
                   (SEQ (LETT |k| (+ |k| 1) . #2#)
                        (LETT |x| (SPADCALL |mx| |x| (QREFELT $ 17)) . #2#)
                        (EXIT
                         (LETT |cond| (SPADCALL |cond| |x| (QREFELT $ 18))
                               . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |vectorOfCoef|
                    (|SPADfirst| (SPADCALL |cond| (QREFELT $ 20))) . #2#)
              (LETT |res| (|spadConstant| $ 21) . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# |k| . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL
                                      (SPADCALL |vectorOfCoef| |i|
                                                (QREFELT $ 25))
                                      |i| (QREFELT $ 26))
                                     (QREFELT $ 27))
                           . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FRNAALG-;rank_polynomial|
        ((|left| |Boolean|) ($ |SparseUnivariatePolynomial| (|Polynomial| R)))
        (SPROG
         ((|cijk| (R)) (|mxjk| (|Polynomial| R)) (#1=#:G753 NIL) (|k| NIL)
          (#2=#:G752 NIL) (|j| NIL) (|mo| (|Polynomial| R)) (#3=#:G751 NIL)
          (|i| NIL) (|mx| #4=(|Matrix| (|Polynomial| R))) (|x| #4#)
          (|symbolsForCoef| (|Vector| (|Symbol|))) (#5=#:G748 NIL)
          (#6=#:G750 NIL) (#7=#:G749 NIL) (|listOfNumbers| (|List| (|String|)))
          (#8=#:G747 NIL) (|q| NIL) (#9=#:G746 NIL)
          (|gamma| (|Vector| (|Matrix| R))) (|b| (|Vector| S))
          (|n| (|PositiveInteger|)))
         (SEQ
          (LETT |n| (SPADCALL (QREFELT $ 11))
                . #10=(|FRNAALG-;rank_polynomial|))
          (LETT |b| (SPADCALL (QREFELT $ 29)) . #10#)
          (LETT |gamma| (SPADCALL |b| (QREFELT $ 31)) . #10#)
          (LETT |listOfNumbers|
                (PROGN
                 (LETT #9# NIL . #10#)
                 (SEQ (LETT |q| 1 . #10#) (LETT #8# |n| . #10#) G190
                      (COND ((|greater_SI| |q| #8#) (GO G191)))
                      (SEQ
                       (EXIT (LETT #9# (CONS (STRINGIMAGE |q|) #9#) . #10#)))
                      (LETT |q| (|inc_SI| |q|) . #10#) (GO G190) G191
                      (EXIT (NREVERSE #9#))))
                . #10#)
          (LETT |symbolsForCoef|
                (PROGN
                 (LETT #7# (GETREFV (SIZE |listOfNumbers|)) . #10#)
                 (SEQ (LETT |i| NIL . #10#) (LETT #6# |listOfNumbers| . #10#)
                      (LETT #5# 0 . #10#) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#) . #10#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #7# #5#
                                (SPADCALL (STRCONC "%" (STRCONC "x" |i|))
                                          (QREFELT $ 34)))))
                      (LETT #5#
                            (PROG1 (|inc_SI| #5#) (LETT #6# (CDR #6#) . #10#))
                            . #10#)
                      (GO G190) G191 (EXIT NIL))
                 #7#)
                . #10#)
          (LETT |x| (MAKE_MATRIX1 |n| 1 (|spadConstant| $ 35)) . #10#)
          (LETT |mx| (MAKE_MATRIX1 |n| |n| (|spadConstant| $ 35)) . #10#)
          (SEQ (LETT |i| 1 . #10#) (LETT #3# |n| . #10#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (LETT |mo|
                      (SPADCALL (|spadConstant| $ 38)
                                (LIST
                                 (SPADCALL |symbolsForCoef| |i|
                                           (QREFELT $ 40)))
                                (LIST 1) (QREFELT $ 43))
                      . #10#)
                (QSETAREF2O |x| |i| 1 |mo| 1 1)
                (EXIT
                 (SEQ (LETT |j| 1 . #10#) (LETT #2# |n| . #10#) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |k| 1 . #10#) (LETT #1# |n| . #10#) G190
                             (COND ((|greater_SI| |k| #1#) (GO G191)))
                             (SEQ
                              (LETT |mxjk| (QAREF2O |mx| |j| |k| 1 1) . #10#)
                              (LETT |cijk|
                                    (COND
                                     ((OR |left| 'T)
                                      (SPADCALL
                                       (SPADCALL |gamma| |j| (QREFELT $ 45))
                                       |i| |k| (QREFELT $ 46))))
                                    . #10#)
                              (EXIT
                               (QSETAREF2O |mx| |j| |k|
                                           (SPADCALL |mxjk|
                                                     (SPADCALL |mo| |cijk|
                                                               (QREFELT $ 47))
                                                     (QREFELT $ 48))
                                           1 1)))
                             (LETT |k| (|inc_SI| |k|) . #10#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|) . #10#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
          (EXIT (|FRNAALG-;min_poly_from_matrix| |mx| |x| $))))) 

(SDEFUN |FRNAALG-;leftRankPolynomial;Sup;3|
        (($ |SparseUnivariatePolynomial| (|Polynomial| R)))
        (|FRNAALG-;rank_polynomial| 'T $)) 

(SDEFUN |FRNAALG-;rightRankPolynomial;Sup;4|
        (($ |SparseUnivariatePolynomial| (|Polynomial| R)))
        (|FRNAALG-;rank_polynomial| NIL $)) 

(SDEFUN |FRNAALG-;leftUnitsInternal|
        (($ |Record| (|:| |particular| (|Union| (|Vector| R) "failed"))
          (|:| |basis| (|List| (|Vector| R)))))
        (SPROG
         ((#1=#:G767 NIL) (|j| NIL) (|addOn| (R)) (|z| (|Integer|))
          (#2=#:G766 NIL) (|i| NIL) (#3=#:G765 NIL) (|k| NIL)
          (|rhs| (|Vector| R)) (|cond| (|Matrix| R))
          (|gamma| (|Vector| (|Matrix| R))) (|b| (|Vector| S))
          (|n| (|PositiveInteger|)))
         (SEQ
          (LETT |n| (SPADCALL (QREFELT $ 11))
                . #4=(|FRNAALG-;leftUnitsInternal|))
          (LETT |b| (SPADCALL (QREFELT $ 29)) . #4#)
          (LETT |gamma| (SPADCALL |b| (QREFELT $ 31)) . #4#)
          (LETT |cond|
                (MAKE_MATRIX1 (SPADCALL |n| 2 (QREFELT $ 51)) |n|
                              (|spadConstant| $ 37))
                . #4#)
          (LETT |rhs|
                (MAKEARR1 (SPADCALL |n| 2 (QREFELT $ 51))
                          (|spadConstant| $ 37))
                . #4#)
          (LETT |z| 0 . #4#) (LETT |addOn| (|spadConstant| $ 37) . #4#)
          (SEQ (LETT |k| 1 . #4#) (LETT #3# |n| . #4#) G190
               (COND ((|greater_SI| |k| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |i| 1 . #4#) (LETT #2# |n| . #4#) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ (LETT |z| (+ |z| 1) . #4#)
                           (LETT |addOn|
                                 (COND ((EQL |k| |i|) (|spadConstant| $ 14))
                                       ('T (|spadConstant| $ 37)))
                                 . #4#)
                           (SPADCALL |rhs| |z| |addOn| (QREFELT $ 53))
                           (EXIT
                            (SEQ (LETT |j| 1 . #4#) (LETT #1# |n| . #4#) G190
                                 (COND ((|greater_SI| |j| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SPADCALL |cond| |z| |j|
                                             (SPADCALL
                                              (SPADCALL |gamma| |k|
                                                        (QREFELT $ 45))
                                              |j| |i| (QREFELT $ 46))
                                             (QREFELT $ 54))))
                                 (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |cond| |rhs| (QREFELT $ 58)))))) 

(SDEFUN |FRNAALG-;leftUnit;U;6| (($ |Union| S "failed"))
        (SPROG
         ((#1=#:G773 NIL)
          (|res|
           (|Record| (|:| |particular| (|Union| (|Vector| R) #2="failed"))
                     (|:| |basis| (|List| (|Vector| R))))))
         (SEQ
          (LETT |res| (|FRNAALG-;leftUnitsInternal| $)
                . #3=(|FRNAALG-;leftUnit;U;6|))
          (EXIT
           (COND
            ((QEQCAR (QCAR |res|) 1)
             (SEQ (SPADCALL "this algebra has no left unit" (QREFELT $ 61))
                  (EXIT (CONS 1 "failed"))))
            ('T
             (CONS 0
                   (SPADCALL
                    (PROG2 (LETT #1# (QCAR |res|) . #3#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (|Vector| (QREFELT $ 7))
                                      (|Union| (|Vector| (QREFELT $ 7)) #2#)
                                      #1#))
                    (QREFELT $ 62))))))))) 

(SDEFUN |FRNAALG-;leftUnits;U;7|
        (($ |Union| (|Record| (|:| |particular| S) (|:| |basis| (|List| S)))
          "failed"))
        (SPROG
         ((#1=#:G787 NIL)
          (|res|
           (|Record| (|:| |particular| (|Union| (|Vector| R) #2="failed"))
                     (|:| |basis| (|List| (|Vector| R))))))
         (SEQ
          (LETT |res| (|FRNAALG-;leftUnitsInternal| $)
                . #3=(|FRNAALG-;leftUnits;U;7|))
          (EXIT
           (COND
            ((QEQCAR (QCAR |res|) 1)
             (SEQ (SPADCALL "this algebra has no left unit" (QREFELT $ 61))
                  (EXIT (CONS 1 "failed"))))
            ('T
             (CONS 0
                   (CONS
                    (SPADCALL
                     (PROG2 (LETT #1# (QCAR |res|) . #3#)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 0) (|Vector| (QREFELT $ 7))
                                       (|Union| (|Vector| (QREFELT $ 7)) #2#)
                                       #1#))
                     (QREFELT $ 62))
                    (SPADCALL (ELT $ 62) (QCDR |res|) (QREFELT $ 69)))))))))) 

(SDEFUN |FRNAALG-;rightUnitsInternal|
        (($ |Record| (|:| |particular| (|Union| (|Vector| R) "failed"))
          (|:| |basis| (|List| (|Vector| R)))))
        (SPROG
         ((#1=#:G806 NIL) (|j| NIL) (|addOn| (R)) (|z| (|Integer|))
          (#2=#:G805 NIL) (|i| NIL) (#3=#:G804 NIL) (|k| NIL)
          (|rhs| (|Vector| R)) (|condo| (|Matrix| R))
          (|gamma| (|Vector| (|Matrix| R))) (|b| (|Vector| S))
          (|n| (|PositiveInteger|)))
         (SEQ
          (LETT |n| (SPADCALL (QREFELT $ 11))
                . #4=(|FRNAALG-;rightUnitsInternal|))
          (LETT |b| (SPADCALL (QREFELT $ 29)) . #4#)
          (LETT |gamma| (SPADCALL |b| (QREFELT $ 31)) . #4#)
          (LETT |condo|
                (MAKE_MATRIX1 (SPADCALL |n| 2 (QREFELT $ 51)) |n|
                              (|spadConstant| $ 37))
                . #4#)
          (LETT |rhs|
                (MAKEARR1 (SPADCALL |n| 2 (QREFELT $ 51))
                          (|spadConstant| $ 37))
                . #4#)
          (LETT |z| 0 . #4#) (LETT |addOn| (|spadConstant| $ 37) . #4#)
          (SEQ (LETT |k| 1 . #4#) (LETT #3# |n| . #4#) G190
               (COND ((|greater_SI| |k| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |i| 1 . #4#) (LETT #2# |n| . #4#) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ (LETT |z| (+ |z| 1) . #4#)
                           (LETT |addOn|
                                 (COND ((EQL |k| |i|) (|spadConstant| $ 14))
                                       ('T (|spadConstant| $ 37)))
                                 . #4#)
                           (SPADCALL |rhs| |z| |addOn| (QREFELT $ 53))
                           (EXIT
                            (SEQ (LETT |j| 1 . #4#) (LETT #1# |n| . #4#) G190
                                 (COND ((|greater_SI| |j| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SPADCALL |condo| |z| |j|
                                             (SPADCALL
                                              (SPADCALL |gamma| |k|
                                                        (QREFELT $ 45))
                                              |i| |j| (QREFELT $ 46))
                                             (QREFELT $ 54))))
                                 (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |condo| |rhs| (QREFELT $ 58)))))) 

(SDEFUN |FRNAALG-;rightUnit;U;9| (($ |Union| S "failed"))
        (SPROG
         ((#1=#:G812 NIL)
          (|res|
           (|Record| (|:| |particular| (|Union| (|Vector| R) #2="failed"))
                     (|:| |basis| (|List| (|Vector| R))))))
         (SEQ
          (LETT |res| (|FRNAALG-;rightUnitsInternal| $)
                . #3=(|FRNAALG-;rightUnit;U;9|))
          (EXIT
           (COND
            ((QEQCAR (QCAR |res|) 1)
             (SEQ (SPADCALL "this algebra has no right unit" (QREFELT $ 61))
                  (EXIT (CONS 1 "failed"))))
            ('T
             (CONS 0
                   (SPADCALL
                    (PROG2 (LETT #1# (QCAR |res|) . #3#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (|Vector| (QREFELT $ 7))
                                      (|Union| (|Vector| (QREFELT $ 7)) #2#)
                                      #1#))
                    (QREFELT $ 62))))))))) 

(SDEFUN |FRNAALG-;rightUnits;U;10|
        (($ |Union| (|Record| (|:| |particular| S) (|:| |basis| (|List| S)))
          "failed"))
        (SPROG
         ((#1=#:G823 NIL)
          (|res|
           (|Record| (|:| |particular| (|Union| (|Vector| R) #2="failed"))
                     (|:| |basis| (|List| (|Vector| R))))))
         (SEQ
          (LETT |res| (|FRNAALG-;rightUnitsInternal| $)
                . #3=(|FRNAALG-;rightUnits;U;10|))
          (EXIT
           (COND
            ((QEQCAR (QCAR |res|) 1)
             (SEQ (SPADCALL "this algebra has no right unit" (QREFELT $ 61))
                  (EXIT (CONS 1 "failed"))))
            ('T
             (CONS 0
                   (CONS
                    (SPADCALL
                     (PROG2 (LETT #1# (QCAR |res|) . #3#)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 0) (|Vector| (QREFELT $ 7))
                                       (|Union| (|Vector| (QREFELT $ 7)) #2#)
                                       #1#))
                     (QREFELT $ 62))
                    (SPADCALL (ELT $ 62) (QCDR |res|) (QREFELT $ 69)))))))))) 

(SDEFUN |FRNAALG-;unit;U;11| (($ |Union| S "failed"))
        (SPROG
         ((#1=#:G839 NIL)
          (|res|
           (|Record| (|:| |particular| (|Union| (|Vector| R) "failed"))
                     (|:| |basis| (|List| (|Vector| R)))))
          (#2=#:G846 NIL) (|j| NIL) (|addOn| (R)) (|z| (|Integer|))
          (#3=#:G845 NIL) (|i| NIL) (#4=#:G844 NIL) (|k| NIL) (|u| (|Integer|))
          (|rhs| (|Vector| R)) (|cond| (|Matrix| R))
          (|gamma| (|Vector| (|Matrix| R))) (|b| (|Vector| S))
          (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT $ 11)) . #5=(|FRNAALG-;unit;U;11|))
              (LETT |b| (SPADCALL (QREFELT $ 29)) . #5#)
              (LETT |gamma| (SPADCALL |b| (QREFELT $ 31)) . #5#)
              (LETT |cond|
                    (MAKE_MATRIX1 (* 2 (SPADCALL |n| 2 (QREFELT $ 51))) |n|
                                  (|spadConstant| $ 37))
                    . #5#)
              (LETT |rhs|
                    (MAKEARR1 (* 2 (SPADCALL |n| 2 (QREFELT $ 51)))
                              (|spadConstant| $ 37))
                    . #5#)
              (LETT |z| 0 . #5#) (LETT |u| (* |n| |n|) . #5#)
              (LETT |addOn| (|spadConstant| $ 37) . #5#)
              (SEQ (LETT |k| 1 . #5#) (LETT #4# |n| . #5#) G190
                   (COND ((|greater_SI| |k| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |i| 1 . #5#) (LETT #3# |n| . #5#) G190
                          (COND ((|greater_SI| |i| #3#) (GO G191)))
                          (SEQ (LETT |z| (+ |z| 1) . #5#)
                               (LETT |addOn|
                                     (COND
                                      ((EQL |k| |i|) (|spadConstant| $ 14))
                                      ('T (|spadConstant| $ 37)))
                                     . #5#)
                               (SPADCALL |rhs| |z| |addOn| (QREFELT $ 53))
                               (SPADCALL |rhs| |u| |addOn| (QREFELT $ 53))
                               (EXIT
                                (SEQ (LETT |j| 1 . #5#) (LETT #2# |n| . #5#)
                                     G190
                                     (COND ((|greater_SI| |j| #2#) (GO G191)))
                                     (SEQ
                                      (SPADCALL |cond| |z| |j|
                                                (SPADCALL
                                                 (SPADCALL |gamma| |k|
                                                           (QREFELT $ 45))
                                                 |j| |i| (QREFELT $ 46))
                                                (QREFELT $ 54))
                                      (EXIT
                                       (SPADCALL |cond| |u| |j|
                                                 (SPADCALL
                                                  (SPADCALL |gamma| |k|
                                                            (QREFELT $ 45))
                                                  |i| |j| (QREFELT $ 46))
                                                 (QREFELT $ 54))))
                                     (LETT |j| (|inc_SI| |j|) . #5#) (GO G190)
                                     G191 (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |res| (SPADCALL |cond| |rhs| (QREFELT $ 58)) . #5#)
              (EXIT
               (COND
                ((QEQCAR (QCAR |res|) 1)
                 (SEQ (SPADCALL "this algebra has no unit" (QREFELT $ 61))
                      (EXIT (CONS 1 "failed"))))
                ('T
                 (CONS 0
                       (SPADCALL
                        (PROG2 (LETT #1# (QCAR |res|) . #5#)
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0)
                                          (|Vector| (QREFELT $ 7))
                                          (|Union| (|Vector| (QREFELT $ 7))
                                                   "failed")
                                          #1#))
                        (QREFELT $ 62))))))))) 

(SDEFUN |FRNAALG-;apply;M2S;12| ((|m| |Matrix| R) (|a| S) ($ S))
        (SPROG ((|v| (|Vector| R)))
               (SEQ
                (LETT |v| (SPADCALL |a| (QREFELT $ 76))
                      . #1=(|FRNAALG-;apply;M2S;12|))
                (LETT |v| (SPADCALL |m| |v| (QREFELT $ 77)) . #1#)
                (EXIT (SPADCALL |v| (QREFELT $ 78)))))) 

(SDEFUN |FRNAALG-;structuralConstants;V;13| (($ |Vector| (|Matrix| R)))
        (SPADCALL (SPADCALL (QREFELT $ 29)) (QREFELT $ 31))) 

(SDEFUN |FRNAALG-;conditionsForIdempotents;L;14| (($ |List| (|Polynomial| R)))
        (SPADCALL (SPADCALL (QREFELT $ 29)) (QREFELT $ 82))) 

(SDEFUN |FRNAALG-;convert;SV;15| ((|x| S) ($ |Vector| R))
        (SPADCALL |x| (SPADCALL (QREFELT $ 29)) (QREFELT $ 84))) 

(SDEFUN |FRNAALG-;convert;VS;16| ((|v| |Vector| R) ($ S))
        (SPADCALL |v| (SPADCALL (QREFELT $ 29)) (QREFELT $ 86))) 

(SDEFUN |FRNAALG-;leftTraceMatrix;M;17| (($ |Matrix| R))
        (SPADCALL (SPADCALL (QREFELT $ 29)) (QREFELT $ 88))) 

(SDEFUN |FRNAALG-;rightTraceMatrix;M;18| (($ |Matrix| R))
        (SPADCALL (SPADCALL (QREFELT $ 29)) (QREFELT $ 90))) 

(SDEFUN |FRNAALG-;leftDiscriminant;R;19| (($ R))
        (SPADCALL (SPADCALL (QREFELT $ 29)) (QREFELT $ 92))) 

(SDEFUN |FRNAALG-;rightDiscriminant;R;20| (($ R))
        (SPADCALL (SPADCALL (QREFELT $ 29)) (QREFELT $ 94))) 

(SDEFUN |FRNAALG-;leftRegularRepresentation;SM;21| ((|x| S) ($ |Matrix| R))
        (SPADCALL |x| (SPADCALL (QREFELT $ 29)) (QREFELT $ 96))) 

(SDEFUN |FRNAALG-;rightRegularRepresentation;SM;22| ((|x| S) ($ |Matrix| R))
        (SPADCALL |x| (SPADCALL (QREFELT $ 29)) (QREFELT $ 98))) 

(SDEFUN |FRNAALG-;coordinates;VM;23| ((|x| |Vector| S) ($ |Matrix| R))
        (SPADCALL |x| (SPADCALL (QREFELT $ 29)) (QREFELT $ 100))) 

(SDEFUN |FRNAALG-;represents;VS;24| ((|v| |Vector| R) ($ S))
        (SPADCALL |v| (SPADCALL (QREFELT $ 29)) (QREFELT $ 86))) 

(SDEFUN |FRNAALG-;coordinates;VM;25| ((|v| |Vector| S) ($ |Matrix| R))
        (SPROG ((#1=#:G864 NIL) (|i| NIL) (|j| NIL) (|m| (|Matrix| R)))
               (SEQ
                (LETT |m|
                      (MAKE_MATRIX1 (QVSIZE |v|) (SPADCALL (QREFELT $ 11))
                                    (|spadConstant| $ 37))
                      . #2=(|FRNAALG-;coordinates;VM;25|))
                (SEQ (LETT |j| 1 . #2#)
                     (LETT |i| (SPADCALL |v| (QREFELT $ 104)) . #2#)
                     (LETT #1# (QVSIZE |v|) . #2#) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |m| |j|
                                 (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 76))
                                 (QREFELT $ 105))))
                     (LETT |i|
                           (PROG1 (+ |i| 1) (LETT |j| (|inc_SI| |j|) . #2#))
                           . #2#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(DECLAIM (NOTINLINE |FramedNonAssociativeAlgebra&;|)) 

(DEFUN |FramedNonAssociativeAlgebra&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FramedNonAssociativeAlgebra&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FramedNonAssociativeAlgebra&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 106) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2| '(|Field|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 49
                       (CONS
                        (|dispatchFunction|
                         |FRNAALG-;leftRankPolynomial;Sup;3|)
                        $))
             (QSETREFV $ 50
                       (CONS
                        (|dispatchFunction|
                         |FRNAALG-;rightRankPolynomial;Sup;4|)
                        $))
             NIL
             (QSETREFV $ 64
                       (CONS (|dispatchFunction| |FRNAALG-;leftUnit;U;6|) $))
             (QSETREFV $ 72
                       (CONS (|dispatchFunction| |FRNAALG-;leftUnits;U;7|) $))
             NIL
             (QSETREFV $ 73
                       (CONS (|dispatchFunction| |FRNAALG-;rightUnit;U;9|) $))
             (QSETREFV $ 74
                       (CONS (|dispatchFunction| |FRNAALG-;rightUnits;U;10|)
                             $))
             (QSETREFV $ 75
                       (CONS (|dispatchFunction| |FRNAALG-;unit;U;11|) $)))))
          $))) 

(MAKEPROP '|FramedNonAssociativeAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Matrix| 22) (0 . |copy|) (|PositiveInteger|) (5 . |rank|)
              (|NonNegativeInteger|) (9 . |rank|) (14 . |One|)
              (|SparseUnivariatePolynomial| 22) (18 . |One|) (22 . *)
              (28 . |horizConcat|) (|List| 24) (34 . |nullSpace|) (39 . |Zero|)
              (|Polynomial| 7) (|Integer|) (|Vector| 22) (43 . |elt|)
              (49 . |monomial|) (55 . +) (|Vector| $) (61 . |basis|)
              (|Vector| 44) (65 . |structuralConstants|) (|String|) (|Symbol|)
              (70 . |coerce|) (75 . |Zero|) (79 . |Zero|) (83 . |Zero|)
              (87 . |One|) (|Vector| 33) (91 . |elt|) (|List| 33) (|List| 12)
              (97 . |monomial|) (|Matrix| 7) (104 . |elt|) (110 . |elt|)
              (117 . *) (123 . +) (129 . |leftRankPolynomial|)
              (133 . |rightRankPolynomial|) (137 . ^) (|Vector| 7)
              (143 . |setelt!|) (150 . |setelt!|) (|Union| 52 '"failed")
              (|Record| (|:| |particular| 55) (|:| |basis| 67))
              (|LinearSystemMatrixPackage| 7 52 52 44) (158 . |solve|) (|Void|)
              (|OutputForm|) (164 . |messagePrint|) (169 . |represents|)
              (|Union| $ '#1="failed") (174 . |leftUnit|) (|List| 6)
              (|Mapping| 6 52) (|List| 52) (|ListFunctions2| 52 6)
              (178 . |map|)
              (|Record| (|:| |particular| $) (|:| |basis| (|List| $)))
              (|Union| 70 '#1#) (184 . |leftUnits|) (188 . |rightUnit|)
              (192 . |rightUnits|) (196 . |unit|) (200 . |coordinates|)
              (205 . *) (211 . |convert|) |FRNAALG-;apply;M2S;12|
              |FRNAALG-;structuralConstants;V;13| (|List| 22)
              (216 . |conditionsForIdempotents|)
              |FRNAALG-;conditionsForIdempotents;L;14| (221 . |coordinates|)
              |FRNAALG-;convert;SV;15| (227 . |represents|)
              |FRNAALG-;convert;VS;16| (233 . |leftTraceMatrix|)
              |FRNAALG-;leftTraceMatrix;M;17| (238 . |rightTraceMatrix|)
              |FRNAALG-;rightTraceMatrix;M;18| (243 . |leftDiscriminant|)
              |FRNAALG-;leftDiscriminant;R;19| (248 . |rightDiscriminant|)
              |FRNAALG-;rightDiscriminant;R;20|
              (253 . |leftRegularRepresentation|)
              |FRNAALG-;leftRegularRepresentation;SM;21|
              (259 . |rightRegularRepresentation|)
              |FRNAALG-;rightRegularRepresentation;SM;22| (265 . |coordinates|)
              |FRNAALG-;coordinates;VM;25| |FRNAALG-;represents;VS;24|
              (|Vector| 6) (271 . |minIndex|) (276 . |setRow!|))
           '#(|unit| 283 |structuralConstants| 287 |rightUnits| 291 |rightUnit|
              295 |rightTraceMatrix| 299 |rightRegularRepresentation| 303
              |rightRankPolynomial| 308 |rightDiscriminant| 312 |represents|
              316 |leftUnits| 321 |leftUnit| 325 |leftTraceMatrix| 329
              |leftRegularRepresentation| 333 |leftRankPolynomial| 338
              |leftDiscriminant| 342 |coordinates| 346 |convert| 351
              |conditionsForIdempotents| 361 |apply| 365)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 105
                                                 '(1 8 0 0 9 0 6 10 11 1 8 12 0
                                                   13 0 7 0 14 0 15 0 16 2 8 0
                                                   0 0 17 2 8 0 0 0 18 1 8 19 0
                                                   20 0 15 0 21 2 24 22 0 23 25
                                                   2 15 0 22 12 26 2 15 0 0 0
                                                   27 0 6 28 29 1 6 30 28 31 1
                                                   33 0 32 34 0 22 0 35 0 6 0
                                                   36 0 7 0 37 0 22 0 38 2 39
                                                   33 0 23 40 3 22 0 0 41 42 43
                                                   2 30 44 0 23 45 3 44 7 0 23
                                                   23 46 2 22 0 0 7 47 2 22 0 0
                                                   0 48 0 0 15 49 0 0 15 50 2
                                                   10 0 0 10 51 3 52 7 0 23 7
                                                   53 4 44 7 0 23 23 7 54 2 57
                                                   56 44 52 58 1 60 59 32 61 1
                                                   6 0 52 62 0 0 63 64 2 68 65
                                                   66 67 69 0 0 71 72 0 0 63 73
                                                   0 0 71 74 0 0 63 75 1 6 52 0
                                                   76 2 44 52 0 52 77 1 6 0 52
                                                   78 1 6 81 28 82 2 6 52 0 28
                                                   84 2 6 0 52 28 86 1 6 44 28
                                                   88 1 6 44 28 90 1 6 7 28 92
                                                   1 6 7 28 94 2 6 44 0 28 96 2
                                                   6 44 0 28 98 2 6 44 28 28
                                                   100 1 103 23 0 104 3 44 0 0
                                                   23 52 105 0 0 63 75 0 0 30
                                                   80 0 0 71 74 0 0 63 73 0 0
                                                   44 91 1 0 44 0 99 0 0 15 50
                                                   0 0 7 95 1 0 0 52 102 0 0 71
                                                   72 0 0 63 64 0 0 44 89 1 0
                                                   44 0 97 0 0 15 49 0 0 7 93 1
                                                   0 44 28 101 1 0 0 52 87 1 0
                                                   52 0 85 0 0 81 83 2 0 0 44 0
                                                   79)))))
           '|lookupComplete|)) 
