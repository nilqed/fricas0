
(SDEFUN |ESC2-;box;2S;1| ((|x| (S)) (% (S)))
        (SPADCALL (QREFELT % 14) (LIST |x|) (QREFELT % 16))) 

(SDEFUN |ESC2-;paren;2S;2| ((|x| (S)) (% (S)))
        (SPADCALL (QREFELT % 13) (LIST |x|) (QREFELT % 16))) 

(SDEFUN |ESC2-;belong?;BoB;3| ((|op| (|BasicOperator|)) (% (|Boolean|)))
        (COND
         ((SPADCALL |op| '|any| (QREFELT % 20))
          (COND ((SPADCALL |op| '|%paren| (QREFELT % 21)) 'T)
                (#1='T (SPADCALL |op| '|%box| (QREFELT % 21)))))
         (#1# NIL))) 

(SDEFUN |ESC2-;listk| ((|f| (S)) (% (|List| K)))
        (SPADCALL (|ESC2-;allKernels| |f| %) (QREFELT % 25))) 

(SDEFUN |ESC2-;tower;SL;5| ((|f| (S)) (% (|List| K)))
        (SPADCALL (|ESC2-;listk| |f| %) (QREFELT % 26))) 

(SDEFUN |ESC2-;allk| ((|l| (|List| S)) (% (|Set| K)))
        (SPROG ((#1=#:G38 NIL) (|f| NIL) (#2=#:G37 NIL))
               (SEQ
                (SPADCALL (ELT % 28)
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |f| NIL) (LETT #1# |l|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (|ESC2-;allKernels| |f| %)
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (SPADCALL (QREFELT % 29)) (QREFELT % 32))))) 

(SDEFUN |ESC2-;tower;LL;7| ((|lf| (|List| S)) (% (|List| K)))
        (SPADCALL (SPADCALL (|ESC2-;allk| |lf| %) (QREFELT % 25))
                  (QREFELT % 26))) 

(SDEFUN |ESC2-;kernels;LL;8| ((|lf| (|List| S)) (% (|List| K)))
        (SPROG ((#1=#:G46 NIL) (|f| NIL) (#2=#:G45 NIL))
               (SEQ
                (SPADCALL (ELT % 34)
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |f| NIL) (LETT #1# |lf|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |f| (QREFELT % 35))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          NIL (QREFELT % 38))))) 

(SDEFUN |ESC2-;operators;SL;9| ((|f| (S)) (% (|List| (|BasicOperator|))))
        (SPROG ((#1=#:G51 NIL) (|k| NIL) (#2=#:G50 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k| NIL) (LETT #1# (|ESC2-;listk| |f| %)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |k| (QREFELT % 40)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |ESC2-;height;SNni;10| ((|f| (S)) (% (|NonNegativeInteger|)))
        (SPROG ((#1=#:G58 NIL) (|k| NIL) (#2=#:G57 NIL))
               (SEQ
                (SPADCALL (ELT % 44)
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |k| NIL)
                                (LETT #1# (SPADCALL |f| (QREFELT % 35))) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |k| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |k| (QREFELT % 45))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          0 (QREFELT % 48))))) 

(SDEFUN |ESC2-;freeOf?;SSB;11| ((|x| (S)) (|s| (|Symbol|)) (% (|Boolean|)))
        (SPROG ((#1=#:G64 NIL) (|k| NIL) (#2=#:G63 NIL))
               (SEQ
                (NULL
                 (SPADCALL |s|
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |k| NIL)
                                 (LETT #1# (|ESC2-;listk| |x| %)) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |k| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS (SPADCALL |k| (QREFELT % 50))
                                               #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT % 52)))))) 

(SDEFUN |ESC2-;distribute;2S;12| ((|x| (S)) (% (S)))
        (SPROG ((#1=#:G70 NIL) (|k| NIL) (#2=#:G69 NIL))
               (SEQ
                (|ESC2-;unwrap|
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |k| NIL) (LETT #1# (|ESC2-;listk| |x| %)) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((COND
                            ((SPADCALL |k| (QREFELT % 13) (QREFELT % 54)) 'T)
                            ('T (SPADCALL |k| (QREFELT % 14) (QREFELT % 54))))
                           (LETT #2# (CONS |k| #2#))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |x| %)))) 

(SDEFUN |ESC2-;freeOf?;2SB;13| ((|x| (S)) (|k| (S)) (% (|Boolean|)))
        (NULL
         (SPADCALL (SPADCALL |k| (QREFELT % 60)) (|ESC2-;listk| |x| %)
                   (QREFELT % 61)))) 

(SDEFUN |ESC2-;kernel;Bo2S;14| ((|op| (|BasicOperator|)) (|arg| (S)) (% (S)))
        (SPADCALL |op| (LIST |arg|) (QREFELT % 63))) 

(SDEFUN |ESC2-;elt;Bo2S;15| ((|op| (|BasicOperator|)) (|x| (S)) (% (S)))
        (SPADCALL |op| (LIST |x|) (QREFELT % 16))) 

(SDEFUN |ESC2-;elt;Bo3S;16|
        ((|op| (|BasicOperator|)) (|x| (S)) (|y| (S)) (% (S)))
        (SPADCALL |op| (LIST |x| |y|) (QREFELT % 16))) 

(SDEFUN |ESC2-;elt;Bo4S;17|
        ((|op| (|BasicOperator|)) (|x| (S)) (|y| (S)) (|z| (S)) (% (S)))
        (SPADCALL |op| (LIST |x| |y| |z|) (QREFELT % 16))) 

(SDEFUN |ESC2-;elt;Bo5S;18|
        ((|op| (|BasicOperator|)) (|x| (S)) (|y| (S)) (|z| (S)) (|t| (S))
         (% (S)))
        (SPADCALL |op| (LIST |x| |y| |z| |t|) (QREFELT % 16))) 

(SDEFUN |ESC2-;elt;Bo6S;19|
        ((|op| (|BasicOperator|)) (|x| (S)) (|y| (S)) (|z| (S)) (|t| (S))
         (|s| (S)) (% (S)))
        (SPADCALL |op| (LIST |x| |y| |z| |t| |s|) (QREFELT % 16))) 

(SDEFUN |ESC2-;elt;Bo7S;20|
        ((|op| (|BasicOperator|)) (|x| (S)) (|y| (S)) (|z| (S)) (|t| (S))
         (|s| (S)) (|r| (S)) (% (S)))
        (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r|) (QREFELT % 16))) 

(SDEFUN |ESC2-;elt;Bo8S;21|
        ((|op| (|BasicOperator|)) (|x| (S)) (|y| (S)) (|z| (S)) (|t| (S))
         (|s| (S)) (|r| (S)) (|q| (S)) (% (S)))
        (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r| |q|) (QREFELT % 16))) 

(SDEFUN |ESC2-;elt;Bo9S;22|
        ((|op| (|BasicOperator|)) (|x| (S)) (|y| (S)) (|z| (S)) (|t| (S))
         (|s| (S)) (|r| (S)) (|q| (S)) (|p| (S)) (% (S)))
        (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r| |q| |p|) (QREFELT % 16))) 

(SDEFUN |ESC2-;elt;Bo10S;23|
        ((|op| (|BasicOperator|)) (|x| (S)) (|y| (S)) (|z| (S)) (|t| (S))
         (|s| (S)) (|r| (S)) (|q| (S)) (|p| (S)) (|o| (S)) (% (S)))
        (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r| |q| |p| |o|)
                  (QREFELT % 16))) 

(SDEFUN |ESC2-;eval;SSMS;24|
        ((|x| (S)) (|s| (|Symbol|)) (|f| (|Mapping| S (|List| S))) (% (S)))
        (SPADCALL |x| (LIST |s|) (LIST |f|) (QREFELT % 76))) 

(SDEFUN |ESC2-;eval;SBoMS;25|
        ((|x| (S)) (|s| (|BasicOperator|)) (|f| (|Mapping| S (|List| S)))
         (% (S)))
        (SPADCALL |x| (LIST (SPADCALL |s| (QREFELT % 78))) (LIST |f|)
                  (QREFELT % 76))) 

(SDEFUN |ESC2-;eval;SSMS;26|
        ((|x| (S)) (|s| (|Symbol|)) (|f| (|Mapping| S S)) (% (S)))
        (SPROG NIL
               (SPADCALL |x| (LIST |s|)
                         (LIST (CONS #'|ESC2-;eval;SSMS;26!0| (VECTOR |f| %)))
                         (QREFELT % 76)))) 

(SDEFUN |ESC2-;eval;SSMS;26!0| ((|y| NIL) ($$ NIL))
        (PROG (% |f|)
          (LETT % (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT % 81)) |f|))))) 

(SDEFUN |ESC2-;eval;SBoMS;27|
        ((|x| (S)) (|s| (|BasicOperator|)) (|f| (|Mapping| S S)) (% (S)))
        (SPROG NIL
               (SPADCALL |x| (LIST |s|)
                         (LIST (CONS #'|ESC2-;eval;SBoMS;27!0| (VECTOR |f| %)))
                         (QREFELT % 84)))) 

(SDEFUN |ESC2-;eval;SBoMS;27!0| ((|y| NIL) ($$ NIL))
        (PROG (% |f|)
          (LETT % (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT % 81)) |f|))))) 

(SDEFUN |ESC2-;subst;SES;28| ((|x| (S)) (|e| (|Equation| S)) (% (S)))
        (SPADCALL |x| (LIST |e|) (QREFELT % 87))) 

(SDEFUN |ESC2-;eval;SLLS;29|
        ((|x| (S)) (|ls| (|List| (|BasicOperator|)))
         (|lf| (|List| (|Mapping| S S))) (% (S)))
        (SPROG ((#1=#:G140 NIL) (|f| NIL) (#2=#:G139 NIL))
               (SEQ
                (SPADCALL |x| |ls|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |f| NIL) (LETT #1# |lf|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (CONS #'|ESC2-;eval;SLLS;29!0|
                                               (VECTOR |f| %))
                                         #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT % 84))))) 

(SDEFUN |ESC2-;eval;SLLS;29!0| ((|y| NIL) ($$ NIL))
        (PROG (% |f|)
          (LETT % (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT % 81)) |f|))))) 

(SDEFUN |ESC2-;eval;SLLS;30|
        ((|x| (S)) (|ls| (|List| (|Symbol|))) (|lf| (|List| (|Mapping| S S)))
         (% (S)))
        (SPROG ((#1=#:G146 NIL) (|f| NIL) (#2=#:G145 NIL))
               (SEQ
                (SPADCALL |x| |ls|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |f| NIL) (LETT #1# |lf|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (CONS #'|ESC2-;eval;SLLS;30!0|
                                               (VECTOR |f| %))
                                         #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT % 76))))) 

(SDEFUN |ESC2-;eval;SLLS;30!0| ((|y| NIL) ($$ NIL))
        (PROG (% |f|)
          (LETT % (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT % 81)) |f|))))) 

(SDEFUN |ESC2-;eval;SLLS;31|
        ((|x| (S)) (|ls| (|List| (|BasicOperator|)))
         (|lf| (|List| (|Mapping| S (|List| S)))) (% (S)))
        (SPROG ((#1=#:G153 NIL) (|s| NIL) (#2=#:G152 NIL))
               (SEQ
                (SPADCALL |x|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |s| NIL) (LETT #1# |ls|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |s| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |s| (QREFELT % 78))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          |lf| (QREFELT % 76))))) 

(SDEFUN |ESC2-;map;MKS;32| ((|fn| (|Mapping| S S)) (|k| (K)) (% (S)))
        (SPROG ((|l| (|List| S)) (#1=#:G217 NIL) (|x| NIL) (#2=#:G216 NIL))
               (SEQ
                (COND
                 ((SPADCALL
                   (LETT |l|
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |x| NIL)
                               (LETT #1# (SPADCALL |k| (QREFELT % 94))) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |x| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2# (CONS (SPADCALL |x| |fn|) #2#))))
                               (LETT #1# (CDR #1#)) (GO G190) G191
                               (EXIT (NREVERSE #2#)))))
                   (SPADCALL |k| (QREFELT % 94)) (QREFELT % 95))
                  (SPADCALL |k| (QREFELT % 96)))
                 ('T
                  (SPADCALL (SPADCALL |k| (QREFELT % 40)) |l|
                            (QREFELT % 16))))))) 

(SDEFUN |ESC2-;operator;2Bo;33|
        ((|op| (|BasicOperator|)) (% (|BasicOperator|)))
        (COND ((SPADCALL |op| '|%paren| (QREFELT % 21)) (QREFELT % 13))
              ((SPADCALL |op| '|%box| (QREFELT % 21)) (QREFELT % 14))
              ('T
               (|error|
                (STRCONC "Unknown operator 1: "
                         (SPADCALL (SPADCALL |op| (QREFELT % 78))
                                   (QREFELT % 99))))))) 

(SDEFUN |ESC2-;mainKernel;SU;34| ((|x| (S)) (% (|Union| K "failed")))
        (SPROG
         ((|k| (K)) (|n| (|NonNegativeInteger|)) (#1=#:G234 NIL) (|kk| NIL)
          (|l| (|List| K)))
         (SEQ
          (COND
           ((NULL (LETT |l| (SPADCALL |x| (QREFELT % 35)))) (CONS 1 "failed"))
           ('T
            (SEQ
             (LETT |n| (SPADCALL (LETT |k| (|SPADfirst| |l|)) (QREFELT % 45)))
             (SEQ (LETT |kk| NIL) (LETT #1# (CDR |l|)) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |kk| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((> (SPADCALL |kk| (QREFELT % 45)) |n|)
                      (SEQ (LETT |n| (SPADCALL |kk| (QREFELT % 45)))
                           (EXIT (LETT |k| |kk|)))))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
             (EXIT (CONS 0 |k|)))))))) 

(SDEFUN |ESC2-;allKernels| ((|f| (S)) (% (|Set| K)))
        (SPROG
         ((|s| (|Set| K)) (|t| (|Set| K)) (|arg| (|List| S))
          (|n| (|NonNegativeInteger|)) (|s0| (|Set| K))
          (|u| (|Union| (|None|) "failed")) (#1=#:G246 NIL) (|k| NIL)
          (|l| (|List| K)))
         (SEQ
          (LETT |s|
                (SPADCALL (LETT |l| (SPADCALL |f| (QREFELT % 35)))
                          (QREFELT % 103)))
          (SEQ (LETT |k| NIL) (LETT #1# |l|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL)) (GO G191)))
               (SEQ
                (LETT |t|
                      (SEQ (LETT |arg| (SPADCALL |k| (QREFELT % 94)))
                           (LETT |u|
                                 (SPADCALL (SPADCALL |k| (QREFELT % 40))
                                           (QREFELT % 8) (QREFELT % 105)))
                           (EXIT
                            (COND
                             ((QEQCAR |u| 0)
                              (SEQ
                               (LETT |s0|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |arg| (QREFELT % 106))
                                       (QREFELT % 60))
                                      (|ESC2-;allKernels| (|SPADfirst| |arg|)
                                       %)
                                      (QREFELT % 107)))
                               (LETT |arg| (CDR (CDR |arg|)))
                               (LETT |n| (QCDR |u|))
                               (COND ((> |n| 1) (LETT |arg| (CDR |arg|))))
                               (EXIT
                                (SPADCALL |s0| (|ESC2-;allk| |arg| %)
                                          (QREFELT % 28)))))
                             ('T (|ESC2-;allk| |arg| %))))))
                (EXIT (LETT |s| (SPADCALL |s| |t| (QREFELT % 28)))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT |s|)))) 

(SDEFUN |ESC2-;kernel;BoLS;36|
        ((|op| (|BasicOperator|)) (|args| (|List| S)) (% (S)))
        (COND
         ((NULL (SPADCALL |op| (QREFELT % 108)))
          (|error|
           (STRCONC "Unknown operator 2: "
                    (SPADCALL (SPADCALL |op| (QREFELT % 78)) (QREFELT % 99)))))
         ('T (|ESC2-;okkernel| |op| |args| %)))) 

(SDEFUN |ESC2-;okkernel| ((|op| (|BasicOperator|)) (|l| (|List| S)) (% (S)))
        (SPROG ((#1=#:G264 NIL) (|f| NIL) (#2=#:G263 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL |op| |l|
                           (+ 1
                              (SPADCALL (ELT % 44)
                                        (PROGN
                                         (LETT #2# NIL)
                                         (SEQ (LETT |f| NIL) (LETT #1# |l|)
                                              G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |f| (CAR #1#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (SPADCALL |f|
                                                                 (QREFELT %
                                                                          110))
                                                       #2#))))
                                              (LETT #1# (CDR #1#)) (GO G190)
                                              G191 (EXIT (NREVERSE #2#))))
                                        0 (QREFELT % 48)))
                           (QREFELT % 111))
                 (QREFELT % 96))))) 

(SDEFUN |ESC2-;elt;BoLS;38|
        ((|op| (|BasicOperator|)) (|args| (|List| S)) (% (S)))
        (SPROG
         ((|v| (|Union| S "failed")) (#1=#:G276 NIL)
          (|u| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (EXIT
           (COND
            ((NULL (SPADCALL |op| (QREFELT % 108)))
             (|error|
              (STRCONC "Unknown operator 3: "
                       (SPADCALL (SPADCALL |op| (QREFELT % 78))
                                 (QREFELT % 99)))))
            ('T
             (SEQ
              (SEQ (LETT |u| (SPADCALL |op| (QREFELT % 113)))
                   (EXIT
                    (COND
                     ((QEQCAR |u| 0)
                      (COND
                       ((SPADCALL (LENGTH |args|) (QCDR |u|) (QREFELT % 114))
                        (PROGN
                         (LETT #1# (|error| "Wrong number of arguments"))
                         (GO #2=#:G274))))))))
              (LETT |v| (SPADCALL |op| |args| (QREFELT % 116)))
              (EXIT
               (COND ((QEQCAR |v| 0) (QCDR |v|))
                     ('T (|ESC2-;okkernel| |op| |args| %))))))))
          #2# (EXIT #1#)))) 

(SDEFUN |ESC2-;retract;SK;39| ((|f| (S)) (% (K)))
        (SPROG ((|k| (|Union| K "failed")))
               (SEQ (LETT |k| (SPADCALL |f| (QREFELT % 118)))
                    (EXIT
                     (COND
                      ((OR (QEQCAR |k| 1)
                           (SPADCALL (SPADCALL (QCDR |k|) (QREFELT % 96)) |f|
                                     (QREFELT % 119)))
                       (|error| "not a kernel"))
                      ('T (QCDR |k|))))))) 

(SDEFUN |ESC2-;retractIfCan;SU;40| ((|f| (S)) (% (|Union| K "failed")))
        (SPROG ((|k| (|Union| K "failed")))
               (SEQ (LETT |k| (SPADCALL |f| (QREFELT % 118)))
                    (EXIT
                     (COND
                      ((OR (QEQCAR |k| 1)
                           (SPADCALL (SPADCALL (QCDR |k|) (QREFELT % 96)) |f|
                                     (QREFELT % 119)))
                       (CONS 1 "failed"))
                      ('T |k|)))))) 

(SDEFUN |ESC2-;is?;SSB;41| ((|f| (S)) (|s| (|Symbol|)) (% (|Boolean|)))
        (SPROG ((|k| (|Union| K "failed")))
               (SEQ (LETT |k| (SPADCALL |f| (QREFELT % 122)))
                    (EXIT
                     (COND ((QEQCAR |k| 1) NIL)
                           ('T (SPADCALL (QCDR |k|) |s| (QREFELT % 123)))))))) 

(SDEFUN |ESC2-;is?;SBoB;42|
        ((|f| (S)) (|op| (|BasicOperator|)) (% (|Boolean|)))
        (SPROG ((|k| (|Union| K "failed")))
               (SEQ (LETT |k| (SPADCALL |f| (QREFELT % 122)))
                    (EXIT
                     (COND ((QEQCAR |k| 1) NIL)
                           ('T (SPADCALL (QCDR |k|) |op| (QREFELT % 54)))))))) 

(SDEFUN |ESC2-;unwrap| ((|l| (|List| K)) (|x| (S)) (% (S)))
        (SPROG ((#1=#:G303 NIL) (|k| NIL))
               (SEQ
                (SEQ (LETT |k| NIL) (LETT #1# (NREVERSE |l|)) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |x|
                             (SPADCALL |x| |k|
                                       (|SPADfirst|
                                        (SPADCALL |k| (QREFELT % 94)))
                                       (QREFELT % 126)))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |ESC2-;distribute;3S;44| ((|x| (S)) (|y| (S)) (% (S)))
        (SPROG ((#1=#:G311 NIL) (|k| NIL) (#2=#:G310 NIL) (|ky| (K)))
               (SEQ (LETT |ky| (SPADCALL |y| (QREFELT % 60)))
                    (EXIT
                     (|ESC2-;unwrap|
                      (PROGN
                       (LETT #2# NIL)
                       (SEQ (LETT |k| NIL) (LETT #1# (|ESC2-;listk| |x| %))
                            G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((COND
                                 ((OR
                                   (SPADCALL |k| (QREFELT % 13) (QREFELT % 54))
                                   (SPADCALL |k| (QREFELT % 14)
                                             (QREFELT % 54)))
                                  (SPADCALL |ky|
                                            (|ESC2-;listk|
                                             (SPADCALL |k| (QREFELT % 96)) %)
                                            (QREFELT % 61)))
                                 ('T NIL))
                                (LETT #2# (CONS |k| #2#))))))
                            (LETT #1# (CDR #1#)) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      |x| %))))) 

(SDEFUN |ESC2-;eval;SLS;45| ((|f| (S)) (|leq| (|List| (|Equation| S))) (% (S)))
        (SPROG
         ((|rec| (|Record| (|:| |lstk| (|List| K)) (|:| |lstv| (|List| S)))))
         (SEQ (LETT |rec| (|ESC2-;mkKerLists| |leq| %))
              (EXIT (SPADCALL |f| (QCAR |rec|) (QCDR |rec|) (QREFELT % 128)))))) 

(SDEFUN |ESC2-;subst;SLS;46|
        ((|f| (S)) (|leq| (|List| (|Equation| S))) (% (S)))
        (SPROG
         ((|rec| (|Record| (|:| |lstk| (|List| K)) (|:| |lstv| (|List| S)))))
         (SEQ (LETT |rec| (|ESC2-;mkKerLists| |leq| %))
              (EXIT (SPADCALL |f| (QCAR |rec|) (QCDR |rec|) (QREFELT % 130)))))) 

(SDEFUN |ESC2-;mkKerLists|
        ((|leq| (|List| (|Equation| S)))
         (% (|Record| (|:| |lstk| (|List| K)) (|:| |lstv| (|List| S)))))
        (SPROG
         ((|lv| (|List| S)) (|lk| (|List| K)) (|k| (|Union| K "failed"))
          (#1=#:G329 NIL) (|eq| NIL))
         (SEQ (LETT |lk| NIL) (LETT |lv| NIL)
              (SEQ (LETT |eq| NIL) (LETT #1# |leq|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |k|
                          (SPADCALL (SPADCALL |eq| (QREFELT % 133))
                                    (QREFELT % 122)))
                    (EXIT
                     (COND
                      ((QEQCAR |k| 1)
                       (|error| "left hand side must be a single kernel"))
                      ((NULL (SPADCALL (QCDR |k|) |lk| (QREFELT % 61)))
                       (SEQ (LETT |lk| (CONS (QCDR |k|) |lk|))
                            (EXIT
                             (LETT |lv|
                                   (CONS (SPADCALL |eq| (QREFELT % 134))
                                         |lv|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |lk| |lv|))))) 

(SDEFUN |ESC2-;even?;SB;48| ((|x| (S)) (% (|Boolean|)))
        (|ESC2-;intpred?| |x| (ELT % 136) %)) 

(SDEFUN |ESC2-;odd?;SB;49| ((|x| (S)) (% (|Boolean|)))
        (|ESC2-;intpred?| |x| (ELT % 138) %)) 

(SDEFUN |ESC2-;intpred?|
        ((|x| (S)) (|pred?| (|Mapping| (|Boolean|) (|Integer|)))
         (% (|Boolean|)))
        (SPROG ((|u| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |u| (SPADCALL |x| (QREFELT % 141)))
                    (EXIT
                     (COND ((QEQCAR |u| 0) (SPADCALL (QCDR |u|) |pred?|))
                           ('T NIL)))))) 

(DECLAIM (NOTINLINE |ExpressionSpace2&;|)) 

(DEFUN |ExpressionSpace2&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ExpressionSpace2&| DV$1 DV$2))
          (LETT % (GETREFV 142))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#1|
                                                             '(|Ring|))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 '|%dummyVar|)
          (QSETREFV % 13 (SPADCALL '|%paren| (QREFELT % 12)))
          (QSETREFV % 14 (SPADCALL '|%box| (QREFELT % 12)))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (SPADCALL (QREFELT % 14) (CONS #'|ExpressionSpace2&!0| %)
                       (QREFELT % 59))
             (SPADCALL (QREFELT % 13) (CONS #'|ExpressionSpace2&!1| %)
                       (QREFELT % 59)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 137 (CONS (|dispatchFunction| |ESC2-;even?;SB;48|) %))
             (QSETREFV % 139
                       (CONS (|dispatchFunction| |ESC2-;odd?;SB;49|) %)))))
          %))) 

(DEFUN |ExpressionSpace2&!1| (|x| %) (|spadConstant| % 56)) 

(DEFUN |ExpressionSpace2&!0| (|x| %) (|spadConstant| % 56)) 

(MAKEPROP '|ExpressionSpace2&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'DUMMYVAR
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|oppren| '|opbox| (|List| %) (5 . |elt|) |ESC2-;box;2S;1|
              |ESC2-;paren;2S;2| (|Boolean|) (11 . |has?|) (17 . |is?|)
              |ESC2-;belong?;BoB;3| (|List| 7) (|Set| 7) (23 . |parts|)
              (28 . |sort!|) |ESC2-;tower;SL;5| (33 . |union|) (39 . |set|)
              (|Mapping| 24 24 24) (|List| 24) (43 . |reduce|)
              |ESC2-;tower;LL;7| (50 . |setUnion|) (56 . |kernels|)
              (|Mapping| 23 23 23) (|List| 23) (61 . |reduce|)
              |ESC2-;kernels;LL;8| (68 . |operator|) (|List| 9)
              |ESC2-;operators;SL;9| (|NonNegativeInteger|) (73 . |max|)
              (79 . |height|) (|Mapping| 43 43 43) (|List| 43) (84 . |reduce|)
              |ESC2-;height;SNni;10| (91 . |name|) (|List| 10) (96 . |member?|)
              |ESC2-;freeOf?;SSB;11| (102 . |is?|) |ESC2-;distribute;2S;12|
              (108 . |One|) (|Mapping| 6 6) (|BasicOperatorFunctions1| 6)
              (112 . |derivative|) (118 . |retract|) (123 . |member?|)
              |ESC2-;freeOf?;2SB;13| (129 . |kernel|) |ESC2-;kernel;Bo2S;14|
              |ESC2-;elt;Bo2S;15| |ESC2-;elt;Bo3S;16| |ESC2-;elt;Bo4S;17|
              |ESC2-;elt;Bo5S;18| |ESC2-;elt;Bo6S;19| |ESC2-;elt;Bo7S;20|
              |ESC2-;elt;Bo8S;21| |ESC2-;elt;Bo9S;22| |ESC2-;elt;Bo10S;23|
              (|Mapping| % 15) (|List| 74) (135 . |eval|) |ESC2-;eval;SSMS;24|
              (142 . |name|) |ESC2-;eval;SBoMS;25| (|List| 6) (147 . |first|)
              (|Mapping| % %) |ESC2-;eval;SSMS;26| (152 . |eval|)
              |ESC2-;eval;SBoMS;27| (|List| 88) (159 . |subst|) (|Equation| %)
              |ESC2-;subst;SES;28| (|List| 82) |ESC2-;eval;SLLS;29|
              |ESC2-;eval;SLLS;30| |ESC2-;eval;SLLS;31| (165 . |argument|)
              (170 . =) (176 . |coerce|) |ESC2-;map;MKS;32| (|String|)
              (181 . |string|) |ESC2-;operator;2Bo;33| (|Union| 7 '#1="failed")
              |ESC2-;mainKernel;SU;34| (186 . |set|)
              (|Union| (|None|) '"failed") (191 . |property|) (197 . |second|)
              (202 . |remove!|) (208 . |belong?|) |ESC2-;kernel;BoLS;36|
              (213 . |height|) (218 . |kernel|) (|Union| 43 '"failed")
              (225 . |arity|) (230 . ~=) (|Union| 6 '"failed")
              (236 . |evaluate|) |ESC2-;elt;BoLS;38| (242 . |mainKernel|)
              (247 . ~=) |ESC2-;retract;SK;39| |ESC2-;retractIfCan;SU;40|
              (253 . |retractIfCan|) (258 . |is?|) |ESC2-;is?;SSB;41|
              |ESC2-;is?;SBoB;42| (264 . |eval|) |ESC2-;distribute;3S;44|
              (271 . |eval|) |ESC2-;eval;SLS;45| (278 . |subst|)
              |ESC2-;subst;SLS;46| (|Equation| 6) (285 . |lhs|) (290 . |rhs|)
              (|Integer|) (295 . |even?|) (300 . |even?|) (305 . |odd?|)
              (310 . |odd?|) (|Union| 135 '#2="failed") (315 . |retractIfCan|))
           '#(|tower| 320 |subst| 330 |retractIfCan| 342 |retract| 347 |paren|
              352 |operators| 357 |operator| 362 |odd?| 367 |map| 372
              |mainKernel| 378 |kernels| 383 |kernel| 388 |is?| 400 |height|
              412 |freeOf?| 417 |even?| 429 |eval| 434 |elt| 489 |distribute|
              585 |box| 596 |belong?| 601)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|odd?| ((|Boolean|) |#1|)) T)
                                   '((|even?| ((|Boolean|) |#1|)) T)
                                   '((|eval|
                                      (|#1| |#1| (|BasicOperator|)
                                       (|Mapping| |#1| |#1|)))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|BasicOperator|)
                                       (|Mapping| |#1| (|List| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|BasicOperator|))
                                       (|List|
                                        (|Mapping| |#1| (|List| |#1|)))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|BasicOperator|))
                                       (|List| (|Mapping| |#1| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|Symbol|)
                                       (|Mapping| |#1| |#1|)))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|Symbol|)
                                       (|Mapping| |#1| (|List| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Symbol|))
                                       (|List|
                                        (|Mapping| |#1| (|List| |#1|)))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Symbol|))
                                       (|List| (|Mapping| |#1| |#1|))))
                                     T)
                                   '((|freeOf?| ((|Boolean|) |#1| (|Symbol|)))
                                     T)
                                   '((|freeOf?| ((|Boolean|) |#1| |#1|)) T)
                                   '((|map| (|#1| (|Mapping| |#1| |#1|) |#2|))
                                     T)
                                   '((|kernel|
                                      (|#1| (|BasicOperator|) (|List| |#1|)))
                                     T)
                                   '((|kernel| (|#1| (|BasicOperator|) |#1|))
                                     T)
                                   '((|is?| ((|Boolean|) |#1| (|Symbol|))) T)
                                   '((|is?|
                                      ((|Boolean|) |#1| (|BasicOperator|)))
                                     T)
                                   '((|belong?|
                                      ((|Boolean|) (|BasicOperator|)))
                                     T)
                                   '((|operator|
                                      ((|BasicOperator|) (|BasicOperator|)))
                                     T)
                                   '((|operators|
                                      ((|List| (|BasicOperator|)) |#1|))
                                     T)
                                   '((|tower| ((|List| |#2|) (|List| |#1|))) T)
                                   '((|tower| ((|List| |#2|) |#1|)) T)
                                   '((|kernels| ((|List| |#2|) (|List| |#1|)))
                                     T)
                                   '((|kernels| ((|List| |#2|) |#1|)) T)
                                   '((|mainKernel| ((|Union| |#2| #1#) |#1|))
                                     T)
                                   '((|height| ((|NonNegativeInteger|) |#1|))
                                     T)
                                   '((|distribute| (|#1| |#1| |#1|)) T)
                                   '((|distribute| (|#1| |#1|)) T)
                                   '((|paren| (|#1| |#1|)) T)
                                   '((|box| (|#1| |#1|)) T)
                                   '((|subst|
                                      (|#1| |#1| (|List| |#2|) (|List| |#1|)))
                                     T)
                                   '((|subst|
                                      (|#1| |#1| (|List| (|Equation| |#1|))))
                                     T)
                                   '((|subst| (|#1| |#1| (|Equation| |#1|))) T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) (|List| |#1|)))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1| |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|))
                                     T)
                                   '((|elt| (|#1| (|BasicOperator|) |#1| |#1|))
                                     T)
                                   '((|elt| (|#1| (|BasicOperator|) |#1|)) T)
                                   '((|eval|
                                      (|#1| |#1| (|List| |#1|) (|List| |#1|)))
                                     T)
                                   '((|eval| (|#1| |#1| |#1| |#1|)) T)
                                   '((|eval| (|#1| |#1| (|Equation| |#1|))) T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Equation| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| |#2|) (|List| |#1|)))
                                     T)
                                   '((|eval| (|#1| |#1| |#2| |#1|)) T)
                                   '((|retractIfCan| ((|Union| |#2| #2#) |#1|))
                                     T)
                                   '((|retract| (|#2| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 141
                                            '(1 11 9 10 12 2 6 0 9 15 16 2 9 19
                                              0 10 20 2 9 19 0 10 21 1 24 23 0
                                              25 1 23 0 0 26 2 24 0 0 0 28 0 24
                                              0 29 3 31 24 30 0 24 32 2 23 0 0
                                              0 34 1 6 23 0 35 3 37 23 36 0 23
                                              38 1 7 9 0 40 2 43 0 0 0 44 1 7
                                              43 0 45 3 47 43 46 0 43 48 1 7 10
                                              0 50 2 51 19 10 0 52 2 7 19 0 9
                                              54 0 6 0 56 2 58 9 9 57 59 1 6 7
                                              0 60 2 23 19 7 0 61 2 6 0 9 15 63
                                              3 6 0 0 51 75 76 1 9 10 0 78 1 80
                                              6 0 81 3 6 0 0 41 75 84 2 6 0 0
                                              86 87 1 7 80 0 94 2 80 19 0 0 95
                                              1 6 0 7 96 1 10 98 0 99 1 24 0 23
                                              103 2 9 104 0 10 105 1 80 6 0 106
                                              2 24 0 7 0 107 1 6 19 9 108 1 6
                                              43 0 110 3 7 0 9 80 43 111 1 9
                                              112 0 113 2 43 19 0 0 114 2 58
                                              115 9 80 116 1 6 101 0 118 2 6 19
                                              0 0 119 1 6 101 0 122 2 7 19 0 10
                                              123 3 6 0 0 7 0 126 3 6 0 0 23 15
                                              128 3 6 0 0 23 15 130 1 132 6 0
                                              133 1 132 6 0 134 1 135 19 0 136
                                              1 0 19 0 137 1 135 19 0 138 1 0
                                              19 0 139 1 6 140 0 141 1 0 23 0
                                              27 1 0 23 15 33 2 0 0 0 88 89 2 0
                                              0 0 86 131 1 0 101 0 121 1 0 7 0
                                              120 1 0 0 0 18 1 0 41 0 42 1 0 9
                                              9 100 1 0 19 0 139 2 0 0 82 7 97
                                              1 0 101 0 102 1 0 23 15 39 2 0 0
                                              9 15 109 2 0 0 9 0 64 2 0 19 0 9
                                              125 2 0 19 0 10 124 1 0 43 0 49 2
                                              0 19 0 10 53 2 0 19 0 0 62 1 0 19
                                              0 137 2 0 0 0 86 129 3 0 0 0 51
                                              90 92 3 0 0 0 10 74 77 3 0 0 0 10
                                              82 83 3 0 0 0 41 75 93 3 0 0 0 41
                                              90 91 3 0 0 0 9 74 79 3 0 0 0 9
                                              82 85 2 0 0 9 0 65 3 0 0 9 0 0 66
                                              5 0 0 9 0 0 0 0 68 4 0 0 9 0 0 0
                                              67 6 0 0 9 0 0 0 0 0 69 8 0 0 9 0
                                              0 0 0 0 0 0 71 7 0 0 9 0 0 0 0 0
                                              0 70 10 0 0 9 0 0 0 0 0 0 0 0 0
                                              73 9 0 0 9 0 0 0 0 0 0 0 0 72 2 0
                                              0 9 15 117 2 0 0 0 0 127 1 0 0 0
                                              55 1 0 0 0 17 1 0 19 9 22)))))
           '|lookupComplete|)) 
