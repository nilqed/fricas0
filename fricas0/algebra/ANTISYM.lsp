
(SDEFUN |ANTISYM;One;$;1| (($ $))
        (LIST
         (CONS (SPADCALL (QREFELT $ 9) (QREFELT $ 12)) (|spadConstant| $ 13)))) 

(SDEFUN |ANTISYM;coefficient;2$R;2| ((|a| $) (|u| $) ($ R))
        (SPROG
         ((#1=#:G729 NIL) (#2=#:G730 NIL) (|t| NIL) (|x| (|ExtAlgBasis|)))
         (SEQ
          (EXIT
           (COND
            ((NULL (NULL (CDR |u|)))
             (|error| "2nd argument must be a basis element"))
            ('T
             (SEQ
              (LETT |x| (QCAR (|SPADfirst| |u|))
                    . #3=(|ANTISYM;coefficient;2$R;2|))
              (SEQ (LETT |t| NIL . #3#) (LETT #2# |a| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL (QCAR |t|) |x| (QREFELT $ 16))
                      (PROGN (LETT #1# (QCDR |t|) . #3#) (GO #4=#:G728))))
                    (EXIT
                     (COND
                      ((SPADCALL (QCAR |t|) |x| (QREFELT $ 17))
                       (PROGN
                        (LETT #1# (|spadConstant| $ 18) . #3#)
                        (GO #4#))))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (|spadConstant| $ 18))))))
          #4# (EXIT #1#)))) 

(SDEFUN |ANTISYM;retractable?;$B;3| ((|a| $) ($ |Boolean|))
        (COND ((NULL |a|) 'T)
              ('T
               (SPADCALL (QCAR (|SPADfirst| |a|))
                         (SPADCALL (QREFELT $ 9) (QREFELT $ 12))
                         (QREFELT $ 16))))) 

(SDEFUN |ANTISYM;retractIfCan;$U;4| ((|a| $) ($ |Union| R "failed"))
        (COND ((NULL |a|) (CONS 0 (|spadConstant| $ 18)))
              ((SPADCALL (QCAR (|SPADfirst| |a|))
                         (SPADCALL (QREFELT $ 9) (QREFELT $ 12))
                         (QREFELT $ 16))
               (CONS 0 (SPADCALL |a| (QREFELT $ 21))))
              ('T (CONS 1 "failed")))) 

(SDEFUN |ANTISYM;retract;$R;5| ((|a| $) ($ R))
        (COND ((NULL |a|) (|spadConstant| $ 18))
              ('T (SPADCALL |a| (QREFELT $ 21))))) 

(SDEFUN |ANTISYM;homogeneous?;$B;6| ((|a| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G784 NIL) (#2=#:G785 NIL) (#3=#:G778 NIL)
          (#4=#:G777 #5=(|Integer|)) (#6=#:G779 #5#) (#7=#:G788 NIL)
          (#8=#:G691 NIL) (#9=#:G787 NIL) (|ta| NIL) (|siz| #5#)
          (#10=#:G745 NIL) (#11=#:G744 #5#) (#12=#:G746 #5#) (#13=#:G786 NIL)
          (#14=#:G690 NIL))
         (SEQ
          (EXIT
           (COND ((NULL |a|) 'T)
                 (#15='T
                  (SEQ
                   (LETT |siz|
                         (PROGN
                          (LETT #10# NIL . #16=(|ANTISYM;homogeneous?;$B;6|))
                          (SEQ (LETT #14# NIL . #16#)
                               (LETT #13#
                                     (SPADCALL (QCAR (|SPADfirst| |a|))
                                               (QREFELT $ 26))
                                     . #16#)
                               G190
                               (COND
                                ((OR (ATOM #13#)
                                     (PROGN (LETT #14# (CAR #13#) . #16#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #12# #14# . #16#)
                                  (COND (#10# (LETT #11# (+ #11# #12#) . #16#))
                                        ('T
                                         (PROGN
                                          (LETT #11# #12# . #16#)
                                          (LETT #10# 'T . #16#)))))))
                               (LETT #13# (CDR #13#) . #16#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#10# #11#) (#15# 0)))
                         . #16#)
                   (SEQ
                    (EXIT
                     (SEQ (LETT |ta| NIL . #16#)
                          (LETT #9# (SPADCALL |a| (QREFELT $ 27)) . #16#) G190
                          (COND
                           ((OR (ATOM #9#)
                                (PROGN (LETT |ta| (CAR #9#) . #16#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (PROGN
                                (LETT #3# NIL . #16#)
                                (SEQ (LETT #8# NIL . #16#)
                                     (LETT #7#
                                           (SPADCALL (QCAR |ta|)
                                                     (QREFELT $ 26))
                                           . #16#)
                                     G190
                                     (COND
                                      ((OR (ATOM #7#)
                                           (PROGN
                                            (LETT #8# (CAR #7#) . #16#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #6# #8# . #16#)
                                        (COND
                                         (#3# (LETT #4# (+ #4# #6#) . #16#))
                                         ('T
                                          (PROGN
                                           (LETT #4# #6# . #16#)
                                           (LETT #3# 'T . #16#)))))))
                                     (LETT #7# (CDR #7#) . #16#) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#3# #4#) ('T 0)))
                               |siz| (QREFELT $ 29))
                              (PROGN
                               (LETT #1#
                                     (PROGN
                                      (LETT #2# NIL . #16#)
                                      (GO #17=#:G783))
                                     . #16#)
                               (GO #18=#:G781))))))
                          (LETT #9# (CDR #9#) . #16#) (GO G190) G191
                          (EXIT NIL)))
                    #18# (EXIT #1#))
                   (EXIT 'T)))))
          #17# (EXIT #2#)))) 

(SDEFUN |ANTISYM;degree;$Nni;7| ((|a| $) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G796 NIL) (#2=#:G794 NIL) (#3=#:G793 #4=(|Integer|))
          (#5=#:G795 #4#) (#6=#:G799 NIL) (#7=#:G692 NIL))
         (SEQ
          (COND ((NULL |a|) 0)
                ((SPADCALL |a| (QREFELT $ 30))
                 (PROG1
                     (LETT #1#
                           (PROGN
                            (LETT #2# NIL . #8=(|ANTISYM;degree;$Nni;7|))
                            (SEQ (LETT #7# NIL . #8#)
                                 (LETT #6#
                                       (SPADCALL (QCAR (|SPADfirst| |a|))
                                                 (QREFELT $ 26))
                                       . #8#)
                                 G190
                                 (COND
                                  ((OR (ATOM #6#)
                                       (PROGN (LETT #7# (CAR #6#) . #8#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #5# #7# . #8#)
                                    (COND (#2# (LETT #3# (+ #3# #5#) . #8#))
                                          ('T
                                           (PROGN
                                            (LETT #3# #5# . #8#)
                                            (LETT #2# 'T . #8#)))))))
                                 (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#2# #3#) (#9='T 0)))
                           . #8#)
                   (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #1#)))
                (#9# (|error| "not a homogeneous element")))))) 

(SDEFUN |ANTISYM;zo| ((|p| |Integer|) (|q| |Integer|) ($ |List| (|Integer|)))
        (COND ((EQL |p| 0) (LIST 1 |q|)) ((EQL |q| 0) (LIST 1 1))
              ('T (LIST 0 0)))) 

(SDEFUN |ANTISYM;getsgn| ((|x| . #1=(|ExtAlgBasis|)) (|y| . #1#) ($ |Integer|))
        (SPROG
         ((|sgn| (|Integer|)) (#2=#:G821 NIL) (#3=#:G820 #4=(|Integer|))
          (#5=#:G822 #4#) (#6=#:G837 NIL) (#7=#:G693 NIL)
          (|xx| #8=(|List| (|Integer|))) (#9=#:G836 NIL) (|i| NIL) (|yy| #8#))
         (SEQ (LETT |sgn| 0 . #10=(|ANTISYM;getsgn|))
              (LETT |xx| (SPADCALL |x| (QREFELT $ 26)) . #10#)
              (LETT |yy| (SPADCALL |y| (QREFELT $ 26)) . #10#)
              (SEQ (LETT |i| 1 . #10#) (LETT #9# (- (QREFELT $ 9) 1) . #10#)
                   G190 (COND ((|greater_SI| |i| #9#) (GO G191)))
                   (SEQ (LETT |xx| (CDR |xx|) . #10#)
                        (EXIT
                         (LETT |sgn|
                               (+ |sgn|
                                  (*
                                   (PROGN
                                    (LETT #2# NIL . #10#)
                                    (SEQ (LETT #7# NIL . #10#)
                                         (LETT #6# |xx| . #10#) G190
                                         (COND
                                          ((OR (ATOM #6#)
                                               (PROGN
                                                (LETT #7# (CAR #6#) . #10#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #5# #7# . #10#)
                                            (COND
                                             (#2#
                                              (LETT #3# (+ #3# #5#) . #10#))
                                             ('T
                                              (PROGN
                                               (LETT #3# #5# . #10#)
                                               (LETT #2# 'T . #10#)))))))
                                         (LETT #6# (CDR #6#) . #10#) (GO G190)
                                         G191 (EXIT NIL))
                                    (COND (#2# #3#) ('T 0)))
                                   (SPADCALL |yy| |i| (QREFELT $ 33))))
                               . #10#)))
                   (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
              (EXIT (COND ((EQL (REM |sgn| 2) 0) 1) ('T -1)))))) 

(SDEFUN |ANTISYM;Nalpha|
        ((|x| . #1=(|ExtAlgBasis|)) (|y| . #1#) ($ |List| (|Integer|)))
        (SPROG
         ((#2=#:G844 NIL) (|i| (|Integer|)) (|dum| (|List| (|Integer|)))
          (#3=#:G847 NIL) (|j| NIL) (|dum2| (|List| (|Integer|)))
          (#4=#:G846 NIL) (#5=#:G845 NIL))
         (SEQ (LETT |i| 1 . #6=(|ANTISYM;Nalpha|))
              (LETT |dum2|
                    (PROGN
                     (LETT #5# NIL . #6#)
                     (SEQ (LETT |i| 1 . #6#) (LETT #4# (QREFELT $ 9) . #6#)
                          G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                          (SEQ (EXIT (LETT #5# (CONS 0 #5#) . #6#)))
                          (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #6#)
              (SEQ
               (EXIT
                (SEQ (LETT |j| 1 . #6#) (LETT #3# (QREFELT $ 9) . #6#) G190
                     (COND ((|greater_SI| |j| #3#) (GO G191)))
                     (SEQ
                      (LETT |dum|
                            (|ANTISYM;zo|
                             (SPADCALL (SPADCALL |x| (QREFELT $ 26)) |j|
                                       (QREFELT $ 33))
                             (SPADCALL (SPADCALL |y| (QREFELT $ 26)) |j|
                                       (QREFELT $ 33))
                             $)
                            . #6#)
                      (LETT |i|
                            (SPADCALL |i| (SPADCALL |dum| 1 (QREFELT $ 33))
                                      (QREFELT $ 34))
                            . #6#)
                      (EXIT
                       (COND
                        ((EQL |i| 0)
                         (PROGN (LETT #2# |$NoValue| . #6#) (GO #7=#:G841)))
                        ('T
                         (SPADCALL |dum2| |j| (SPADCALL |dum| 2 (QREFELT $ 33))
                                   (QREFELT $ 35))))))
                     (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                     (EXIT NIL)))
               #7# (EXIT #2#))
              (EXIT
               (COND ((EQL |i| 0) (CONS |i| |dum2|))
                     ('T (CONS (|ANTISYM;getsgn| |x| |y| $) |dum2|))))))) 

(SDEFUN |ANTISYM;*;3$;11| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|z| ($)) (|r| (R)) (|stuff| (|List| (|Integer|))) (#1=#:G859 NIL)
          (|ta| NIL) (#2=#:G858 NIL) (|tb| NIL))
         (SEQ
          (COND ((OR (NULL |a|) (NULL |b|)) (|spadConstant| $ 32))
                ('T
                 (SEQ
                  (COND
                   ((NULL (CDR |a|))
                    (COND
                     ((SPADCALL (QCAR (|SPADfirst| |a|))
                                (SPADCALL (QREFELT $ 9) (QREFELT $ 12))
                                (QREFELT $ 16))
                      (EXIT
                       (SPADCALL (QCDR (|SPADfirst| |a|)) |b|
                                 (QREFELT $ 36)))))))
                  (COND
                   ((NULL (CDR |b|))
                    (COND
                     ((SPADCALL (QCAR (|SPADfirst| |b|))
                                (SPADCALL (QREFELT $ 9) (QREFELT $ 12))
                                (QREFELT $ 16))
                      (EXIT
                       (SPADCALL (QCDR (|SPADfirst| |b|)) |a|
                                 (QREFELT $ 36)))))))
                  (LETT |z| (|spadConstant| $ 32) . #3=(|ANTISYM;*;3$;11|))
                  (SEQ (LETT |tb| NIL . #3#) (LETT #2# |b| . #3#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |tb| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |ta| NIL . #3#) (LETT #1# |a| . #3#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |ta| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |stuff|
                                     (|ANTISYM;Nalpha| (QCAR |ta|) (QCAR |tb|)
                                      $)
                                     . #3#)
                               (LETT |r|
                                     (SPADCALL
                                      (SPADCALL (|SPADfirst| |stuff|)
                                                (QCDR |ta|) (QREFELT $ 37))
                                      (QCDR |tb|) (QREFELT $ 38))
                                     . #3#)
                               (EXIT
                                (COND
                                 ((SPADCALL |r| (|spadConstant| $ 18)
                                            (QREFELT $ 39))
                                  (LETT |z|
                                        (SPADCALL |z|
                                                  (LIST
                                                   (CONS
                                                    (SPADCALL (CDR |stuff|)
                                                              (QREFELT $ 40))
                                                    |r|))
                                                  (QREFELT $ 41))
                                        . #3#)))))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT |z|))))))) 

(SDEFUN |ANTISYM;coerce;R$;12| ((|r| R) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 18) (QREFELT $ 43))
          (|spadConstant| $ 32))
         ('T (LIST (CONS (SPADCALL (QREFELT $ 9) (QREFELT $ 12)) |r|))))) 

(SDEFUN |ANTISYM;coerce;I$;13| ((|m| |Integer|) ($ $))
        (COND ((EQL |m| 0) (|spadConstant| $ 32))
              ('T
               (LIST
                (CONS (SPADCALL (QREFELT $ 9) (QREFELT $ 12))
                      (SPADCALL |m| (QREFELT $ 45))))))) 

(SDEFUN |ANTISYM;characteristic;Nni;14| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 47))) 

(SDEFUN |ANTISYM;generator;Nni$;15| ((|j| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|dum| (|List| (|Integer|))) (#1=#:G870 NIL) (|i| NIL)
          (#2=#:G869 NIL))
         (SEQ
          (LETT |dum|
                (PROGN
                 (LETT #2# NIL . #3=(|ANTISYM;generator;Nni$;15|))
                 (SEQ (LETT |i| 1 . #3#) (LETT #1# (QREFELT $ 9) . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS 0 #2#) . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (SPADCALL |dum| |j| 1 (QREFELT $ 35))
          (EXIT
           (LIST
            (CONS (SPADCALL |dum| (QREFELT $ 40)) (|spadConstant| $ 13))))))) 

(SDEFUN |ANTISYM;exp;L$;16| ((|li| |List| (|Integer|)) ($ $))
        (LIST (CONS (SPADCALL |li| (QREFELT $ 40)) (|spadConstant| $ 13)))) 

(SDEFUN |ANTISYM;leadingBasisTerm;2$;17| ((|a| $) ($ $))
        (LIST (CONS (QCAR (|SPADfirst| |a|)) (|spadConstant| $ 13)))) 

(SDEFUN |ANTISYM;displayList| ((|x| |ExtAlgBasis|) ($ |OutputForm|))
        (SPROG
         ((#1=#:G888 NIL) (|i| NIL) (#2=#:G887 NIL)
          (|le| (|List| (|Integer|))))
         (SEQ
          (LETT |le| (SPADCALL |x| (QREFELT $ 26))
                . #3=(|ANTISYM;displayList|))
          (EXIT
           (SPADCALL (ELT $ 53)
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |i| 1 . #3#) (LETT #1# (QREFELT $ 9) . #3#)
                           G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((EQL (SPADCALL |le| |i| (QREFELT $ 33)) 1)
                               (LETT #2#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL (QREFELT $ 7) |i|
                                                 (QREFELT $ 56))
                                       (QREFELT $ 57))
                                      #2#)
                                     . #3#)))))
                           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 60)))))) 

(SDEFUN |ANTISYM;makeTerm| ((|r| R) (|x| |ExtAlgBasis|) ($ |OutputForm|))
        (COND
         ((SPADCALL |x| (SPADCALL (QREFELT $ 9) (QREFELT $ 12)) (QREFELT $ 16))
          (SPADCALL |r| (QREFELT $ 61)))
         ((SPADCALL |r| (|spadConstant| $ 13) (QREFELT $ 43))
          (|ANTISYM;displayList| |x| $))
         ('T
          (SPADCALL (SPADCALL |r| (QREFELT $ 61)) (|ANTISYM;displayList| |x| $)
                    (QREFELT $ 53))))) 

(SDEFUN |ANTISYM;coerce;$Of;20| ((|a| $) ($ |OutputForm|))
        (SPROG
         ((#1=#:G900 NIL)
          (|t| (|Record| (|:| |k| (|ExtAlgBasis|)) (|:| |c| R)))
          (#2=#:G899 NIL))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT $ 62)) (SPADCALL 0 (QREFELT $ 63)))
                ((NULL (CDR |a|))
                 (SEQ
                  (LETT |t| (|SPADfirst| |a|) . #3=(|ANTISYM;coerce;$Of;20|))
                  (EXIT (|ANTISYM;makeTerm| (QCDR |t|) (QCAR |t|) $))))
                ('T
                 (SPADCALL (ELT $ 64)
                           (PROGN
                            (LETT #2# NIL . #3#)
                            (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS
                                          (|ANTISYM;makeTerm| (QCDR |t|)
                                           (QCAR |t|) $)
                                          #2#)
                                         . #3#)))
                                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 60))))))) 

(DECLAIM (NOTINLINE |AntiSymm;|)) 

(DEFUN |AntiSymm| (&REST #1=#:G905)
  (SPROG NIL
         (PROG (#2=#:G906)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AntiSymm|)
                                               '|domainEqualList|)
                    . #3=(|AntiSymm|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AntiSymm;|) #1#)
                    (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|AntiSymm|)))))))))) 

(DEFUN |AntiSymm;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|AntiSymm|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|AntiSymm| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 72) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|AntiSymm| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|List|
                     (|Record| (|:| |k| (|ExtAlgBasis|)) (|:| |c| |#1|))))
          (QSETREFV $ 9 (LENGTH |#2|))
          $))) 

(MAKEPROP '|AntiSymm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 6 11) (|local| |#1|)
              (|local| |#2|) '|Rep| '|dim| (|NonNegativeInteger|)
              (|ExtAlgBasis|) (0 . |Nul|) (5 . |One|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |ANTISYM;One;$;1|) $))
              (|Boolean|) (9 . =) (15 . <) (21 . |Zero|)
              |ANTISYM;coefficient;2$R;2| |ANTISYM;retractable?;$B;3|
              (25 . |leadingCoefficient|) (|Union| 6 '"failed")
              |ANTISYM;retractIfCan;$U;4| |ANTISYM;retract;$R;5| (|List| 28)
              (30 . |exponents|) (35 . |reductum|) (|Integer|) (40 . ~=)
              |ANTISYM;homogeneous?;$B;6| |ANTISYM;degree;$Nni;7| (46 . |Zero|)
              (50 . |elt|) (56 . *) (62 . |setelt!|) (69 . *) (75 . *) (81 . *)
              (87 . ~=) (93 . |coerce|) (98 . +) |ANTISYM;*;3$;11| (104 . =)
              |ANTISYM;coerce;R$;12| (110 . |coerce|) |ANTISYM;coerce;I$;13|
              (115 . |characteristic|) |ANTISYM;characteristic;Nni;14|
              |ANTISYM;generator;Nni$;15| |ANTISYM;exp;L$;16|
              |ANTISYM;leadingBasisTerm;2$;17| (|OutputForm|) (119 . *)
              (|Symbol|) (|List| 54) (125 . |elt|) (131 . |coerce|)
              (|Mapping| 52 52 52) (|List| 52) (136 . |reduce|)
              (142 . |coerce|) (147 . |zero?|) (152 . |coerce|) (157 . +)
              |ANTISYM;coerce;$Of;20| (|Mapping| 6 6) (|Union| $ '"failed")
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 163 |zero?| 169 |subtractIfCan| 174 |sample| 180
              |retractable?| 184 |retractIfCan| 189 |retract| 194 |reductum|
              199 |recip| 204 |opposite?| 209 |one?| 215 |map| 220
              |leadingCoefficient| 226 |leadingBasisTerm| 231 |latex| 236
              |homogeneous?| 241 |hashUpdate!| 246 |hash| 252 |generator| 257
              |exp| 262 |degree| 267 |coerce| 272 |coefficient| 287
              |characteristic| 293 |annihilate?| 297 ^ 303 |Zero| 315 |One| 319
              = 323 - 329 + 340 * 346)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|LeftAlgebra&| |Ring&| |Rng&| NIL NIL |AbelianGroup&| NIL
                     NIL |AbelianMonoid&| |Monoid&| NIL |SemiGroup&|
                     |AbelianSemiGroup&| |SetCategory&| |RetractableTo&| NIL
                     |BasicType&| NIL)
                  (CONS
                   '#((|LeftAlgebra| 6) (|Ring|) (|Rng|) (|LeftModule| 6)
                      (|LeftModule| $$) (|AbelianGroup|)
                      (|CancellationAbelianMonoid|) (|SemiRing|)
                      (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                      (|AbelianSemiGroup|) (|SetCategory|) (|RetractableTo| 6)
                      (|unitsKnown|) (|BasicType|) (|CoercibleTo| 52))
                   (|makeByteWordVec2| 71
                                       '(1 11 0 10 12 0 6 0 13 2 11 15 0 0 16 2
                                         11 15 0 0 17 0 6 0 18 1 0 6 0 21 1 11
                                         25 0 26 1 0 0 0 27 2 28 15 0 0 29 0 0
                                         0 32 2 25 28 0 28 33 2 28 0 10 0 34 3
                                         25 28 0 28 28 35 2 0 0 6 0 36 2 6 0 28
                                         0 37 2 6 0 0 0 38 2 6 15 0 0 39 1 11 0
                                         25 40 2 0 0 0 0 41 2 6 15 0 0 43 1 6 0
                                         28 45 0 6 10 47 2 52 0 0 0 53 2 55 54
                                         0 28 56 1 54 52 0 57 2 59 52 58 0 60 1
                                         6 52 0 61 1 0 15 0 62 1 28 52 0 63 2
                                         52 0 0 0 64 2 0 15 0 0 1 1 0 15 0 62 2
                                         0 67 0 0 1 0 0 0 1 1 0 15 0 20 1 0 22
                                         0 23 1 0 6 0 24 1 0 0 0 27 1 0 67 0 1
                                         2 0 15 0 0 1 1 0 15 0 1 2 0 0 66 0 1 1
                                         0 6 0 21 1 0 0 0 51 1 0 69 0 1 1 0 15
                                         0 30 2 0 71 71 0 1 1 0 70 0 1 1 0 0 10
                                         49 1 0 0 25 50 1 0 10 0 31 1 0 0 6 44
                                         1 0 0 28 46 1 0 52 0 65 2 0 6 0 0 19 0
                                         0 10 48 2 0 15 0 0 1 2 0 0 0 10 1 2 0
                                         0 0 68 1 0 0 0 32 0 0 0 14 2 0 15 0 0
                                         1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 41 2
                                         0 0 6 0 36 2 0 0 0 0 42 2 0 0 28 0 1 2
                                         0 0 10 0 1 2 0 0 68 0 1)))))
           '|lookupComplete|)) 
