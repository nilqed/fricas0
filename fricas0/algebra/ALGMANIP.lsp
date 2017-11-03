
(SDEFUN |ALGMANIP;ratDenom;2F;1| ((|x| F) ($ F))
        (|ALGMANIP;innerRF| |x|
         (|ALGMANIP;algkernels| (SPADCALL |x| (QREFELT $ 15)) $) $)) 

(SDEFUN |ALGMANIP;ratDenom;FLF;2| ((|x| F) (|l| |List| (|Kernel| F)) ($ F))
        (|ALGMANIP;innerRF| |x| (|ALGMANIP;algkernels| |l| $) $)) 

(SDEFUN |ALGMANIP;ratDenom;3F;3| ((|x| F) (|y| F) ($ F))
        (SPADCALL |x| (LIST |y|) (QREFELT $ 20))) 

(SDEFUN |ALGMANIP;ratDenom;FLF;4| ((|x| F) (|l| |List| F) ($ F))
        (SPROG ((#1=#:G729 NIL) (|y| NIL) (#2=#:G728 NIL))
               (SEQ
                (SPADCALL |x|
                          (PROGN
                           (LETT #2# NIL . #3=(|ALGMANIP;ratDenom;FLF;4|))
                           (SEQ (LETT |y| NIL . #3#) (LETT #1# |l| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |y| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |y| (QREFELT $ 23))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 18))))) 

(SDEFUN |ALGMANIP;algkernels|
        ((|l| |List| (|Kernel| F)) ($ |List| (|Kernel| F)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|ALGMANIP;algkernels!0| (VECTOR (QREFELT $ 8) $)) |l|
                (QREFELT $ 29)))) 

(SDEFUN |ALGMANIP;algkernels!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ ALGOP)
          (LETT $ (QREFELT $$ 1) . #1=(|ALGMANIP;algkernels|))
          (LETT ALGOP (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QREFELT $ 25)) ALGOP (QREFELT $ 27)))))) 

(SDEFUN |ALGMANIP;rootkernels|
        ((|l| |List| (|Kernel| F)) ($ |List| (|Kernel| F)))
        (SPADCALL (CONS #'|ALGMANIP;rootkernels!0| $) |l| (QREFELT $ 31))) 

(SDEFUN |ALGMANIP;rootkernels!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 25)) '|nthRoot| (QREFELT $ 30))) 

(SDEFUN |ALGMANIP;ratPoly;FSup;7| ((|x| F) ($ |SparseUnivariatePolynomial| F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL (QREFELT $ 13) (QREFELT $ 33))
                         (QREFELT $ 35))
               |x| (QREFELT $ 36))
              (QREFELT $ 37))
             (QREFELT $ 16))
            (QREFELT $ 38))
           (QREFELT $ 35))
          (QREFELT $ 13) (QREFELT $ 41))
         (QREFELT $ 43))) 

(SDEFUN |ALGMANIP;rootSplit;2F;8| ((|x| F) ($ F))
        (SPROG
         ((#1=#:G743 NIL) (|k| NIL) (#2=#:G742 NIL)
          (|lk| (|List| (|Kernel| F))))
         (SEQ
          (LETT |lk| (|ALGMANIP;rootkernels| (SPADCALL |x| (QREFELT $ 15)) $)
                . #3=(|ALGMANIP;rootSplit;2F;8|))
          (EXIT
           (SPADCALL |x| |lk|
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |k| NIL . #3#) (LETT #1# |lk| . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2# (CONS (|ALGMANIP;rootExpand| |k| $) #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 46)))))) 

(SDEFUN |ALGMANIP;rootExpand| ((|k| |Kernel| F) ($ F))
        (SPROG ((|op| (|BasicOperator|)) (|n| (F)) (|x| (F)))
               (SEQ
                (LETT |x| (|SPADfirst| (SPADCALL |k| (QREFELT $ 48)))
                      . #1=(|ALGMANIP;rootExpand|))
                (LETT |n|
                      (SPADCALL (SPADCALL |k| (QREFELT $ 48)) (QREFELT $ 49))
                      . #1#)
                (LETT |op| (SPADCALL |k| (QREFELT $ 25)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL |op|
                            (SPADCALL (SPADCALL |x| (QREFELT $ 50))
                                      (QREFELT $ 35))
                            |n| (QREFELT $ 51))
                  (SPADCALL |op|
                            (SPADCALL (SPADCALL |x| (QREFELT $ 38))
                                      (QREFELT $ 35))
                            |n| (QREFELT $ 51))
                  (QREFELT $ 52)))))) 

(SDEFUN |ALGMANIP;innerRF| ((|x| F) (|ll| |List| (|Kernel| F)) ($ F))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| F)) (#1=#:G794 NIL) (|kk| NIL)
          (#2=#:G793 NIL) (#3=#:G789 NIL) (#4=#:G790 NIL) (#5=#:G792 NIL)
          (#6=#:G791 NIL) (|l| (|List| (|Kernel| F)))
          (|lk| (|List| (|Kernel| F))) (|k| (|Kernel| F)))
         (SEQ
          (EXIT
           (COND
            ((OR
              (NULL
               (LETT |l|
                     (SPADCALL (ELT $ 53) (SPADCALL |x| (QREFELT $ 54))
                               (QREFELT $ 56))
                     . #7=(|ALGMANIP;innerRF|)))
              (NULL
               (SPADCALL |ll| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 57))))
             |x|)
            ('T
             (SEQ (LETT |lk| NIL . #7#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (NULL
                           (SPADCALL (LETT |k| (|SPADfirst| |l|) . #7#) |ll|
                                     (QREFELT $ 58))))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |lk| (CONS |k| |lk|) . #7#)
                              (EXIT
                               (COND
                                ((NULL (LETT |l| (CDR |l|) . #7#))
                                 (PROGN
                                  (LETT #3#
                                        (PROGN
                                         (LETT #4#
                                               (SPADCALL |x| |lk|
                                                         (PROGN
                                                          (LETT #6# NIL . #7#)
                                                          (SEQ
                                                           (LETT |kk| NIL
                                                                 . #7#)
                                                           (LETT #5# |lk|
                                                                 . #7#)
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #5#)
                                                                 (PROGN
                                                                  (LETT |kk|
                                                                        (CAR
                                                                         #5#)
                                                                        . #7#)
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT #6#
                                                                   (CONS
                                                                    (SPADCALL
                                                                     (CONS
                                                                      #'|ALGMANIP;innerRF!0|
                                                                      (VECTOR $
                                                                              |ll|))
                                                                     |kk|
                                                                     (QREFELT $
                                                                              60))
                                                                    #6#)
                                                                   . #7#)))
                                                           (LETT #5# (CDR #5#)
                                                                 . #7#)
                                                           (GO G190) G191
                                                           (EXIT
                                                            (NREVERSE #6#))))
                                                         (QREFELT $ 46))
                                               . #7#)
                                         (GO #8=#:G788))
                                        . #7#)
                                  (GO #9=#:G753)))))))
                        #9# (EXIT #3#))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |q|
                        (SPADCALL
                         (SPADCALL |x| |lk|
                                   (PROGN
                                    (LETT #2# NIL . #7#)
                                    (SEQ (LETT |kk| NIL . #7#)
                                         (LETT #1# |lk| . #7#) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |kk| (CAR #1#) . #7#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (SPADCALL
                                                   (CONS #'|ALGMANIP;innerRF!1|
                                                         (VECTOR $ |ll|))
                                                   |kk| (QREFELT $ 60))
                                                  #2#)
                                                 . #7#)))
                                         (LETT #1# (CDR #1#) . #7#) (GO G190)
                                         G191 (EXIT (NREVERSE #2#))))
                                   (QREFELT $ 46))
                         |k| (SPADCALL |k| (QREFELT $ 62)) (QREFELT $ 63))
                        . #7#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL (CONS #'|ALGMANIP;innerRF!2| (VECTOR $ |ll|)) |q|
                              (QREFELT $ 65))
                    (SPADCALL (CONS #'|ALGMANIP;innerRF!3| (VECTOR $ |ll|)) |k|
                              (QREFELT $ 60))
                    (QREFELT $ 66)))))))
          #8# (EXIT #4#)))) 

(SDEFUN |ALGMANIP;innerRF!3| ((|z1| NIL) ($$ NIL))
        (PROG (|ll| $)
          (LETT |ll| (QREFELT $$ 1) . #1=(|ALGMANIP;innerRF|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|ALGMANIP;innerRF| |z1| |ll| $))))) 

(SDEFUN |ALGMANIP;innerRF!2| ((|z1| NIL) ($$ NIL))
        (PROG (|ll| $)
          (LETT |ll| (QREFELT $$ 1) . #1=(|ALGMANIP;innerRF|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|ALGMANIP;innerRF| |z1| |ll| $))))) 

(SDEFUN |ALGMANIP;innerRF!1| ((|z1| NIL) ($$ NIL))
        (PROG (|ll| $)
          (LETT |ll| (QREFELT $$ 1) . #1=(|ALGMANIP;innerRF|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|ALGMANIP;innerRF| |z1| |ll| $))))) 

(SDEFUN |ALGMANIP;innerRF!0| ((|z1| NIL) ($$ NIL))
        (PROG (|ll| $)
          (LETT |ll| (QREFELT $$ 1) . #1=(|ALGMANIP;innerRF|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|ALGMANIP;innerRF| |z1| |ll| $))))) 

(SDEFUN |ALGMANIP;fp_root|
        ((|fp| |Factored| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|op| |BasicOperator|) (|n| |NonNegativeInteger|) ($ F))
        (SPROG
         ((|res| (F)) (|rr| (F)) (|ce| (|NonNegativeInteger|)) (#1=#:G812 NIL)
          (|ne| (|NonNegativeInteger|)) (#2=#:G811 NIL) (#3=#:G809 NIL)
          (|nn| (|Integer|)) (|ng| (|NonNegativeInteger|)) (#4=#:G807 NIL)
          (#5=#:G818 NIL) (|fr| NIL)
          (|u| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ (LETT |res| (|spadConstant| $ 68) . #6=(|ALGMANIP;fp_root|))
              (COND
               ((SPADCALL (LETT |u| (SPADCALL |fp| (QREFELT $ 70)) . #6#)
                          (|spadConstant| $ 72) (QREFELT $ 73))
                (LETT |res|
                      (SPADCALL |op|
                                (LIST (SPADCALL |u| (QREFELT $ 74))
                                      (SPADCALL |n| (QREFELT $ 76)))
                                (QREFELT $ 77))
                      . #6#)))
              (SEQ (LETT |fr| NIL . #6#)
                   (LETT #5# (SPADCALL |fp| (QREFELT $ 80)) . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |fr| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ne|
                          (PROG1 (LETT #4# (REM (QCDR |fr|) |n|) . #6#)
                            (|check_subtype2| (>= #4# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #4#))
                          . #6#)
                    (LETT |ng| (GCD |ne| |n|) . #6#)
                    (LETT |nn|
                          (PROG2
                              (LETT #3# (SPADCALL |n| |ng| (QREFELT $ 83))
                                    . #6#)
                              (QCDR #3#)
                            (|check_union2| (QEQCAR #3# 0)
                                            (|NonNegativeInteger|)
                                            (|Union| (|NonNegativeInteger|)
                                                     #7="failed")
                                            #3#))
                          . #6#)
                    (LETT |ne|
                          (PROG1
                              (LETT #2#
                                    (PROG2
                                        (LETT #3#
                                              (SPADCALL |ne| |ng|
                                                        (QREFELT $ 83))
                                              . #6#)
                                        (QCDR #3#)
                                      (|check_union2| (QEQCAR #3# 0)
                                                      (|NonNegativeInteger|)
                                                      (|Union|
                                                       (|NonNegativeInteger|)
                                                       #7#)
                                                      #3#))
                                    . #6#)
                            (|check_subtype2| (>= #2# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #2#))
                          . #6#)
                    (LETT |ce|
                          (PROG1 (LETT #1# (QUOTIENT2 (QCDR |fr|) |n|) . #6#)
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          . #6#)
                    (LETT |rr|
                          (COND
                           ((SPADCALL |nn| 1 (QREFELT $ 84))
                            (SPADCALL |op|
                                      (LIST
                                       (SPADCALL
                                        (SPADCALL (QCAR |fr|) |ne|
                                                  (QREFELT $ 85))
                                        (QREFELT $ 74))
                                       (SPADCALL |nn| (QREFELT $ 76)))
                                      (QREFELT $ 77)))
                           ('T (|spadConstant| $ 68)))
                          . #6#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL |res|
                                      (SPADCALL
                                       (SPADCALL (QCAR |fr|) |ce|
                                                 (QREFELT $ 85))
                                       (QREFELT $ 74))
                                      (QREFELT $ 86))
                            |rr| (QREFELT $ 86))
                           . #6#)))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |ALGMANIP;pol_root|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         (|op| |BasicOperator|) (|n| |NonNegativeInteger|) ($ F))
        (SPROG
         ((|pp| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (#1=#:G820 NIL) (|cp| (R)))
         (SEQ
          (LETT |cp| (SPADCALL |p| (QREFELT $ 87)) . #2=(|ALGMANIP;pol_root|))
          (SPADCALL |cp| (QREFELT $ 88))
          (LETT |pp|
                (PROG2
                    (LETT #1#
                          (SPADCALL |p| (SPADCALL |cp| (QREFELT $ 89))
                                    (QREFELT $ 90))
                          . #2#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|SparseMultivariatePolynomial| (QREFELT $ 6)
                                                                  (|Kernel|
                                                                   (QREFELT $
                                                                            7)))
                                  (|Union|
                                   (|SparseMultivariatePolynomial|
                                    (QREFELT $ 6) (|Kernel| (QREFELT $ 7)))
                                   "failed")
                                  #1#))
                . #2#)
          (EXIT
           (SPADCALL
            (|ALGMANIP;fp_root| (SPADCALL |pp| (QREFELT $ 91)) |op| |n| $)
            (|ALGMANIP;fp_root|
             (SPADCALL (ELT $ 89) (SPADCALL |cp| (QREFELT $ 93))
                       (QREFELT $ 97))
             |op| |n| $)
            (QREFELT $ 86)))))) 

(SDEFUN |ALGMANIP;root_factor_k| ((|k| |Kernel| F) ($ F))
        (SPROG
         ((|op| (|BasicOperator|)) (|n| (|NonNegativeInteger|)) (#1=#:G824 NIL)
          (|nf| (F)) (|x| (F)))
         (SEQ
          (LETT |x| (|SPADfirst| (SPADCALL |k| (QREFELT $ 48)))
                . #2=(|ALGMANIP;root_factor_k|))
          (LETT |nf| (SPADCALL (SPADCALL |k| (QREFELT $ 48)) (QREFELT $ 49))
                . #2#)
          (LETT |n|
                (PROG1 (LETT #1# (SPADCALL |nf| (QREFELT $ 98)) . #2#)
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#))
                . #2#)
          (LETT |op| (SPADCALL |k| (QREFELT $ 25)) . #2#)
          (EXIT
           (SPADCALL
            (|ALGMANIP;pol_root| (SPADCALL |x| (QREFELT $ 50)) |op| |n| $)
            (|ALGMANIP;pol_root| (SPADCALL |x| (QREFELT $ 38)) |op| |n| $)
            (QREFELT $ 52)))))) 

(SDEFUN |ALGMANIP;rootFactor;2F;14| ((|x| F) ($ F))
        (SPROG
         ((#1=#:G831 NIL) (|k| NIL) (#2=#:G830 NIL)
          (|lk| (|List| (|Kernel| F))))
         (SEQ
          (LETT |lk| (|ALGMANIP;rootkernels| (SPADCALL |x| (QREFELT $ 15)) $)
                . #3=(|ALGMANIP;rootFactor;2F;14|))
          (EXIT
           (SPADCALL |x| |lk|
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |k| NIL . #3#) (LETT #1# |lk| . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (|ALGMANIP;root_factor_k| |k| $) #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 46)))))) 

(SDEFUN |ALGMANIP;rootKerSimp;BoFNniF;15|
        ((|op| |BasicOperator|) (|x| F) (|n| |NonNegativeInteger|) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 101))
                      |ALGMANIP;rootKerSimp;BoFNniF;15|)
                (EXIT
                 (COND
                  ((QEQCAR |r| 0)
                   (SPADCALL (SPADCALL (QCDR |r|) |n| (QREFELT $ 102))
                             (QREFELT $ 88)))
                  ('T (|ALGMANIP;inroot| |op| |x| |n| $))))))) 

(SDEFUN |ALGMANIP;rootKerSimp;BoFNniF;16|
        ((|op| |BasicOperator|) (|x| F) (|n| |NonNegativeInteger|) ($ F))
        (|ALGMANIP;inroot| |op| |x| |n| $)) 

(SDEFUN |ALGMANIP;breakup|
        ((|l| |List| (|Kernel| F))
         ($ |List|
          (|Record| (|:| |ker| (|List| (|Kernel| F)))
                    (|:| |exponent| (|List| (|Integer|))))))
        (SPROG
         ((|ll|
           (|List|
            (|Record| (|:| |ker| (|List| (|Kernel| F)))
                      (|:| |exponent| (|List| (|Integer|))))))
          (|others| #1=(|List| (|Kernel| F))) (|expo| (|List| (|Integer|)))
          (|same| #1#) (|arg| (|List| F)) (#2=#:G845 NIL) (|kk| NIL)
          (|n| (|Integer|)) (|a| (F)) (|k| (|Kernel| F)))
         (SEQ
          (COND ((NULL |l|) NIL)
                ('T
                 (SEQ (LETT |k| (|SPADfirst| |l|) . #3=(|ALGMANIP;breakup|))
                      (LETT |a|
                            (|SPADfirst|
                             (LETT |arg| (SPADCALL |k| (QREFELT $ 48)) . #3#))
                            . #3#)
                      (LETT |n|
                            (SPADCALL (SPADCALL |arg| (QREFELT $ 49))
                                      (QREFELT $ 98))
                            . #3#)
                      (LETT |expo| NIL . #3#)
                      (LETT |others| (LETT |same| NIL . #3#) . #3#)
                      (SEQ (LETT |kk| NIL . #3#) (LETT #2# (CDR |l|) . #3#)
                           G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |kk| (CAR #2#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |a|
                                         (|SPADfirst|
                                          (LETT |arg|
                                                (SPADCALL |kk| (QREFELT $ 48))
                                                . #3#))
                                         (QREFELT $ 104))
                               (SEQ (LETT |same| (CONS |kk| |same|) . #3#)
                                    (EXIT
                                     (LETT |expo|
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |arg| (QREFELT $ 49))
                                             (QREFELT $ 98))
                                            |expo|)
                                           . #3#))))
                              ('T
                               (LETT |others| (CONS |kk| |others|) . #3#)))))
                           (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |ll| (|ALGMANIP;breakup| |others| $) . #3#)
                      (EXIT
                       (CONS (CONS (CONS |k| |same|) (CONS |n| |expo|))
                             |ll|)))))))) 

(SDEFUN |ALGMANIP;rootProduct;2F;18| ((|x| F) ($ F))
        (SPROG
         ((|lv| (|List| F)) (#1=#:G848 NIL) (#2=#:G857 NIL) (|m| NIL)
          (#3=#:G856 NIL) (|k| (|Kernel| F)) (|n| (|Integer|))
          (|k0| (|Kernel| F)) (|l| (|List| (|Kernel| F))) (#4=#:G855 NIL)
          (|rec| NIL))
         (SEQ
          (SEQ (LETT |rec| NIL . #5=(|ALGMANIP;rootProduct;2F;18|))
               (LETT #4#
                     (|ALGMANIP;breakup|
                      (|ALGMANIP;rootkernels| (SPADCALL |x| (QREFELT $ 15)) $)
                      $)
                     . #5#)
               G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |rec| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |k0| (|SPADfirst| (LETT |l| (QCAR |rec|) . #5#)) . #5#)
                (EXIT
                 (COND
                  ((NULL (NULL (CDR |l|)))
                   (SEQ
                    (LETT |n| (SPADCALL (QCDR |rec|) (QREFELT $ 105)) . #5#)
                    (LETT |k|
                          (SPADCALL (SPADCALL |k0| (QREFELT $ 25))
                                    (LIST
                                     (|SPADfirst|
                                      (SPADCALL |k0| (QREFELT $ 48)))
                                     (SPADCALL |n| (QREFELT $ 76)))
                                    (SPADCALL |k0| (QREFELT $ 106))
                                    (QREFELT $ 107))
                          . #5#)
                    (LETT |lv|
                          (PROGN
                           (LETT #3# NIL . #5#)
                           (SEQ (LETT |m| NIL . #5#)
                                (LETT #2# (QCDR |rec|) . #5#) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |m| (CAR #2#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |k| (QREFELT $ 108))
                                          (PROG1
                                              (LETT #1# (QUOTIENT2 |n| |m|)
                                                    . #5#)
                                            (|check_subtype2| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #1#))
                                          (QREFELT $ 109))
                                         #3#)
                                        . #5#)))
                                (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #3#))))
                          . #5#)
                    (EXIT
                     (LETT |x| (SPADCALL |x| |l| |lv| (QREFELT $ 46))
                           . #5#)))))))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| (QREFELT $ 110)))))) 

(SDEFUN |ALGMANIP;rootPower1|
        ((|x| F) (|lk| |List| (|Kernel| F)) (|nlk| |List| F) ($ F))
        (SPROG ((#1=#:G862 NIL) (|k| NIL))
               (SEQ
                (LETT |x| (SPADCALL |x| |lk| |nlk| (QREFELT $ 46))
                      . #2=(|ALGMANIP;rootPower1|))
                (SEQ (LETT |k| NIL . #2#)
                     (LETT #1# (SPADCALL |x| (QREFELT $ 54)) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |k| (QREFELT $ 25)) '|nthRoot|
                                   (QREFELT $ 30))
                         (LETT |x|
                               (SPADCALL
                                (|ALGMANIP;radeval|
                                 (SPADCALL |x| (QREFELT $ 50)) |k| $)
                                (|ALGMANIP;radeval|
                                 (SPADCALL |x| (QREFELT $ 38)) |k| $)
                                (QREFELT $ 52))
                               . #2#)))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |ALGMANIP;rootPower;2F;20| ((|x| F) ($ F))
        (SPROG
         ((|nlk| (|List| F)) (|lk| (|List| (|Kernel| F))) (|nk| (F))
          (|nargs| (|List| F)) (#1=#:G869 NIL) (|k| NIL))
         (SEQ (LETT |lk| NIL . #2=(|ALGMANIP;rootPower;2F;20|))
              (LETT |nlk| NIL . #2#)
              (SEQ (LETT |k| NIL . #2#)
                   (LETT #1# (SPADCALL |x| (QREFELT $ 15)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |nargs|
                          (SPADCALL
                           (CONS #'|ALGMANIP;rootPower;2F;20!0|
                                 (VECTOR $ |nlk| |lk|))
                           (SPADCALL |k| (QREFELT $ 48)) (QREFELT $ 112))
                          . #2#)
                    (LETT |nk|
                          (SPADCALL (SPADCALL |k| (QREFELT $ 25)) |nargs|
                                    (QREFELT $ 113))
                          . #2#)
                    (LETT |lk| (CONS |k| |lk|) . #2#)
                    (EXIT (LETT |nlk| (CONS |nk| |nlk|) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (|ALGMANIP;rootPower1| |x| |lk| |nlk| $))))) 

(SDEFUN |ALGMANIP;rootPower;2F;20!0| ((|k1| NIL) ($$ NIL))
        (PROG (|lk| |nlk| $)
          (LETT |lk| (QREFELT $$ 2) . #1=(|ALGMANIP;rootPower;2F;20|))
          (LETT |nlk| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|ALGMANIP;rootPower1| |k1| |lk| |nlk| $))))) 

(SDEFUN |ALGMANIP;radeval|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) (|k| |Kernel| F)
         ($ F))
        (SPROG
         ((|q|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|ans| (F)) (|term| (F)) (|g| (|NonNegativeInteger|))
          (|d| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|))
          (#1=#:G870 NIL) (|a| (F)) (|arg| (|List| F)))
         (SEQ
          (LETT |a|
                (|SPADfirst|
                 (LETT |arg| (SPADCALL |k| (QREFELT $ 48))
                       . #2=(|ALGMANIP;radeval|)))
                . #2#)
          (LETT |n|
                (PROG1
                    (LETT #1#
                          (SPADCALL (SPADCALL |arg| (QREFELT $ 49))
                                    (QREFELT $ 98))
                          . #2#)
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#))
                . #2#)
          (LETT |ans| (|spadConstant| $ 114) . #2#)
          (LETT |q| (SPADCALL |p| |k| (QREFELT $ 115)) . #2#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (LETT |d| (SPADCALL |q| (QREFELT $ 117)) . #2#) 0
                            (QREFELT $ 118)))
                 (GO G191)))
               (SEQ
                (LETT |term|
                      (SEQ (LETT |g| (GCD |d| |n|) . #2#)
                           (EXIT
                            (COND
                             ((EQL |g| |n|)
                              (SPADCALL |a| (QUOTIENT2 |d| |g|)
                                        (QREFELT $ 109)))
                             ((EQL |g| 1)
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 72) |k| |d|
                                         (QREFELT $ 119))
                               (QREFELT $ 74)))
                             ('T
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 72)
                                         (SPADCALL
                                          (SPADCALL |k| (QREFELT $ 25))
                                          (LIST |a|
                                                (SPADCALL (QUOTIENT2 |n| |g|)
                                                          (QREFELT $ 76)))
                                          (SPADCALL |k| (QREFELT $ 106))
                                          (QREFELT $ 107))
                                         (QUOTIENT2 |d| |g|) (QREFELT $ 119))
                               (QREFELT $ 74))))))
                      . #2#)
                (LETT |ans|
                      (SPADCALL |ans|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |q| (QREFELT $ 120))
                                           (QREFELT $ 74))
                                 |term| (QREFELT $ 86))
                                (QREFELT $ 121))
                      . #2#)
                (EXIT (LETT |q| (SPADCALL |q| (QREFELT $ 122)) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 120)) (QREFELT $ 74))
                     |ans| (QREFELT $ 121)))))) 

(SDEFUN |ALGMANIP;inroot|
        ((|op| |BasicOperator|) (|x| F) (|n| |NonNegativeInteger|) ($ F))
        (SPROG
         ((#1=#:G904 NIL)
          (|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (|q| (|Fraction| (|Integer|)))
          (|pr|
           (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|)))
            "failed"))
          (#2=#:G908 NIL)
          (|num| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ
          (COND ((SPADCALL |x| (|spadConstant| $ 68) (QREFELT $ 104)) |x|)
                (#3='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (COND
                     ((SPADCALL |x|
                                (SPADCALL (|spadConstant| $ 68)
                                          (QREFELT $ 123))
                                (QREFELT $ 124))
                      (SEQ
                       (LETT |num| (SPADCALL |x| (QREFELT $ 50))
                             . #4=(|ALGMANIP;inroot|))
                       (EXIT
                        (COND
                         ((OR
                           (SPADCALL |num| (|spadConstant| $ 72)
                                     (QREFELT $ 125))
                           (SPADCALL |num|
                                     (SPADCALL (|spadConstant| $ 72)
                                               (QREFELT $ 127))
                                     (QREFELT $ 125)))
                          (PROGN
                           (LETT #2#
                                 (SPADCALL
                                  (|ALGMANIP;inroot| |op|
                                   (SPADCALL
                                    (SPADCALL |num|
                                              (SPADCALL |x| (QREFELT $ 38))
                                              (QREFELT $ 126))
                                    (QREFELT $ 74))
                                   |n| $)
                                  (QREFELT $ 37))
                                 . #4#)
                           (GO #5=#:G906))))))))
                    (LETT |u| (SPADCALL |x| |op| (QREFELT $ 130)) . #4#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 1)
                       (SPADCALL |op| (LIST |x| (SPADCALL |n| (QREFELT $ 76)))
                                 (QREFELT $ 77)))
                      (#3#
                       (SEQ (LETT |pr| (QCDR |u|) . #4#)
                            (LETT |q|
                                  (SPADCALL (QCDR |pr|)
                                            (SPADCALL |n|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL (QCAR |pr|)
                                                                  (QREFELT $
                                                                           48))
                                                        (QREFELT $ 49))
                                                       (QREFELT $ 98))
                                                      (QREFELT $ 131))
                                            (QREFELT $ 133))
                                  . #4#)
                            (LETT |qr|
                                  (DIVIDE2 (SPADCALL |q| (QREFELT $ 134))
                                           (SPADCALL |q| (QREFELT $ 135)))
                                  . #4#)
                            (LETT |x|
                                  (|SPADfirst|
                                   (SPADCALL (QCAR |pr|) (QREFELT $ 48)))
                                  . #4#)
                            (EXIT
                             (SPADCALL
                              (SPADCALL |x| (QCAR |qr|) (QREFELT $ 136))
                              (SPADCALL
                               (SPADCALL |op| |x|
                                         (PROG1
                                             (LETT #1#
                                                   (SPADCALL |q|
                                                             (QREFELT $ 135))
                                                   . #4#)
                                           (|check_subtype2| (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #1#))
                                         (QREFELT $ 103))
                               (QCDR |qr|) (QREFELT $ 136))
                              (QREFELT $ 86)))))))))
                  #5# (EXIT #2#))))))) 

(SDEFUN |ALGMANIP;sroot|
        ((|k| |Kernel| F) (|lk| |List| (|Kernel| F)) (|nlk| |List| F) ($ F))
        (SPROG
         ((|pr|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (#1=#:G909 NIL) (|narg1| (F)) (|arg| (|List| F)))
         (SEQ
          (LETT |narg1|
                (SPADCALL
                 (|SPADfirst|
                  (LETT |arg| (SPADCALL |k| (QREFELT $ 48))
                        . #2=(|ALGMANIP;sroot|)))
                 |lk| |nlk| (QREFELT $ 46))
                . #2#)
          (LETT |pr|
                (SPADCALL |narg1|
                          (PROG1
                              (LETT #1#
                                    (SPADCALL (SPADCALL |arg| (QREFELT $ 49))
                                              (QREFELT $ 98))
                                    . #2#)
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          (QREFELT $ 139))
                . #2#)
          (EXIT
           (SPADCALL (QVELT |pr| 1)
                     (SPADCALL (SPADCALL |k| (QREFELT $ 25)) (QVELT |pr| 2)
                               (QVELT |pr| 0) (QREFELT $ 103))
                     (QREFELT $ 86)))))) 

(SDEFUN |ALGMANIP;rootSimp;2F;24| ((|x| F) ($ F))
        (SPROG
         ((|nlk| (|List| F)) (|lk| (|List| (|Kernel| F))) (|nk| (F))
          (#1=#:G917 NIL) (|k| NIL) (|tk| (|List| (|Kernel| F))))
         (SEQ
          (LETT |tk| (|ALGMANIP;rootkernels| (SPADCALL |x| (QREFELT $ 15)) $)
                . #2=(|ALGMANIP;rootSimp;2F;24|))
          (LETT |lk| NIL . #2#) (LETT |nlk| NIL . #2#)
          (SEQ (LETT |k| NIL . #2#) (LETT #1# |tk| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |nk| (|ALGMANIP;sroot| |k| |lk| |nlk| $) . #2#)
                    (LETT |lk| (CONS |k| |lk|) . #2#)
                    (EXIT (LETT |nlk| (CONS |nk| |nlk|) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| |lk| |nlk| (QREFELT $ 46)))))) 

(DECLAIM (NOTINLINE |AlgebraicManipulations;|)) 

(DEFUN |AlgebraicManipulations| (&REST #1=#:G918)
  (SPROG NIL
         (PROG (#2=#:G919)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraicManipulations|)
                                               '|domainEqualList|)
                    . #3=(|AlgebraicManipulations|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraicManipulations;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraicManipulations|)))))))))) 

(DEFUN |AlgebraicManipulations;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgebraicManipulations|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|AlgebraicManipulations| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 141) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#1|
                                                              '(|Comparable|))
                                               (|HasCategory| |#1|
                                                              '(|GcdDomain|))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FunctionSpace|
                                                               (|devaluate|
                                                                |#1|))))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#1|
                                                              '(|Comparable|))
                                               (|HasCategory| |#1|
                                                              '(|GcdDomain|))
                                               (|HasCategory| |#1|
                                                              '(|UniqueFactorizationDomain|))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FunctionSpace|
                                                               (|devaluate|
                                                                |#1|))))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|AlgebraicManipulations|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|%alg|)
          (QSETREFV $ 13 (SPADCALL (SPADCALL (QREFELT $ 10)) (QREFELT $ 12)))
          (COND
           ((|HasCategory| |#1| '(|Comparable|))
            (COND
             ((|HasCategory| |#1| '(|GcdDomain|))
              (COND
               ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
                (COND
                 ((|HasCategory| |#2|
                                 (LIST '|FunctionSpace| (|devaluate| |#1|)))
                  (PROGN
                   (COND
                    ((|HasCategory| |#1| '(|UniqueFactorizationDomain|))
                     (PROGN
                      (QSETREFV $ 67
                                (|GeneralizedMultivariateFactorize|
                                 (|Kernel| |#2|)
                                 (|IndexedExponents| (|Kernel| |#2|)) |#1| |#1|
                                 (|SparseMultivariatePolynomial| |#1|
                                                                 (|Kernel|
                                                                  |#2|))))
                      (QSETREFV $ 99
                                (CONS
                                 (|dispatchFunction|
                                  |ALGMANIP;rootFactor;2F;14|)
                                 $)))))
                   (COND
                    ((|HasCategory| |#1| '(|RadicalCategory|))
                     (QSETREFV $ 103
                               (CONS
                                (|dispatchFunction|
                                 |ALGMANIP;rootKerSimp;BoFNniF;15|)
                                $)))
                    ('T
                     (QSETREFV $ 103
                               (CONS
                                (|dispatchFunction|
                                 |ALGMANIP;rootKerSimp;BoFNniF;16|)
                                $))))
                   (QSETREFV $ 111
                             (CONS
                              (|dispatchFunction| |ALGMANIP;rootProduct;2F;18|)
                              $))
                   (QSETREFV $ 110
                             (CONS
                              (|dispatchFunction| |ALGMANIP;rootPower;2F;20|)
                              $))
                   (QSETREFV $ 140
                             (CONS
                              (|dispatchFunction| |ALGMANIP;rootSimp;2F;24|)
                              $)))))))))))
          $))) 

(MAKEPROP '|AlgebraicManipulations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              (|Symbol|) (0 . |new|) (|Kernel| 7) (4 . |kernel|) '|dummy|
              (|List| 22) (9 . |tower|) |ALGMANIP;ratDenom;2F;1| (|List| 11)
              |ALGMANIP;ratDenom;FLF;2| (|List| 7) |ALGMANIP;ratDenom;FLF;4|
              |ALGMANIP;ratDenom;3F;3| (|Kernel| $) (14 . |retract|)
              (|BasicOperator|) (19 . |operator|) (|Boolean|) (24 . |has?|)
              (|Mapping| 26 11) (30 . |select|) (36 . |is?|) (42 . |select!|)
              (|SparseMultivariatePolynomial| 6 11) (48 . |coerce|)
              (|SparseMultivariatePolynomial| 6 22) (53 . |coerce|) (58 . -)
              (64 . |inv|) (69 . |denom|) (|Fraction| 42)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 11) 11
                                                     6 32 7)
              (74 . |univariate|) (|SparseUnivariatePolynomial| 7)
              (80 . |numer|) |ALGMANIP;ratPoly;FSup;7| (|List| $) (85 . |eval|)
              |ALGMANIP;rootSplit;2F;8| (92 . |argument|) (97 . |second|)
              (102 . |numer|) (107 . |elt|) (114 . /) (120 . >)
              (126 . |kernels|) (|Mapping| 26 11 11) (131 . |sort!|)
              (137 . |setIntersection|) (143 . |member?|) (|Mapping| $ $)
              (149 . |map|) (|SparseUnivariatePolynomial| $) (155 . |minPoly|)
              (160 . |univariate|) (|Mapping| 7 7) (167 . |map|) (173 . |elt|)
              '|MPfact| (179 . |One|) (|Factored| 32) (183 . |unit|)
              (188 . |One|) (192 . |One|) (196 . ~=) (202 . |coerce|)
              (|Integer|) (207 . |coerce|) (212 . |kernel|)
              (|Record| (|:| |factor| 32) (|:| |exponent| 75)) (|List| 78)
              (218 . |factors|) (|Union| $ '"failed") (|NonNegativeInteger|)
              (223 . |exquo|) (229 . >) (235 . ^) (241 . *) (247 . |content|)
              (252 . |coerce|) (257 . |coerce|) (262 . |exquo|)
              (268 . |factor|) (|Factored| $) (273 . |factor|) (|Mapping| 32 6)
              (|Factored| 6) (|FactoredFunctions2| 6 32) (278 . |map|)
              (284 . |retract|) (289 . |rootFactor|) (|Union| 6 '"failed")
              (294 . |retractIfCan|) (299 . |nthRoot|) (305 . |rootKerSimp|)
              (312 . =) (318 . |lcm|) (323 . |height|) (328 . |kernel|)
              (335 . |coerce|) (340 . ^) (346 . |rootPower|)
              (351 . |rootProduct|) (356 . |map|) (362 . |elt|) (368 . |Zero|)
              (372 . |univariate|) (|SparseUnivariatePolynomial| 32)
              (378 . |degree|) (383 . >) (389 . |monomial|)
              (396 . |leadingCoefficient|) (401 . +) (407 . |reductum|)
              (412 . -) (417 . ~=) (423 . =) (429 . *) (435 . -)
              (|Record| (|:| |var| 22) (|:| |exponent| 75))
              (|Union| 128 '"failed") (440 . |isExpt|) (446 . *)
              (|Fraction| 75) (452 . /) (458 . |numer|) (463 . |denom|)
              (468 . ^)
              (|Record| (|:| |exponent| 82) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 11) 11 6 32 7)
              (474 . |froot|) (480 . |rootSimp|))
           '#(|rootSplit| 485 |rootSimp| 490 |rootProduct| 495 |rootPower| 500
              |rootKerSimp| 505 |rootFactor| 512 |ratPoly| 517 |ratDenom| 522)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 140
                                                 '(0 9 0 10 1 11 0 9 12 1 7 14
                                                   0 15 1 7 22 0 23 1 11 24 0
                                                   25 2 24 26 0 9 27 2 17 0 28
                                                   0 29 2 24 26 0 9 30 2 17 0
                                                   28 0 31 1 32 0 11 33 1 7 0
                                                   34 35 2 7 0 0 0 36 1 7 0 0
                                                   37 1 7 34 0 38 2 40 39 7 11
                                                   41 1 39 42 0 43 3 7 0 0 14
                                                   45 46 1 11 19 0 48 1 19 7 0
                                                   49 1 7 34 0 50 3 7 0 24 0 0
                                                   51 2 7 0 0 0 52 2 11 26 0 0
                                                   53 1 7 14 0 54 2 17 0 55 0
                                                   56 2 17 0 0 0 57 2 17 26 11
                                                   0 58 2 7 0 59 22 60 1 7 61
                                                   22 62 3 40 42 7 11 42 63 2
                                                   42 0 64 0 65 2 42 7 0 7 66 0
                                                   7 0 68 1 69 32 0 70 0 6 0 71
                                                   0 32 0 72 2 32 26 0 0 73 1 7
                                                   0 34 74 1 7 0 75 76 2 7 0 24
                                                   45 77 1 69 79 0 80 2 82 81 0
                                                   0 83 2 75 26 0 0 84 2 32 0 0
                                                   82 85 2 7 0 0 0 86 1 32 6 0
                                                   87 1 7 0 6 88 1 32 0 6 89 2
                                                   32 81 0 0 90 1 67 69 32 91 1
                                                   6 92 0 93 2 96 69 94 95 97 1
                                                   7 75 0 98 1 0 7 7 99 1 7 100
                                                   0 101 2 6 0 0 75 102 3 0 7
                                                   24 7 82 103 2 7 26 0 0 104 1
                                                   75 0 45 105 1 11 82 0 106 3
                                                   11 0 24 19 82 107 1 7 0 22
                                                   108 2 7 0 0 82 109 1 0 7 7
                                                   110 1 0 7 7 111 2 19 0 64 0
                                                   112 2 7 0 24 45 113 0 7 0
                                                   114 2 32 61 0 11 115 1 116
                                                   82 0 117 2 82 26 0 0 118 3
                                                   32 0 0 11 82 119 1 116 32 0
                                                   120 2 7 0 0 0 121 1 116 0 0
                                                   122 1 7 0 0 123 2 7 26 0 0
                                                   124 2 32 26 0 0 125 2 32 0 0
                                                   0 126 1 32 0 0 127 2 7 129 0
                                                   24 130 2 75 0 82 0 131 2 132
                                                   0 75 75 133 1 132 75 0 134 1
                                                   132 75 0 135 2 7 0 0 75 136
                                                   2 138 137 7 82 139 1 0 7 7
                                                   140 1 0 7 7 47 1 1 7 7 140 1
                                                   1 7 7 111 1 1 7 7 110 3 1 7
                                                   24 7 82 103 1 2 7 7 99 1 0
                                                   42 7 44 1 0 7 7 16 2 0 7 7 7
                                                   21 2 0 7 7 17 18 2 0 7 7 19
                                                   20)))))
           '|lookupComplete|)) 
