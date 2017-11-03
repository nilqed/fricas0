
(SDEFUN |REP;evalvect|
        ((|vect| |Matrix| (|Fraction| (|Polynomial| (|Integer|))))
         (|alg| |Expression| (|Integer|)) (|x| |Symbol|)
         ($ |Matrix| (|Expression| (|Integer|))))
        (SPROG
         ((|v| (|Expression| (|Integer|))) (#1=#:G718 NIL) (|i| NIL)
          (|w| (|Matrix| (|Expression| (|Integer|))))
          (|xx| (|Kernel| (|Expression| (|Integer|))))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS |vect|) . #2=(|REP;evalvect|))
              (LETT |xx| (SPADCALL |x| (QREFELT $ 9)) . #2#)
              (LETT |w| (SPADCALL |n| 1 (QREFELT $ 14)) . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# |n| . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |v|
                          (SPADCALL
                           (SPADCALL (SPADCALL |vect| |i| 1 (QREFELT $ 18))
                                     (QREFELT $ 19))
                           |xx| |alg| (QREFELT $ 21))
                          . #2#)
                    (EXIT (SPADCALL |w| |i| 1 |v| (QREFELT $ 22))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |w|)))) 

(SDEFUN |REP;innerprod|
        ((|v1| |Matrix| (|Expression| (|Integer|)))
         (|v2| |Matrix| (|Expression| (|Integer|)))
         ($ |Expression| (|Integer|)))
        (SPADCALL (SPADCALL (SPADCALL |v1| (QREFELT $ 23)) |v2| (QREFELT $ 24))
                  1 1 (QREFELT $ 25))) 

(SDEFUN |REP;normalise;2M;3|
        ((|v| |Matrix| (|Expression| (|Integer|)))
         ($ |Matrix| (|Expression| (|Integer|))))
        (SPROG ((|normv| (|Expression| (|Integer|))))
               (SEQ
                (LETT |normv|
                      (SPADCALL (|REP;innerprod| |v| |v| $) (QREFELT $ 26))
                      |REP;normalise;2M;3|)
                (EXIT
                 (COND
                  ((SPADCALL |normv| (|spadConstant| $ 27) (QREFELT $ 29)) |v|)
                  ('T
                   (SPADCALL
                    (SPADCALL (|spadConstant| $ 11) |normv| (QREFELT $ 30)) |v|
                    (QREFELT $ 31)))))))) 

(SDEFUN |REP;radicalEigenvalues;ML;4|
        ((A |Matrix| (|Fraction| (|Polynomial| (|Integer|))))
         ($ |List| (|Expression| (|Integer|))))
        (SPROG
         ((|pol| (|Fraction| (|Polynomial| (|Integer|)))) (|x| (|Symbol|)))
         (SEQ
          (LETT |x| (SPADCALL (QREFELT $ 33))
                . #1=(|REP;radicalEigenvalues;ML;4|))
          (LETT |pol| (SPADCALL (SPADCALL A |x| (QREFELT $ 36)) (QREFELT $ 37))
                . #1#)
          (EXIT (SPADCALL |pol| |x| (QREFELT $ 39)))))) 

(SDEFUN |REP;radicalEigenvector;EML;5|
        ((|alpha| |Expression| (|Integer|))
         (A |Matrix| (|Fraction| (|Polynomial| (|Integer|))))
         ($ |List| (|Matrix| (|Expression| (|Integer|)))))
        (SPROG
         ((#1=#:G742 NIL) (|v| NIL) (#2=#:G741 NIL) (#3=#:G740 NIL) (|j| NIL)
          (#4=#:G739 NIL) (|i| NIL) (B (|Matrix| (|Expression| (|Integer|))))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS A) . #5=(|REP;radicalEigenvector;EML;5|))
              (LETT B (SPADCALL |n| |n| (QREFELT $ 14)) . #5#)
              (SEQ (LETT |i| 1 . #5#) (LETT #4# |n| . #5#) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1 . #5#) (LETT #3# |n| . #5#) G190
                         (COND ((|greater_SI| |j| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL B |i| |j|
                                     (SPADCALL
                                      (SPADCALL A |i| |j| (QREFELT $ 18))
                                      (QREFELT $ 19))
                                     (QREFELT $ 22))))
                         (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (SPADCALL B |i| |i|
                               (SPADCALL (SPADCALL B |i| |i| (QREFELT $ 25))
                                         |alpha| (QREFELT $ 41))
                               (QREFELT $ 22))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #2# NIL . #5#)
                (SEQ (LETT |v| NIL . #5#)
                     (LETT #1# (SPADCALL B (QREFELT $ 43)) . #5#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 45)) #2#)
                             . #5#)))
                     (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |REP;radicalEigenvectors;ML;6|
        ((A |Matrix| (|Fraction| (|Polynomial| (|Integer|))))
         ($ |List|
          #1=(|Record| (|:| |radval| (|Expression| (|Integer|)))
                       (|:| |radmult| (|Integer|))
                       (|:| |radvect|
                            (|List| (|Matrix| (|Expression| (|Integer|))))))))
        (SPROG
         ((|sln|
           (|List|
            (|Record| (|:| |radval| (|Expression| (|Integer|)))
                      (|:| |radmult| (|Integer|))
                      (|:| |radvect|
                           (|List| (|Matrix| (|Expression| (|Integer|))))))))
          (|nsl| #1#) (#2=#:G767 NIL) (|ep| NIL) (#3=#:G766 NIL)
          (#4=#:G765 NIL) (|alg| NIL)
          (|lval| (|List| (|Expression| (|Integer|)))) (|xx| (|Symbol|))
          (|sym| (|SuchThat| (|Symbol|) (|Polynomial| (|Integer|))))
          (#5=#:G747 NIL) (#6=#:G746 NIL)
          (|veclist| (|List| (|Matrix| (|Expression| (|Integer|)))))
          (#7=#:G764 NIL) (|i| NIL) (|m| (|Matrix| (|Expression| (|Integer|))))
          (#8=#:G763 NIL) (|ll| NIL) (#9=#:G762 NIL) (|eig| NIL)
          (|n| (|NonNegativeInteger|))
          (|leig|
           (|List|
            (|Record|
             (|:| |eigval|
                  (|Union| (|Fraction| (|Polynomial| (|Integer|)))
                           (|SuchThat| (|Symbol|) (|Polynomial| (|Integer|)))))
             (|:| |eigmult| (|NonNegativeInteger|))
             (|:| |eigvec|
                  (|List|
                   (|Matrix| (|Fraction| (|Polynomial| (|Integer|))))))))))
         (SEQ
          (LETT |leig| (SPADCALL A (QREFELT $ 51))
                . #10=(|REP;radicalEigenvectors;ML;6|))
          (LETT |n| (ANROWS A) . #10#) (LETT |sln| NIL . #10#)
          (SEQ (LETT |eig| NIL . #10#) (LETT #9# |leig| . #10#) G190
               (COND
                ((OR (ATOM #9#) (PROGN (LETT |eig| (CAR #9#) . #10#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((QEQCAR (QVELT |eig| 0) 0)
                   (SEQ (LETT |veclist| NIL . #10#)
                        (SEQ (LETT |ll| NIL . #10#)
                             (LETT #8# (QVELT |eig| 2) . #10#) G190
                             (COND
                              ((OR (ATOM #8#)
                                   (PROGN (LETT |ll| (CAR #8#) . #10#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |m| (SPADCALL |n| 1 (QREFELT $ 14)) . #10#)
                              (SEQ (LETT |i| 1 . #10#) (LETT #7# |n| . #10#)
                                   G190
                                   (COND ((|greater_SI| |i| #7#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |m| |i| 1
                                               (SPADCALL
                                                (SPADCALL |ll| |i| 1
                                                          (QREFELT $ 18))
                                                (QREFELT $ 19))
                                               (QREFELT $ 22))))
                                   (LETT |i| (|inc_SI| |i|) . #10#) (GO G190)
                                   G191 (EXIT NIL))
                              (EXIT
                               (LETT |veclist| (CONS |m| |veclist|) . #10#)))
                             (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |sln|
                               (CONS
                                (VECTOR
                                 (SPADCALL
                                  (PROG2 (LETT #6# (QVELT |eig| 0) . #10#)
                                      (QCDR #6#)
                                    (|check_union2| (QEQCAR #6# 0)
                                                    (|Fraction|
                                                     (|Polynomial|
                                                      (|Integer|)))
                                                    (|Union|
                                                     (|Fraction|
                                                      (|Polynomial|
                                                       (|Integer|)))
                                                     (|SuchThat| (|Symbol|)
                                                                 (|Polynomial|
                                                                  (|Integer|))))
                                                    #6#))
                                  (QREFELT $ 19))
                                 (QVELT |eig| 1) |veclist|)
                                |sln|)
                               . #10#))))
                  ('T
                   (SEQ
                    (LETT |sym|
                          (PROG2 (LETT #5# (QVELT |eig| 0) . #10#)
                              (QCDR #5#)
                            (|check_union2| (QEQCAR #5# 1)
                                            (|SuchThat| (|Symbol|)
                                                        (|Polynomial|
                                                         (|Integer|)))
                                            (|Union|
                                             (|Fraction|
                                              (|Polynomial| (|Integer|)))
                                             (|SuchThat| (|Symbol|)
                                                         (|Polynomial|
                                                          (|Integer|))))
                                            #5#))
                          . #10#)
                    (LETT |xx| (SPADCALL |sym| (QREFELT $ 53)) . #10#)
                    (LETT |lval|
                          (SPADCALL
                           (SPADCALL (SPADCALL |sym| (QREFELT $ 54))
                                     (QREFELT $ 37))
                           |xx| (QREFELT $ 39))
                          . #10#)
                    (EXIT
                     (SEQ (LETT |alg| NIL . #10#) (LETT #4# |lval| . #10#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |alg| (CAR #4#) . #10#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |nsl|
                                 (VECTOR |alg| (QVELT |eig| 1)
                                         (PROGN
                                          (LETT #3# NIL . #10#)
                                          (SEQ (LETT |ep| NIL . #10#)
                                               (LETT #2# (QVELT |eig| 2)
                                                     . #10#)
                                               G190
                                               (COND
                                                ((OR (ATOM #2#)
                                                     (PROGN
                                                      (LETT |ep| (CAR #2#)
                                                            . #10#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #3#
                                                       (CONS
                                                        (|REP;evalvect| |ep|
                                                         |alg| |xx| $)
                                                        #3#)
                                                       . #10#)))
                                               (LETT #2# (CDR #2#) . #10#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #3#)))))
                                 . #10#)
                           (EXIT (LETT |sln| (CONS |nsl| |sln|) . #10#)))
                          (LETT #4# (CDR #4#) . #10#) (GO G190) G191
                          (EXIT NIL))))))))
               (LETT #9# (CDR #9#) . #10#) (GO G190) G191 (EXIT NIL))
          (EXIT |sln|)))) 

(SDEFUN |REP;gramschmidt;2L;7|
        ((|lvect| |List| (|Matrix| (|Expression| (|Integer|))))
         ($ |List| (|Matrix| (|Expression| (|Integer|)))))
        (SPROG
         ((|orth| (|List| (|Matrix| (|Expression| (|Integer|)))))
          (|pol| (|Matrix| (|Expression| (|Integer|)))) (#1=#:G776 NIL)
          (#2=#:G775 (RMR)) (#3=#:G777 (RMR)) (#4=#:G783 NIL) (|w| NIL)
          (#5=#:G782 NIL) (|v| (|Matrix| (|Expression| (|Integer|))))
          (RMR
           (|Join|
            (|RectangularMatrixCategory|
             #6=(PROG1
                    (LET #7=#:G770
                      |n|)
                  (|check_subtype2| (> #7# 0) '(|PositiveInteger|)
                                    '#8=(|NonNegativeInteger|) #7#))
             #9=(|call| (XLAM |ignore| 1)) #10=(|Expression| (|Integer|))
             (|DirectProduct| #9# #10#) (|DirectProduct| #6# #10#))
            (|CoercibleTo| (|Matrix| #10#))
            (CATEGORY |domain|
             (IF (|has| #10# (|Field|))
                 (ATTRIBUTE (|VectorSpace| #10#))
                 |noBranch|)
             (IF (|has| #10# (|ConvertibleTo| (|InputForm|)))
                 (ATTRIBUTE (|ConvertibleTo| (|InputForm|)))
                 |noBranch|)
             (SIGNATURE |rectangularMatrix| ($ (|Matrix| #10#)))
             (SIGNATURE |coerce| ((|Matrix| #10#) $)))))
          (#11=#:G771 NIL) (|n| #8#))
         (SEQ
          (COND ((SPADCALL |lvect| NIL (QREFELT $ 58)) NIL)
                ('T
                 (SEQ
                  (LETT |v| (|SPADfirst| |lvect|)
                        . #12=(|REP;gramschmidt;2L;7|))
                  (LETT |n| (ANROWS |v|) . #12#)
                  (LETT RMR
                        (|RectangularMatrix|
                         (PROG1 (LETT #11# |n| . #12#)
                           (|check_subtype2| (> #11# 0) '(|PositiveInteger|)
                                             '(|NonNegativeInteger|) #11#))
                         1 (|Expression| (|Integer|)))
                        . #12#)
                  (LETT |orth| (LIST (SPADCALL |v| (QREFELT $ 32))) . #12#)
                  (SEQ (LETT |v| NIL . #12#) (LETT #5# (CDR |lvect|) . #12#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |v| (CAR #5#) . #12#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |pol|
                              (SPADCALL
                               (SPADCALL |v|
                                         (PROGN
                                          (LETT #1# NIL . #12#)
                                          (SEQ (LETT |w| NIL . #12#)
                                               (LETT #4# |orth| . #12#) G190
                                               (COND
                                                ((OR (ATOM #4#)
                                                     (PROGN
                                                      (LETT |w| (CAR #4#)
                                                            . #12#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (PROGN
                                                  (LETT #3#
                                                        (SPADCALL
                                                         (|REP;innerprod| |w|
                                                          |v| $)
                                                         |w| (QREFELT $ 31))
                                                        . #12#)
                                                  (COND
                                                   (#1#
                                                    (LETT #2#
                                                          (SPADCALL #2# #3#
                                                                    (|compiledLookupCheck|
                                                                     '+
                                                                     (LIST '$
                                                                           '$
                                                                           '$)
                                                                     RMR))
                                                          . #12#))
                                                   ('T
                                                    (PROGN
                                                     (LETT #2# #3# . #12#)
                                                     (LETT #1# 'T . #12#)))))))
                                               (LETT #4# (CDR #4#) . #12#)
                                               (GO G190) G191 (EXIT NIL))
                                          (COND (#1# #2#)
                                                ('T
                                                 (SPADCALL
                                                  (|compiledLookupCheck|
                                                   '|Zero| (LIST '$) RMR)))))
                                         (|compiledLookupCheck| '-
                                                                (LIST '$ '$ '$)
                                                                RMR))
                               (|compiledLookupCheck| '|coerce|
                                                      (LIST
                                                       (LIST '|Matrix|
                                                             (LIST
                                                              '|Expression|
                                                              (LIST
                                                               '|Integer|)))
                                                       '$)
                                                      RMR))
                              . #12#)
                        (EXIT
                         (LETT |orth|
                               (CONS (SPADCALL |pol| (QREFELT $ 32)) |orth|)
                               . #12#)))
                       (LETT #5# (CDR #5#) . #12#) (GO G190) G191 (EXIT NIL))
                  (EXIT |orth|))))))) 

(SDEFUN |REP;eigenMatrix;MU;8|
        ((A |Matrix| (|Fraction| (|Polynomial| (|Integer|))))
         ($ |Union| (|Matrix| (|Expression| (|Integer|))) "failed"))
        (SPROG
         ((|d| (|Matrix| (|Expression| (|Integer|)))) (#1=#:G799 NIL) (|v| NIL)
          (|n| (|NonNegativeInteger|))
          (|lef| #2=(|List| (|Matrix| (|Expression| (|Integer|)))))
          (#3=#:G789 NIL) (#4=#:G788 #2#) (#5=#:G790 #2#) (#6=#:G798 NIL)
          (|eiv| NIL))
         (SEQ
          (LETT |lef|
                (PROGN
                 (LETT #3# NIL . #7=(|REP;eigenMatrix;MU;8|))
                 (SEQ (LETT |eiv| NIL . #7#)
                      (LETT #6# (SPADCALL A (QREFELT $ 57)) . #7#) G190
                      (COND
                       ((OR (ATOM #6#)
                            (PROGN (LETT |eiv| (CAR #6#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #5# (QVELT |eiv| 2) . #7#)
                         (COND
                          (#3#
                           (LETT #4# (SPADCALL #4# #5# (QREFELT $ 60)) . #7#))
                          ('T
                           (PROGN
                            (LETT #4# #5# . #7#)
                            (LETT #3# 'T . #7#)))))))
                      (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
                 (COND (#3# #4#) (#8='T NIL)))
                . #7#)
          (LETT |n| (ANROWS A) . #7#)
          (EXIT
           (COND ((< (LENGTH |lef|) |n|) (CONS 1 "failed"))
                 (#8#
                  (SEQ
                   (LETT |d| (SPADCALL (|SPADfirst| |lef|) (QREFELT $ 61))
                         . #7#)
                   (SEQ (LETT |v| NIL . #7#) (LETT #1# (CDR |lef|) . #7#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |v| (CAR #1#) . #7#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |d| (SPADCALL |d| |v| (QREFELT $ 62)) . #7#)))
                        (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
                   (EXIT (CONS 0 |d|))))))))) 

(SDEFUN |REP;orthonormalBasis;ML;9|
        ((A |Matrix| (|Fraction| (|Polynomial| (|Integer|))))
         ($ |List| (|Matrix| (|Expression| (|Integer|)))))
        (SPROG
         ((|basis| (|List| (|Matrix| (|Expression| (|Integer|)))))
          (|lvec| (|List| (|Matrix| (|Expression| (|Integer|)))))
          (#1=#:G808 NIL) (|alterm| NIL) (|n| (|NonNegativeInteger|))
          (|alglist|
           (|List|
            (|Record| (|:| |radval| (|Expression| (|Integer|)))
                      (|:| |radmult| (|Integer|))
                      (|:| |radvect|
                           (|List| (|Matrix| (|Expression| (|Integer|)))))))))
         (SEQ
          (COND
           ((NULL (SPADCALL A (QREFELT $ 65)))
            (|error| "the matrix is not symmetric"))
           ('T
            (SEQ (LETT |basis| NIL . #2=(|REP;orthonormalBasis;ML;9|))
                 (LETT |lvec| NIL . #2#)
                 (LETT |alglist| (SPADCALL A (QREFELT $ 57)) . #2#)
                 (LETT |n| (ANROWS A) . #2#)
                 (SEQ (LETT |alterm| NIL . #2#) (LETT #1# |alglist| . #2#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |alterm| (CAR #1#) . #2#) NIL))
                        (GO G191)))
                      (SEQ
                       (SEQ (LETT |lvec| (QVELT |alterm| 2) . #2#)
                            (EXIT
                             (COND
                              ((SPADCALL |lvec| NIL (QREFELT $ 58))
                               (|error| "sorry ")))))
                       (EXIT
                        (COND
                         ((SPADCALL (LENGTH |lvec|) 1 (QREFELT $ 66))
                          (SEQ
                           (LETT |lvec| (SPADCALL |lvec| (QREFELT $ 59)) . #2#)
                           (EXIT
                            (LETT |basis|
                                  (SPADCALL |lvec| |basis| (QREFELT $ 60))
                                  . #2#))))
                         ('T
                          (LETT |basis|
                                (CONS
                                 (SPADCALL (|SPADfirst| |lvec|) (QREFELT $ 32))
                                 |basis|)
                                . #2#)))))
                      (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                 (EXIT |basis|))))))) 

(DECLAIM (NOTINLINE |RadicalEigenPackage;|)) 

(DEFUN |RadicalEigenPackage| ()
  (SPROG NIL
         (PROG (#1=#:G810)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|RadicalEigenPackage|)
                    . #2=(|RadicalEigenPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|RadicalEigenPackage|
                             (LIST
                              (CONS NIL (CONS 1 (|RadicalEigenPackage;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|RadicalEigenPackage|)))))))))) 

(DEFUN |RadicalEigenPackage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|RadicalEigenPackage|) . #1=(|RadicalEigenPackage|))
          (LETT $ (GETREFV 68) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RadicalEigenPackage| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|RadicalSolvePackage| (|Integer|)))
          $))) 

(MAKEPROP '|RadicalEigenPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL 'RSP (|Symbol|) (|Kernel| 10)
              (0 . |kernel|) (|Expression| 16) (5 . |One|)
              (|NonNegativeInteger|) (|Matrix| 10) (9 . |zero|) (|Fraction| 34)
              (|Integer|) (|Matrix| 15) (15 . |elt|) (22 . |coerce|)
              (|Kernel| $) (27 . |eval|) (34 . |setelt!|) (42 . |transpose|)
              (47 . *) (53 . |elt|) (60 . |sqrt|) (65 . |Zero|) (|Boolean|)
              (69 . =) (75 . /) (81 . *) |REP;normalise;2M;3| (87 . |new|)
              (|Polynomial| 16) (|EigenPackage| 16)
              (91 . |characteristicPolynomial|) (97 . |coerce|) (|List| 10)
              (102 . |radicalRoots|) |REP;radicalEigenvalues;ML;4| (108 . -)
              (|List| 44) (114 . |nullSpace|) (|Vector| 10) (119 . |coerce|)
              (|List| 13) |REP;radicalEigenvector;EML;5| (|Union| 15 52)
              (|Record| (|:| |eigval| 48) (|:| |eigmult| 12)
                        (|:| |eigvec| (|List| 17)))
              (|List| 49) (124 . |eigenvectors|) (|SuchThat| 7 34)
              (129 . |lhs|) (134 . |rhs|)
              (|Record| (|:| |radval| 10) (|:| |radmult| 16)
                        (|:| |radvect| 46))
              (|List| 55) |REP;radicalEigenvectors;ML;6| (139 . =)
              |REP;gramschmidt;2L;7| (145 . |append|) (151 . |copy|)
              (156 . |horizConcat|) (|Union| 13 '"failed")
              |REP;eigenMatrix;MU;8| (162 . |symmetric?|) (167 . >)
              |REP;orthonormalBasis;ML;9|)
           '#(|radicalEigenvectors| 173 |radicalEigenvector| 178
              |radicalEigenvalues| 184 |orthonormalBasis| 189 |normalise| 194
              |gramschmidt| 199 |eigenMatrix| 204)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 67
                                                 '(1 8 0 7 9 0 10 0 11 2 13 0
                                                   12 12 14 3 17 15 0 16 16 18
                                                   1 10 0 15 19 3 10 0 0 20 0
                                                   21 4 13 10 0 16 16 10 22 1
                                                   13 0 0 23 2 13 0 0 0 24 3 13
                                                   10 0 16 16 25 1 10 0 0 26 0
                                                   10 0 27 2 10 28 0 0 29 2 10
                                                   0 0 0 30 2 13 0 10 0 31 0 7
                                                   0 33 2 35 34 17 7 36 1 15 0
                                                   34 37 2 6 38 15 7 39 2 10 0
                                                   0 0 41 1 13 42 0 43 1 13 0
                                                   44 45 1 35 50 17 51 1 52 7 0
                                                   53 1 52 34 0 54 2 46 28 0 0
                                                   58 2 46 0 0 0 60 1 13 0 0 61
                                                   2 13 0 0 0 62 1 17 28 0 65 2
                                                   12 28 0 0 66 1 0 56 17 57 2
                                                   0 46 10 17 47 1 0 38 17 40 1
                                                   0 46 17 67 1 0 13 13 32 1 0
                                                   46 46 59 1 0 63 17 64)))))
           '|lookupComplete|)) 

(MAKEPROP '|RadicalEigenPackage| 'NILADIC T) 
