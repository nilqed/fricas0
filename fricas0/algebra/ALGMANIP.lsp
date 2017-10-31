
(SDEFUN |ALGMANIP;ratDenom;2F;1| ((|x| F) ($ F))
        (|ALGMANIP;innerRF| |x|
         (|ALGMANIP;algkernels| (SPADCALL |x| (QREFELT $ 15)) $) $)) 

(SDEFUN |ALGMANIP;ratDenom;FLF;2| ((|x| F) (|l| |List| (|Kernel| F)) ($ F))
        (|ALGMANIP;innerRF| |x| (|ALGMANIP;algkernels| |l| $) $)) 

(SDEFUN |ALGMANIP;ratDenom;3F;3| ((|x| F) (|y| F) ($ F))
        (SPADCALL |x| (LIST |y|) (QREFELT $ 20))) 

(SDEFUN |ALGMANIP;ratDenom;FLF;4| ((|x| F) (|l| |List| F) ($ F))
        (SPROG ((#1=#:G726 NIL) (|y| NIL) (#2=#:G725 NIL))
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
        (SPADCALL (CONS #'|ALGMANIP;rootkernels!0| $) |l| (QREFELT $ 29))) 

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
               (SPADCALL (SPADCALL (QREFELT $ 13) (QREFELT $ 32))
                         (QREFELT $ 34))
               |x| (QREFELT $ 35))
              (QREFELT $ 36))
             (QREFELT $ 16))
            (QREFELT $ 37))
           (QREFELT $ 34))
          (QREFELT $ 13) (QREFELT $ 40))
         (QREFELT $ 42))) 

(SDEFUN |ALGMANIP;rootSplit;2F;8| ((|x| F) ($ F))
        (SPROG
         ((#1=#:G740 NIL) (|k| NIL) (#2=#:G739 NIL)
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
                     (QREFELT $ 45)))))) 

(SDEFUN |ALGMANIP;rootExpand| ((|k| |Kernel| F) ($ F))
        (SPROG ((|op| (|BasicOperator|)) (|n| (F)) (|x| (F)))
               (SEQ
                (LETT |x| (|SPADfirst| (SPADCALL |k| (QREFELT $ 47)))
                      . #1=(|ALGMANIP;rootExpand|))
                (LETT |n|
                      (SPADCALL (SPADCALL |k| (QREFELT $ 47)) (QREFELT $ 48))
                      . #1#)
                (LETT |op| (SPADCALL |k| (QREFELT $ 25)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL |op|
                            (SPADCALL (SPADCALL |x| (QREFELT $ 49))
                                      (QREFELT $ 34))
                            |n| (QREFELT $ 50))
                  (SPADCALL |op|
                            (SPADCALL (SPADCALL |x| (QREFELT $ 37))
                                      (QREFELT $ 34))
                            |n| (QREFELT $ 50))
                  (QREFELT $ 51)))))) 

(SDEFUN |ALGMANIP;innerRF| ((|x| F) (|ll| |List| (|Kernel| F)) ($ F))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| F)) (#1=#:G791 NIL) (|kk| NIL)
          (#2=#:G790 NIL) (#3=#:G786 NIL) (#4=#:G787 NIL) (#5=#:G789 NIL)
          (#6=#:G788 NIL) (|l| (|List| (|Kernel| F)))
          (|lk| (|List| (|Kernel| F))) (|k| (|Kernel| F)))
         (SEQ
          (EXIT
           (COND
            ((OR
              (NULL
               (LETT |l|
                     (SPADCALL (ELT $ 52) (SPADCALL |x| (QREFELT $ 53))
                               (QREFELT $ 55))
                     . #7=(|ALGMANIP;innerRF|)))
              (NULL
               (SPADCALL |ll| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 56))))
             |x|)
            ('T
             (SEQ (LETT |lk| NIL . #7#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (NULL
                           (SPADCALL (LETT |k| (|SPADfirst| |l|) . #7#) |ll|
                                     (QREFELT $ 57))))
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
                                                                              59))
                                                                    #6#)
                                                                   . #7#)))
                                                           (LETT #5# (CDR #5#)
                                                                 . #7#)
                                                           (GO G190) G191
                                                           (EXIT
                                                            (NREVERSE #6#))))
                                                         (QREFELT $ 45))
                                               . #7#)
                                         (GO #8=#:G785))
                                        . #7#)
                                  (GO #9=#:G750)))))))
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
                                                   |kk| (QREFELT $ 59))
                                                  #2#)
                                                 . #7#)))
                                         (LETT #1# (CDR #1#) . #7#) (GO G190)
                                         G191 (EXIT (NREVERSE #2#))))
                                   (QREFELT $ 45))
                         |k| (SPADCALL |k| (QREFELT $ 61)) (QREFELT $ 62))
                        . #7#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL (CONS #'|ALGMANIP;innerRF!2| (VECTOR $ |ll|)) |q|
                              (QREFELT $ 64))
                    (SPADCALL (CONS #'|ALGMANIP;innerRF!3| (VECTOR $ |ll|)) |k|
                              (QREFELT $ 59))
                    (QREFELT $ 65)))))))
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
         ((|res| (F)) (|rr| (F)) (|ce| (|NonNegativeInteger|)) (#1=#:G808 NIL)
          (|ne| (|NonNegativeInteger|)) (#2=#:G807 NIL) (#3=#:G805 NIL)
          (|nn| (|Integer|)) (|ng| (|NonNegativeInteger|)) (#4=#:G803 NIL)
          (#5=#:G813 NIL) (|fr| NIL)
          (|u| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ (LETT |res| (|spadConstant| $ 67) . #6=(|ALGMANIP;fp_root|))
              (COND
               ((SPADCALL (LETT |u| (SPADCALL |fp| (QREFELT $ 69)) . #6#)
                          (|spadConstant| $ 71) (QREFELT $ 72))
                (LETT |res|
                      (SPADCALL |op|
                                (LIST (SPADCALL |u| (QREFELT $ 73))
                                      (SPADCALL |n| (QREFELT $ 75)))
                                (QREFELT $ 76))
                      . #6#)))
              (SEQ (LETT |fr| NIL . #6#)
                   (LETT #5# (SPADCALL |fp| (QREFELT $ 79)) . #6#) G190
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
                              (LETT #3# (SPADCALL |n| |ng| (QREFELT $ 82))
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
                                                        (QREFELT $ 82))
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
                           ((SPADCALL |nn| 1 (QREFELT $ 83))
                            (SPADCALL |op|
                                      (LIST
                                       (SPADCALL
                                        (SPADCALL (QCAR |fr|) |ne|
                                                  (QREFELT $ 84))
                                        (QREFELT $ 73))
                                       (SPADCALL |nn| (QREFELT $ 75)))
                                      (QREFELT $ 76)))
                           ('T (|spadConstant| $ 67)))
                          . #6#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL |res|
                                      (SPADCALL
                                       (SPADCALL (QCAR |fr|) |ce|
                                                 (QREFELT $ 84))
                                       (QREFELT $ 73))
                                      (QREFELT $ 85))
                            |rr| (QREFELT $ 85))
                           . #6#)))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |ALGMANIP;pol_root|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         (|op| |BasicOperator|) (|n| |NonNegativeInteger|) ($ F))
        (SPROG
         ((|pp| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (#1=#:G815 NIL) (|cp| (R)))
         (SEQ
          (LETT |cp| (SPADCALL |p| (QREFELT $ 86)) . #2=(|ALGMANIP;pol_root|))
          (SPADCALL |cp| (QREFELT $ 87))
          (LETT |pp|
                (PROG2
                    (LETT #1#
                          (SPADCALL |p| (SPADCALL |cp| (QREFELT $ 88))
                                    (QREFELT $ 89))
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
            (|ALGMANIP;fp_root| (SPADCALL |pp| (QREFELT $ 90)) |op| |n| $)
            (|ALGMANIP;fp_root|
             (SPADCALL (ELT $ 88) (SPADCALL |cp| (QREFELT $ 92))
                       (QREFELT $ 96))
             |op| |n| $)
            (QREFELT $ 85)))))) 

(SDEFUN |ALGMANIP;root_factor_k| ((|k| |Kernel| F) ($ F))
        (SPROG
         ((|op| (|BasicOperator|)) (|n| (|NonNegativeInteger|)) (#1=#:G819 NIL)
          (|nf| (F)) (|x| (F)))
         (SEQ
          (LETT |x| (|SPADfirst| (SPADCALL |k| (QREFELT $ 47)))
                . #2=(|ALGMANIP;root_factor_k|))
          (LETT |nf| (SPADCALL (SPADCALL |k| (QREFELT $ 47)) (QREFELT $ 48))
                . #2#)
          (LETT |n|
                (PROG1 (LETT #1# (SPADCALL |nf| (QREFELT $ 97)) . #2#)
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#))
                . #2#)
          (LETT |op| (SPADCALL |k| (QREFELT $ 25)) . #2#)
          (EXIT
           (SPADCALL
            (|ALGMANIP;pol_root| (SPADCALL |x| (QREFELT $ 49)) |op| |n| $)
            (|ALGMANIP;pol_root| (SPADCALL |x| (QREFELT $ 37)) |op| |n| $)
            (QREFELT $ 51)))))) 

(SDEFUN |ALGMANIP;rootFactor;2F;14| ((|x| F) ($ F))
        (SPROG
         ((#1=#:G826 NIL) (|k| NIL) (#2=#:G825 NIL)
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
                     (QREFELT $ 45)))))) 

(SDEFUN |ALGMANIP;rootKerSimp;BoFNniF;15|
        ((|op| |BasicOperator|) (|x| F) (|n| |NonNegativeInteger|) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 100))
                      |ALGMANIP;rootKerSimp;BoFNniF;15|)
                (EXIT
                 (COND
                  ((QEQCAR |r| 0)
                   (SPADCALL (SPADCALL (QCDR |r|) |n| (QREFELT $ 101))
                             (QREFELT $ 87)))
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
          (|same| #1#) (|arg| (|List| F)) (#2=#:G840 NIL) (|kk| NIL)
          (|n| (|Integer|)) (|a| (F)) (|k| (|Kernel| F)))
         (SEQ
          (COND ((NULL |l|) NIL)
                ('T
                 (SEQ (LETT |k| (|SPADfirst| |l|) . #3=(|ALGMANIP;breakup|))
                      (LETT |a|
                            (|SPADfirst|
                             (LETT |arg|
                                   (SPADCALL (LETT |k| (|SPADfirst| |l|) . #3#)
                                             (QREFELT $ 47))
                                   . #3#))
                            . #3#)
                      (LETT |n|
                            (SPADCALL (SPADCALL |arg| (QREFELT $ 48))
                                      (QREFELT $ 97))
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
                                                (SPADCALL |kk| (QREFELT $ 47))
                                                . #3#))
                                         (QREFELT $ 103))
                               (SEQ (LETT |same| (CONS |kk| |same|) . #3#)
                                    (EXIT
                                     (LETT |expo|
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |arg| (QREFELT $ 48))
                                             (QREFELT $ 97))
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
         ((|lv| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (#1=#:G842 NIL) (#2=#:G851 NIL) (|m| NIL) (#3=#:G850 NIL)
          (|k| (|Kernel| F)) (|n| (|Integer|))
          (|dx| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|nx| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|k0| (|Kernel| F)) (|l| (|List| (|Kernel| F))) (#4=#:G849 NIL)
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
                (LETT |nx| (SPADCALL |x| (QREFELT $ 49)) . #5#)
                (LETT |dx| (SPADCALL |x| (QREFELT $ 37)) . #5#)
                (EXIT
                 (COND
                  ((NULL (CDR |l|))
                   (LETT |x|
                         (SPADCALL (|ALGMANIP;radeval| |nx| |k0| $)
                                   (|ALGMANIP;radeval| |dx| |k0| $)
                                   (QREFELT $ 51))
                         . #5#))
                  ('T
                   (SEQ
                    (LETT |n| (SPADCALL (QCDR |rec|) (QREFELT $ 104)) . #5#)
                    (LETT |k|
                          (SPADCALL (SPADCALL |k0| (QREFELT $ 25))
                                    (LIST
                                     (|SPADfirst|
                                      (SPADCALL |k0| (QREFELT $ 47)))
                                     (SPADCALL |n| (QREFELT $ 75)))
                                    (SPADCALL |k0| (QREFELT $ 105))
                                    (QREFELT $ 106))
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
                                         (SPADCALL (|spadConstant| $ 71) |k|
                                                   (PROG1
                                                       (LETT #1#
                                                             (QUOTIENT2 |n|
                                                                        |m|)
                                                             . #5#)
                                                     (|check_subtype2|
                                                      (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                                   (QREFELT $ 107))
                                         #3#)
                                        . #5#)))
                                (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #3#))))
                          . #5#)
                    (EXIT
                     (LETT |x|
                           (SPADCALL
                            (|ALGMANIP;radeval|
                             (SPADCALL |nx| |l| |lv| (QREFELT $ 108)) |k| $)
                            (|ALGMANIP;radeval|
                             (SPADCALL |dx| |l| |lv| (QREFELT $ 108)) |k| $)
                            (QREFELT $ 51))
                           . #5#)))))))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |ALGMANIP;rootPower;2F;19| ((|x| F) ($ F))
        (SPROG ((#1=#:G855 NIL) (|k| NIL))
               (SEQ
                (SEQ (LETT |k| NIL . #2=(|ALGMANIP;rootPower;2F;19|))
                     (LETT #1#
                           (|ALGMANIP;rootkernels|
                            (SPADCALL |x| (QREFELT $ 15)) $)
                           . #2#)
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |x|
                             (SPADCALL
                              (|ALGMANIP;radeval| (SPADCALL |x| (QREFELT $ 49))
                               |k| $)
                              (|ALGMANIP;radeval| (SPADCALL |x| (QREFELT $ 37))
                               |k| $)
                              (QREFELT $ 51))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |ALGMANIP;radeval|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) (|k| |Kernel| F)
         ($ F))
        (SPROG
         ((|q|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|ans| (F)) (|term| (F)) (|g| (|NonNegativeInteger|))
          (|d| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|))
          (#1=#:G856 NIL) (|a| (F)) (|arg| (|List| F)))
         (SEQ
          (LETT |a|
                (|SPADfirst|
                 (LETT |arg| (SPADCALL |k| (QREFELT $ 47))
                       . #2=(|ALGMANIP;radeval|)))
                . #2#)
          (LETT |n|
                (PROG1
                    (LETT #1#
                          (SPADCALL (SPADCALL |arg| (QREFELT $ 48))
                                    (QREFELT $ 97))
                          . #2#)
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#))
                . #2#)
          (LETT |ans| (|spadConstant| $ 111) . #2#)
          (LETT |q| (SPADCALL |p| |k| (QREFELT $ 112)) . #2#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (LETT |d| (SPADCALL |q| (QREFELT $ 114)) . #2#) 0
                            (QREFELT $ 115)))
                 (GO G191)))
               (SEQ
                (LETT |term|
                      (SEQ (LETT |g| (GCD |d| |n|) . #2#)
                           (EXIT
                            (COND
                             ((EQL |g| |n|)
                              (SPADCALL |a| (QUOTIENT2 |d| |g|)
                                        (QREFELT $ 116)))
                             ((EQL |g| 1)
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 71) |k| |d|
                                         (QREFELT $ 107))
                               (QREFELT $ 73)))
                             ('T
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 71)
                                         (SPADCALL
                                          (SPADCALL |k| (QREFELT $ 25))
                                          (LIST |a|
                                                (SPADCALL (QUOTIENT2 |n| |g|)
                                                          (QREFELT $ 75)))
                                          (SPADCALL |k| (QREFELT $ 105))
                                          (QREFELT $ 106))
                                         (QUOTIENT2 |d| |g|) (QREFELT $ 107))
                               (QREFELT $ 73))))))
                      . #2#)
                (LETT |ans|
                      (SPADCALL |ans|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |q| (QREFELT $ 117))
                                           (QREFELT $ 73))
                                 |term| (QREFELT $ 85))
                                (QREFELT $ 118))
                      . #2#)
                (EXIT (LETT |q| (SPADCALL |q| (QREFELT $ 119)) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 117)) (QREFELT $ 73))
                     |ans| (QREFELT $ 118)))))) 

(SDEFUN |ALGMANIP;inroot|
        ((|op| |BasicOperator|) (|x| F) (|n| |NonNegativeInteger|) ($ F))
        (SPROG
         ((#1=#:G890 NIL)
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
          (#2=#:G894 NIL)
          (|num| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ
          (COND ((SPADCALL |x| (|spadConstant| $ 67) (QREFELT $ 103)) |x|)
                (#3='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (COND
                     ((SPADCALL |x|
                                (SPADCALL (|spadConstant| $ 67)
                                          (QREFELT $ 120))
                                (QREFELT $ 121))
                      (SEQ
                       (LETT |num| (SPADCALL |x| (QREFELT $ 49))
                             . #4=(|ALGMANIP;inroot|))
                       (EXIT
                        (COND
                         ((OR
                           (SPADCALL |num| (|spadConstant| $ 71)
                                     (QREFELT $ 122))
                           (SPADCALL |num|
                                     (SPADCALL (|spadConstant| $ 71)
                                               (QREFELT $ 124))
                                     (QREFELT $ 122)))
                          (PROGN
                           (LETT #2#
                                 (SPADCALL
                                  (|ALGMANIP;inroot| |op|
                                   (SPADCALL
                                    (SPADCALL |num|
                                              (SPADCALL |x| (QREFELT $ 37))
                                              (QREFELT $ 123))
                                    (QREFELT $ 73))
                                   |n| $)
                                  (QREFELT $ 36))
                                 . #4#)
                           (GO #5=#:G892))))))))
                    (LETT |u| (SPADCALL |x| |op| (QREFELT $ 127)) . #4#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 1)
                       (SPADCALL |op| (LIST |x| (SPADCALL |n| (QREFELT $ 75)))
                                 (QREFELT $ 76)))
                      (#3#
                       (SEQ (LETT |pr| (QCDR |u|) . #4#)
                            (LETT |q|
                                  (SPADCALL (QCDR |pr|)
                                            (SPADCALL |n|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL (QCAR |pr|)
                                                                  (QREFELT $
                                                                           47))
                                                        (QREFELT $ 48))
                                                       (QREFELT $ 97))
                                                      (QREFELT $ 128))
                                            (QREFELT $ 130))
                                  . #4#)
                            (LETT |qr|
                                  (DIVIDE2 (SPADCALL |q| (QREFELT $ 131))
                                           (SPADCALL |q| (QREFELT $ 132)))
                                  . #4#)
                            (LETT |x|
                                  (|SPADfirst|
                                   (SPADCALL (QCAR |pr|) (QREFELT $ 47)))
                                  . #4#)
                            (EXIT
                             (SPADCALL
                              (SPADCALL |x| (QCAR |qr|) (QREFELT $ 133))
                              (SPADCALL
                               (SPADCALL |op| |x|
                                         (PROG1
                                             (LETT #1#
                                                   (SPADCALL |q|
                                                             (QREFELT $ 132))
                                                   . #4#)
                                           (|check_subtype2| (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #1#))
                                         (QREFELT $ 102))
                               (QCDR |qr|) (QREFELT $ 133))
                              (QREFELT $ 85)))))))))
                  #5# (EXIT #2#))))))) 

(SDEFUN |ALGMANIP;sroot| ((|k| |Kernel| F) ($ F))
        (SPROG
         ((|pr|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (#1=#:G895 NIL) (|arg| (|List| F)))
         (SEQ
          (LETT |pr|
                (SPADCALL
                 (|SPADfirst|
                  (LETT |arg| (SPADCALL |k| (QREFELT $ 47))
                        . #2=(|ALGMANIP;sroot|)))
                 (PROG1
                     (LETT #1#
                           (SPADCALL (SPADCALL |arg| (QREFELT $ 48))
                                     (QREFELT $ 97))
                           . #2#)
                   (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #1#))
                 (QREFELT $ 136))
                . #2#)
          (EXIT
           (SPADCALL (QVELT |pr| 1)
                     (SPADCALL (SPADCALL |k| (QREFELT $ 25)) (QVELT |pr| 2)
                               (QVELT |pr| 0) (QREFELT $ 102))
                     (QREFELT $ 85)))))) 

(SDEFUN |ALGMANIP;rootSimp;2F;23| ((|x| F) ($ F))
        (SPROG
         ((#1=#:G903 NIL) (|k| NIL) (#2=#:G902 NIL)
          (|lk| (|List| (|Kernel| F))))
         (SEQ
          (LETT |lk| (|ALGMANIP;rootkernels| (SPADCALL |x| (QREFELT $ 15)) $)
                . #3=(|ALGMANIP;rootSimp;2F;23|))
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
                             (LETT #2# (CONS (|ALGMANIP;sroot| |k| $) #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 45)))))) 

(DECLAIM (NOTINLINE |AlgebraicManipulations;|)) 

(DEFUN |AlgebraicManipulations| (&REST #1=#:G904)
  (SPROG NIL
         (PROG (#2=#:G905)
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
          (LETT $ (GETREFV 138) . #1#)
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
                      (QSETREFV $ 66
                                (|GeneralizedMultivariateFactorize|
                                 (|Kernel| |#2|)
                                 (|IndexedExponents| (|Kernel| |#2|)) |#1| |#1|
                                 (|SparseMultivariatePolynomial| |#1|
                                                                 (|Kernel|
                                                                  |#2|))))
                      (QSETREFV $ 98
                                (CONS
                                 (|dispatchFunction|
                                  |ALGMANIP;rootFactor;2F;14|)
                                 $)))))
                   (COND
                    ((|HasCategory| |#1| '(|RadicalCategory|))
                     (QSETREFV $ 102
                               (CONS
                                (|dispatchFunction|
                                 |ALGMANIP;rootKerSimp;BoFNniF;15|)
                                $)))
                    ('T
                     (QSETREFV $ 102
                               (CONS
                                (|dispatchFunction|
                                 |ALGMANIP;rootKerSimp;BoFNniF;16|)
                                $))))
                   (QSETREFV $ 109
                             (CONS
                              (|dispatchFunction| |ALGMANIP;rootProduct;2F;18|)
                              $))
                   (QSETREFV $ 110
                             (CONS
                              (|dispatchFunction| |ALGMANIP;rootPower;2F;19|)
                              $))
                   (QSETREFV $ 137
                             (CONS
                              (|dispatchFunction| |ALGMANIP;rootSimp;2F;23|)
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
              (|Mapping| 26 11) (30 . |select!|) (36 . |is?|)
              (|SparseMultivariatePolynomial| 6 11) (42 . |coerce|)
              (|SparseMultivariatePolynomial| 6 22) (47 . |coerce|) (52 . -)
              (58 . |inv|) (63 . |denom|) (|Fraction| 41)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 11) 11
                                                     6 31 7)
              (68 . |univariate|) (|SparseUnivariatePolynomial| 7)
              (74 . |numer|) |ALGMANIP;ratPoly;FSup;7| (|List| $) (79 . |eval|)
              |ALGMANIP;rootSplit;2F;8| (86 . |argument|) (91 . |second|)
              (96 . |numer|) (101 . |elt|) (108 . /) (114 . >)
              (120 . |kernels|) (|Mapping| 26 11 11) (125 . |sort!|)
              (131 . |setIntersection|) (137 . |member?|) (|Mapping| $ $)
              (143 . |map|) (|SparseUnivariatePolynomial| $) (149 . |minPoly|)
              (154 . |univariate|) (|Mapping| 7 7) (161 . |map|) (167 . |elt|)
              '|MPfact| (173 . |One|) (|Factored| 31) (177 . |unit|)
              (182 . |One|) (186 . |One|) (190 . ~=) (196 . |coerce|)
              (|Integer|) (201 . |coerce|) (206 . |kernel|)
              (|Record| (|:| |factor| 31) (|:| |exponent| 74)) (|List| 77)
              (212 . |factors|) (|Union| $ '"failed") (|NonNegativeInteger|)
              (217 . |exquo|) (223 . >) (229 . ^) (235 . *) (241 . |content|)
              (246 . |coerce|) (251 . |coerce|) (256 . |exquo|)
              (262 . |factor|) (|Factored| $) (267 . |factor|) (|Mapping| 31 6)
              (|Factored| 6) (|FactoredFunctions2| 6 31) (272 . |map|)
              (278 . |retract|) (283 . |rootFactor|) (|Union| 6 '"failed")
              (288 . |retractIfCan|) (293 . |nthRoot|) (299 . |rootKerSimp|)
              (306 . =) (312 . |lcm|) (317 . |height|) (322 . |kernel|)
              (329 . |monomial|) (336 . |eval|) (343 . |rootProduct|)
              (348 . |rootPower|) (353 . |Zero|) (357 . |univariate|)
              (|SparseUnivariatePolynomial| 31) (363 . |degree|) (368 . >)
              (374 . ^) (380 . |leadingCoefficient|) (385 . +)
              (391 . |reductum|) (396 . -) (401 . ~=) (407 . =) (413 . *)
              (419 . -) (|Record| (|:| |var| 22) (|:| |exponent| 74))
              (|Union| 125 '"failed") (424 . |isExpt|) (430 . *)
              (|Fraction| 74) (436 . /) (442 . |numer|) (447 . |denom|)
              (452 . ^)
              (|Record| (|:| |exponent| 81) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 11) 11 6 31 7)
              (458 . |froot|) (464 . |rootSimp|))
           '#(|rootSplit| 469 |rootSimp| 474 |rootProduct| 479 |rootPower| 484
              |rootKerSimp| 489 |rootFactor| 496 |ratPoly| 501 |ratDenom| 506)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 137
                                                 '(0 9 0 10 1 11 0 9 12 1 7 14
                                                   0 15 1 7 22 0 23 1 11 24 0
                                                   25 2 24 26 0 9 27 2 17 0 28
                                                   0 29 2 24 26 0 9 30 1 31 0
                                                   11 32 1 7 0 33 34 2 7 0 0 0
                                                   35 1 7 0 0 36 1 7 33 0 37 2
                                                   39 38 7 11 40 1 38 41 0 42 3
                                                   7 0 0 14 44 45 1 11 19 0 47
                                                   1 19 7 0 48 1 7 33 0 49 3 7
                                                   0 24 0 0 50 2 7 0 0 0 51 2
                                                   11 26 0 0 52 1 7 14 0 53 2
                                                   17 0 54 0 55 2 17 0 0 0 56 2
                                                   17 26 11 0 57 2 7 0 58 22 59
                                                   1 7 60 22 61 3 39 41 7 11 41
                                                   62 2 41 0 63 0 64 2 41 7 0 7
                                                   65 0 7 0 67 1 68 31 0 69 0 6
                                                   0 70 0 31 0 71 2 31 26 0 0
                                                   72 1 7 0 33 73 1 7 0 74 75 2
                                                   7 0 24 44 76 1 68 78 0 79 2
                                                   81 80 0 0 82 2 74 26 0 0 83
                                                   2 31 0 0 81 84 2 7 0 0 0 85
                                                   1 31 6 0 86 1 7 0 6 87 1 31
                                                   0 6 88 2 31 80 0 0 89 1 66
                                                   68 31 90 1 6 91 0 92 2 95 68
                                                   93 94 96 1 7 74 0 97 1 0 7 7
                                                   98 1 7 99 0 100 2 6 0 0 74
                                                   101 3 0 7 24 7 81 102 2 7 26
                                                   0 0 103 1 74 0 44 104 1 11
                                                   81 0 105 3 11 0 24 19 81 106
                                                   3 31 0 0 11 81 107 3 31 0 0
                                                   17 44 108 1 0 7 7 109 1 0 7
                                                   7 110 0 7 0 111 2 31 60 0 11
                                                   112 1 113 81 0 114 2 81 26 0
                                                   0 115 2 7 0 0 81 116 1 113
                                                   31 0 117 2 7 0 0 0 118 1 113
                                                   0 0 119 1 7 0 0 120 2 7 26 0
                                                   0 121 2 31 26 0 0 122 2 31 0
                                                   0 0 123 1 31 0 0 124 2 7 126
                                                   0 24 127 2 74 0 81 0 128 2
                                                   129 0 74 74 130 1 129 74 0
                                                   131 1 129 74 0 132 2 7 0 0
                                                   74 133 2 135 134 7 81 136 1
                                                   0 7 7 137 1 0 7 7 46 1 1 7 7
                                                   137 1 1 7 7 109 1 1 7 7 110
                                                   3 1 7 24 7 81 102 1 2 7 7 98
                                                   1 0 41 7 43 1 0 7 7 16 2 0 7
                                                   7 7 21 2 0 7 7 17 18 2 0 7 7
                                                   19 20)))))
           '|lookupComplete|)) 
