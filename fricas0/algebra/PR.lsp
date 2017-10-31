
(SDEFUN |PR;One;$;1| (($ $))
        (LIST (CONS (|spadConstant| $ 10) (|spadConstant| $ 11)))) 

(SDEFUN |PR;characteristic;Nni;2| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 14))) 

(SDEFUN |PR;degree;$E;3| ((|p| $) ($ E))
        (COND ((NULL |p|) (|spadConstant| $ 10)) ('T (QCAR (|SPADfirst| |p|))))) 

(SDEFUN |PR;minimumDegree;$E;4| ((|p| $) ($ E))
        (COND ((NULL |p|) (|spadConstant| $ 10))
              ('T (QCAR (SPADCALL |p| (QREFELT $ 18)))))) 

(SDEFUN |PR;leadingCoefficient;$R;5| ((|p| $) ($ R))
        (COND ((NULL |p|) (|spadConstant| $ 20)) ('T (QCDR (|SPADfirst| |p|))))) 

(SDEFUN |PR;leadingMonomial;2$;6| ((|p| $) ($ $))
        (COND ((NULL |p|) (|spadConstant| $ 22)) ('T (LIST (|SPADfirst| |p|))))) 

(SDEFUN |PR;reductum;2$;7| ((|p| $) ($ $))
        (COND ((NULL |p|) |p|) ('T (CDR |p|)))) 

(SDEFUN |PR;retractIfCan;$U;8| ((|p| $) ($ |Union| R "failed"))
        (COND ((NULL |p|) (CONS 0 (|spadConstant| $ 20)))
              ((NULL (NULL (CDR |p|))) (CONS 1 "failed"))
              ('T
               (COND
                ((SPADCALL (QCAR (|SPADfirst| |p|)) (QREFELT $ 26))
                 (CONS 0 (QCDR (|SPADfirst| |p|))))
                ('T (CONS 1 "failed")))))) 

(SDEFUN |PR;coefficient;$ER;9| ((|p| $) (|e| E) ($ R))
        (SPROG
         ((#1=#:G785 NIL) (#2=#:G786 NIL) (#3=#:G788 NIL) (|tm| NIL)
          (|ks| (|SingleInteger|)) (#4=#:G787 NIL) (|tms| NIL)
          (|es| (|SingleInteger|))
          (|ps| (|List| (|Record| (|:| |k| (|SingleInteger|)) (|:| |c| R))))
          (|degp| (|Integer|)))
         (SEQ
          (EXIT
           (COND ((NULL |p|) (|spadConstant| $ 20))
                 (#5='T
                  (SEQ
                   (LETT |degp| (QCAR (|SPADfirst| |p|))
                         . #6=(|PR;coefficient;$ER;9|))
                   (EXIT
                    (COND
                     ((< |degp| MOST-POSITIVE-FIXNUM)
                      (COND
                       ((NULL (< |e| MOST-POSITIVE-FIXNUM))
                        (|spadConstant| $ 20))
                       ('T
                        (SEQ (LETT |ps| |p| . #6#) (LETT |es| |e| . #6#)
                             (SEQ (LETT |tms| NIL . #6#) (LETT #4# |ps| . #6#)
                                  G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN
                                         (LETT |tms| (CAR #4#) . #6#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ (LETT |ks| (QCAR |tms|) . #6#)
                                       (EXIT
                                        (COND
                                         ((|eql_SI| |ks| |es|)
                                          (PROGN
                                           (LETT #2# (QCDR |tms|) . #6#)
                                           (GO #7=#:G784)))
                                         ((|less_SI| |ks| |es|)
                                          (PROGN
                                           (LETT #2# (|spadConstant| $ 20)
                                                 . #6#)
                                           (GO #7#))))))
                                  (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT
                              (PROGN
                               (LETT #2# (|spadConstant| $ 20) . #6#)
                               (GO #7#)))))))
                     (#5#
                      (SEQ
                       (SEQ (LETT |tm| NIL . #6#) (LETT #3# |p| . #6#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |tm| (CAR #3#) . #6#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((EQL (QCAR |tm|) |e|)
                                (PROGN (LETT #2# (QCDR |tm|) . #6#) (GO #7#)))
                               ('T
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((< (QCAR |tm|) |e|)
                                    (PROGN
                                     (LETT #1#
                                           (PROGN
                                            (LETT #2# (|spadConstant| $ 20)
                                                  . #6#)
                                            (GO #7#))
                                           . #6#)
                                     (GO #8=#:G779)))))
                                 #8# (EXIT #1#))))))
                            (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (|spadConstant| $ 20))))))))))
          #7# (EXIT #2#)))) 

(SDEFUN |PR;coefficient;$ER;10| ((|p| $) (|e| E) ($ R))
        (SPROG ((#1=#:G795 NIL) (#2=#:G796 NIL) (#3=#:G797 NIL) (|tm| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |tm| NIL . #4=(|PR;coefficient;$ER;10|))
                       (LETT #3# |p| . #4#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |tm| (CAR #3#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QCAR |tm|) |e| (QREFELT $ 30))
                           (PROGN (LETT #2# (QCDR |tm|) . #4#) (GO #5=#:G794)))
                          ('T
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (QCAR |tm|) |e| (QREFELT $ 31))
                               (PROGN
                                (LETT #1#
                                      (PROGN
                                       (LETT #2# (|spadConstant| $ 20) . #4#)
                                       (GO #5#))
                                      . #4#)
                                (GO #6=#:G790)))))
                            #6# (EXIT #1#))))))
                       (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT (|spadConstant| $ 20))))
                #5# (EXIT #2#)))) 

(SDEFUN |PR;recip;$U;11| ((|p| $) ($ |Union| $ #1="failed"))
        (SPROG ((|u| (|Union| R #1#)))
               (SEQ
                (COND
                 ((OR (NULL |p|)
                      (SPADCALL (QCAR (|SPADfirst| |p|)) (|spadConstant| $ 10)
                                (QREFELT $ 32)))
                  (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |u| (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 34))
                         |PR;recip;$U;11|)
                   (EXIT
                    (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                          ('T
                           (CONS 0
                                 (SPADCALL (QCDR |u|) (QREFELT $ 35)))))))))))) 

(SDEFUN |PR;coerce;R$;12| ((|r| R) ($ $))
        (COND ((SPADCALL |r| (QREFELT $ 37)) (|spadConstant| $ 22))
              ('T (LIST (CONS (|spadConstant| $ 10) |r|))))) 

(SDEFUN |PR;coerce;I$;13| ((|n| |Integer|) ($ $))
        (SPADCALL (SPADCALL |n| (QREFELT $ 39)) (QREFELT $ 35))) 

(SDEFUN |PR;ground?;$B;14| ((|p| $) ($ |Boolean|))
        (COND ((NULL |p|) 'T)
              ((NULL (CDR |p|))
               (SPADCALL (SPADCALL |p| (QREFELT $ 16)) (QREFELT $ 26)))
              ('T NIL))) 

(SDEFUN |PR;times!| ((|r| R) (|x| $) ($ $))
        (SPROG
         ((|endcell| (|Rep|)) (|res| (|Rep|)) (|xx| (|Rep|)) (|newend| (|Rep|))
          (|tx| (|Record| (|:| |k| E) (|:| |c| R))) (#1=#:G829 NIL))
         (SEQ
          (COND
           ((QREFELT $ 42)
            (SEQ
             (SEQ (LETT |tx| NIL . #2=(|PR;times!|)) (LETT #1# |x| . #2#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |tx| (CAR #1#) . #2#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (RPLACD |tx| (SPADCALL |r| (QCDR |tx|) (QREFELT $ 43)))
                     (QCDR |tx|))))
                  (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT |x|)))
           ('T
            (SEQ (LETT |xx| |x| . #2#) (LETT |res| NIL . #2#)
                 (SEQ G190 (COND ((NULL (NULL (NULL |xx|))) (GO G191)))
                      (SEQ (LETT |tx| (|SPADfirst| |xx|) . #2#)
                           (PROGN
                            (RPLACD |tx|
                                    (SPADCALL |r| (QCDR |tx|) (QREFELT $ 43)))
                            (QCDR |tx|))
                           (EXIT
                            (COND
                             ((SPADCALL (QCDR |tx|) (QREFELT $ 37))
                              (LETT |xx| (CDR |xx|) . #2#))
                             ('T
                              (SEQ (LETT |newend| |xx| . #2#)
                                   (LETT |xx| (CDR |xx|) . #2#)
                                   (EXIT
                                    (COND
                                     ((NULL |res|)
                                      (SEQ (LETT |res| |newend| . #2#)
                                           (EXIT
                                            (LETT |endcell| |res| . #2#))))
                                     ('T
                                      (SEQ (RPLACD |endcell| |newend|)
                                           (EXIT
                                            (LETT |endcell| |newend|
                                                  . #2#)))))))))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |res|))))))) 

(SDEFUN |PR;termTimes|
        ((|r| R) (|e| E) (|tx| |Record| (|:| |k| E) (|:| |c| R))
         ($ |Record| (|:| |k| E) (|:| |c| R)))
        (CONS (SPADCALL |e| (QCAR |tx|) (QREFELT $ 44))
              (SPADCALL |r| (QCDR |tx|) (QREFELT $ 43)))) 

(SDEFUN |PR;times| ((|tco| R) (|tex| E) (|rx| $) ($ $))
        (SPROG ((|r| (R)) (#1=#:G837 NIL) (|tx| NIL) (#2=#:G836 NIL))
               (SEQ
                (COND
                 ((QREFELT $ 42)
                  (SPADCALL (CONS #'|PR;times!0| (VECTOR $ |tex| |tco|)) |rx|
                            (QREFELT $ 46)))
                 ('T
                  (PROGN
                   (LETT #2# NIL . #3=(|PR;times|))
                   (SEQ (LETT |tx| NIL . #3#) (LETT #1# |rx| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |tx| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL
                             (SPADCALL
                              (LETT |r|
                                    (SPADCALL |tco| (QCDR |tx|) (QREFELT $ 43))
                                    . #3#)
                              (QREFELT $ 37)))
                            (LETT #2#
                                  (CONS
                                   (CONS
                                    (SPADCALL |tex| (QCAR |tx|) (QREFELT $ 44))
                                    |r|)
                                   #2#)
                                  . #3#)))))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |PR;times!0| ((|x1| NIL) ($$ NIL))
        (PROG (|tco| |tex| $)
          (LETT |tco| (QREFELT $$ 2) . #1=(|PR;times|))
          (LETT |tex| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PR;termTimes| |tco| |tex| |x1| $))))) 

(SDEFUN |PR;addm!| ((|p1| |Rep|) (|coef| R) (|exp| E) (|p2| |Rep|) ($ |Rep|))
        (SPROG
         ((|newcell| (|Rep|)) (|endcell| (|Rep|)) (|res| (|Rep|))
          (|ttt| (|Record| (|:| |k| E) (|:| |c| R))) (|newcoef| (R))
          (|exy| (E)) (|ty| #1=(|Record| (|:| |k| E) (|:| |c| R))) (|tx| #1#))
         (SEQ
          (SEQ (LETT |res| NIL . #2=(|PR;addm!|)) (LETT |endcell| NIL . #2#)
               (EXIT
                (SEQ G190
                     (COND
                      ((NULL (COND ((NULL |p1|) NIL) ('T (NULL (NULL |p2|)))))
                       (GO G191)))
                     (SEQ (LETT |tx| (|SPADfirst| |p1|) . #2#)
                          (LETT |ty| (|SPADfirst| |p2|) . #2#)
                          (LETT |exy|
                                (SPADCALL |exp| (QCAR |ty|) (QREFELT $ 44))
                                . #2#)
                          (LETT |newcell| NIL . #2#)
                          (COND
                           ((SPADCALL (QCAR |tx|) |exy| (QREFELT $ 30))
                            (SEQ
                             (LETT |newcoef|
                                   (SPADCALL (QCDR |tx|)
                                             (SPADCALL |coef| (QCDR |ty|)
                                                       (QREFELT $ 43))
                                             (QREFELT $ 47))
                                   . #2#)
                             (COND
                              ((NULL (SPADCALL |newcoef| (QREFELT $ 37)))
                               (SEQ (PROGN (RPLACD |tx| |newcoef|) (QCDR |tx|))
                                    (EXIT (LETT |newcell| |p1| . #2#)))))
                             (LETT |p1| (CDR |p1|) . #2#)
                             (EXIT (LETT |p2| (CDR |p2|) . #2#))))
                           ((SPADCALL |exy| (QCAR |tx|) (QREFELT $ 31))
                            (SEQ (LETT |newcell| |p1| . #2#)
                                 (EXIT (LETT |p1| (CDR |p1|) . #2#))))
                           ('T
                            (SEQ
                             (LETT |newcoef|
                                   (SPADCALL |coef| (QCDR |ty|) (QREFELT $ 43))
                                   . #2#)
                             (COND
                              ((OR (QREFELT $ 42)
                                   (NULL (SPADCALL |newcoef| (QREFELT $ 37))))
                               (SEQ (LETT |ttt| (CONS |exy| |newcoef|) . #2#)
                                    (EXIT
                                     (LETT |newcell| (CONS |ttt| NIL) . #2#))))
                              ('T (LETT |newcell| NIL . #2#)))
                             (EXIT (LETT |p2| (CDR |p2|) . #2#)))))
                          (EXIT
                           (COND
                            ((NULL (NULL |newcell|))
                             (COND
                              ((NULL |res|)
                               (SEQ (LETT |res| |newcell| . #2#)
                                    (EXIT (LETT |endcell| |res| . #2#))))
                              ('T
                               (SEQ (RPLACD |endcell| |newcell|)
                                    (EXIT
                                     (LETT |endcell| |newcell| . #2#)))))))))
                     NIL (GO G190) G191 (EXIT NIL))))
          (COND
           ((NULL |p1|)
            (LETT |newcell| (|PR;times| |coef| |exp| |p2| $) . #2#))
           (#3='T (LETT |newcell| |p1| . #2#)))
          (EXIT
           (COND ((NULL |res|) |newcell|)
                 (#3# (SEQ (RPLACD |endcell| |newcell|) (EXIT |res|)))))))) 

(SDEFUN |PR;pomopo!;$RE2$;19| ((|p1| $) (|r| R) (|e| E) (|p2| $) ($ $))
        (|PR;addm!| |p1| |r| |e| |p2| $)) 

(SDEFUN |PR;addms!|
        ((|pp1| |Rep|) (|coef| R) (|exp1| E) (|pp2| |Rep|) ($ |Rep|))
        (SPROG
         ((|newcell|
           #1=(|List| (|Record| (|:| |k| (|SingleInteger|)) (|:| |c| R))))
          (|endcell| #1#) (|res| #1#)
          (|p2| (|List| (|Record| (|:| |k| (|SingleInteger|)) (|:| |c| R))))
          (|ttt| (|Record| (|:| |k| (|SingleInteger|)) (|:| |c| R)))
          (|newcoef| (R))
          (|p1| (|List| (|Record| (|:| |k| (|SingleInteger|)) (|:| |c| R))))
          (|exy| (|SingleInteger|))
          (|ty| #2=(|Record| (|:| |k| (|SingleInteger|)) (|:| |c| R)))
          (|tx| #2#) (|exp| (|SingleInteger|)))
         (SEQ (LETT |p1| |pp1| . #3=(|PR;addms!|)) (LETT |p2| |pp2| . #3#)
              (LETT |exp| |exp1| . #3#)
              (SEQ (LETT |res| NIL . #3#) (LETT |endcell| NIL . #3#)
                   (EXIT
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |p1|) NIL) ('T (NULL (NULL |p2|)))))
                           (GO G191)))
                         (SEQ (LETT |tx| (|SPADfirst| |p1|) . #3#)
                              (LETT |ty| (|SPADfirst| |p2|) . #3#)
                              (LETT |exy| (|add_SI| |exp| (QCAR |ty|)) . #3#)
                              (LETT |newcell| NIL . #3#)
                              (COND
                               ((|eql_SI| (QCAR |tx|) |exy|)
                                (SEQ
                                 (LETT |newcoef|
                                       (SPADCALL (QCDR |tx|)
                                                 (SPADCALL |coef| (QCDR |ty|)
                                                           (QREFELT $ 43))
                                                 (QREFELT $ 47))
                                       . #3#)
                                 (COND
                                  ((NULL (SPADCALL |newcoef| (QREFELT $ 37)))
                                   (SEQ
                                    (PROGN (RPLACD |tx| |newcoef|) (QCDR |tx|))
                                    (EXIT (LETT |newcell| |p1| . #3#)))))
                                 (LETT |p1| (CDR |p1|) . #3#)
                                 (EXIT (LETT |p2| (CDR |p2|) . #3#))))
                               ((|less_SI| |exy| (QCAR |tx|))
                                (SEQ (LETT |newcell| |p1| . #3#)
                                     (EXIT (LETT |p1| (CDR |p1|) . #3#))))
                               ('T
                                (SEQ
                                 (LETT |newcoef|
                                       (SPADCALL |coef| (QCDR |ty|)
                                                 (QREFELT $ 43))
                                       . #3#)
                                 (COND
                                  ((OR (QREFELT $ 42)
                                       (NULL
                                        (SPADCALL |newcoef| (QREFELT $ 37))))
                                   (SEQ
                                    (LETT |ttt| (CONS |exy| |newcoef|) . #3#)
                                    (EXIT
                                     (LETT |newcell| (CONS |ttt| NIL) . #3#))))
                                  ('T (LETT |newcell| NIL . #3#)))
                                 (EXIT (LETT |p2| (CDR |p2|) . #3#)))))
                              (EXIT
                               (COND
                                ((NULL (NULL |newcell|))
                                 (COND
                                  ((NULL |res|)
                                   (SEQ (LETT |res| |newcell| . #3#)
                                        (EXIT (LETT |endcell| |res| . #3#))))
                                  ('T
                                   (SEQ (RPLACD |endcell| |newcell|)
                                        (EXIT
                                         (LETT |endcell| |newcell|
                                               . #3#)))))))))
                         NIL (GO G190) G191 (EXIT NIL))))
              (COND
               ((NULL |p1|)
                (LETT |newcell| (|PR;times| |coef| |exp| |p2| $) . #3#))
               (#4='T (LETT |newcell| |p1| . #3#)))
              (EXIT
               (COND ((NULL |res|) |newcell|)
                     (#4# (SEQ (RPLACD |endcell| |newcell|) (EXIT |res|)))))))) 

(SDEFUN |PR;*;3$;21| ((|p1| $) (|p2| $) ($ $))
        (SPROG
         ((|res| (|Rep|)) (#1=#:G896 NIL) (|tx| NIL) (#2=#:G895 NIL)
          (|xx| (|Rep|)) (|degy| (E)) (|degx| (E)) (|#G69| ($)) (|#G68| ($))
          (|yy| (|Rep|)) (|#G67| (|Rep|)) (|#G66| (|Rep|))
          (|ly| #3=(|NonNegativeInteger|)) (|lx| #3#))
         (SEQ (LETT |xx| |p1| . #4=(|PR;*;3$;21|))
              (EXIT
               (COND ((NULL |xx|) |p1|)
                     (#5='T
                      (SEQ (LETT |yy| |p2| . #4#)
                           (EXIT
                            (COND ((NULL |yy|) |p2|)
                                  (#5#
                                   (SEQ
                                    (COND
                                     ((QREFELT $ 9)
                                      (SEQ (LETT |lx| (LENGTH |xx|) . #4#)
                                           (LETT |ly| (LENGTH |yy|) . #4#)
                                           (EXIT
                                            (COND
                                             ((< |ly| |lx|)
                                              (SEQ
                                               (PROGN
                                                (LETT |#G66| |yy| . #4#)
                                                (LETT |#G67| |xx| . #4#)
                                                (LETT |xx| |#G66| . #4#)
                                                (LETT |yy| |#G67| . #4#))
                                               (EXIT
                                                (PROGN
                                                 (LETT |#G68| |p2| . #4#)
                                                 (LETT |#G69| |p1| . #4#)
                                                 (LETT |p1| |#G68| . #4#)
                                                 (LETT |p2| |#G69|
                                                       . #4#))))))))))
                                    (LETT |degx| (QCAR (|SPADfirst| |xx|))
                                          . #4#)
                                    (LETT |degy| (QCAR (|SPADfirst| |yy|))
                                          . #4#)
                                    (EXIT
                                     (COND
                                      ((ZEROP |degx|)
                                       (SPADCALL (QCDR (|SPADfirst| |xx|)) |p2|
                                                 (QREFELT $ 49)))
                                      ((ZEROP |degy|)
                                       (SPADCALL |p1| (QCDR (|SPADfirst| |yy|))
                                                 (QREFELT $ 50)))
                                      (#5#
                                       (SEQ (LETT |xx| (REVERSE |xx|) . #4#)
                                            (LETT |res| NIL . #4#)
                                            (COND
                                             ((< (+ |degx| |degy|)
                                                 MOST-POSITIVE-FIXNUM)
                                              (SEQ (LETT |tx| NIL . #4#)
                                                   (LETT #2# |xx| . #4#) G190
                                                   (COND
                                                    ((OR (ATOM #2#)
                                                         (PROGN
                                                          (LETT |tx| (CAR #2#)
                                                                . #4#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT |res|
                                                           (|PR;addms!| |res|
                                                            (QCDR |tx|)
                                                            (QCAR |tx|) |yy| $)
                                                           . #4#)))
                                                   (LETT #2# (CDR #2#) . #4#)
                                                   (GO G190) G191 (EXIT NIL)))
                                             (#5#
                                              (SEQ (LETT |tx| NIL . #4#)
                                                   (LETT #1# |xx| . #4#) G190
                                                   (COND
                                                    ((OR (ATOM #1#)
                                                         (PROGN
                                                          (LETT |tx| (CAR #1#)
                                                                . #4#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT |res|
                                                           (|PR;addm!| |res|
                                                            (QCDR |tx|)
                                                            (QCAR |tx|) |yy| $)
                                                           . #4#)))
                                                   (LETT #1# (CDR #1#) . #4#)
                                                   (GO G190) G191 (EXIT NIL))))
                                            (EXIT |res|)))))))))))))))) 

(SDEFUN |PR;*;3$;22| ((|p1| $) (|p2| $) ($ $))
        (SPROG
         ((|res| (|Rep|)) (#1=#:G904 NIL) (|tx| NIL) (|xx| (|Rep|))
          (|yy| (|Rep|)))
         (SEQ (LETT |xx| |p1| . #2=(|PR;*;3$;22|))
              (EXIT
               (COND ((NULL |xx|) |p1|)
                     (#3='T
                      (SEQ (LETT |yy| |p2| . #2#)
                           (EXIT
                            (COND ((NULL |yy|) |p2|)
                                  ((SPADCALL (QCAR (|SPADfirst| |xx|))
                                             (QREFELT $ 26))
                                   (SPADCALL (QCDR (|SPADfirst| |xx|)) |p2|
                                             (QREFELT $ 49)))
                                  ((SPADCALL (QCAR (|SPADfirst| |yy|))
                                             (QREFELT $ 26))
                                   (SPADCALL |p1| (QCDR (|SPADfirst| |yy|))
                                             (QREFELT $ 50)))
                                  (#3#
                                   (SEQ (LETT |xx| (REVERSE |xx|) . #2#)
                                        (LETT |res| NIL . #2#)
                                        (SEQ (LETT |tx| NIL . #2#)
                                             (LETT #1# |xx| . #2#) G190
                                             (COND
                                              ((OR (ATOM #1#)
                                                   (PROGN
                                                    (LETT |tx| (CAR #1#) . #2#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |res|
                                                     (|PR;addm!| |res|
                                                      (QCDR |tx|) (QCAR |tx|)
                                                      |yy| $)
                                                     . #2#)))
                                             (LETT #1# (CDR #1#) . #2#)
                                             (GO G190) G191 (EXIT NIL))
                                        (EXIT |res|)))))))))))) 

(SDEFUN |PR;^;$Pi$;23| ((|p| $) (|np| |PositiveInteger|) ($ $))
        (SPADCALL |p| |np| (QREFELT $ 52))) 

(SDEFUN |PR;^;$Nni$;24| ((|p| $) (|nn| |NonNegativeInteger|) ($ $))
        (SPROG ((|cc| (R)))
               (COND ((NULL |p|) (|spadConstant| $ 22))
                     ((ZEROP |nn|) (|spadConstant| $ 12)) ((EQL |nn| 1) |p|)
                     (#1='T
                      (COND
                       ((NULL (CDR |p|))
                        (COND
                         ((SPADCALL
                           (LETT |cc|
                                 (SPADCALL (QCDR (|SPADfirst| |p|)) |nn|
                                           (QREFELT $ 55))
                                 |PR;^;$Nni$;24|)
                           (QREFELT $ 37))
                          (|spadConstant| $ 22))
                         (#1#
                          (LIST
                           (CONS
                            (SPADCALL |nn| (QCAR (|SPADfirst| |p|))
                                      (QREFELT $ 56))
                            |cc|)))))
                       (#1#
                        (SPADCALL (LIST (|SPADfirst| |p|)) (CDR |p|) |nn|
                                  (QREFELT $ 57)))))))) 

(SDEFUN |PR;/;$R$;25| ((|x| $) (|r| R) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 58)) |x| (QREFELT $ 49))) 

(SDEFUN |PR;unitNormal;$R;26|
        ((|p| $)
         ($ |Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $)))
        (SPROG ((|a| (R)) (#1=#:G916 NIL) (|lcf| (R)) (|#G1| (R)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((NULL |p|)
                    (EXIT
                     (VECTOR (|spadConstant| $ 12) |p| (|spadConstant| $ 12))))
                   ('T
                    (SEQ
                     (LETT |#G1| (QCDR (|SPADfirst| |p|))
                           . #2=(|PR;unitNormal;$R;26|))
                     (LETT |lcf| |#G1| . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL |#G1| (|spadConstant| $ 11) (QREFELT $ 60))
                        (PROGN
                         (LETT #1#
                               (VECTOR (|spadConstant| $ 12) |p|
                                       (|spadConstant| $ 12))
                               . #2#)
                         (GO #3=#:G913))))))))
                  (LETT |a| (SPADCALL |lcf| (QREFELT $ 58)) . #2#)
                  (EXIT
                   (VECTOR (SPADCALL |lcf| (QREFELT $ 35))
                           (CONS
                            (CONS (QCAR (|SPADfirst| |p|))
                                  (|spadConstant| $ 11))
                            (SPADCALL |a| (CDR |p|) (QREFELT $ 49)))
                           (SPADCALL |a| (QREFELT $ 35))))))
                #3# (EXIT #1#)))) 

(SDEFUN |PR;unitCanonical;2$;27| ((|p| $) ($ $))
        (SPROG ((|a| (R)) (#1=#:G920 NIL) (|lcf| (R)) (|#G2| (R)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND ((NULL |p|) (EXIT |p|))
                        ('T
                         (SEQ
                          (LETT |#G2| (QCDR (|SPADfirst| |p|))
                                . #2=(|PR;unitCanonical;2$;27|))
                          (LETT |lcf| |#G2| . #2#)
                          (EXIT
                           (COND
                            ((SPADCALL |#G2| (|spadConstant| $ 11)
                                       (QREFELT $ 60))
                             (PROGN (LETT #1# |p| . #2#) (GO #3=#:G918))))))))
                  (LETT |a| (SPADCALL |lcf| (QREFELT $ 58)) . #2#)
                  (EXIT
                   (CONS (CONS (QCAR (|SPADfirst| |p|)) (|spadConstant| $ 11))
                         (SPADCALL |a| (CDR |p|) (QREFELT $ 49))))))
                #3# (EXIT #1#)))) 

(SDEFUN |PR;unitNormal;$R;28|
        ((|p| $)
         ($ |Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $)))
        (SPROG
         ((|a| (R)) (|cf| (R)) (|u| (R))
          (|#G87|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R))))
         (SEQ
          (COND
           ((OR (NULL |p|)
                (SPADCALL (QCDR (|SPADfirst| |p|)) (|spadConstant| $ 11)
                          (QREFELT $ 60)))
            (VECTOR (|spadConstant| $ 12) |p| (|spadConstant| $ 12)))
           ('T
            (SEQ
             (PROGN
              (LETT |#G87| (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 64))
                    . #1=(|PR;unitNormal;$R;28|))
              (LETT |u| (QVELT |#G87| 0) . #1#)
              (LETT |cf| (QVELT |#G87| 1) . #1#)
              (LETT |a| (QVELT |#G87| 2) . #1#)
              |#G87|)
             (EXIT
              (VECTOR (SPADCALL |u| (QREFELT $ 35))
                      (CONS (CONS (QCAR (|SPADfirst| |p|)) |cf|)
                            (SPADCALL |a| (CDR |p|) (QREFELT $ 49)))
                      (SPADCALL |a| (QREFELT $ 35)))))))))) 

(SDEFUN |PR;unitCanonical;2$;29| ((|p| $) ($ $))
        (SPROG
         ((|a| (R)) (|cf| (R)) (|u| (R))
          (|#G89|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R))))
         (SEQ
          (COND
           ((OR (NULL |p|)
                (SPADCALL (QCDR (|SPADfirst| |p|)) (|spadConstant| $ 11)
                          (QREFELT $ 60)))
            |p|)
           ('T
            (SEQ
             (PROGN
              (LETT |#G89| (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 64))
                    . #1=(|PR;unitCanonical;2$;29|))
              (LETT |u| (QVELT |#G89| 0) . #1#)
              (LETT |cf| (QVELT |#G89| 1) . #1#)
              (LETT |a| (QVELT |#G89| 2) . #1#)
              |#G89|)
             (EXIT
              (CONS (CONS (QCAR (|SPADfirst| |p|)) |cf|)
                    (SPADCALL |a| (CDR |p|) (QREFELT $ 49)))))))))) 

(SDEFUN |PR;fmecg;$ER2$;30| ((|p1| $) (|e| E) (|r| R) (|p2| $) ($ $))
        (SPROG
         ((|rout| ($)) (|u| (R)) (|e2| (E)) (|c2| (R)) (#1=#:G939 NIL)
          (|tm| NIL))
         (SEQ (LETT |rout| NIL . #2=(|PR;fmecg;$ER2$;30|))
              (LETT |r| (SPADCALL |r| (QREFELT $ 65)) . #2#)
              (SEQ (LETT |tm| NIL . #2#) (LETT #1# |p2| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |tm| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |c2| (SPADCALL |r| (QCDR |tm|) (QREFELT $ 43)) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |c2| (|spadConstant| $ 20) (QREFELT $ 60))
                       "iterate")
                      ('T
                       (SEQ
                        (LETT |e2| (SPADCALL |e| (QCAR |tm|) (QREFELT $ 44))
                              . #2#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |p1|) NIL)
                                      ('T
                                       (SPADCALL (QCAR (|SPADfirst| |p1|)) |e2|
                                                 (QREFELT $ 32)))))
                               (GO G191)))
                             (SEQ
                              (LETT |rout| (CONS (|SPADfirst| |p1|) |rout|)
                                    . #2#)
                              (EXIT (LETT |p1| (CDR |p1|) . #2#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (COND
                         ((OR (NULL |p1|)
                              (SPADCALL (QCAR (|SPADfirst| |p1|)) |e2|
                                        (QREFELT $ 31)))
                          (EXIT
                           (LETT |rout| (CONS (CONS |e2| |c2|) |rout|)
                                 . #2#))))
                        (COND
                         ((SPADCALL
                           (LETT |u|
                                 (SPADCALL (QCDR (|SPADfirst| |p1|)) |c2|
                                           (QREFELT $ 47))
                                 . #2#)
                           (|spadConstant| $ 20) (QREFELT $ 66))
                          (LETT |rout| (CONS (CONS |e2| |u|) |rout|) . #2#)))
                        (EXIT (LETT |p1| (CDR |p1|) . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (NREVERSE |rout|) |p1| (QREFELT $ 67)))))) 

(SDEFUN |PR;associates?;2$B;31| ((|p1| $) (|p2| $) ($ |Boolean|))
        (SPROG ((#1=#:G941 NIL))
               (COND ((NULL |p1|) (NULL |p2|)) ((NULL |p2|) NIL)
                     (#2='T
                      (COND
                       ((SPADCALL (QCAR (|SPADfirst| |p1|))
                                  (QCAR (|SPADfirst| |p2|)) (QREFELT $ 30))
                        (COND
                         ((SPADCALL (QCDR (|SPADfirst| |p1|))
                                    (QCDR (|SPADfirst| |p2|)) (QREFELT $ 69))
                          (SPADCALL
                           (SPADCALL
                            (PROG2
                                (LETT #1#
                                      (SPADCALL (QCDR (|SPADfirst| |p2|))
                                                (QCDR (|SPADfirst| |p1|))
                                                (QREFELT $ 70))
                                      |PR;associates?;2$B;31|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                              (|Union| (QREFELT $ 6) "failed")
                                              #1#))
                            (CDR |p1|) (QREFELT $ 49))
                           (CDR |p2|) (QREFELT $ 71)))
                         (#2# NIL)))
                       (#2# NIL)))))) 

(SDEFUN |PR;exquo;$RU;32| ((|p| $) (|r| R) ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G955 NIL) (|a| (|Union| R "failed")) (#2=#:G957 NIL) (|tm| NIL)
          (#3=#:G956 NIL))
         (SEQ
          (EXIT
           (CONS 0
                 (PROGN
                  (LETT #3# NIL . #4=(|PR;exquo;$RU;32|))
                  (SEQ (LETT |tm| NIL . #4#) (LETT #2# |p| . #4#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |tm| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #3#
                               (CONS
                                (SEQ
                                 (LETT |a|
                                       (SPADCALL (QCDR |tm|) |r|
                                                 (QREFELT $ 70))
                                       . #4#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |a| 1)
                                    (PROGN
                                     (LETT #1# (CONS 1 "failed") . #4#)
                                     (GO #5=#:G954)))
                                   ('T (CONS (QCAR |tm|) (QCDR |a|))))))
                                #3#)
                               . #4#)))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #3#))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PR;exquo;2$U;33| ((|p1| $) (|p2| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((|rout| ($)) (#2=#:G973 NIL) (|ee| (|Union| E "failed"))
          (|a| (|Union| R #1#)))
         (SEQ
          (EXIT
           (COND ((NULL |p2|) (|error| "Division by 0"))
                 ((SPADCALL |p2| (|spadConstant| $ 12) (QREFELT $ 71))
                  (CONS 0 |p1|))
                 ((SPADCALL |p1| |p2| (QREFELT $ 71))
                  (CONS 0 (|spadConstant| $ 12)))
                 (#3='T
                  (SEQ (LETT |rout| NIL . #4=(|PR;exquo;2$U;33|))
                       (SEQ G190 (COND ((NULL |p1|) (GO G191)))
                            (SEQ
                             (LETT |a|
                                   (SPADCALL (QCDR (|SPADfirst| |p1|))
                                             (QCDR (|SPADfirst| |p2|))
                                             (QREFELT $ 70))
                                   . #4#)
                             (EXIT
                              (COND
                               ((QEQCAR |a| 1)
                                (PROGN
                                 (LETT #2# (CONS 1 "failed") . #4#)
                                 (GO #5=#:G972)))
                               ('T
                                (SEQ
                                 (LETT |ee|
                                       (SPADCALL (QCAR (|SPADfirst| |p1|))
                                                 (QCAR (|SPADfirst| |p2|))
                                                 (QREFELT $ 74))
                                       . #4#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ee| 1)
                                    (PROGN
                                     (LETT #2# (CONS 1 "failed") . #4#)
                                     (GO #5#)))
                                   ('T
                                    (SEQ
                                     (LETT |p1|
                                           (SPADCALL (CDR |p1|) (QCDR |ee|)
                                                     (QCDR |a|) (CDR |p2|)
                                                     (QREFELT $ 68))
                                           . #4#)
                                     (EXIT
                                      (LETT |rout|
                                            (CONS (CONS (QCDR |ee|) (QCDR |a|))
                                                  |rout|)
                                            . #4#)))))))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (COND ((NULL |p1|) (CONS 0 (NREVERSE |rout|)))
                              (#3# (CONS 1 "failed"))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |PR;exquo;2$U;34| ((|p1| $) (|p2| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((|rout| ($)) (#2=#:G989 NIL) (|ee| (|Union| E "failed"))
          (|a| (|Union| R #1#)))
         (SEQ
          (EXIT
           (COND ((NULL |p2|) (|error| "Division by 0"))
                 ((SPADCALL |p2| (|spadConstant| $ 12) (QREFELT $ 71))
                  (CONS 0 |p1|))
                 (#3='T
                  (SEQ (LETT |rout| NIL . #4=(|PR;exquo;2$U;34|))
                       (SEQ G190 (COND ((NULL |p1|) (GO G191)))
                            (SEQ
                             (LETT |a|
                                   (SPADCALL (QCDR (|SPADfirst| |p1|))
                                             (QCDR (|SPADfirst| |p2|))
                                             (QREFELT $ 70))
                                   . #4#)
                             (EXIT
                              (COND
                               ((QEQCAR |a| 1)
                                (PROGN
                                 (LETT #2# (CONS 1 "failed") . #4#)
                                 (GO #5=#:G988)))
                               ('T
                                (SEQ
                                 (LETT |ee|
                                       (SPADCALL (QCAR (|SPADfirst| |p1|))
                                                 (QCAR (|SPADfirst| |p2|))
                                                 (QREFELT $ 74))
                                       . #4#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ee| 1)
                                    (PROGN
                                     (LETT #2# (CONS 1 "failed") . #4#)
                                     (GO #5#)))
                                   ('T
                                    (SEQ
                                     (LETT |p1|
                                           (SPADCALL (CDR |p1|) (QCDR |ee|)
                                                     (QCDR |a|) (CDR |p2|)
                                                     (QREFELT $ 68))
                                           . #4#)
                                     (EXIT
                                      (LETT |rout|
                                            (CONS (CONS (QCDR |ee|) (QCDR |a|))
                                                  |rout|)
                                            . #4#)))))))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (COND ((NULL |p1|) (CONS 0 (NREVERSE |rout|)))
                              (#3# (CONS 1 "failed"))))))))
          #5# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |PolynomialRing;|)) 

(DEFUN |PolynomialRing| (&REST #1=#:G1006)
  (SPROG NIL
         (PROG (#2=#:G1007)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialRing|)
                                               '|domainEqualList|)
                    . #3=(|PolynomialRing|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PolynomialRing;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PolynomialRing|)))))))))) 

(DEFUN |PolynomialRing;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G1001 NIL) (#2=#:G1002 NIL) (#3=#:G1003 NIL)
    (#4=#:G1004 NIL) (#5=#:G1005 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|PolynomialRing|))
    (LETT DV$2 (|devaluate| |#2|) . #6#)
    (LETT |dv$| (LIST '|PolynomialRing| DV$1 DV$2) . #6#)
    (LETT $ (GETREFV 86) . #6#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #6#)
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (LETT #4#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #4#)
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|))
                                            #4#)
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#1| '(|GcdDomain|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #4#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3# #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #4#)
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3# #1# #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #4#)))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|PolynomialRing| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 67108864))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 134217728))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         #4#)
     (|augmentPredVector| $ 536870912))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         #4#)
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR #3# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR #2# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 8589934592))
    (AND
     (OR #1# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 17179869184))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|List| (|Record| (|:| |k| |#2|) (|:| |c| |#1|))))
    (QSETREFV $ 9 (|HasCategory| |#1| '(|CommutativeRing|)))
    (COND
     ((|HasCategory| |#1| '(|Monoid|))
      (QSETREFV $ 12
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |PR;One;$;1|) $ 12)))))
    (COND
     ((|testBitVector| |pv$| 9)
      (QSETREFV $ 15 (CONS (|dispatchFunction| |PR;characteristic;Nni;2|) $))))
    (COND
     ((|domainEqual| |#2| (|NonNegativeInteger|))
      (QSETREFV $ 29 (CONS (|dispatchFunction| |PR;coefficient;$ER;9|) $)))
     ('T
      (QSETREFV $ 29 (CONS (|dispatchFunction| |PR;coefficient;$ER;10|) $))))
    (COND
     ((|testBitVector| |pv$| 9)
      (QSETREFV $ 40 (CONS (|dispatchFunction| |PR;coerce;I$;13|) $))))
    (QSETREFV $ 42 (|HasCategory| |#1| '(|noZeroDivisors|)))
    (COND
     ((|domainEqual| |#2| (|NonNegativeInteger|))
      (PROGN (QSETREFV $ 51 (CONS (|dispatchFunction| |PR;*;3$;21|) $))))
     ('T (QSETREFV $ 51 (CONS (|dispatchFunction| |PR;*;3$;22|) $))))
    (COND
     ((|testBitVector| |pv$| 28)
      (PROGN
       (QSETREFV $ 54
                 (CONS (|dispatchFunction| |PR;^;$Pi$;23|)
                       (|getDomainView| $ '(|CommutativeRing|))))
       (QSETREFV $ 52
                 (CONS (|dispatchFunction| |PR;^;$Nni$;24|)
                       (|getDomainView| $ '(|CommutativeRing|)))))))
    (COND
     ((|testBitVector| |pv$| 18)
      (PROGN
       (QSETREFV $ 59 (CONS (|dispatchFunction| |PR;/;$R$;25|) $))
       (QSETREFV $ 62 (CONS (|dispatchFunction| |PR;unitNormal;$R;26|) $))
       (QSETREFV $ 63 (CONS (|dispatchFunction| |PR;unitCanonical;2$;27|) $))))
     ((|testBitVector| |pv$| 2)
      (PROGN
       (QSETREFV $ 62 (CONS (|dispatchFunction| |PR;unitNormal;$R;28|) $))
       (QSETREFV $ 63
                 (CONS (|dispatchFunction| |PR;unitCanonical;2$;29|) $)))))
    (COND
     ((|testBitVector| |pv$| 9)
      (QSETREFV $ 68 (CONS (|dispatchFunction| |PR;fmecg;$ER2$;30|) $))))
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (QSETREFV $ 72 (CONS (|dispatchFunction| |PR;associates?;2$B;31|) $))
       (QSETREFV $ 73 (CONS (|dispatchFunction| |PR;exquo;$RU;32|) $))
       (COND
        ((|HasCategory| |#2| '(|CancellationAbelianMonoid|))
         (COND
          ((|HasCategory| |#1| '(|Approximate|))
           (QSETREFV $ 75 (CONS (|dispatchFunction| |PR;exquo;2$U;33|) $)))
          ('T
           (QSETREFV $ 75
                     (CONS (|dispatchFunction| |PR;exquo;2$U;34|) $)))))))))
    $))) 

(MAKEPROP '|PolynomialRing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 6 7) (|local| |#1|)
              (|local| |#2|) '|Rep| '|commutative| (0 . |Zero|) (4 . |One|)
              (8 . |One|) (|NonNegativeInteger|) (12 . |characteristic|)
              (16 . |characteristic|) |PR;degree;$E;3|
              (|Record| (|:| |k| 7) (|:| |c| 6)) (20 . |last|)
              |PR;minimumDegree;$E;4| (25 . |Zero|)
              |PR;leadingCoefficient;$R;5| (29 . |Zero|)
              |PR;leadingMonomial;2$;6| |PR;reductum;2$;7| (|Boolean|)
              (33 . |zero?|) (|Union| 6 '"failed") |PR;retractIfCan;$U;8|
              (38 . |coefficient|) (44 . =) (50 . <) (56 . >)
              (|Union| $ '"failed") (62 . |recip|) |PR;coerce;R$;12|
              |PR;recip;$U;11| (67 . |zero?|) (|Integer|) (72 . |coerce|)
              (77 . |coerce|) |PR;ground?;$B;14| '|entireRing?| (82 . *)
              (88 . +) (|Mapping| 17 17) (94 . |map|) (100 . +)
              |PR;pomopo!;$RE2$;19| (106 . *) (112 . *) (118 . *) (124 . ^)
              (|PositiveInteger|) (130 . ^) (136 . ^) (142 . *)
              (148 . |binomThmExpt|) (155 . |inv|) (160 . /) (166 . =)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (172 . |unitNormal|) (177 . |unitCanonical|) (182 . |unitNormal|)
              (187 . -) (192 . ~=) (198 . |concat!|) (204 . |fmecg|)
              (212 . |associates?|) (218 . |exquo|) (224 . =)
              (230 . |associates?|) (236 . |exquo|) (242 . |subtractIfCan|)
              (248 . |exquo|) (|Fraction| 38) (|Union| 76 '#1="failed")
              (|Union| 38 '#1#) (|Mapping| 7 7) (|List| 6) (|Mapping| 6 6)
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 254 |zero?| 260 |unitNormal| 265 |unitCanonical| 270 |unit?|
              275 |subtractIfCan| 280 |smaller?| 286 |sample| 292
              |retractIfCan| 296 |retract| 311 |reductum| 326 |recip| 331
              |primitivePart| 336 |pomopo!| 341 |opposite?| 349 |one?| 355
              |numberOfMonomials| 360 |monomial?| 365 |monomial| 370
              |minimumDegree| 376 |mapExponents| 381 |map| 387
              |leadingMonomial| 393 |leadingCoefficient| 398 |latex| 403
              |hashUpdate!| 408 |hash| 414 |ground?| 419 |ground| 424 |fmecg|
              429 |exquo| 437 |degree| 449 |content| 454 |coerce| 459
              |coefficients| 484 |coefficient| 489 |charthRoot| 495
              |characteristic| 500 |binomThmExpt| 504 |associates?| 511
              |annihilate?| 517 ^ 523 |Zero| 535 |One| 539 = 543 / 549 - 555 +
              566 * 572)
           'NIL
           (CONS
            (|makeByteWordVec2| 26
                                '(0 0 2 1 2 5 1 6 2 3 4 5 7 0 1 10 12 0 0 1 1
                                  10 11 13 22 24 8 0 26 8 0 0 16 0 0 0 0 0 0 6
                                  9 7 14 15 17))
            (CONS
             '#(|FiniteAbelianMonoidRing&| |AbelianMonoidRing&| NIL |Algebra&|
                |Algebra&| |Algebra&| |Module&| NIL |Module&| NIL NIL |Module&|
                |EntireRing&| NIL NIL |Ring&| NIL NIL NIL NIL NIL |Rng&| NIL
                NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&| |Monoid&|
                |AbelianSemiGroup&| |SemiGroup&| NIL |FullyRetractableTo&|
                |SetCategory&| NIL |RetractableTo&| |BasicType&| NIL NIL NIL
                NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|FiniteAbelianMonoidRing| 6 7) (|AbelianMonoidRing| 6 7)
                 (|IntegralDomain|) (|Algebra| 76) (|Algebra| $$) (|Algebra| 6)
                 (|Module| 76) (|CommutativeRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|EntireRing|) (|BiModule| 6 6) (|BiModule| 76 76) (|Ring|)
                 (|BiModule| $$ $$) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| 76) (|RightModule| 76) (|Rng|) (|LeftModule| $$)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|SemiRng|)
                 (|AbelianMonoid|) (|Monoid|) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|Comparable|) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| 6) (|BasicType|) (|CoercibleTo| 85)
                 (|CommutativeStar|) (|unitsKnown|) (|noZeroDivisors|)
                 (|RetractableTo| 76) (|RetractableTo| 38)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| 85
                                  '(0 7 0 10 0 6 0 11 0 0 0 12 0 6 13 14 0 0 13
                                    15 1 8 17 0 18 0 6 0 20 0 0 0 22 1 7 25 0
                                    26 2 0 6 0 7 29 2 7 25 0 0 30 2 7 25 0 0 31
                                    2 7 25 0 0 32 1 6 33 0 34 1 6 25 0 37 1 6 0
                                    38 39 1 0 0 38 40 2 6 0 0 0 43 2 7 0 0 0 44
                                    2 8 0 45 0 46 2 6 0 0 0 47 2 0 0 6 0 49 2 0
                                    0 0 6 50 2 0 0 0 0 51 2 0 0 0 13 52 2 0 0 0
                                    53 54 2 6 0 0 13 55 2 7 0 13 0 56 3 0 0 0 0
                                    13 57 1 6 0 0 58 2 0 0 0 6 59 2 6 25 0 0 60
                                    1 0 61 0 62 1 0 0 0 63 1 6 61 0 64 1 6 0 0
                                    65 2 6 25 0 0 66 2 8 0 0 0 67 4 0 0 0 7 6 0
                                    68 2 6 25 0 0 69 2 6 33 0 0 70 2 0 25 0 0
                                    71 2 0 25 0 0 72 2 0 33 0 6 73 2 7 33 0 0
                                    74 2 0 33 0 0 75 2 0 25 0 0 1 1 35 25 0 1 1
                                    29 61 0 62 1 29 0 0 63 1 29 25 0 1 2 34 33
                                    0 0 1 2 16 25 0 0 1 0 35 0 1 1 14 77 0 1 1
                                    15 78 0 1 1 0 27 0 28 1 14 76 0 1 1 15 38 0
                                    1 1 0 6 0 1 1 0 0 0 24 1 31 33 0 36 1 20 0
                                    0 1 4 0 0 0 6 7 0 48 2 35 25 0 0 1 1 31 25
                                    0 1 1 0 13 0 1 1 0 25 0 1 2 0 0 6 7 1 1 0 7
                                    0 19 2 0 0 79 0 1 2 0 0 81 0 1 1 0 0 0 23 1
                                    0 6 0 21 1 0 82 0 1 2 0 84 84 0 1 1 0 83 0
                                    1 1 0 25 0 41 1 0 6 0 1 4 9 0 0 7 6 0 68 2
                                    29 33 0 0 75 2 7 33 0 6 73 1 0 7 0 16 1 20
                                    6 0 1 1 27 0 0 1 1 30 0 38 40 1 19 0 76 1 1
                                    0 0 6 35 1 0 85 0 1 1 0 80 0 1 2 0 6 0 7 29
                                    1 3 33 0 1 0 32 13 15 3 28 0 0 0 13 57 2 29
                                    25 0 0 72 2 32 25 0 0 1 2 31 0 0 13 52 2 0
                                    0 0 53 54 0 35 0 22 0 31 0 12 2 0 25 0 0 71
                                    2 18 0 0 6 59 1 33 0 0 1 2 33 0 0 0 1 2 0 0
                                    0 0 1 2 33 0 38 0 1 2 35 0 13 0 1 2 1 0 0
                                    76 1 2 1 0 76 0 1 2 0 0 6 0 49 2 0 0 0 0 51
                                    2 0 0 0 6 50 2 0 0 53 0 1)))))
           '|lookupComplete|)) 
