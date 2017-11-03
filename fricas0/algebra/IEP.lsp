
(SDEFUN |IEP;eigenvalues;ML;1|
        ((|m| |Matrix| F)
         ($ |List| (|Union| F (|SparseUnivariatePolynomial| F))))
        (SPADCALL |m| (ELT $ 9) (QREFELT $ 14))) 

(SDEFUN |IEP;eigenvectors;ML;2|
        ((|m| |Matrix| F)
         ($ |List|
          (|Record| (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
                    (|:| |eigmult| (|NonNegativeInteger|))
                    (|:| |eigvec|
                         (|List|
                          (|Vector| (|SparseUnivariatePolynomial| F)))))))
        (SPADCALL |m| (ELT $ 9) (QREFELT $ 18))) 

(SDEFUN |IEP;generalizedEigenvectors;ML;3|
        ((|m| |Matrix| F)
         ($ |List|
          (|Record| (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
                    (|:| |geneigvec|
                         (|List|
                          (|Vector| (|SparseUnivariatePolynomial| F)))))))
        (SPADCALL |m| (ELT $ 9) (QREFELT $ 22))) 

(SDEFUN |IEP;reduction|
        ((|u| |SparseUnivariatePolynomial| F)
         (|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial| F))
        (SPADCALL |u| |p| (QREFELT $ 25))) 

(SDEFUN |IEP;merge|
        ((|p| |SparseUnivariatePolynomial| F)
         (|q| |SparseUnivariatePolynomial| F)
         ($ |Union| (|SparseUnivariatePolynomial| F) "failed"))
        (COND ((SPADCALL |p| |q| (QREFELT $ 27)) (CONS 0 |p|))
              ((SPADCALL |p| (|spadConstant| $ 29) (QREFELT $ 27))
               (CONS 0 |q|))
              ((SPADCALL |q| (|spadConstant| $ 29) (QREFELT $ 27))
               (CONS 0 |p|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |IEP;exactquo|
        ((|u| |SparseUnivariatePolynomial| F)
         (|v| |SparseUnivariatePolynomial| F)
         (|p| |SparseUnivariatePolynomial| F)
         ($ |Union| (|SparseUnivariatePolynomial| F) "failed"))
        (SPROG
         ((|val|
           (|Union|
            (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                      (|:| |coef2| (|SparseUnivariatePolynomial| F)))
            "failed")))
         (SEQ (LETT |val| (SPADCALL |v| |p| |u| (QREFELT $ 32)) |IEP;exactquo|)
              (EXIT
               (COND ((QEQCAR |val| 1) (CONS 1 "failed"))
                     ('T (CONS 0 (QCAR (QCDR |val|))))))))) 

(SDEFUN |IEP;genEigForm|
        ((|eigen| |Record|
          (|:| |eigval| #1=(|Union| F (|SparseUnivariatePolynomial| F)))
          (|:| |eigmult| #2=(|NonNegativeInteger|))
          (|:| |eigvec| (|List| (|Vector| (|SparseUnivariatePolynomial| F)))))
         (A |Matrix| F)
         ($ |Record|
          (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
          (|:| |geneigvec|
               (|List| (|Vector| (|SparseUnivariatePolynomial| F))))))
        (SPROG ((|g| (|NonNegativeInteger|)) (|k| #2#) (|alpha| #1#))
               (SEQ (LETT |alpha| (QVELT |eigen| 0) . #3=(|IEP;genEigForm|))
                    (LETT |k| (QVELT |eigen| 1) . #3#)
                    (LETT |g| (LENGTH (QVELT |eigen| 2)) . #3#)
                    (EXIT
                     (COND ((EQL |k| |g|) (CONS |alpha| (QVELT |eigen| 2)))
                           ('T
                            (CONS |alpha|
                                  (SPADCALL |alpha| A |k| |g|
                                            (QREFELT $ 35))))))))) 

(SDEFUN |IEP;characteristicPolynomial;MSup;8|
        ((A |Matrix| F) ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((#1=#:G754 NIL) (|j| NIL) (#2=#:G753 NIL) (|i| NIL)
          (B (|Matrix| (|SparseUnivariatePolynomial| F)))
          (|dimA| (|NonNegativeInteger|)))
         (SEQ
          (LETT |dimA| (ANROWS A) . #3=(|IEP;characteristicPolynomial;MSup;8|))
          (EXIT
           (COND
            ((SPADCALL |dimA| (ANCOLS A) (QREFELT $ 36))
             (|error| " The matrix is not square"))
            ((EQL |dimA| 0) (|spadConstant| $ 37))
            ('T
             (SEQ (LETT B (SPADCALL |dimA| |dimA| (QREFELT $ 39)) . #3#)
                  (SEQ (LETT |i| 1 . #3#) (LETT #2# |dimA| . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (SEQ (LETT |j| 1 . #3#) (LETT #1# |dimA| . #3#) G190
                             (COND ((|greater_SI| |j| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL B |i| |j|
                                         (SPADCALL
                                          (SPADCALL A |i| |j| (QREFELT $ 41))
                                          (QREFELT $ 42))
                                         (QREFELT $ 43))))
                             (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SPADCALL B |i| |i|
                                   (SPADCALL
                                    (SPADCALL B |i| |i| (QREFELT $ 44))
                                    (SPADCALL (|spadConstant| $ 45) 1
                                              (QREFELT $ 46))
                                    (QREFELT $ 47))
                                   (QREFELT $ 43))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (SPADCALL B (QREFELT $ 48)))))))))) 

(SDEFUN |IEP;eigenvalues;MML;9|
        ((A |Matrix| F)
         (|fac| |Mapping| (|Factored| (|SparseUnivariatePolynomial| F))
          (|SparseUnivariatePolynomial| F))
         ($ |List| (|Union| F (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((#1=#:G770 NIL) (|ls| NIL) (#2=#:G769 NIL) (#3=#:G768 NIL) (|lr| NIL)
          (#4=#:G767 NIL) (|lsym| (|List| (|SparseUnivariatePolynomial| F)))
          (|lrat| (|List| F)) (|rv| (F))
          (|f1| (|SparseUnivariatePolynomial| F)) (#5=#:G766 NIL) (|fr| NIL)
          (|fp| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|pol| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |pol| (SPADCALL A (QREFELT $ 49))
                . #6=(|IEP;eigenvalues;MML;9|))
          (LETT |lrat| NIL . #6#) (LETT |lsym| NIL . #6#)
          (LETT |fp| (SPADCALL |pol| |fac|) . #6#)
          (SEQ (LETT |fr| NIL . #6#)
               (LETT #5# (SPADCALL |fp| (QREFELT $ 53)) . #6#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |fr| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ (LETT |f1| (QCAR |fr|) . #6#)
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |f1| (QREFELT $ 54)) 1)
                       (SEQ
                        (LETT |rv|
                              (SPADCALL
                               (SPADCALL (SPADCALL |f1| 0 (QREFELT $ 55))
                                         (SPADCALL |f1| (QREFELT $ 56))
                                         (QREFELT $ 57))
                               (QREFELT $ 58))
                              . #6#)
                        (EXIT (LETT |lrat| (CONS |rv| |lrat|) . #6#))))
                      ('T (LETT |lsym| (CONS |f1| |lsym|) . #6#)))))
               (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #4# NIL . #6#)
             (SEQ (LETT |lr| NIL . #6#) (LETT #3# |lrat| . #6#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |lr| (CAR #3#) . #6#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #4# (CONS (CONS 0 |lr|) #4#) . #6#)))
                  (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            (PROGN
             (LETT #2# NIL . #6#)
             (SEQ (LETT |ls| NIL . #6#) (LETT #1# |lsym| . #6#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ls| (CAR #1#) . #6#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #2# (CONS (CONS 1 |ls|) #2#) . #6#)))
                  (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            (QREFELT $ 59)))))) 

(SDEFUN |IEP;eigenvector;UML;10|
        ((|alpha| |Union| F (|SparseUnivariatePolynomial| F)) (A |Matrix| F)
         ($ |List| (|Vector| (|SparseUnivariatePolynomial| F))))
        (COND ((QEQCAR |alpha| 0) (|IEP;intRatEig| (QCDR |alpha|) A 1 $))
              ('T (|IEP;intAlgEig| (QCDR |alpha|) A 1 $)))) 

(SDEFUN |IEP;intRatEig|
        ((|alpha| F) (A |Matrix| F) (|m| |NonNegativeInteger|)
         ($ |List| (|Vector| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|sol| (|List| (|Vector| (|SparseUnivariatePolynomial| F))))
          (#1=#:G790 NIL) (|i| NIL)
          (|w| (|Vector| (|SparseUnivariatePolynomial| F))) (#2=#:G789 NIL)
          (|v| NIL) (#3=#:G788 NIL) (|j| NIL) (#4=#:G787 NIL) (B (|Matrix| F))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS A) . #5=(|IEP;intRatEig|))
              (LETT B (SPADCALL |n| |n| (QREFELT $ 61)) . #5#)
              (SEQ (LETT |i| 1 . #5#) (LETT #4# |n| . #5#) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1 . #5#) (LETT #3# |n| . #5#) G190
                         (COND ((|greater_SI| |j| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL B |i| |j|
                                     (SPADCALL A |i| |j| (QREFELT $ 41))
                                     (QREFELT $ 62))))
                         (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (SPADCALL B |i| |i|
                               (SPADCALL (SPADCALL B |i| |i| (QREFELT $ 41))
                                         |alpha| (QREFELT $ 63))
                               (QREFELT $ 62))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |sol| NIL . #5#)
              (SEQ (LETT |v| NIL . #5#)
                   (LETT #2#
                         (SPADCALL (SPADCALL B |m| (QREFELT $ 64))
                                   (QREFELT $ 66))
                         . #5#)
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |w| (MAKEARR1 |n| (|spadConstant| $ 29)) . #5#)
                        (SEQ (LETT |i| 1 . #5#) (LETT #1# |n| . #5#) G190
                             (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |w| |i|
                                         (SPADCALL
                                          (SPADCALL |v| |i| (QREFELT $ 68))
                                          (QREFELT $ 42))
                                         (QREFELT $ 70))))
                             (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |sol| (CONS |w| |sol|) . #5#)))
                   (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |sol|)))) 

(SDEFUN |IEP;intAlgEig|
        ((|alpha| |SparseUnivariatePolynomial| F) (A |Matrix| F)
         (|m| |NonNegativeInteger|)
         ($ |List| (|Vector| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|sol| (|List| (|Vector| (|SparseUnivariatePolynomial| F))))
          (#1=#:G817 NIL) (|i| NIL)
          (|w| (|Vector| (|SparseUnivariatePolynomial| F))) (#2=#:G816 NIL)
          (|vec| NIL) (#3=#:G815 NIL) (|j| NIL) (#4=#:G814 NIL) (B (AM))
          (|alg| (MM)) (|pol| (|SparseUnivariatePolynomial| F))
          (AM
           (|Join| (|MatrixCategory| MM (|Vector| MM) (|Vector| MM))
                   (CATEGORY |domain|
                    (SIGNATURE |diagonalMatrix| ($ (|Vector| MM)))
                    (IF (|has| MM (|ConvertibleTo| (|InputForm|)))
                        (ATTRIBUTE (|ConvertibleTo| (|InputForm|)))
                        |noBranch|)
                    (IF (|has| MM (|IntegralDomain|))
                        (SIGNATURE |invertIfCan| ((|Union| $ "failed") $))
                        |noBranch|))))
          (MM
           (|Join| (|Field|)
                   (CATEGORY |domain|
                    (SIGNATURE |modulus|
                     (#5=(|SparseUnivariatePolynomial| F) $))
                    (SIGNATURE |coerce|
                     (#6=(|SparseUnivariatePolynomial| F) $))
                    (SIGNATURE |reduce| ($ #6# #5#))
                    (SIGNATURE |exQuo| ((|Union| $ "failed") $ $)))))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS A) . #7=(|IEP;intAlgEig|))
              (LETT MM
                    (|ModularField|
                     (|SparseUnivariatePolynomial| (QREFELT $ 6))
                     (|SparseUnivariatePolynomial| (QREFELT $ 6))
                     (CONS (|function| |IEP;reduction|) $)
                     (CONS (|function| |IEP;merge|) $)
                     (CONS (|function| |IEP;exactquo|) $))
                    . #7#)
              (LETT AM (|Matrix| MM) . #7#)
              (LETT |pol| (SPADCALL |alpha| (QREFELT $ 71)) . #7#)
              (LETT |alg|
                    (SPADCALL (SPADCALL (|spadConstant| $ 45) 1 (QREFELT $ 46))
                              |pol|
                              (|compiledLookupCheck| '|reduce|
                                                     (LIST '$
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (|devaluate|
                                                             (ELT $ 6)))
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (|devaluate|
                                                             (ELT $ 6))))
                                                     MM))
                    . #7#)
              (LETT B
                    (SPADCALL |n| |n|
                              (|compiledLookupCheck| '|zero|
                                                     (LIST '$
                                                           (LIST
                                                            '|NonNegativeInteger|)
                                                           (LIST
                                                            '|NonNegativeInteger|))
                                                     AM))
                    . #7#)
              (SEQ (LETT |i| 1 . #7#) (LETT #4# |n| . #7#) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1 . #7#) (LETT #3# |n| . #7#) G190
                         (COND ((|greater_SI| |j| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL B |i| |j|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL A |i| |j| (QREFELT $ 41))
                                       (QREFELT $ 42))
                                      |pol|
                                      (|compiledLookupCheck| '|reduce|
                                                             (LIST '$
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          6)))
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          6))))
                                                             MM))
                                     (|compiledLookupCheck| '|setelt!|
                                                            (LIST
                                                             (|devaluate| MM)
                                                             '$
                                                             (LIST '|Integer|)
                                                             (LIST '|Integer|)
                                                             (|devaluate| MM))
                                                            AM))))
                         (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (SPADCALL B |i| |i|
                               (SPADCALL
                                (SPADCALL B |i| |i|
                                          (|compiledLookupCheck| '|elt|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   MM)
                                                                  '$
                                                                  (LIST
                                                                   '|Integer|)
                                                                  (LIST
                                                                   '|Integer|))
                                                                 AM))
                                |alg|
                                (|compiledLookupCheck| '- (LIST '$ '$ '$) MM))
                               (|compiledLookupCheck| '|setelt!|
                                                      (LIST (|devaluate| MM) '$
                                                            (LIST '|Integer|)
                                                            (LIST '|Integer|)
                                                            (|devaluate| MM))
                                                      AM))))
                   (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
              (LETT |sol| NIL . #7#)
              (SEQ (LETT |vec| NIL . #7#)
                   (LETT #2#
                         (SPADCALL
                          (SPADCALL B |m|
                                    (|compiledLookupCheck| '^
                                                           (LIST '$ '$
                                                                 (LIST
                                                                  '|NonNegativeInteger|))
                                                           AM))
                          (|compiledLookupCheck| '|nullSpace|
                                                 (LIST
                                                  (LIST '|List|
                                                        (LIST '|Vector|
                                                              (|devaluate|
                                                               MM)))
                                                  '$)
                                                 AM))
                         . #7#)
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |vec| (CAR #2#) . #7#) NIL))
                     (GO G191)))
                   (SEQ (LETT |w| (MAKEARR1 |n| (|spadConstant| $ 29)) . #7#)
                        (SEQ (LETT |i| 1 . #7#) (LETT #1# |n| . #7#) G190
                             (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |w| |i|
                                         (SPADCALL
                                          (SPADCALL |vec| |i|
                                                    (|compiledLookupCheck|
                                                     '|elt|
                                                     (LIST (|devaluate| MM) '$
                                                           (LIST '|Integer|))
                                                     (|Vector| MM)))
                                          (|compiledLookupCheck| '|coerce|
                                                                 (LIST
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    (ELT $ 6)))
                                                                  '$)
                                                                 MM))
                                         (QREFELT $ 70))))
                             (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |sol| (CONS |w| |sol|) . #7#)))
                   (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
              (EXIT |sol|)))) 

(SDEFUN |IEP;generalizedEigenvector;UM2NniL;13|
        ((|alpha| |Union| F (|SparseUnivariatePolynomial| F)) (A |Matrix| F)
         (|k| |NonNegativeInteger|) (|g| |NonNegativeInteger|)
         ($ |List| (|Vector| (|SparseUnivariatePolynomial| F))))
        (SPROG ((#1=#:G822 NIL) (#2=#:G821 NIL))
               (COND
                ((QEQCAR |alpha| 0)
                 (|IEP;intRatEig| (QCDR |alpha|) A
                  (PROG1
                      (LETT #2# (- (+ 1 |k|) |g|)
                            . #3=(|IEP;generalizedEigenvector;UM2NniL;13|))
                    (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #2#))
                  $))
                ('T
                 (|IEP;intAlgEig| (QCDR |alpha|) A
                  (PROG1 (LETT #1# (- (+ 1 |k|) |g|) . #3#)
                    (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #1#))
                  $))))) 

(SDEFUN |IEP;generalizedEigenvector;RML;14|
        ((|ei| |Record|
          (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
          (|:| |eigmult| (|NonNegativeInteger|))
          (|:| |eigvec| (|List| (|Vector| (|SparseUnivariatePolynomial| F)))))
         (A |Matrix| F) ($ |List| (|Vector| (|SparseUnivariatePolynomial| F))))
        (SPADCALL (QVELT |ei| 0) A (QVELT |ei| 1) (LENGTH (QVELT |ei| 2))
                  (QREFELT $ 35))) 

(SDEFUN |IEP;generalizedEigenvectors;MML;15|
        ((A |Matrix| F)
         (|fac| |Mapping| (|Factored| (|SparseUnivariatePolynomial| F))
          (|SparseUnivariatePolynomial| F))
         ($ |List|
          (|Record| (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
                    (|:| |geneigvec|
                         (|List|
                          (|Vector| (|SparseUnivariatePolynomial| F)))))))
        (SPROG
         ((#1=#:G835 NIL) (|leg| NIL) (#2=#:G834 NIL)
          (|leig|
           (|List|
            (|Record|
             (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
             (|:| |eigmult| (|NonNegativeInteger|))
             (|:| |eigvec|
                  (|List| (|Vector| (|SparseUnivariatePolynomial| F)))))))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS A) . #3=(|IEP;generalizedEigenvectors;MML;15|))
              (LETT |leig| (SPADCALL A |fac| (QREFELT $ 18)) . #3#)
              (EXIT
               (PROGN
                (LETT #2# NIL . #3#)
                (SEQ (LETT |leg| NIL . #3#) (LETT #1# |leig| . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |leg| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (|IEP;genEigForm| |leg| A $) #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |IEP;eigenvectors;MML;16|
        ((A |Matrix| F)
         (|fac| |Mapping| (|Factored| (|SparseUnivariatePolynomial| F))
          (|SparseUnivariatePolynomial| F))
         ($ |List|
          (|Record| (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
                    (|:| |eigmult| (|NonNegativeInteger|))
                    (|:| |eigvec|
                         (|List|
                          (|Vector| (|SparseUnivariatePolynomial| F)))))))
        (SPROG
         ((|algSol|
           #1=(|List|
               (|Record|
                (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
                (|:| |eigmult| (|NonNegativeInteger|))
                (|:| |eigvec|
                     (|List| (|Vector| (|SparseUnivariatePolynomial| F)))))))
          (#2=#:G843 NIL) (|alpha| #3=(|SparseUnivariatePolynomial| F))
          (|ratSol| #1#) (#4=#:G841 NIL) (|vec| (F)) (|pol| #3#)
          (#5=#:G849 NIL) (|fact| NIL)
          (|lff|
           (|List| (|Record| (|:| |factor| #3#) (|:| |exponent| (|Integer|)))))
          (|p| (|SparseUnivariatePolynomial| F)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS A) . #6=(|IEP;eigenvectors;MML;16|))
              (LETT |p| (SPADCALL A (QREFELT $ 49)) . #6#)
              (LETT |ratSol| NIL . #6#) (LETT |algSol| NIL . #6#)
              (LETT |lff| (SPADCALL (SPADCALL |p| |fac|) (QREFELT $ 53)) . #6#)
              (SEQ (LETT |fact| NIL . #6#) (LETT #5# |lff| . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |fact| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ (LETT |pol| (QCAR |fact|) . #6#)
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |pol| (QREFELT $ 54)) 1)
                           (SEQ
                            (LETT |vec|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |pol| 0 (QREFELT $ 55))
                                             (SPADCALL |pol| (QREFELT $ 56))
                                             (QREFELT $ 57))
                                   (QREFELT $ 58))
                                  . #6#)
                            (EXIT
                             (LETT |ratSol|
                                   (CONS
                                    (VECTOR (CONS 0 |vec|)
                                            (PROG1
                                                (LETT #4# (QCDR |fact|) . #6#)
                                              (|check_subtype2| (>= #4# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #4#))
                                            (|IEP;intRatEig| |vec| A 1 $))
                                    |ratSol|)
                                   . #6#))))
                          ('T
                           (SEQ (LETT |alpha| |pol| . #6#)
                                (EXIT
                                 (LETT |algSol|
                                       (CONS
                                        (VECTOR (CONS 1 |alpha|)
                                                (PROG1
                                                    (LETT #2# (QCDR |fact|)
                                                          . #6#)
                                                  (|check_subtype2| (>= #2# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #2#))
                                                (|IEP;intAlgEig| |alpha| A 1
                                                 $))
                                        |algSol|)
                                       . #6#)))))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |ratSol| |algSol| (QREFELT $ 73)))))) 

(DECLAIM (NOTINLINE |InnerEigenPackage;|)) 

(DEFUN |InnerEigenPackage| (#1=#:G850)
  (SPROG NIL
         (PROG (#2=#:G851)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|InnerEigenPackage|)
                                               '|domainEqualList|)
                    . #3=(|InnerEigenPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|InnerEigenPackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerEigenPackage|)))))))))) 

(DEFUN |InnerEigenPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerEigenPackage|))
          (LETT |dv$| (LIST '|InnerEigenPackage| DV$1) . #1#)
          (LETT $ (GETREFV 74) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|InnerEigenPackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 15
                       (CONS (|dispatchFunction| |IEP;eigenvalues;ML;1|) $))
             (QSETREFV $ 19
                       (CONS (|dispatchFunction| |IEP;eigenvectors;ML;2|) $))
             (QSETREFV $ 23
                       (CONS
                        (|dispatchFunction| |IEP;generalizedEigenvectors;ML;3|)
                        $)))))
          $))) 

(MAKEPROP '|InnerEigenPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Factored| 8)
              (|SparseUnivariatePolynomial| $) (0 . |factorPolynomial|)
              (|Union| 6 24) (|List| 10) (|Matrix| 6) (|Mapping| 52 24)
              |IEP;eigenvalues;MML;9| (5 . |eigenvalues|)
              (|Record| (|:| |eigval| 10) (|:| |eigmult| 34) (|:| |eigvec| 33))
              (|List| 16) |IEP;eigenvectors;MML;16| (10 . |eigenvectors|)
              (|Record| (|:| |eigval| 10) (|:| |geneigvec| 33)) (|List| 20)
              |IEP;generalizedEigenvectors;MML;15|
              (15 . |generalizedEigenvectors|) (|SparseUnivariatePolynomial| 6)
              (20 . |rem|) (|Boolean|) (26 . =) (32 . |Zero|) (36 . |Zero|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 30 '"failed")
              (40 . |extendedEuclidean|) (|List| 69) (|NonNegativeInteger|)
              |IEP;generalizedEigenvector;UM2NniL;13| (47 . ~=) (53 . |One|)
              (|Matrix| 24) (57 . |zero|) (|Integer|) (63 . |elt|)
              (70 . |coerce|) (75 . |setelt!|) (83 . |elt|) (90 . |One|)
              (94 . |monomial|) (100 . -) (106 . |determinant|)
              |IEP;characteristicPolynomial;MSup;8|
              (|Record| (|:| |factor| 24) (|:| |exponent| 40)) (|List| 50)
              (|Factored| 24) (111 . |factors|) (116 . |degree|)
              (121 . |coefficient|) (127 . |leadingCoefficient|) (132 . /)
              (138 . -) (143 . |append|) |IEP;eigenvector;UML;10|
              (149 . |zero|) (155 . |setelt!|) (163 . -) (169 . ^) (|List| 67)
              (175 . |nullSpace|) (|Vector| 6) (180 . |elt|) (|Vector| 24)
              (186 . |setelt!|) (193 . |unitCanonical|)
              |IEP;generalizedEigenvector;RML;14| (198 . |append|))
           '#(|generalizedEigenvectors| 204 |generalizedEigenvector| 215
              |eigenvectors| 229 |eigenvector| 240 |eigenvalues| 246
              |characteristicPolynomial| 257)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 73
                                                 '(1 6 7 8 9 1 0 11 12 15 1 0
                                                   17 12 19 1 0 21 12 23 2 24 0
                                                   0 0 25 2 24 26 0 0 27 0 6 0
                                                   28 0 24 0 29 3 24 31 0 0 0
                                                   32 2 34 26 0 0 36 0 24 0 37
                                                   2 38 0 34 34 39 3 12 6 0 40
                                                   40 41 1 24 0 6 42 4 38 24 0
                                                   40 40 24 43 3 38 24 0 40 40
                                                   44 0 6 0 45 2 24 0 6 34 46 2
                                                   24 0 0 0 47 1 38 24 0 48 1
                                                   52 51 0 53 1 24 34 0 54 2 24
                                                   6 0 34 55 1 24 6 0 56 2 6 0
                                                   0 0 57 1 6 0 0 58 2 11 0 0 0
                                                   59 2 12 0 34 34 61 4 12 6 0
                                                   40 40 6 62 2 6 0 0 0 63 2 12
                                                   0 0 34 64 1 12 65 0 66 2 67
                                                   6 0 40 68 3 69 24 0 40 24 70
                                                   1 24 0 0 71 2 17 0 0 0 73 1
                                                   1 21 12 23 2 0 21 12 13 22 2
                                                   0 33 16 12 72 4 0 33 10 12
                                                   34 34 35 1 1 17 12 19 2 0 17
                                                   12 13 18 2 0 33 10 12 60 1 1
                                                   11 12 15 2 0 11 12 13 14 1 0
                                                   24 12 49)))))
           '|lookupComplete|)) 
