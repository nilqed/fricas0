
(SDEFUN |FINAALG-;leftCharacteristicPolynomial;SSup;1|
        ((|a| (S)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((#1=#:G35 NIL) (|j| NIL) (#2=#:G34 NIL) (|i| NIL)
          (|mb| (|Matrix| (|SparseUnivariatePolynomial| R)))
          (|ma| (|Matrix| R)) (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
              (LETT |ma|
                    (SPADCALL |a| (SPADCALL (QREFELT % 11)) (QREFELT % 13)))
              (LETT |mb| (SPADCALL |n| |n| (QREFELT % 16)))
              (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #1# |n|) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |mb| |i| |j|
                                      (COND
                                       ((EQL |i| |j|)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |ma| |i| |j|
                                                    (QREFELT % 18))
                                          0 (QREFELT % 20))
                                         (SPADCALL (|spadConstant| % 21) 1
                                                   (QREFELT % 20))
                                         (QREFELT % 22)))
                                       ('T
                                        (SPADCALL
                                         (SPADCALL |ma| |i| |j| (QREFELT % 18))
                                         1 (QREFELT % 20))))
                                      (QREFELT % 23))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |mb| (QREFELT % 24)))))) 

(SDEFUN |FINAALG-;rightCharacteristicPolynomial;SSup;2|
        ((|a| (S)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((#1=#:G43 NIL) (|j| NIL) (#2=#:G42 NIL) (|i| NIL)
          (|mb| (|Matrix| (|SparseUnivariatePolynomial| R)))
          (|ma| (|Matrix| R)) (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
              (LETT |ma|
                    (SPADCALL |a| (SPADCALL (QREFELT % 11)) (QREFELT % 26)))
              (LETT |mb| (SPADCALL |n| |n| (QREFELT % 16)))
              (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #1# |n|) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |mb| |i| |j|
                                      (COND
                                       ((EQL |i| |j|)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |ma| |i| |j|
                                                    (QREFELT % 18))
                                          0 (QREFELT % 20))
                                         (SPADCALL (|spadConstant| % 21) 1
                                                   (QREFELT % 20))
                                         (QREFELT % 22)))
                                       ('T
                                        (SPADCALL
                                         (SPADCALL |ma| |i| |j| (QREFELT % 18))
                                         1 (QREFELT % 20))))
                                      (QREFELT % 23))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |mb| (QREFELT % 24)))))) 

(SDEFUN |FINAALG-;leftTrace;SR;3| ((|a| (S)) (% (R)))
        (SPROG ((|t| (R)) (#1=#:G48 NIL) (|i| NIL) (|ma| (|Matrix| R)))
               (SEQ (LETT |t| (|spadConstant| % 28))
                    (LETT |ma|
                          (SPADCALL |a| (SPADCALL (QREFELT % 11))
                                    (QREFELT % 13)))
                    (SEQ (LETT |i| 1) (LETT #1# (SPADCALL (QREFELT % 9))) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |t|
                                 (SPADCALL |t|
                                           (SPADCALL |ma| |i| |i|
                                                     (QREFELT % 18))
                                           (QREFELT % 29)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |t|)))) 

(SDEFUN |FINAALG-;rightTrace;SR;4| ((|a| (S)) (% (R)))
        (SPROG ((|t| (R)) (#1=#:G53 NIL) (|i| NIL) (|ma| (|Matrix| R)))
               (SEQ (LETT |t| (|spadConstant| % 28))
                    (LETT |ma|
                          (SPADCALL |a| (SPADCALL (QREFELT % 11))
                                    (QREFELT % 26)))
                    (SEQ (LETT |i| 1) (LETT #1# (SPADCALL (QREFELT % 9))) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |t|
                                 (SPADCALL |t|
                                           (SPADCALL |ma| |i| |i|
                                                     (QREFELT % 18))
                                           (QREFELT % 29)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |t|)))) 

(SDEFUN |FINAALG-;leftNorm;SR;5| ((|a| (S)) (% (R)))
        (SPADCALL (SPADCALL |a| (SPADCALL (QREFELT % 11)) (QREFELT % 13))
                  (QREFELT % 32))) 

(SDEFUN |FINAALG-;rightNorm;SR;6| ((|a| (S)) (% (R)))
        (SPADCALL (SPADCALL |a| (SPADCALL (QREFELT % 11)) (QREFELT % 26))
                  (QREFELT % 32))) 

(SDEFUN |FINAALG-;antiAssociative?;B;7| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G65 NIL) (#2=#:G66 NIL) (#3=#:G69 NIL) (|k| NIL) (#4=#:G68 NIL)
          (|j| NIL) (#5=#:G67 NIL) (|i| NIL) (|n| (|PositiveInteger|))
          (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |b| |i| (QREFELT % 36))
                                            (SPADCALL |b| |j| (QREFELT % 36))
                                            (QREFELT % 37))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 37))
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL
                                            (SPADCALL |b| |j| (QREFELT % 36))
                                            (SPADCALL |b| |k| (QREFELT % 36))
                                            (QREFELT % 37))
                                           (QREFELT % 37))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #1#
                                              (PROGN
                                               (LETT #2# NIL)
                                               (GO #6=#:G64)))
                                        (GO #7=#:G60))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;jordanAdmissible?;B;8| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G85 NIL) (#2=#:G86 NIL) (#3=#:G90 NIL) (|l| NIL) (#4=#:G89 NIL)
          (|k| NIL) (#5=#:G88 NIL) (|j| NIL) (#6=#:G87 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (EXIT
                 (COND
                  ((QEQCAR
                    (SPADCALL (SPADCALL 2 (|spadConstant| % 21) (QREFELT % 42))
                              (QREFELT % 44))
                    1)
                   NIL)
                  ('T
                   (SEQ
                    (SEQ (LETT |i| 1) (LETT #6# |n|) G190
                         (COND ((|greater_SI| |i| #6#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #5# |n|) G190
                                (COND ((|greater_SI| |j| #5#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |k| 1) (LETT #4# |n|) G190
                                       (COND
                                        ((|greater_SI| |k| #4#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |l| 1) (LETT #3# |n|) G190
                                              (COND
                                               ((|greater_SI| |l| #3#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((NULL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |b| |i|
                                                                  (QREFELT %
                                                                           36))
                                                        (SPADCALL |b| |j|
                                                                  (QREFELT %
                                                                           36))
                                                        (QREFELT % 45))
                                                       (SPADCALL
                                                        (SPADCALL |b| |l|
                                                                  (QREFELT %
                                                                           36))
                                                        (SPADCALL |b| |k|
                                                                  (QREFELT %
                                                                           36))
                                                        (QREFELT % 45))
                                                       (QREFELT % 45))
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |b| |l|
                                                                  (QREFELT %
                                                                           36))
                                                        (SPADCALL |b| |j|
                                                                  (QREFELT %
                                                                           36))
                                                        (QREFELT % 45))
                                                       (SPADCALL
                                                        (SPADCALL |b| |k|
                                                                  (QREFELT %
                                                                           36))
                                                        (SPADCALL |b| |i|
                                                                  (QREFELT %
                                                                           36))
                                                        (QREFELT % 45))
                                                       (QREFELT % 45))
                                                      (QREFELT % 38))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |b| |k|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL |b| |j|
                                                                 (QREFELT %
                                                                          36))
                                                       (QREFELT % 45))
                                                      (SPADCALL
                                                       (SPADCALL |b| |i|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL |b| |l|
                                                                 (QREFELT %
                                                                          36))
                                                       (QREFELT % 45))
                                                      (QREFELT % 45))
                                                     (QREFELT % 38))
                                                    (QREFELT % 40)))
                                                  (PROGN
                                                   (LETT #1#
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #7=#:G84)))
                                                   (GO #8=#:G78))))))
                                              (LETT |l| (|inc_SI| |l|))
                                              (GO G190) G191 (EXIT NIL)))
                                        #8# (EXIT #1#))
                                       (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT 'T)))))))
          #7# (EXIT #2#)))) 

(SDEFUN |FINAALG-;lieAdmissible?;B;9| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G100 NIL) (#2=#:G101 NIL) (#3=#:G104 NIL) (|k| NIL)
          (#4=#:G103 NIL) (|j| NIL) (#5=#:G102 NIL) (|i| NIL)
          (|b| (|Vector| S)) (|n| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
                (LETT |b| (SPADCALL (QREFELT % 11)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |b| |i| (QREFELT % 36))
                                             (SPADCALL |b| |j| (QREFELT % 36))
                                             (QREFELT % 47))
                                            (SPADCALL |b| |k| (QREFELT % 36))
                                            (QREFELT % 47))
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |b| |j| (QREFELT % 36))
                                             (SPADCALL |b| |k| (QREFELT % 36))
                                             (QREFELT % 47))
                                            (SPADCALL |b| |i| (QREFELT % 36))
                                            (QREFELT % 47))
                                           (QREFELT % 38))
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |b| |k| (QREFELT % 36))
                                            (SPADCALL |b| |i| (QREFELT % 36))
                                            (QREFELT % 47))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (QREFELT % 47))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #1#
                                              (PROGN
                                               (LETT #2# NIL)
                                               (GO #6=#:G99)))
                                        (GO #7=#:G95))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;conditionsForIdempotents;VL;10|
        ((|b| (|Vector| S)) (% (|List| (|Polynomial| R))))
        (SPROG
         ((|conditions| (|List| (|Polynomial| R))) (|p| (|Polynomial| R))
          (|xj| #1=(|Symbol|)) (|xi| #1#) (#2=#:G126 NIL) (|j| NIL)
          (#3=#:G125 NIL) (|i| NIL) (|xk| #1#) (#4=#:G124 NIL) (|k| NIL)
          (|symbolsForCoef| (|Vector| (|Symbol|))) (#5=#:G121 NIL)
          (#6=#:G123 NIL) (#7=#:G122 NIL) (|listOfNumbers| (|List| (|String|)))
          (#8=#:G120 NIL) (|q| NIL) (#9=#:G119 NIL)
          (|gamma| (|Vector| (|Matrix| R))) (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
              (LETT |gamma| (SPADCALL |b| (QREFELT % 50)))
              (LETT |listOfNumbers|
                    (PROGN
                     (LETT #9# NIL)
                     (SEQ (LETT |q| 1) (LETT #8# |n|) G190
                          (COND ((|greater_SI| |q| #8#) (GO G191)))
                          (SEQ (EXIT (LETT #9# (CONS (STRINGIMAGE |q|) #9#))))
                          (LETT |q| (|inc_SI| |q|)) (GO G190) G191
                          (EXIT (NREVERSE #9#)))))
              (LETT |symbolsForCoef|
                    (PROGN
                     (LETT #7# (GETREFV (SIZE |listOfNumbers|)))
                     (SEQ (LETT |i| NIL) (LETT #6# |listOfNumbers|)
                          (LETT #5# 0) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #7# #5#
                                    (SPADCALL (STRCONC "%" (STRCONC "x" |i|))
                                              (QREFELT % 53)))))
                          (LETT #5#
                                (PROG1 (|inc_SI| #5#) (LETT #6# (CDR #6#))))
                          (GO G190) G191 (EXIT NIL))
                     #7#))
              (LETT |conditions| NIL)
              (SEQ (LETT |k| 1) (LETT #4# |n|) G190
                   (COND ((|greater_SI| |k| #4#) (GO G191)))
                   (SEQ
                    (LETT |xk| (SPADCALL |symbolsForCoef| |k| (QREFELT % 55)))
                    (LETT |p|
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 57) (QREFELT % 58))
                           (LIST |xk|) (LIST 1) (QREFELT % 61)))
                    (SEQ (LETT |i| 1) (LETT #3# |n|) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                                (COND ((|greater_SI| |j| #2#) (GO G191)))
                                (SEQ
                                 (LETT |xi|
                                       (SPADCALL |symbolsForCoef| |i|
                                                 (QREFELT % 55)))
                                 (LETT |xj|
                                       (SPADCALL |symbolsForCoef| |j|
                                                 (QREFELT % 55)))
                                 (EXIT
                                  (LETT |p|
                                        (SPADCALL |p|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (QAREF2O
                                                     (SPADCALL |gamma| |k|
                                                               (QREFELT % 62))
                                                     |i| |j| 1 1)
                                                    (QREFELT % 63))
                                                   (LIST |xi| |xj|) (LIST 1 1)
                                                   (QREFELT % 61))
                                                  (QREFELT % 64)))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |conditions| (CONS |p| |conditions|))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |conditions|)))) 

(SDEFUN |FINAALG-;structuralConstants;VV;11|
        ((|b| (|Vector| S)) (% (|Vector| (|Matrix| R))))
        (SPROG
         ((#1=#:G144 NIL) (|k| NIL) (|covec| (|Vector| R)) (#2=#:G143 NIL)
          (|j| NIL) (#3=#:G142 NIL) (|i| NIL) (|sC| (|Vector| (|Matrix| R)))
          (#4=#:G139 NIL) (#5=#:G141 NIL) (#6=#:G140 NIL)
          (|m| (|NonNegativeInteger|)) (#7=#:G127 NIL))
         (SEQ
          (LETT |m|
                (PROG1 (LETT #7# (QVSIZE |b|))
                  (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #7#)))
          (LETT |sC|
                (PROGN
                 (LETT #6# (GETREFV |m|))
                 (SEQ (LETT |k| 1) (LETT #5# |m|) (LETT #4# 0) G190
                      (COND ((|greater_SI| |k| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #6# #4#
                                (MAKE_MATRIX1 |m| |m| (|spadConstant| % 28)))))
                      (LETT #4#
                            (PROG1 (|inc_SI| #4#) (LETT |k| (|inc_SI| |k|))))
                      (GO G190) G191 (EXIT NIL))
                 #6#))
          (SEQ (LETT |i| 1) (LETT #3# |m|) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #2# |m|) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ
                       (LETT |covec|
                             (SPADCALL
                              (SPADCALL (SPADCALL |b| |i| (QREFELT % 36))
                                        (SPADCALL |b| |j| (QREFELT % 36))
                                        (QREFELT % 37))
                              |b| (QREFELT % 68)))
                       (EXIT
                        (SEQ (LETT |k| 1) (LETT #1# |m|) G190
                             (COND ((|greater_SI| |k| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL (SPADCALL |sC| |k| (QREFELT % 62)) |i|
                                         |j|
                                         (SPADCALL |covec| |k| (QREFELT % 69))
                                         (QREFELT % 70))))
                             (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |sC|)))) 

(SDEFUN |FINAALG-;leftRecip;SU;12| ((|x| (S)) (% (|Union| S "failed")))
        (SPROG
         ((#1=#:G163 NIL) (#2=#:G165 NIL) (|power| NIL) (#3=#:G166 NIL)
          (|i| NIL) (#4=#:G164 NIL) (|invCR| (R)) (|invC| (|Union| R "failed"))
          (|vectorOfCoef| (|Vector| R)) (|cond| (|Matrix| R))
          (|listOfPowers| (|List| S)) (|xx| (S)) (|k| (|PositiveInteger|))
          (|b| (|Vector| S)) (|lu| (|Union| S "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 40)) (CONS 1 "failed"))
                (#5='T
                 (SEQ (LETT |lu| (SPADCALL (QREFELT % 72)))
                      (EXIT
                       (COND ((QEQCAR |lu| 1) (CONS 1 "failed"))
                             (#5#
                              (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                                   (LETT |xx| (QCDR |lu|)) (LETT |k| 1)
                                   (LETT |cond|
                                         (SPADCALL
                                          (SPADCALL |xx| |b| (QREFELT % 68))
                                          (QREFELT % 73)))
                                   (LETT |listOfPowers| (LIST |xx|))
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (EQL
                                            (SPADCALL |cond| (QREFELT % 74))
                                            |k|))
                                          (GO G191)))
                                        (SEQ (LETT |k| (+ |k| 1))
                                             (LETT |xx|
                                                   (SPADCALL |xx| |x|
                                                             (QREFELT % 37)))
                                             (LETT |listOfPowers|
                                                   (CONS |xx| |listOfPowers|))
                                             (EXIT
                                              (LETT |cond|
                                                    (SPADCALL |cond|
                                                              (SPADCALL
                                                               (SPADCALL |xx|
                                                                         |b|
                                                                         (QREFELT
                                                                          %
                                                                          68))
                                                               (QREFELT % 73))
                                                              (QREFELT %
                                                                       75)))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (LETT |vectorOfCoef|
                                         (|SPADfirst|
                                          (SPADCALL |cond| (QREFELT % 77))))
                                   (LETT |invC|
                                         (SPADCALL
                                          (SPADCALL |vectorOfCoef| 1
                                                    (QREFELT % 69))
                                          (QREFELT % 44)))
                                   (EXIT
                                    (COND ((QEQCAR |invC| 1) (CONS 1 "failed"))
                                          (#5#
                                           (SEQ
                                            (LETT |invCR|
                                                  (SPADCALL (QCDR |invC|)
                                                            (QREFELT % 78)))
                                            (EXIT
                                             (CONS 0
                                                   (SPADCALL (ELT % 38)
                                                             (PROGN
                                                              (LETT #4#
                                                                    (GETREFV
                                                                     (MIN
                                                                      (|inc_SI|
                                                                       (-
                                                                        #6=(QVSIZE
                                                                            |vectorOfCoef|)
                                                                        2))
                                                                      (SIZE
                                                                       #7=(REVERSE
                                                                           |listOfPowers|)))))
                                                              (SEQ (LETT |i| 2)
                                                                   (LETT #3#
                                                                         #6#)
                                                                   (LETT
                                                                    |power|
                                                                    NIL)
                                                                   (LETT #2#
                                                                         #7#)
                                                                   (LETT #1# 0)
                                                                   G190
                                                                   (COND
                                                                    ((OR
                                                                      (ATOM
                                                                       #2#)
                                                                      (PROGN
                                                                       (LETT
                                                                        |power|
                                                                        (CAR
                                                                         #2#))
                                                                       NIL)
                                                                      (|greater_SI|
                                                                       |i|
                                                                       #3#))
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (EXIT
                                                                     (SETELT
                                                                      #4# #1#
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        |invCR|
                                                                        (SPADCALL
                                                                         |vectorOfCoef|
                                                                         |i|
                                                                         (QREFELT
                                                                          %
                                                                          69))
                                                                        (QREFELT
                                                                         % 79))
                                                                       |power|
                                                                       (QREFELT
                                                                        %
                                                                        80)))))
                                                                   (LETT #1#
                                                                         (PROG1
                                                                             (|inc_SI|
                                                                              #1#)
                                                                           (LETT
                                                                            #2#
                                                                            (PROG1
                                                                                (CDR
                                                                                 #2#)
                                                                              (LETT
                                                                               |i|
                                                                               (|inc_SI|
                                                                                |i|))))))
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL))
                                                              #4#)
                                                             (QREFELT %
                                                                      82)))))))))))))))))) 

(SDEFUN |FINAALG-;rightRecip;SU;13| ((|x| (S)) (% (|Union| S "failed")))
        (SPROG
         ((#1=#:G185 NIL) (#2=#:G187 NIL) (|power| NIL) (#3=#:G188 NIL)
          (|i| NIL) (#4=#:G186 NIL) (|invCR| (R)) (|invC| (|Union| R "failed"))
          (|vectorOfCoef| (|Vector| R)) (|cond| (|Matrix| R))
          (|listOfPowers| (|List| S)) (|xx| (S)) (|k| (|PositiveInteger|))
          (|b| (|Vector| S)) (|ru| (|Union| S "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 40)) (CONS 1 "failed"))
                (#5='T
                 (SEQ (LETT |ru| (SPADCALL (QREFELT % 84)))
                      (EXIT
                       (COND ((QEQCAR |ru| 1) (CONS 1 "failed"))
                             (#5#
                              (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                                   (LETT |xx| (QCDR |ru|)) (LETT |k| 1)
                                   (LETT |cond|
                                         (SPADCALL
                                          (SPADCALL |xx| |b| (QREFELT % 68))
                                          (QREFELT % 73)))
                                   (LETT |listOfPowers| (LIST |xx|))
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (EQL
                                            (SPADCALL |cond| (QREFELT % 74))
                                            |k|))
                                          (GO G191)))
                                        (SEQ (LETT |k| (+ |k| 1))
                                             (LETT |xx|
                                                   (SPADCALL |x| |xx|
                                                             (QREFELT % 37)))
                                             (LETT |listOfPowers|
                                                   (CONS |xx| |listOfPowers|))
                                             (EXIT
                                              (LETT |cond|
                                                    (SPADCALL |cond|
                                                              (SPADCALL
                                                               (SPADCALL |xx|
                                                                         |b|
                                                                         (QREFELT
                                                                          %
                                                                          68))
                                                               (QREFELT % 73))
                                                              (QREFELT %
                                                                       75)))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (LETT |vectorOfCoef|
                                         (|SPADfirst|
                                          (SPADCALL |cond| (QREFELT % 77))))
                                   (LETT |invC|
                                         (SPADCALL
                                          (SPADCALL |vectorOfCoef| 1
                                                    (QREFELT % 69))
                                          (QREFELT % 44)))
                                   (EXIT
                                    (COND ((QEQCAR |invC| 1) (CONS 1 "failed"))
                                          (#5#
                                           (SEQ
                                            (LETT |invCR|
                                                  (SPADCALL (QCDR |invC|)
                                                            (QREFELT % 78)))
                                            (EXIT
                                             (CONS 0
                                                   (SPADCALL (ELT % 38)
                                                             (PROGN
                                                              (LETT #4#
                                                                    (GETREFV
                                                                     (MIN
                                                                      (|inc_SI|
                                                                       (-
                                                                        #6=(QVSIZE
                                                                            |vectorOfCoef|)
                                                                        2))
                                                                      (SIZE
                                                                       #7=(REVERSE
                                                                           |listOfPowers|)))))
                                                              (SEQ (LETT |i| 2)
                                                                   (LETT #3#
                                                                         #6#)
                                                                   (LETT
                                                                    |power|
                                                                    NIL)
                                                                   (LETT #2#
                                                                         #7#)
                                                                   (LETT #1# 0)
                                                                   G190
                                                                   (COND
                                                                    ((OR
                                                                      (ATOM
                                                                       #2#)
                                                                      (PROGN
                                                                       (LETT
                                                                        |power|
                                                                        (CAR
                                                                         #2#))
                                                                       NIL)
                                                                      (|greater_SI|
                                                                       |i|
                                                                       #3#))
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (EXIT
                                                                     (SETELT
                                                                      #4# #1#
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        |invCR|
                                                                        (SPADCALL
                                                                         |vectorOfCoef|
                                                                         |i|
                                                                         (QREFELT
                                                                          %
                                                                          69))
                                                                        (QREFELT
                                                                         % 79))
                                                                       |power|
                                                                       (QREFELT
                                                                        %
                                                                        80)))))
                                                                   (LETT #1#
                                                                         (PROG1
                                                                             (|inc_SI|
                                                                              #1#)
                                                                           (LETT
                                                                            #2#
                                                                            (PROG1
                                                                                (CDR
                                                                                 #2#)
                                                                              (LETT
                                                                               |i|
                                                                               (|inc_SI|
                                                                                |i|))))))
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL))
                                                              #4#)
                                                             (QREFELT %
                                                                      82)))))))))))))))))) 

(SDEFUN |FINAALG-;recip;SU;14| ((|x| (S)) (% (|Union| S "failed")))
        (SPROG ((|rrx| (|Union| S "failed")) (|lrx| (|Union| S "failed")))
               (SEQ (LETT |lrx| (SPADCALL |x| (QREFELT % 86)))
                    (EXIT
                     (COND ((QEQCAR |lrx| 1) (CONS 1 "failed"))
                           ('T
                            (SEQ (LETT |rrx| (SPADCALL |x| (QREFELT % 87)))
                                 (EXIT
                                  (COND
                                   ((OR (QEQCAR |rrx| 1)
                                        (SPADCALL (QCDR |lrx|) (QCDR |rrx|)
                                                  (QREFELT % 88)))
                                    (CONS 1 "failed"))
                                   ('T (CONS 0 (QCDR |lrx|)))))))))))) 

(SDEFUN |FINAALG-;leftMinimalPolynomial;SSup;15|
        ((|x| (S)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| R)) (#1=#:G204 NIL) (|i| NIL)
          (|vectorOfCoef| (|Vector| R)) (|cond| (|Matrix| R)) (|xx| (S))
          (|k| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT % 40))
            (SPADCALL (|spadConstant| % 21) 1 (QREFELT % 20)))
           ('T
            (SEQ (LETT |b| (SPADCALL (QREFELT % 11))) (LETT |xx| |x|)
                 (LETT |k| 1)
                 (LETT |cond|
                       (SPADCALL (SPADCALL |xx| |b| (QREFELT % 68))
                                 (QREFELT % 73)))
                 (SEQ G190
                      (COND
                       ((NULL (EQL (SPADCALL |cond| (QREFELT % 74)) |k|))
                        (GO G191)))
                      (SEQ (LETT |k| (+ |k| 1))
                           (LETT |xx| (SPADCALL |x| |xx| (QREFELT % 37)))
                           (EXIT
                            (LETT |cond|
                                  (SPADCALL |cond|
                                            (SPADCALL
                                             (SPADCALL |xx| |b| (QREFELT % 68))
                                             (QREFELT % 73))
                                            (QREFELT % 75)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |vectorOfCoef|
                       (|SPADfirst| (SPADCALL |cond| (QREFELT % 77))))
                 (LETT |res| (|spadConstant| % 90))
                 (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |vectorOfCoef| |i|
                                                   (QREFELT % 69))
                                         |i| (QREFELT % 20))
                                        (QREFELT % 91)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT |res|))))))) 

(SDEFUN |FINAALG-;rightMinimalPolynomial;SSup;16|
        ((|x| (S)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| R)) (#1=#:G213 NIL) (|i| NIL)
          (|vectorOfCoef| (|Vector| R)) (|cond| (|Matrix| R)) (|xx| (S))
          (|k| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT % 40))
            (SPADCALL (|spadConstant| % 21) 1 (QREFELT % 20)))
           ('T
            (SEQ (LETT |b| (SPADCALL (QREFELT % 11))) (LETT |xx| |x|)
                 (LETT |k| 1)
                 (LETT |cond|
                       (SPADCALL (SPADCALL |xx| |b| (QREFELT % 68))
                                 (QREFELT % 73)))
                 (SEQ G190
                      (COND
                       ((NULL (EQL (SPADCALL |cond| (QREFELT % 74)) |k|))
                        (GO G191)))
                      (SEQ (LETT |k| (+ |k| 1))
                           (LETT |xx| (SPADCALL |xx| |x| (QREFELT % 37)))
                           (EXIT
                            (LETT |cond|
                                  (SPADCALL |cond|
                                            (SPADCALL
                                             (SPADCALL |xx| |b| (QREFELT % 68))
                                             (QREFELT % 73))
                                            (QREFELT % 75)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |vectorOfCoef|
                       (|SPADfirst| (SPADCALL |cond| (QREFELT % 77))))
                 (LETT |res| (|spadConstant| % 90))
                 (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |vectorOfCoef| |i|
                                                   (QREFELT % 69))
                                         |i| (QREFELT % 20))
                                        (QREFELT % 91)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT |res|))))))) 

(SDEFUN |FINAALG-;associatorDependence;L;17| ((% (|List| (|Vector| R))))
        (SPROG
         ((|z| (|Integer|)) (#1=#:G229 NIL) (|r| NIL) (|a213| #2=(|Vector| R))
          (|a321| #2#) (|a132| #2#) (|a312| #2#) (|a231| #2#) (|a123| #2#)
          (#3=#:G228 NIL) (|k| NIL) (#4=#:G227 NIL) (|j| NIL) (#5=#:G226 NIL)
          (|i| NIL) (|cond| (|Matrix| R)) (|b| (|Vector| S))
          (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
              (LETT |b| (SPADCALL (QREFELT % 11)))
              (LETT |cond| (MAKE_MATRIX1 (EXPT |n| 4) 6 (|spadConstant| % 28)))
              (LETT |z| 0)
              (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                   (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                          (COND ((|greater_SI| |j| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                 (COND ((|greater_SI| |k| #3#) (GO G191)))
                                 (SEQ
                                  (LETT |a123|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (QREFELT % 94))
                                         |b| (QREFELT % 68)))
                                  (LETT |a231|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (QREFELT % 94))
                                         |b| (QREFELT % 68)))
                                  (LETT |a312|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (QREFELT % 94))
                                         |b| (QREFELT % 68)))
                                  (LETT |a132|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (QREFELT % 94))
                                         |b| (QREFELT % 68)))
                                  (LETT |a321|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (QREFELT % 94))
                                         |b| (QREFELT % 68)))
                                  (LETT |a213|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (QREFELT % 94))
                                         |b| (QREFELT % 68)))
                                  (EXIT
                                   (SEQ (LETT |r| 1) (LETT #1# |n|) G190
                                        (COND
                                         ((|greater_SI| |r| #1#) (GO G191)))
                                        (SEQ (LETT |z| (+ |z| 1))
                                             (SPADCALL |cond| |z| 1
                                                       (SPADCALL |a123| |r|
                                                                 (QREFELT %
                                                                          69))
                                                       (QREFELT % 70))
                                             (SPADCALL |cond| |z| 2
                                                       (SPADCALL |a231| |r|
                                                                 (QREFELT %
                                                                          69))
                                                       (QREFELT % 70))
                                             (SPADCALL |cond| |z| 3
                                                       (SPADCALL |a312| |r|
                                                                 (QREFELT %
                                                                          69))
                                                       (QREFELT % 70))
                                             (SPADCALL |cond| |z| 4
                                                       (SPADCALL |a132| |r|
                                                                 (QREFELT %
                                                                          69))
                                                       (QREFELT % 70))
                                             (SPADCALL |cond| |z| 5
                                                       (SPADCALL |a321| |r|
                                                                 (QREFELT %
                                                                          69))
                                                       (QREFELT % 70))
                                             (EXIT
                                              (SPADCALL |cond| |z| 6
                                                        (SPADCALL |a213| |r|
                                                                  (QREFELT %
                                                                           69))
                                                        (QREFELT % 70))))
                                        (LETT |r| (|inc_SI| |r|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |cond| (QREFELT % 77)))))) 

(SDEFUN |FINAALG-;jacobiIdentity?;B;18| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G239 NIL) (#2=#:G240 NIL) (#3=#:G243 NIL) (|k| NIL)
          (#4=#:G242 NIL) (|j| NIL) (#5=#:G241 NIL) (|i| NIL)
          (|b| (|Vector| S)) (|n| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
                (LETT |b| (SPADCALL (QREFELT % 11)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |b| |i| (QREFELT % 36))
                                             (SPADCALL |b| |j| (QREFELT % 36))
                                             (QREFELT % 37))
                                            (SPADCALL |b| |k| (QREFELT % 36))
                                            (QREFELT % 37))
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |b| |j| (QREFELT % 36))
                                             (SPADCALL |b| |k| (QREFELT % 36))
                                             (QREFELT % 37))
                                            (SPADCALL |b| |i| (QREFELT % 36))
                                            (QREFELT % 37))
                                           (QREFELT % 38))
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |b| |k| (QREFELT % 36))
                                            (SPADCALL |b| |i| (QREFELT % 36))
                                            (QREFELT % 37))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (QREFELT % 37))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #1#
                                              (PROGN
                                               (LETT #2# NIL)
                                               (GO #6=#:G238)))
                                        (GO #7=#:G234))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;lieAlgebra?;B;19| ((% (|Boolean|)))
        (COND
         ((SPADCALL (QREFELT % 97))
          (COND ((SPADCALL (QREFELT % 98)) 'T) (#1='T NIL)))
         (#1# NIL))) 

(SDEFUN |FINAALG-;jordanAlgebra?;B;20| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G260 NIL) (#2=#:G261 NIL) (#3=#:G265 NIL) (|l| NIL)
          (#4=#:G264 NIL) (|k| NIL) (#5=#:G263 NIL) (|j| NIL) (#6=#:G262 NIL)
          (|i| NIL) (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (EXIT
                 (COND
                  ((OR
                    (QEQCAR
                     (SPADCALL
                      (SPADCALL 2 (|spadConstant| % 21) (QREFELT % 42))
                      (QREFELT % 44))
                     1)
                    (NULL (SPADCALL (QREFELT % 100))))
                   NIL)
                  ('T
                   (SEQ
                    (SEQ (LETT |i| 1) (LETT #6# |n|) G190
                         (COND ((|greater_SI| |i| #6#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #5# |n|) G190
                                (COND ((|greater_SI| |j| #5#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |k| 1) (LETT #4# |n|) G190
                                       (COND
                                        ((|greater_SI| |k| #4#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |l| 1) (LETT #3# |n|) G190
                                              (COND
                                               ((|greater_SI| |l| #3#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((NULL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |b| |i|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL |b| |j|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL
                                                        (SPADCALL |b| |l|
                                                                  (QREFELT %
                                                                           36))
                                                        (SPADCALL |b| |k|
                                                                  (QREFELT %
                                                                           36))
                                                        (QREFELT % 37))
                                                       (QREFELT % 94))
                                                      (SPADCALL
                                                       (SPADCALL |b| |l|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL |b| |j|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL
                                                        (SPADCALL |b| |k|
                                                                  (QREFELT %
                                                                           36))
                                                        (SPADCALL |b| |i|
                                                                  (QREFELT %
                                                                           36))
                                                        (QREFELT % 37))
                                                       (QREFELT % 94))
                                                      (QREFELT % 38))
                                                     (SPADCALL
                                                      (SPADCALL |b| |k|
                                                                (QREFELT % 36))
                                                      (SPADCALL |b| |j|
                                                                (QREFELT % 36))
                                                      (SPADCALL
                                                       (SPADCALL |b| |i|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL |b| |l|
                                                                 (QREFELT %
                                                                          36))
                                                       (QREFELT % 37))
                                                      (QREFELT % 94))
                                                     (QREFELT % 38))
                                                    (QREFELT % 40)))
                                                  (PROGN
                                                   (LETT #1#
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #7=#:G259)))
                                                   (GO #8=#:G253))))))
                                              (LETT |l| (|inc_SI| |l|))
                                              (GO G190) G191 (EXIT NIL)))
                                        #8# (EXIT #1#))
                                       (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT 'T)))))))
          #7# (EXIT #2#)))) 

(SDEFUN |FINAALG-;noncommutativeJordanAlgebra?;B;21| ((% (|Boolean|)))
        (COND
         ((OR
           (OR
            (QEQCAR
             (SPADCALL (SPADCALL 2 (|spadConstant| % 21) (QREFELT % 42))
                       (QREFELT % 44))
             1)
            (NULL (SPADCALL (QREFELT % 102))))
           (NULL (SPADCALL (QREFELT % 103))))
          NIL)
         ('T 'T))) 

(SDEFUN |FINAALG-;antiCommutative?;B;22| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G278 NIL) (#2=#:G279 NIL) (#3=#:G281 NIL) (|j| NIL)
          (#4=#:G280 NIL) (|i| NIL) (|n| (|PositiveInteger|))
          (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #4# |n|) G190
                     (COND ((|greater_SI| |i| #4#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| |i|) (LETT #3# |n|) G190
                            (COND ((> |j| #3#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (SPADCALL
                                  (COND
                                   ((EQL |i| |j|)
                                    (SPADCALL (SPADCALL |b| |i| (QREFELT % 36))
                                              (SPADCALL |b| |i| (QREFELT % 36))
                                              (QREFELT % 37)))
                                   ('T
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |b| |i| (QREFELT % 36))
                                      (SPADCALL |b| |j| (QREFELT % 36))
                                      (QREFELT % 37))
                                     (SPADCALL
                                      (SPADCALL |b| |j| (QREFELT % 36))
                                      (SPADCALL |b| |i| (QREFELT % 36))
                                      (QREFELT % 37))
                                     (QREFELT % 38))))
                                  (QREFELT % 40)))
                                (PROGN
                                 (LETT #1#
                                       (PROGN (LETT #2# NIL) (GO #5=#:G277)))
                                 (GO #6=#:G274))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                      #6# (EXIT #1#))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #5# (EXIT #2#)))) 

(SDEFUN |FINAALG-;commutative?;B;23| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G289 NIL) (#2=#:G290 NIL) (#3=#:G292 NIL) (|j| NIL)
          (#4=#:G291 NIL) (|i| NIL) (|n| (|PositiveInteger|))
          (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #4# |n|) G190
                     (COND ((|greater_SI| |i| #4#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (+ |i| 1)) (LETT #3# |n|) G190
                            (COND ((> |j| #3#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT % 36))
                                            (SPADCALL |b| |j| (QREFELT % 36))
                                            (QREFELT % 47))
                                  (QREFELT % 40)))
                                (PROGN
                                 (LETT #1#
                                       (PROGN (LETT #2# NIL) (GO #5=#:G288)))
                                 (GO #6=#:G285))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                      #6# (EXIT #1#))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #5# (EXIT #2#)))) 

(SDEFUN |FINAALG-;associative?;B;24| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G302 NIL) (#2=#:G303 NIL) (#3=#:G306 NIL) (|k| NIL)
          (#4=#:G305 NIL) (|j| NIL) (#5=#:G304 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (QREFELT % 94))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #1#
                                              (PROGN
                                               (LETT #2# NIL)
                                               (GO #6=#:G301)))
                                        (GO #7=#:G297))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;leftAlternative?;B;25| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G316 NIL) (#2=#:G317 NIL) (#3=#:G320 NIL) (|k| NIL)
          (#4=#:G319 NIL) (|j| NIL) (#5=#:G318 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (SPADCALL
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #1#
                                              (PROGN
                                               (LETT #2# NIL)
                                               (GO #6=#:G315)))
                                        (GO #7=#:G311))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;rightAlternative?;B;26| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G330 NIL) (#2=#:G331 NIL) (#3=#:G334 NIL) (|k| NIL)
          (#4=#:G333 NIL) (|j| NIL) (#5=#:G332 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #1#
                                              (PROGN
                                               (LETT #2# NIL)
                                               (GO #6=#:G329)))
                                        (GO #7=#:G325))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;flexible?;B;27| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G344 NIL) (#2=#:G345 NIL) (#3=#:G348 NIL) (|k| NIL)
          (#4=#:G347 NIL) (|j| NIL) (#5=#:G346 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (SPADCALL
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #1#
                                              (PROGN
                                               (LETT #2# NIL)
                                               (GO #6=#:G343)))
                                        (GO #7=#:G339))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;alternative?;B;28| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G359 NIL) (#2=#:G360 NIL) (#3=#:G363 NIL) (|k| NIL)
          (#4=#:G362 NIL) (|j| NIL) (#5=#:G361 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (SPADCALL
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN (LETT #2# NIL) (GO #6=#:G358)))
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #1#
                                              (PROGN (LETT #2# NIL) (GO #6#)))
                                        (GO #7=#:G353)))))
                                    #7# (EXIT #1#))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;leftDiscriminant;VR;29| ((|v| (|Vector| S)) (% (R)))
        (SPADCALL (SPADCALL |v| (QREFELT % 112)) (QREFELT % 32))) 

(SDEFUN |FINAALG-;rightDiscriminant;VR;30| ((|v| (|Vector| S)) (% (R)))
        (SPADCALL (SPADCALL |v| (QREFELT % 114)) (QREFELT % 32))) 

(SDEFUN |FINAALG-;coordinates;2VM;31|
        ((|v| (|Vector| S)) (|b| (|Vector| S)) (% (|Matrix| R)))
        (SPROG ((#1=#:G370 NIL) (|i| NIL) (|j| NIL) (|m| (|Matrix| R)))
               (SEQ
                (LETT |m|
                      (MAKE_MATRIX1 (QVSIZE |v|) (QVSIZE |b|)
                                    (|spadConstant| % 28)))
                (SEQ (LETT |j| (PROGN |m| 1))
                     (LETT |i| (SPADCALL |v| (QREFELT % 116)))
                     (LETT #1# (QVSIZE |v|)) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |m| |j|
                                 (SPADCALL (QAREF1O |v| |i| 1) |b|
                                           (QREFELT % 68))
                                 (QREFELT % 117))))
                     (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |FINAALG-;represents;VVS;32|
        ((|v| (|Vector| R)) (|b| (|Vector| S)) (% (S)))
        (SPROG
         ((#1=#:G377 NIL) (#2=#:G379 NIL) (|i| NIL) (#3=#:G378 NIL)
          (|m| (|Integer|)))
         (SEQ (LETT |m| (- (SPADCALL |v| (QREFELT % 119)) 1))
              (EXIT
               (SPADCALL (ELT % 38)
                         (PROGN
                          (LETT #3# (GETREFV #4=(QVSIZE |b|)))
                          (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #1# 0) G190
                               (COND ((|greater_SI| |i| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SETELT #3# #1#
                                         (SPADCALL
                                          (SPADCALL |v| (+ |i| |m|)
                                                    (QREFELT % 69))
                                          (SPADCALL |b| (+ |i| |m|)
                                                    (QREFELT % 36))
                                          (QREFELT % 80)))))
                               (LETT #1#
                                     (PROG1 (|inc_SI| #1#)
                                       (LETT |i| (|inc_SI| |i|))))
                               (GO G190) G191 (EXIT NIL))
                          #3#)
                         (QREFELT % 82)))))) 

(SDEFUN |FINAALG-;leftTraceMatrix;VM;33| ((|v| (|Vector| S)) (% (|Matrix| R)))
        (SPROG
         ((#1=#:G388 NIL) (|j| NIL) (#2=#:G387 NIL) (#3=#:G386 NIL) (|i| NIL)
          (#4=#:G385 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #4# NIL)
            (SEQ (LETT |i| (SPADCALL |v| (QREFELT % 116)))
                 (LETT #3# (QVSIZE |v|)) G190 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |j| (SPADCALL |v| (QREFELT % 116)))
                                (LETT #1# (QVSIZE |v|)) G190
                                (COND ((> |j| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |v| |i| (QREFELT % 36))
                                           (SPADCALL |v| |j| (QREFELT % 36))
                                           (QREFELT % 37))
                                          (QREFELT % 121))
                                         #2#))))
                                (LETT |j| (+ |j| 1)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT (NREVERSE #4#))))
           (QREFELT % 123))))) 

(SDEFUN |FINAALG-;rightTraceMatrix;VM;34| ((|v| (|Vector| S)) (% (|Matrix| R)))
        (SPROG
         ((#1=#:G397 NIL) (|j| NIL) (#2=#:G396 NIL) (#3=#:G395 NIL) (|i| NIL)
          (#4=#:G394 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #4# NIL)
            (SEQ (LETT |i| (SPADCALL |v| (QREFELT % 116)))
                 (LETT #3# (QVSIZE |v|)) G190 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |j| (SPADCALL |v| (QREFELT % 116)))
                                (LETT #1# (QVSIZE |v|)) G190
                                (COND ((> |j| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |v| |i| (QREFELT % 36))
                                           (SPADCALL |v| |j| (QREFELT % 36))
                                           (QREFELT % 37))
                                          (QREFELT % 125))
                                         #2#))))
                                (LETT |j| (+ |j| 1)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT (NREVERSE #4#))))
           (QREFELT % 123))))) 

(SDEFUN |FINAALG-;leftRegularRepresentation;SVM;35|
        ((|x| (S)) (|b| (|Vector| S)) (% (|Matrix| R)))
        (SPROG ((#1=#:G405 NIL) (|i| NIL) (#2=#:G404 NIL) (|m| (|Integer|)))
               (SEQ (LETT |m| (- (SPADCALL |b| (QREFELT % 116)) 1))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |i| 1) (LETT #1# (SPADCALL (QREFELT % 9)))
                             G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |x|
                                                  (SPADCALL |b| (+ |i| |m|)
                                                            (QREFELT % 36))
                                                  (QREFELT % 37))
                                        |b| (QREFELT % 68))
                                       (QREFELT % 128))
                                      #2#))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT % 123))
                      (QREFELT % 129)))))) 

(SDEFUN |FINAALG-;rightRegularRepresentation;SVM;36|
        ((|x| (S)) (|b| (|Vector| S)) (% (|Matrix| R)))
        (SPROG ((#1=#:G413 NIL) (|i| NIL) (#2=#:G412 NIL) (|m| (|Integer|)))
               (SEQ (LETT |m| (- (SPADCALL |b| (QREFELT % 116)) 1))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |i| 1) (LETT #1# (SPADCALL (QREFELT % 9)))
                             G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |b| (+ |i| |m|)
                                                   (QREFELT % 36))
                                         |x| (QREFELT % 37))
                                        |b| (QREFELT % 68))
                                       (QREFELT % 128))
                                      #2#))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT % 123))
                      (QREFELT % 129)))))) 

(DECLAIM (NOTINLINE |FiniteRankNonAssociativeAlgebra&;|)) 

(DEFUN |FiniteRankNonAssociativeAlgebra&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FiniteRankNonAssociativeAlgebra&| DV$1 DV$2))
          (LETT % (GETREFV 132))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|HasCategory| (|SparseUnivariatePolynomial| |#2|)
                           '(|CommutativeRing|))
            (PROGN
             (QSETREFV % 25
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;leftCharacteristicPolynomial;SSup;1|)
                        %))
             (QSETREFV % 27
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;rightCharacteristicPolynomial;SSup;2|)
                        %)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 83
                       (CONS (|dispatchFunction| |FINAALG-;leftRecip;SU;12|)
                             %))
             (QSETREFV % 85
                       (CONS (|dispatchFunction| |FINAALG-;rightRecip;SU;13|)
                             %))
             (QSETREFV % 89
                       (CONS (|dispatchFunction| |FINAALG-;recip;SU;14|) %))
             (QSETREFV % 92
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;leftMinimalPolynomial;SSup;15|)
                        %))
             (QSETREFV % 93
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;rightMinimalPolynomial;SSup;16|)
                        %))
             (QSETREFV % 95
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;associatorDependence;L;17|)
                        %)))))
          %))) 

(MAKEPROP '|FiniteRankNonAssociativeAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |rank|) (|Vector| %) (4 . |someBasis|)
              (|Matrix| 7) (8 . |leftRegularRepresentation|)
              (|NonNegativeInteger|) (|Matrix| 19) (14 . |zero|) (|Integer|)
              (20 . |elt|) (|SparseUnivariatePolynomial| 7) (27 . |monomial|)
              (33 . |One|) (37 . -) (43 . |setelt!|) (51 . |determinant|)
              (56 . |leftCharacteristicPolynomial|)
              (61 . |rightRegularRepresentation|)
              (67 . |rightCharacteristicPolynomial|) (72 . |Zero|) (76 . +)
              |FINAALG-;leftTrace;SR;3| |FINAALG-;rightTrace;SR;4|
              (82 . |determinant|) |FINAALG-;leftNorm;SR;5|
              |FINAALG-;rightNorm;SR;6| (|Vector| 6) (87 . |elt|) (93 . *)
              (99 . +) (|Boolean|) (105 . |zero?|)
              |FINAALG-;antiAssociative?;B;7| (110 . *) (|Union| % '"failed")
              (116 . |recip|) (121 . |antiCommutator|)
              |FINAALG-;jordanAdmissible?;B;8| (127 . |commutator|)
              |FINAALG-;lieAdmissible?;B;9| (|Vector| 12)
              (133 . |structuralConstants|) (|String|) (|Symbol|)
              (138 . |coerce|) (|Vector| 52) (143 . |elt|) (|Polynomial| 7)
              (149 . |One|) (153 . -) (|List| 52) (|List| 14)
              (158 . |monomial|) (165 . |elt|) (171 . |coerce|) (176 . +)
              (|List| 56) |FINAALG-;conditionsForIdempotents;VL;10|
              (|Vector| 7) (182 . |coordinates|) (188 . |elt|)
              (194 . |setelt!|) |FINAALG-;structuralConstants;VV;11|
              (202 . |leftUnit|) (206 . |coerce|) (211 . |rank|)
              (216 . |horizConcat|) (|List| 67) (222 . |nullSpace|) (227 . -)
              (232 . *) (238 . *) (|Mapping| 6 6 6) (244 . |reduce|)
              (250 . |leftRecip|) (255 . |rightUnit|) (259 . |rightRecip|)
              (264 . |leftRecip|) (269 . |rightRecip|) (274 . ~=)
              (280 . |recip|) (285 . |Zero|) (289 . +)
              (295 . |leftMinimalPolynomial|) (300 . |rightMinimalPolynomial|)
              (305 . |associator|) (312 . |associatorDependence|)
              |FINAALG-;jacobiIdentity?;B;18| (316 . |antiCommutative?|)
              (320 . |jacobiIdentity?|) |FINAALG-;lieAlgebra?;B;19|
              (324 . |commutative?|) |FINAALG-;jordanAlgebra?;B;20|
              (328 . |flexible?|) (332 . |jordanAdmissible?|)
              |FINAALG-;noncommutativeJordanAlgebra?;B;21|
              |FINAALG-;antiCommutative?;B;22| |FINAALG-;commutative?;B;23|
              |FINAALG-;associative?;B;24| |FINAALG-;leftAlternative?;B;25|
              |FINAALG-;rightAlternative?;B;26| |FINAALG-;flexible?;B;27|
              |FINAALG-;alternative?;B;28| (336 . |leftTraceMatrix|)
              |FINAALG-;leftDiscriminant;VR;29| (341 . |rightTraceMatrix|)
              |FINAALG-;rightDiscriminant;VR;30| (346 . |minIndex|)
              (351 . |setRow!|) |FINAALG-;coordinates;2VM;31|
              (358 . |minIndex|) |FINAALG-;represents;VVS;32|
              (363 . |leftTrace|) (|List| 127) (368 . |matrix|)
              |FINAALG-;leftTraceMatrix;VM;33| (373 . |rightTrace|)
              |FINAALG-;rightTraceMatrix;VM;34| (|List| 7) (378 . |parts|)
              (383 . |transpose|) |FINAALG-;leftRegularRepresentation;SVM;35|
              |FINAALG-;rightRegularRepresentation;SVM;36|)
           '#(|structuralConstants| 388 |rightTraceMatrix| 393 |rightTrace| 398
              |rightRegularRepresentation| 403 |rightRecip| 409 |rightNorm| 414
              |rightMinimalPolynomial| 419 |rightDiscriminant| 424
              |rightCharacteristicPolynomial| 429 |rightAlternative?| 434
              |represents| 438 |recip| 444 |noncommutativeJordanAlgebra?| 449
              |lieAlgebra?| 453 |lieAdmissible?| 457 |leftTraceMatrix| 461
              |leftTrace| 466 |leftRegularRepresentation| 471 |leftRecip| 477
              |leftNorm| 482 |leftMinimalPolynomial| 487 |leftDiscriminant| 492
              |leftCharacteristicPolynomial| 497 |leftAlternative?| 502
              |jordanAlgebra?| 506 |jordanAdmissible?| 510 |jacobiIdentity?|
              514 |flexible?| 518 |coordinates| 522 |conditionsForIdempotents|
              528 |commutative?| 533 |associatorDependence| 537 |associative?|
              541 |antiCommutative?| 545 |antiAssociative?| 549 |alternative?|
              553)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|rightMinimalPolynomial|
                                 ((|SparseUnivariatePolynomial| |#2|) |#1|))
                                T)
                              '((|leftMinimalPolynomial|
                                 ((|SparseUnivariatePolynomial| |#2|) |#1|))
                                T)
                              '((|associatorDependence|
                                 ((|List| (|Vector| |#2|))))
                                T)
                              '((|rightRecip| ((|Union| |#1| "failed") |#1|))
                                T)
                              '((|leftRecip| ((|Union| |#1| "failed") |#1|)) T)
                              '((|recip| ((|Union| |#1| "failed") |#1|)) T)
                              '((|lieAlgebra?| ((|Boolean|))) T)
                              '((|jordanAlgebra?| ((|Boolean|))) T)
                              '((|noncommutativeJordanAlgebra?| ((|Boolean|)))
                                T)
                              '((|jordanAdmissible?| ((|Boolean|))) T)
                              '((|lieAdmissible?| ((|Boolean|))) T)
                              '((|jacobiIdentity?| ((|Boolean|))) T)
                              '((|alternative?| ((|Boolean|))) T)
                              '((|flexible?| ((|Boolean|))) T)
                              '((|rightAlternative?| ((|Boolean|))) T)
                              '((|leftAlternative?| ((|Boolean|))) T)
                              '((|antiAssociative?| ((|Boolean|))) T)
                              '((|associative?| ((|Boolean|))) T)
                              '((|antiCommutative?| ((|Boolean|))) T)
                              '((|commutative?| ((|Boolean|))) T)
                              '((|rightCharacteristicPolynomial|
                                 ((|SparseUnivariatePolynomial| |#2|) |#1|))
                                T)
                              '((|leftCharacteristicPolynomial|
                                 ((|SparseUnivariatePolynomial| |#2|) |#1|))
                                T)
                              '((|rightTraceMatrix|
                                 ((|Matrix| |#2|) (|Vector| |#1|)))
                                T)
                              '((|leftTraceMatrix|
                                 ((|Matrix| |#2|) (|Vector| |#1|)))
                                T)
                              '((|rightDiscriminant| (|#2| (|Vector| |#1|))) T)
                              '((|leftDiscriminant| (|#2| (|Vector| |#1|))) T)
                              '((|represents|
                                 (|#1| (|Vector| |#2|) (|Vector| |#1|)))
                                T)
                              '((|coordinates|
                                 ((|Matrix| |#2|) (|Vector| |#1|)
                                  (|Vector| |#1|)))
                                T)
                              '((|coordinates|
                                 ((|Vector| |#2|) |#1| (|Vector| |#1|)))
                                T)
                              '((|rightNorm| (|#2| |#1|)) T)
                              '((|leftNorm| (|#2| |#1|)) T)
                              '((|rightTrace| (|#2| |#1|)) T)
                              '((|leftTrace| (|#2| |#1|)) T)
                              '((|rightRegularRepresentation|
                                 ((|Matrix| |#2|) |#1| (|Vector| |#1|)))
                                T)
                              '((|leftRegularRepresentation|
                                 ((|Matrix| |#2|) |#1| (|Vector| |#1|)))
                                T)
                              '((|structuralConstants|
                                 ((|Vector| (|Matrix| |#2|)) (|Vector| |#1|)))
                                T)
                              '((|conditionsForIdempotents|
                                 ((|List| (|Polynomial| |#2|))
                                  (|Vector| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 131
                                            '(0 6 8 9 0 6 10 11 2 6 12 0 10 13
                                              2 15 0 14 14 16 3 12 7 0 17 17 18
                                              2 19 0 7 14 20 0 7 0 21 2 19 0 0
                                              0 22 4 15 19 0 17 17 19 23 1 15
                                              19 0 24 1 0 19 0 25 2 6 12 0 10
                                              26 1 0 19 0 27 0 7 0 28 2 7 0 0 0
                                              29 1 12 7 0 32 2 35 6 0 17 36 2 6
                                              0 0 0 37 2 6 0 0 0 38 1 6 39 0 40
                                              2 7 0 8 0 42 1 7 43 0 44 2 6 0 0
                                              0 45 2 6 0 0 0 47 1 6 49 10 50 1
                                              52 0 51 53 2 54 52 0 17 55 0 56 0
                                              57 1 56 0 0 58 3 56 0 0 59 60 61
                                              2 49 12 0 17 62 1 56 0 7 63 2 56
                                              0 0 0 64 2 6 67 0 10 68 2 67 7 0
                                              17 69 4 12 7 0 17 17 7 70 0 6 43
                                              72 1 12 0 67 73 1 12 14 0 74 2 12
                                              0 0 0 75 1 12 76 0 77 1 7 0 0 78
                                              2 7 0 0 0 79 2 6 0 7 0 80 2 35 6
                                              81 0 82 1 0 43 0 83 0 6 43 84 1 0
                                              43 0 85 1 6 43 0 86 1 6 43 0 87 2
                                              6 39 0 0 88 1 0 43 0 89 0 19 0 90
                                              2 19 0 0 0 91 1 0 19 0 92 1 0 19
                                              0 93 3 6 0 0 0 0 94 0 0 76 95 0 6
                                              39 97 0 6 39 98 0 6 39 100 0 6 39
                                              102 0 6 39 103 1 6 12 10 112 1 6
                                              12 10 114 1 35 17 0 116 3 12 0 0
                                              17 67 117 1 67 17 0 119 1 6 7 0
                                              121 1 12 0 122 123 1 6 7 0 125 1
                                              67 127 0 128 1 12 0 0 129 1 0 49
                                              10 71 1 0 12 10 126 1 0 7 0 31 2
                                              0 12 0 10 131 1 0 43 0 85 1 0 7 0
                                              34 1 0 19 0 93 1 0 7 10 115 1 0
                                              19 0 27 0 0 39 109 2 0 0 67 10
                                              120 1 0 43 0 89 0 0 39 104 0 0 39
                                              99 0 0 39 48 1 0 12 10 124 1 0 7
                                              0 30 2 0 12 0 10 130 1 0 43 0 83
                                              1 0 7 0 33 1 0 19 0 92 1 0 7 10
                                              113 1 0 19 0 25 0 0 39 108 0 0 39
                                              101 0 0 39 46 0 0 39 96 0 0 39
                                              110 2 0 12 10 10 118 1 0 65 10 66
                                              0 0 39 106 0 0 76 95 0 0 39 107 0
                                              0 39 105 0 0 39 41 0 0 39
                                              111)))))
           '|lookupComplete|)) 
