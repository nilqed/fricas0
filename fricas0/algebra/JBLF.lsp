
(SDEFUN |JBLF;monom| ((|c| D) (|jv| JB) ($ |OutputForm|))
        (COND ((SPADCALL |c| (QREFELT $ 13)) (SPADCALL |jv| (QREFELT $ 15)))
              ((SPADCALL |jv| (QREFELT $ 16)) (SPADCALL |c| (QREFELT $ 17)))
              ('T
               (SPADCALL (SPADCALL |c| (QREFELT $ 17))
                         (SPADCALL |jv| (QREFELT $ 15)) (QREFELT $ 18))))) 

(SDEFUN |JBLF;coerce;$Of;2| ((|l| $) ($ |OutputForm|))
        (SPROG
         ((|res| (|OutputForm|)) (#1=#:G766 NIL) (|c| NIL) (#2=#:G767 NIL)
          (|jv| NIL))
         (SEQ
          (COND ((SPADCALL |l| (QREFELT $ 19)) (SPADCALL 0 (QREFELT $ 21)))
                ('T
                 (SEQ
                  (LETT |res|
                        (|JBLF;monom| (|SPADfirst| (QCAR |l|))
                         (|SPADfirst| (QCDR |l|)) $)
                        . #3=(|JBLF;coerce;$Of;2|))
                  (SEQ (LETT |jv| NIL . #3#) (LETT #2# (CDR (QCDR |l|)) . #3#)
                       (LETT |c| NIL . #3#) (LETT #1# (CDR (QCAR |l|)) . #3#)
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL)
                             (ATOM #2#)
                             (PROGN (LETT |jv| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res| (|JBLF;monom| |c| |jv| $)
                                         (QREFELT $ 22))
                               . #3#)))
                       (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                             . #3#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))) 

(SDEFUN |JBLF;coerce;JB$;3| ((|jv| JB) ($ $))
        (SPROG ((|jt| (|Symbol|)))
               (SEQ
                (LETT |jt| (SPADCALL |jv| (QREFELT $ 25)) |JBLF;coerce;JB$;3|)
                (EXIT
                 (COND ((EQUAL |jt| '|Const|) (|spadConstant| $ 26))
                       ((EQUAL |jt| '|Indep|)
                        (CONS (LIST (SPADCALL |jv| (QREFELT $ 27)))
                              (LIST (|spadConstant| $ 28))))
                       ('T (CONS (LIST (|spadConstant| $ 29)) (LIST |jv|)))))))) 

(SDEFUN |JBLF;coerce;D$;4| ((|ex| D) ($ $))
        (COND ((SPADCALL |ex| (QREFELT $ 31)) (|spadConstant| $ 32))
              ('T (CONS (LIST |ex|) (LIST (|spadConstant| $ 28)))))) 

(SDEFUN |JBLF;coerce;SemL;5| ((|jm| |SparseEchelonMatrix| JB D) ($ |List| $))
        (SPROG
         ((|res| (|List| $))
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| D))))
          (#1=#:G784 NIL) (|i| NIL))
         (SEQ
          (LETT |res| (SPADCALL (QREFELT $ 35)) . #2=(|JBLF;coerce;SemL;5|))
          (SEQ (LETT |i| 1 . #2#)
               (LETT #1# (SPADCALL |jm| (QREFELT $ 37)) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |r| (SPADCALL |jm| |i| (QREFELT $ 40)) . #2#)
                    (EXIT
                     (COND
                      ((NULL (NULL (QCAR |r|)))
                       (LETT |res|
                             (SPADCALL (CONS (QCDR |r|) (QCAR |r|)) |res|
                                       (QREFELT $ 41))
                             . #2#)))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |res| (QREFELT $ 42)))))) 

(SDEFUN |JBLF;coerce;LSem;6| ((|ll| |List| $) ($ |SparseEchelonMatrix| JB D))
        (SPROG
         ((#1=#:G794 NIL) (|l| NIL) (|i| NIL)
          (|res| (|SparseEchelonMatrix| JB D)) (|inds| (|List| JB))
          (#2=#:G793 NIL))
         (SEQ (LETT |inds| NIL . #3=(|JBLF;coerce;LSem;6|))
              (SEQ (LETT |l| NIL . #3#) (LETT #2# |ll| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |l| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |inds|
                           (SPADCALL
                            (SPADCALL (ELT $ 45) |inds| (QCDR |l|)
                                      (QREFELT $ 48))
                            (QREFELT $ 49))
                           . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL |inds| (SPADCALL |ll| (QREFELT $ 50))
                              (QREFELT $ 51))
                    . #3#)
              (SEQ (LETT |i| 1 . #3#) (LETT |l| NIL . #3#)
                   (LETT #1# |ll| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |l| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |res| |i| (QCDR |l|) (QCAR |l|)
                               (QREFELT $ 54))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #3#))
                         . #3#)
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
         ((|resC| (|List| D)) (#1=#:G826 NIL) (|cd| #2=(|Union| D "failed"))
          (#3=#:G827 NIL) (|jv| NIL) (|resJ| (|List| JB)) (|pd| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |pd| (SPADCALL |ex| (QREFELT $ 67))
                  . #4=(|JBLF;retractIfCan;JbeU;12|))
            (EXIT
             (COND
              ((QEQCAR |pd| 0)
               (CONS 0 (CONS (LIST (QCDR |pd|)) (LIST (|spadConstant| $ 28)))))
              ('T
               (SEQ (LETT |resJ| (SPADCALL |ex| (QREFELT $ 68)) . #4#)
                    (LETT |resC| NIL . #4#)
                    (SEQ (LETT |jv| NIL . #4#) (LETT #3# |resJ| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |jv| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |cd|
                                (SPADCALL (SPADCALL |ex| |jv| (QREFELT $ 69))
                                          (QREFELT $ 67))
                                . #4#)
                          (EXIT
                           (COND
                            ((QEQCAR |cd| 1)
                             (PROGN
                              (LETT #1# (CONS 1 "failed") . #4#)
                              (GO #5=#:G825)))
                            ('T
                             (LETT |resC| (CONS (QCDR |cd|) |resC|) . #4#)))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS 0 (CONS (NREVERSE |resC|) |resJ|)))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |JBLF;retract;Jbe$;13| ((|ex| |JetBundleExpression| JB) ($ $))
        (SPROG ((|pl| (|Union| $ "failed")))
               (SEQ
                (LETT |pl| (SPADCALL |ex| (QREFELT $ 70))
                      |JBLF;retract;Jbe$;13|)
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
        (SPROG ((#1=#:G840 NIL) (|c| NIL) (#2=#:G839 NIL))
               (SEQ
                (CONS
                 (PROGN
                  (LETT #2# NIL . #3=(|JBLF;-;2$;18|))
                  (SEQ (LETT |c| NIL . #3#) (LETT #1# (QCAR |l|) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 74)) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QCDR |l|))))) 

(SDEFUN |JBLF;+;3$;19| ((|l1| $) (|l2| $) ($ $))
        (SPROG
         ((|lj2| (|List| JB)) (|lc2| (|List| D)) (|resJ| (|List| JB))
          (|resC| (|List| D)) (|sum| (D)) (#1=#:G857 NIL) (|c1| NIL)
          (#2=#:G858 NIL) (|j1| NIL))
         (SEQ
          (COND ((SPADCALL |l1| (QREFELT $ 19)) |l2|)
                ((SPADCALL |l2| (QREFELT $ 19)) |l1|)
                ('T
                 (SEQ
                  (LETT |lc2| (SPADCALL (QCAR |l2|) (QREFELT $ 76))
                        . #3=(|JBLF;+;3$;19|))
                  (LETT |lj2| (SPADCALL (QCDR |l2|) (QREFELT $ 77)) . #3#)
                  (LETT |resC| NIL . #3#) (LETT |resJ| NIL . #3#)
                  (SEQ (LETT |j1| NIL . #3#) (LETT #2# (QCDR |l1|) . #3#)
                       (LETT |c1| NIL . #3#) (LETT #1# (QCAR |l1|) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c1| (CAR #1#) . #3#) NIL)
                             (ATOM #2#)
                             (PROGN (LETT |j1| (CAR #2#) . #3#) NIL))
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
                              (LETT |resC| (CONS (|SPADfirst| |lc2|) |resC|)
                                    . #3#)
                              (LETT |resJ| (CONS (|SPADfirst| |lj2|) |resJ|)
                                    . #3#)
                              (LETT |lc2| (CDR |lc2|) . #3#)
                              (EXIT (LETT |lj2| (CDR |lj2|) . #3#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((OR (NULL |lj2|)
                               (NULL
                                (SPADCALL (|SPADfirst| |lj2|) |j1|
                                          (QREFELT $ 78))))
                           (SEQ (LETT |resC| (CONS |c1| |resC|) . #3#)
                                (EXIT (LETT |resJ| (CONS |j1| |resJ|) . #3#))))
                          ('T
                           (SEQ
                            (LETT |sum|
                                  (SPADCALL |c1| (|SPADfirst| |lc2|)
                                            (QREFELT $ 79))
                                  . #3#)
                            (COND
                             ((NULL (SPADCALL |sum| (QREFELT $ 31)))
                              (SEQ (LETT |resC| (CONS |sum| |resC|) . #3#)
                                   (EXIT
                                    (LETT |resJ| (CONS |j1| |resJ|) . #3#)))))
                            (LETT |lc2| (CDR |lc2|) . #3#)
                            (EXIT (LETT |lj2| (CDR |lj2|) . #3#)))))))
                       (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                             . #3#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (CONS (SPADCALL (NREVERSE |resC|) |lc2| (QREFELT $ 80))
                         (SPADCALL (NREVERSE |resJ|) |lj2|
                                   (QREFELT $ 81)))))))))) 

(SDEFUN |JBLF;*;I2$;20| ((|i| |Integer|) (|l| $) ($ $))
        (SPROG ((#1=#:G864 NIL) (|c| NIL) (#2=#:G863 NIL))
               (SEQ
                (COND ((ZEROP |i|) (|spadConstant| $ 32)) ((EQL |i| 1) |l|)
                      ('T
                       (CONS
                        (PROGN
                         (LETT #2# NIL . #3=(|JBLF;*;I2$;20|))
                         (SEQ (LETT |c| NIL . #3#) (LETT #1# (QCAR |l|) . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |i| |c| (QREFELT $ 83))
                                            #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QCDR |l|))))))) 

(SDEFUN |JBLF;*;D2$;21| ((|ex| D) (|l| $) ($ $))
        (SPROG ((#1=#:G870 NIL) (|c| NIL) (#2=#:G869 NIL))
               (SEQ
                (COND ((SPADCALL |ex| (QREFELT $ 31)) (|spadConstant| $ 32))
                      ((SPADCALL |ex| (QREFELT $ 13)) |l|)
                      ('T
                       (CONS
                        (PROGN
                         (LETT #2# NIL . #3=(|JBLF;*;D2$;21|))
                         (SEQ (LETT |c| NIL . #3#) (LETT #1# (QCAR |l|) . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |ex| |c| (QREFELT $ 85))
                                            #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
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
                         (SPADCALL (|SPADfirst| (QCAR |l|)) (QREFELT $ 89))
                         |JBLF;recip;$U;23|)
                   (EXIT
                    (COND
                     ((QEQCAR |rc| 0)
                      (CONS 0 (SPADCALL (QCDR |rc|) (QREFELT $ 33))))
                     (#1='T (CONS 1 "failed"))))))
                 (#1# (CONS 1 "failed")))))) 

(SDEFUN |JBLF;exquo;2$U;24| ((|l1| $) (|l2| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((|newC| (|List| D)) (#2=#:G899 NIL) (|e| (|Union| D #1#))
          (#3=#:G900 NIL) (|c| NIL) (|d| (D)))
         (SEQ
          (EXIT
           (COND
            ((NULL (SPADCALL (|SPADfirst| (QCDR |l2|)) (QREFELT $ 16)))
             (CONS 1 "failed"))
            ('T
             (SEQ
              (LETT |d| (|SPADfirst| (QCAR |l2|)) . #4=(|JBLF;exquo;2$U;24|))
              (LETT |newC| NIL . #4#)
              (SEQ (LETT |c| NIL . #4#) (LETT #3# (QCAR |l1|) . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |c| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |e| (SPADCALL |c| |d| (QREFELT $ 91)) . #4#)
                        (EXIT
                         (COND
                          ((QEQCAR |e| 1)
                           (PROGN
                            (LETT #2# (CONS 1 "failed") . #4#)
                            (GO #5=#:G898)))
                          ('T (LETT |newC| (CONS (QCDR |e|) |newC|) . #4#)))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 0 (CONS (NREVERSE |newC|) (QCDR |l1|))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |JBLF;gcd;3$;25| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|g| (D)))
               (SEQ
                (COND
                 ((OR (SPADCALL (LENGTH (QCDR |l1|)) 1 (QREFELT $ 93))
                      (SPADCALL (LENGTH (QCDR |l2|)) 1 (QREFELT $ 93)))
                  (|spadConstant| $ 26))
                 ('T
                  (SEQ
                   (LETT |g|
                         (SPADCALL (|SPADfirst| (QCAR |l1|))
                                   (|SPADfirst| (QCAR |l2|)) (QREFELT $ 94))
                         |JBLF;gcd;3$;25|)
                   (EXIT
                    (COND
                     ((SPADCALL (|SPADfirst| (QCDR |l1|))
                                (|SPADfirst| (QCDR |l2|)) (QREFELT $ 78))
                      (CONS (LIST |g|) (QCDR |l1|)))
                     ('T (SPADCALL |g| (QREFELT $ 33))))))))))) 

(SDEFUN |JBLF;jetVariables;$L;26| ((|l| $) ($ |List| JB))
        (SPROG ((|res| (|List| JB)) (#1=#:G913 NIL) (|c| NIL))
               (SEQ
                (COND ((SPADCALL |l| (QREFELT $ 19)) NIL)
                      (#2='T
                       (SEQ (LETT |res| NIL . #3=(|JBLF;jetVariables;$L;26|))
                            (SEQ (LETT |c| NIL . #3#)
                                 (LETT #1# (QCAR |l|) . #3#) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |res|
                                         (SPADCALL (ELT $ 45) |res|
                                                   (SPADCALL |c|
                                                             (QREFELT $ 96))
                                                   (QREFELT $ 48))
                                         . #3#)))
                                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |res| (SPADCALL |res| (QREFELT $ 49)) . #3#)
                            (COND
                             ((SPADCALL (|spadConstant| $ 28) (QCDR |l|)
                                        (QREFELT $ 57))
                              (LETT |res|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 28) (QCDR |l|)
                                               (QREFELT $ 97))
                                     |res| (QREFELT $ 81))
                                    . #3#))
                             (#2#
                              (LETT |res|
                                    (SPADCALL (QCDR |l|) |res| (QREFELT $ 98))
                                    . #3#)))
                            (EXIT |res|))))))) 

(SDEFUN |JBLF;differentiate;$S$;27| ((|l| $) (|s| |Symbol|) ($ $))
        (SPROG
         ((|resJ| (|List| JB)) (|resC| (|List| D)) (|dc| (D)) (#1=#:G919 NIL)
          (|c| NIL) (#2=#:G920 NIL) (|j| NIL))
         (SEQ (LETT |resC| NIL . #3=(|JBLF;differentiate;$S$;27|))
              (LETT |resJ| NIL . #3#)
              (SEQ (LETT |j| NIL . #3#) (LETT #2# (QCDR |l|) . #3#)
                   (LETT |c| NIL . #3#) (LETT #1# (QCAR |l|) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL)
                         (ATOM #2#) (PROGN (LETT |j| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |dc| (SPADCALL |c| |s| (QREFELT $ 100)) . #3#)
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |dc| (QREFELT $ 31)))
                           (SEQ (LETT |resC| (CONS |dc| |resC|) . #3#)
                                (EXIT
                                 (LETT |resJ| (CONS |j| |resJ|) . #3#)))))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |resC|) (NREVERSE |resJ|)))))) 

(SDEFUN |JBLF;differentiate;$JB$;28| ((|l| $) (|jv| JB) ($ $))
        (SPROG
         ((|pos| (|Integer|)) (|resJ| (|List| JB)) (|resC| (|List| D))
          (|dc| (D)) (#1=#:G928 NIL) (|c| NIL) (#2=#:G929 NIL) (|j| NIL)
          (|jt| (|Symbol|)))
         (SEQ
          (LETT |jt| (SPADCALL |jv| (QREFELT $ 25))
                . #3=(|JBLF;differentiate;$JB$;28|))
          (EXIT
           (COND
            ((EQUAL |jt| '|Indep|)
             (SEQ (LETT |resC| NIL . #3#) (LETT |resJ| NIL . #3#)
                  (SEQ (LETT |j| NIL . #3#) (LETT #2# (QCDR |l|) . #3#)
                       (LETT |c| NIL . #3#) (LETT #1# (QCAR |l|) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL)
                             (ATOM #2#) (PROGN (LETT |j| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |dc| (SPADCALL |c| |jv| (QREFELT $ 102)) . #3#)
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |dc| (QREFELT $ 31)))
                           (SEQ (LETT |resC| (CONS |dc| |resC|) . #3#)
                                (EXIT
                                 (LETT |resJ| (CONS |j| |resJ|) . #3#)))))))
                       (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                             . #3#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS (NREVERSE |resC|) (NREVERSE |resJ|)))))
            (#4='T
             (SEQ (LETT |pos| (SPADCALL |jv| (QCDR |l|) (QREFELT $ 103)) . #3#)
                  (EXIT
                   (COND
                    ((< |pos| (SPADCALL (QCDR |l|) (QREFELT $ 104)))
                     (|spadConstant| $ 32))
                    (#4#
                     (CONS (LIST (SPADCALL (QCAR |l|) |pos| (QREFELT $ 105)))
                           (LIST (|spadConstant| $ 28))))))))))))) 

(SDEFUN |JBLF;jacobiMatrix;LSem;29|
        ((|sys| |List| $) ($ |SparseEchelonMatrix| JB $))
        (SPROG
         ((|rowC| (|List| $)) (|rowJ| #1=(|List| JB)) (|dCo| (|List| D))
          (|dJV| #1#) (|dco| (D)) (#2=#:G962 NIL) (|co| NIL) (#3=#:G963 NIL)
          (|jv| NIL) (#4=#:G961 NIL) (|cjv| NIL) (|ents| (|List| $))
          (#5=#:G960 NIL) (#6=#:G959 NIL) (#7=#:G958 NIL) (|eq| NIL) (|i| NIL)
          (|res| (|SparseEchelonMatrix| JB $)) (#8=#:G957 NIL) (#9=#:G956 NIL)
          (#10=#:G955 NIL) (|cinds| #1#) (#11=#:G954 NIL) (|inds| #1#)
          (#12=#:G953 NIL))
         (SEQ (LETT |inds| NIL . #13=(|JBLF;jacobiMatrix;LSem;29|))
              (LETT |cinds| NIL . #13#)
              (SEQ (LETT |eq| NIL . #13#) (LETT #12# |sys| . #13#) G190
                   (COND
                    ((OR (ATOM #12#) (PROGN (LETT |eq| (CAR #12#) . #13#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |inds|
                          (SPADCALL
                           (SPADCALL (ELT $ 45) |inds| (QCDR |eq|)
                                     (QREFELT $ 48))
                           (QREFELT $ 49))
                          . #13#)
                    (EXIT
                     (SEQ (LETT |co| NIL . #13#) (LETT #11# (QCAR |eq|) . #13#)
                          G190
                          (COND
                           ((OR (NULL (< (LENGTH |cinds|) (QREFELT $ 11)))
                                (ATOM #11#)
                                (PROGN (LETT |co| (CAR #11#) . #13#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |cinds|
                                  (SPADCALL
                                   (SPADCALL (ELT $ 45) |cinds|
                                             (SPADCALL |co| (QREFELT $ 96))
                                             (QREFELT $ 48))
                                   (QREFELT $ 49))
                                  . #13#)))
                          (LETT #11# (CDR #11#) . #13#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #12# (CDR #12#) . #13#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((NULL |cinds|)
                 (SEQ
                  (LETT |res|
                        (SPADCALL |inds| (SPADCALL |sys| (QREFELT $ 50))
                                  (QREFELT $ 108))
                        . #13#)
                  (SEQ (LETT |i| 1 . #13#) (LETT |eq| NIL . #13#)
                       (LETT #10# |sys| . #13#) G190
                       (COND
                        ((OR (ATOM #10#)
                             (PROGN (LETT |eq| (CAR #10#) . #13#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QCDR |eq|)
                                   (PROGN
                                    (LETT #9# NIL . #13#)
                                    (SEQ (LETT |co| NIL . #13#)
                                         (LETT #8# (QCAR |eq|) . #13#) G190
                                         (COND
                                          ((OR (ATOM #8#)
                                               (PROGN
                                                (LETT |co| (CAR #8#) . #13#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #9#
                                                 (CONS
                                                  (SPADCALL |co|
                                                            (QREFELT $ 33))
                                                  #9#)
                                                 . #13#)))
                                         (LETT #8# (CDR #8#) . #13#) (GO G190)
                                         G191 (EXIT (NREVERSE #9#))))
                                   (QREFELT $ 109))))
                       (LETT #10#
                             (PROG1 (CDR #10#)
                               (LETT |i| (|inc_SI| |i|) . #13#))
                             . #13#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))
                ('T
                 (SEQ
                  (LETT |res|
                        (SPADCALL (SPADCALL |inds| |cinds| (QREFELT $ 98))
                                  (SPADCALL |sys| (QREFELT $ 50))
                                  (QREFELT $ 108))
                        . #13#)
                  (SEQ (LETT |i| 1 . #13#) (LETT |eq| NIL . #13#)
                       (LETT #7# |sys| . #13#) G190
                       (COND
                        ((OR (ATOM #7#)
                             (PROGN (LETT |eq| (CAR #7#) . #13#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ents|
                              (PROGN
                               (LETT #6# NIL . #13#)
                               (SEQ (LETT |co| NIL . #13#)
                                    (LETT #5# (QCAR |eq|) . #13#) G190
                                    (COND
                                     ((OR (ATOM #5#)
                                          (PROGN
                                           (LETT |co| (CAR #5#) . #13#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #6#
                                            (CONS
                                             (SPADCALL |co| (QREFELT $ 33))
                                             #6#)
                                            . #13#)))
                                    (LETT #5# (CDR #5#) . #13#) (GO G190) G191
                                    (EXIT (NREVERSE #6#))))
                              . #13#)
                        (LETT |rowJ| NIL . #13#)
                        (LETT |rowC| (SPADCALL (QREFELT $ 35)) . #13#)
                        (SEQ (LETT |cjv| NIL . #13#) (LETT #4# |cinds| . #13#)
                             G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |cjv| (CAR #4#) . #13#) NIL))
                               (GO G191)))
                             (SEQ (LETT |dJV| NIL . #13#)
                                  (LETT |dCo| NIL . #13#)
                                  (SEQ (LETT |jv| NIL . #13#)
                                       (LETT #3# (QCDR |eq|) . #13#)
                                       (LETT |co| NIL . #13#)
                                       (LETT #2# (QCAR |eq|) . #13#) G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN
                                              (LETT |co| (CAR #2#) . #13#)
                                              NIL)
                                             (ATOM #3#)
                                             (PROGN
                                              (LETT |jv| (CAR #3#) . #13#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |dco|
                                              (SPADCALL |co| |cjv|
                                                        (QREFELT $ 102))
                                              . #13#)
                                        (EXIT
                                         (COND
                                          ((NULL
                                            (SPADCALL |dco| (QREFELT $ 31)))
                                           (SEQ
                                            (LETT |dJV| (CONS |jv| |dJV|)
                                                  . #13#)
                                            (EXIT
                                             (LETT |dCo| (CONS |dco| |dCo|)
                                                   . #13#)))))))
                                       (LETT #2#
                                             (PROG1 (CDR #2#)
                                               (LETT #3# (CDR #3#) . #13#))
                                             . #13#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (COND
                                    ((NULL (NULL |dJV|))
                                     (SEQ
                                      (LETT |rowJ| (CONS |cjv| |rowJ|) . #13#)
                                      (EXIT
                                       (LETT |rowC|
                                             (SPADCALL
                                              (CONS (NREVERSE |dCo|)
                                                    (NREVERSE |dJV|))
                                              |rowC| (QREFELT $ 41))
                                             . #13#)))))))
                             (LETT #4# (CDR #4#) . #13#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SPADCALL |res| |i|
                                   (SPADCALL (QCDR |eq|) (NREVERSE |rowJ|)
                                             (QREFELT $ 98))
                                   (SPADCALL |ents|
                                             (SPADCALL |rowC| (QREFELT $ 42))
                                             (QREFELT $ 110))
                                   (QREFELT $ 109))))
                       (LETT #7#
                             (PROG1 (CDR #7#) (LETT |i| (|inc_SI| |i|) . #13#))
                             . #13#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))))))) 

(SDEFUN |JBLF;jacobiMatrix;LLSem;30|
        ((|sys| |List| $) (|varlist| |List| (|List| JB))
         ($ |SparseEchelonMatrix| JB $))
        (SPROG
         ((|rowC| (|List| $)) (|rowJ| #1=(|List| JB)) (|dCo| (|List| D))
          (|dJV| #1#) (|dco| (D)) (#2=#:G989 NIL) (|co| NIL) (#3=#:G990 NIL)
          (|jv| NIL) (#4=#:G988 NIL) (|ijv| NIL) (|ivars| (|List| JB))
          (|ents| (|List| $)) (#5=#:G987 NIL) (#6=#:G986 NIL) (#7=#:G984 NIL)
          (|eq| NIL) (#8=#:G985 NIL) (|vars| NIL) (|i| NIL)
          (|res| (|SparseEchelonMatrix| JB $)) (|inds| (|List| JB))
          (#9=#:G983 NIL))
         (SEQ
          (LETT |inds| (|SPADfirst| |varlist|)
                . #10=(|JBLF;jacobiMatrix;LLSem;30|))
          (SEQ (LETT |vars| NIL . #10#) (LETT #9# (CDR |varlist|) . #10#) G190
               (COND
                ((OR (ATOM #9#) (PROGN (LETT |vars| (CAR #9#) . #10#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |inds|
                       (SPADCALL
                        (SPADCALL (ELT $ 45) |inds| |vars| (QREFELT $ 48))
                        (QREFELT $ 49))
                       . #10#)))
               (LETT #9# (CDR #9#) . #10#) (GO G190) G191 (EXIT NIL))
          (LETT |res|
                (SPADCALL |inds| (SPADCALL |sys| (QREFELT $ 50))
                          (QREFELT $ 108))
                . #10#)
          (SEQ (LETT |i| 1 . #10#) (LETT |vars| NIL . #10#)
               (LETT #8# |varlist| . #10#) (LETT |eq| NIL . #10#)
               (LETT #7# |sys| . #10#) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |eq| (CAR #7#) . #10#) NIL)
                     (ATOM #8#) (PROGN (LETT |vars| (CAR #8#) . #10#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |ents|
                      (PROGN
                       (LETT #6# NIL . #10#)
                       (SEQ (LETT |co| NIL . #10#)
                            (LETT #5# (QCAR |eq|) . #10#) G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |co| (CAR #5#) . #10#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #6#
                                    (CONS (SPADCALL |co| (QREFELT $ 33)) #6#)
                                    . #10#)))
                            (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                            (EXIT (NREVERSE #6#))))
                      . #10#)
                (LETT |ivars|
                      (SPADCALL (ELT $ 113)
                                (SPADCALL
                                 (CONS #'|JBLF;jacobiMatrix;LLSem;30!0| $)
                                 |vars| (QREFELT $ 116))
                                (QREFELT $ 117))
                      . #10#)
                (EXIT
                 (COND
                  ((NULL |ivars|)
                   (SPADCALL |res| |i| (QCDR |eq|) |ents| (QREFELT $ 109)))
                  ('T
                   (SEQ (LETT |rowJ| NIL . #10#)
                        (LETT |rowC| (SPADCALL (QREFELT $ 35)) . #10#)
                        (SEQ (LETT |ijv| NIL . #10#) (LETT #4# |ivars| . #10#)
                             G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |ijv| (CAR #4#) . #10#) NIL))
                               (GO G191)))
                             (SEQ (LETT |dJV| NIL . #10#)
                                  (LETT |dCo| NIL . #10#)
                                  (SEQ (LETT |jv| NIL . #10#)
                                       (LETT #3# (QCDR |eq|) . #10#)
                                       (LETT |co| NIL . #10#)
                                       (LETT #2# (QCAR |eq|) . #10#) G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN
                                              (LETT |co| (CAR #2#) . #10#)
                                              NIL)
                                             (ATOM #3#)
                                             (PROGN
                                              (LETT |jv| (CAR #3#) . #10#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |dco|
                                              (SPADCALL |co| |ijv|
                                                        (QREFELT $ 102))
                                              . #10#)
                                        (EXIT
                                         (COND
                                          ((NULL
                                            (SPADCALL |dco| (QREFELT $ 31)))
                                           (SEQ
                                            (LETT |dJV| (CONS |jv| |dJV|)
                                                  . #10#)
                                            (EXIT
                                             (LETT |dCo| (CONS |dco| |dCo|)
                                                   . #10#)))))))
                                       (LETT #2#
                                             (PROG1 (CDR #2#)
                                               (LETT #3# (CDR #3#) . #10#))
                                             . #10#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (COND
                                    ((NULL (NULL |dJV|))
                                     (SEQ
                                      (LETT |rowJ| (CONS |ijv| |rowJ|) . #10#)
                                      (EXIT
                                       (LETT |rowC|
                                             (SPADCALL
                                              (CONS (NREVERSE |dCo|)
                                                    (NREVERSE |dJV|))
                                              |rowC| (QREFELT $ 41))
                                             . #10#)))))))
                             (LETT #4# (CDR #4#) . #10#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SPADCALL |res| |i|
                                   (SPADCALL (QCDR |eq|) (NREVERSE |rowJ|)
                                             (QREFELT $ 98))
                                   (SPADCALL |ents|
                                             (SPADCALL |rowC| (QREFELT $ 42))
                                             (QREFELT $ 110))
                                   (QREFELT $ 109))))))))
               (LETT #7#
                     (PROG1 (CDR #7#)
                       (LETT #8#
                             (PROG1 (CDR #8#) (LETT |i| (|inc_SI| |i|) . #10#))
                             . #10#))
                     . #10#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |JBLF;jacobiMatrix;LLSem;30!0| ((|x| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 25)) '|Indep| (QREFELT $ 114))) 

(SDEFUN |JBLF;leadingDer;$JB;31| ((|l| $) ($ JB))
        (COND ((SPADCALL |l| (QREFELT $ 19)) (|spadConstant| $ 28))
              ('T (|SPADfirst| (QCDR |l|))))) 

(SDEFUN |JBLF;freeOf?;$JBB;32| ((|l| $) (|jv| JB) ($ |Boolean|))
        (SPROG ((#1=#:G1002 NIL) (|c| NIL) (#2=#:G1001 NIL))
               (SEQ
                (COND
                 ((EQUAL (SPADCALL |jv| (QREFELT $ 25)) '|Indep|)
                  (SPADCALL (ELT $ 122)
                            (PROGN
                             (LETT #2# NIL . #3=(|JBLF;freeOf?;$JBB;32|))
                             (SEQ (LETT |c| NIL . #3#)
                                  (LETT #1# (QCAR |l|) . #3#) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (SPADCALL |c| |jv| (QREFELT $ 121))
                                           #2#)
                                          . #3#)))
                                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            'T (QREFELT $ 125)))
                 ('T (NULL (SPADCALL |jv| (QCDR |l|) (QREFELT $ 57)))))))) 

(SDEFUN |JBLF;solveFor;$JBU;33| ((|l| $) (|jv| JB) ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G1024 NIL) (|c| NIL) (#2=#:G1023 NIL)
          (|rc| (|Union| D "failed")) (|pos| (|Integer|)) (|jt| (|Symbol|)))
         (SEQ
          (LETT |jt| (SPADCALL |jv| (QREFELT $ 25))
                . #3=(|JBLF;solveFor;$JBU;33|))
          (COND
           ((OR (EQUAL |jt| '|Const|) (EQUAL |jt| '|Indep|))
            (EXIT (CONS 1 "failed"))))
          (LETT |pos| (SPADCALL |jv| (QCDR |l|) (QREFELT $ 103)) . #3#)
          (EXIT
           (COND
            ((< |pos| (SPADCALL (QCDR |l|) (QREFELT $ 104))) (CONS 1 "failed"))
            ((EQL (LENGTH (QCDR |l|)) 1) (CONS 0 (|spadConstant| $ 32)))
            (#4='T
             (SEQ
              (LETT |rc|
                    (SPADCALL (SPADCALL (QCAR |l|) |pos| (QREFELT $ 127))
                              (QREFELT $ 89))
                    . #3#)
              (EXIT
               (COND ((QEQCAR |rc| 1) (CONS 1 "failed"))
                     (#4#
                      (CONS 0
                            (CONS
                             (PROGN
                              (LETT #2# NIL . #3#)
                              (SEQ (LETT |c| NIL . #3#)
                                   (LETT #1#
                                         (SPADCALL (QCAR |l|) |pos|
                                                   (QREFELT $ 128))
                                         . #3#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |c| (CAR #1#) . #3#)
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
                                            #2#)
                                           . #3#)))
                                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (SPADCALL (QCDR |l|) |pos|
                                       (QREFELT $ 129)))))))))))))) 

(SDEFUN |JBLF;subst;$JB2$;34| ((|l| $) (|jv| JB) (|exp| $) ($ $))
        (SPROG
         ((|nl| ($)) (|c| (D)) (|pos| (|Integer|)) (|resJ| (|List| JB))
          (|resC| (|List| D)) (|nc| (D)) (#1=#:G1033 NIL) (#2=#:G1034 NIL)
          (|cj| NIL) (|xexp| (D)) (|jt| (|Symbol|)))
         (SEQ
          (LETT |jt| (SPADCALL |jv| (QREFELT $ 25))
                . #3=(|JBLF;subst;$JB2$;34|))
          (EXIT
           (COND
            ((EQUAL |jt| '|Const|) (|error| "Substitution for 1 not allowed"))
            ((EQUAL |jt| '|Indep|)
             (SEQ (LETT |xexp| (SPADCALL |exp| (QREFELT $ 131)) . #3#)
                  (LETT |resC| NIL . #3#) (LETT |resJ| NIL . #3#)
                  (SEQ (LETT |cj| NIL . #3#) (LETT #2# (QCDR |l|) . #3#)
                       (LETT |c| NIL . #3#) (LETT #1# (QCAR |l|) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL)
                             (ATOM #2#)
                             (PROGN (LETT |cj| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |nc| (SPADCALL |c| |jv| |xexp| (QREFELT $ 132))
                              . #3#)
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |nc| (QREFELT $ 31)))
                           (SEQ (LETT |resC| (CONS |nc| |resC|) . #3#)
                                (EXIT
                                 (LETT |resJ| (CONS |cj| |resJ|) . #3#)))))))
                       (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                             . #3#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS (NREVERSE |resC|) (NREVERSE |resJ|)))))
            (#4='T
             (SEQ (LETT |pos| (SPADCALL |jv| (QCDR |l|) (QREFELT $ 103)) . #3#)
                  (EXIT
                   (COND ((ZEROP |pos|) |l|)
                         (#4#
                          (SEQ
                           (LETT |c|
                                 (SPADCALL (QCAR |l|) |pos| (QREFELT $ 105))
                                 . #3#)
                           (LETT |nl|
                                 (CONS
                                  (SPADCALL (QCAR |l|) |pos| (QREFELT $ 128))
                                  (SPADCALL (QCDR |l|) |pos| (QREFELT $ 129)))
                                 . #3#)
                           (EXIT
                            (SPADCALL |nl| (SPADCALL |c| |exp| (QREFELT $ 86))
                                      (QREFELT $ 82)))))))))))))) 

(SDEFUN |JBLF;simplify;LSemR;35|
        ((|sys| |List| $) (|jm| |SparseEchelonMatrix| JB $)
         ($ |Record| (|:| |Sys| (|List| $))
          (|:| JM (|SparseEchelonMatrix| JB $))
          (|:| |Depend|
               (|Union| "failed" (|List| (|List| (|NonNegativeInteger|)))))))
        (SPROG
         ((|dep| (|List| (|List| (|NonNegativeInteger|))))
          (|depj| (|List| (|NonNegativeInteger|))) (#1=#:G1059 NIL)
          (|kb| (|Integer|)) (#2=#:G1079 NIL) (|k| NIL) (|rowC| (|List| $))
          (|rowJ| #3=(|List| JB)) (|dCo| (|List| D)) (|dJV| #3#) (|dco| (D))
          (#4=#:G1077 NIL) (|co| NIL) (#5=#:G1078 NIL) (|jv| NIL)
          (#6=#:G1076 NIL) (|cjv| NIL) (|ents| (|List| $)) (#7=#:G1075 NIL)
          (#8=#:G1074 NIL) (#9=#:G1073 NIL) (#10=#:G1072 NIL) (#11=#:G1071 NIL)
          (|eq| NIL) (|j| NIL) (|newJM| (|SparseEchelonMatrix| JB $))
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
                   (SPADCALL (SPADCALL |sys| (QREFELT $ 55)) (QREFELT $ 135))
                   . #13=(|JBLF;simplify;LSemR;35|))
             (LETT |newSys| (SPADCALL (QVELT |RRec| 0) (QREFELT $ 44)) . #13#)
             (LETT |Trafo| (QVELT |RRec| 1) . #13#) (LETT |minR| 1 . #13#)
             (LETT |maxR| (SPADCALL |Trafo| (QREFELT $ 137)) . #13#)
             (LETT |inds| (SPADCALL |jm| (QREFELT $ 138)) . #13#)
             (LETT |cinds| (SPADCALL |inds| (QREFELT $ 77)) . #13#)
             (SEQ G190
                  (COND
                   ((NULL
                     (COND ((NULL |cinds|) NIL)
                           ('T
                            (SPADCALL
                             (SPADCALL (|SPADfirst| |cinds|) (QREFELT $ 25))
                             '|Indep| (QREFELT $ 139)))))
                    (GO G191)))
                  (SEQ (EXIT (LETT |cinds| (CDR |cinds|) . #13#))) NIL
                  (GO G190) G191 (EXIT NIL))
             (COND
              ((NULL (NULL |cinds|)) (LETT |cinds| (NREVERSE |cinds|) . #13#)))
             (LETT |newJM|
                   (SPADCALL |inds| (SPADCALL |newSys| (QREFELT $ 50))
                             (QREFELT $ 108))
                   . #13#)
             (LETT |dep| NIL . #13#)
             (SEQ (LETT |j| 1 . #13#) (LETT |eq| NIL . #13#)
                  (LETT #11# |newSys| . #13#) G190
                  (COND
                   ((OR (ATOM #11#) (PROGN (LETT |eq| (CAR #11#) . #13#) NIL))
                    (GO G191)))
                  (SEQ
                   (COND
                    ((NULL |cinds|)
                     (SPADCALL |newJM| |j| (QCDR |eq|)
                               (PROGN
                                (LETT #10# NIL . #13#)
                                (SEQ (LETT |co| NIL . #13#)
                                     (LETT #9# (QCAR |eq|) . #13#) G190
                                     (COND
                                      ((OR (ATOM #9#)
                                           (PROGN
                                            (LETT |co| (CAR #9#) . #13#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #10#
                                             (CONS
                                              (SPADCALL |co| (QREFELT $ 33))
                                              #10#)
                                             . #13#)))
                                     (LETT #9# (CDR #9#) . #13#) (GO G190) G191
                                     (EXIT (NREVERSE #10#))))
                               (QREFELT $ 109)))
                    ('T
                     (SEQ
                      (LETT |ents|
                            (PROGN
                             (LETT #8# NIL . #13#)
                             (SEQ (LETT |co| NIL . #13#)
                                  (LETT #7# (QCAR |eq|) . #13#) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN
                                         (LETT |co| (CAR #7#) . #13#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #8#
                                          (CONS (SPADCALL |co| (QREFELT $ 33))
                                                #8#)
                                          . #13#)))
                                  (LETT #7# (CDR #7#) . #13#) (GO G190) G191
                                  (EXIT (NREVERSE #8#))))
                            . #13#)
                      (LETT |rowJ| NIL . #13#)
                      (LETT |rowC| (SPADCALL (QREFELT $ 35)) . #13#)
                      (SEQ (LETT |cjv| NIL . #13#) (LETT #6# |cinds| . #13#)
                           G190
                           (COND
                            ((OR (ATOM #6#)
                                 (PROGN (LETT |cjv| (CAR #6#) . #13#) NIL))
                             (GO G191)))
                           (SEQ (LETT |dJV| NIL . #13#) (LETT |dCo| NIL . #13#)
                                (SEQ (LETT |jv| NIL . #13#)
                                     (LETT #5# (QCDR |eq|) . #13#)
                                     (LETT |co| NIL . #13#)
                                     (LETT #4# (QCAR |eq|) . #13#) G190
                                     (COND
                                      ((OR (ATOM #4#)
                                           (PROGN
                                            (LETT |co| (CAR #4#) . #13#)
                                            NIL)
                                           (ATOM #5#)
                                           (PROGN
                                            (LETT |jv| (CAR #5#) . #13#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |dco|
                                            (SPADCALL |co| |cjv|
                                                      (QREFELT $ 102))
                                            . #13#)
                                      (EXIT
                                       (COND
                                        ((NULL (SPADCALL |dco| (QREFELT $ 31)))
                                         (SEQ
                                          (LETT |dJV| (CONS |jv| |dJV|) . #13#)
                                          (EXIT
                                           (LETT |dCo| (CONS |dco| |dCo|)
                                                 . #13#)))))))
                                     (LETT #4#
                                           (PROG1 (CDR #4#)
                                             (LETT #5# (CDR #5#) . #13#))
                                           . #13#)
                                     (GO G190) G191 (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((NULL (NULL |dJV|))
                                   (SEQ
                                    (LETT |rowJ| (CONS |cjv| |rowJ|) . #13#)
                                    (EXIT
                                     (LETT |rowC|
                                           (SPADCALL
                                            (CONS (NREVERSE |dCo|)
                                                  (NREVERSE |dJV|))
                                            |rowC| (QREFELT $ 41))
                                           . #13#)))))))
                           (LETT #6# (CDR #6#) . #13#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (SPADCALL |newJM| |j|
                                 (SPADCALL (QCDR |eq|) (NREVERSE |rowJ|)
                                           (QREFELT $ 98))
                                 (SPADCALL |ents|
                                           (SPADCALL |rowC| (QREFELT $ 42))
                                           (QREFELT $ 110))
                                 (QREFELT $ 109))))))
                   (LETT |depj| NIL . #13#)
                   (SEQ (LETT |k| |maxR| . #13#) (LETT #2# |minR| . #13#) G190
                        (COND ((< |k| #2#) (GO G191)))
                        (SEQ
                         (LETT |kb|
                               (- (+ |k| (SPADCALL |sys| (QREFELT $ 140)))
                                  |minR|)
                               . #13#)
                         (EXIT
                          (COND
                           ((NULL
                             (SPADCALL (QAREF2O |Trafo| |j| |k| 1 1)
                                       (QREFELT $ 142)))
                            (LETT |depj|
                                  (CONS
                                   (PROG1
                                       (LETT #1#
                                             (+ (- |k| |minR|)
                                                (SPADCALL |depj|
                                                          (QREFELT $ 144)))
                                             . #13#)
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   |depj|)
                                  . #13#)))))
                        (LETT |k| (+ |k| -1) . #13#) (GO G190) G191 (EXIT NIL))
                   (EXIT (LETT |dep| (CONS |depj| |dep|) . #13#)))
                  (LETT #11#
                        (PROG1 (CDR #11#) (LETT |j| (|inc_SI| |j|) . #13#))
                        . #13#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT (VECTOR |newSys| |newJM| (CONS 1 (NREVERSE |dep|)))))))))) 

(SDEFUN |JBLF;simpOne;2$;36| ((|f| $) ($ $))
        (COND
         ((EQL (LENGTH (QCDR |f|)) 1)
          (CONS (LIST (|spadConstant| $ 29)) (QCDR |f|)))
         ('T |f|))) 

(DECLAIM (NOTINLINE |JetBundleLinearFunction;|)) 

(DEFUN |JetBundleLinearFunction| (&REST #1=#:G1091)
  (SPROG NIL
         (PROG (#2=#:G1092)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|JetBundleLinearFunction|)
                                               '|domainEqualList|)
                    . #3=(|JetBundleLinearFunction|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |JetBundleLinearFunction;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundleLinearFunction|)))))))))) 

(DEFUN |JetBundleLinearFunction;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|JetBundleLinearFunction|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|JetBundleLinearFunction| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 159) . #1#)
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
                                                                  |#1|)))))))
                          . #1#))
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
              |JBLF;exquo;2$U;24| (242 . >) (248 . |gcd|) |JBLF;gcd;3$;25|
              (254 . |jetVariables|) (259 . |remove|) (265 . |append|)
              |JBLF;jetVariables;$L;26| (271 . |differentiate|)
              |JBLF;differentiate;$S$;27| (277 . |differentiate|)
              (283 . |position|) (289 . |minIndex|) (294 . |qelt|)
              |JBLF;differentiate;$JB$;28| (|SparseEchelonMatrix| 6 $$)
              (300 . |new|) (306 . |setRow!|) (314 . |append|)
              (|SparseEchelonMatrix| 6 $) |JBLF;jacobiMatrix;LSem;29| (320 . <)
              (326 . =) (|Mapping| 12 6) (332 . |select|) (338 . |sort!|)
              (|List| 47) |JBLF;jacobiMatrix;LLSem;30| |JBLF;leadingDer;$JB;31|
              (344 . |freeOf?|) (350 . |and|) (|Mapping| 12 12 12) (|List| 12)
              (356 . |reduce|) |JBLF;freeOf?;$JBB;32| (363 . |elt|)
              (369 . |delete|) (375 . |delete|) |JBLF;solveFor;$JBU;33|
              (381 . |retract|) (386 . |subst|) |JBLF;subst;$JB2$;34|
              (|Record| (|:| |Ech| $) (|:| |Lt| 136) (|:| |Pivots| 53)
                        (|:| |Rank| 20))
              (393 . |primitiveRowEchelon|) (|Matrix| 141)
              (398 . |maxRowIndex|) (403 . |allIndices|) (408 . ~=)
              (414 . |minIndex|) (|Fraction| 7) (419 . |zero?|) (|List| 20)
              (424 . |minIndex|) (|Union| '"failed" (|List| 143))
              (|Record| (|:| |Sys| 43) (|:| JM 111) (|:| |Depend| 145))
              |JBLF;simplify;LSemR;35| |JBLF;simpOne;2$;36|
              (|Record| (|:| |DPhi| $) (|:| |JVars| 47))
              (|Record| (|:| |DSys| 43) (|:| |JVars| 118))
              (|Union| 6 '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| 24) (|SparseUnivariatePolynomial| $) (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 429 |zero?| 435 |unitNormal| 440 |unitCanonical| 445 |unit?|
              450 |symbol| 455 |subtractIfCan| 460 |subst| 466 |sortLD| 473
              |solveFor| 478 |simplify| 484 |simpOne| 490 |simpMod| 495
              |setNotation| 508 |sample| 513 |rightRecip| 517 |rightPower| 522
              |retractIfCan| 534 |retract| 549 |reduceMod| 564 |recip| 570
              |orderDim| 575 |order| 582 |opposite?| 587 |one?| 593 |numerator|
              598 |numIndVar| 603 |numDepVar| 607 |leftRecip| 611 |leftPower|
              616 |leadingDer| 628 |lcmCoef| 633 |lcm| 639 |latex| 650
              |jetVariables| 655 |jacobiMatrix| 660 |hashUpdate!| 671 |hash|
              677 |ground?| 682 |ground| 687 |getNotation| 692 |gcdPolynomial|
              696 |gcd| 702 |freeOf?| 713 |formalDiff2| 719 |formalDiff| 733
              |extractSymbol| 751 |exquo| 756 |dimension| 762 |differentiate|
              769 |denominator| 801 |dSubst| 806 |const?| 813 |commutator| 818
              |coerce| 824 |class| 859 |characteristic| 864 |autoReduce| 868
              |associator| 873 |associates?| 880 |antiCommutator| 886
              |annihilate?| 892 ^ 898 |Zero| 910 X 914 U 923 P 932 |One| 954 =
              958 - 964 + 975 * 981 |#2| 1017)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1))
            (CONS
             '#(|JetBundleFunctionCategory&| |GcdDomain&| NIL NIL NIL
                |PartialDifferentialRing&| |EntireRing&| |Algebra&| NIL |Rng&|
                NIL |Module&| |Module&| NIL NIL NIL |NonAssociativeRing&| NIL
                NIL NIL |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL
                NIL |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Magma&| |AbelianSemiGroup&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| NIL NIL NIL |BasicType&| NIL NIL)
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
                 (|AbelianSemiGroup|) (|SetCategory|) (|RetractableTo| 7)
                 (|RetractableTo| 6) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 14)
                 (|lazyRepresentation|))
              (|makeByteWordVec2| 158
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
                                    65 0 89 2 7 65 0 0 91 2 20 12 0 0 93 2 7 0
                                    0 0 94 1 7 47 0 96 2 47 0 6 0 97 2 47 0 0 0
                                    98 2 7 0 0 24 100 2 7 0 0 6 102 2 47 39 6 0
                                    103 1 47 39 0 104 2 53 7 0 39 105 2 107 0
                                    47 39 108 4 107 52 0 39 47 34 109 2 34 0 0
                                    0 110 2 6 12 0 0 113 2 24 12 0 0 114 2 47 0
                                    115 0 116 2 47 0 46 0 117 2 7 12 0 6 121 2
                                    12 0 0 0 122 3 124 12 123 0 12 125 2 53 7 0
                                    39 127 2 53 0 0 39 128 2 47 0 0 39 129 1 0
                                    7 0 131 3 7 0 0 6 0 132 1 36 134 0 135 1
                                    136 39 0 137 1 107 47 0 138 2 24 12 0 0 139
                                    1 34 39 0 140 1 141 12 0 142 1 143 39 0 144
                                    2 0 12 0 0 1 1 0 12 0 19 1 0 152 0 1 1 0 0
                                    0 1 1 0 12 0 1 1 0 111 43 1 2 0 65 0 0 1 3
                                    0 0 0 6 0 133 1 0 43 43 1 2 0 65 0 6 130 2
                                    0 146 43 111 147 1 0 0 0 148 3 0 146 43 111
                                    43 1 2 0 43 43 43 1 1 0 52 24 1 0 0 0 1 1 0
                                    65 0 1 2 0 0 0 20 1 2 0 0 0 9 1 1 2 65 66
                                    70 1 0 61 0 62 1 0 151 0 1 1 2 0 66 71 1 0
                                    7 0 131 1 0 6 0 1 2 0 43 43 43 1 1 0 65 0
                                    90 3 0 20 43 111 20 1 1 0 20 0 1 2 0 12 0 0
                                    1 1 0 12 0 1 1 0 0 0 63 0 0 9 1 0 0 9 1 1 0
                                    65 0 1 2 0 0 0 20 1 2 0 0 0 9 1 1 0 6 0 120
                                    2 0 153 0 0 1 1 0 0 43 1 2 0 0 0 0 1 1 0
                                    157 0 1 1 0 47 0 99 2 0 111 43 118 119 1 0
                                    111 43 112 2 0 156 156 0 1 1 0 158 0 1 1 0
                                    12 0 56 1 0 0 0 59 0 0 24 1 2 0 155 155 155
                                    1 1 0 0 43 1 2 0 0 0 0 95 2 0 12 0 6 126 3
                                    0 149 0 9 111 1 3 0 150 43 9 111 1 2 0 43
                                    43 9 1 2 0 0 0 9 1 2 0 0 0 143 1 1 0 111
                                    111 1 2 0 65 0 0 92 3 0 20 43 111 20 1 2 0
                                    0 0 6 106 3 0 0 0 24 20 1 3 0 0 0 154 143 1
                                    2 0 0 0 24 101 2 0 0 0 154 1 1 0 0 0 64 3 0
                                    0 0 6 0 1 1 0 12 0 1 2 0 0 0 0 1 1 0 36 43
                                    55 1 0 43 36 44 1 0 0 7 33 1 0 0 6 30 1 0 0
                                    0 1 1 0 0 39 1 1 0 14 0 23 1 0 20 0 1 0 0
                                    20 1 1 0 43 43 1 3 0 0 0 0 0 1 2 0 12 0 0 1
                                    2 0 0 0 0 1 2 0 12 0 0 1 2 0 0 0 20 1 2 0 0
                                    0 9 1 0 0 0 32 0 0 0 1 1 0 0 9 1 0 0 0 1 1
                                    0 0 9 1 1 0 0 20 1 1 0 0 143 1 2 0 0 9 20 1
                                    2 0 0 9 143 1 0 0 0 26 2 0 12 0 0 73 2 0 0
                                    0 0 72 1 0 0 0 75 2 0 0 0 0 82 2 0 0 0 7 1
                                    2 0 0 7 0 86 2 0 0 20 0 1 2 0 0 39 0 84 2 0
                                    0 0 0 88 2 0 0 9 0 1 3 0 0 0 154 143 1 3 0
                                    0 0 24 20 1 2 0 0 0 24 1 2 0 0 0 154 1)))))
           '|lookupComplete|)) 
