
(SDEFUN |JBLF;monom| ((|c| D) (|jv| JB) ($ |OutputForm|))
        (COND ((SPADCALL |c| (QREFELT $ 13)) (SPADCALL |jv| (QREFELT $ 15)))
              ((SPADCALL |jv| (QREFELT $ 16)) (SPADCALL |c| (QREFELT $ 17)))
              ('T
               (SPADCALL (SPADCALL |c| (QREFELT $ 17))
                         (SPADCALL |jv| (QREFELT $ 15)) (QREFELT $ 18))))) 

(SDEFUN |JBLF;coerce;$Of;2| ((|l| $) ($ |OutputForm|))
        (SPROG
         ((|res| (|OutputForm|)) (#1=#:G441 NIL) (|c| NIL) (#2=#:G442 NIL)
          (|jv| NIL))
         (SEQ
          (COND ((SPADCALL |l| (QREFELT $ 19)) (SPADCALL 0 (QREFELT $ 21)))
                ('T
                 (SEQ
                  (LETT |res|
                        (|JBLF;monom| (|SPADfirst| (QCAR |l|))
                         (|SPADfirst| (QCDR |l|)) $))
                  (SEQ (LETT |jv| NIL) (LETT #2# (CDR (QCDR |l|)))
                       (LETT |c| NIL) (LETT #1# (CDR (QCAR |l|))) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL)
                             (ATOM #2#) (PROGN (LETT |jv| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res| (|JBLF;monom| |c| |jv| $)
                                         (QREFELT $ 22)))))
                       (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))) 

(SDEFUN |JBLF;coerce;JB$;3| ((|jv| JB) ($ $))
        (SPROG ((|jt| (|Symbol|)))
               (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT $ 25)))
                    (EXIT
                     (COND ((EQUAL |jt| '|Const|) (|spadConstant| $ 26))
                           ((EQUAL |jt| '|Indep|)
                            (CONS (LIST (SPADCALL |jv| (QREFELT $ 27)))
                                  (LIST (|spadConstant| $ 28))))
                           ('T
                            (CONS (LIST (|spadConstant| $ 29))
                                  (LIST |jv|)))))))) 

(SDEFUN |JBLF;coerce;D$;4| ((|ex| D) ($ $))
        (COND ((SPADCALL |ex| (QREFELT $ 31)) (|spadConstant| $ 32))
              ('T (CONS (LIST |ex|) (LIST (|spadConstant| $ 28)))))) 

(SDEFUN |JBLF;coerce;SemL;5| ((|jm| |SparseEchelonMatrix| JB D) ($ |List| $))
        (SPROG
         ((|res| (|List| $))
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| D))))
          (#1=#:G452 NIL) (|i| NIL))
         (SEQ (LETT |res| (SPADCALL (QREFELT $ 35)))
              (SEQ (LETT |i| 1) (LETT #1# (SPADCALL |jm| (QREFELT $ 37))) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |r| (SPADCALL |jm| |i| (QREFELT $ 40)))
                        (EXIT
                         (COND
                          ((NULL (NULL (QCAR |r|)))
                           (LETT |res|
                                 (SPADCALL (CONS (QCDR |r|) (QCAR |r|)) |res|
                                           (QREFELT $ 41)))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 42)))))) 

(SDEFUN |JBLF;coerce;LSem;6| ((|ll| |List| $) ($ |SparseEchelonMatrix| JB D))
        (SPROG
         ((#1=#:G460 NIL) (|l| NIL) (|i| NIL)
          (|res| (|SparseEchelonMatrix| JB D)) (|inds| (|List| JB))
          (#2=#:G459 NIL))
         (SEQ (LETT |inds| NIL)
              (SEQ (LETT |l| NIL) (LETT #2# |ll|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |l| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |inds|
                           (SPADCALL
                            (SPADCALL (ELT $ 45) |inds| (QCDR |l|)
                                      (QREFELT $ 48))
                            (QREFELT $ 49)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL |inds| (SPADCALL |ll| (QREFELT $ 50))
                              (QREFELT $ 51)))
              (SEQ (LETT |i| 1) (LETT |l| NIL) (LETT #1# |ll|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |l| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |res| |i| (QCDR |l|) (QCAR |l|)
                               (QREFELT $ 54))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JBLF;ground?;$B;7| ((|l| $) ($ |Boolean|))
        (COND ((SPADCALL |l| (QREFELT $ 19)) 'T)
              ('T (SPADCALL (|SPADfirst| (QCDR |l|)) (QREFELT $ 16))))) 

(SDEFUN |JBLF;ground;2$;8| ((|l| $) ($ $))
        (COND
         ((NULL (SPADCALL (|spadConstant| $ 28) (QCDR |l|) (QREFELT $ 57)))
          (|spadConstant| $ 32))
         ('T
          (CONS (LIST (SPADCALL (QCAR |l|) (QREFELT $ 58)))
                (LIST (|spadConstant| $ 28)))))) 

(SDEFUN |JBLF;retractIfCan;$U;9| ((|l| $) ($ |Union| D "failed"))
        (COND ((SPADCALL |l| (QREFELT $ 19)) (CONS 0 (|spadConstant| $ 60)))
              ((SPADCALL (|SPADfirst| (QCDR |l|)) (QREFELT $ 16))
               (CONS 0 (|SPADfirst| (QCAR |l|))))
              ('T (CONS 1 "failed")))) 

(PUT '|JBLF;numerator;2$;10| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |JBLF;numerator;2$;10| ((|l| $) ($ $)) |l|) 

(SDEFUN |JBLF;denominator;2$;11| ((|l| $) ($ $)) (|spadConstant| $ 26)) 

(SDEFUN |JBLF;retractIfCan;JbeU;12|
        ((|ex| |JetBundleExpression| JB) ($ |Union| $ "failed"))
        (SPROG
         ((|resC| (|List| D)) (#1=#:G489 NIL) (|cd| #2=(|Union| D "failed"))
          (#3=#:G490 NIL) (|jv| NIL) (|resJ| (|List| JB)) (|pd| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |pd| (SPADCALL |ex| (QREFELT $ 67)))
                (EXIT
                 (COND
                  ((QEQCAR |pd| 0)
                   (CONS 0
                         (CONS (LIST (QCDR |pd|))
                               (LIST (|spadConstant| $ 28)))))
                  ('T
                   (SEQ (LETT |resJ| (SPADCALL |ex| (QREFELT $ 68)))
                        (LETT |resC| NIL)
                        (SEQ (LETT |jv| NIL) (LETT #3# |resJ|) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |jv| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |cd|
                                    (SPADCALL
                                     (SPADCALL |ex| |jv| (QREFELT $ 69))
                                     (QREFELT $ 67)))
                              (EXIT
                               (COND
                                ((QEQCAR |cd| 1)
                                 (PROGN
                                  (LETT #1# (CONS 1 "failed"))
                                  (GO #4=#:G488)))
                                ('T (LETT |resC| (CONS (QCDR |cd|) |resC|))))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (CONS 0 (CONS (NREVERSE |resC|) |resJ|)))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |JBLF;retract;Jbe$;13| ((|ex| |JetBundleExpression| JB) ($ $))
        (SPROG ((|pl| (|Union| $ "failed")))
               (SEQ (LETT |pl| (SPADCALL |ex| (QREFELT $ 70)))
                    (EXIT
                     (COND ((QEQCAR |pl| 1) (|error| "non-linear function"))
                           ('T (QCDR |pl|))))))) 

(SDEFUN |JBLF;zero?;$B;14| ((|l| $) ($ |Boolean|)) (NULL (QCDR |l|))) 

(SDEFUN |JBLF;=;2$B;15| ((|l1| $) (|l2| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |l1| |l2| (QREFELT $ 72)) (QREFELT $ 19))) 

(PUT '|JBLF;Zero;$;16| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(SDEFUN |JBLF;Zero;$;16| (($ $)) (CONS NIL NIL)) 

(SDEFUN |JBLF;One;$;17| (($ $))
        (CONS (LIST (|spadConstant| $ 29)) (LIST (|spadConstant| $ 28)))) 

(SDEFUN |JBLF;-;2$;18| ((|l| $) ($ $))
        (SPROG ((#1=#:G503 NIL) (|c| NIL) (#2=#:G502 NIL))
               (SEQ
                (CONS
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |c| NIL) (LETT #1# (QCAR |l|)) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 74)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QCDR |l|))))) 

(SDEFUN |JBLF;+;3$;19| ((|l1| $) (|l2| $) ($ $))
        (SPROG
         ((|lj2| (|List| JB)) (|lc2| (|List| D)) (|resJ| (|List| JB))
          (|resC| (|List| D)) (|sum| (D)) (#1=#:G520 NIL) (|c1| NIL)
          (#2=#:G521 NIL) (|j1| NIL))
         (SEQ
          (COND ((SPADCALL |l1| (QREFELT $ 19)) |l2|)
                ((SPADCALL |l2| (QREFELT $ 19)) |l1|)
                ('T
                 (SEQ (LETT |lc2| (SPADCALL (QCAR |l2|) (QREFELT $ 76)))
                      (LETT |lj2| (SPADCALL (QCDR |l2|) (QREFELT $ 77)))
                      (LETT |resC| NIL) (LETT |resJ| NIL)
                      (SEQ (LETT |j1| NIL) (LETT #2# (QCDR |l1|))
                           (LETT |c1| NIL) (LETT #1# (QCAR |l1|)) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |c1| (CAR #1#)) NIL)
                                 (ATOM #2#) (PROGN (LETT |j1| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |lj2|) NIL)
                                          ('T
                                           (SPADCALL (|SPADfirst| |lj2|) |j1|
                                                     (QREFELT $ 45)))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |resC|
                                        (CONS (|SPADfirst| |lc2|) |resC|))
                                  (LETT |resJ|
                                        (CONS (|SPADfirst| |lj2|) |resJ|))
                                  (LETT |lc2| (CDR |lc2|))
                                  (EXIT (LETT |lj2| (CDR |lj2|))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (COND
                              ((OR (NULL |lj2|)
                                   (NULL
                                    (SPADCALL (|SPADfirst| |lj2|) |j1|
                                              (QREFELT $ 78))))
                               (SEQ (LETT |resC| (CONS |c1| |resC|))
                                    (EXIT (LETT |resJ| (CONS |j1| |resJ|)))))
                              ('T
                               (SEQ
                                (LETT |sum|
                                      (SPADCALL |c1| (|SPADfirst| |lc2|)
                                                (QREFELT $ 79)))
                                (COND
                                 ((NULL (SPADCALL |sum| (QREFELT $ 31)))
                                  (SEQ (LETT |resC| (CONS |sum| |resC|))
                                       (EXIT
                                        (LETT |resJ| (CONS |j1| |resJ|))))))
                                (LETT |lc2| (CDR |lc2|))
                                (EXIT (LETT |lj2| (CDR |lj2|))))))))
                           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (CONS (SPADCALL (NREVERSE |resC|) |lc2| (QREFELT $ 80))
                             (SPADCALL (NREVERSE |resJ|) |lj2|
                                       (QREFELT $ 81)))))))))) 

(SDEFUN |JBLF;*;I2$;20| ((|i| |Integer|) (|l| $) ($ $))
        (SPROG ((#1=#:G527 NIL) (|c| NIL) (#2=#:G526 NIL))
               (SEQ
                (COND ((ZEROP |i|) (|spadConstant| $ 32)) ((EQL |i| 1) |l|)
                      ('T
                       (CONS
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |c| NIL) (LETT #1# (QCAR |l|)) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |c| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |i| |c| (QREFELT $ 83))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QCDR |l|))))))) 

(SDEFUN |JBLF;*;D2$;21| ((|ex| D) (|l| $) ($ $))
        (SPROG ((#1=#:G533 NIL) (|c| NIL) (#2=#:G532 NIL))
               (SEQ
                (COND ((SPADCALL |ex| (QREFELT $ 31)) (|spadConstant| $ 32))
                      ((SPADCALL |ex| (QREFELT $ 13)) |l|)
                      ('T
                       (CONS
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |c| NIL) (LETT #1# (QCAR |l|)) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |c| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |ex| |c| (QREFELT $ 85))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QCDR |l|))))))) 

(SDEFUN |JBLF;*;3$;22| ((|l1| $) (|l2| $) ($ $))
        (COND
         ((OR (SPADCALL |l1| (QREFELT $ 19)) (SPADCALL |l2| (QREFELT $ 19)))
          (|spadConstant| $ 32))
         ('T
          (COND
           ((SPADCALL (QCDR |l1|) (LIST (|spadConstant| $ 28)) (QREFELT $ 87))
            (SPADCALL (|SPADfirst| (QCAR |l1|)) |l2| (QREFELT $ 86)))
           ((SPADCALL (QCDR |l2|) (LIST (|spadConstant| $ 28)) (QREFELT $ 87))
            (SPADCALL (|SPADfirst| (QCAR |l2|)) |l1| (QREFELT $ 86)))
           ('T (|error| "non-linear function")))))) 

(SDEFUN |JBLF;recip;$U;23| ((|l| $) ($ |Union| $ "failed"))
        (SPROG ((|rc| (|Union| D "failed")))
               (SEQ
                (COND
                 ((SPADCALL (QCDR |l|) (LIST (|spadConstant| $ 28))
                            (QREFELT $ 87))
                  (SEQ
                   (LETT |rc|
                         (SPADCALL (|SPADfirst| (QCAR |l|)) (QREFELT $ 89)))
                   (EXIT
                    (COND
                     ((QEQCAR |rc| 0)
                      (CONS 0 (SPADCALL (QCDR |rc|) (QREFELT $ 33))))
                     (#1='T (CONS 1 "failed"))))))
                 (#1# (CONS 1 "failed")))))) 

(SDEFUN |JBLF;exquo;2$U;24| ((|l1| $) (|l2| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((|newC| (|List| D)) (#2=#:G562 NIL) (|e| (|Union| D #1#))
          (#3=#:G563 NIL) (|c| NIL) (|d| (D)))
         (SEQ
          (EXIT
           (COND
            ((NULL (SPADCALL (|SPADfirst| (QCDR |l2|)) (QREFELT $ 16)))
             (CONS 1 "failed"))
            ('T
             (SEQ (LETT |d| (|SPADfirst| (QCAR |l2|))) (LETT |newC| NIL)
                  (SEQ (LETT |c| NIL) (LETT #3# (QCAR |l1|)) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |c| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |e| (SPADCALL |c| |d| (QREFELT $ 91)))
                            (EXIT
                             (COND
                              ((QEQCAR |e| 1)
                               (PROGN
                                (LETT #2# (CONS 1 "failed"))
                                (GO #4=#:G561)))
                              ('T (LETT |newC| (CONS (QCDR |e|) |newC|))))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 0 (CONS (NREVERSE |newC|) (QCDR |l1|))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |JBLF;gcd;3$;25| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|g| (D)))
               (SEQ
                (COND
                 ((OR (> (LENGTH (QCDR |l1|)) 1) (> (LENGTH (QCDR |l2|)) 1))
                  (|spadConstant| $ 26))
                 ('T
                  (SEQ
                   (LETT |g|
                         (SPADCALL (|SPADfirst| (QCAR |l1|))
                                   (|SPADfirst| (QCAR |l2|)) (QREFELT $ 93)))
                   (EXIT
                    (COND
                     ((SPADCALL (|SPADfirst| (QCDR |l1|))
                                (|SPADfirst| (QCDR |l2|)) (QREFELT $ 78))
                      (CONS (LIST |g|) (QCDR |l1|)))
                     ('T (SPADCALL |g| (QREFELT $ 33))))))))))) 

(SDEFUN |JBLF;jetVariables;$L;26| ((|l| $) ($ |List| JB))
        (SPROG ((|res| (|List| JB)) (#1=#:G576 NIL) (|c| NIL))
               (SEQ
                (COND ((SPADCALL |l| (QREFELT $ 19)) NIL)
                      (#2='T
                       (SEQ (LETT |res| NIL)
                            (SEQ (LETT |c| NIL) (LETT #1# (QCAR |l|)) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |c| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |res|
                                         (SPADCALL (ELT $ 45) |res|
                                                   (SPADCALL |c|
                                                             (QREFELT $ 95))
                                                   (QREFELT $ 48)))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |res| (SPADCALL |res| (QREFELT $ 49)))
                            (COND
                             ((SPADCALL (|spadConstant| $ 28) (QCDR |l|)
                                        (QREFELT $ 57))
                              (LETT |res|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 28) (QCDR |l|)
                                               (QREFELT $ 96))
                                     |res| (QREFELT $ 81))))
                             (#2#
                              (LETT |res|
                                    (SPADCALL (QCDR |l|) |res|
                                              (QREFELT $ 97)))))
                            (EXIT |res|))))))) 

(SDEFUN |JBLF;differentiate;$S$;27| ((|l| $) (|s| |Symbol|) ($ $))
        (SPROG
         ((|resJ| (|List| JB)) (|resC| (|List| D)) (|dc| (D)) (#1=#:G582 NIL)
          (|c| NIL) (#2=#:G583 NIL) (|j| NIL))
         (SEQ (LETT |resC| NIL) (LETT |resJ| NIL)
              (SEQ (LETT |j| NIL) (LETT #2# (QCDR |l|)) (LETT |c| NIL)
                   (LETT #1# (QCAR |l|)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL) (ATOM #2#)
                         (PROGN (LETT |j| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |dc| (SPADCALL |c| |s| (QREFELT $ 99)))
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |dc| (QREFELT $ 31)))
                           (SEQ (LETT |resC| (CONS |dc| |resC|))
                                (EXIT (LETT |resJ| (CONS |j| |resJ|))))))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |resC|) (NREVERSE |resJ|)))))) 

(SDEFUN |JBLF;differentiate;$JB$;28| ((|l| $) (|jv| JB) ($ $))
        (SPROG
         ((|pos| (|Integer|)) (|resJ| (|List| JB)) (|resC| (|List| D))
          (|dc| (D)) (#1=#:G591 NIL) (|c| NIL) (#2=#:G592 NIL) (|j| NIL)
          (|jt| (|Symbol|)))
         (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT $ 25)))
              (EXIT
               (COND
                ((EQUAL |jt| '|Indep|)
                 (SEQ (LETT |resC| NIL) (LETT |resJ| NIL)
                      (SEQ (LETT |j| NIL) (LETT #2# (QCDR |l|)) (LETT |c| NIL)
                           (LETT #1# (QCAR |l|)) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL)
                                 (ATOM #2#) (PROGN (LETT |j| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |dc| (SPADCALL |c| |jv| (QREFELT $ 101)))
                                (EXIT
                                 (COND
                                  ((NULL (SPADCALL |dc| (QREFELT $ 31)))
                                   (SEQ (LETT |resC| (CONS |dc| |resC|))
                                        (EXIT
                                         (LETT |resJ| (CONS |j| |resJ|))))))))
                           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT (CONS (NREVERSE |resC|) (NREVERSE |resJ|)))))
                (#3='T
                 (SEQ (LETT |pos| (SPADCALL |jv| (QCDR |l|) (QREFELT $ 102)))
                      (EXIT
                       (COND
                        ((< |pos| (PROGN (QCDR |l|) 1)) (|spadConstant| $ 32))
                        (#3#
                         (CONS
                          (LIST (SPADCALL (QCAR |l|) |pos| (QREFELT $ 103)))
                          (LIST (|spadConstant| $ 28))))))))))))) 

(SDEFUN |JBLF;jacobiMatrix;LSem;29|
        ((|sys| |List| $) ($ |SparseEchelonMatrix| JB $))
        (SPROG
         ((|rowC| (|List| $)) (|rowJ| #1=(|List| JB)) (|dCo| (|List| D))
          (|dJV| #1#) (|dco| (D)) (#2=#:G625 NIL) (|co| NIL) (#3=#:G626 NIL)
          (|jv| NIL) (#4=#:G624 NIL) (|cjv| NIL) (|ents| (|List| $))
          (#5=#:G623 NIL) (#6=#:G622 NIL) (#7=#:G621 NIL) (|eq| NIL) (|i| NIL)
          (|res| (|SparseEchelonMatrix| JB $)) (#8=#:G620 NIL) (#9=#:G619 NIL)
          (#10=#:G618 NIL) (|cinds| #1#) (#11=#:G617 NIL) (|inds| #1#)
          (#12=#:G616 NIL))
         (SEQ (LETT |inds| NIL) (LETT |cinds| NIL)
              (SEQ (LETT |eq| NIL) (LETT #12# |sys|) G190
                   (COND
                    ((OR (ATOM #12#) (PROGN (LETT |eq| (CAR #12#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |inds|
                          (SPADCALL
                           (SPADCALL (ELT $ 45) |inds| (QCDR |eq|)
                                     (QREFELT $ 48))
                           (QREFELT $ 49)))
                    (EXIT
                     (SEQ (LETT |co| NIL) (LETT #11# (QCAR |eq|)) G190
                          (COND
                           ((OR (NULL (< (LENGTH |cinds|) (QREFELT $ 11)))
                                (ATOM #11#) (PROGN (LETT |co| (CAR #11#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |cinds|
                                  (SPADCALL
                                   (SPADCALL (ELT $ 45) |cinds|
                                             (SPADCALL |co| (QREFELT $ 95))
                                             (QREFELT $ 48))
                                   (QREFELT $ 49)))))
                          (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #12# (CDR #12#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((NULL |cinds|)
                 (SEQ
                  (LETT |res|
                        (SPADCALL |inds| (SPADCALL |sys| (QREFELT $ 50))
                                  (QREFELT $ 106)))
                  (SEQ (LETT |i| 1) (LETT |eq| NIL) (LETT #10# |sys|) G190
                       (COND
                        ((OR (ATOM #10#) (PROGN (LETT |eq| (CAR #10#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QCDR |eq|)
                                   (PROGN
                                    (LETT #9# NIL)
                                    (SEQ (LETT |co| NIL) (LETT #8# (QCAR |eq|))
                                         G190
                                         (COND
                                          ((OR (ATOM #8#)
                                               (PROGN
                                                (LETT |co| (CAR #8#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #9#
                                                 (CONS
                                                  (SPADCALL |co|
                                                            (QREFELT $ 33))
                                                  #9#))))
                                         (LETT #8# (CDR #8#)) (GO G190) G191
                                         (EXIT (NREVERSE #9#))))
                                   (QREFELT $ 107))))
                       (LETT #10# (PROG1 (CDR #10#) (LETT |i| (|inc_SI| |i|))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))
                ('T
                 (SEQ
                  (LETT |res|
                        (SPADCALL (SPADCALL |inds| |cinds| (QREFELT $ 97))
                                  (SPADCALL |sys| (QREFELT $ 50))
                                  (QREFELT $ 106)))
                  (SEQ (LETT |i| 1) (LETT |eq| NIL) (LETT #7# |sys|) G190
                       (COND
                        ((OR (ATOM #7#) (PROGN (LETT |eq| (CAR #7#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ents|
                              (PROGN
                               (LETT #6# NIL)
                               (SEQ (LETT |co| NIL) (LETT #5# (QCAR |eq|)) G190
                                    (COND
                                     ((OR (ATOM #5#)
                                          (PROGN (LETT |co| (CAR #5#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #6#
                                            (CONS
                                             (SPADCALL |co| (QREFELT $ 33))
                                             #6#))))
                                    (LETT #5# (CDR #5#)) (GO G190) G191
                                    (EXIT (NREVERSE #6#)))))
                        (LETT |rowJ| NIL)
                        (LETT |rowC| (SPADCALL (QREFELT $ 35)))
                        (SEQ (LETT |cjv| NIL) (LETT #4# |cinds|) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |cjv| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ (LETT |dJV| NIL) (LETT |dCo| NIL)
                                  (SEQ (LETT |jv| NIL) (LETT #3# (QCDR |eq|))
                                       (LETT |co| NIL) (LETT #2# (QCAR |eq|))
                                       G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN (LETT |co| (CAR #2#)) NIL)
                                             (ATOM #3#)
                                             (PROGN (LETT |jv| (CAR #3#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |dco|
                                              (SPADCALL |co| |cjv|
                                                        (QREFELT $ 101)))
                                        (EXIT
                                         (COND
                                          ((NULL
                                            (SPADCALL |dco| (QREFELT $ 31)))
                                           (SEQ (LETT |dJV| (CONS |jv| |dJV|))
                                                (EXIT
                                                 (LETT |dCo|
                                                       (CONS |dco|
                                                             |dCo|))))))))
                                       (LETT #2#
                                             (PROG1 (CDR #2#)
                                               (LETT #3# (CDR #3#))))
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (COND
                                    ((NULL (NULL |dJV|))
                                     (SEQ (LETT |rowJ| (CONS |cjv| |rowJ|))
                                          (EXIT
                                           (LETT |rowC|
                                                 (SPADCALL
                                                  (CONS (NREVERSE |dCo|)
                                                        (NREVERSE |dJV|))
                                                  |rowC| (QREFELT $ 41)))))))))
                             (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (SPADCALL |res| |i|
                                   (SPADCALL (QCDR |eq|) (NREVERSE |rowJ|)
                                             (QREFELT $ 97))
                                   (SPADCALL |ents|
                                             (SPADCALL |rowC| (QREFELT $ 42))
                                             (QREFELT $ 108))
                                   (QREFELT $ 107))))
                       (LETT #7# (PROG1 (CDR #7#) (LETT |i| (|inc_SI| |i|))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))))))) 

(SDEFUN |JBLF;jacobiMatrix;LLSem;30|
        ((|sys| |List| $) (|varlist| |List| (|List| JB))
         ($ |SparseEchelonMatrix| JB $))
        (SPROG
         ((|rowC| (|List| $)) (|rowJ| #1=(|List| JB)) (|dCo| (|List| D))
          (|dJV| #1#) (|dco| (D)) (#2=#:G652 NIL) (|co| NIL) (#3=#:G653 NIL)
          (|jv| NIL) (#4=#:G651 NIL) (|ijv| NIL) (|ivars| (|List| JB))
          (|ents| (|List| $)) (#5=#:G650 NIL) (#6=#:G649 NIL) (#7=#:G647 NIL)
          (|eq| NIL) (#8=#:G648 NIL) (|vars| NIL) (|i| NIL)
          (|res| (|SparseEchelonMatrix| JB $)) (|inds| (|List| JB))
          (#9=#:G646 NIL))
         (SEQ (LETT |inds| (|SPADfirst| |varlist|))
              (SEQ (LETT |vars| NIL) (LETT #9# (CDR |varlist|)) G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |vars| (CAR #9#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |inds|
                           (SPADCALL
                            (SPADCALL (ELT $ 45) |inds| |vars| (QREFELT $ 48))
                            (QREFELT $ 49)))))
                   (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL |inds| (SPADCALL |sys| (QREFELT $ 50))
                              (QREFELT $ 106)))
              (SEQ (LETT |i| 1) (LETT |vars| NIL) (LETT #8# |varlist|)
                   (LETT |eq| NIL) (LETT #7# |sys|) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |eq| (CAR #7#)) NIL)
                         (ATOM #8#) (PROGN (LETT |vars| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ents|
                          (PROGN
                           (LETT #6# NIL)
                           (SEQ (LETT |co| NIL) (LETT #5# (QCAR |eq|)) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |co| (CAR #5#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS (SPADCALL |co| (QREFELT $ 33))
                                              #6#))))
                                (LETT #5# (CDR #5#)) (GO G190) G191
                                (EXIT (NREVERSE #6#)))))
                    (LETT |ivars|
                          (SPADCALL (ELT $ 111)
                                    (SPADCALL
                                     (CONS #'|JBLF;jacobiMatrix;LLSem;30!0| $)
                                     |vars| (QREFELT $ 114))
                                    (QREFELT $ 115)))
                    (EXIT
                     (COND
                      ((NULL |ivars|)
                       (SPADCALL |res| |i| (QCDR |eq|) |ents| (QREFELT $ 107)))
                      ('T
                       (SEQ (LETT |rowJ| NIL)
                            (LETT |rowC| (SPADCALL (QREFELT $ 35)))
                            (SEQ (LETT |ijv| NIL) (LETT #4# |ivars|) G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT |ijv| (CAR #4#)) NIL))
                                   (GO G191)))
                                 (SEQ (LETT |dJV| NIL) (LETT |dCo| NIL)
                                      (SEQ (LETT |jv| NIL)
                                           (LETT #3# (QCDR |eq|))
                                           (LETT |co| NIL)
                                           (LETT #2# (QCAR |eq|)) G190
                                           (COND
                                            ((OR (ATOM #2#)
                                                 (PROGN
                                                  (LETT |co| (CAR #2#))
                                                  NIL)
                                                 (ATOM #3#)
                                                 (PROGN
                                                  (LETT |jv| (CAR #3#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |dco|
                                                  (SPADCALL |co| |ijv|
                                                            (QREFELT $ 101)))
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (SPADCALL |dco|
                                                          (QREFELT $ 31)))
                                               (SEQ
                                                (LETT |dJV| (CONS |jv| |dJV|))
                                                (EXIT
                                                 (LETT |dCo|
                                                       (CONS |dco|
                                                             |dCo|))))))))
                                           (LETT #2#
                                                 (PROG1 (CDR #2#)
                                                   (LETT #3# (CDR #3#))))
                                           (GO G190) G191 (EXIT NIL))
                                      (EXIT
                                       (COND
                                        ((NULL (NULL |dJV|))
                                         (SEQ (LETT |rowJ| (CONS |ijv| |rowJ|))
                                              (EXIT
                                               (LETT |rowC|
                                                     (SPADCALL
                                                      (CONS (NREVERSE |dCo|)
                                                            (NREVERSE |dJV|))
                                                      |rowC|
                                                      (QREFELT $ 41)))))))))
                                 (LETT #4# (CDR #4#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (SPADCALL |res| |i|
                                       (SPADCALL (QCDR |eq|) (NREVERSE |rowJ|)
                                                 (QREFELT $ 97))
                                       (SPADCALL |ents|
                                                 (SPADCALL |rowC|
                                                           (QREFELT $ 42))
                                                 (QREFELT $ 108))
                                       (QREFELT $ 107))))))))
                   (LETT #7#
                         (PROG1 (CDR #7#)
                           (LETT #8#
                                 (PROG1 (CDR #8#) (LETT |i| (|inc_SI| |i|))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JBLF;jacobiMatrix;LLSem;30!0| ((|x| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 25)) '|Indep| (QREFELT $ 112))) 

(SDEFUN |JBLF;leadingDer;$JB;31| ((|l| $) ($ JB))
        (COND ((SPADCALL |l| (QREFELT $ 19)) (|spadConstant| $ 28))
              ('T (|SPADfirst| (QCDR |l|))))) 

(SDEFUN |JBLF;freeOf?;$JBB;32| ((|l| $) (|jv| JB) ($ |Boolean|))
        (SPROG ((#1=#:G665 NIL) (|c| NIL) (#2=#:G664 NIL))
               (SEQ
                (COND
                 ((EQUAL (SPADCALL |jv| (QREFELT $ 25)) '|Indep|)
                  (SPADCALL (ELT $ 120)
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |c| NIL) (LETT #1# (QCAR |l|)) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |c| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (SPADCALL |c| |jv| (QREFELT $ 119))
                                           #2#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            'T (QREFELT $ 123)))
                 ('T (NULL (SPADCALL |jv| (QCDR |l|) (QREFELT $ 57)))))))) 

(SDEFUN |JBLF;solveFor;$JBU;33| ((|l| $) (|jv| JB) ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G679 NIL) (|c| NIL) (#2=#:G678 NIL) (|rc| (|Union| D "failed"))
          (|pos| (|Integer|)) (|jt| (|Symbol|)))
         (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT $ 25)))
              (COND
               ((OR (EQUAL |jt| '|Const|) (EQUAL |jt| '|Indep|))
                (EXIT (CONS 1 "failed"))))
              (LETT |pos| (SPADCALL |jv| (QCDR |l|) (QREFELT $ 102)))
              (EXIT
               (COND ((< |pos| (PROGN (QCDR |l|) 1)) (CONS 1 "failed"))
                     ((EQL (LENGTH (QCDR |l|)) 1)
                      (CONS 0 (|spadConstant| $ 32)))
                     (#3='T
                      (SEQ
                       (LETT |rc|
                             (SPADCALL
                              (SPADCALL (QCAR |l|) |pos| (QREFELT $ 125))
                              (QREFELT $ 89)))
                       (EXIT
                        (COND ((QEQCAR |rc| 1) (CONS 1 "failed"))
                              (#3#
                               (CONS 0
                                     (CONS
                                      (PROGN
                                       (LETT #2# NIL)
                                       (SEQ (LETT |c| NIL)
                                            (LETT #1#
                                                  (SPADCALL (QCAR |l|) |pos|
                                                            (QREFELT $ 126)))
                                            G190
                                            (COND
                                             ((OR (ATOM #1#)
                                                  (PROGN
                                                   (LETT |c| (CAR #1#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #2#
                                                    (CONS
                                                     (SPADCALL
                                                      (SPADCALL |c| (QCDR |rc|)
                                                                (QREFELT $ 85))
                                                      (QREFELT $ 74))
                                                     #2#))))
                                            (LETT #1# (CDR #1#)) (GO G190) G191
                                            (EXIT (NREVERSE #2#))))
                                      (SPADCALL (QCDR |l|) |pos|
                                                (QREFELT $ 127)))))))))))))) 

(SDEFUN |JBLF;subst;$JB2$;34| ((|l| $) (|jv| JB) (|exp| $) ($ $))
        (SPROG
         ((|nl| ($)) (|c| (D)) (|pos| (|Integer|)) (|resJ| (|List| JB))
          (|resC| (|List| D)) (|nc| (D)) (#1=#:G688 NIL) (#2=#:G689 NIL)
          (|cj| NIL) (|xexp| (D)) (|jt| (|Symbol|)))
         (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT $ 25)))
              (EXIT
               (COND
                ((EQUAL |jt| '|Const|)
                 (|error| "Substitution for 1 not allowed"))
                ((EQUAL |jt| '|Indep|)
                 (SEQ (LETT |xexp| (SPADCALL |exp| (QREFELT $ 129)))
                      (LETT |resC| NIL) (LETT |resJ| NIL)
                      (SEQ (LETT |cj| NIL) (LETT #2# (QCDR |l|)) (LETT |c| NIL)
                           (LETT #1# (QCAR |l|)) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL)
                                 (ATOM #2#) (PROGN (LETT |cj| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |nc|
                                  (SPADCALL |c| |jv| |xexp| (QREFELT $ 130)))
                            (EXIT
                             (COND
                              ((NULL (SPADCALL |nc| (QREFELT $ 31)))
                               (SEQ (LETT |resC| (CONS |nc| |resC|))
                                    (EXIT
                                     (LETT |resJ| (CONS |cj| |resJ|))))))))
                           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT (CONS (NREVERSE |resC|) (NREVERSE |resJ|)))))
                (#3='T
                 (SEQ (LETT |pos| (SPADCALL |jv| (QCDR |l|) (QREFELT $ 102)))
                      (EXIT
                       (COND ((ZEROP |pos|) |l|)
                             (#3#
                              (SEQ
                               (LETT |c|
                                     (SPADCALL (QCAR |l|) |pos|
                                               (QREFELT $ 103)))
                               (LETT |nl|
                                     (CONS
                                      (SPADCALL (QCAR |l|) |pos|
                                                (QREFELT $ 126))
                                      (SPADCALL (QCDR |l|) |pos|
                                                (QREFELT $ 127))))
                               (EXIT
                                (SPADCALL |nl|
                                          (SPADCALL |c| |exp| (QREFELT $ 86))
                                          (QREFELT $ 82)))))))))))))) 

(SDEFUN |JBLF;simplify;LSemR;35|
        ((|sys| |List| $) (|jm| |SparseEchelonMatrix| JB $)
         ($ |Record| (|:| |Sys| (|List| $))
          (|:| JM (|SparseEchelonMatrix| JB $))
          (|:| |Depend|
               (|Union| "failed" (|List| (|List| (|NonNegativeInteger|)))))))
        (SPROG
         ((|dep| (|List| (|List| (|NonNegativeInteger|))))
          (|depj| (|List| (|NonNegativeInteger|))) (#1=#:G709 NIL)
          (|kb| (|Integer|)) (#2=#:G729 NIL) (|k| NIL) (|rowC| (|List| $))
          (|rowJ| #3=(|List| JB)) (|dCo| (|List| D)) (|dJV| #3#) (|dco| (D))
          (#4=#:G727 NIL) (|co| NIL) (#5=#:G728 NIL) (|jv| NIL) (#6=#:G726 NIL)
          (|cjv| NIL) (|ents| (|List| $)) (#7=#:G725 NIL) (#8=#:G724 NIL)
          (#9=#:G723 NIL) (#10=#:G722 NIL) (#11=#:G721 NIL) (|eq| NIL)
          (|j| NIL) (|newJM| (|SparseEchelonMatrix| JB $))
          (|cinds| (|List| JB)) (|inds| (|List| JB)) (|maxR| (|Integer|))
          (|minR| (|Integer|)) (|Trafo| #12=(|Matrix| (|Fraction| D)))
          (|newSys| (|List| $))
          (|RRec|
           (|Record| (|:| |Ech| (|SparseEchelonMatrix| JB D)) (|:| |Lt| #12#)
                     (|:| |Pivots| (|List| D))
                     (|:| |Rank| (|NonNegativeInteger|)))))
         (SEQ
          (COND
           ((EQL (SPADCALL |sys| (QREFELT $ 50)) 1)
            (VECTOR |sys| |jm| (CONS 1 (LIST (LIST 1)))))
           ('T
            (SEQ
             (LETT |RRec|
                   (SPADCALL (SPADCALL |sys| (QREFELT $ 55)) (QREFELT $ 133)))
             (LETT |newSys| (SPADCALL (QVELT |RRec| 0) (QREFELT $ 44)))
             (LETT |Trafo| (QVELT |RRec| 1)) (LETT |minR| (PROGN |Trafo| 1))
             (LETT |maxR| (SPADCALL |Trafo| (QREFELT $ 135)))
             (LETT |inds| (SPADCALL |jm| (QREFELT $ 136)))
             (LETT |cinds| (SPADCALL |inds| (QREFELT $ 77)))
             (SEQ G190
                  (COND
                   ((NULL
                     (COND ((NULL |cinds|) NIL)
                           ('T
                            (SPADCALL
                             (SPADCALL (|SPADfirst| |cinds|) (QREFELT $ 25))
                             '|Indep| (QREFELT $ 137)))))
                    (GO G191)))
                  (SEQ (EXIT (LETT |cinds| (CDR |cinds|)))) NIL (GO G190) G191
                  (EXIT NIL))
             (COND ((NULL (NULL |cinds|)) (LETT |cinds| (NREVERSE |cinds|))))
             (LETT |newJM|
                   (SPADCALL |inds| (SPADCALL |newSys| (QREFELT $ 50))
                             (QREFELT $ 106)))
             (LETT |dep| NIL)
             (SEQ (LETT |j| 1) (LETT |eq| NIL) (LETT #11# |newSys|) G190
                  (COND
                   ((OR (ATOM #11#) (PROGN (LETT |eq| (CAR #11#)) NIL))
                    (GO G191)))
                  (SEQ
                   (COND
                    ((NULL |cinds|)
                     (SPADCALL |newJM| |j| (QCDR |eq|)
                               (PROGN
                                (LETT #10# NIL)
                                (SEQ (LETT |co| NIL) (LETT #9# (QCAR |eq|))
                                     G190
                                     (COND
                                      ((OR (ATOM #9#)
                                           (PROGN (LETT |co| (CAR #9#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #10#
                                             (CONS
                                              (SPADCALL |co| (QREFELT $ 33))
                                              #10#))))
                                     (LETT #9# (CDR #9#)) (GO G190) G191
                                     (EXIT (NREVERSE #10#))))
                               (QREFELT $ 107)))
                    ('T
                     (SEQ
                      (LETT |ents|
                            (PROGN
                             (LETT #8# NIL)
                             (SEQ (LETT |co| NIL) (LETT #7# (QCAR |eq|)) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN (LETT |co| (CAR #7#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #8#
                                          (CONS (SPADCALL |co| (QREFELT $ 33))
                                                #8#))))
                                  (LETT #7# (CDR #7#)) (GO G190) G191
                                  (EXIT (NREVERSE #8#)))))
                      (LETT |rowJ| NIL) (LETT |rowC| (SPADCALL (QREFELT $ 35)))
                      (SEQ (LETT |cjv| NIL) (LETT #6# |cinds|) G190
                           (COND
                            ((OR (ATOM #6#) (PROGN (LETT |cjv| (CAR #6#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |dJV| NIL) (LETT |dCo| NIL)
                                (SEQ (LETT |jv| NIL) (LETT #5# (QCDR |eq|))
                                     (LETT |co| NIL) (LETT #4# (QCAR |eq|))
                                     G190
                                     (COND
                                      ((OR (ATOM #4#)
                                           (PROGN (LETT |co| (CAR #4#)) NIL)
                                           (ATOM #5#)
                                           (PROGN (LETT |jv| (CAR #5#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |dco|
                                            (SPADCALL |co| |cjv|
                                                      (QREFELT $ 101)))
                                      (EXIT
                                       (COND
                                        ((NULL (SPADCALL |dco| (QREFELT $ 31)))
                                         (SEQ (LETT |dJV| (CONS |jv| |dJV|))
                                              (EXIT
                                               (LETT |dCo|
                                                     (CONS |dco| |dCo|))))))))
                                     (LETT #4#
                                           (PROG1 (CDR #4#)
                                             (LETT #5# (CDR #5#))))
                                     (GO G190) G191 (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((NULL (NULL |dJV|))
                                   (SEQ (LETT |rowJ| (CONS |cjv| |rowJ|))
                                        (EXIT
                                         (LETT |rowC|
                                               (SPADCALL
                                                (CONS (NREVERSE |dCo|)
                                                      (NREVERSE |dJV|))
                                                |rowC| (QREFELT $ 41)))))))))
                           (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (SPADCALL |newJM| |j|
                                 (SPADCALL (QCDR |eq|) (NREVERSE |rowJ|)
                                           (QREFELT $ 97))
                                 (SPADCALL |ents|
                                           (SPADCALL |rowC| (QREFELT $ 42))
                                           (QREFELT $ 108))
                                 (QREFELT $ 107))))))
                   (LETT |depj| NIL)
                   (SEQ (LETT |k| |maxR|) (LETT #2# |minR|) G190
                        (COND ((< |k| #2#) (GO G191)))
                        (SEQ
                         (LETT |kb|
                               (- (+ |k| (SPADCALL |sys| (QREFELT $ 138)))
                                  |minR|))
                         (EXIT
                          (COND
                           ((NULL
                             (SPADCALL (QAREF2O |Trafo| |j| |k| 1 1)
                                       (QREFELT $ 140)))
                            (LETT |depj|
                                  (CONS
                                   (PROG1
                                       (LETT #1#
                                             (+ (- |k| |minR|)
                                                (PROGN |depj| 1)))
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   |depj|))))))
                        (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
                   (EXIT (LETT |dep| (CONS |depj| |dep|))))
                  (LETT #11# (PROG1 (CDR #11#) (LETT |j| (|inc_SI| |j|))))
                  (GO G190) G191 (EXIT NIL))
             (EXIT (VECTOR |newSys| |newJM| (CONS 1 (NREVERSE |dep|)))))))))) 

(SDEFUN |JBLF;simpOne;2$;36| ((|f| $) ($ $))
        (COND
         ((EQL (LENGTH (QCDR |f|)) 1)
          (CONS (LIST (|spadConstant| $ 29)) (QCDR |f|)))
         ('T |f|))) 

(DECLAIM (NOTINLINE |JetBundleLinearFunction;|)) 

(DEFUN |JetBundleLinearFunction| (&REST #1=#:G740)
  (SPROG NIL
         (PROG (#2=#:G741)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|JetBundleLinearFunction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |JetBundleLinearFunction;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundleLinearFunction|)))))))))) 

(DEFUN |JetBundleLinearFunction;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|JetBundleLinearFunction| DV$1 DV$2))
          (LETT $ (GETREFV 156))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|lazyRepresentation|))
                                              (|HasSignature| |#2|
                                                              (LIST
                                                               '|retractIfCan|
                                                               (LIST
                                                                (LIST '|Union|
                                                                      (|devaluate|
                                                                       |#2|)
                                                                      (|devaluate|
                                                                       "failed"))
                                                                (LIST
                                                                 '|JetBundleExpression|
                                                                 (|devaluate|
                                                                  |#1|)))))))))
          (|haddProp| |$ConstructorCache| '|JetBundleLinearFunction|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|Record| (|:| |Coeffs| (|List| |#2|))
                              (|:| |JVars| (|List| |#1|))))
          (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 70
                       (CONS (|dispatchFunction| |JBLF;retractIfCan;JbeU;12|)
                             $))
             (QSETREFV $ 71
                       (CONS (|dispatchFunction| |JBLF;retract;Jbe$;13|) $)))))
          $))) 

(MAKEPROP '|JetBundleLinearFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|PositiveInteger|) (0 . |numIndVar|) '|nn| (|Boolean|)
              (4 . |one?|) (|OutputForm|) (9 . |coerce|) (14 . |one?|)
              (19 . |coerce|) (24 . *) |JBLF;zero?;$B;14|
              (|NonNegativeInteger|) (30 . |coerce|) (35 . +)
              |JBLF;coerce;$Of;2| (|Symbol|) (41 . |type|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JBLF;One;$;17|) $))
              (46 . |coerce|) (51 . |One|) (55 . |One|) |JBLF;coerce;JB$;3|
              (59 . |zero?|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JBLF;Zero;$;16|) $))
              |JBLF;coerce;D$;4| (|List| $$) (64 . |empty|)
              (|SparseEchelonMatrix| 6 7) (68 . |nrows|)
              (|Record| (|:| |Indices| 47) (|:| |Entries| 53)) (|Integer|)
              (73 . |row|) (79 . |cons|) (85 . |reverse!|) (|List| $)
              |JBLF;coerce;SemL;5| (90 . >) (|Mapping| 12 6 6) (|List| 6)
              (96 . |merge|) (103 . |removeDuplicates!|) (108 . |#|)
              (113 . |new|) (|Void|) (|List| 7) (119 . |setRow!|)
              |JBLF;coerce;LSem;6| |JBLF;ground?;$B;7| (127 . |member?|)
              (133 . |last|) |JBLF;ground;2$;8| (138 . |Zero|)
              (|Union| 7 '"failed") |JBLF;retractIfCan;$U;9|
              |JBLF;numerator;2$;10| |JBLF;denominator;2$;11|
              (|Union| $ '"failed") (|JetBundleExpression| 6)
              (142 . |retractIfCan|) (147 . |jetVariables|)
              (152 . |differentiate|) (158 . |retractIfCan|) (163 . |retract|)
              (168 . -) |JBLF;=;2$B;15| (174 . -) |JBLF;-;2$;18| (179 . |copy|)
              (184 . |copy|) (189 . =) (195 . +) (201 . |concat!|)
              (207 . |concat!|) |JBLF;+;3$;19| (213 . *) |JBLF;*;I2$;20|
              (219 . *) |JBLF;*;D2$;21| (225 . =) |JBLF;*;3$;22|
              (231 . |recip|) |JBLF;recip;$U;23| (236 . |exquo|)
              |JBLF;exquo;2$U;24| (242 . |gcd|) |JBLF;gcd;3$;25|
              (248 . |jetVariables|) (253 . |remove|) (259 . |append|)
              |JBLF;jetVariables;$L;26| (265 . |differentiate|)
              |JBLF;differentiate;$S$;27| (271 . |differentiate|)
              (277 . |position|) (283 . |qelt|) |JBLF;differentiate;$JB$;28|
              (|SparseEchelonMatrix| 6 $$) (289 . |new|) (295 . |setRow!|)
              (303 . |append|) (|SparseEchelonMatrix| 6 $)
              |JBLF;jacobiMatrix;LSem;29| (309 . <) (315 . =) (|Mapping| 12 6)
              (321 . |select|) (327 . |sort!|) (|List| 47)
              |JBLF;jacobiMatrix;LLSem;30| |JBLF;leadingDer;$JB;31|
              (333 . |freeOf?|) (339 . |and|) (|Mapping| 12 12 12) (|List| 12)
              (345 . |reduce|) |JBLF;freeOf?;$JBB;32| (352 . |elt|)
              (358 . |delete|) (364 . |delete|) |JBLF;solveFor;$JBU;33|
              (370 . |retract|) (375 . |subst|) |JBLF;subst;$JB2$;34|
              (|Record| (|:| |Ech| $) (|:| |Lt| 134) (|:| |Pivots| 53)
                        (|:| |Rank| 20))
              (382 . |primitiveRowEchelon|) (|Matrix| 139)
              (387 . |maxRowIndex|) (392 . |allIndices|) (397 . ~=)
              (403 . |minIndex|) (|Fraction| 7) (408 . |zero?|)
              (|Union| '"failed" (|List| 147))
              (|Record| (|:| |Sys| 43) (|:| JM 109) (|:| |Depend| 141))
              |JBLF;simplify;LSemR;35| |JBLF;simpOne;2$;36|
              (|Record| (|:| |DPhi| $) (|:| |JVars| 47))
              (|Record| (|:| |DSys| 43) (|:| |JVars| 116)) (|List| 20)
              (|Union| 6 '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| 24) (|SparseUnivariatePolynomial| $) (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 413 |zero?| 419 |unitNormal| 424 |unitCanonical| 429 |unit?|
              434 |symbol| 439 |subtractIfCan| 444 |subst| 450 |sortLD| 457
              |solveFor| 462 |simplify| 468 |simpOne| 474 |simpMod| 479
              |setNotation| 492 |sample| 497 |rightRecip| 501 |rightPower| 506
              |retractIfCan| 518 |retract| 533 |reduceMod| 548 |recip| 554
              |orderDim| 559 |order| 566 |opposite?| 571 |one?| 577 |numerator|
              582 |numIndVar| 587 |numDepVar| 591 |leftRecip| 595 |leftPower|
              600 |leadingDer| 612 |lcmCoef| 617 |lcm| 623 |latex| 634
              |jetVariables| 639 |jacobiMatrix| 644 |hashUpdate!| 655 |hash|
              661 |ground?| 666 |ground| 671 |getNotation| 676 |gcdPolynomial|
              680 |gcd| 686 |freeOf?| 697 |formalDiff2| 703 |formalDiff| 717
              |extractSymbol| 735 |exquo| 740 |dimension| 746 |differentiate|
              753 |denominator| 785 |dSubst| 790 |const?| 797 |commutator| 802
              |coerce| 808 |class| 843 |characteristic| 848 |autoReduce| 852
              |associator| 857 |associates?| 864 |antiCommutator| 870
              |annihilate?| 876 ^ 882 |Zero| 894 X 898 U 907 P 916 |One| 938 =
              942 - 948 + 959 * 965 |#2| 1001)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1))
            (CONS
             '#(|JetBundleFunctionCategory&| |GcdDomain&| NIL NIL NIL
                |PartialDifferentialRing&| |EntireRing&| |Algebra&| NIL |Rng&|
                NIL |Module&| |Module&| NIL NIL NIL |NonAssociativeRing&| NIL
                NIL NIL |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL
                NIL |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Magma&| |AbelianSemiGroup&| NIL |SetCategory&|
                |RetractableTo&| |RetractableTo&| NIL NIL NIL |BasicType&| NIL
                NIL)
             (CONS
              '#((|JetBundleFunctionCategory| 6) (|GcdDomain|)
                 (|IntegralDomain|) (|LeftOreRing|) (|CommutativeRing|)
                 (|PartialDifferentialRing| 24) (|EntireRing|) (|Algebra| $$)
                 (|Ring|) (|Rng|) (|SemiRing|) (|Module| 7) (|Module| $$)
                 (|SemiRng|) (|BiModule| 7 7) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|RightModule| 7) (|LeftModule| 7)
                 (|LeftModule| $$) (|NonAssociativeRng|) (|RightModule| $$)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Magma|)
                 (|AbelianSemiGroup|) (|CommutativeStar|) (|SetCategory|)
                 (|RetractableTo| 7) (|RetractableTo| 6) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 14) (|lazyRepresentation|))
              (|makeByteWordVec2| 155
                                  '(0 6 9 10 1 7 12 0 13 1 6 14 0 15 1 6 12 0
                                    16 1 7 14 0 17 2 14 0 0 0 18 1 20 14 0 21 2
                                    14 0 0 0 22 1 6 24 0 25 1 7 0 6 27 0 6 0 28
                                    0 7 0 29 1 7 12 0 31 0 34 0 35 1 36 20 0 37
                                    2 36 38 0 39 40 2 34 0 2 0 41 1 34 0 0 42 2
                                    6 12 0 0 45 3 47 0 46 0 0 48 1 47 0 0 49 1
                                    34 20 0 50 2 36 0 47 39 51 4 36 52 0 39 47
                                    53 54 2 47 12 6 0 57 1 53 7 0 58 0 7 0 60 1
                                    7 65 66 67 1 66 47 0 68 2 66 0 0 6 69 1 0
                                    65 66 70 1 0 0 66 71 2 0 0 0 0 72 1 7 0 0
                                    74 1 53 0 0 76 1 47 0 0 77 2 6 12 0 0 78 2
                                    7 0 0 0 79 2 53 0 0 0 80 2 47 0 0 0 81 2 7
                                    0 39 0 83 2 7 0 0 0 85 2 47 12 0 0 87 1 7
                                    65 0 89 2 7 65 0 0 91 2 7 0 0 0 93 1 7 47 0
                                    95 2 47 0 6 0 96 2 47 0 0 0 97 2 7 0 0 24
                                    99 2 7 0 0 6 101 2 47 39 6 0 102 2 53 7 0
                                    39 103 2 105 0 47 39 106 4 105 52 0 39 47
                                    34 107 2 34 0 0 0 108 2 6 12 0 0 111 2 24
                                    12 0 0 112 2 47 0 113 0 114 2 47 0 46 0 115
                                    2 7 12 0 6 119 2 12 0 0 0 120 3 122 12 121
                                    0 12 123 2 53 7 0 39 125 2 53 0 0 39 126 2
                                    47 0 0 39 127 1 0 7 0 129 3 7 0 0 6 0 130 1
                                    36 132 0 133 1 134 39 0 135 1 105 47 0 136
                                    2 24 12 0 0 137 1 34 39 0 138 1 139 12 0
                                    140 2 0 12 0 0 1 1 0 12 0 19 1 0 149 0 1 1
                                    0 0 0 1 1 0 12 0 1 1 0 109 43 1 2 0 65 0 0
                                    1 3 0 0 0 6 0 131 1 0 43 43 1 2 0 65 0 6
                                    128 2 0 142 43 109 143 1 0 0 0 144 3 0 142
                                    43 109 43 1 2 0 43 43 43 1 1 0 52 24 1 0 0
                                    0 1 1 0 65 0 1 2 0 0 0 20 1 2 0 0 0 9 1 1 2
                                    65 66 70 1 0 61 0 62 1 0 148 0 1 1 2 0 66
                                    71 1 0 7 0 129 1 0 6 0 1 2 0 43 43 43 1 1 0
                                    65 0 90 3 0 20 43 109 20 1 1 0 20 0 1 2 0
                                    12 0 0 1 1 0 12 0 1 1 0 0 0 63 0 0 9 1 0 0
                                    9 1 1 0 65 0 1 2 0 0 0 20 1 2 0 0 0 9 1 1 0
                                    6 0 118 2 0 150 0 0 1 1 0 0 43 1 2 0 0 0 0
                                    1 1 0 154 0 1 1 0 47 0 98 2 0 109 43 116
                                    117 1 0 109 43 110 2 0 153 153 0 1 1 0 155
                                    0 1 1 0 12 0 56 1 0 0 0 59 0 0 24 1 2 0 152
                                    152 152 1 1 0 0 43 1 2 0 0 0 0 94 2 0 12 0
                                    6 124 3 0 145 0 9 109 1 3 0 146 43 9 109 1
                                    2 0 43 43 9 1 2 0 0 0 9 1 2 0 0 0 147 1 1 0
                                    109 109 1 2 0 65 0 0 92 3 0 20 43 109 20 1
                                    2 0 0 0 6 104 3 0 0 0 24 20 1 3 0 0 0 151
                                    147 1 2 0 0 0 24 100 2 0 0 0 151 1 1 0 0 0
                                    64 3 0 0 0 6 0 1 1 0 12 0 1 2 0 0 0 0 1 1 0
                                    36 43 55 1 0 43 36 44 1 0 0 7 33 1 0 0 6 30
                                    1 0 0 0 1 1 0 0 39 1 1 0 14 0 23 1 0 20 0 1
                                    0 0 20 1 1 0 43 43 1 3 0 0 0 0 0 1 2 0 12 0
                                    0 1 2 0 0 0 0 1 2 0 12 0 0 1 2 0 0 0 20 1 2
                                    0 0 0 9 1 0 0 0 32 0 0 0 1 1 0 0 9 1 0 0 0
                                    1 1 0 0 9 1 1 0 0 20 1 1 0 0 147 1 2 0 0 9
                                    20 1 2 0 0 9 147 1 0 0 0 26 2 0 12 0 0 73 2
                                    0 0 0 0 72 1 0 0 0 75 2 0 0 0 0 82 2 0 0 0
                                    7 1 2 0 0 7 0 86 2 0 0 20 0 1 2 0 0 39 0 84
                                    2 0 0 0 0 88 2 0 0 9 0 1 3 0 0 0 151 147 1
                                    3 0 0 0 24 20 1 2 0 0 0 24 1 2 0 0 0 151
                                    1)))))
           '|lookupComplete|)) 
