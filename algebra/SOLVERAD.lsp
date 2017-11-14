
(SDEFUN |SOLVERAD;New| ((|s| |Expression| R) ($ |Expression| R))
        (SPROG ((S (|Expression| R)))
               (SEQ
                (COND
                 ((SPADCALL |s| (|spadConstant| $ 13) (QREFELT $ 15))
                  (|spadConstant| $ 13))
                 ('T
                  (SEQ
                   (LETT S
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL (QREFELT $ 17)) (QREFELT $ 19))
                           (QREFELT $ 21))
                          (QREFELT $ 22))
                         |SOLVERAD;New|)
                   (SETELT $ 7
                           (SPADCALL (LIST (SPADCALL S |s| (QREFELT $ 23)))
                                     (QREFELT $ 7) (QREFELT $ 25)))
                   (EXIT S))))))) 

(SDEFUN |SOLVERAD;linear|
        ((|u| |SparseUnivariatePolynomial| (|Polynomial| R))
         ($ |List| (|Expression| R)))
        (LIST
         (SPADCALL
          (SPADCALL (SPADCALL (SPADCALL |u| 0 (QREFELT $ 28)) (QREFELT $ 29))
                    (QREFELT $ 30))
          (SPADCALL (SPADCALL |u| 1 (QREFELT $ 28)) (QREFELT $ 30))
          (QREFELT $ 33)))) 

(SDEFUN |SOLVERAD;quadratic|
        ((|u| |SparseUnivariatePolynomial| (|Polynomial| R))
         ($ |List| (|Expression| R)))
        (SPADCALL (SPADCALL (ELT $ 30) |u| (QREFELT $ 37)) (QREFELT $ 40))) 

(SDEFUN |SOLVERAD;cubic|
        ((|u| |SparseUnivariatePolynomial| (|Polynomial| R))
         ($ |List| (|Expression| R)))
        (SPADCALL (SPADCALL (ELT $ 30) |u| (QREFELT $ 37)) (QREFELT $ 41))) 

(SDEFUN |SOLVERAD;quartic|
        ((|u| |SparseUnivariatePolynomial| (|Polynomial| R))
         ($ |List| (|Expression| R)))
        (SPADCALL (SPADCALL (ELT $ 30) |u| (QREFELT $ 37)) (QREFELT $ 42))) 

(SDEFUN |SOLVERAD;rad| ((|n| |PositiveInteger|) ($ |Expression| R))
        (SPADCALL |n| (QREFELT $ 44))) 

(SDEFUN |SOLVERAD;wrap| ((|s| |Expression| R) ($ |Expression| R))
        (COND ((QREFELT $ 8) (|SOLVERAD;New| |s| $)) ('T |s|))) 

(SDEFUN |SOLVERAD;findGenZeros|
        ((|rlp| |List| (|Polynomial| R)) (|rlv| |List| (|Symbol|))
         ($ |List| (|List| (|Expression| R))))
        (SPROG
         ((|res| (|List| (|List| (|Expression| R)))) (#1=#:G746 NIL) (|vv| NIL)
          (#2=#:G747 NIL) (|p| NIL) (#3=#:G745 NIL) (#4=#:G744 NIL) (|r| NIL)
          (#5=#:G743 NIL) (|v| (|Symbol|)) (|pp| (|Polynomial| R)))
         (SEQ (LETT |pp| (|SPADfirst| |rlp|) . #6=(|SOLVERAD;findGenZeros|))
              (LETT |v| (|SPADfirst| |rlv|) . #6#)
              (LETT |rlv| (CDR |rlv|) . #6#) (LETT |res| NIL . #6#)
              (LETT |res|
                    (SPADCALL
                     (PROGN
                      (LETT #5# NIL . #6#)
                      (SEQ (LETT |r| NIL . #6#)
                           (LETT #4#
                                 (SPADCALL (SPADCALL |pp| (QREFELT $ 21)) |v|
                                           (QREFELT $ 45))
                                 . #6#)
                           G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |r| (CAR #4#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #5#
                                   (CONS
                                    (REVERSE
                                     (CONS |r|
                                           (PROGN
                                            (LETT #3# NIL . #6#)
                                            (SEQ (LETT |p| NIL . #6#)
                                                 (LETT #2# (CDR |rlp|) . #6#)
                                                 (LETT |vv| NIL . #6#)
                                                 (LETT #1# |rlv| . #6#) G190
                                                 (COND
                                                  ((OR (ATOM #1#)
                                                       (PROGN
                                                        (LETT |vv| (CAR #1#)
                                                              . #6#)
                                                        NIL)
                                                       (ATOM #2#)
                                                       (PROGN
                                                        (LETT |p| (CAR #2#)
                                                              . #6#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #3#
                                                         (CONS
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL |p|
                                                                         |vv|
                                                                         (QREFELT
                                                                          $
                                                                          47))
                                                               0
                                                               (QREFELT $ 28))
                                                              (QREFELT $ 30))
                                                             (QREFELT $ 48))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |p|
                                                                        |vv|
                                                                        (QREFELT
                                                                         $ 47))
                                                              (QREFELT $ 49))
                                                             (QREFELT $ 30))
                                                            (QREFELT $ 33))
                                                           (SPADCALL |v|
                                                                     (QREFELT $
                                                                              51))
                                                           |r| (QREFELT $ 53))
                                                          #3#)
                                                         . #6#)))
                                                 (LETT #1#
                                                       (PROG1 (CDR #1#)
                                                         (LETT #2# (CDR #2#)
                                                               . #6#))
                                                       . #6#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #3#))))))
                                    #5#)
                                   . #6#)))
                           (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                           (EXIT (NREVERSE #5#))))
                     |res| (QREFELT $ 55))
                    . #6#)
              (EXIT |res|)))) 

(SDEFUN |SOLVERAD;findZeros|
        ((|rlp| |List| (|Polynomial| R)) (|rlv| |List| (|Symbol|))
         ($ |List| (|List| (|Expression| R))))
        (SPROG
         ((|res| (|List| (|List| (|Expression| R))))
          (|rlv1| (|List| (|Symbol|)))
          (|lv1| (|List| (|Kernel| (|Expression| R))))
          (|p1| (|List| (|Expression| R))) (|res1| (|List| (|Expression| R)))
          (#1=#:G758 NIL) (|par| NIL)
          (|parRes| (|List| (|List| (|Expression| R)))) (#2=#:G756 NIL)
          (|p| NIL) (#3=#:G757 NIL) (|v| NIL) (#4=#:G755 NIL))
         (SEQ
          (LETT |parRes|
                (PROGN
                 (LETT #4# NIL . #5=(|SOLVERAD;findZeros|))
                 (SEQ (LETT |v| NIL . #5#) (LETT #3# |rlv| . #5#)
                      (LETT |p| NIL . #5#) (LETT #2# |rlp| . #5#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #5#) NIL)
                            (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL (SPADCALL |p| (QREFELT $ 21)) |v|
                                         (QREFELT $ 45))
                               #4#)
                              . #5#)))
                      (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #5#))
                            . #5#)
                      (GO G190) G191 (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |parRes| (|SOLVERAD;select| |parRes| $) . #5#)
          (LETT |res| NIL . #5#)
          (SEQ (LETT |par| NIL . #5#) (LETT #1# |parRes| . #5#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |par| (CAR #1#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |res1| (LIST (|SPADfirst| |par|)) . #5#)
                    (LETT |lv1|
                          (LIST (SPADCALL (|SPADfirst| |rlv|) (QREFELT $ 51)))
                          . #5#)
                    (LETT |rlv1| (CDR |rlv|) . #5#)
                    (LETT |p1| (CDR |par|) . #5#)
                    (SEQ G190
                         (COND
                          ((NULL (SPADCALL |p1| NIL (QREFELT $ 56)))
                           (GO G191)))
                         (SEQ
                          (LETT |res1|
                                (CONS
                                 (SPADCALL (|SPADfirst| |p1|) |lv1| |res1|
                                           (QREFELT $ 59))
                                 |res1|)
                                . #5#)
                          (LETT |p1| (CDR |p1|) . #5#)
                          (LETT |lv1|
                                (CONS
                                 (SPADCALL (|SPADfirst| |rlv1|) (QREFELT $ 51))
                                 |lv1|)
                                . #5#)
                          (EXIT (LETT |rlv1| (CDR |rlv1|) . #5#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |res| (CONS |res1| |res|) . #5#)))
               (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |SOLVERAD;radicalSolve;FSL;10|
        ((|pol| |Fraction| (|Polynomial| R)) (|v| |Symbol|)
         ($ |List| (|Equation| (|Expression| R))))
        (SPROG ((#1=#:G762 NIL) (|r| NIL) (#2=#:G761 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SOLVERAD;radicalSolve;FSL;10|))
                 (SEQ (LETT |r| NIL . #3#)
                      (LETT #1# (SPADCALL |pol| |v| (QREFELT $ 45)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |v| (QREFELT $ 60)) |r|
                                         (QREFELT $ 61))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SOLVERAD;radicalSolve;FL;11|
        ((|p| |Fraction| (|Polynomial| R))
         ($ |List| (|Equation| (|Expression| R))))
        (SPROG ((|lv| (|List| (|Symbol|))))
               (SEQ
                (COND
                 ((SPADCALL |p| (QREFELT $ 63))
                  (|error| "equation is always satisfied"))
                 (#1='T
                  (SEQ
                   (LETT |lv|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |p| (QREFELT $ 64))
                                     (QREFELT $ 66))
                           (SPADCALL (SPADCALL |p| (QREFELT $ 67))
                                     (QREFELT $ 66))
                           (QREFELT $ 68))
                          (QREFELT $ 69))
                         |SOLVERAD;radicalSolve;FL;11|)
                   (EXIT
                    (COND ((NULL |lv|) (|error| "inconsistent equation"))
                          ((SPADCALL (LENGTH |lv|) 1 (QREFELT $ 70))
                           (|error| "too many variables"))
                          (#1#
                           (SPADCALL |p| (|SPADfirst| |lv|)
                                     (QREFELT $ 62))))))))))) 

(SDEFUN |SOLVERAD;radicalSolve;EL;12|
        ((|eq| |Equation| (|Fraction| (|Polynomial| R)))
         ($ |List| (|Equation| (|Expression| R))))
        (SPADCALL
         (SPADCALL (SPADCALL |eq| (QREFELT $ 73))
                   (SPADCALL |eq| (QREFELT $ 74)) (QREFELT $ 75))
         (QREFELT $ 71))) 

(SDEFUN |SOLVERAD;radicalSolve;ESL;13|
        ((|eq| |Equation| (|Fraction| (|Polynomial| R))) (|v| |Symbol|)
         ($ |List| (|Equation| (|Expression| R))))
        (SPADCALL
         (SPADCALL (SPADCALL |eq| (QREFELT $ 73))
                   (SPADCALL |eq| (QREFELT $ 74)) (QREFELT $ 75))
         |v| (QREFELT $ 62))) 

(SDEFUN |SOLVERAD;radicalRoots;LLL;14|
        ((|lp| |List| (|Fraction| (|Polynomial| R))) (|lv| |List| (|Symbol|))
         ($ |List| (|List| (|Expression| R))))
        (SPROG
         ((#1=#:G786 NIL) (#2=#:G785 #3=(|List| (|List| (|Expression| R))))
          (#4=#:G787 #3#) (#5=#:G796 NIL) (|res| NIL)
          (|rpRes| (|List| #6=(|List| (|Polynomial| R)))) (#7=#:G795 NIL)
          (|result| (|List| (|List| (|Expression| R)))) (#8=#:G780 NIL)
          (#9=#:G779 #10=(|List| (|List| (|Expression| R)))) (#11=#:G781 #10#)
          (#12=#:G794 NIL) (|listGen| (|List| #6#)) (#13=#:G793 NIL)
          (#14=#:G792 NIL) (#15=#:G791 NIL) (#16=#:G790 NIL)
          (|rlv| (|List| (|Symbol|)))
          (|parRes| (|List| (|List| (|Polynomial| R)))))
         (SEQ
          (LETT |parRes| (SPADCALL |lp| |lv| (QREFELT $ 81))
                . #17=(|SOLVERAD;radicalRoots;LLL;14|))
          (LETT |rlv| (REVERSE |lv|) . #17#)
          (LETT |rpRes|
                (PROGN
                 (LETT #16# NIL . #17#)
                 (SEQ (LETT |res| NIL . #17#) (LETT #15# |parRes| . #17#) G190
                      (COND
                       ((OR (ATOM #15#)
                            (PROGN (LETT |res| (CAR #15#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #16# (CONS (REVERSE |res|) #16#) . #17#)))
                      (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #16#))))
                . #17#)
          (LETT |listGen|
                (PROGN
                 (LETT #14# NIL . #17#)
                 (SEQ (LETT |res| NIL . #17#) (LETT #13# |rpRes| . #17#) G190
                      (COND
                       ((OR (ATOM #13#)
                            (PROGN (LETT |res| (CAR #13#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((|SOLVERAD;isGeneric?| |res| |rlv| $)
                          (LETT #14# (CONS |res| #14#) . #17#)))))
                      (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #14#))))
                . #17#)
          (LETT |result| NIL . #17#)
          (COND
           ((SPADCALL |listGen| NIL (QREFELT $ 82))
            (SEQ
             (LETT |result|
                   (PROGN
                    (LETT #8# NIL . #17#)
                    (SEQ (LETT |res| NIL . #17#) (LETT #12# |listGen| . #17#)
                         G190
                         (COND
                          ((OR (ATOM #12#)
                               (PROGN (LETT |res| (CAR #12#) . #17#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #11# (|SOLVERAD;findGenZeros| |res| |rlv| $)
                                  . #17#)
                            (COND
                             (#8#
                              (LETT #9# (SPADCALL #9# #11# (QREFELT $ 55))
                                    . #17#))
                             ('T
                              (PROGN
                               (LETT #9# #11# . #17#)
                               (LETT #8# 'T . #17#)))))))
                         (LETT #12# (CDR #12#) . #17#) (GO G190) G191
                         (EXIT NIL))
                    (COND (#8# #9#) (#18='T NIL)))
                   . #17#)
             (EXIT
              (SEQ (LETT |res| NIL . #17#) (LETT #7# |listGen| . #17#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |res| (CAR #7#) . #17#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |rpRes|
                           (SPADCALL |rpRes|
                                     (SPADCALL |res| |rpRes| (QREFELT $ 84))
                                     (QREFELT $ 85))
                           . #17#)))
                   (LETT #7# (CDR #7#) . #17#) (GO G190) G191 (EXIT NIL))))))
          (EXIT
           (COND ((SPADCALL |rpRes| NIL (QREFELT $ 86)) |result|)
                 (#18#
                  (SPADCALL
                   (PROGN
                    (LETT #1# NIL . #17#)
                    (SEQ (LETT |res| NIL . #17#) (LETT #5# |rpRes| . #17#) G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |res| (CAR #5#) . #17#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #4# (|SOLVERAD;findZeros| |res| |rlv| $)
                                  . #17#)
                            (COND
                             (#1#
                              (LETT #2# (SPADCALL #2# #4# (QREFELT $ 55))
                                    . #17#))
                             ('T
                              (PROGN
                               (LETT #2# #4# . #17#)
                               (LETT #1# 'T . #17#)))))))
                         (LETT #5# (CDR #5#) . #17#) (GO G190) G191 (EXIT NIL))
                    (COND (#1# #2#) (#18# NIL)))
                   |result| (QREFELT $ 55)))))))) 

(SDEFUN |SOLVERAD;radicalSolve;LLL;15|
        ((|lp| |List| (|Fraction| (|Polynomial| R))) (|lv| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG ((#1=#:G800 NIL) (|lres| NIL) (#2=#:G799 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SOLVERAD;radicalSolve;LLL;15|))
                 (SEQ (LETT |lres| NIL . #3#)
                      (LETT #1# (SPADCALL |lp| |lv| (QREFELT $ 87)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |lres| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|SOLVERAD;makeEq| |lres| |lv| $) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SOLVERAD;radicalSolve;LL;16|
        ((|lp| |List| (|Fraction| (|Polynomial| R)))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((#1=#:G809 NIL) (|lres| NIL) (#2=#:G808 NIL)
          (|lv| #3=(|List| (|Symbol|))) (#4=#:G802 NIL) (#5=#:G801 #3#)
          (#6=#:G803 #3#) (#7=#:G807 NIL) (|p| NIL))
         (SEQ
          (LETT |lv|
                (PROGN
                 (LETT #4# NIL . #8=(|SOLVERAD;radicalSolve;LL;16|))
                 (SEQ (LETT |p| NIL . #8#) (LETT #7# |lp| . #8#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |p| (CAR #7#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #6#
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| (QREFELT $ 64))
                                          (QREFELT $ 66))
                                (SPADCALL (SPADCALL |p| (QREFELT $ 67))
                                          (QREFELT $ 66))
                                (QREFELT $ 90))
                               . #8#)
                         (COND
                          (#4#
                           (LETT #5# (SPADCALL #5# #6# (QREFELT $ 90)) . #8#))
                          ('T
                           (PROGN
                            (LETT #5# #6# . #8#)
                            (LETT #4# 'T . #8#)))))))
                      (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
                 (COND (#4# #5#) ('T (|IdentityError| '|setUnion|))))
                . #8#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #8#)
            (SEQ (LETT |lres| NIL . #8#)
                 (LETT #1# (SPADCALL |lp| |lv| (QREFELT $ 87)) . #8#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |lres| (CAR #1#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (|SOLVERAD;makeEq| |lres| |lv| $) #2#)
                         . #8#)))
                 (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SOLVERAD;radicalSolve;LLL;17|
        ((|le| |List| (|Equation| (|Fraction| (|Polynomial| R))))
         (|lv| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((#1=#:G817 NIL) (|lres| NIL) (#2=#:G816 NIL)
          (|lp| (|List| (|Fraction| (|Polynomial| R)))) (#3=#:G815 NIL)
          (|p| NIL) (#4=#:G814 NIL))
         (SEQ
          (LETT |lp|
                (PROGN
                 (LETT #4# NIL . #5=(|SOLVERAD;radicalSolve;LLL;17|))
                 (SEQ (LETT |p| NIL . #5#) (LETT #3# |le| . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL (SPADCALL |p| (QREFELT $ 74))
                                         (SPADCALL |p| (QREFELT $ 73))
                                         (QREFELT $ 75))
                               #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #5#)
            (SEQ (LETT |lres| NIL . #5#)
                 (LETT #1# (SPADCALL |lp| |lv| (QREFELT $ 87)) . #5#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |lres| (CAR #1#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (|SOLVERAD;makeEq| |lres| |lv| $) #2#)
                         . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SOLVERAD;radicalSolve;LL;18|
        ((|le| |List| (|Equation| (|Fraction| (|Polynomial| R))))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((#1=#:G829 NIL) (|lres| NIL) (#2=#:G828 NIL)
          (|lv| #3=(|List| (|Symbol|))) (#4=#:G820 NIL) (#5=#:G819 #3#)
          (#6=#:G821 #3#) (#7=#:G827 NIL) (|p| NIL)
          (|lp| (|List| (|Fraction| (|Polynomial| R)))) (#8=#:G826 NIL)
          (#9=#:G825 NIL))
         (SEQ
          (LETT |lp|
                (PROGN
                 (LETT #9# NIL . #10=(|SOLVERAD;radicalSolve;LL;18|))
                 (SEQ (LETT |p| NIL . #10#) (LETT #8# |le| . #10#) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |p| (CAR #8#) . #10#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #9#
                              (CONS
                               (SPADCALL (SPADCALL |p| (QREFELT $ 74))
                                         (SPADCALL |p| (QREFELT $ 73))
                                         (QREFELT $ 75))
                               #9#)
                              . #10#)))
                      (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                      (EXIT (NREVERSE #9#))))
                . #10#)
          (LETT |lv|
                (PROGN
                 (LETT #4# NIL . #10#)
                 (SEQ (LETT |p| NIL . #10#) (LETT #7# |lp| . #10#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |p| (CAR #7#) . #10#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #6#
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| (QREFELT $ 64))
                                          (QREFELT $ 66))
                                (SPADCALL (SPADCALL |p| (QREFELT $ 67))
                                          (QREFELT $ 66))
                                (QREFELT $ 90))
                               . #10#)
                         (COND
                          (#4#
                           (LETT #5# (SPADCALL #5# #6# (QREFELT $ 90)) . #10#))
                          ('T
                           (PROGN
                            (LETT #5# #6# . #10#)
                            (LETT #4# 'T . #10#)))))))
                      (LETT #7# (CDR #7#) . #10#) (GO G190) G191 (EXIT NIL))
                 (COND (#4# #5#) ('T (|IdentityError| '|setUnion|))))
                . #10#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #10#)
            (SEQ (LETT |lres| NIL . #10#)
                 (LETT #1# (SPADCALL |lp| |lv| (QREFELT $ 87)) . #10#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |lres| (CAR #1#) . #10#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (|SOLVERAD;makeEq| |lres| |lv| $) #2#)
                         . #10#)))
                 (LETT #1# (CDR #1#) . #10#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SOLVERAD;contractSolve;ESSt;19|
        ((|eq| |Equation| (|Fraction| (|Polynomial| R))) (|v| |Symbol|)
         ($ |SuchThat| (|List| (|Expression| R))
          (|List| (|Equation| (|Expression| R)))))
        (|SOLVERAD;solveInner|
         (SPADCALL
          (SPADCALL (SPADCALL |eq| (QREFELT $ 73))
                    (SPADCALL |eq| (QREFELT $ 74)) (QREFELT $ 75))
          (QREFELT $ 64))
         |v| 'T $)) 

(SDEFUN |SOLVERAD;contractSolve;FSSt;20|
        ((|pq| |Fraction| (|Polynomial| R)) (|v| |Symbol|)
         ($ |SuchThat| (|List| (|Expression| R))
          (|List| (|Equation| (|Expression| R)))))
        (|SOLVERAD;solveInner| (SPADCALL |pq| (QREFELT $ 64)) |v| 'T $)) 

(SDEFUN |SOLVERAD;radicalRoots;FSL;21|
        ((|pq| |Fraction| (|Polynomial| R)) (|v| |Symbol|)
         ($ |List| (|Expression| R)))
        (SPADCALL
         (|SOLVERAD;solveInner| (SPADCALL |pq| (QREFELT $ 64)) |v| NIL $)
         (QREFELT $ 98))) 

(SDEFUN |SOLVERAD;isGeneric?|
        ((|rlp| |List| (|Polynomial| R)) (|rlv| |List| (|Symbol|))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G834 NIL) (#2=#:G833 #3=(|Boolean|)) (#4=#:G835 #3#)
          (#5=#:G837 NIL) (|f| NIL) (#6=#:G838 NIL) (|x| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #7=(|SOLVERAD;isGeneric?|))
           (SEQ (LETT |x| NIL . #7#) (LETT #6# (CDR |rlv|) . #7#)
                (LETT |f| NIL . #7#) (LETT #5# (CDR |rlp|) . #7#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#) . #7#) NIL)
                      (ATOM #6#) (PROGN (LETT |x| (CAR #6#) . #7#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (EQL (SPADCALL |f| |x| (QREFELT $ 99)) 1) . #7#)
                   (COND (#1# (LETT #2# (COND (#2# #4#) ('T NIL)) . #7#))
                         ('T
                          (PROGN (LETT #2# #4# . #7#) (LETT #1# 'T . #7#)))))))
                (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #7#)) . #7#)
                (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T 'T)))))) 

(SDEFUN |SOLVERAD;select|
        ((|lp| |List| (|List| (|Expression| R)))
         ($ . #1=(|List| (|List| (|Expression| R)))))
        (SPROG
         ((#2=#:G840 NIL) (#3=#:G839 #1#) (#4=#:G841 #1#) (#5=#:G846 NIL)
          (|lsel| NIL) (#6=#:G845 NIL) (#7=#:G844 NIL) (|f| NIL))
         (SEQ
          (COND
           ((SPADCALL |lp| NIL (QREFELT $ 100)) (SPADCALL NIL (QREFELT $ 101)))
           (#8='T
            (PROGN
             (LETT #2# NIL . #9=(|SOLVERAD;select|))
             (SEQ (LETT |f| NIL . #9#) (LETT #7# (|SPADfirst| |lp|) . #9#) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (PROGN
                            (LETT #6# NIL . #9#)
                            (SEQ (LETT |lsel| NIL . #9#)
                                 (LETT #5# (|SOLVERAD;select| (CDR |lp|) $)
                                       . #9#)
                                 G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN
                                        (LETT |lsel| (CAR #5#) . #9#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #6# (CONS (CONS |f| |lsel|) #6#)
                                         . #9#)))
                                 (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                                 (EXIT (NREVERSE #6#))))
                           . #9#)
                     (COND
                      (#2# (LETT #3# (SPADCALL #3# #4# (QREFELT $ 55)) . #9#))
                      ('T (PROGN (LETT #3# #4# . #9#) (LETT #2# 'T . #9#)))))))
                  (LETT #7# (CDR #7#) . #9#) (GO G190) G191 (EXIT NIL))
             (COND (#2# #3#) (#8# NIL)))))))) 

(SDEFUN |SOLVERAD;makeEq|
        ((|nres| |List| (|Expression| R)) (|lv| |List| (|Symbol|))
         ($ |List| (|Equation| (|Expression| R))))
        (SPROG
         ((#1=#:G850 NIL) (|x| NIL) (#2=#:G851 NIL) (|r| NIL) (#3=#:G849 NIL))
         (SEQ
          (PROGN
           (LETT #3# NIL . #4=(|SOLVERAD;makeEq|))
           (SEQ (LETT |r| NIL . #4#) (LETT #2# |nres| . #4#)
                (LETT |x| NIL . #4#) (LETT #1# |lv| . #4#) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #4#) NIL)
                      (ATOM #2#) (PROGN (LETT |r| (CAR #2#) . #4#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #3#
                        (CONS
                         (SPADCALL (SPADCALL |x| (QREFELT $ 60)) |r|
                                   (QREFELT $ 61))
                         #3#)
                        . #4#)))
                (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#)) . #4#)
                (GO G190) G191 (EXIT (NREVERSE #3#))))))) 

(SDEFUN |SOLVERAD;solveInner|
        ((|pq| |Polynomial| R) (|v| |Symbol|) (|contractFlag| |Boolean|)
         ($ |SuchThat| (|List| (|Expression| R))
          (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((|re| (|List| (|Equation| (|Expression| R))))
          (|solutions| (|List| (|Expression| R))) (#1=#:G875 NIL) (|i| NIL)
          (T0 (|List| (|Expression| R))) (|s| (|Expression| R)) (#2=#:G874 NIL)
          (|l| (|List| (|Expression| R)))
          (|unsolved| (|List| (|Polynomial| R))) (|n| (|NonNegativeInteger|))
          (|u| (|SparseUnivariatePolynomial| (|Polynomial| R)))
          (|t|
           (|Record|
            (|:| |pol| (|SparseUnivariatePolynomial| (|Polynomial| R)))
            (|:| |deg| (|PositiveInteger|))))
          (|constants| (|List| (|Polynomial| R))) (|ff| #3=(|Polynomial| R))
          (#4=#:G873 NIL) (|f| NIL)
          (|factors|
           (|List|
            (|Record| (|:| |factor| #3#) (|:| |exponent| (|Integer|))))))
         (SEQ (SETELT $ 7 NIL) (SETELT $ 8 |contractFlag|)
              (LETT |factors|
                    (SPADCALL (SPADCALL |pq| (QREFELT $ 104)) (QREFELT $ 107))
                    . #5=(|SOLVERAD;solveInner|))
              (LETT |constants| NIL . #5#) (LETT |unsolved| NIL . #5#)
              (LETT |solutions| NIL . #5#)
              (SEQ (LETT |f| NIL . #5#) (LETT #4# |factors| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ff| (QCAR |f|) . #5#)
                        (COND
                         ((NULL
                           (SPADCALL |v| (SPADCALL |ff| (QREFELT $ 66))
                                     (QREFELT $ 108)))
                          (EXIT
                           (LETT |constants| (CONS |ff| |constants|) . #5#))))
                        (LETT |u| (SPADCALL |ff| |v| (QREFELT $ 47)) . #5#)
                        (LETT |t| (SPADCALL |u| (QREFELT $ 111)) . #5#)
                        (LETT |u| (QCAR |t|) . #5#)
                        (LETT |n| (SPADCALL |u| (QREFELT $ 112)) . #5#)
                        (LETT |l|
                              (COND ((EQL |n| 1) (|SOLVERAD;linear| |u| $))
                                    ((EQL |n| 2) (|SOLVERAD;quadratic| |u| $))
                                    ((EQL |n| 3) (|SOLVERAD;cubic| |u| $))
                                    ((EQL |n| 4) (|SOLVERAD;quartic| |u| $))
                                    ('T
                                     (SEQ
                                      (LETT |unsolved| (CONS |ff| |unsolved|)
                                            . #5#)
                                      (EXIT NIL))))
                              . #5#)
                        (EXIT
                         (SEQ (LETT |s| NIL . #5#) (LETT #2# |l| . #5#) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |s| (CAR #2#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (COND
                                ((SPADCALL (QCDR |t|) 1 (QREFELT $ 114))
                                 (LETT |s| (|SOLVERAD;wrap| |s| $) . #5#)))
                               (LETT T0
                                     (SPADCALL |s| (QCDR |t|) (QREFELT $ 115))
                                     . #5#)
                               (SEQ (LETT |i| 1 . #5#)
                                    (LETT #1# (QCDR |f|) . #5#) G190
                                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |solutions|
                                            (SPADCALL T0 |solutions|
                                                      (QREFELT $ 116))
                                            . #5#)))
                                    (LETT |i| (|inc_SI| |i|) . #5#) (GO G190)
                                    G191 (EXIT NIL))
                               (EXIT (LETT |re| (QREFELT $ 7) . #5#)))
                              (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |solutions| (QREFELT $ 7) (QREFELT $ 117)))))) 

(DECLAIM (NOTINLINE |RadicalSolvePackage;|)) 

(DEFUN |RadicalSolvePackage| (#1=#:G876)
  (SPROG NIL
         (PROG (#2=#:G877)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RadicalSolvePackage|)
                                               '|domainEqualList|)
                    . #3=(|RadicalSolvePackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|RadicalSolvePackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RadicalSolvePackage|)))))))))) 

(DEFUN |RadicalSolvePackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RadicalSolvePackage|))
          (LETT |dv$| (LIST '|RadicalSolvePackage| DV$1) . #1#)
          (LETT $ (GETREFV 118) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RadicalSolvePackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 NIL)
          (QSETREFV $ 8 NIL)
          $))) 

(MAKEPROP '|RadicalSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|SideEquations|
              '|ContractSoln| (0 . |Zero|) (|Equation| 12) (4 . |Zero|)
              (|Expression| 6) (8 . |Zero|) (|Boolean|) (12 . =) (|Symbol|)
              (18 . |new|) (|Polynomial| 6) (22 . |coerce|) (|Fraction| 18)
              (27 . |coerce|) (32 . |coerce|) (37 . =) (|List| 10)
              (43 . |append|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 18) (49 . |coefficient|) (55 . -)
              (60 . |coerce|) (65 . |One|) (69 . |One|) (73 . /)
              (|SparseUnivariatePolynomial| 12) (|Mapping| 12 18)
              (|SparseUnivariatePolynomialFunctions2| 18 12) (79 . |map|)
              (|List| 12) (|PolynomialSolveByFormulas| 34 12)
              (85 . |quadratic|) (90 . |cubic|) (95 . |quartic|) (|Integer|)
              (100 . |coerce|) |SOLVERAD;radicalRoots;FSL;21|
              (|SparseUnivariatePolynomial| $) (105 . |univariate|) (111 . -)
              (116 . |leadingCoefficient|) (|Kernel| 12) (121 . |kernel|)
              (|Kernel| $) (126 . |eval|) (|List| 38) (133 . |append|)
              (139 . ~=) (|List| 52) (|List| $) (145 . |eval|) (152 . |coerce|)
              (157 . |equation|) |SOLVERAD;radicalSolve;FSL;10| (163 . |zero?|)
              (168 . |numer|) (|List| 16) (173 . |variables|) (178 . |denom|)
              (183 . |concat|) (189 . |removeDuplicates|) (194 . >)
              |SOLVERAD;radicalSolve;FL;11| (|Equation| 20) (200 . |lhs|)
              (205 . |rhs|) (210 . -) |SOLVERAD;radicalSolve;EL;12|
              |SOLVERAD;radicalSolve;ESL;13| (|List| 83) (|List| 20)
              (|SystemSolvePackage| 6) (216 . |triangularSystems|) (222 . ~=)
              (|List| 18) (228 . |position|) (234 . |delete|) (240 . =)
              |SOLVERAD;radicalRoots;LLL;14| (|List| 24)
              |SOLVERAD;radicalSolve;LLL;15| (246 . |setUnion|)
              |SOLVERAD;radicalSolve;LL;16| (|List| 72)
              |SOLVERAD;radicalSolve;LLL;17| |SOLVERAD;radicalSolve;LL;18|
              (|SuchThat| 38 24) |SOLVERAD;contractSolve;ESSt;19|
              |SOLVERAD;contractSolve;FSSt;20| (252 . |lhs|) (257 . |degree|)
              (263 . =) (269 . |list|) (|Factored| 18)
              (|MultivariateFactorize| 16 (|IndexedExponents| 16) 6 18)
              (274 . |factor|) (|Record| (|:| |factor| 18) (|:| |exponent| 43))
              (|List| 105) (279 . |factors|) (284 . |member?|)
              (|Record| (|:| |pol| 27) (|:| |deg| 113))
              (|DegreeReductionPackage| 18 6) (290 . |reduce|) (295 . |degree|)
              (|PositiveInteger|) (300 . >) (306 . |expand|) (312 . |append|)
              (318 . |construct|))
           '#(|radicalSolve| 324 |radicalRoots| 368 |contractSolve| 380) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 117
                                                 '(0 6 0 9 0 10 0 11 0 12 0 13
                                                   2 12 14 0 0 15 0 16 0 17 1
                                                   18 0 16 19 1 20 0 18 21 1 12
                                                   0 20 22 2 10 0 12 12 23 2 24
                                                   0 0 0 25 2 27 18 0 26 28 1
                                                   18 0 0 29 1 12 0 18 30 0 6 0
                                                   31 0 10 0 32 2 12 0 0 0 33 2
                                                   36 34 35 27 37 1 39 38 34 40
                                                   1 39 38 34 41 1 39 38 34 42
                                                   1 12 0 43 44 2 18 46 0 16 47
                                                   1 12 0 0 48 1 27 18 0 49 1
                                                   50 0 16 51 3 12 0 0 52 0 53
                                                   2 54 0 0 0 55 2 38 14 0 0 56
                                                   3 12 0 0 57 58 59 1 12 0 16
                                                   60 2 10 0 12 12 61 1 20 14 0
                                                   63 1 20 18 0 64 1 18 65 0 66
                                                   1 20 18 0 67 2 65 0 0 0 68 1
                                                   65 0 0 69 2 26 14 0 0 70 1
                                                   72 20 0 73 1 72 20 0 74 2 20
                                                   0 0 0 75 2 80 78 79 65 81 2
                                                   78 14 0 0 82 2 78 43 83 0 84
                                                   2 78 0 0 43 85 2 78 14 0 0
                                                   86 2 65 0 0 0 90 1 95 38 0
                                                   98 2 18 26 0 16 99 2 54 14 0
                                                   0 100 1 54 0 38 101 1 103
                                                   102 18 104 1 102 106 0 107 2
                                                   65 14 16 0 108 1 110 109 27
                                                   111 1 27 26 0 112 2 113 14 0
                                                   0 114 2 110 38 12 113 115 2
                                                   38 0 0 0 116 2 95 0 38 24
                                                   117 2 0 24 20 16 62 2 0 24
                                                   72 16 77 1 0 24 20 71 1 0 24
                                                   72 76 1 0 88 79 91 2 0 88 79
                                                   65 89 2 0 88 92 65 93 1 0 88
                                                   92 94 2 0 38 20 16 45 2 0 54
                                                   79 65 87 2 0 95 20 16 97 2 0
                                                   95 72 16 96)))))
           '|lookupComplete|)) 
