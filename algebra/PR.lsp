
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
         ((#1=#:G487 NIL) (#2=#:G488 NIL) (#3=#:G490 NIL) (|tm| NIL)
          (|ks| (|SingleInteger|)) (#4=#:G489 NIL) (|tms| NIL)
          (|es| (|SingleInteger|))
          (|ps| (|List| (|Record| (|:| |k| (|SingleInteger|)) (|:| |c| R))))
          (|degp| (|Integer|)))
         (SEQ
          (EXIT
           (COND ((NULL |p|) (|spadConstant| $ 20))
                 (#5='T
                  (SEQ (LETT |degp| (QCAR (|SPADfirst| |p|)))
                       (EXIT
                        (COND
                         ((< |degp| MOST-POSITIVE-FIXNUM)
                          (COND
                           ((NULL (< |e| MOST-POSITIVE-FIXNUM))
                            (|spadConstant| $ 20))
                           ('T
                            (SEQ (LETT |ps| |p|) (LETT |es| |e|)
                                 (SEQ (LETT |tms| NIL) (LETT #4# |ps|) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN (LETT |tms| (CAR #4#)) NIL))
                                        (GO G191)))
                                      (SEQ (LETT |ks| (QCAR |tms|))
                                           (EXIT
                                            (COND
                                             ((|eql_SI| |ks| |es|)
                                              (PROGN
                                               (LETT #2# (QCDR |tms|))
                                               (GO #6=#:G486)))
                                             ((|less_SI| |ks| |es|)
                                              (PROGN
                                               (LETT #2# (|spadConstant| $ 20))
                                               (GO #6#))))))
                                      (LETT #4# (CDR #4#)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT
                                  (PROGN
                                   (LETT #2# (|spadConstant| $ 20))
                                   (GO #6#)))))))
                         (#5#
                          (SEQ
                           (SEQ (LETT |tm| NIL) (LETT #3# |p|) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |tm| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((EQL (QCAR |tm|) |e|)
                                    (PROGN (LETT #2# (QCDR |tm|)) (GO #6#)))
                                   ('T
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((< (QCAR |tm|) |e|)
                                        (PROGN
                                         (LETT #1#
                                               (PROGN
                                                (LETT #2#
                                                      (|spadConstant| $ 20))
                                                (GO #6#)))
                                         (GO #7=#:G480)))))
                                     #7# (EXIT #1#))))))
                                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                           (EXIT (|spadConstant| $ 20))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |PR;coefficient;$ER;10| ((|p| $) (|e| E) ($ R))
        (SPROG ((#1=#:G497 NIL) (#2=#:G498 NIL) (#3=#:G499 NIL) (|tm| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |tm| NIL) (LETT #3# |p|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |tm| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QCAR |tm|) |e| (QREFELT $ 30))
                           (PROGN (LETT #2# (QCDR |tm|)) (GO #4=#:G496)))
                          ('T
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (QCAR |tm|) |e| (QREFELT $ 31))
                               (PROGN
                                (LETT #1#
                                      (PROGN
                                       (LETT #2# (|spadConstant| $ 20))
                                       (GO #4#)))
                                (GO #5=#:G492)))))
                            #5# (EXIT #1#))))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (|spadConstant| $ 20))))
                #4# (EXIT #2#)))) 

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
                   (LETT |u|
                         (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 34)))
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

(SDEFUN |PR;termTimes|
        ((|r| R) (|e| E) (|tx| |Record| (|:| |k| E) (|:| |c| R))
         ($ |Record| (|:| |k| E) (|:| |c| R)))
        (CONS (SPADCALL |e| (QCAR |tx|) (QREFELT $ 43))
              (SPADCALL |r| (QCDR |tx|) (QREFELT $ 44)))) 

(SDEFUN |PR;times| ((|tco| R) (|tex| E) (|rx| $) ($ $))
        (SPROG ((|r| (R)) (#1=#:G527 NIL) (|tx| NIL) (#2=#:G526 NIL))
               (SEQ
                (COND
                 ((QREFELT $ 42)
                  (SPADCALL (CONS #'|PR;times!0| (VECTOR $ |tex| |tco|)) |rx|
                            (QREFELT $ 46)))
                 ('T
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |tx| NIL) (LETT #1# |rx|) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |tx| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL
                             (SPADCALL
                              (LETT |r|
                                    (SPADCALL |tco| (QCDR |tx|)
                                              (QREFELT $ 44)))
                              (QREFELT $ 37)))
                            (LETT #2#
                                  (CONS
                                   (CONS
                                    (SPADCALL |tex| (QCAR |tx|) (QREFELT $ 43))
                                    |r|)
                                   #2#))))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |PR;times!0| ((|x1| NIL) ($$ NIL))
        (PROG (|tco| |tex| $)
          (LETT |tco| (QREFELT $$ 2))
          (LETT |tex| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|PR;termTimes| |tco| |tex| |x1| $))))) 

(SDEFUN |PR;addm!| ((|p1| |Rep|) (|coef| R) (|exp| E) (|p2| |Rep|) ($ |Rep|))
        (SPROG
         ((|newcell| (|Rep|)) (|endcell| (|Rep|)) (|res| (|Rep|))
          (|ttt| (|Record| (|:| |k| E) (|:| |c| R))) (|newcoef| (R))
          (|exy| (E)) (|ty| #1=(|Record| (|:| |k| E) (|:| |c| R))) (|tx| #1#))
         (SEQ
          (SEQ (LETT |res| NIL) (LETT |endcell| NIL)
               (EXIT
                (SEQ G190
                     (COND
                      ((NULL (COND ((NULL |p1|) NIL) ('T (NULL (NULL |p2|)))))
                       (GO G191)))
                     (SEQ (LETT |tx| (|SPADfirst| |p1|))
                          (LETT |ty| (|SPADfirst| |p2|))
                          (LETT |exy|
                                (SPADCALL |exp| (QCAR |ty|) (QREFELT $ 43)))
                          (LETT |newcell| NIL)
                          (COND
                           ((SPADCALL (QCAR |tx|) |exy| (QREFELT $ 30))
                            (SEQ
                             (LETT |newcoef|
                                   (SPADCALL (QCDR |tx|)
                                             (SPADCALL |coef| (QCDR |ty|)
                                                       (QREFELT $ 44))
                                             (QREFELT $ 47)))
                             (COND
                              ((NULL (SPADCALL |newcoef| (QREFELT $ 37)))
                               (SEQ (PROGN (RPLACD |tx| |newcoef|) (QCDR |tx|))
                                    (EXIT (LETT |newcell| |p1|)))))
                             (LETT |p1| (CDR |p1|))
                             (EXIT (LETT |p2| (CDR |p2|)))))
                           ((SPADCALL |exy| (QCAR |tx|) (QREFELT $ 31))
                            (SEQ (LETT |newcell| |p1|)
                                 (EXIT (LETT |p1| (CDR |p1|)))))
                           ('T
                            (SEQ
                             (LETT |newcoef|
                                   (SPADCALL |coef| (QCDR |ty|)
                                             (QREFELT $ 44)))
                             (COND
                              ((OR (QREFELT $ 42)
                                   (NULL (SPADCALL |newcoef| (QREFELT $ 37))))
                               (SEQ (LETT |ttt| (CONS |exy| |newcoef|))
                                    (EXIT (LETT |newcell| (CONS |ttt| NIL)))))
                              ('T (LETT |newcell| NIL)))
                             (EXIT (LETT |p2| (CDR |p2|))))))
                          (EXIT
                           (COND
                            ((NULL (NULL |newcell|))
                             (COND
                              ((NULL |res|)
                               (SEQ (LETT |res| |newcell|)
                                    (EXIT (LETT |endcell| |res|))))
                              ('T
                               (SEQ (RPLACD |endcell| |newcell|)
                                    (EXIT (LETT |endcell| |newcell|)))))))))
                     NIL (GO G190) G191 (EXIT NIL))))
          (COND ((NULL |p1|) (LETT |newcell| (|PR;times| |coef| |exp| |p2| $)))
                (#2='T (LETT |newcell| |p1|)))
          (EXIT
           (COND ((NULL |res|) |newcell|)
                 (#2# (SEQ (RPLACD |endcell| |newcell|) (EXIT |res|)))))))) 

(SDEFUN |PR;pomopo!;$RE2$;18| ((|p1| $) (|r| R) (|e| E) (|p2| $) ($ $))
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
         (SEQ (LETT |p1| |pp1|) (LETT |p2| |pp2|) (LETT |exp| |exp1|)
              (SEQ (LETT |res| NIL) (LETT |endcell| NIL)
                   (EXIT
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |p1|) NIL) ('T (NULL (NULL |p2|)))))
                           (GO G191)))
                         (SEQ (LETT |tx| (|SPADfirst| |p1|))
                              (LETT |ty| (|SPADfirst| |p2|))
                              (LETT |exy| (|add_SI| |exp| (QCAR |ty|)))
                              (LETT |newcell| NIL)
                              (COND
                               ((|eql_SI| (QCAR |tx|) |exy|)
                                (SEQ
                                 (LETT |newcoef|
                                       (SPADCALL (QCDR |tx|)
                                                 (SPADCALL |coef| (QCDR |ty|)
                                                           (QREFELT $ 44))
                                                 (QREFELT $ 47)))
                                 (COND
                                  ((NULL (SPADCALL |newcoef| (QREFELT $ 37)))
                                   (SEQ
                                    (PROGN (RPLACD |tx| |newcoef|) (QCDR |tx|))
                                    (EXIT (LETT |newcell| |p1|)))))
                                 (LETT |p1| (CDR |p1|))
                                 (EXIT (LETT |p2| (CDR |p2|)))))
                               ((|less_SI| |exy| (QCAR |tx|))
                                (SEQ (LETT |newcell| |p1|)
                                     (EXIT (LETT |p1| (CDR |p1|)))))
                               ('T
                                (SEQ
                                 (LETT |newcoef|
                                       (SPADCALL |coef| (QCDR |ty|)
                                                 (QREFELT $ 44)))
                                 (COND
                                  ((OR (QREFELT $ 42)
                                       (NULL
                                        (SPADCALL |newcoef| (QREFELT $ 37))))
                                   (SEQ (LETT |ttt| (CONS |exy| |newcoef|))
                                        (EXIT
                                         (LETT |newcell| (CONS |ttt| NIL)))))
                                  ('T (LETT |newcell| NIL)))
                                 (EXIT (LETT |p2| (CDR |p2|))))))
                              (EXIT
                               (COND
                                ((NULL (NULL |newcell|))
                                 (COND
                                  ((NULL |res|)
                                   (SEQ (LETT |res| |newcell|)
                                        (EXIT (LETT |endcell| |res|))))
                                  ('T
                                   (SEQ (RPLACD |endcell| |newcell|)
                                        (EXIT
                                         (LETT |endcell| |newcell|)))))))))
                         NIL (GO G190) G191 (EXIT NIL))))
              (COND
               ((NULL |p1|) (LETT |newcell| (|PR;times| |coef| |exp| |p2| $)))
               (#3='T (LETT |newcell| |p1|)))
              (EXIT
               (COND ((NULL |res|) |newcell|)
                     (#3# (SEQ (RPLACD |endcell| |newcell|) (EXIT |res|)))))))) 

(SDEFUN |PR;*;3$;20| ((|p1| $) (|p2| $) ($ $))
        (SPROG
         ((|res| (|Rep|)) (#1=#:G586 NIL) (|tx| NIL) (#2=#:G585 NIL)
          (|xx| (|Rep|)) (|degy| (E)) (|degx| (E)) (|#G63| ($)) (|#G62| ($))
          (|yy| (|Rep|)) (|#G61| (|Rep|)) (|#G60| (|Rep|))
          (|ly| #3=(|NonNegativeInteger|)) (|lx| #3#))
         (SEQ (LETT |xx| |p1|)
              (EXIT
               (COND ((NULL |xx|) |p1|)
                     (#4='T
                      (SEQ (LETT |yy| |p2|)
                           (EXIT
                            (COND ((NULL |yy|) |p2|)
                                  (#4#
                                   (SEQ
                                    (COND
                                     ((QREFELT $ 9)
                                      (SEQ (LETT |lx| (LENGTH |xx|))
                                           (LETT |ly| (LENGTH |yy|))
                                           (EXIT
                                            (COND
                                             ((< |ly| |lx|)
                                              (SEQ
                                               (PROGN
                                                (LETT |#G60| |yy|)
                                                (LETT |#G61| |xx|)
                                                (LETT |xx| |#G60|)
                                                (LETT |yy| |#G61|))
                                               (EXIT
                                                (PROGN
                                                 (LETT |#G62| |p2|)
                                                 (LETT |#G63| |p1|)
                                                 (LETT |p1| |#G62|)
                                                 (LETT |p2| |#G63|))))))))))
                                    (LETT |degx| (QCAR (|SPADfirst| |xx|)))
                                    (LETT |degy| (QCAR (|SPADfirst| |yy|)))
                                    (EXIT
                                     (COND
                                      ((ZEROP |degx|)
                                       (SPADCALL (QCDR (|SPADfirst| |xx|)) |p2|
                                                 (QREFELT $ 49)))
                                      ((ZEROP |degy|)
                                       (SPADCALL |p1| (QCDR (|SPADfirst| |yy|))
                                                 (QREFELT $ 50)))
                                      (#4#
                                       (SEQ (LETT |xx| (REVERSE |xx|))
                                            (LETT |res| NIL)
                                            (COND
                                             ((< (+ |degx| |degy|)
                                                 MOST-POSITIVE-FIXNUM)
                                              (SEQ (LETT |tx| NIL)
                                                   (LETT #2# |xx|) G190
                                                   (COND
                                                    ((OR (ATOM #2#)
                                                         (PROGN
                                                          (LETT |tx| (CAR #2#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT |res|
                                                           (|PR;addms!| |res|
                                                            (QCDR |tx|)
                                                            (QCAR |tx|) |yy|
                                                            $))))
                                                   (LETT #2# (CDR #2#))
                                                   (GO G190) G191 (EXIT NIL)))
                                             (#4#
                                              (SEQ (LETT |tx| NIL)
                                                   (LETT #1# |xx|) G190
                                                   (COND
                                                    ((OR (ATOM #1#)
                                                         (PROGN
                                                          (LETT |tx| (CAR #1#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT |res|
                                                           (|PR;addm!| |res|
                                                            (QCDR |tx|)
                                                            (QCAR |tx|) |yy|
                                                            $))))
                                                   (LETT #1# (CDR #1#))
                                                   (GO G190) G191 (EXIT NIL))))
                                            (EXIT |res|)))))))))))))))) 

(SDEFUN |PR;*;3$;21| ((|p1| $) (|p2| $) ($ $))
        (SPROG
         ((|res| (|Rep|)) (#1=#:G594 NIL) (|tx| NIL) (|xx| (|Rep|))
          (|yy| (|Rep|)))
         (SEQ (LETT |xx| |p1|)
              (EXIT
               (COND ((NULL |xx|) |p1|)
                     (#2='T
                      (SEQ (LETT |yy| |p2|)
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
                                  (#2#
                                   (SEQ (LETT |xx| (REVERSE |xx|))
                                        (LETT |res| NIL)
                                        (SEQ (LETT |tx| NIL) (LETT #1# |xx|)
                                             G190
                                             (COND
                                              ((OR (ATOM #1#)
                                                   (PROGN
                                                    (LETT |tx| (CAR #1#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |res|
                                                     (|PR;addm!| |res|
                                                      (QCDR |tx|) (QCAR |tx|)
                                                      |yy| $))))
                                             (LETT #1# (CDR #1#)) (GO G190)
                                             G191 (EXIT NIL))
                                        (EXIT |res|)))))))))))) 

(SDEFUN |PR;^;$Pi$;22| ((|p| $) (|np| |PositiveInteger|) ($ $))
        (SPADCALL |p| |np| (QREFELT $ 52))) 

(SDEFUN |PR;^;$Nni$;23| ((|p| $) (|nn| |NonNegativeInteger|) ($ $))
        (SPROG ((|cc| (R)))
               (COND ((ZEROP |nn|) (|spadConstant| $ 12))
                     ((NULL |p|) (|spadConstant| $ 22)) ((EQL |nn| 1) |p|)
                     (#1='T
                      (COND
                       ((NULL (CDR |p|))
                        (COND
                         ((SPADCALL
                           (LETT |cc|
                                 (SPADCALL (QCDR (|SPADfirst| |p|)) |nn|
                                           (QREFELT $ 55)))
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

(SDEFUN |PR;/;$R$;24| ((|x| $) (|r| R) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 58)) |x| (QREFELT $ 49))) 

(SDEFUN |PR;unitNormal;$R;25|
        ((|p| $)
         ($ |Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $)))
        (SPROG ((|a| (R)) (#1=#:G608 NIL) (|lcf| (R)) (|#G1| (R)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((NULL |p|)
                    (EXIT
                     (VECTOR (|spadConstant| $ 12) |p| (|spadConstant| $ 12))))
                   ('T
                    (SEQ (LETT |#G1| (QCDR (|SPADfirst| |p|)))
                         (LETT |lcf| |#G1|)
                         (EXIT
                          (COND
                           ((SPADCALL |#G1| (|spadConstant| $ 11)
                                      (QREFELT $ 60))
                            (PROGN
                             (LETT #1#
                                   (VECTOR (|spadConstant| $ 12) |p|
                                           (|spadConstant| $ 12)))
                             (GO #2=#:G605))))))))
                  (LETT |a| (SPADCALL |lcf| (QREFELT $ 58)))
                  (EXIT
                   (VECTOR (SPADCALL |lcf| (QREFELT $ 35))
                           (CONS
                            (CONS (QCAR (|SPADfirst| |p|))
                                  (|spadConstant| $ 11))
                            (SPADCALL |a| (CDR |p|) (QREFELT $ 49)))
                           (SPADCALL |a| (QREFELT $ 35))))))
                #2# (EXIT #1#)))) 

(SDEFUN |PR;unitCanonical;2$;26| ((|p| $) ($ $))
        (SPROG ((|a| (R)) (#1=#:G613 NIL) (|lcf| (R)) (|#G2| (R)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND ((NULL |p|) (EXIT |p|))
                        ('T
                         (SEQ (LETT |#G2| (QCDR (|SPADfirst| |p|)))
                              (LETT |lcf| |#G2|)
                              (EXIT
                               (COND
                                ((SPADCALL |#G2| (|spadConstant| $ 11)
                                           (QREFELT $ 60))
                                 (PROGN (LETT #1# |p|) (GO #2=#:G611))))))))
                  (LETT |a| (SPADCALL |lcf| (QREFELT $ 58)))
                  (EXIT
                   (CONS (CONS (QCAR (|SPADfirst| |p|)) (|spadConstant| $ 11))
                         (SPADCALL |a| (CDR |p|) (QREFELT $ 49))))))
                #2# (EXIT #1#)))) 

(SDEFUN |PR;unitNormal;$R;27|
        ((|p| $)
         ($ |Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $)))
        (SPROG
         ((|a| (R)) (|cf| (R)) (|u| (R))
          (|#G81|
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
              (LETT |#G81| (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 64)))
              (LETT |u| (QVELT |#G81| 0))
              (LETT |cf| (QVELT |#G81| 1))
              (LETT |a| (QVELT |#G81| 2))
              |#G81|)
             (EXIT
              (VECTOR (SPADCALL |u| (QREFELT $ 35))
                      (CONS (CONS (QCAR (|SPADfirst| |p|)) |cf|)
                            (SPADCALL |a| (CDR |p|) (QREFELT $ 49)))
                      (SPADCALL |a| (QREFELT $ 35)))))))))) 

(SDEFUN |PR;unitCanonical;2$;28| ((|p| $) ($ $))
        (SPROG
         ((|a| (R)) (|cf| (R)) (|u| (R))
          (|#G83|
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
              (LETT |#G83| (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 64)))
              (LETT |u| (QVELT |#G83| 0))
              (LETT |cf| (QVELT |#G83| 1))
              (LETT |a| (QVELT |#G83| 2))
              |#G83|)
             (EXIT
              (CONS (CONS (QCAR (|SPADfirst| |p|)) |cf|)
                    (SPADCALL |a| (CDR |p|) (QREFELT $ 49)))))))))) 

(SDEFUN |PR;fmecg;$ER2$;29| ((|p1| $) (|e| E) (|r| R) (|p2| $) ($ $))
        (SPROG
         ((|rout| ($)) (|u| (R)) (|e2| (E)) (|c2| (R)) (#1=#:G636 NIL)
          (|tm| NIL))
         (SEQ (LETT |rout| NIL) (LETT |r| (SPADCALL |r| (QREFELT $ 65)))
              (SEQ (LETT |tm| NIL) (LETT #1# |p2|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |tm| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |c2| (SPADCALL |r| (QCDR |tm|) (QREFELT $ 44)))
                        (EXIT
                         (COND
                          ((SPADCALL |c2| (|spadConstant| $ 20) (QREFELT $ 60))
                           "iterate")
                          ('T
                           (SEQ
                            (LETT |e2|
                                  (SPADCALL |e| (QCAR |tm|) (QREFELT $ 43)))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |p1|) NIL)
                                          ('T
                                           (SPADCALL (QCAR (|SPADfirst| |p1|))
                                                     |e2| (QREFELT $ 32)))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |rout|
                                        (CONS (|SPADfirst| |p1|) |rout|))
                                  (EXIT (LETT |p1| (CDR |p1|))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (COND
                             ((OR (NULL |p1|)
                                  (SPADCALL (QCAR (|SPADfirst| |p1|)) |e2|
                                            (QREFELT $ 31)))
                              (EXIT
                               (LETT |rout| (CONS (CONS |e2| |c2|) |rout|)))))
                            (COND
                             ((SPADCALL
                               (LETT |u|
                                     (SPADCALL (QCDR (|SPADfirst| |p1|)) |c2|
                                               (QREFELT $ 47)))
                               (|spadConstant| $ 20) (QREFELT $ 66))
                              (LETT |rout| (CONS (CONS |e2| |u|) |rout|))))
                            (EXIT (LETT |p1| (CDR |p1|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (NREVERSE |rout|) |p1| (QREFELT $ 67)))))) 

(SDEFUN |PR;associates?;2$B;30| ((|p1| $) (|p2| $) ($ |Boolean|))
        (SPROG ((#1=#:G638 NIL))
               (COND ((NULL |p1|) (NULL |p2|))
                     ((OR
                       (OR (NULL |p2|)
                           (NULL
                            (SPADCALL (QCAR (|SPADfirst| |p1|))
                                      (QCAR (|SPADfirst| |p2|))
                                      (QREFELT $ 30))))
                       (NULL
                        (SPADCALL (QCDR (|SPADfirst| |p1|))
                                  (QCDR (|SPADfirst| |p2|)) (QREFELT $ 69))))
                      NIL)
                     ('T
                      (SPADCALL
                       (SPADCALL
                        (PROG2
                            (LETT #1#
                                  (SPADCALL (QCDR (|SPADfirst| |p2|))
                                            (QCDR (|SPADfirst| |p1|))
                                            (QREFELT $ 70)))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                          (|Union| (QREFELT $ 6) "failed")
                                          #1#))
                        (CDR |p1|) (QREFELT $ 49))
                       (CDR |p2|) (QREFELT $ 71)))))) 

(SDEFUN |PR;exquo;$RU;31| ((|p| $) (|r| R) ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G654 NIL) (|a| (|Union| R "failed")) (#2=#:G656 NIL) (|tm| NIL)
          (#3=#:G655 NIL))
         (SEQ
          (EXIT
           (CONS 0
                 (PROGN
                  (LETT #3# NIL)
                  (SEQ (LETT |tm| NIL) (LETT #2# |p|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |tm| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #3#
                               (CONS
                                (SEQ
                                 (LETT |a|
                                       (SPADCALL (QCDR |tm|) |r|
                                                 (QREFELT $ 70)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |a| 1)
                                    (PROGN
                                     (LETT #1# (CONS 1 "failed"))
                                     (GO #4=#:G653)))
                                   ('T (CONS (QCAR |tm|) (QCDR |a|))))))
                                #3#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #3#))))))
          #4# (EXIT #1#)))) 

(SDEFUN |PR;exquo;2$U;32| ((|p1| $) (|p2| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((|rout| ($)) (#2=#:G674 NIL) (|ee| (|Union| E "failed"))
          (|a| (|Union| R #1#)))
         (SEQ
          (EXIT
           (COND ((NULL |p2|) (|error| "Division by 0"))
                 ((SPADCALL |p2| (|spadConstant| $ 12) (QREFELT $ 71))
                  (CONS 0 |p1|))
                 ((SPADCALL |p1| |p2| (QREFELT $ 71))
                  (CONS 0 (|spadConstant| $ 12)))
                 (#3='T
                  (SEQ (LETT |rout| NIL)
                       (SEQ G190 (COND ((NULL (NULL (NULL |p1|))) (GO G191)))
                            (SEQ
                             (LETT |a|
                                   (SPADCALL (QCDR (|SPADfirst| |p1|))
                                             (QCDR (|SPADfirst| |p2|))
                                             (QREFELT $ 70)))
                             (EXIT
                              (COND
                               ((QEQCAR |a| 1)
                                (PROGN
                                 (LETT #2# (CONS 1 "failed"))
                                 (GO #4=#:G673)))
                               ('T
                                (SEQ
                                 (LETT |ee|
                                       (SPADCALL (QCAR (|SPADfirst| |p1|))
                                                 (QCAR (|SPADfirst| |p2|))
                                                 (QREFELT $ 74)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ee| 1)
                                    (PROGN
                                     (LETT #2# (CONS 1 "failed"))
                                     (GO #4#)))
                                   ('T
                                    (SEQ
                                     (LETT |p1|
                                           (SPADCALL (CDR |p1|) (QCDR |ee|)
                                                     (QCDR |a|) (CDR |p2|)
                                                     (QREFELT $ 68)))
                                     (EXIT
                                      (LETT |rout|
                                            (CONS (CONS (QCDR |ee|) (QCDR |a|))
                                                  |rout|))))))))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (COND ((NULL |p1|) (CONS 0 (NREVERSE |rout|)))
                              (#3# (CONS 1 "failed"))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |PR;exquo;2$U;33| ((|p1| $) (|p2| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((|rout| ($)) (#2=#:G692 NIL) (|ee| (|Union| E "failed"))
          (|a| (|Union| R #1#)))
         (SEQ
          (EXIT
           (COND ((NULL |p2|) (|error| "Division by 0"))
                 ((SPADCALL |p2| (|spadConstant| $ 12) (QREFELT $ 71))
                  (CONS 0 |p1|))
                 (#3='T
                  (SEQ (LETT |rout| NIL)
                       (SEQ G190 (COND ((NULL (NULL (NULL |p1|))) (GO G191)))
                            (SEQ
                             (LETT |a|
                                   (SPADCALL (QCDR (|SPADfirst| |p1|))
                                             (QCDR (|SPADfirst| |p2|))
                                             (QREFELT $ 70)))
                             (EXIT
                              (COND
                               ((QEQCAR |a| 1)
                                (PROGN
                                 (LETT #2# (CONS 1 "failed"))
                                 (GO #4=#:G691)))
                               ('T
                                (SEQ
                                 (LETT |ee|
                                       (SPADCALL (QCAR (|SPADfirst| |p1|))
                                                 (QCAR (|SPADfirst| |p2|))
                                                 (QREFELT $ 74)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ee| 1)
                                    (PROGN
                                     (LETT #2# (CONS 1 "failed"))
                                     (GO #4#)))
                                   ('T
                                    (SEQ
                                     (LETT |p1|
                                           (SPADCALL (CDR |p1|) (QCDR |ee|)
                                                     (QCDR |a|) (CDR |p2|)
                                                     (QREFELT $ 68)))
                                     (EXIT
                                      (LETT |rout|
                                            (CONS (CONS (QCDR |ee|) (QCDR |a|))
                                                  |rout|))))))))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (COND ((NULL |p1|) (CONS 0 (NREVERSE |rout|)))
                              (#3# (CONS 1 "failed"))))))))
          #4# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |PolynomialRing;|)) 

(DEFUN |PolynomialRing| (&REST #1=#:G704)
  (SPROG NIL
         (PROG (#2=#:G705)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialRing|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PolynomialRing;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PolynomialRing|)))))))))) 

(DEFUN |PolynomialRing;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G701 NIL) (#2=#:G702 NIL) (#3=#:G703 NIL) ($ NIL)
    (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|PolynomialRing| DV$1 DV$2))
    (LETT $ (GETREFV 86))
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
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (LETT #2#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #3#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #2#)
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
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         #1#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #1#)))))
    (|haddProp| |$ConstructorCache| '|PolynomialRing| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND
     (OR (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 4194304))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 8388608))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 16777216))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         #2#)
     (|augmentPredVector| $ 33554432))
    (AND
     (OR (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 67108864))
    (AND
     (OR (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         #2#)
     (|augmentPredVector| $ 134217728))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR #1# (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 1073741824))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|List| (|Record| (|:| |k| |#2|) (|:| |c| |#1|))))
    (QSETREFV $ 9 (|HasCategory| |#1| '(|CommutativeRing|)))
    (COND
     ((|HasCategory| |#1| '(|Monoid|))
      (QSETREFV $ 12
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |PR;One;$;1|) $ 12)))))
    (COND
     ((|testBitVector| |pv$| 10)
      (QSETREFV $ 15 (CONS (|dispatchFunction| |PR;characteristic;Nni;2|) $))))
    (COND
     ((|domainEqual| |#2| (|NonNegativeInteger|))
      (QSETREFV $ 29 (CONS (|dispatchFunction| |PR;coefficient;$ER;9|) $)))
     ('T
      (QSETREFV $ 29 (CONS (|dispatchFunction| |PR;coefficient;$ER;10|) $))))
    (COND
     ((|testBitVector| |pv$| 10)
      (QSETREFV $ 40 (CONS (|dispatchFunction| |PR;coerce;I$;13|) $))))
    (QSETREFV $ 42 (|HasCategory| |#1| '(|noZeroDivisors|)))
    (COND
     ((|domainEqual| |#2| (|NonNegativeInteger|))
      (PROGN (QSETREFV $ 51 (CONS (|dispatchFunction| |PR;*;3$;20|) $))))
     ('T (QSETREFV $ 51 (CONS (|dispatchFunction| |PR;*;3$;21|) $))))
    (COND
     ((|testBitVector| |pv$| 24)
      (PROGN
       (QSETREFV $ 54
                 (CONS (|dispatchFunction| |PR;^;$Pi$;22|)
                       (|getDomainView| $ '(|CommutativeRing|))))
       (QSETREFV $ 52
                 (CONS (|dispatchFunction| |PR;^;$Nni$;23|)
                       (|getDomainView| $ '(|CommutativeRing|)))))))
    (COND
     ((|testBitVector| |pv$| 16)
      (PROGN
       (QSETREFV $ 59 (CONS (|dispatchFunction| |PR;/;$R$;24|) $))
       (QSETREFV $ 62 (CONS (|dispatchFunction| |PR;unitNormal;$R;25|) $))
       (QSETREFV $ 63 (CONS (|dispatchFunction| |PR;unitCanonical;2$;26|) $))))
     ((|testBitVector| |pv$| 2)
      (PROGN
       (QSETREFV $ 62 (CONS (|dispatchFunction| |PR;unitNormal;$R;27|) $))
       (QSETREFV $ 63
                 (CONS (|dispatchFunction| |PR;unitCanonical;2$;28|) $)))))
    (COND
     ((|testBitVector| |pv$| 10)
      (QSETREFV $ 68 (CONS (|dispatchFunction| |PR;fmecg;$ER2$;29|) $))))
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (QSETREFV $ 72 (CONS (|dispatchFunction| |PR;associates?;2$B;30|) $))
       (QSETREFV $ 73 (CONS (|dispatchFunction| |PR;exquo;$RU;31|) $))
       (COND
        ((|HasCategory| |#2| '(|CancellationAbelianMonoid|))
         (COND
          ((|HasCategory| |#1| '(|Approximate|))
           (QSETREFV $ 75 (CONS (|dispatchFunction| |PR;exquo;2$U;32|) $)))
          ('T
           (QSETREFV $ 75
                     (CONS (|dispatchFunction| |PR;exquo;2$U;33|) $)))))))))
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
              (77 . |coerce|) |PR;ground?;$B;14| '|entireRing?| (82 . +)
              (88 . *) (|Mapping| 17 17) (94 . |map|) (100 . +)
              |PR;pomopo!;$RE2$;18| (106 . *) (112 . *) (118 . *) (124 . ^)
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
              275 |subtractIfCan| 280 |smaller?| 286 |sample| 292 |rightRecip|
              296 |rightPower| 301 |retractIfCan| 313 |retract| 328 |reductum|
              343 |recip| 348 |primitivePart| 353 |pomopo!| 358 |opposite?| 366
              |one?| 372 |numberOfMonomials| 377 |monomial?| 382 |monomial| 387
              |minimumDegree| 393 |mapExponents| 398 |map| 404 |leftRecip| 410
              |leftPower| 415 |leadingMonomial| 427 |leadingCoefficient| 432
              |latex| 437 |hashUpdate!| 442 |hash| 448 |ground?| 453 |ground|
              458 |fmecg| 463 |exquo| 471 |degree| 483 |content| 488
              |commutator| 493 |coerce| 499 |coefficients| 524 |coefficient|
              529 |charthRoot| 535 |characteristic| 540 |binomThmExpt| 544
              |associator| 551 |associates?| 558 |antiCommutator| 564
              |annihilate?| 570 ^ 576 |Zero| 588 |One| 592 = 596 / 602 - 608 +
              619 * 625)
           'NIL
           (CONS
            (|makeByteWordVec2| 22
                                '(0 0 2 6 1 6 3 4 5 7 11 11 9 0 1 6 5 0 0 1 10
                                  0 0 0 0 1 1 11 8 22 9 9 0 0 21 9 0 0 14 0 0 6
                                  0 0 0 0 6 10 7 12 13 15))
            (CONS
             '#(|FiniteAbelianMonoidRing&| |AbelianMonoidRing&| NIL NIL
                |Algebra&| |Algebra&| NIL NIL |Algebra&| |EntireRing&| NIL
                |Rng&| NIL NIL |Module&| |Module&| |Module&| NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |Magma&| |AbelianSemiGroup&| NIL |FullyRetractableTo&|
                |SetCategory&| NIL NIL |RetractableTo&| |BasicType&| NIL NIL
                NIL NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|FiniteAbelianMonoidRing| 6 7) (|AbelianMonoidRing| 6 7)
                 (|IntegralDomain|) (|CommutativeRing|) (|Algebra| 76)
                 (|Algebra| $$) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 6) (|EntireRing|) (|Ring|)
                 (|Rng|) (|SemiRing|) (|SemiRng|) (|Module| 76) (|Module| $$)
                 (|Module| 6) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|BiModule| 76 76) (|NonAssociativeRing|) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 76) (|RightModule| 76) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|CommutativeStar|) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| 6) (|BasicType|) (|CoercibleTo| 85)
                 (|TwoSidedRecip|) (|unitsKnown|) (|noZeroDivisors|)
                 (|RetractableTo| 76) (|RetractableTo| 38)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| 85
                                  '(0 7 0 10 0 6 0 11 0 0 0 12 0 6 13 14 0 0 13
                                    15 1 8 17 0 18 0 6 0 20 0 0 0 22 1 7 25 0
                                    26 2 0 6 0 7 29 2 7 25 0 0 30 2 7 25 0 0 31
                                    2 7 25 0 0 32 1 6 33 0 34 1 6 25 0 37 1 6 0
                                    38 39 1 0 0 38 40 2 7 0 0 0 43 2 6 0 0 0 44
                                    2 8 0 45 0 46 2 6 0 0 0 47 2 0 0 6 0 49 2 0
                                    0 0 6 50 2 0 0 0 0 51 2 0 0 0 13 52 2 0 0 0
                                    53 54 2 6 0 0 13 55 2 7 0 13 0 56 3 0 0 0 0
                                    13 57 1 6 0 0 58 2 0 0 0 6 59 2 6 25 0 0 60
                                    1 0 61 0 62 1 0 0 0 63 1 6 61 0 64 1 6 0 0
                                    65 2 6 25 0 0 66 2 8 0 0 0 67 4 0 0 0 7 6 0
                                    68 2 6 25 0 0 69 2 6 33 0 0 70 2 0 25 0 0
                                    71 2 0 25 0 0 72 2 0 33 0 6 73 2 7 33 0 0
                                    74 2 0 33 0 0 75 2 0 25 0 0 1 1 29 25 0 1 1
                                    25 61 0 62 1 25 0 0 63 1 25 25 0 1 2 30 33
                                    0 0 1 2 14 25 0 0 1 0 29 0 1 1 27 33 0 1 2
                                    27 0 0 13 1 2 0 0 0 53 1 1 12 77 0 1 1 13
                                    78 0 1 1 0 27 0 28 1 12 76 0 1 1 13 38 0 1
                                    1 0 6 0 1 1 0 0 0 24 1 27 33 0 36 1 18 0 0
                                    1 4 0 0 0 6 7 0 48 2 29 25 0 0 1 1 27 25 0
                                    1 1 0 13 0 1 1 0 25 0 1 2 0 0 6 7 1 1 0 7 0
                                    19 2 0 0 79 0 1 2 0 0 81 0 1 1 27 33 0 1 2
                                    27 0 0 13 1 2 0 0 0 53 1 1 0 0 0 23 1 0 6 0
                                    21 1 0 82 0 1 2 0 84 84 0 1 1 0 83 0 1 1 0
                                    25 0 41 1 0 6 0 1 4 10 0 0 7 6 0 68 2 25 33
                                    0 0 75 2 7 33 0 6 73 1 0 7 0 16 1 18 6 0 1
                                    2 28 0 0 0 1 1 26 0 38 40 1 23 0 0 1 1 17 0
                                    76 1 1 0 0 6 35 1 0 85 0 1 1 0 80 0 1 2 0 6
                                    0 7 29 1 3 33 0 1 0 28 13 15 3 24 0 0 0 13
                                    57 3 28 0 0 0 0 1 2 25 25 0 0 72 2 0 0 0 0
                                    1 2 28 25 0 0 1 2 27 0 0 13 52 2 0 0 0 53
                                    54 0 29 0 22 0 27 0 12 2 0 25 0 0 71 2 16 0
                                    0 6 59 1 31 0 0 1 2 31 0 0 0 1 2 0 0 0 0 1
                                    2 31 0 38 0 1 2 29 0 13 0 1 2 1 0 76 0 1 2
                                    1 0 0 76 1 2 0 0 0 6 50 2 0 0 6 0 49 2 0 0
                                    0 0 51 2 0 0 53 0 1)))))
           '|lookupComplete|)) 
