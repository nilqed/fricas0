
(SDEFUN |ES-;box;2S;1| ((|x| S) ($ S)) (SPADCALL (LIST |x|) (QREFELT $ 15))) 

(SDEFUN |ES-;paren;2S;2| ((|x| S) ($ S)) (SPADCALL (LIST |x|) (QREFELT $ 17))) 

(SDEFUN |ES-;belong?;BoB;3| ((|op| |BasicOperator|) ($ |Boolean|))
        (COND
         ((SPADCALL |op| '|any| (QREFELT $ 20))
          (COND ((SPADCALL |op| '|%paren| (QREFELT $ 21)) 'T)
                (#1='T (SPADCALL |op| '|%box| (QREFELT $ 21)))))
         (#1# NIL))) 

(SDEFUN |ES-;listk| ((|f| S) ($ |List| (|Kernel| S)))
        (SPADCALL (|ES-;allKernels| |f| $) (QREFELT $ 25))) 

(SDEFUN |ES-;tower;SL;5| ((|f| S) ($ |List| (|Kernel| S)))
        (SPADCALL (|ES-;listk| |f| $) (QREFELT $ 26))) 

(SDEFUN |ES-;allk| ((|l| |List| S) ($ |Set| (|Kernel| S)))
        (SPROG ((#1=#:G748 NIL) (|f| NIL) (#2=#:G747 NIL))
               (SEQ
                (SPADCALL (ELT $ 29)
                          (PROGN
                           (LETT #2# NIL . #3=(|ES-;allk|))
                           (SEQ (LETT |f| NIL . #3#) (LETT #1# |l| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2# (CONS (|ES-;allKernels| |f| $) #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (SPADCALL (QREFELT $ 30)) (QREFELT $ 33))))) 

(SDEFUN |ES-;tower;LL;7| ((|lf| |List| S) ($ |List| (|Kernel| S)))
        (SPADCALL (SPADCALL (|ES-;allk| |lf| $) (QREFELT $ 25)) (QREFELT $ 26))) 

(SDEFUN |ES-;kernels;LL;8| ((|lf| |List| S) ($ |List| (|Kernel| S)))
        (SPROG ((#1=#:G762 NIL) (|f| NIL) (#2=#:G761 NIL))
               (SEQ
                (SPADCALL (ELT $ 35)
                          (PROGN
                           (LETT #2# NIL . #3=(|ES-;kernels;LL;8|))
                           (SEQ (LETT |f| NIL . #3#) (LETT #1# |lf| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |f| (QREFELT $ 36))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          NIL (QREFELT $ 39))))) 

(SDEFUN |ES-;operators;SL;9| ((|f| S) ($ |List| (|BasicOperator|)))
        (SPROG ((#1=#:G767 NIL) (|k| NIL) (#2=#:G766 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|ES-;operators;SL;9|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# (|ES-;listk| |f| $) . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |k| (QREFELT $ 42)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |ES-;height;SNni;10| ((|f| S) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G773 NIL) (|k| NIL) (#2=#:G772 NIL))
               (SEQ
                (SPADCALL (ELT $ 46)
                          (PROGN
                           (LETT #2# NIL . #3=(|ES-;height;SNni;10|))
                           (SEQ (LETT |k| NIL . #3#)
                                (LETT #1# (SPADCALL |f| (QREFELT $ 36)) . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |k| (QREFELT $ 47))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          0 (QREFELT $ 50))))) 

(SDEFUN |ES-;freeOf?;SSB;11| ((|x| S) (|s| |Symbol|) ($ |Boolean|))
        (SPROG ((#1=#:G778 NIL) (|k| NIL) (#2=#:G777 NIL))
               (SEQ
                (NULL
                 (SPADCALL |s|
                           (PROGN
                            (LETT #2# NIL . #3=(|ES-;freeOf?;SSB;11|))
                            (SEQ (LETT |k| NIL . #3#)
                                 (LETT #1# (|ES-;listk| |x| $) . #3#) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS (SPADCALL |k| (QREFELT $ 52))
                                               #2#)
                                         . #3#)))
                                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 54)))))) 

(SDEFUN |ES-;distribute;2S;12| ((|x| S) ($ S))
        (SPROG ((#1=#:G783 NIL) (|k| NIL) (#2=#:G782 NIL))
               (SEQ
                (|ES-;unwrap|
                 (PROGN
                  (LETT #2# NIL . #3=(|ES-;distribute;2S;12|))
                  (SEQ (LETT |k| NIL . #3#)
                       (LETT #1# (|ES-;listk| |x| $) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((COND
                            ((SPADCALL |k| (QREFELT $ 12) (QREFELT $ 56)) 'T)
                            ('T (SPADCALL |k| (QREFELT $ 13) (QREFELT $ 56))))
                           (LETT #2# (CONS |k| #2#) . #3#)))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |x| $)))) 

(SDEFUN |ES-;box;LS;13| ((|l| |List| S) ($ S))
        (SPADCALL (QREFELT $ 13) |l| (QREFELT $ 58))) 

(SDEFUN |ES-;paren;LS;14| ((|l| |List| S) ($ S))
        (SPADCALL (QREFELT $ 12) |l| (QREFELT $ 58))) 

(SDEFUN |ES-;freeOf?;2SB;15| ((|x| S) (|k| S) ($ |Boolean|))
        (NULL
         (SPADCALL (SPADCALL |k| (QREFELT $ 62)) (|ES-;listk| |x| $)
                   (QREFELT $ 63)))) 

(SDEFUN |ES-;kernel;Bo2S;16| ((|op| |BasicOperator|) (|arg| S) ($ S))
        (SPADCALL |op| (LIST |arg|) (QREFELT $ 65))) 

(SDEFUN |ES-;elt;Bo2S;17| ((|op| |BasicOperator|) (|x| S) ($ S))
        (SPADCALL |op| (LIST |x|) (QREFELT $ 58))) 

(SDEFUN |ES-;elt;Bo3S;18| ((|op| |BasicOperator|) (|x| S) (|y| S) ($ S))
        (SPADCALL |op| (LIST |x| |y|) (QREFELT $ 58))) 

(SDEFUN |ES-;elt;Bo4S;19|
        ((|op| |BasicOperator|) (|x| S) (|y| S) (|z| S) ($ S))
        (SPADCALL |op| (LIST |x| |y| |z|) (QREFELT $ 58))) 

(SDEFUN |ES-;elt;Bo5S;20|
        ((|op| |BasicOperator|) (|x| S) (|y| S) (|z| S) (|t| S) ($ S))
        (SPADCALL |op| (LIST |x| |y| |z| |t|) (QREFELT $ 58))) 

(SDEFUN |ES-;elt;Bo6S;21|
        ((|op| |BasicOperator|) (|x| S) (|y| S) (|z| S) (|t| S) (|s| S) ($ S))
        (SPADCALL |op| (LIST |x| |y| |z| |t| |s|) (QREFELT $ 58))) 

(SDEFUN |ES-;elt;Bo7S;22|
        ((|op| |BasicOperator|) (|x| S) (|y| S) (|z| S) (|t| S) (|s| S) (|r| S)
         ($ S))
        (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r|) (QREFELT $ 58))) 

(SDEFUN |ES-;elt;Bo8S;23|
        ((|op| |BasicOperator|) (|x| S) (|y| S) (|z| S) (|t| S) (|s| S) (|r| S)
         (|q| S) ($ S))
        (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r| |q|) (QREFELT $ 58))) 

(SDEFUN |ES-;elt;Bo9S;24|
        ((|op| |BasicOperator|) (|x| S) (|y| S) (|z| S) (|t| S) (|s| S) (|r| S)
         (|q| S) (|p| S) ($ S))
        (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r| |q| |p|) (QREFELT $ 58))) 

(SDEFUN |ES-;elt;Bo10S;25|
        ((|op| |BasicOperator|) (|x| S) (|y| S) (|z| S) (|t| S) (|s| S) (|r| S)
         (|q| S) (|p| S) (|o| S) ($ S))
        (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r| |q| |p| |o|)
                  (QREFELT $ 58))) 

(SDEFUN |ES-;eval;SSMS;26|
        ((|x| S) (|s| |Symbol|) (|f| |Mapping| S (|List| S)) ($ S))
        (SPADCALL |x| (LIST |s|) (LIST |f|) (QREFELT $ 78))) 

(SDEFUN |ES-;eval;SBoMS;27|
        ((|x| S) (|s| |BasicOperator|) (|f| |Mapping| S (|List| S)) ($ S))
        (SPADCALL |x| (LIST (SPADCALL |s| (QREFELT $ 80))) (LIST |f|)
                  (QREFELT $ 78))) 

(SDEFUN |ES-;eval;SSMS;28| ((|x| S) (|s| |Symbol|) (|f| |Mapping| S S) ($ S))
        (SPROG NIL
               (SPADCALL |x| (LIST |s|)
                         (LIST (CONS #'|ES-;eval;SSMS;28!0| (VECTOR |f| $)))
                         (QREFELT $ 78)))) 

(SDEFUN |ES-;eval;SSMS;28!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1) . #1=(|ES-;eval;SSMS;28|))
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 83)) |f|))))) 

(SDEFUN |ES-;eval;SBoMS;29|
        ((|x| S) (|s| |BasicOperator|) (|f| |Mapping| S S) ($ S))
        (SPROG NIL
               (SPADCALL |x| (LIST |s|)
                         (LIST (CONS #'|ES-;eval;SBoMS;29!0| (VECTOR |f| $)))
                         (QREFELT $ 86)))) 

(SDEFUN |ES-;eval;SBoMS;29!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1) . #1=(|ES-;eval;SBoMS;29|))
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 83)) |f|))))) 

(SDEFUN |ES-;subst;SES;30| ((|x| S) (|e| |Equation| S) ($ S))
        (SPADCALL |x| (LIST |e|) (QREFELT $ 89))) 

(SDEFUN |ES-;eval;SLLS;31|
        ((|x| S) (|ls| |List| (|BasicOperator|)) (|lf| |List| (|Mapping| S S))
         ($ S))
        (SPROG ((#1=#:G829 NIL) (|f| NIL) (#2=#:G828 NIL))
               (SEQ
                (SPADCALL |x| |ls|
                          (PROGN
                           (LETT #2# NIL . #3=(|ES-;eval;SLLS;31|))
                           (SEQ (LETT |f| NIL . #3#) (LETT #1# |lf| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (CONS #'|ES-;eval;SLLS;31!0|
                                               (VECTOR |f| $))
                                         #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 86))))) 

(SDEFUN |ES-;eval;SLLS;31!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1) . #1=(|ES-;eval;SLLS;31|))
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 83)) |f|))))) 

(SDEFUN |ES-;eval;SLLS;32|
        ((|x| S) (|ls| |List| (|Symbol|)) (|lf| |List| (|Mapping| S S)) ($ S))
        (SPROG ((#1=#:G834 NIL) (|f| NIL) (#2=#:G833 NIL))
               (SEQ
                (SPADCALL |x| |ls|
                          (PROGN
                           (LETT #2# NIL . #3=(|ES-;eval;SLLS;32|))
                           (SEQ (LETT |f| NIL . #3#) (LETT #1# |lf| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (CONS #'|ES-;eval;SLLS;32!0|
                                               (VECTOR |f| $))
                                         #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 78))))) 

(SDEFUN |ES-;eval;SLLS;32!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1) . #1=(|ES-;eval;SLLS;32|))
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 83)) |f|))))) 

(SDEFUN |ES-;eval;SLLS;33|
        ((|x| S) (|ls| |List| (|BasicOperator|))
         (|lf| |List| (|Mapping| S (|List| S))) ($ S))
        (SPROG ((#1=#:G839 NIL) (|s| NIL) (#2=#:G838 NIL))
               (SEQ
                (SPADCALL |x|
                          (PROGN
                           (LETT #2# NIL . #3=(|ES-;eval;SLLS;33|))
                           (SEQ (LETT |s| NIL . #3#) (LETT #1# |ls| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |s| (QREFELT $ 80))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          |lf| (QREFELT $ 78))))) 

(SDEFUN |ES-;map;MKS;34| ((|fn| |Mapping| S S) (|k| |Kernel| S) ($ S))
        (SPROG ((|l| (|List| S)) (#1=#:G872 NIL) (|x| NIL) (#2=#:G871 NIL))
               (SEQ
                (COND
                 ((SPADCALL
                   (LETT |l|
                         (PROGN
                          (LETT #2# NIL . #3=(|ES-;map;MKS;34|))
                          (SEQ (LETT |x| NIL . #3#)
                               (LETT #1# (SPADCALL |k| (QREFELT $ 96)) . #3#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2# (CONS (SPADCALL |x| |fn|) #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         . #3#)
                   (SPADCALL |k| (QREFELT $ 96)) (QREFELT $ 97))
                  (SPADCALL |k| (QREFELT $ 98)))
                 ('T
                  (SPADCALL (SPADCALL |k| (QREFELT $ 42)) |l|
                            (QREFELT $ 58))))))) 

(SDEFUN |ES-;operator;2Bo;35| ((|op| |BasicOperator|) ($ |BasicOperator|))
        (COND ((SPADCALL |op| '|%paren| (QREFELT $ 21)) (QREFELT $ 12))
              ((SPADCALL |op| '|%box| (QREFELT $ 21)) (QREFELT $ 13))
              ('T
               (|error|
                (STRCONC "Unknown operator 1: "
                         (SPADCALL (SPADCALL |op| (QREFELT $ 80))
                                   (QREFELT $ 101))))))) 

(SDEFUN |ES-;mainKernel;SU;36| ((|x| S) ($ |Union| (|Kernel| S) "failed"))
        (SPROG
         ((|k| (|Kernel| S)) (|n| (|NonNegativeInteger|)) (#1=#:G895 NIL)
          (|kk| NIL) (|l| (|List| (|Kernel| S))))
         (SEQ
          (COND
           ((NULL
             (LETT |l| (SPADCALL |x| (QREFELT $ 36))
                   . #2=(|ES-;mainKernel;SU;36|)))
            (CONS 1 "failed"))
           ('T
            (SEQ
             (LETT |n|
                   (SPADCALL (LETT |k| (|SPADfirst| |l|) . #2#) (QREFELT $ 47))
                   . #2#)
             (SEQ (LETT |kk| NIL . #2#) (LETT #1# (CDR |l|) . #2#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |kk| (CAR #1#) . #2#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |kk| (QREFELT $ 47)) |n|
                                (QREFELT $ 103))
                      (SEQ (LETT |n| (SPADCALL |kk| (QREFELT $ 47)) . #2#)
                           (EXIT (LETT |k| |kk| . #2#)))))))
                  (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT (CONS 0 |k|)))))))) 

(SDEFUN |ES-;allKernels| ((|f| S) ($ |Set| (|Kernel| S)))
        (SPROG
         ((|s| (|Set| (|Kernel| S))) (|t| (|Set| (|Kernel| S)))
          (|arg| (|List| S)) (|n| (|NonNegativeInteger|))
          (|s0| (|Set| (|Kernel| S))) (|u| (|Union| (|None|) "failed"))
          (#1=#:G910 NIL) (|k| NIL) (|l| (|List| (|Kernel| S))))
         (SEQ
          (LETT |s|
                (SPADCALL
                 (LETT |l| (SPADCALL |f| (QREFELT $ 36))
                       . #2=(|ES-;allKernels|))
                 (QREFELT $ 106))
                . #2#)
          (SEQ (LETT |k| NIL . #2#) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |t|
                      (SEQ
                       (LETT |u|
                             (SPADCALL (SPADCALL |k| (QREFELT $ 42))
                                       (QREFELT $ 7) (QREFELT $ 108))
                             . #2#)
                       (EXIT
                        (COND
                         ((QEQCAR |u| 0)
                          (SEQ (LETT |arg| (SPADCALL |k| (QREFELT $ 96)) . #2#)
                               (LETT |s0|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |arg| (QREFELT $ 109))
                                       (QREFELT $ 62))
                                      (|ES-;allKernels| (|SPADfirst| |arg|) $)
                                      (QREFELT $ 110))
                                     . #2#)
                               (LETT |arg| (CDR (CDR |arg|)) . #2#)
                               (LETT |n| (QCDR |u|) . #2#)
                               (COND
                                ((SPADCALL |n| 1 (QREFELT $ 103))
                                 (LETT |arg| (CDR |arg|) . #2#)))
                               (EXIT
                                (SPADCALL |s0| (|ES-;allk| |arg| $)
                                          (QREFELT $ 29)))))
                         ('T (|ES-;allk| (SPADCALL |k| (QREFELT $ 96)) $)))))
                      . #2#)
                (EXIT (LETT |s| (SPADCALL |s| |t| (QREFELT $ 29)) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |s|)))) 

(SDEFUN |ES-;kernel;BoLS;38| ((|op| |BasicOperator|) (|args| |List| S) ($ S))
        (COND
         ((NULL (SPADCALL |op| (QREFELT $ 111)))
          (|error|
           (STRCONC "Unknown operator 2: "
                    (SPADCALL (SPADCALL |op| (QREFELT $ 80))
                              (QREFELT $ 101)))))
         ('T (|ES-;okkernel| |op| |args| $)))) 

(SDEFUN |ES-;okkernel| ((|op| |BasicOperator|) (|l| |List| S) ($ S))
        (SPROG ((#1=#:G925 NIL) (|f| NIL) (#2=#:G924 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL |op| |l|
                           (+ 1
                              (SPADCALL (ELT $ 46)
                                        (PROGN
                                         (LETT #2# NIL . #3=(|ES-;okkernel|))
                                         (SEQ (LETT |f| NIL . #3#)
                                              (LETT #1# |l| . #3#) G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |f| (CAR #1#) . #3#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (SPADCALL |f|
                                                                 (QREFELT $
                                                                          113))
                                                       #2#)
                                                      . #3#)))
                                              (LETT #1# (CDR #1#) . #3#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #2#))))
                                        0 (QREFELT $ 50)))
                           (QREFELT $ 114))
                 (QREFELT $ 98))))) 

(SDEFUN |ES-;elt;BoLS;40| ((|op| |BasicOperator|) (|args| |List| S) ($ S))
        (SPROG
         ((|v| (|Union| S "failed")) (#1=#:G938 NIL)
          (|u| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (EXIT
           (COND
            ((NULL (SPADCALL |op| (QREFELT $ 111)))
             (|error|
              (STRCONC "Unknown operator 3: "
                       (SPADCALL (SPADCALL |op| (QREFELT $ 80))
                                 (QREFELT $ 101)))))
            ('T
             (SEQ
              (SEQ
               (LETT |u| (SPADCALL |op| (QREFELT $ 116))
                     . #2=(|ES-;elt;BoLS;40|))
               (EXIT
                (COND
                 ((QEQCAR |u| 0)
                  (COND
                   ((SPADCALL (LENGTH |args|) (QCDR |u|) (QREFELT $ 117))
                    (PROGN
                     (LETT #1# (|error| "Wrong number of arguments") . #2#)
                     (GO #3=#:G936))))))))
              (LETT |v| (SPADCALL |op| |args| (QREFELT $ 120)) . #2#)
              (EXIT
               (COND ((QEQCAR |v| 0) (QCDR |v|))
                     ('T (|ES-;okkernel| |op| |args| $))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |ES-;retract;SK;41| ((|f| S) ($ |Kernel| S))
        (SPROG ((|k| (|Union| (|Kernel| S) "failed")))
               (SEQ
                (LETT |k| (SPADCALL |f| (QREFELT $ 122)) |ES-;retract;SK;41|)
                (EXIT
                 (COND
                  ((OR (QEQCAR |k| 1)
                       (SPADCALL (SPADCALL (QCDR |k|) (QREFELT $ 98)) |f|
                                 (QREFELT $ 123)))
                   (|error| "not a kernel"))
                  ('T (QCDR |k|))))))) 

(SDEFUN |ES-;retractIfCan;SU;42| ((|f| S) ($ |Union| (|Kernel| S) "failed"))
        (SPROG ((|k| (|Union| (|Kernel| S) "failed")))
               (SEQ
                (LETT |k| (SPADCALL |f| (QREFELT $ 122))
                      |ES-;retractIfCan;SU;42|)
                (EXIT
                 (COND
                  ((OR (QEQCAR |k| 1)
                       (SPADCALL (SPADCALL (QCDR |k|) (QREFELT $ 98)) |f|
                                 (QREFELT $ 123)))
                   (CONS 1 "failed"))
                  ('T |k|)))))) 

(SDEFUN |ES-;is?;SSB;43| ((|f| S) (|s| |Symbol|) ($ |Boolean|))
        (SPROG ((|k| (|Union| (|Kernel| S) "failed")))
               (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 126)) |ES-;is?;SSB;43|)
                    (EXIT
                     (COND ((QEQCAR |k| 1) NIL)
                           ('T (SPADCALL (QCDR |k|) |s| (QREFELT $ 127)))))))) 

(SDEFUN |ES-;is?;SBoB;44| ((|f| S) (|op| |BasicOperator|) ($ |Boolean|))
        (SPROG ((|k| (|Union| (|Kernel| S) "failed")))
               (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 126)) |ES-;is?;SBoB;44|)
                    (EXIT
                     (COND ((QEQCAR |k| 1) NIL)
                           ('T (SPADCALL (QCDR |k|) |op| (QREFELT $ 56)))))))) 

(SDEFUN |ES-;unwrap| ((|l| |List| (|Kernel| S)) (|x| S) ($ S))
        (SPROG ((#1=#:G966 NIL) (|k| NIL))
               (SEQ
                (SEQ (LETT |k| NIL . #2=(|ES-;unwrap|))
                     (LETT #1# (NREVERSE |l|) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |x|
                             (SPADCALL |x| |k|
                                       (|SPADfirst|
                                        (SPADCALL |k| (QREFELT $ 96)))
                                       (QREFELT $ 130))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |ES-;distribute;3S;46| ((|x| S) (|y| S) ($ S))
        (SPROG ((#1=#:G977 NIL) (|k| NIL) (#2=#:G976 NIL) (|ky| (|Kernel| S)))
               (SEQ
                (LETT |ky| (SPADCALL |y| (QREFELT $ 62))
                      . #3=(|ES-;distribute;3S;46|))
                (EXIT
                 (|ES-;unwrap|
                  (PROGN
                   (LETT #2# NIL . #3#)
                   (SEQ (LETT |k| NIL . #3#)
                        (LETT #1# (|ES-;listk| |x| $) . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((COND
                             ((OR (SPADCALL |k| (QREFELT $ 12) (QREFELT $ 56))
                                  (SPADCALL |k| (QREFELT $ 13) (QREFELT $ 56)))
                              (SPADCALL |ky|
                                        (|ES-;listk|
                                         (SPADCALL |k| (QREFELT $ 98)) $)
                                        (QREFELT $ 63)))
                             ('T NIL))
                            (LETT #2# (CONS |k| #2#) . #3#)))))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  |x| $))))) 

(SDEFUN |ES-;eval;SLS;47| ((|f| S) (|leq| |List| (|Equation| S)) ($ S))
        (SPROG
         ((|rec|
           (|Record| (|:| |lstk| (|List| (|Kernel| S)))
                     (|:| |lstv| (|List| S)))))
         (SEQ (LETT |rec| (|ES-;mkKerLists| |leq| $) |ES-;eval;SLS;47|)
              (EXIT (SPADCALL |f| (QCAR |rec|) (QCDR |rec|) (QREFELT $ 132)))))) 

(SDEFUN |ES-;subst;SLS;48| ((|f| S) (|leq| |List| (|Equation| S)) ($ S))
        (SPROG
         ((|rec|
           (|Record| (|:| |lstk| (|List| (|Kernel| S)))
                     (|:| |lstv| (|List| S)))))
         (SEQ (LETT |rec| (|ES-;mkKerLists| |leq| $) |ES-;subst;SLS;48|)
              (EXIT (SPADCALL |f| (QCAR |rec|) (QCDR |rec|) (QREFELT $ 134)))))) 

(SDEFUN |ES-;mkKerLists|
        ((|leq| |List| (|Equation| S))
         ($ |Record| (|:| |lstk| (|List| (|Kernel| S)))
          (|:| |lstv| (|List| S))))
        (SPROG
         ((|lv| (|List| S)) (|lk| (|List| (|Kernel| S)))
          (|k| (|Union| (|Kernel| S) "failed")) (#1=#:G996 NIL) (|eq| NIL))
         (SEQ (LETT |lk| NIL . #2=(|ES-;mkKerLists|)) (LETT |lv| NIL . #2#)
              (SEQ (LETT |eq| NIL . #2#) (LETT #1# |leq| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |k|
                          (SPADCALL (SPADCALL |eq| (QREFELT $ 137))
                                    (QREFELT $ 126))
                          . #2#)
                    (EXIT
                     (COND
                      ((QEQCAR |k| 1)
                       (|error| "left hand side must be a single kernel"))
                      ((NULL (SPADCALL (QCDR |k|) |lk| (QREFELT $ 63)))
                       (SEQ (LETT |lk| (CONS (QCDR |k|) |lk|) . #2#)
                            (EXIT
                             (LETT |lv|
                                   (CONS (SPADCALL |eq| (QREFELT $ 138)) |lv|)
                                   . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |lk| |lv|))))) 

(SDEFUN |ES-;even?;SB;50| ((|x| S) ($ |Boolean|))
        (|ES-;intpred?| |x| (ELT $ 140) $)) 

(SDEFUN |ES-;odd?;SB;51| ((|x| S) ($ |Boolean|))
        (|ES-;intpred?| |x| (ELT $ 142) $)) 

(SDEFUN |ES-;intpred?|
        ((|x| S) (|pred?| |Mapping| (|Boolean|) (|Integer|)) ($ |Boolean|))
        (SPROG ((|u| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 145)) |ES-;intpred?|)
                    (EXIT
                     (COND ((QEQCAR |u| 0) (SPADCALL (QCDR |u|) |pred?|))
                           ('T NIL)))))) 

(DECLAIM (NOTINLINE |ExpressionSpace&;|)) 

(DEFUN |ExpressionSpace&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ExpressionSpace&|))
          (LETT |dv$| (LIST '|ExpressionSpace&| DV$1) . #1#)
          (LETT $ (GETREFV 146) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#1| '(|Ring|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 '|%dummyVar|)
          (QSETREFV $ 12 (SPADCALL '|%paren| (QREFELT $ 11)))
          (QSETREFV $ 13 (SPADCALL '|%box| (QREFELT $ 11)))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 141 (CONS (|dispatchFunction| |ES-;even?;SB;50|) $))
             (QSETREFV $ 143 (CONS (|dispatchFunction| |ES-;odd?;SB;51|) $)))))
          $))) 

(MAKEPROP '|ExpressionSpace&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'DUMMYVAR
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|oppren| '|opbox| (|List| $) (5 . |box|) |ES-;box;2S;1|
              (10 . |paren|) |ES-;paren;2S;2| (|Boolean|) (15 . |has?|)
              (21 . |is?|) |ES-;belong?;BoB;3| (|List| 41) (|Set| 41)
              (27 . |parts|) (32 . |sort!|) (|List| 61) |ES-;tower;SL;5|
              (37 . |union|) (43 . |set|) (|Mapping| 24 24 24) (|List| 24)
              (47 . |reduce|) |ES-;tower;LL;7| (54 . |setUnion|)
              (60 . |kernels|) (|Mapping| 23 23 23) (|List| 23) (65 . |reduce|)
              |ES-;kernels;LL;8| (|Kernel| 6) (72 . |operator|) (|List| 8)
              |ES-;operators;SL;9| (|NonNegativeInteger|) (77 . |max|)
              (83 . |height|) (|Mapping| 45 45 45) (|List| 45) (88 . |reduce|)
              |ES-;height;SNni;10| (95 . |name|) (|List| 9) (100 . |member?|)
              |ES-;freeOf?;SSB;11| (106 . |is?|) |ES-;distribute;2S;12|
              (112 . |elt|) |ES-;box;LS;13| |ES-;paren;LS;14| (|Kernel| $)
              (118 . |retract|) (123 . |member?|) |ES-;freeOf?;2SB;15|
              (129 . |kernel|) |ES-;kernel;Bo2S;16| |ES-;elt;Bo2S;17|
              |ES-;elt;Bo3S;18| |ES-;elt;Bo4S;19| |ES-;elt;Bo5S;20|
              |ES-;elt;Bo6S;21| |ES-;elt;Bo7S;22| |ES-;elt;Bo8S;23|
              |ES-;elt;Bo9S;24| |ES-;elt;Bo10S;25| (|Mapping| $ 14) (|List| 76)
              (135 . |eval|) |ES-;eval;SSMS;26| (142 . |name|)
              |ES-;eval;SBoMS;27| (|List| 6) (147 . |first|) (|Mapping| $ $)
              |ES-;eval;SSMS;28| (152 . |eval|) |ES-;eval;SBoMS;29| (|List| 90)
              (159 . |subst|) (|Equation| $) |ES-;subst;SES;30| (|List| 84)
              |ES-;eval;SLLS;31| |ES-;eval;SLLS;32| |ES-;eval;SLLS;33|
              (165 . |argument|) (170 . =) (176 . |coerce|) |ES-;map;MKS;34|
              (|String|) (181 . |string|) |ES-;operator;2Bo;35| (186 . >)
              (|Union| 61 '"failed") |ES-;mainKernel;SU;36| (192 . |brace|)
              (|Union| (|None|) '"failed") (197 . |property|) (203 . |second|)
              (208 . |remove!|) (214 . |belong?|) |ES-;kernel;BoLS;38|
              (219 . |height|) (224 . |kernel|) (|Union| 45 '"failed")
              (231 . |arity|) (236 . ~=) (|Union| 6 '"failed")
              (|BasicOperatorFunctions1| 6) (242 . |evaluate|)
              |ES-;elt;BoLS;40| (248 . |mainKernel|) (253 . ~=)
              |ES-;retract;SK;41| |ES-;retractIfCan;SU;42|
              (259 . |retractIfCan|) (264 . |is?|) |ES-;is?;SSB;43|
              |ES-;is?;SBoB;44| (270 . |eval|) |ES-;distribute;3S;46|
              (277 . |eval|) |ES-;eval;SLS;47| (284 . |subst|)
              |ES-;subst;SLS;48| (|Equation| 6) (291 . |lhs|) (296 . |rhs|)
              (|Integer|) (301 . |even?|) (306 . |even?|) (311 . |odd?|)
              (316 . |odd?|) (|Union| 139 '"failed") (321 . |retractIfCan|))
           '#(|tower| 326 |subst| 336 |retractIfCan| 348 |retract| 353 |paren|
              358 |operators| 368 |operator| 373 |odd?| 378 |map| 383
              |mainKernel| 389 |kernels| 394 |kernel| 399 |is?| 411 |height|
              423 |freeOf?| 428 |even?| 440 |eval| 445 |elt| 500 |distribute|
              596 |box| 607 |belong?| 617)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 145
                                                 '(1 10 8 9 11 1 6 0 14 15 1 6
                                                   0 14 17 2 8 19 0 9 20 2 8 19
                                                   0 9 21 1 24 23 0 25 1 23 0 0
                                                   26 2 24 0 0 0 29 0 24 0 30 3
                                                   32 24 31 0 24 33 2 23 0 0 0
                                                   35 1 6 27 0 36 3 38 23 37 0
                                                   23 39 1 41 8 0 42 2 45 0 0 0
                                                   46 1 41 45 0 47 3 49 45 48 0
                                                   45 50 1 41 9 0 52 2 53 19 9
                                                   0 54 2 41 19 0 8 56 2 6 0 8
                                                   14 58 1 6 61 0 62 2 23 19 41
                                                   0 63 2 6 0 8 14 65 3 6 0 0
                                                   53 77 78 1 8 9 0 80 1 82 6 0
                                                   83 3 6 0 0 43 77 86 2 6 0 0
                                                   88 89 1 41 82 0 96 2 82 19 0
                                                   0 97 1 6 0 61 98 1 9 100 0
                                                   101 2 45 19 0 0 103 1 24 0
                                                   23 106 2 8 107 0 9 108 1 82
                                                   6 0 109 2 24 0 41 0 110 1 6
                                                   19 8 111 1 6 45 0 113 3 41 0
                                                   8 82 45 114 1 8 115 0 116 2
                                                   45 19 0 0 117 2 119 118 8 82
                                                   120 1 6 104 0 122 2 6 19 0 0
                                                   123 1 6 104 0 126 2 41 19 0
                                                   9 127 3 6 0 0 61 0 130 3 6 0
                                                   0 27 14 132 3 6 0 0 27 14
                                                   134 1 136 6 0 137 1 136 6 0
                                                   138 1 139 19 0 140 1 0 19 0
                                                   141 1 139 19 0 142 1 0 19 0
                                                   143 1 6 144 0 145 1 0 27 0
                                                   28 1 0 27 14 34 2 0 0 0 90
                                                   91 2 0 0 0 88 135 1 0 104 0
                                                   125 1 0 61 0 124 1 0 0 14 60
                                                   1 0 0 0 18 1 0 43 0 44 1 0 8
                                                   8 102 1 0 19 0 143 2 0 0 84
                                                   61 99 1 0 104 0 105 1 0 27
                                                   14 40 2 0 0 8 14 112 2 0 0 8
                                                   0 66 2 0 19 0 9 128 2 0 19 0
                                                   8 129 1 0 45 0 51 2 0 19 0 9
                                                   55 2 0 19 0 0 64 1 0 19 0
                                                   141 3 0 0 0 8 84 87 3 0 0 0
                                                   8 76 81 3 0 0 0 43 92 93 3 0
                                                   0 0 43 77 95 3 0 0 0 9 84 85
                                                   3 0 0 0 9 76 79 3 0 0 0 53
                                                   92 94 2 0 0 0 88 133 10 0 0
                                                   8 0 0 0 0 0 0 0 0 0 75 2 0 0
                                                   8 14 121 8 0 0 8 0 0 0 0 0 0
                                                   0 73 9 0 0 8 0 0 0 0 0 0 0 0
                                                   74 7 0 0 8 0 0 0 0 0 0 72 5
                                                   0 0 8 0 0 0 0 70 6 0 0 8 0 0
                                                   0 0 0 71 3 0 0 8 0 0 68 4 0
                                                   0 8 0 0 0 69 2 0 0 8 0 67 2
                                                   0 0 0 0 131 1 0 0 0 57 1 0 0
                                                   0 16 1 0 0 14 59 1 0 19 8
                                                   22)))))
           '|lookupComplete|)) 
