
(PUT '|UPXSCONS;getExpon| '|SPADreplace| 'QCAR) 

(SDEFUN |UPXSCONS;getExpon| ((|pxs| $) ($ |Fraction| (|Integer|))) (QCAR |pxs|)) 

(PUT '|UPXSCONS;getULS| '|SPADreplace| 'QCDR) 

(SDEFUN |UPXSCONS;getULS| ((|pxs| $) ($ ULS)) (QCDR |pxs|)) 

(PUT '|UPXSCONS;puiseux;FULS$;3| '|SPADreplace| 'CONS) 

(SDEFUN |UPXSCONS;puiseux;FULS$;3|
        ((|n| |Fraction| (|Integer|)) (|ls| ULS) ($ $)) (CONS |n| |ls|)) 

(SDEFUN |UPXSCONS;laurentRep;$ULS;4| ((|x| $) ($ ULS))
        (|UPXSCONS;getULS| |x| $)) 

(SDEFUN |UPXSCONS;rationalPower;$F;5| ((|x| $) ($ |Fraction| (|Integer|)))
        (|UPXSCONS;getExpon| |x| $)) 

(SDEFUN |UPXSCONS;degree;$F;6| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (|UPXSCONS;getExpon| |x| $)
                  (SPADCALL (|UPXSCONS;getULS| |x| $) (QREFELT $ 14))
                  (QREFELT $ 15))) 

(SDEFUN |UPXSCONS;Zero;$;7| (($ $))
        (SPADCALL (|spadConstant| $ 19) (|spadConstant| $ 20) (QREFELT $ 10))) 

(SDEFUN |UPXSCONS;One;$;8| (($ $))
        (SPADCALL (|spadConstant| $ 19) (|spadConstant| $ 22) (QREFELT $ 10))) 

(SDEFUN |UPXSCONS;monomial;CoefF$;9|
        ((|c| |Coef|) (|k| |Fraction| (|Integer|)) ($ $))
        (COND
         ((SPADCALL |k| (|spadConstant| $ 24) (QREFELT $ 26))
          (SPADCALL |c| (QREFELT $ 27)))
         ((SPADCALL |k| (|spadConstant| $ 24) (QREFELT $ 28))
          (SPADCALL (SPADCALL |k| (QREFELT $ 29))
                    (SPADCALL |c| -1 (QREFELT $ 30)) (QREFELT $ 10)))
         ('T (SPADCALL |k| (SPADCALL |c| 1 (QREFELT $ 30)) (QREFELT $ 10))))) 

(SDEFUN |UPXSCONS;coerce;ULS$;10| ((|ls| ULS) ($ $))
        (SPADCALL (|spadConstant| $ 19) |ls| (QREFELT $ 10))) 

(SDEFUN |UPXSCONS;coerce;Coef$;11| ((|r| |Coef|) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 33)) (QREFELT $ 32))) 

(SDEFUN |UPXSCONS;coerce;I$;12| ((|i| |Integer|) ($ $))
        (SPADCALL (SPADCALL |i| (QREFELT $ 34)) (QREFELT $ 27))) 

(SDEFUN |UPXSCONS;laurentIfCan;$U;13| ((|upxs| $) ($ |Union| ULS "failed"))
        (SPROG ((#1=#:G415 NIL) (|r| (|Fraction| (|Integer|))))
               (SEQ (LETT |r| (|UPXSCONS;getExpon| |upxs| $))
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |r| (QREFELT $ 36)) 1)
                       (CONS 0
                             (SPADCALL (|UPXSCONS;getULS| |upxs| $)
                                       (PROG1
                                           (LETT #1#
                                                 (SPADCALL |r| (QREFELT $ 37)))
                                         (|check_subtype2| (> #1# 0)
                                                           '(|PositiveInteger|)
                                                           '(|Integer|) #1#))
                                       (QREFELT $ 39))))
                      ('T (CONS 1 "failed"))))))) 

(SDEFUN |UPXSCONS;laurent;$ULS;14| ((|upxs| $) ($ ULS))
        (SPROG ((|uls| (|Union| ULS "failed")))
               (SEQ (LETT |uls| (SPADCALL |upxs| (QREFELT $ 41)))
                    (EXIT
                     (COND
                      ((QEQCAR |uls| 1)
                       (|error|
                        "laurent: Puiseux series has fractional powers"))
                      ('T (QCDR |uls|))))))) 

(SDEFUN |UPXSCONS;multExp|
        ((|r| |Fraction| (|Integer|))
         (|lTerm| |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))
         ($ |Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| |Coef|)))
        (CONS (SPADCALL |r| (QCAR |lTerm|) (QREFELT $ 15)) (QCDR |lTerm|))) 

(SDEFUN |UPXSCONS;terms;$S;16|
        ((|upxs| $)
         ($ |Stream|
          (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| |Coef|))))
        (SPROG NIL
               (SPADCALL (CONS #'|UPXSCONS;terms;$S;16!0| (VECTOR $ |upxs|))
                         (SPADCALL (|UPXSCONS;getULS| |upxs| $) (QREFELT $ 45))
                         (QREFELT $ 50)))) 

(SDEFUN |UPXSCONS;terms;$S;16!0| ((|t1| NIL) ($$ NIL))
        (PROG (|upxs| $)
          (LETT |upxs| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN (|UPXSCONS;multExp| (|UPXSCONS;getExpon| |upxs| $) |t1| $))))) 

(SDEFUN |UPXSCONS;clearDen|
        ((|n| |Integer|)
         (|lTerm| |Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| |Coef|))
         ($ |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
        (SPROG ((|int| (|Union| (|Integer|) "failed")))
               (SEQ
                (LETT |int|
                      (SPADCALL (SPADCALL |n| (QCAR |lTerm|) (QREFELT $ 52))
                                (QREFELT $ 54)))
                (EXIT
                 (COND
                  ((QEQCAR |int| 1)
                   (|error| "series: inappropriate denominator"))
                  ('T (CONS (QCDR |int|) (QCDR |lTerm|)))))))) 

(SDEFUN |UPXSCONS;series;NniS$;18|
        ((|n| |NonNegativeInteger|)
         (|stream| |Stream|
          (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| |Coef|)))
         ($ $))
        (SPROG
         ((|str| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))))
         (SEQ
          (LETT |str|
                (SPADCALL (CONS #'|UPXSCONS;series;NniS$;18!0| (VECTOR $ |n|))
                          |stream| (QREFELT $ 57)))
          (EXIT
           (SPADCALL (SPADCALL 1 |n| (QREFELT $ 58))
                     (SPADCALL |str| (QREFELT $ 59)) (QREFELT $ 10)))))) 

(SDEFUN |UPXSCONS;series;NniS$;18!0| ((|t1| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|UPXSCONS;clearDen| |n| |t1| $))))) 

(SDEFUN |UPXSCONS;rewrite| ((|upxs| $) (|m| |PositiveInteger|) ($ $))
        (SPADCALL
         (SPADCALL (|UPXSCONS;getExpon| |upxs| $)
                   (SPADCALL 1 |m| (QREFELT $ 58)) (QREFELT $ 62))
         (SPADCALL (|UPXSCONS;getULS| |upxs| $) |m| (QREFELT $ 39))
         (QREFELT $ 10))) 

(SDEFUN |UPXSCONS;ratGcd|
        ((|r1| |Fraction| (|Integer|)) (|r2| |Fraction| (|Integer|))
         ($ |Fraction| (|Integer|)))
        (SPADCALL
         (GCD (SPADCALL |r1| (QREFELT $ 37)) (SPADCALL |r2| (QREFELT $ 37)))
         (SPADCALL (SPADCALL |r1| (QREFELT $ 36))
                   (SPADCALL |r2| (QREFELT $ 36)) (QREFELT $ 63))
         (QREFELT $ 58))) 

(SDEFUN |UPXSCONS;withNewExpon| ((|upxs| $) (|r| |Fraction| (|Integer|)) ($ $))
        (|UPXSCONS;rewrite| |upxs|
         (SPADCALL (SPADCALL (|UPXSCONS;getExpon| |upxs| $) |r| (QREFELT $ 64))
                   (QREFELT $ 37))
         $)) 

(SDEFUN |UPXSCONS;=;2$B;22| ((|upxs1| $) (|upxs2| $) ($ |Boolean|))
        (SPROG
         ((|m2| #1=(|PositiveInteger|)) (|m1| #1#)
          (|r| (|Fraction| (|Integer|))) (|ls2| (ULS)) (|ls1| (ULS))
          (|r2| #2=(|Fraction| (|Integer|))) (|r1| #2#))
         (SEQ (LETT |r1| (|UPXSCONS;getExpon| |upxs1| $))
              (LETT |r2| (|UPXSCONS;getExpon| |upxs2| $))
              (LETT |ls1| (|UPXSCONS;getULS| |upxs1| $))
              (LETT |ls2| (|UPXSCONS;getULS| |upxs2| $))
              (EXIT
               (COND
                ((SPADCALL |r1| |r2| (QREFELT $ 26))
                 (SPADCALL |ls1| |ls2| (QREFELT $ 65)))
                ('T
                 (SEQ (LETT |r| (|UPXSCONS;ratGcd| |r1| |r2| $))
                      (LETT |m1|
                            (SPADCALL
                             (SPADCALL (|UPXSCONS;getExpon| |upxs1| $) |r|
                                       (QREFELT $ 64))
                             (QREFELT $ 37)))
                      (LETT |m2|
                            (SPADCALL
                             (SPADCALL (|UPXSCONS;getExpon| |upxs2| $) |r|
                                       (QREFELT $ 64))
                             (QREFELT $ 37)))
                      (EXIT
                       (SPADCALL (SPADCALL |ls1| |m1| (QREFELT $ 39))
                                 (SPADCALL |ls2| |m2| (QREFELT $ 39))
                                 (QREFELT $ 65)))))))))) 

(SDEFUN |UPXSCONS;pole?;$B;23| ((|upxs| $) ($ |Boolean|))
        (SPADCALL (|UPXSCONS;getULS| |upxs| $) (QREFELT $ 67))) 

(SDEFUN |UPXSCONS;applyFcn|
        ((|op| |Mapping| ULS ULS ULS) (|pxs1| $) (|pxs2| $) ($ $))
        (SPROG
         ((|m2| #1=(|PositiveInteger|)) (|m1| #1#)
          (|r| (|Fraction| (|Integer|))) (|ls2| (ULS)) (|ls1| (ULS))
          (|r2| #2=(|Fraction| (|Integer|))) (|r1| #2#))
         (SEQ (LETT |r1| (|UPXSCONS;getExpon| |pxs1| $))
              (LETT |r2| (|UPXSCONS;getExpon| |pxs2| $))
              (LETT |ls1| (|UPXSCONS;getULS| |pxs1| $))
              (LETT |ls2| (|UPXSCONS;getULS| |pxs2| $))
              (EXIT
               (COND
                ((SPADCALL |r1| |r2| (QREFELT $ 26))
                 (SPADCALL |r1| (SPADCALL |ls1| |ls2| |op|) (QREFELT $ 10)))
                ('T
                 (SEQ (LETT |r| (|UPXSCONS;ratGcd| |r1| |r2| $))
                      (LETT |m1|
                            (SPADCALL
                             (SPADCALL (|UPXSCONS;getExpon| |pxs1| $) |r|
                                       (QREFELT $ 64))
                             (QREFELT $ 37)))
                      (LETT |m2|
                            (SPADCALL
                             (SPADCALL (|UPXSCONS;getExpon| |pxs2| $) |r|
                                       (QREFELT $ 64))
                             (QREFELT $ 37)))
                      (EXIT
                       (SPADCALL |r|
                                 (SPADCALL (SPADCALL |ls1| |m1| (QREFELT $ 39))
                                           (SPADCALL |ls2| |m2| (QREFELT $ 39))
                                           |op|)
                                 (QREFELT $ 10)))))))))) 

(SDEFUN |UPXSCONS;+;3$;25| ((|pxs1| $) (|pxs2| $) ($ $))
        (|UPXSCONS;applyFcn| (ELT $ 69) |pxs1| |pxs2| $)) 

(SDEFUN |UPXSCONS;-;3$;26| ((|pxs1| $) (|pxs2| $) ($ $))
        (|UPXSCONS;applyFcn| (ELT $ 71) |pxs1| |pxs2| $)) 

(SDEFUN |UPXSCONS;*;3$;27| ((|pxs1| $) (|pxs2| $) ($ $))
        (|UPXSCONS;applyFcn| (ELT $ 73) |pxs1| |pxs2| $)) 

(SDEFUN |UPXSCONS;^;$Nni$;28| ((|pxs| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL (|UPXSCONS;getExpon| |pxs| $)
                  (SPADCALL (|UPXSCONS;getULS| |pxs| $) |n| (QREFELT $ 75))
                  (QREFELT $ 10))) 

(SDEFUN |UPXSCONS;recip;$U;29| ((|pxs| $) ($ |Union| $ #1="failed"))
        (SPROG ((|rec| (|Union| ULS #1#)))
               (SEQ
                (LETT |rec|
                      (SPADCALL (|UPXSCONS;getULS| |pxs| $) (QREFELT $ 78)))
                (EXIT
                 (COND ((QEQCAR |rec| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (|UPXSCONS;getExpon| |pxs| $)
                                        (QCDR |rec|) (QREFELT $ 10))))))))) 

(SDEFUN |UPXSCONS;elt;3$;30| ((|upxs1| $) (|upxs2| $) ($ $))
        (SPROG
         ((|uls2| (ULS)) (|mon| (ULS)) (|c| (|Integer|)) (|b| (|Integer|))
          (|coef| (|Coef|)) (|deg| (|Integer|))
          (|n| (|Union| (|Integer|) "failed"))
          (|r2| #1=(|Fraction| (|Integer|))) (|r1| #1#) (|uls1| (ULS)))
         (SEQ (LETT |uls1| (SPADCALL |upxs1| (QREFELT $ 11)))
              (LETT |uls2| (SPADCALL |upxs2| (QREFELT $ 11)))
              (LETT |r1| (SPADCALL |upxs1| (QREFELT $ 12)))
              (LETT |r2| (SPADCALL |upxs2| (QREFELT $ 12)))
              (LETT |n| (SPADCALL |r1| (QREFELT $ 54)))
              (EXIT
               (COND
                ((QEQCAR |n| 0)
                 (SPADCALL |r2|
                           (SPADCALL |uls1|
                                     (SPADCALL |uls2| |r1| (QREFELT $ 81))
                                     (QREFELT $ 82))
                           (QREFELT $ 10)))
                ((QREFELT $ 80)
                 (SEQ
                  (COND
                   ((SPADCALL
                     (LETT |coef|
                           (SPADCALL |uls2|
                                     (LETT |deg|
                                           (SPADCALL |uls2| (QREFELT $ 14)))
                                     (QREFELT $ 83)))
                     (QREFELT $ 84))
                    (SEQ
                     (LETT |deg|
                           (SPADCALL |uls2| (+ |deg| 1000) (QREFELT $ 85)))
                     (EXIT
                      (COND
                       ((SPADCALL
                         (LETT |coef| (SPADCALL |uls2| |deg| (QREFELT $ 83)))
                         (QREFELT $ 84))
                        (|error|
                         "elt: series with many leading zero coefficients")))))))
                  (LETT |b|
                        (SPADCALL (SPADCALL |r1| (QREFELT $ 36)) |deg|
                                  (QREFELT $ 63)))
                  (LETT |c| (QUOTIENT2 |b| |deg|))
                  (LETT |mon|
                        (SPADCALL (|spadConstant| $ 18) |c| (QREFELT $ 30)))
                  (LETT |uls2|
                        (SPADCALL (SPADCALL |uls2| |mon| (QREFELT $ 82)) |r1|
                                  (QREFELT $ 81)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL |r2| (SPADCALL 1 |c| (QREFELT $ 58))
                              (QREFELT $ 62))
                    (SPADCALL |uls1| |uls2| (QREFELT $ 82)) (QREFELT $ 10)))))
                ('T
                 (|error|
                  "elt: rational powers not available for this coefficient domain"))))))) 

(SDEFUN |UPXSCONS;eval;$CoefS;31| ((|upxs| $) (|a| |Coef|) ($ |Stream| |Coef|))
        (SPADCALL (|UPXSCONS;getULS| |upxs| $)
                  (SPADCALL |a| (|UPXSCONS;getExpon| |upxs| $) (QREFELT $ 87))
                  (QREFELT $ 89))) 

(SDEFUN |UPXSCONS;/;3$;32| ((|pxs1| $) (|pxs2| $) ($ $))
        (|UPXSCONS;applyFcn| (ELT $ 91) |pxs1| |pxs2| $)) 

(SDEFUN |UPXSCONS;inv;2$;33| ((|upxs| $) ($ $))
        (SPROG ((|invUpxs| (|Union| $ "failed")))
               (SEQ (LETT |invUpxs| (SPADCALL |upxs| (QREFELT $ 79)))
                    (EXIT
                     (COND
                      ((QEQCAR |invUpxs| 1)
                       (|error| "inv: multiplicative inverse does not exist"))
                      ('T (QCDR |invUpxs|))))))) 

(SDEFUN |UPXSCONS;variable;$S;34| ((|upxs| $) ($ |Symbol|))
        (SPADCALL (|UPXSCONS;getULS| |upxs| $) (QREFELT $ 95))) 

(SDEFUN |UPXSCONS;center;$Coef;35| ((|upxs| $) ($ |Coef|))
        (SPADCALL (|UPXSCONS;getULS| |upxs| $) (QREFELT $ 97))) 

(SDEFUN |UPXSCONS;coefficient;$FCoef;36|
        ((|upxs| $) (|rn| |Fraction| (|Integer|)) ($ |Coef|))
        (SPROG ((|n| (|Fraction| (|Integer|))))
               (COND
                ((EQL
                  (SPADCALL
                   (LETT |n|
                         (SPADCALL |rn| (|UPXSCONS;getExpon| |upxs| $)
                                   (QREFELT $ 64)))
                   (QREFELT $ 36))
                  1)
                 (SPADCALL (|UPXSCONS;getULS| |upxs| $)
                           (SPADCALL |n| (QREFELT $ 37)) (QREFELT $ 83)))
                ('T (|spadConstant| $ 23))))) 

(SDEFUN |UPXSCONS;elt;$FCoef;37|
        ((|upxs| $) (|rn| |Fraction| (|Integer|)) ($ |Coef|))
        (SPADCALL |upxs| |rn| (QREFELT $ 99))) 

(SDEFUN |UPXSCONS;roundDown| ((|rn| |Fraction| (|Integer|)) ($ |Integer|))
        (SPROG ((|n| (|Integer|)) (|num| (|Integer|)) (|den| (|Integer|)))
               (SEQ (LETT |den| (SPADCALL |rn| (QREFELT $ 36)))
                    (EXIT
                     (COND ((EQL |den| 1) (SPADCALL |rn| (QREFELT $ 37)))
                           (#1='T
                            (SEQ
                             (LETT |n|
                                   (QUOTIENT2
                                    (LETT |num| (SPADCALL |rn| (QREFELT $ 37)))
                                    |den|))
                             (EXIT
                              (COND ((PLUSP |num|) |n|) (#1# (- |n| 1))))))))))) 

(SDEFUN |UPXSCONS;roundUp| ((|rn| |Fraction| (|Integer|)) ($ |Integer|))
        (SPROG ((|n| (|Integer|)) (|num| (|Integer|)) (|den| (|Integer|)))
               (SEQ (LETT |den| (SPADCALL |rn| (QREFELT $ 36)))
                    (EXIT
                     (COND ((EQL |den| 1) (SPADCALL |rn| (QREFELT $ 37)))
                           (#1='T
                            (SEQ
                             (LETT |n|
                                   (QUOTIENT2
                                    (LETT |num| (SPADCALL |rn| (QREFELT $ 37)))
                                    |den|))
                             (EXIT
                              (COND ((PLUSP |num|) (+ |n| 1)) (#1# |n|)))))))))) 

(SDEFUN |UPXSCONS;order;$F;40| ((|upxs| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (|UPXSCONS;getExpon| |upxs| $)
                  (SPADCALL (|UPXSCONS;getULS| |upxs| $) (QREFELT $ 101))
                  (QREFELT $ 15))) 

(SDEFUN |UPXSCONS;order;$2F;41|
        ((|upxs| $) (|r| . #1=(|Fraction| (|Integer|))) ($ . #1#))
        (SPROG
         ((|ord| (|Integer|)) (|n| (|Integer|)) (|e| (|Fraction| (|Integer|))))
         (SEQ (LETT |e| (|UPXSCONS;getExpon| |upxs| $))
              (LETT |ord|
                    (SPADCALL (|UPXSCONS;getULS| |upxs| $)
                              (LETT |n|
                                    (|UPXSCONS;roundDown|
                                     (SPADCALL |r| |e| (QREFELT $ 64)) $))
                              (QREFELT $ 85)))
              (EXIT
               (COND
                ((EQL |ord| |n|)
                 (COND
                  ((SPADCALL
                    (SPADCALL (|UPXSCONS;getULS| |upxs| $) |n| (QREFELT $ 83))
                    (|spadConstant| $ 23) (QREFELT $ 103))
                   |r|)
                  (#2='T (SPADCALL |ord| |e| (QREFELT $ 52)))))
                (#2# (SPADCALL |ord| |e| (QREFELT $ 52)))))))) 

(SDEFUN |UPXSCONS;truncate;$F$;42|
        ((|upxs| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG ((|e| (|Fraction| (|Integer|))))
               (SEQ (LETT |e| (|UPXSCONS;getExpon| |upxs| $))
                    (EXIT
                     (SPADCALL |e|
                               (SPADCALL (|UPXSCONS;getULS| |upxs| $)
                                         (|UPXSCONS;roundDown|
                                          (SPADCALL |r| |e| (QREFELT $ 64)) $)
                                         (QREFELT $ 105))
                               (QREFELT $ 10)))))) 

(SDEFUN |UPXSCONS;truncate;$2F$;43|
        ((|upxs| $) (|r1| . #1=(|Fraction| (|Integer|))) (|r2| . #1#) ($ $))
        (SPROG ((|e| (|Fraction| (|Integer|))))
               (SEQ (LETT |e| (|UPXSCONS;getExpon| |upxs| $))
                    (EXIT
                     (SPADCALL |e|
                               (SPADCALL (|UPXSCONS;getULS| |upxs| $)
                                         (|UPXSCONS;roundUp|
                                          (SPADCALL |r1| |e| (QREFELT $ 64)) $)
                                         (|UPXSCONS;roundDown|
                                          (SPADCALL |r2| |e| (QREFELT $ 64)) $)
                                         (QREFELT $ 107))
                               (QREFELT $ 10)))))) 

(SDEFUN |UPXSCONS;complete;2$;44| ((|upxs| $) ($ $))
        (SPADCALL (|UPXSCONS;getExpon| |upxs| $)
                  (SPADCALL (|UPXSCONS;getULS| |upxs| $) (QREFELT $ 109))
                  (QREFELT $ 10))) 

(SDEFUN |UPXSCONS;extend;$F$;45|
        ((|upxs| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG ((|e| (|Fraction| (|Integer|))))
               (SEQ (LETT |e| (|UPXSCONS;getExpon| |upxs| $))
                    (EXIT
                     (SPADCALL |e|
                               (SPADCALL (|UPXSCONS;getULS| |upxs| $)
                                         (|UPXSCONS;roundDown|
                                          (SPADCALL |r| |e| (QREFELT $ 64)) $)
                                         (QREFELT $ 111))
                               (QREFELT $ 10)))))) 

(SDEFUN |UPXSCONS;map;M2$;46|
        ((|fcn| |Mapping| |Coef| |Coef|) (|upxs| $) ($ $))
        (SPADCALL (|UPXSCONS;getExpon| |upxs| $)
                  (SPADCALL |fcn| (|UPXSCONS;getULS| |upxs| $) (QREFELT $ 114))
                  (QREFELT $ 10))) 

(SDEFUN |UPXSCONS;characteristic;Nni;47| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 116))) 

(SDEFUN |UPXSCONS;multiplyExponents;$F$;48|
        ((|upxs| $) (|n| |Fraction| (|Integer|)) ($ $))
        (SPADCALL (SPADCALL |n| (|UPXSCONS;getExpon| |upxs| $) (QREFELT $ 62))
                  (|UPXSCONS;getULS| |upxs| $) (QREFELT $ 10))) 

(SDEFUN |UPXSCONS;multiplyExponents;$Pi$;49|
        ((|upxs| $) (|n| |PositiveInteger|) ($ $))
        (SPADCALL (SPADCALL |n| (|UPXSCONS;getExpon| |upxs| $) (QREFELT $ 119))
                  (|UPXSCONS;getULS| |upxs| $) (QREFELT $ 10))) 

(SDEFUN |UPXSCONS;differentiate;2$;50| ((|upxs| $) ($ $))
        (SPROG ((|r| (|Fraction| (|Integer|))))
               (SEQ (LETT |r| (|UPXSCONS;getExpon| |upxs| $))
                    (EXIT
                     (SPADCALL
                      (SPADCALL |r|
                                (SPADCALL (|UPXSCONS;getULS| |upxs| $)
                                          (QREFELT $ 121))
                                (QREFELT $ 10))
                      (SPADCALL (SPADCALL |r| (QREFELT $ 122))
                                (SPADCALL |r| (|spadConstant| $ 19)
                                          (QREFELT $ 123))
                                (QREFELT $ 31))
                      (QREFELT $ 74)))))) 

(SDEFUN |UPXSCONS;differentiate;$S$;51| ((|upxs| $) (|s| |Symbol|) ($ $))
        (SPROG ((|dcds| (|Coef|)))
               (SEQ
                (COND
                 ((EQUAL |s| (SPADCALL |upxs| (QREFELT $ 96)))
                  (SPADCALL |upxs| (QREFELT $ 124)))
                 ('T
                  (SEQ
                   (LETT |dcds|
                         (SPADCALL (SPADCALL |upxs| (QREFELT $ 98)) |s|
                                   (QREFELT $ 125)))
                   (EXIT
                    (SPADCALL
                     (SPADCALL
                      (CONS #'|UPXSCONS;differentiate;$S$;51!0| (VECTOR $ |s|))
                      |upxs| (QREFELT $ 115))
                     (SPADCALL |dcds| (SPADCALL |upxs| (QREFELT $ 124))
                               (QREFELT $ 126))
                     (QREFELT $ 72))))))))) 

(SDEFUN |UPXSCONS;differentiate;$S$;51!0| ((|z1| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| |s| (QREFELT $ 125)))))) 

(SDEFUN |UPXSCONS;coerce;F$;52| ((|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 122)) (QREFELT $ 27))) 

(SDEFUN |UPXSCONS;ratInv| ((|r| |Fraction| (|Integer|)) ($ |Coef|))
        (COND ((SPADCALL |r| (QREFELT $ 129)) (|spadConstant| $ 18))
              ('T (SPADCALL (SPADCALL |r| (QREFELT $ 130)) (QREFELT $ 122))))) 

(SDEFUN |UPXSCONS;integrate;2$;54| ((|upxs| $) ($ $))
        (SPROG ((|uls| (ULS)) (|r| (|Fraction| (|Integer|))))
               (SEQ
                (COND
                 ((NULL
                   (SPADCALL
                    (SPADCALL |upxs|
                              (SPADCALL (|spadConstant| $ 19) (QREFELT $ 29))
                              (QREFELT $ 99))
                    (QREFELT $ 84)))
                  (|error| "integrate: series has term of order -1"))
                 ('T
                  (SEQ (LETT |r| (|UPXSCONS;getExpon| |upxs| $))
                       (LETT |uls| (|UPXSCONS;getULS| |upxs| $))
                       (LETT |uls|
                             (SPADCALL
                              (CONS #'|UPXSCONS;integrate;2$;54!0|
                                    (VECTOR $ |r|))
                              |uls| (QREFELT $ 134)))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 19)
                                   (QREFELT $ 31))
                         (SPADCALL |r| |uls| (QREFELT $ 10))
                         (QREFELT $ 74))))))))) 

(SDEFUN |UPXSCONS;integrate;2$;54!0| ((|z1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|UPXSCONS;ratInv|
             (SPADCALL (SPADCALL |z1| |r| (QREFELT $ 52)) (|spadConstant| $ 19)
                       (QREFELT $ 132))
             $))))) 

(SDEFUN |UPXSCONS;integrate;$S$;55| ((|upxs| $) (|s| |Symbol|) ($ $))
        (SPROG NIL
               (COND
                ((EQUAL |s| (SPADCALL |upxs| (QREFELT $ 96)))
                 (SPADCALL |upxs| (QREFELT $ 135)))
                ((NULL
                  (SPADCALL |s|
                            (SPADCALL (SPADCALL |upxs| (QREFELT $ 98))
                                      (QREFELT $ 137))
                            (QREFELT $ 138)))
                 (SPADCALL
                  (CONS #'|UPXSCONS;integrate;$S$;55!0| (VECTOR $ |s|)) |upxs|
                  (QREFELT $ 115)))
                ('T
                 (|error|
                  "integrate: center is a function of variable of integration"))))) 

(SDEFUN |UPXSCONS;integrate;$S$;55!0| ((|z1| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| |s| (QREFELT $ 139)))))) 

(SDEFUN |UPXSCONS;integrateWithOneAnswer|
        ((|f| |Coef|) (|s| |Symbol|) ($ |Coef|))
        (SPROG ((|res| (|Union| |Coef| (|List| |Coef|))))
               (SEQ (LETT |res| (SPADCALL |f| |s| (QREFELT $ 143)))
                    (EXIT
                     (COND ((QEQCAR |res| 0) (QCDR |res|))
                           ('T (|SPADfirst| (QCDR |res|)))))))) 

(SDEFUN |UPXSCONS;integrate;$S$;57| ((|upxs| $) (|s| |Symbol|) ($ $))
        (SPROG NIL
               (COND
                ((EQUAL |s| (SPADCALL |upxs| (QREFELT $ 96)))
                 (SPADCALL |upxs| (QREFELT $ 135)))
                ((NULL
                  (SPADCALL |s|
                            (SPADCALL (SPADCALL |upxs| (QREFELT $ 98))
                                      (QREFELT $ 137))
                            (QREFELT $ 138)))
                 (SPADCALL
                  (CONS #'|UPXSCONS;integrate;$S$;57!0| (VECTOR $ |s|)) |upxs|
                  (QREFELT $ 115)))
                ('T
                 (|error|
                  "integrate: center is a function of variable of integration"))))) 

(SDEFUN |UPXSCONS;integrate;$S$;57!0| ((|z1| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|UPXSCONS;integrateWithOneAnswer| |z1| |s| $))))) 

(SDEFUN |UPXSCONS;^;$F$;58| ((|upxs| $) (|q| |Fraction| (|Integer|)) ($ $))
        (SPROG
         ((|ulsPow| (ULS)) (|coef| (|Coef|)) (|deg| (|Integer|)) (|uls| (ULS))
          (|r| (|Fraction| (|Integer|))) (|den| (|Integer|))
          (|num| (|Integer|)))
         (SEQ (LETT |num| (SPADCALL |q| (QREFELT $ 37)))
              (LETT |den| (SPADCALL |q| (QREFELT $ 36)))
              (EXIT
               (COND ((EQL |den| 1) (SPADCALL |upxs| |num| (QREFELT $ 144)))
                     ('T
                      (SEQ (LETT |r| (SPADCALL |upxs| (QREFELT $ 12)))
                           (LETT |uls| (SPADCALL |upxs| (QREFELT $ 11)))
                           (LETT |deg| (SPADCALL |uls| (QREFELT $ 14)))
                           (COND
                            ((SPADCALL
                              (LETT |coef|
                                    (SPADCALL |uls| |deg| (QREFELT $ 83)))
                              (QREFELT $ 84))
                             (SEQ
                              (LETT |deg|
                                    (SPADCALL |uls| (+ |deg| 1000)
                                              (QREFELT $ 85)))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |coef|
                                        (SPADCALL |uls| |deg| (QREFELT $ 83)))
                                  (QREFELT $ 84))
                                 (|error|
                                  "power of series with many leading zero coefficients")))))))
                           (LETT |ulsPow|
                                 (SPADCALL
                                  (SPADCALL |uls|
                                            (SPADCALL (|spadConstant| $ 18)
                                                      (- |deg|) (QREFELT $ 30))
                                            (QREFELT $ 73))
                                  |q| (QREFELT $ 81)))
                           (EXIT
                            (SPADCALL (SPADCALL |r| |ulsPow| (QREFELT $ 10))
                                      (SPADCALL (|spadConstant| $ 18)
                                                (SPADCALL
                                                 (SPADCALL |deg| |q|
                                                           (QREFELT $ 52))
                                                 |r| (QREFELT $ 62))
                                                (QREFELT $ 31))
                                      (QREFELT $ 74)))))))))) 

(SDEFUN |UPXSCONS;applyUnary| ((|fcn| |Mapping| ULS ULS) (|upxs| $) ($ $))
        (SPADCALL (SPADCALL |upxs| (QREFELT $ 12))
                  (SPADCALL (SPADCALL |upxs| (QREFELT $ 11)) |fcn|)
                  (QREFELT $ 10))) 

(SDEFUN |UPXSCONS;exp;2$;60| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 146) |upxs| $)) 

(SDEFUN |UPXSCONS;log;2$;61| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 148) |upxs| $)) 

(SDEFUN |UPXSCONS;sin;2$;62| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 150) |upxs| $)) 

(SDEFUN |UPXSCONS;cos;2$;63| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 152) |upxs| $)) 

(SDEFUN |UPXSCONS;tan;2$;64| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 154) |upxs| $)) 

(SDEFUN |UPXSCONS;cot;2$;65| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 156) |upxs| $)) 

(SDEFUN |UPXSCONS;sec;2$;66| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 158) |upxs| $)) 

(SDEFUN |UPXSCONS;csc;2$;67| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 160) |upxs| $)) 

(SDEFUN |UPXSCONS;asin;2$;68| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 162) |upxs| $)) 

(SDEFUN |UPXSCONS;acos;2$;69| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 164) |upxs| $)) 

(SDEFUN |UPXSCONS;atan;2$;70| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 166) |upxs| $)) 

(SDEFUN |UPXSCONS;acot;2$;71| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 168) |upxs| $)) 

(SDEFUN |UPXSCONS;asec;2$;72| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 170) |upxs| $)) 

(SDEFUN |UPXSCONS;acsc;2$;73| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 172) |upxs| $)) 

(SDEFUN |UPXSCONS;sinh;2$;74| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 174) |upxs| $)) 

(SDEFUN |UPXSCONS;cosh;2$;75| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 176) |upxs| $)) 

(SDEFUN |UPXSCONS;tanh;2$;76| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 178) |upxs| $)) 

(SDEFUN |UPXSCONS;coth;2$;77| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 180) |upxs| $)) 

(SDEFUN |UPXSCONS;sech;2$;78| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 182) |upxs| $)) 

(SDEFUN |UPXSCONS;csch;2$;79| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 184) |upxs| $)) 

(SDEFUN |UPXSCONS;asinh;2$;80| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 186) |upxs| $)) 

(SDEFUN |UPXSCONS;acosh;2$;81| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 188) |upxs| $)) 

(SDEFUN |UPXSCONS;atanh;2$;82| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 190) |upxs| $)) 

(SDEFUN |UPXSCONS;acoth;2$;83| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 192) |upxs| $)) 

(SDEFUN |UPXSCONS;asech;2$;84| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 194) |upxs| $)) 

(SDEFUN |UPXSCONS;acsch;2$;85| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 196) |upxs| $)) 

(DECLAIM (NOTINLINE |UnivariatePuiseuxSeriesConstructor;|)) 

(DEFUN |UnivariatePuiseuxSeriesConstructor| (&REST #1=#:G641)
  (SPROG NIL
         (PROG (#2=#:G642)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariatePuiseuxSeriesConstructor|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |UnivariatePuiseuxSeriesConstructor;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariatePuiseuxSeriesConstructor|)))))))))) 

(DEFUN |UnivariatePuiseuxSeriesConstructor;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G634 NIL) (#2=#:G635 NIL) (#3=#:G636 NIL) (#4=#:G637 NIL)
    (#5=#:G639 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|UnivariatePuiseuxSeriesConstructor| DV$1 DV$2))
    (LETT $ (GETREFV 214))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|))
                                                               (|devaluate|
                                                                |#1|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| (|Fraction| (|Integer|))
                                                       '(|SemiGroup|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #5#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|)))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|)))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|AlgebraicallyClosedFunctionSpace|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PrimitiveFunctionCategory|))
                                          (|HasCategory| |#1|
                                                         '(|TranscendentalFunctionCategory|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasSignature| |#1|
                                                          (LIST '|integrate|
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Symbol|))))
                                          (|HasSignature| |#1|
                                                          (LIST '|variables|
                                                                (LIST
                                                                 '(|List|
                                                                   (|Symbol|))
                                                                 (|devaluate|
                                                                  |#1|))))))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR #5# (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|)))
                                        (OR #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (LETT #2#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR #2#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5# (|HasCategory| |#1| '(|Field|))
                                         #4# #2#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))))))
    (|haddProp| |$ConstructorCache| '|UnivariatePuiseuxSeriesConstructor|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 67108864))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 134217728))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #3#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #2#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR #1# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 8589934592))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8
              (|Record| (|:| |expon| (|Fraction| (|Integer|)))
                        (|:| |lSeries| |#2|)))
    (QSETREFV $ 80 (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|)))))
    (COND
     ((|HasSignature| |#1|
                      (LIST '^
                            (LIST (|devaluate| |#1|) (|devaluate| |#1|)
                                  '(|Integer|))))
      (COND
       ((|testBitVector| |pv$| 10)
        (QSETREFV $ 90
                  (CONS (|dispatchFunction| |UPXSCONS;eval;$CoefS;31|) $))))))
    (COND
     ((|testBitVector| |pv$| 6)
      (PROGN
       (QSETREFV $ 92 (CONS (|dispatchFunction| |UPXSCONS;/;3$;32|) $))
       (QSETREFV $ 93 (CONS (|dispatchFunction| |UPXSCONS;inv;2$;33|) $)))))
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV $ 124
                 (CONS (|dispatchFunction| |UPXSCONS;differentiate;2$;50|) $))
       (COND
        ((|HasCategory| |#1| '(|PartialDifferentialRing| (|Symbol|)))
         (QSETREFV $ 127
                   (CONS (|dispatchFunction| |UPXSCONS;differentiate;$S$;51|)
                         $)))))))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV $ 128 (CONS (|dispatchFunction| |UPXSCONS;coerce;F$;52|) $))
       NIL
       (QSETREFV $ 135
                 (CONS (|dispatchFunction| |UPXSCONS;integrate;2$;54|) $))
       (COND
        ((|HasSignature| |#1|
                         (LIST '|integrate|
                               (LIST (|devaluate| |#1|) (|devaluate| |#1|)
                                     '(|Symbol|))))
         (COND
          ((|HasSignature| |#1|
                           (LIST '|variables|
                                 (LIST '(|List| (|Symbol|))
                                       (|devaluate| |#1|))))
           (QSETREFV $ 140
                     (CONS (|dispatchFunction| |UPXSCONS;integrate;$S$;55|)
                           $))))))
       (COND
        ((|HasCategory| |#1| '(|TranscendentalFunctionCategory|))
         (COND
          ((|HasCategory| |#1| '(|PrimitiveFunctionCategory|))
           (COND
            ((|HasCategory| |#1|
                            '(|AlgebraicallyClosedFunctionSpace| (|Integer|)))
             (PROGN
              (QSETREFV $ 140
                        (CONS (|dispatchFunction| |UPXSCONS;integrate;$S$;57|)
                              $)))))))))
       (COND
        ((|testBitVector| |pv$| 6)
         (QSETREFV $ 145 (CONS (|dispatchFunction| |UPXSCONS;^;$F$;58|) $))))
       NIL
       (QSETREFV $ 147 (CONS (|dispatchFunction| |UPXSCONS;exp;2$;60|) $))
       (QSETREFV $ 149 (CONS (|dispatchFunction| |UPXSCONS;log;2$;61|) $))
       (QSETREFV $ 151 (CONS (|dispatchFunction| |UPXSCONS;sin;2$;62|) $))
       (QSETREFV $ 153 (CONS (|dispatchFunction| |UPXSCONS;cos;2$;63|) $))
       (QSETREFV $ 155 (CONS (|dispatchFunction| |UPXSCONS;tan;2$;64|) $))
       (QSETREFV $ 157 (CONS (|dispatchFunction| |UPXSCONS;cot;2$;65|) $))
       (QSETREFV $ 159 (CONS (|dispatchFunction| |UPXSCONS;sec;2$;66|) $))
       (QSETREFV $ 161 (CONS (|dispatchFunction| |UPXSCONS;csc;2$;67|) $))
       (QSETREFV $ 163 (CONS (|dispatchFunction| |UPXSCONS;asin;2$;68|) $))
       (QSETREFV $ 165 (CONS (|dispatchFunction| |UPXSCONS;acos;2$;69|) $))
       (QSETREFV $ 167 (CONS (|dispatchFunction| |UPXSCONS;atan;2$;70|) $))
       (QSETREFV $ 169 (CONS (|dispatchFunction| |UPXSCONS;acot;2$;71|) $))
       (QSETREFV $ 171 (CONS (|dispatchFunction| |UPXSCONS;asec;2$;72|) $))
       (QSETREFV $ 173 (CONS (|dispatchFunction| |UPXSCONS;acsc;2$;73|) $))
       (QSETREFV $ 175 (CONS (|dispatchFunction| |UPXSCONS;sinh;2$;74|) $))
       (QSETREFV $ 177 (CONS (|dispatchFunction| |UPXSCONS;cosh;2$;75|) $))
       (QSETREFV $ 179 (CONS (|dispatchFunction| |UPXSCONS;tanh;2$;76|) $))
       (QSETREFV $ 181 (CONS (|dispatchFunction| |UPXSCONS;coth;2$;77|) $))
       (QSETREFV $ 183 (CONS (|dispatchFunction| |UPXSCONS;sech;2$;78|) $))
       (QSETREFV $ 185 (CONS (|dispatchFunction| |UPXSCONS;csch;2$;79|) $))
       (QSETREFV $ 187 (CONS (|dispatchFunction| |UPXSCONS;asinh;2$;80|) $))
       (QSETREFV $ 189 (CONS (|dispatchFunction| |UPXSCONS;acosh;2$;81|) $))
       (QSETREFV $ 191 (CONS (|dispatchFunction| |UPXSCONS;atanh;2$;82|) $))
       (QSETREFV $ 193 (CONS (|dispatchFunction| |UPXSCONS;acoth;2$;83|) $))
       (QSETREFV $ 195 (CONS (|dispatchFunction| |UPXSCONS;asech;2$;84|) $))
       (QSETREFV $ 197 (CONS (|dispatchFunction| |UPXSCONS;acsch;2$;85|) $)))))
    $))) 

(MAKEPROP '|UnivariatePuiseuxSeriesConstructor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Fraction| 13) |UPXSCONS;puiseux;FULS$;3|
              |UPXSCONS;laurentRep;$ULS;4| |UPXSCONS;rationalPower;$F;5|
              (|Integer|) (0 . |degree|) (5 . *) |UPXSCONS;degree;$F;6|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |UPXSCONS;One;$;8|) $))
              (11 . |One|) (15 . |One|) (19 . |Zero|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |UPXSCONS;Zero;$;7|) $))
              (23 . |One|) (27 . |Zero|) (31 . |Zero|) (|Boolean|) (35 . =)
              |UPXSCONS;coerce;Coef$;11| (41 . <) (47 . -) (52 . |monomial|)
              |UPXSCONS;monomial;CoefF$;9| |UPXSCONS;coerce;ULS$;10|
              (58 . |coerce|) (63 . |coerce|) |UPXSCONS;coerce;I$;12|
              (68 . |denom|) (73 . |numer|) (|PositiveInteger|)
              (78 . |multiplyExponents|) (|Union| 7 '"failed")
              |UPXSCONS;laurentIfCan;$U;13| |UPXSCONS;laurent;$ULS;14|
              (|Record| (|:| |k| 13) (|:| |c| 6)) (|Stream| 43) (84 . |terms|)
              (|Record| (|:| |k| 9) (|:| |c| 6)) (|Stream| 46)
              (|Mapping| 46 43) (|StreamFunctions2| 43 46) (89 . |map|)
              |UPXSCONS;terms;$S;16| (95 . *) (|Union| 13 '"failed")
              (101 . |retractIfCan|) (|Mapping| 43 46)
              (|StreamFunctions2| 46 43) (106 . |map|) (112 . /)
              (118 . |series|) (|NonNegativeInteger|)
              |UPXSCONS;series;NniS$;18| (123 . *) (129 . |lcm|) (135 . /)
              (141 . =) |UPXSCONS;=;2$B;22| (147 . |pole?|)
              |UPXSCONS;pole?;$B;23| (152 . +) |UPXSCONS;+;3$;25| (158 . -)
              |UPXSCONS;-;3$;26| (164 . *) |UPXSCONS;*;3$;27| (170 . ^)
              |UPXSCONS;^;$Nni$;28| (|Union| $ '"failed") (176 . |recip|)
              |UPXSCONS;recip;$U;29| 'RATALG (181 . ^) (187 . |elt|)
              (193 . |coefficient|) (199 . |zero?|) (204 . |order|)
              |UPXSCONS;elt;3$;30| (210 . ^) (|Stream| 6) (216 . |eval|)
              (222 . |eval|) (228 . /) (234 . /) (240 . |inv|) (|Symbol|)
              (245 . |variable|) |UPXSCONS;variable;$S;34| (250 . |center|)
              |UPXSCONS;center;$Coef;35| |UPXSCONS;coefficient;$FCoef;36|
              |UPXSCONS;elt;$FCoef;37| (255 . |order|) |UPXSCONS;order;$F;40|
              (260 . =) |UPXSCONS;order;$2F;41| (266 . |truncate|)
              |UPXSCONS;truncate;$F$;42| (272 . |truncate|)
              |UPXSCONS;truncate;$2F$;43| (279 . |complete|)
              |UPXSCONS;complete;2$;44| (284 . |extend|)
              |UPXSCONS;extend;$F$;45| (|Mapping| 6 6) (290 . |map|)
              |UPXSCONS;map;M2$;46| (296 . |characteristic|)
              |UPXSCONS;characteristic;Nni;47|
              |UPXSCONS;multiplyExponents;$F$;48| (300 . *)
              |UPXSCONS;multiplyExponents;$Pi$;49| (306 . |differentiate|)
              (311 . |coerce|) (316 . -) (322 . |differentiate|)
              (327 . |differentiate|) (333 . *) (339 . |differentiate|)
              (345 . |coerce|) (350 . |zero?|) (355 . |inv|) (360 . -)
              (365 . +) (|Mapping| 6 13) (371 . |multiplyCoefficients|)
              (377 . |integrate|) (|List| 94) (382 . |variables|)
              (387 . |entry?|) (393 . |integrate|) (399 . |integrate|)
              (|Union| 6 (|List| 6)) (|FunctionSpaceIntegration| 13 6)
              (405 . |integrate|) (411 . ^) (417 . ^) (423 . |exp|)
              (428 . |exp|) (433 . |log|) (438 . |log|) (443 . |sin|)
              (448 . |sin|) (453 . |cos|) (458 . |cos|) (463 . |tan|)
              (468 . |tan|) (473 . |cot|) (478 . |cot|) (483 . |sec|)
              (488 . |sec|) (493 . |csc|) (498 . |csc|) (503 . |asin|)
              (508 . |asin|) (513 . |acos|) (518 . |acos|) (523 . |atan|)
              (528 . |atan|) (533 . |acot|) (538 . |acot|) (543 . |asec|)
              (548 . |asec|) (553 . |acsc|) (558 . |acsc|) (563 . |sinh|)
              (568 . |sinh|) (573 . |cosh|) (578 . |cosh|) (583 . |tanh|)
              (588 . |tanh|) (593 . |coth|) (598 . |coth|) (603 . |sech|)
              (608 . |sech|) (613 . |csch|) (618 . |csch|) (623 . |asinh|)
              (628 . |asinh|) (633 . |acosh|) (638 . |acosh|) (643 . |atanh|)
              (648 . |atanh|) (653 . |acoth|) (658 . |acoth|) (663 . |asech|)
              (668 . |asech|) (673 . |acsch|) (678 . |acsch|) (|List| 60)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $)
              (|Union| 201 '"failed")
              (|Record| (|:| |coef| 201) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 207 '"failed") (|Factored| $) (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 683 |zero?| 689 |variable| 694 |unitNormal| 699
              |unitCanonical| 704 |unit?| 709 |truncate| 714 |terms| 727 |tanh|
              732 |tan| 737 |subtractIfCan| 742 |squareFreePart| 748
              |squareFree| 753 |sqrt| 758 |sizeLess?| 763 |sinh| 769 |sin| 774
              |series| 779 |sech| 785 |sec| 790 |sample| 795 |rightRecip| 799
              |rightPower| 804 |retractIfCan| 816 |retract| 821 |rem| 826
              |reductum| 832 |recip| 837 |rationalPower| 842 |quo| 847
              |puiseux| 853 |principalIdeal| 859 |prime?| 864 |pole?| 869 |pi|
              874 |order| 878 |opposite?| 889 |one?| 895 |nthRoot| 900
              |multiplyExponents| 906 |multiEuclidean| 918 |monomial?| 924
              |monomial| 929 |map| 935 |log| 941 |leftRecip| 946 |leftPower|
              951 |leadingMonomial| 963 |leadingCoefficient| 968 |lcmCoef| 973
              |lcm| 979 |laurentRep| 990 |laurentIfCan| 995 |laurent| 1000
              |latex| 1005 |inv| 1010 |integrate| 1015 |hashUpdate!| 1026
              |hash| 1032 |gcdPolynomial| 1037 |gcd| 1043 |factor| 1054
              |extendedEuclidean| 1059 |extend| 1072 |exquo| 1078
              |expressIdealMember| 1084 |exp| 1090 |eval| 1095 |euclideanSize|
              1101 |elt| 1106 |divide| 1118 |differentiate| 1124 |degree| 1161
              |csch| 1166 |csc| 1171 |coth| 1176 |cot| 1181 |cosh| 1186 |cos|
              1191 |complete| 1196 |commutator| 1201 |coerce| 1207
              |coefficient| 1237 |charthRoot| 1243 |characteristic| 1248
              |center| 1252 |atanh| 1257 |atan| 1262 |associator| 1267
              |associates?| 1274 |asinh| 1280 |asin| 1285 |asech| 1290 |asec|
              1295 |approximate| 1300 |antiCommutator| 1306 |annihilate?| 1312
              |acsch| 1318 |acsc| 1323 |acoth| 1328 |acot| 1333 |acosh| 1338
              |acos| 1343 ^ 1348 |Zero| 1378 |One| 1382 D 1386 = 1423 / 1429 -
              1441 + 1452 * 1458)
           'NIL
           (CONS
            (|makeByteWordVec2| 26
                                '(0 0 6 0 6 0 6 6 0 6 15 6 14 6 1 2 9 4 3 14 15
                                  7 20 17 20 0 9 14 7 0 0 19 7 0 0 0 0 20 7 7
                                  26 25 17 17 0 0 24 17 0 0 0 14 7 0 0 0 0 5 19
                                  14 15 6 6 7 7 7 7 7 7))
            (CONS
             '#(|UnivariatePuiseuxSeriesConstructorCategory&| NIL |Field&|
                |UnivariatePowerSeriesCategory&| |EuclideanDomain&|
                |PowerSeriesCategory&| NIL |UniqueFactorizationDomain&|
                |AbelianMonoidRing&| |GcdDomain&| NIL NIL NIL |DivisionRing&|
                NIL NIL |Algebra&| |PartialDifferentialRing&|
                |DifferentialRing&| |Algebra&| |EntireRing&| |Algebra&| NIL NIL
                |Rng&| NIL |Module&| |Module&| |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL |AbelianGroup&| NIL NIL NIL |NonAssociativeSemiRng&|
                NIL |AbelianMonoid&| |MagmaWithUnit&| |Magma&|
                |AbelianSemiGroup&| |SetCategory&| NIL
                |TranscendentalFunctionCategory&| |RetractableTo&| NIL
                |BasicType&| NIL NIL NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesConstructorCategory| 6 7)
                 (|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 9) (|EuclideanDomain|)
                 (|PowerSeriesCategory| 6 9 (|SingletonAsOrderedSet|))
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 9) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Algebra| 6)
                 (|PartialDifferentialRing| 94) (|DifferentialRing|)
                 (|Algebra| $$) (|EntireRing|) (|Algebra| 9) (|Ring|)
                 (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 6) (|Module| $$)
                 (|Module| 9) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|BiModule| 9 9) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| 9) (|RightModule| 9)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|CommutativeStar|)
                 (|TranscendentalFunctionCategory|) (|RetractableTo| 7)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 213) (|Eltable| $$ $$) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 213
                                  '(1 7 13 0 14 2 9 0 0 13 15 0 6 0 18 0 9 0 19
                                    0 7 0 20 0 7 0 22 0 6 0 23 0 9 0 24 2 9 25
                                    0 0 26 2 9 25 0 0 28 1 9 0 0 29 2 7 0 6 13
                                    30 1 7 0 6 33 1 6 0 13 34 1 9 13 0 36 1 9
                                    13 0 37 2 7 0 0 38 39 1 7 44 0 45 2 49 47
                                    48 44 50 2 9 0 13 0 52 1 9 53 0 54 2 56 44
                                    55 47 57 2 9 0 13 13 58 1 7 0 44 59 2 9 0 0
                                    9 62 2 13 0 0 0 63 2 9 0 0 0 64 2 7 25 0 0
                                    65 1 7 25 0 67 2 7 0 0 0 69 2 7 0 0 0 71 2
                                    7 0 0 0 73 2 7 0 0 60 75 1 7 77 0 78 2 7 0
                                    0 9 81 2 7 0 0 0 82 2 7 6 0 13 83 1 6 25 0
                                    84 2 7 13 0 13 85 2 6 0 0 9 87 2 7 88 0 6
                                    89 2 0 88 0 6 90 2 7 0 0 0 91 2 0 0 0 0 92
                                    1 0 0 0 93 1 7 94 0 95 1 7 6 0 97 1 7 13 0
                                    101 2 6 25 0 0 103 2 7 0 0 13 105 3 7 0 0
                                    13 13 107 1 7 0 0 109 2 7 0 0 13 111 2 7 0
                                    113 0 114 0 6 60 116 2 9 0 38 0 119 1 7 0 0
                                    121 1 6 0 9 122 2 9 0 0 0 123 1 0 0 0 124 2
                                    6 0 0 94 125 2 0 0 6 0 126 2 0 0 0 94 127 1
                                    0 0 9 128 1 9 25 0 129 1 9 0 0 130 1 0 0 0
                                    131 2 9 0 0 0 132 2 7 0 133 0 134 1 0 0 0
                                    135 1 6 136 0 137 2 136 25 94 0 138 2 6 0 0
                                    94 139 2 0 0 0 94 140 2 142 141 6 94 143 2
                                    0 0 0 13 144 2 0 0 0 9 145 1 7 0 0 146 1 0
                                    0 0 147 1 7 0 0 148 1 0 0 0 149 1 7 0 0 150
                                    1 0 0 0 151 1 7 0 0 152 1 0 0 0 153 1 7 0 0
                                    154 1 0 0 0 155 1 7 0 0 156 1 0 0 0 157 1 7
                                    0 0 158 1 0 0 0 159 1 7 0 0 160 1 0 0 0 161
                                    1 7 0 0 162 1 0 0 0 163 1 7 0 0 164 1 0 0 0
                                    165 1 7 0 0 166 1 0 0 0 167 1 7 0 0 168 1 0
                                    0 0 169 1 7 0 0 170 1 0 0 0 171 1 7 0 0 172
                                    1 0 0 0 173 1 7 0 0 174 1 0 0 0 175 1 7 0 0
                                    176 1 0 0 0 177 1 7 0 0 178 1 0 0 0 179 1 7
                                    0 0 180 1 0 0 0 181 1 7 0 0 182 1 0 0 0 183
                                    1 7 0 0 184 1 0 0 0 185 1 7 0 0 186 1 0 0 0
                                    187 1 7 0 0 188 1 0 0 0 189 1 7 0 0 190 1 0
                                    0 0 191 1 7 0 0 192 1 0 0 0 193 1 7 0 0 194
                                    1 0 0 0 195 1 7 0 0 196 1 0 0 0 197 2 0 25
                                    0 0 1 1 32 25 0 1 1 0 94 0 96 1 28 199 0 1
                                    1 28 0 0 1 1 28 25 0 1 3 0 0 0 9 9 108 2 0
                                    0 0 9 106 1 0 47 0 51 1 7 0 0 179 1 7 0 0
                                    155 2 33 77 0 0 1 1 6 0 0 1 1 6 209 0 1 1 7
                                    0 0 1 2 6 25 0 0 1 1 7 0 0 175 1 7 0 0 151
                                    2 0 0 60 47 61 1 7 0 0 183 1 7 0 0 159 0 32
                                    0 1 1 30 77 0 1 2 30 0 0 60 1 2 0 0 0 38 1
                                    1 0 40 0 1 1 0 7 0 1 2 6 0 0 0 1 1 0 0 0 1
                                    1 30 77 0 79 1 0 9 0 12 2 6 0 0 0 1 2 0 0 9
                                    7 10 1 6 204 201 1 1 6 25 0 1 1 0 25 0 68 0
                                    7 0 1 2 0 9 0 9 104 1 0 9 0 102 2 32 25 0 0
                                    1 1 30 25 0 1 2 7 0 0 13 1 2 0 0 0 9 118 2
                                    0 0 0 38 120 2 6 203 201 0 1 1 0 25 0 1 2 0
                                    0 6 9 31 2 0 0 113 0 115 1 7 0 0 149 1 30
                                    77 0 1 2 30 0 0 60 1 2 0 0 0 38 1 1 0 0 0 1
                                    1 0 6 0 1 2 6 200 0 0 1 1 6 0 201 1 2 6 0 0
                                    0 1 1 0 7 0 11 1 0 40 0 41 1 0 7 0 42 1 0
                                    210 0 1 1 6 0 0 93 2 12 0 0 94 140 1 7 0 0
                                    135 2 0 212 212 0 1 1 0 211 0 1 2 6 202 202
                                    202 1 1 6 0 201 1 2 6 0 0 0 1 1 6 209 0 1 2
                                    6 206 0 0 1 3 6 208 0 0 0 1 2 0 0 0 9 112 2
                                    28 77 0 0 1 2 6 203 201 0 1 1 7 0 0 147 2
                                    10 88 0 6 90 1 6 60 0 1 2 5 0 0 0 86 2 0 6
                                    0 9 100 2 6 205 0 0 1 2 4 0 0 136 1 2 4 0 0
                                    94 127 3 4 0 0 94 60 1 3 4 0 0 136 198 1 1
                                    3 0 0 124 2 3 0 0 60 1 1 0 9 0 16 1 7 0 0
                                    185 1 7 0 0 161 1 7 0 0 181 1 7 0 0 157 1 7
                                    0 0 177 1 7 0 0 153 1 0 0 0 110 2 31 0 0 0
                                    1 1 27 0 6 27 1 29 0 0 1 1 31 0 13 35 1 7 0
                                    9 128 1 0 0 7 32 1 0 213 0 1 2 0 6 0 9 99 1
                                    1 77 0 1 0 31 60 117 1 0 6 0 98 1 7 0 0 191
                                    1 7 0 0 167 3 31 0 0 0 0 1 2 28 25 0 0 1 1
                                    7 0 0 187 1 7 0 0 163 1 7 0 0 195 1 7 0 0
                                    171 2 11 6 0 9 1 2 0 0 0 0 1 2 31 25 0 0 1
                                    1 7 0 0 197 1 7 0 0 173 1 7 0 0 193 1 7 0 0
                                    169 1 7 0 0 189 1 7 0 0 165 2 30 0 0 60 76
                                    2 7 0 0 9 145 2 7 0 0 0 1 2 6 0 0 13 144 2
                                    0 0 0 38 1 0 32 0 21 0 30 0 17 2 4 0 0 94 1
                                    3 4 0 0 94 60 1 2 4 0 0 136 1 3 4 0 0 136
                                    198 1 1 3 0 0 1 2 3 0 0 60 1 2 0 25 0 0 66
                                    2 6 0 0 0 92 2 6 0 0 6 1 2 34 0 0 0 72 1 34
                                    0 0 131 2 0 0 0 0 70 2 34 0 13 0 1 2 32 0
                                    60 0 1 2 7 0 0 9 1 2 7 0 9 0 1 2 0 0 0 6 1
                                    2 0 0 6 0 126 2 0 0 0 0 74 2 0 0 38 0
                                    1)))))
           '|lookupComplete|)) 
