
(SDEFUN |MRVLIM;var_kers|
        ((|e| |Expression| (|Integer|))
         ($ |List| (|Kernel| (|Expression| (|Integer|)))))
        (SPROG ((#1=#:G754 NIL) (|kk| NIL) (#2=#:G753 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MRVLIM;var_kers|))
                 (SEQ (LETT |kk| NIL . #3#)
                      (LETT #1# (SPADCALL |e| (QREFELT $ 21)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |kk| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL
                           (SPADCALL (SPADCALL |kk| (QREFELT $ 23))
                                     (QREFELT $ 11) (QREFELT $ 24))
                           (|spadConstant| $ 7) (QREFELT $ 26))
                          (LETT #2# (CONS |kk| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MRVLIM;mrv_normalize;ESRE;2|
        ((|f| |Expression| (|Integer|)) (|x| |Symbol|)
         (|state| |Record| (|:| |tan_syms| (|List| (|Symbol|)))
          (|:| |atan_syms| (|List| (|Symbol|)))
          (|:| |tan_kers| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|:| |atan_kers| (|List| (|Kernel| (|Expression| (|Integer|))))))
         ($ |Expression| (|Integer|)))
        (SPROG
         ((#1=#:G802 NIL) (|nk| (|Expression| (|Integer|))) (|ss| (|Integer|))
          (|la| (|OrderedCompletion| (|Expression| (|Integer|))))
          (|l_ts| (|List| (|Symbol|)))
          (|l_tan| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|ns| (|Symbol|)) (|need_subst| (|Boolean|))
          (|l_as| (|List| (|Symbol|)))
          (|l_atan| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|lau|
           (|Union| (|OrderedCompletion| (|Expression| (|Integer|))) "failed"))
          (|arg1| (|Expression| (|Integer|))) (|nm| (|Symbol|))
          (|ntf| (|List| (|Expression| (|Integer|))))
          (|rtf| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|nargs| (|List| (|Expression| (|Integer|)))) (#2=#:G805 NIL)
          (|arg| NIL) (#3=#:G804 NIL)
          (|args| (|List| (|Expression| (|Integer|)))) (|op| (|BasicOperator|))
          (#4=#:G803 NIL) (|k| NIL)
          (|tf| (|List| (|Kernel| (|Expression| (|Integer|))))))
         (SEQ
          (LETT |f| (SPADCALL |f| (QREFELT $ 28))
                . #5=(|MRVLIM;mrv_normalize;ESRE;2|))
          (LETT |tf| (SPADCALL |f| (QREFELT $ 21)) . #5#)
          (LETT |rtf| NIL . #5#) (LETT |ntf| NIL . #5#)
          (LETT |l_atan| NIL . #5#) (LETT |l_as| NIL . #5#)
          (LETT |l_tan| NIL . #5#) (LETT |l_ts| NIL . #5#)
          (SEQ (LETT |k| NIL . #5#) (LETT #4# |tf| . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |k| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL
                    (SPADCALL (SPADCALL |k| (QREFELT $ 23)) |x| (QREFELT $ 24))
                    (|spadConstant| $ 7) (QREFELT $ 29))
                   "iterate")
                  ('T
                   (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 31)) . #5#)
                        (LETT |args| (SPADCALL |k| (QREFELT $ 33)) . #5#)
                        (LETT |nargs|
                              (PROGN
                               (LETT #3# NIL . #5#)
                               (SEQ (LETT |arg| NIL . #5#)
                                    (LETT #2# |args| . #5#) G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN
                                           (LETT |arg| (CAR #2#) . #5#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #3#
                                            (CONS
                                             (SPADCALL |arg| |rtf| |ntf|
                                                       (QREFELT $ 35))
                                             #3#)
                                            . #5#)))
                                    (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              . #5#)
                        (LETT |nk|
                              (COND
                               ((SPADCALL |args| |nargs| (QREFELT $ 36))
                                (SPADCALL |op| |nargs| (QREFELT $ 37)))
                               ('T (SPADCALL |k| (QREFELT $ 23))))
                              . #5#)
                        (LETT |rtf| (CONS |k| |rtf|) . #5#)
                        (LETT |ntf| (CONS |nk| |ntf|) . #5#)
                        (LETT |nm| (SPADCALL |op| (QREFELT $ 38)) . #5#)
                        (EXIT
                         (COND
                          ((OR (EQUAL |nm| '|exp|) (EQUAL |nm| '|log|))
                           "iterate")
                          ('T
                           (SEQ
                            (EXIT
                             (COND
                              ((EQL (LENGTH |args|) 1)
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (LETT |lau|
                                             (SPADCALL
                                              (LETT |arg1|
                                                    (SPADCALL |nargs| 1
                                                              (QREFELT $ 41))
                                                    . #5#)
                                              |x| |state| (QREFELT $ 44))
                                             . #5#)
                                       (EXIT
                                        (COND
                                         ((EQUAL |nm| '|atan|)
                                          (COND
                                           ((QEQCAR |lau| 1)
                                            (SEQ
                                             (LETT |ns|
                                                   (SPADCALL (QREFELT $ 10))
                                                   . #5#)
                                             (LETT |nk|
                                                   (SPADCALL |ns|
                                                             (QREFELT $ 45))
                                                   . #5#)
                                             (LETT |l_atan|
                                                   (CONS
                                                    (SPADCALL
                                                     (SPADCALL |nk|
                                                               (QREFELT $ 46))
                                                     1 (QREFELT $ 48))
                                                    |l_atan|)
                                                   . #5#)
                                             (LETT |l_as| (CONS |ns| |l_as|)
                                                   . #5#)
                                             (EXIT
                                              (SPADCALL |ntf| 1 |nk|
                                                        (QREFELT $ 49)))))
                                           ('T
                                            (SEQ (LETT |la| (QCDR |lau|) . #5#)
                                                 (LETT |ss|
                                                       (SPADCALL |la|
                                                                 (QREFELT $
                                                                          52))
                                                       . #5#)
                                                 (EXIT
                                                  (COND
                                                   ((EQL |ss| 0) "iterate")
                                                   ('T
                                                    (SEQ
                                                     (LETT |nk|
                                                           (COND
                                                            ((EQL |ss| 1)
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 53))
                                                               (SPADCALL 2
                                                                         (QREFELT
                                                                          $
                                                                          54))
                                                               (QREFELT $ 55))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (|spadConstant|
                                                                 $ 39)
                                                                |arg1|
                                                                (QREFELT $ 55))
                                                               (QREFELT $ 56))
                                                              (QREFELT $ 57)))
                                                            ('T
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QREFELT $
                                                                          53))
                                                                (SPADCALL 2
                                                                          (QREFELT
                                                                           $
                                                                           54))
                                                                (QREFELT $ 55))
                                                               (QREFELT $ 58))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (|spadConstant|
                                                                 $ 39)
                                                                |arg1|
                                                                (QREFELT $ 55))
                                                               (QREFELT $ 56))
                                                              (QREFELT $ 57))))
                                                           . #5#)
                                                     (EXIT
                                                      (SPADCALL |ntf| 1 |nk|
                                                                (QREFELT $
                                                                         49)))))))))))
                                         ((EQUAL |nm| '|tan|)
                                          (SEQ
                                           (LETT |need_subst|
                                                 (COND ((QEQCAR |lau| 1) 'T)
                                                       ('T
                                                        (SEQ
                                                         (LETT |la|
                                                               (QCDR |lau|)
                                                               . #5#)
                                                         (LETT |ss|
                                                               (SPADCALL |la|
                                                                         (QREFELT
                                                                          $
                                                                          52))
                                                               . #5#)
                                                         (EXIT
                                                          (NULL
                                                           (EQL |ss| 0))))))
                                                 . #5#)
                                           (EXIT
                                            (COND
                                             (|need_subst|
                                              (SEQ
                                               (LETT |ns|
                                                     (SPADCALL (QREFELT $ 10))
                                                     . #5#)
                                               (LETT |nk|
                                                     (SPADCALL |ns|
                                                               (QREFELT $ 45))
                                                     . #5#)
                                               (LETT |l_tan|
                                                     (CONS
                                                      (SPADCALL
                                                       (SPADCALL |nk|
                                                                 (QREFELT $
                                                                          46))
                                                       1 (QREFELT $ 48))
                                                      |l_tan|)
                                                     . #5#)
                                               (LETT |l_ts| (CONS |ns| |l_ts|)
                                                     . #5#)
                                               (EXIT
                                                (SPADCALL |ntf| 1 |nk|
                                                          (QREFELT $ 49)))))
                                             ('T "iterate")))))
                                         ((QEQCAR |lau| 1) "iterate")
                                         ('T
                                          (SEQ (LETT |la| (QCDR |lau|) . #5#)
                                               (LETT |ss|
                                                     (SPADCALL |la|
                                                               (QREFELT $ 52))
                                                     . #5#)
                                               (EXIT
                                                (COND
                                                 ((EQUAL |nm| '|Gamma|)
                                                  (COND
                                                   ((EQL |ss| 1)
                                                    (SEQ
                                                     (LETT |nk|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (QREFELT $ 16)
                                                             |arg1|
                                                             (QREFELT $ 59))
                                                            (QREFELT $ 60))
                                                           . #5#)
                                                     (EXIT
                                                      (SPADCALL |ntf| 1 |nk|
                                                                (QREFELT $
                                                                         49)))))))
                                                 ((EQUAL |nm| '|Ei|)
                                                  (COND
                                                   ((EQL |ss| 1)
                                                    (SEQ
                                                     (LETT |nk|
                                                           (SPADCALL
                                                            (SPADCALL |arg1|
                                                                      (QREFELT
                                                                       $ 60))
                                                            (SPADCALL
                                                             (QREFELT $ 17)
                                                             |arg1|
                                                             (QREFELT $ 59))
                                                            (QREFELT $ 61))
                                                           . #5#)
                                                     (EXIT
                                                      (SPADCALL |ntf| 1 |nk|
                                                                (QREFELT $
                                                                         49)))))))
                                                 ((EQUAL |nm| '|li|)
                                                  (COND
                                                   ((EQL |ss| 1)
                                                    (SEQ
                                                     (LETT |nk|
                                                           (SPADCALL |arg1|
                                                                     (SPADCALL
                                                                      (QREFELT
                                                                       $ 17)
                                                                      (SPADCALL
                                                                       |arg1|
                                                                       (QREFELT
                                                                        $ 62))
                                                                      (QREFELT
                                                                       $ 59))
                                                                     (QREFELT $
                                                                              61))
                                                           . #5#)
                                                     (EXIT
                                                      (SPADCALL |ntf| 1 |nk|
                                                                (QREFELT $
                                                                         49)))))))
                                                 ((EQUAL |nm| '|erf|)
                                                  (COND
                                                   ((EQL |ss| 1)
                                                    (SEQ
                                                     (LETT |nk|
                                                           (SPADCALL
                                                            (|spadConstant| $
                                                                            39)
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL |arg1|
                                                                         2
                                                                         (QREFELT
                                                                          $
                                                                          64))
                                                               (QREFELT $ 58))
                                                              (QREFELT $ 60))
                                                             (SPADCALL
                                                              (QREFELT $ 18)
                                                              |arg1|
                                                              (QREFELT $ 59))
                                                             (QREFELT $ 61))
                                                            (QREFELT $ 57))
                                                           . #5#)
                                                     (EXIT
                                                      (SPADCALL |ntf| 1 |nk|
                                                                (QREFELT $
                                                                         49)))))
                                                   ((EQL |ss| -1)
                                                    (SEQ
                                                     (LETT |nk|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL |arg1|
                                                                         2
                                                                         (QREFELT
                                                                          $
                                                                          64))
                                                               (QREFELT $ 58))
                                                              (QREFELT $ 60))
                                                             (SPADCALL
                                                              (QREFELT $ 18)
                                                              (SPADCALL |arg1|
                                                                        (QREFELT
                                                                         $ 58))
                                                              (QREFELT $ 59))
                                                             (QREFELT $ 61))
                                                            (|spadConstant| $
                                                                            39)
                                                            (QREFELT $ 57))
                                                           . #5#)
                                                     (EXIT
                                                      (SPADCALL |ntf| 1 |nk|
                                                                (QREFELT $
                                                                         49)))))))
                                                 ((EQUAL |nm| '|erfi|)
                                                  (COND
                                                   ((EQL |ss| 1)
                                                    (SEQ
                                                     (LETT |nk|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL |arg1| 2
                                                                       (QREFELT
                                                                        $ 64))
                                                             (QREFELT $ 60))
                                                            (SPADCALL
                                                             (QREFELT $ 19)
                                                             |arg1|
                                                             (QREFELT $ 59))
                                                            (QREFELT $ 61))
                                                           . #5#)
                                                     (EXIT
                                                      (SPADCALL |ntf| 1 |nk|
                                                                (QREFELT $
                                                                         49)))))
                                                   ((EQL |ss| -1)
                                                    (SEQ
                                                     (LETT |nk|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |arg1|
                                                                        2
                                                                        (QREFELT
                                                                         $ 64))
                                                              (QREFELT $ 60))
                                                             (SPADCALL
                                                              (QREFELT $ 19)
                                                              (SPADCALL |arg1|
                                                                        (QREFELT
                                                                         $ 58))
                                                              (QREFELT $ 59))
                                                             (QREFELT $ 61))
                                                            (QREFELT $ 58))
                                                           . #5#)
                                                     (EXIT
                                                      (SPADCALL |ntf| 1 |nk|
                                                                (QREFELT $
                                                                         49))))))))))))))
                                      . #5#)
                                (GO #6=#:G795)))))
                            #6# (EXIT #1#))))))))))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (QSETVELT |state| 0 |l_ts|) (QSETVELT |state| 1 |l_as|)
          (QSETVELT |state| 2 |l_tan|) (QSETVELT |state| 3 |l_atan|)
          (EXIT (SPADCALL |f| |rtf| |ntf| (QREFELT $ 35)))))) 

(SDEFUN |MRVLIM;mrv_bounded1|
        ((|e| |Expression| (|Integer|))
         (|state| |Record| (|:| |tan_syms| (|List| (|Symbol|)))
          (|:| |atan_syms| (|List| (|Symbol|)))
          (|:| |tan_kers| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|:| |atan_kers| (|List| (|Kernel| (|Expression| (|Integer|))))))
         ($ |Boolean|))
        (SPROG
         ((|vde| (|List| (|Symbol|))) (|sde| (|Union| (|Integer|) "failed"))
          (|kk| (|Kernel| (|Expression| (|Integer|))))
          (|de|
           (|SparseMultivariatePolynomial| (|Integer|)
                                           (|Kernel|
                                            (|Expression| (|Integer|)))))
          (|ne|
           (|SparseMultivariatePolynomial| (|Integer|)
                                           (|Kernel|
                                            (|Expression| (|Integer|)))))
          (|ke| (|List| (|Kernel| (|Expression| (|Integer|))))))
         (SEQ
          (LETT |ke| (SPADCALL |e| (QREFELT $ 46))
                . #1=(|MRVLIM;mrv_bounded1|))
          (LETT |ne| (SPADCALL |e| (QREFELT $ 72)) . #1#)
          (LETT |de| (SPADCALL |e| (QREFELT $ 73)) . #1#)
          (EXIT
           (COND
            ((EQL (LENGTH |ke|) 1)
             (SEQ (LETT |kk| (|SPADfirst| |ke|) . #1#)
                  (EXIT
                   (COND
                    ((SPADCALL |kk| (QVELT |state| 2) (QREFELT $ 74))
                     (COND
                      ((SPADCALL (SPADCALL |ne| |kk| (QREFELT $ 77))
                                 (SPADCALL |de| |kk| (QREFELT $ 77))
                                 (QREFELT $ 78))
                       NIL)
                      (#2='T
                       (SEQ
                        (LETT |sde|
                              (SPADCALL (SPADCALL |de| (QREFELT $ 79))
                                        (QREFELT $ 82))
                              . #1#)
                        (EXIT
                         (COND
                          ((QEQCAR |sde| 0)
                           (SPADCALL (QCDR |sde|) 0 (QREFELT $ 84)))
                          (#2# NIL)))))))
                    ((SPADCALL |kk| (QVELT |state| 3) (QREFELT $ 74))
                     (SEQ
                      (LETT |sde|
                            (SPADCALL
                             (SPADCALL (SPADCALL |de| (QREFELT $ 79)) |kk|
                                       (SPADCALL (SPADCALL |kk| (QREFELT $ 23))
                                                 (QREFELT $ 56))
                                       (QREFELT $ 85))
                             (QREFELT $ 82))
                            . #1#)
                      (EXIT
                       (COND
                        ((QEQCAR |sde| 0)
                         (SPADCALL (QCDR |sde|) 0 (QREFELT $ 84)))
                        (#2# NIL)))))
                    (#2# 'T)))))
            (#2#
             (SEQ
              (LETT |vde|
                    (SPADCALL (SPADCALL |de| (QREFELT $ 79)) (QREFELT $ 87))
                    . #1#)
              (COND
               ((NULL (SPADCALL |vde| (QVELT |state| 0) (QREFELT $ 88)))
                (COND
                 ((NULL
                   (NULL (SPADCALL |vde| (QVELT |state| 1) (QREFELT $ 88))))
                  (EXIT NIL))))
               (#2# (EXIT NIL)))
              (EXIT
               (NULL
                (SPADCALL
                 (SPADCALL (SPADCALL |ne| (QREFELT $ 79)) (QREFELT $ 46))
                 (QVELT |state| 2) (QREFELT $ 89))))))))))) 

(SDEFUN |MRVLIM;mrv_bounded|
        ((|state| |Record| (|:| |tan_syms| (|List| (|Symbol|)))
          (|:| |atan_syms| (|List| (|Symbol|)))
          (|:| |tan_kers| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|:| |atan_kers| (|List| (|Kernel| (|Expression| (|Integer|))))))
         ($ |Mapping| (|Boolean|) (|Expression| (|Integer|))))
        (SPROG NIL (CONS #'|MRVLIM;mrv_bounded!0| (VECTOR $ |state|)))) 

(SDEFUN |MRVLIM;mrv_bounded!0| ((|e| NIL) ($$ NIL))
        (PROG (|state| $)
          (LETT |state| (QREFELT $$ 1) . #1=(|MRVLIM;mrv_bounded|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MRVLIM;mrv_bounded1| |e| |state| $))))) 

(SDEFUN |MRVLIM;mrv_invertible|
        ((|state| |Record| (|:| |tan_syms| (|List| (|Symbol|)))
          (|:| |atan_syms| (|List| (|Symbol|)))
          (|:| |tan_kers| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|:| |atan_kers| (|List| (|Kernel| (|Expression| (|Integer|))))))
         ($ |Mapping| (|Boolean|) (|Expression| (|Integer|))))
        (SPROG ((|var_syms| (|List| (|Symbol|))))
               (SEQ
                (LETT |var_syms|
                      (SPADCALL (QVELT |state| 0) (QVELT |state| 1)
                                (QREFELT $ 90))
                      |MRVLIM;mrv_invertible|)
                (EXIT
                 (CONS #'|MRVLIM;mrv_invertible!0|
                       (VECTOR |state| |var_syms| $)))))) 

(SDEFUN |MRVLIM;mrv_invertible!0| ((|e| NIL) ($$ NIL))
        (PROG ($ |var_syms| |state|)
          (LETT $ (QREFELT $$ 2) . #1=(|MRVLIM;mrv_invertible|))
          (LETT |var_syms| (QREFELT $$ 1) . #1#)
          (LETT |state| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|sde| NIL) (|de| NIL) (|ne| NIL) (|kk| NIL) (|ke| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL
                       (SPADCALL (SPADCALL |e| (QREFELT $ 87)) |var_syms|
                                 (QREFELT $ 88))
                       (QREFELT $ 91))
                      'T)
                     ('T
                      (SEQ (LETT |ke| (SPADCALL |e| (QREFELT $ 46)) NIL)
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |ke| (QREFELT $ 92))
                                        (|spadConstant| $ 93) (QREFELT $ 94))
                              NIL)
                             ('T
                              (SEQ
                               (LETT |kk| (SPADCALL |ke| (QREFELT $ 95)) NIL)
                               (LETT |ne| (SPADCALL |e| (QREFELT $ 72)) NIL)
                               (LETT |de| (SPADCALL |e| (QREFELT $ 73)) NIL)
                               (EXIT
                                (COND
                                 ((SPADCALL |kk| (QVELT |state| 2)
                                            (QREFELT $ 74))
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |ne| |kk| (QREFELT $ 77))
                                     (SPADCALL |de| |kk| (QREFELT $ 77))
                                     (QREFELT $ 96))
                                    NIL)
                                   ('T
                                    (SEQ
                                     (LETT |sde|
                                           (SPADCALL
                                            (SPADCALL |de| (QREFELT $ 79))
                                            (QREFELT $ 82))
                                           NIL)
                                     (EXIT
                                      (COND
                                       ((QEQCAR |sde| 0)
                                        (SPADCALL (QCDR |sde|)
                                                  (|spadConstant| $ 97)
                                                  (QREFELT $ 84)))
                                       ('T NIL)))))))
                                 ((SPADCALL |kk| (QVELT |state| 3)
                                            (QREFELT $ 74))
                                  (SEQ
                                   (LETT |sde|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |de| (QREFELT $ 79)) |kk|
                                           (SPADCALL
                                            (SPADCALL |kk| (QREFELT $ 23))
                                            (QREFELT $ 56))
                                           (QREFELT $ 85))
                                          (QREFELT $ 82))
                                         NIL)
                                   (EXIT
                                    (COND
                                     ((QEQCAR |sde| 0)
                                      (SPADCALL (QCDR |sde|)
                                                (|spadConstant| $ 97)
                                                (QREFELT $ 84)))
                                     ('T NIL)))))
                                 ('T NIL)))))))))))))))) 

(SDEFUN |MRVLIM;mrv_zero| ((|e| |Expression| (|Integer|)) ($ |Boolean|))
        (SPADCALL (SPADCALL |e| (QREFELT $ 28)) (|spadConstant| $ 7)
                  (QREFELT $ 29))) 

(SDEFUN |MRVLIM;expr_to_series;EKRU;7|
        ((|e| |Expression| (|Integer|))
         (|k| |Kernel| (|Expression| (|Integer|)))
         (|state| |Record| (|:| |tan_syms| (|List| (|Symbol|)))
          (|:| |atan_syms| (|List| (|Symbol|)))
          (|:| |tan_kers| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|:| |atan_kers| (|List| (|Kernel| (|Expression| (|Integer|))))))
         ($ |Union|
          (|Record| (|:| |degree| (|OrderedExpression|))
                    (|:| |coeff| (|Expression| (|Integer|))))
          "failed"))
        (SPROG
         ((#1=#:G888 NIL)
          (|vkers| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|ssl| (|Upg|)) (|kk| (|Integer|)) (#2=#:G887 NIL)
          (|lc| (|Expression| (|Integer|))) (|ssll| (|Upg|))
          (|deg| (|OrderedExpression|)) (|ssl0| (|Upg|)) (#3=#:G874 NIL)
          (|ss|
           (|Union| (|:| |%series| |Upg|)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|h| (|Expression| (|Integer|))) (|ex| (|Expression| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ex|
                  (SPADCALL |e| (LIST |k|)
                            (LIST (SPADCALL (QREFELT $ 11) (QREFELT $ 45)))
                            (QREFELT $ 35))
                  . #4=(|MRVLIM;expr_to_series;EKRU;7|))
            (COND
             ((NULL (SPADCALL |k| '|exp| (QREFELT $ 98)))
              (EXIT (|error| "Can only expand with respect to exp"))))
            (LETT |h| (SPADCALL (SPADCALL |k| (QREFELT $ 33)) 1 (QREFELT $ 41))
                  . #4#)
            (LETT |ss|
                  (SPADCALL |ex| NIL (CONS 0 "complex") 'T |h|
                            (|MRVLIM;mrv_bounded| |state| $)
                            (|MRVLIM;mrv_invertible| |state| $)
                            (CONS (|function| |MRVLIM;mrv_zero|) $)
                            (QREFELT $ 103))
                  . #4#)
            (EXIT
             (COND ((QEQCAR |ss| 1) (CONS 1 "failed"))
                   (#5='T
                    (SEQ
                     (LETT |ssl|
                           (PROG2 (LETT #3# |ss| . #4#)
                               (QCDR #3#)
                             (|check_union2| (QEQCAR #3# 0) (QREFELT $ 67)
                                             (|Union|
                                              (|:| |%series| (QREFELT $ 67))
                                              (|:| |%problem|
                                                   (|Record|
                                                    (|:| |func| (|String|))
                                                    (|:| |prob| (|String|)))))
                                             #3#))
                           . #4#)
                     (LETT |kk| 0 . #4#) (LETT |ssl0| |ssl| . #4#)
                     (SEQ
                      (EXIT
                       (SEQ G190 NIL
                            (SEQ
                             (LETT |deg| (SPADCALL |ssl| (QREFELT $ 104))
                                   . #4#)
                             (LETT |ssll|
                                   (SPADCALL |ssl| |deg| (QREFELT $ 105))
                                   . #4#)
                             (LETT |lc|
                                   (SPADCALL (SPADCALL |ssll| (QREFELT $ 106))
                                             (QREFELT $ 28))
                                   . #4#)
                             (EXIT
                              (COND
                               ((SPADCALL |lc| (|spadConstant| $ 7)
                                          (QREFELT $ 26))
                                (PROGN
                                 (LETT #2# |$NoValue| . #4#)
                                 (GO #6=#:G879)))
                               ('T
                                (SEQ (LETT |kk| (+ |kk| 1) . #4#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |kk| 100 (QREFELT $ 108))
                                        (SEQ
                                         (SPADCALL
                                          (SPADCALL |ssl0| (QREFELT $ 110))
                                          (QREFELT $ 113))
                                         (EXIT
                                          (|error|
                                           "Series with many zero terms"))))
                                       ('T
                                        (LETT |ssl|
                                              (SPADCALL |ssl| (QREFELT $ 114))
                                              . #4#)))))))))
                            NIL (GO G190) G191 (EXIT NIL)))
                      #6# (EXIT #2#))
                     (LETT |vkers| (|MRVLIM;var_kers| |lc| $) . #4#)
                     (EXIT
                      (COND
                       ((NULL |vkers|)
                        (PROGN
                         (LETT #1# (CONS 0 (CONS |deg| |lc|)) . #4#)
                         (GO #7=#:G886)))
                       (#5# (|error| "Too many variable kernels"))))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |MRVLIM;mrv_cmp;2KSRU;8|
        ((|x| |Kernel| (|Expression| (|Integer|)))
         (|y| |Kernel| (|Expression| (|Integer|))) (|v| |Symbol|)
         (|state| |Record| (|:| |tan_syms| (|List| (|Symbol|)))
          (|:| |atan_syms| (|List| (|Symbol|)))
          (|:| |tan_kers| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|:| |atan_kers| (|List| (|Kernel| (|Expression| (|Integer|))))))
         ($ |Union|
          (|Record| (|:| |sign| (|Integer|))
                    (|:| |coeff| (|Expression| (|Integer|))))
          "failed"))
        (SPROG
         ((|pp1| (|OrderedCompletion| (|Expression| (|Integer|))))
          (|ppu|
           (|Union| (|OrderedCompletion| (|Expression| (|Integer|))) "failed"))
          (|y1| (|Expression| (|Integer|))) (|x1| (|Expression| (|Integer|))))
         (SEQ
          (LETT |x1|
                (COND
                 ((SPADCALL |x| '|exp| (QREFELT $ 98))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 33)) 1 (QREFELT $ 41)))
                 (#1='T
                  (SPADCALL (SPADCALL |x| (QREFELT $ 23)) (QREFELT $ 62))))
                . #2=(|MRVLIM;mrv_cmp;2KSRU;8|))
          (LETT |y1|
                (COND
                 ((SPADCALL |y| '|exp| (QREFELT $ 98))
                  (SPADCALL (SPADCALL |y| (QREFELT $ 33)) 1 (QREFELT $ 41)))
                 (#1# (SPADCALL (SPADCALL |y| (QREFELT $ 23)) (QREFELT $ 62))))
                . #2#)
          (LETT |ppu|
                (SPADCALL (SPADCALL |x1| |y1| (QREFELT $ 55)) |v| |state|
                          (QREFELT $ 44))
                . #2#)
          (EXIT
           (COND
            ((QEQCAR |ppu| 0)
             (SEQ (LETT |pp1| (QCDR |ppu|) . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |pp1| (|spadConstant| $ 118) (QREFELT $ 119))
                     (CONS 0 (CONS -1 (|spadConstant| $ 7))))
                    ((SPADCALL |pp1| (QREFELT $ 120))
                     (CONS 0 (CONS 0 (SPADCALL |pp1| (QREFELT $ 121)))))
                    (#1# (CONS 0 (CONS 1 (|spadConstant| $ 7))))))))
            (#1# (CONS 1 "failed"))))))) 

(SDEFUN |MRVLIM;mrv_set;ESRU;9|
        ((|e| |Expression| (|Integer|)) (|x| |Symbol|)
         (|state| |Record| (|:| |tan_syms| (|List| (|Symbol|)))
          (|:| |atan_syms| (|List| (|Symbol|)))
          (|:| |tan_kers| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|:| |atan_kers| (|List| (|Kernel| (|Expression| (|Integer|))))))
         ($ |Union|
          (|Record| (|:| |lk| (|List| (|Kernel| (|Expression| (|Integer|)))))
                    (|:| |lc| (|List| (|Expression| (|Integer|)))))
          "failed"))
        (SPROG
         ((|res_c| (|List| (|Expression| (|Integer|))))
          (|res| (|List| #1=(|Kernel| (|Expression| (|Integer|)))))
          (|res_k| #1#) (|c| #2=(|Expression| (|Integer|)))
          (|i| #3=(|Integer|))
          (|ic|
           (|Record| (|:| |sign| (|Integer|))
                     (|:| |coeff| (|Expression| (|Integer|)))))
          (#4=#:G928 NIL)
          (|icu|
           (|Union| (|Record| (|:| |sign| #3#) (|:| |coeff| #2#)) "failed"))
          (#5=#:G929 NIL) (|y| NIL)
          (|kers| (|List| (|Kernel| (|Expression| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |kers| (SPADCALL |e| (QREFELT $ 21))
                  . #6=(|MRVLIM;mrv_set;ESRU;9|))
            (LETT |res_k|
                  (SPADCALL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 45)) (QREFELT $ 46)) 1
                   (QREFELT $ 48))
                  . #6#)
            (LETT |res| (LIST |res_k|) . #6#)
            (LETT |res_c| (LIST (|spadConstant| $ 39)) . #6#)
            (SEQ (LETT |y| NIL . #6#) (LETT #5# |kers| . #6#) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |y| (CAR #5#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |y| '|exp| (QREFELT $ 98))
                     (SEQ
                      (LETT |icu|
                            (SPADCALL |y| |res_k| |x| |state| (QREFELT $ 124))
                            . #6#)
                      (EXIT
                       (COND
                        ((QEQCAR |icu| 1)
                         (PROGN
                          (LETT #4# (CONS 1 "failed") . #6#)
                          (GO #7=#:G927)))
                        ('T
                         (SEQ (LETT |ic| (QCDR |icu|) . #6#)
                              (LETT |i| (QCAR |ic|) . #6#)
                              (LETT |c| (QCDR |ic|) . #6#)
                              (EXIT
                               (COND
                                ((SPADCALL |i| 0 (QREFELT $ 108))
                                 (SEQ (LETT |res_k| |y| . #6#)
                                      (LETT |res| (LIST |y|) . #6#)
                                      (EXIT
                                       (LETT |res_c|
                                             (LIST (|spadConstant| $ 39))
                                             . #6#))))
                                ((EQL |i| 0)
                                 (SEQ (LETT |res| (CONS |y| |res|) . #6#)
                                      (EXIT
                                       (LETT |res_c| (CONS |c| |res_c|)
                                             . #6#))))))))))))
                    ('T (|spadConstant| $ 7)))))
                 (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 (CONS (REVERSE |res|) (REVERSE |res_c|))))))
          #7# (EXIT #4#)))) 

(SDEFUN |MRVLIM;mrv_rewrite1|
        ((|e| |Expression| (|Integer|))
         (|lx| |List| (|Kernel| (|Expression| (|Integer|))))
         (|ly| |List| (|Expression| (|Integer|))) ($ |Expression| (|Integer|)))
        (SPROG
         ((#1=#:G933 NIL) (|x| NIL) (#2=#:G934 NIL) (|y| NIL)
          (|rly| (|List| (|Expression| (|Integer|))))
          (|rlx| (|List| (|Kernel| (|Expression| (|Integer|))))))
         (SEQ (LETT |rlx| (REVERSE |lx|) . #3=(|MRVLIM;mrv_rewrite1|))
              (LETT |rly| (REVERSE |ly|) . #3#)
              (SEQ (LETT |y| NIL . #3#) (LETT #2# |rly| . #3#)
                   (LETT |x| NIL . #3#) (LETT #1# |rlx| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL)
                         (ATOM #2#) (PROGN (LETT |y| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |e|
                           (SPADCALL |e| (LIST |x|) (LIST |y|) (QREFELT $ 35))
                           . #3#)))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |e|)))) 

(SDEFUN |MRVLIM;mrv_rewrite0;ELL2E;11|
        ((|e| |Expression| (|Integer|))
         (|lx| |List| (|Kernel| (|Expression| (|Integer|))))
         (|lc| |List| (|Expression| (|Integer|)))
         (|x00| |Expression| (|Integer|)) ($ |Expression| (|Integer|)))
        (SPROG
         ((|lxx| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|ly| (|List| (|Expression| (|Integer|))))
          (|yi| (|Expression| (|Integer|)))
          (|ei| #1=(|Expression| (|Integer|))) (#2=#:G941 NIL) (|xi| NIL)
          (#3=#:G942 NIL) (|ci| NIL) (|e0| #1#)
          (|c0| (|Expression| (|Integer|))))
         (SEQ
          (LETT |c0| (|SPADfirst| |lc|) . #4=(|MRVLIM;mrv_rewrite0;ELL2E;11|))
          (COND
           ((EQL (LENGTH |lx|) 1)
            (COND
             ((SPADCALL |c0| (|spadConstant| $ 39) (QREFELT $ 29))
              (EXIT |e|)))))
          (LETT |e0|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |x00| (QREFELT $ 46)) 1 (QREFELT $ 48))
                  (QREFELT $ 33))
                 1 (QREFELT $ 41))
                . #4#)
          (LETT |ly| NIL . #4#)
          (SEQ (LETT |ci| NIL . #4#) (LETT #3# (CDR |lc|) . #4#)
               (LETT |xi| NIL . #4#) (LETT #2# (CDR |lx|) . #4#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |xi| (CAR #2#) . #4#) NIL)
                     (ATOM #3#) (PROGN (LETT |ci| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |ei|
                      (SPADCALL (SPADCALL |xi| (QREFELT $ 33)) 1
                                (QREFELT $ 41))
                      . #4#)
                (LETT |yi|
                      (SPADCALL (SPADCALL |x00| |ci| (QREFELT $ 128))
                                (SPADCALL
                                 (SPADCALL |ei|
                                           (SPADCALL |ci| |e0| (QREFELT $ 61))
                                           (QREFELT $ 57))
                                 (QREFELT $ 60))
                                (QREFELT $ 61))
                      . #4#)
                (EXIT (LETT |ly| (CONS |yi| |ly|) . #4#)))
               (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#)) . #4#)
               (GO G190) G191 (EXIT NIL))
          (LETT |ly| (REVERSE |ly|) . #4#)
          (COND
           ((SPADCALL |c0| (|spadConstant| $ 39) (QREFELT $ 29))
            (LETT |lxx| (CDR |lx|) . #4#))
           ('T
            (SEQ
             (LETT |ly| (CONS (SPADCALL |x00| |c0| (QREFELT $ 128)) |ly|)
                   . #4#)
             (EXIT (LETT |lxx| |lx| . #4#)))))
          (EXIT (|MRVLIM;mrv_rewrite1| |e| |lxx| |ly| $))))) 

(SDEFUN |MRVLIM;mrv_rewrite;ELLSRU;12|
        ((|e| |Expression| (|Integer|))
         (|lx| |List| (|Kernel| (|Expression| (|Integer|))))
         (|lc| |List| (|Expression| (|Integer|))) (|v| |Symbol|)
         (|state| |Record| (|:| |tan_syms| (|List| (|Symbol|)))
          (|:| |atan_syms| (|List| (|Symbol|)))
          (|:| |tan_kers| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|:| |atan_kers| (|List| (|Kernel| (|Expression| (|Integer|))))))
         ($ |Union|
          (|Record| (|:| |degree| (|OrderedExpression|))
                    (|:| |coeff| (|Expression| (|Integer|))))
          "failed"))
        (SPROG
         ((|lxx| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|x00| (|Expression| (|Integer|)))
          (|lcc| (|List| (|Expression| (|Integer|)))) (#1=#:G965 NIL)
          (|ci| NIL) (#2=#:G964 NIL) (|ss| (|Integer|))
          (|lipp| (|OrderedCompletion| (|Expression| (|Integer|))))
          (|lip|
           (|Union| (|OrderedCompletion| (|Expression| (|Integer|))) "failed"))
          (|e0| (|Expression| (|Integer|))) (#3=#:G963 NIL) (|ei| NIL)
          (#4=#:G962 NIL) (|x0| (|Kernel| (|Expression| (|Integer|)))))
         (SEQ
          (LETT |x0| (|SPADfirst| |lx|) . #5=(|MRVLIM;mrv_rewrite;ELLSRU;12|))
          (EXIT
           (COND
            ((SPADCALL |x0| |v| (QREFELT $ 98))
             (SEQ
              (LETT |lxx|
                    (PROGN
                     (LETT #4# NIL . #5#)
                     (SEQ (LETT |ei| NIL . #5#) (LETT #3# |lx| . #5#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |ei| (CAR #3#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |ei| (QREFELT $ 23))
                                               (LIST |x0|)
                                               (LIST
                                                (SPADCALL
                                                 (SPADCALL |v| (QREFELT $ 45))
                                                 (QREFELT $ 60)))
                                               (QREFELT $ 35))
                                     (QREFELT $ 46))
                                    1 (QREFELT $ 48))
                                   #4#)
                                  . #5#)))
                          (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #5#)
              (EXIT
               (SPADCALL
                (SPADCALL |e| (LIST |x0|)
                          (LIST
                           (SPADCALL (SPADCALL |v| (QREFELT $ 45))
                                     (QREFELT $ 60)))
                          (QREFELT $ 35))
                |lxx| |lc| |v| |state| (QREFELT $ 130)))))
            ((NOT (SPADCALL |x0| '|exp| (QREFELT $ 98)))
             (|error| "mrv is not exp, need substitution"))
            (#6='T
             (SEQ
              (LETT |e0|
                    (SPADCALL (SPADCALL |x0| (QREFELT $ 33)) 1 (QREFELT $ 41))
                    . #5#)
              (LETT |lip|
                    (COND
                     ((SPADCALL |e0| (SPADCALL |v| (QREFELT $ 45))
                                (QREFELT $ 29))
                      (CONS 0 (SPADCALL (QREFELT $ 131))))
                     (#6# (SPADCALL |e0| |v| |state| (QREFELT $ 44))))
                    . #5#)
              (EXIT
               (COND
                ((QEQCAR |lip| 0)
                 (SEQ (LETT |lipp| (QCDR |lip|) . #5#)
                      (LETT |ss| (SPADCALL |lipp| (QREFELT $ 52)) . #5#)
                      (EXIT
                       (COND ((EQL |ss| 0) (|error| "Wrong mrv element"))
                             (#6#
                              (SEQ
                               (COND
                                ((SPADCALL |ss| 0 (QREFELT $ 108))
                                 (SEQ
                                  (LETT |lcc|
                                        (CONS (|spadConstant| $ 39)
                                              (PROGN
                                               (LETT #2# NIL . #5#)
                                               (SEQ (LETT |ci| NIL . #5#)
                                                    (LETT #1# |lc| . #5#) G190
                                                    (COND
                                                     ((OR (ATOM #1#)
                                                          (PROGN
                                                           (LETT |ci| (CAR #1#)
                                                                 . #5#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #2#
                                                            (CONS
                                                             (SPADCALL |ci|
                                                                       (QREFELT
                                                                        $ 58))
                                                             #2#)
                                                            . #5#)))
                                                    (LETT #1# (CDR #1#) . #5#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #2#)))))
                                        . #5#)
                                  (LETT |x00|
                                        (SPADCALL
                                         (SPADCALL |e0| (QREFELT $ 58))
                                         (QREFELT $ 60))
                                        . #5#)
                                  (EXIT
                                   (LETT |lxx|
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL |x00| (QREFELT $ 46)) 1
                                           (QREFELT $ 48))
                                          |lx|)
                                         . #5#))))
                                (#6#
                                 (SEQ (LETT |lcc| |lc| . #5#)
                                      (LETT |x00|
                                            (SPADCALL |x0| (QREFELT $ 23))
                                            . #5#)
                                      (EXIT (LETT |lxx| |lx| . #5#)))))
                               (LETT |e|
                                     (SPADCALL |e| |lxx| |lcc| |x00|
                                               (QREFELT $ 129))
                                     . #5#)
                               (EXIT
                                (SPADCALL |e|
                                          (SPADCALL
                                           (SPADCALL |x00| (QREFELT $ 46)) 1
                                           (QREFELT $ 48))
                                          |state| (QREFELT $ 117)))))))))
                (#6# (|error| "limit failed"))))))))))) 

(SDEFUN |MRVLIM;mrv_sign;ESRU;13|
        ((|e| |Expression| (|Integer|)) (|v| |Symbol|)
         (|state| |Record| (|:| |tan_syms| (|List| (|Symbol|)))
          (|:| |atan_syms| (|List| (|Symbol|)))
          (|:| |tan_kers| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|:| |atan_kers| (|List| (|Kernel| (|Expression| (|Integer|))))))
         ($ |Union| (|Integer|) "failed"))
        (SPROG
         ((|ss|
           (|Record| (|:| |degree| (|OrderedExpression|))
                     (|:| |coeff| (|Expression| (|Integer|)))))
          (|ssu|
           (|Union|
            (|Record| (|:| |degree| (|OrderedExpression|))
                      (|:| |coeff| (|Expression| (|Integer|))))
            "failed"))
          (|lcc| #1=(|List| (|Expression| (|Integer|))))
          (|lx| #2=(|List| (|Kernel| (|Expression| (|Integer|)))))
          (|rkc|
           (|Record| (|:| |lk| (|List| (|Kernel| (|Expression| (|Integer|)))))
                     (|:| |lc| (|List| (|Expression| (|Integer|))))))
          (|rkcu| (|Union| (|Record| (|:| |lk| #2#) (|:| |lc| #1#)) "failed")))
         (SEQ
          (COND
           ((NOT (SPADCALL |v| (SPADCALL |e| (QREFELT $ 87)) (QREFELT $ 132)))
            (SPADCALL |e| (QREFELT $ 82)))
           (#3='T
            (SEQ
             (LETT |rkcu| (SPADCALL |e| |v| |state| (QREFELT $ 127))
                   . #4=(|MRVLIM;mrv_sign;ESRU;13|))
             (EXIT
              (COND ((QEQCAR |rkcu| 1) (CONS 1 "failed"))
                    (#3#
                     (SEQ (LETT |rkc| (QCDR |rkcu|) . #4#)
                          (LETT |lx| (QCAR |rkc|) . #4#)
                          (LETT |lcc| (QCDR |rkc|) . #4#)
                          (LETT |ssu|
                                (SPADCALL |e| |lx| |lcc| |v| |state|
                                          (QREFELT $ 130))
                                . #4#)
                          (EXIT
                           (COND ((QEQCAR |ssu| 1) (CONS 1 "failed"))
                                 (#3#
                                  (SEQ (LETT |ss| (QCDR |ssu|) . #4#)
                                       (EXIT
                                        (SPADCALL (QCDR |ss|) |v| |state|
                                                  (QREFELT $
                                                           133))))))))))))))))) 

(SDEFUN |MRVLIM;mrv_limit;ESRU;14|
        ((|e| |Expression| (|Integer|)) (|v| |Symbol|)
         (|state| |Record| (|:| |tan_syms| (|List| (|Symbol|)))
          (|:| |atan_syms| (|List| (|Symbol|)))
          (|:| |tan_kers| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|:| |atan_kers| (|List| (|Kernel| (|Expression| (|Integer|))))))
         ($ |Union| (|OrderedCompletion| (|Expression| (|Integer|))) "failed"))
        (SPROG
         ((|s| (|Integer|)) (|su| (|Union| (|Integer|) "failed"))
          (|deg| (|OrderedExpression|))
          (|ss|
           (|Record| (|:| |degree| (|OrderedExpression|))
                     (|:| |coeff| (|Expression| (|Integer|)))))
          (|ssu|
           (|Union|
            (|Record| (|:| |degree| (|OrderedExpression|))
                      (|:| |coeff| (|Expression| (|Integer|))))
            "failed"))
          (|lcc| #1=(|List| (|Expression| (|Integer|))))
          (|lx| #2=(|List| (|Kernel| (|Expression| (|Integer|)))))
          (|rkc|
           (|Record| (|:| |lk| (|List| (|Kernel| (|Expression| (|Integer|)))))
                     (|:| |lc| (|List| (|Expression| (|Integer|))))))
          (|rkcu| (|Union| (|Record| (|:| |lk| #2#) (|:| |lc| #1#)) "failed"))
          (|ve| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((NOT
             (SPADCALL |v|
                       (LETT |ve| (SPADCALL |e| (QREFELT $ 87))
                             . #3=(|MRVLIM;mrv_limit;ESRU;14|))
                       (QREFELT $ 132)))
            (SEQ
             (COND
              ((NULL (SPADCALL |ve| (QVELT |state| 0) (QREFELT $ 88)))
               (COND
                ((NULL (SPADCALL |ve| (QVELT |state| 1) (QREFELT $ 88)))
                 (EXIT (CONS 0 (SPADCALL |e| (QREFELT $ 134))))))))
             (EXIT (CONS 1 "failed"))))
           (#4='T
            (SEQ (LETT |rkcu| (SPADCALL |e| |v| |state| (QREFELT $ 127)) . #3#)
                 (EXIT
                  (COND ((QEQCAR |rkcu| 1) (CONS 1 "failed"))
                        (#4#
                         (SEQ (LETT |rkc| (QCDR |rkcu|) . #3#)
                              (LETT |lx| (QCAR |rkc|) . #3#)
                              (LETT |lcc| (QCDR |rkc|) . #3#)
                              (LETT |ssu|
                                    (SPADCALL |e| |lx| |lcc| |v| |state|
                                              (QREFELT $ 130))
                                    . #3#)
                              (EXIT
                               (COND ((QEQCAR |ssu| 1) (CONS 1 "failed"))
                                     (#4#
                                      (SEQ (LETT |ss| (QCDR |ssu|) . #3#)
                                           (LETT |deg| (QCAR |ss|) . #3#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |deg|
                                                        (|spadConstant| $ 135)
                                                        (QREFELT $ 136))
                                              (CONS 0 (|spadConstant| $ 118)))
                                             ((SPADCALL |deg|
                                                        (|spadConstant| $ 135)
                                                        (QREFELT $ 137))
                                              (SPADCALL (QCDR |ss|) |v| |state|
                                                        (QREFELT $ 44)))
                                             ((SPADCALL |deg|
                                                        (|spadConstant| $ 135)
                                                        (QREFELT $ 138))
                                              (SEQ
                                               (LETT |su|
                                                     (SPADCALL (QCDR |ss|) |v|
                                                               |state|
                                                               (QREFELT $ 133))
                                                     . #3#)
                                               (EXIT
                                                (COND
                                                 ((QEQCAR |su| 1)
                                                  (CONS 1 "failed"))
                                                 (#4#
                                                  (SEQ
                                                   (LETT |s| (QCDR |su|) . #3#)
                                                   (EXIT
                                                    (COND
                                                     ((EQL |s| 1)
                                                      (CONS 0
                                                            (SPADCALL
                                                             (QREFELT $ 131))))
                                                     ((EQL |s| -1)
                                                      (CONS 0
                                                            (SPADCALL
                                                             (QREFELT $ 139))))
                                                     (#4#
                                                      (|error|
                                                       "Nonzero term has no sign")))))))))))))))))))))))))) 

(SDEFUN |MRVLIM;mrv_limit1;ESU;15|
        ((|e| |Expression| (|Integer|)) (|x| |Symbol|)
         ($ |Union| (|OrderedCompletion| (|Expression| (|Integer|))) "failed"))
        (SPROG
         ((|state|
           (|Record| (|:| |tan_syms| (|List| (|Symbol|)))
                     (|:| |atan_syms| (|List| (|Symbol|)))
                     (|:| |tan_kers|
                          (|List| (|Kernel| (|Expression| (|Integer|)))))
                     (|:| |atan_kers|
                          (|List| (|Kernel| (|Expression| (|Integer|))))))))
         (SEQ
          (LETT |state| (VECTOR NIL NIL NIL NIL)
                . #1=(|MRVLIM;mrv_limit1;ESU;15|))
          (LETT |e| (SPADCALL |e| |x| |state| (QREFELT $ 65)) . #1#)
          (EXIT (SPADCALL |e| |x| |state| (QREFELT $ 44)))))) 

(SDEFUN |MRVLIM;mrv_limit;EEU;16|
        ((|e| |Expression| (|Integer|))
         (|eq| |Equation| (|OrderedCompletion| (|Expression| (|Integer|))))
         ($ |Union| (|OrderedCompletion| (|Expression| (|Integer|)))
          (|Record|
           (|:| |leftHandLimit|
                (|Union| (|OrderedCompletion| (|Expression| (|Integer|)))
                         #1="failed"))
           (|:| |rightHandLimit|
                (|Union| (|OrderedCompletion| (|Expression| (|Integer|)))
                         #1#)))
          "failed"))
        (SPROG
         ((|lr|
           #2=(|Union| (|OrderedCompletion| (|Expression| (|Integer|))) #1#))
          (|et| (|Expression| (|Integer|))) (|ll| #2#)
          (|vK| (|Kernel| (|Expression| (|Integer|)))) (|resu| #2#)
          (|ii| (|SingleInteger|))
          (|a| (|OrderedCompletion| (|Expression| (|Integer|))))
          (|v| (|Symbol|)) (|var| (|Union| (|Symbol|) "failed"))
          (|f| (|Union| (|Expression| (|Integer|)) "failed")))
         (SEQ
          (LETT |f| (SPADCALL (SPADCALL |eq| (QREFELT $ 142)) (QREFELT $ 144))
                . #3=(|MRVLIM;mrv_limit;EEU;16|))
          (EXIT
           (COND
            ((QEQCAR |f| 1)
             (|error| "limit:left hand side must be a variable"))
            (#4='T
             (SEQ (LETT |var| (SPADCALL (QCDR |f|) (QREFELT $ 146)) . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |var| 1)
                     (|error| "limit:left hand side must be a variable"))
                    (#4#
                     (SEQ (LETT |v| (QCDR |var|) . #3#)
                          (LETT |a| (SPADCALL |eq| (QREFELT $ 147)) . #3#)
                          (LETT |ii| (SPADCALL |a| (QREFELT $ 52)) . #3#)
                          (EXIT
                           (COND
                            ((|eql_SI| |ii| 1)
                             (SEQ
                              (LETT |resu| (SPADCALL |e| |v| (QREFELT $ 140))
                                    . #3#)
                              (EXIT
                               (COND ((QEQCAR |resu| 1) (CONS 2 "failed"))
                                     (#4# (CONS 0 (QCDR |resu|)))))))
                            ((|eql_SI| |ii| -1)
                             (SEQ
                              (LETT |vK|
                                    (SPADCALL (SPADCALL |v| (QREFELT $ 45))
                                              (QREFELT $ 148))
                                    . #3#)
                              (LETT |et|
                                    (SPADCALL |e| |vK|
                                              (SPADCALL
                                               (SPADCALL |vK| (QREFELT $ 23))
                                               (QREFELT $ 58))
                                              (QREFELT $ 85))
                                    . #3#)
                              (LETT |resu| (SPADCALL |et| |v| (QREFELT $ 140))
                                    . #3#)
                              (EXIT
                               (COND ((QEQCAR |resu| 1) (CONS 2 "failed"))
                                     (#4# (CONS 0 (QCDR |resu|)))))))
                            ((|eql_SI| |ii| 0)
                             (SEQ
                              (LETT |vK|
                                    (SPADCALL (SPADCALL |v| (QREFELT $ 45))
                                              (QREFELT $ 148))
                                    . #3#)
                              (LETT |et|
                                    (SPADCALL |e| |vK|
                                              (SPADCALL
                                               (SPADCALL |a| (QREFELT $ 121))
                                               (SPADCALL
                                                (SPADCALL |vK| (QREFELT $ 23))
                                                (QREFELT $ 149))
                                               (QREFELT $ 57))
                                              (QREFELT $ 85))
                                    . #3#)
                              (LETT |ll| (SPADCALL |et| |v| (QREFELT $ 140))
                                    . #3#)
                              (LETT |et|
                                    (SPADCALL |e| |vK|
                                              (SPADCALL
                                               (SPADCALL |a| (QREFELT $ 121))
                                               (SPADCALL
                                                (SPADCALL |vK| (QREFELT $ 23))
                                                (QREFELT $ 149))
                                               (QREFELT $ 150))
                                              (QREFELT $ 85))
                                    . #3#)
                              (LETT |lr| (SPADCALL |et| |v| (QREFELT $ 140))
                                    . #3#)
                              (EXIT
                               (COND
                                ((SPADCALL |ll| |lr| (QREFELT $ 151))
                                 (COND ((QEQCAR |lr| 1) (CONS 2 "failed"))
                                       (#4# (CONS 0 (QCDR |lr|)))))
                                (#4# (CONS 1 (CONS |ll| |lr|)))))))))))))))))))) 

(SDEFUN |MRVLIM;mrv_limit;EESU;17|
        ((|e| |Expression| (|Integer|))
         (|eq| |Equation| (|Expression| (|Integer|))) (|s| |String|)
         ($ |Union| (|OrderedCompletion| (|Expression| (|Integer|))) "failed"))
        (SPROG
         ((#1=#:G1054 NIL) (|et| (|Expression| (|Integer|)))
          (|vK| (|Kernel| (|Expression| (|Integer|))))
          (|a| (|Expression| (|Integer|))) (|v| (|Symbol|))
          (|f| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |f| (SPADCALL (SPADCALL |eq| (QREFELT $ 156)) (QREFELT $ 146))
                . #2=(|MRVLIM;mrv_limit;EESU;17|))
          (EXIT
           (COND
            ((QEQCAR |f| 1)
             (|error| "limit:left hand side must be a variable"))
            (#3='T
             (SEQ (LETT |v| (QCDR |f|) . #2#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 157)) . #2#)
                  (EXIT
                   (COND
                    ((EQL (SPADCALL |s| (QREFELT $ 160)) 1)
                     (SEQ
                      (LETT |vK|
                            (SPADCALL (SPADCALL |v| (QREFELT $ 45))
                                      (QREFELT $ 148))
                            . #2#)
                      (LETT |et|
                            (SPADCALL |e| |vK|
                                      (SPADCALL |a|
                                                (SPADCALL
                                                 (SPADCALL |vK| (QREFELT $ 23))
                                                 (QREFELT $ 149))
                                                (QREFELT $ 150))
                                      (QREFELT $ 85))
                            . #2#)
                      (EXIT (SPADCALL |et| |v| (QREFELT $ 140)))))
                    (#3#
                     (SEQ
                      (EXIT
                       (COND
                        ((EQL (SPADCALL |s| (QREFELT $ 160)) -1)
                         (PROGN
                          (LETT #1#
                                (SEQ
                                 (LETT |vK|
                                       (SPADCALL (SPADCALL |v| (QREFELT $ 45))
                                                 (QREFELT $ 148))
                                       . #2#)
                                 (LETT |et|
                                       (SPADCALL |e| |vK|
                                                 (SPADCALL |a|
                                                           (SPADCALL
                                                            (SPADCALL |vK|
                                                                      (QREFELT
                                                                       $ 23))
                                                            (QREFELT $ 149))
                                                           (QREFELT $ 57))
                                                 (QREFELT $ 85))
                                       . #2#)
                                 (EXIT (SPADCALL |et| |v| (QREFELT $ 140))))
                                . #2#)
                          (GO #4=#:G1050)))))
                      #4# (EXIT #1#)))))))))))) 

(DECLAIM (NOTINLINE |MrvLimitPackage;|)) 

(DEFUN |MrvLimitPackage| ()
  (SPROG NIL
         (PROG (#1=#:G1056)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|MrvLimitPackage|)
                    . #2=(|MrvLimitPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|MrvLimitPackage|
                             (LIST (CONS NIL (CONS 1 (|MrvLimitPackage;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|MrvLimitPackage|)))))))))) 

(DEFUN |MrvLimitPackage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|MrvLimitPackage|) . #1=(|MrvLimitPackage|))
          (LETT $ (GETREFV 162) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|MrvLimitPackage| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (|spadConstant| $ 7))
          (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
          (QSETREFV $ 16
                    (SPADCALL (SPADCALL '|%logGamma| (QREFELT $ 14))
                              (QREFELT $ 15)))
          (QSETREFV $ 17
                    (SPADCALL (SPADCALL '|%eis| (QREFELT $ 14))
                              (QREFELT $ 15)))
          (QSETREFV $ 18
                    (SPADCALL (SPADCALL '|%erfs| (QREFELT $ 14))
                              (QREFELT $ 15)))
          (QSETREFV $ 19
                    (SPADCALL (SPADCALL '|%erfis| (QREFELT $ 14))
                              (QREFELT $ 15)))
          (QSETREFV $ 66
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                              (QREFELT $ 11) (QREFELT $ 8)))
          (QSETREFV $ 67
                    (|GeneralizedUnivariatePowerSeries|
                     (|Expression| (|Integer|)) (|OrderedExpression|)
                     (QREFELT $ 11) (QREFELT $ 8)))
          (QSETREFV $ 70
                    (|FunctionSpaceToUnivariatePowerSeries2| (|Integer|)
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|OrderedExpression|)
                                                             (QREFELT $ 67)
                                                             (|ElementaryFunctionsGeneralizedUnivariatePowerSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|OrderedExpression|)
                                                              (QREFELT $ 67))
                                                             (QREFELT $ 66)
                                                             (|TaylorSeriesExpansionGeneralized|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|OrderedExpression|)
                                                              (QREFELT $ 67)
                                                              (QREFELT $ 66))
                                                             (ELT $ 69)
                                                             (QREFELT $ 11)))
          $))) 

(MAKEPROP '|MrvLimitPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Expression| 40) (0 . |Zero|) '|zeroFE|
              (|Symbol|) (4 . |new|) '|series_x| (|BasicOperator|)
              (|CommonOperators|) (8 . |operator|) (13 . |operator|)
              '|op_log_gamma| '|op_eis| '|op_erfs| '|op_erfis| (|List| 22)
              (18 . |tower|) (|Kernel| $) (23 . |coerce|)
              (28 . |differentiate|) (|Boolean|) (34 . ~=)
              (|ElementaryFunctionStructurePackage| 40 6) (40 . |normalize|)
              (45 . =) (|Kernel| 6) (51 . |operator|) (|List| 6)
              (56 . |argument|) (|List| $) (61 . |eval|) (68 . ~=) (74 . |elt|)
              (80 . |name|) (85 . |One|) (|Integer|) (89 . |elt|)
              (|Union| 51 '"failed")
              (|Record| (|:| |tan_syms| 86) (|:| |atan_syms| 86)
                        (|:| |tan_kers| 47) (|:| |atan_kers| 47))
              |MRVLIM;mrv_limit;ESRU;14| (95 . |coerce|) (100 . |kernels|)
              (|List| 30) (105 . |elt|) (111 . |setelt!|) (|SingleInteger|)
              (|OrderedCompletion| 6) (118 . |whatInfinity|) (123 . |pi|)
              (127 . |coerce|) (132 . /) (138 . |atan|) (143 . -) (149 . -)
              (154 . |kernel|) (160 . |exp|) (165 . *) (171 . |log|)
              (|PositiveInteger|) (176 . ^) |MRVLIM;mrv_normalize;ESRE;2|
              '|Uts| '|Upg| (|OrderedExpression|) (182 . |coerce|) '|ppack|
              (|SparseMultivariatePolynomial| 40 22) (187 . |numer|)
              (192 . |denom|) (197 . |member?|) (|NonNegativeInteger|)
              (|SparseMultivariatePolynomial| 40 30) (203 . |degree|) (209 . >)
              (215 . |coerce|) (|Union| 40 '"failed")
              (|ElementaryFunctionSign| 40 6) (220 . |sign|) (225 . |Zero|)
              (229 . ~=) (235 . |eval|) (|List| 9) (242 . |variables|)
              (247 . |setIntersection|) (253 . |setIntersection|)
              (259 . |concat|) (265 . |empty?|) (270 . |#|) (275 . |One|)
              (279 . ~=) (285 . |first|) (290 . <) (296 . |Zero|) (300 . |is?|)
              (|Record| (|:| |func| 158) (|:| |prob| 158))
              (|Union| (|:| |%series| 67) (|:| |%problem| 99))
              (|Union| '"complex" '"real: two sides" '"real: left side"
                       '"real: right side" '"just do it")
              (|Mapping| 25 6) (306 . |exprToPS|) (318 . |order|)
              (323 . |removeZeros|) (329 . |leadingCoefficient|) (334 . |One|)
              (338 . >) (|OutputForm|) (344 . |coerce|) (|Void|)
              (|PrintPackage|) (349 . |print|) (354 . |reductum|)
              (|Record| (|:| |degree| 68) (|:| |coeff| 6))
              (|Union| 115 '"failed") |MRVLIM;expr_to_series;EKRU;7|
              (359 . |Zero|) (363 . =) (369 . |finite?|) (374 . |retract|)
              (|Record| (|:| |sign| 40) (|:| |coeff| 6))
              (|Union| 122 '"failed") |MRVLIM;mrv_cmp;2KSRU;8|
              (|Record| (|:| |lk| 47) (|:| |lc| 32)) (|Union| 125 '"failed")
              |MRVLIM;mrv_set;ESRU;9| (379 . ^) |MRVLIM;mrv_rewrite0;ELL2E;11|
              |MRVLIM;mrv_rewrite;ELLSRU;12| (385 . |plusInfinity|)
              (389 . |member?|) |MRVLIM;mrv_sign;ESRU;13| (395 . |coerce|)
              (400 . |Zero|) (404 . >) (410 . =) (416 . <)
              (422 . |minusInfinity|) |MRVLIM;mrv_limit1;ESU;15|
              (|Equation| 51) (426 . |lhs|) (|Union| 6 '"failed")
              (431 . |retractIfCan|) (|Union| 9 '"failed")
              (436 . |retractIfCan|) (441 . |rhs|) (446 . |retract|)
              (451 . |inv|) (456 . +) (462 . =)
              (|Record| (|:| |leftHandLimit| 42) (|:| |rightHandLimit| 42))
              (|Union| 51 152 '"failed") |MRVLIM;mrv_limit;EEU;16|
              (|Equation| 6) (468 . |lhs|) (473 . |rhs|) (|String|)
              (|ToolsForSign| 40) (478 . |direction|)
              |MRVLIM;mrv_limit;EESU;17|)
           '#(|mrv_sign| 483 |mrv_set| 490 |mrv_rewrite0| 497 |mrv_rewrite| 505
              |mrv_normalize| 514 |mrv_limit1| 521 |mrv_limit| 527 |mrv_cmp|
              547 |expr_to_series| 555)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 161
                                                 '(0 6 0 7 0 9 0 10 1 13 12 9
                                                   14 1 6 12 12 15 1 6 20 0 21
                                                   1 6 0 22 23 2 6 0 0 9 24 2 6
                                                   25 0 0 26 1 27 6 6 28 2 6 25
                                                   0 0 29 1 30 12 0 31 1 30 32
                                                   0 33 3 6 0 0 20 34 35 2 32
                                                   25 0 0 36 2 6 0 12 34 37 1
                                                   12 9 0 38 0 6 0 39 2 32 6 0
                                                   40 41 1 6 0 9 45 1 6 20 0 46
                                                   2 47 30 0 40 48 3 32 6 0 40
                                                   6 49 1 51 50 0 52 0 6 0 53 1
                                                   6 0 40 54 2 6 0 0 0 55 1 6 0
                                                   0 56 2 6 0 0 0 57 1 6 0 0 58
                                                   2 6 0 12 0 59 1 6 0 0 60 2 6
                                                   0 0 0 61 1 6 0 0 62 2 6 0 0
                                                   63 64 1 68 6 0 69 1 6 71 0
                                                   72 1 6 71 0 73 2 47 25 30 0
                                                   74 2 76 75 0 30 77 2 75 25 0
                                                   0 78 1 6 0 71 79 1 81 80 6
                                                   82 0 66 0 83 2 40 25 0 0 84
                                                   3 6 0 0 22 0 85 1 6 86 0 87
                                                   2 86 0 0 0 88 2 47 0 0 0 89
                                                   2 86 0 0 0 90 1 86 25 0 91 1
                                                   47 75 0 92 0 75 0 93 2 75 25
                                                   0 0 94 1 47 30 0 95 2 75 25
                                                   0 0 96 0 75 0 97 2 30 25 0 9
                                                   98 8 70 100 6 25 101 25 6
                                                   102 102 102 103 1 67 68 0
                                                   104 2 67 0 0 68 105 1 67 6 0
                                                   106 0 66 0 107 2 40 25 0 0
                                                   108 1 67 109 0 110 1 112 111
                                                   109 113 1 67 0 0 114 0 51 0
                                                   118 2 51 25 0 0 119 1 51 25
                                                   0 120 1 51 6 0 121 2 6 0 0 0
                                                   128 0 51 0 131 2 86 25 9 0
                                                   132 1 51 0 6 134 0 68 0 135
                                                   2 68 25 0 0 136 2 68 25 0 0
                                                   137 2 68 25 0 0 138 0 51 0
                                                   139 1 141 51 0 142 1 51 143
                                                   0 144 1 6 145 0 146 1 141 51
                                                   0 147 1 6 22 0 148 1 6 0 0
                                                   149 2 6 0 0 0 150 2 42 25 0
                                                   0 151 1 155 6 0 156 1 155 6
                                                   0 157 1 159 40 158 160 3 0
                                                   80 6 9 43 133 3 0 126 6 9 43
                                                   127 4 0 6 6 47 32 6 129 5 0
                                                   116 6 47 32 9 43 130 3 0 6 6
                                                   9 43 65 2 0 42 6 9 140 3 0
                                                   42 6 155 158 161 2 0 153 6
                                                   141 154 3 0 42 6 9 43 44 4 0
                                                   123 30 30 9 43 124 3 0 116 6
                                                   30 43 117)))))
           '|lookupComplete|)) 

(MAKEPROP '|MrvLimitPackage| 'NILADIC T) 
