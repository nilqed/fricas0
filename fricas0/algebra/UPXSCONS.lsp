
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
        (SPROG ((#1=#:G732 NIL) (|r| (|Fraction| (|Integer|))))
               (SEQ
                (LETT |r| (|UPXSCONS;getExpon| |upxs| $)
                      . #2=(|UPXSCONS;laurentIfCan;$U;13|))
                (EXIT
                 (COND
                  ((EQL (SPADCALL |r| (QREFELT $ 36)) 1)
                   (CONS 0
                         (SPADCALL (|UPXSCONS;getULS| |upxs| $)
                                   (PROG1
                                       (LETT #1# (SPADCALL |r| (QREFELT $ 37))
                                             . #2#)
                                     (|check_subtype2| (> #1# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #1#))
                                   (QREFELT $ 39))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |UPXSCONS;laurent;$ULS;14| ((|upxs| $) ($ ULS))
        (SPROG ((|uls| (|Union| ULS "failed")))
               (SEQ
                (LETT |uls| (SPADCALL |upxs| (QREFELT $ 41))
                      |UPXSCONS;laurent;$ULS;14|)
                (EXIT
                 (COND
                  ((QEQCAR |uls| 1)
                   (|error| "laurent: Puiseux series has fractional powers"))
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
          (LETT |upxs| (QREFELT $$ 1) . #1=(|UPXSCONS;terms;$S;16|))
          (LETT $ (QREFELT $$ 0) . #1#)
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
                                (QREFELT $ 54))
                      |UPXSCONS;clearDen|)
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
                          |stream| (QREFELT $ 57))
                |UPXSCONS;series;NniS$;18|)
          (EXIT
           (SPADCALL (SPADCALL 1 |n| (QREFELT $ 58))
                     (SPADCALL |str| (QREFELT $ 59)) (QREFELT $ 10)))))) 

(SDEFUN |UPXSCONS;series;NniS$;18!0| ((|t1| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1) . #1=(|UPXSCONS;series;NniS$;18|))
          (LETT $ (QREFELT $$ 0) . #1#)
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
         ((|m2| (|PositiveInteger|)) (|m1| (|PositiveInteger|))
          (|r| (|Fraction| (|Integer|))) (|ls2| (ULS)) (|ls1| (ULS))
          (|r2| #1=(|Fraction| (|Integer|))) (|r1| #1#))
         (SEQ
          (LETT |r1| (|UPXSCONS;getExpon| |upxs1| $)
                . #2=(|UPXSCONS;=;2$B;22|))
          (LETT |r2| (|UPXSCONS;getExpon| |upxs2| $) . #2#)
          (LETT |ls1| (|UPXSCONS;getULS| |upxs1| $) . #2#)
          (LETT |ls2| (|UPXSCONS;getULS| |upxs2| $) . #2#)
          (EXIT
           (COND
            ((SPADCALL |r1| |r2| (QREFELT $ 26))
             (SPADCALL |ls1| |ls2| (QREFELT $ 65)))
            ('T
             (SEQ (LETT |r| (|UPXSCONS;ratGcd| |r1| |r2| $) . #2#)
                  (LETT |m1|
                        (SPADCALL
                         (SPADCALL (|UPXSCONS;getExpon| |upxs1| $) |r|
                                   (QREFELT $ 64))
                         (QREFELT $ 37))
                        . #2#)
                  (LETT |m2|
                        (SPADCALL
                         (SPADCALL (|UPXSCONS;getExpon| |upxs2| $) |r|
                                   (QREFELT $ 64))
                         (QREFELT $ 37))
                        . #2#)
                  (EXIT
                   (SPADCALL (SPADCALL |ls1| |m1| (QREFELT $ 39))
                             (SPADCALL |ls2| |m2| (QREFELT $ 39))
                             (QREFELT $ 65)))))))))) 

(SDEFUN |UPXSCONS;pole?;$B;23| ((|upxs| $) ($ |Boolean|))
        (SPADCALL (|UPXSCONS;getULS| |upxs| $) (QREFELT $ 67))) 

(SDEFUN |UPXSCONS;applyFcn|
        ((|op| |Mapping| ULS ULS ULS) (|pxs1| $) (|pxs2| $) ($ $))
        (SPROG
         ((|m2| (|PositiveInteger|)) (|m1| (|PositiveInteger|))
          (|r| (|Fraction| (|Integer|))) (|ls2| (ULS)) (|ls1| (ULS))
          (|r2| #1=(|Fraction| (|Integer|))) (|r1| #1#))
         (SEQ
          (LETT |r1| (|UPXSCONS;getExpon| |pxs1| $) . #2=(|UPXSCONS;applyFcn|))
          (LETT |r2| (|UPXSCONS;getExpon| |pxs2| $) . #2#)
          (LETT |ls1| (|UPXSCONS;getULS| |pxs1| $) . #2#)
          (LETT |ls2| (|UPXSCONS;getULS| |pxs2| $) . #2#)
          (EXIT
           (COND
            ((SPADCALL |r1| |r2| (QREFELT $ 26))
             (SPADCALL |r1| (SPADCALL |ls1| |ls2| |op|) (QREFELT $ 10)))
            ('T
             (SEQ (LETT |r| (|UPXSCONS;ratGcd| |r1| |r2| $) . #2#)
                  (LETT |m1|
                        (SPADCALL
                         (SPADCALL (|UPXSCONS;getExpon| |pxs1| $) |r|
                                   (QREFELT $ 64))
                         (QREFELT $ 37))
                        . #2#)
                  (LETT |m2|
                        (SPADCALL
                         (SPADCALL (|UPXSCONS;getExpon| |pxs2| $) |r|
                                   (QREFELT $ 64))
                         (QREFELT $ 37))
                        . #2#)
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
                      (SPADCALL (|UPXSCONS;getULS| |pxs| $) (QREFELT $ 78))
                      |UPXSCONS;recip;$U;29|)
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
         (SEQ
          (LETT |uls1| (SPADCALL |upxs1| (QREFELT $ 11))
                . #2=(|UPXSCONS;elt;3$;30|))
          (LETT |uls2| (SPADCALL |upxs2| (QREFELT $ 11)) . #2#)
          (LETT |r1| (SPADCALL |upxs1| (QREFELT $ 12)) . #2#)
          (LETT |r2| (SPADCALL |upxs2| (QREFELT $ 12)) . #2#)
          (LETT |n| (SPADCALL |r1| (QREFELT $ 54)) . #2#)
          (EXIT
           (COND
            ((QEQCAR |n| 0)
             (SPADCALL |r2|
                       (SPADCALL |uls1| (SPADCALL |uls2| |r1| (QREFELT $ 81))
                                 (QREFELT $ 82))
                       (QREFELT $ 10)))
            ((QREFELT $ 80)
             (SEQ
              (COND
               ((SPADCALL
                 (LETT |coef|
                       (SPADCALL |uls2|
                                 (LETT |deg| (SPADCALL |uls2| (QREFELT $ 14))
                                       . #2#)
                                 (QREFELT $ 83))
                       . #2#)
                 (QREFELT $ 84))
                (SEQ
                 (LETT |deg| (SPADCALL |uls2| (+ |deg| 1000) (QREFELT $ 85))
                       . #2#)
                 (EXIT
                  (COND
                   ((SPADCALL
                     (LETT |coef| (SPADCALL |uls2| |deg| (QREFELT $ 83)) . #2#)
                     (QREFELT $ 84))
                    (|error|
                     "elt: series with many leading zero coefficients")))))))
              (LETT |b|
                    (SPADCALL (SPADCALL |r1| (QREFELT $ 36)) |deg|
                              (QREFELT $ 63))
                    . #2#)
              (LETT |c| (QUOTIENT2 |b| |deg|) . #2#)
              (LETT |mon| (SPADCALL (|spadConstant| $ 18) |c| (QREFELT $ 30))
                    . #2#)
              (LETT |uls2|
                    (SPADCALL (SPADCALL |uls2| |mon| (QREFELT $ 82)) |r1|
                              (QREFELT $ 81))
                    . #2#)
              (EXIT
               (SPADCALL
                (SPADCALL |r2| (SPADCALL 1 |c| (QREFELT $ 58)) (QREFELT $ 62))
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
               (SEQ
                (LETT |invUpxs| (SPADCALL |upxs| (QREFELT $ 79))
                      |UPXSCONS;inv;2$;33|)
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
                                   (QREFELT $ 64))
                         |UPXSCONS;coefficient;$FCoef;36|)
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
               (SEQ
                (LETT |den| (SPADCALL |rn| (QREFELT $ 36))
                      . #1=(|UPXSCONS;roundDown|))
                (EXIT
                 (COND ((EQL |den| 1) (SPADCALL |rn| (QREFELT $ 37)))
                       (#2='T
                        (SEQ
                         (LETT |n|
                               (QUOTIENT2
                                (LETT |num| (SPADCALL |rn| (QREFELT $ 37))
                                      . #1#)
                                |den|)
                               . #1#)
                         (EXIT
                          (COND ((SPADCALL |num| (QREFELT $ 101)) |n|)
                                (#2# (- |n| 1))))))))))) 

(SDEFUN |UPXSCONS;roundUp| ((|rn| |Fraction| (|Integer|)) ($ |Integer|))
        (SPROG ((|n| (|Integer|)) (|num| (|Integer|)) (|den| (|Integer|)))
               (SEQ
                (LETT |den| (SPADCALL |rn| (QREFELT $ 36))
                      . #1=(|UPXSCONS;roundUp|))
                (EXIT
                 (COND ((EQL |den| 1) (SPADCALL |rn| (QREFELT $ 37)))
                       (#2='T
                        (SEQ
                         (LETT |n|
                               (QUOTIENT2
                                (LETT |num| (SPADCALL |rn| (QREFELT $ 37))
                                      . #1#)
                                |den|)
                               . #1#)
                         (EXIT
                          (COND ((SPADCALL |num| (QREFELT $ 101)) (+ |n| 1))
                                (#2# |n|)))))))))) 

(SDEFUN |UPXSCONS;order;$F;40| ((|upxs| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (|UPXSCONS;getExpon| |upxs| $)
                  (SPADCALL (|UPXSCONS;getULS| |upxs| $) (QREFELT $ 102))
                  (QREFELT $ 15))) 

(SDEFUN |UPXSCONS;order;$2F;41|
        ((|upxs| $) (|r| . #1=(|Fraction| (|Integer|))) ($ . #1#))
        (SPROG
         ((|ord| (|Integer|)) (|n| (|Integer|)) (|e| (|Fraction| (|Integer|))))
         (SEQ
          (LETT |e| (|UPXSCONS;getExpon| |upxs| $)
                . #2=(|UPXSCONS;order;$2F;41|))
          (LETT |ord|
                (SPADCALL (|UPXSCONS;getULS| |upxs| $)
                          (LETT |n|
                                (|UPXSCONS;roundDown|
                                 (SPADCALL |r| |e| (QREFELT $ 64)) $)
                                . #2#)
                          (QREFELT $ 85))
                . #2#)
          (EXIT
           (COND
            ((EQL |ord| |n|)
             (COND
              ((SPADCALL
                (SPADCALL (|UPXSCONS;getULS| |upxs| $) |n| (QREFELT $ 83))
                (|spadConstant| $ 23) (QREFELT $ 104))
               |r|)
              (#3='T (SPADCALL |ord| |e| (QREFELT $ 52)))))
            (#3# (SPADCALL |ord| |e| (QREFELT $ 52)))))))) 

(SDEFUN |UPXSCONS;truncate;$F$;42|
        ((|upxs| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG ((|e| (|Fraction| (|Integer|))))
               (SEQ
                (LETT |e| (|UPXSCONS;getExpon| |upxs| $)
                      |UPXSCONS;truncate;$F$;42|)
                (EXIT
                 (SPADCALL |e|
                           (SPADCALL (|UPXSCONS;getULS| |upxs| $)
                                     (|UPXSCONS;roundDown|
                                      (SPADCALL |r| |e| (QREFELT $ 64)) $)
                                     (QREFELT $ 106))
                           (QREFELT $ 10)))))) 

(SDEFUN |UPXSCONS;truncate;$2F$;43|
        ((|upxs| $) (|r1| . #1=(|Fraction| (|Integer|))) (|r2| . #1#) ($ $))
        (SPROG ((|e| (|Fraction| (|Integer|))))
               (SEQ
                (LETT |e| (|UPXSCONS;getExpon| |upxs| $)
                      |UPXSCONS;truncate;$2F$;43|)
                (EXIT
                 (SPADCALL |e|
                           (SPADCALL (|UPXSCONS;getULS| |upxs| $)
                                     (|UPXSCONS;roundUp|
                                      (SPADCALL |r1| |e| (QREFELT $ 64)) $)
                                     (|UPXSCONS;roundDown|
                                      (SPADCALL |r2| |e| (QREFELT $ 64)) $)
                                     (QREFELT $ 108))
                           (QREFELT $ 10)))))) 

(SDEFUN |UPXSCONS;complete;2$;44| ((|upxs| $) ($ $))
        (SPADCALL (|UPXSCONS;getExpon| |upxs| $)
                  (SPADCALL (|UPXSCONS;getULS| |upxs| $) (QREFELT $ 110))
                  (QREFELT $ 10))) 

(SDEFUN |UPXSCONS;extend;$F$;45|
        ((|upxs| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG ((|e| (|Fraction| (|Integer|))))
               (SEQ
                (LETT |e| (|UPXSCONS;getExpon| |upxs| $)
                      |UPXSCONS;extend;$F$;45|)
                (EXIT
                 (SPADCALL |e|
                           (SPADCALL (|UPXSCONS;getULS| |upxs| $)
                                     (|UPXSCONS;roundDown|
                                      (SPADCALL |r| |e| (QREFELT $ 64)) $)
                                     (QREFELT $ 112))
                           (QREFELT $ 10)))))) 

(SDEFUN |UPXSCONS;map;M2$;46|
        ((|fcn| |Mapping| |Coef| |Coef|) (|upxs| $) ($ $))
        (SPADCALL (|UPXSCONS;getExpon| |upxs| $)
                  (SPADCALL |fcn| (|UPXSCONS;getULS| |upxs| $) (QREFELT $ 115))
                  (QREFELT $ 10))) 

(SDEFUN |UPXSCONS;characteristic;Nni;47| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 117))) 

(SDEFUN |UPXSCONS;multiplyExponents;$F$;48|
        ((|upxs| $) (|n| |Fraction| (|Integer|)) ($ $))
        (SPADCALL (SPADCALL |n| (|UPXSCONS;getExpon| |upxs| $) (QREFELT $ 62))
                  (|UPXSCONS;getULS| |upxs| $) (QREFELT $ 10))) 

(SDEFUN |UPXSCONS;multiplyExponents;$Pi$;49|
        ((|upxs| $) (|n| |PositiveInteger|) ($ $))
        (SPADCALL (SPADCALL |n| (|UPXSCONS;getExpon| |upxs| $) (QREFELT $ 120))
                  (|UPXSCONS;getULS| |upxs| $) (QREFELT $ 10))) 

(SDEFUN |UPXSCONS;differentiate;2$;50| ((|upxs| $) ($ $))
        (SPROG ((|r| (|Fraction| (|Integer|))))
               (SEQ
                (LETT |r| (|UPXSCONS;getExpon| |upxs| $)
                      |UPXSCONS;differentiate;2$;50|)
                (EXIT
                 (SPADCALL
                  (SPADCALL |r|
                            (SPADCALL (|UPXSCONS;getULS| |upxs| $)
                                      (QREFELT $ 122))
                            (QREFELT $ 10))
                  (SPADCALL (SPADCALL |r| (QREFELT $ 123))
                            (SPADCALL |r| (|spadConstant| $ 19)
                                      (QREFELT $ 124))
                            (QREFELT $ 31))
                  (QREFELT $ 74)))))) 

(SDEFUN |UPXSCONS;differentiate;$S$;51| ((|upxs| $) (|s| |Symbol|) ($ $))
        (SPROG ((|dcds| (|Coef|)))
               (SEQ
                (COND
                 ((EQUAL |s| (SPADCALL |upxs| (QREFELT $ 96)))
                  (SPADCALL |upxs| (QREFELT $ 125)))
                 ('T
                  (SEQ
                   (LETT |dcds|
                         (SPADCALL (SPADCALL |upxs| (QREFELT $ 98)) |s|
                                   (QREFELT $ 126))
                         |UPXSCONS;differentiate;$S$;51|)
                   (EXIT
                    (SPADCALL
                     (SPADCALL
                      (CONS #'|UPXSCONS;differentiate;$S$;51!0| (VECTOR $ |s|))
                      |upxs| (QREFELT $ 116))
                     (SPADCALL |dcds| (SPADCALL |upxs| (QREFELT $ 125))
                               (QREFELT $ 127))
                     (QREFELT $ 72))))))))) 

(SDEFUN |UPXSCONS;differentiate;$S$;51!0| ((|z1| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|UPXSCONS;differentiate;$S$;51|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |s| (QREFELT $ 126)))))) 

(SDEFUN |UPXSCONS;coerce;F$;52| ((|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 123)) (QREFELT $ 27))) 

(SDEFUN |UPXSCONS;ratInv| ((|r| |Fraction| (|Integer|)) ($ |Coef|))
        (COND ((SPADCALL |r| (QREFELT $ 130)) (|spadConstant| $ 18))
              ('T (SPADCALL (SPADCALL |r| (QREFELT $ 131)) (QREFELT $ 123))))) 

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
                  (SEQ
                   (LETT |r| (|UPXSCONS;getExpon| |upxs| $)
                         . #1=(|UPXSCONS;integrate;2$;54|))
                   (LETT |uls| (|UPXSCONS;getULS| |upxs| $) . #1#)
                   (LETT |uls|
                         (SPADCALL
                          (CONS #'|UPXSCONS;integrate;2$;54!0| (VECTOR $ |r|))
                          |uls| (QREFELT $ 135))
                         . #1#)
                   (EXIT
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 19)
                               (QREFELT $ 31))
                     (SPADCALL |r| |uls| (QREFELT $ 10)) (QREFELT $ 74))))))))) 

(SDEFUN |UPXSCONS;integrate;2$;54!0| ((|z1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|UPXSCONS;integrate;2$;54|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|UPXSCONS;ratInv|
             (SPADCALL (SPADCALL |z1| |r| (QREFELT $ 52)) (|spadConstant| $ 19)
                       (QREFELT $ 133))
             $))))) 

(SDEFUN |UPXSCONS;integrate;$S$;55| ((|upxs| $) (|s| |Symbol|) ($ $))
        (SPROG NIL
               (COND
                ((EQUAL |s| (SPADCALL |upxs| (QREFELT $ 96)))
                 (SPADCALL |upxs| (QREFELT $ 136)))
                ((NULL
                  (SPADCALL |s|
                            (SPADCALL (SPADCALL |upxs| (QREFELT $ 98))
                                      (QREFELT $ 138))
                            (QREFELT $ 139)))
                 (SPADCALL
                  (CONS #'|UPXSCONS;integrate;$S$;55!0| (VECTOR $ |s|)) |upxs|
                  (QREFELT $ 116)))
                ('T
                 (|error|
                  "integrate: center is a function of variable of integration"))))) 

(SDEFUN |UPXSCONS;integrate;$S$;55!0| ((|z1| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|UPXSCONS;integrate;$S$;55|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |s| (QREFELT $ 140)))))) 

(SDEFUN |UPXSCONS;integrateWithOneAnswer|
        ((|f| |Coef|) (|s| |Symbol|) ($ |Coef|))
        (SPROG ((|res| (|Union| |Coef| (|List| |Coef|))))
               (SEQ
                (LETT |res| (SPADCALL |f| |s| (QREFELT $ 144))
                      |UPXSCONS;integrateWithOneAnswer|)
                (EXIT
                 (COND ((QEQCAR |res| 0) (QCDR |res|))
                       ('T (|SPADfirst| (QCDR |res|)))))))) 

(SDEFUN |UPXSCONS;integrate;$S$;57| ((|upxs| $) (|s| |Symbol|) ($ $))
        (SPROG NIL
               (COND
                ((EQUAL |s| (SPADCALL |upxs| (QREFELT $ 96)))
                 (SPADCALL |upxs| (QREFELT $ 136)))
                ((NULL
                  (SPADCALL |s|
                            (SPADCALL (SPADCALL |upxs| (QREFELT $ 98))
                                      (QREFELT $ 138))
                            (QREFELT $ 139)))
                 (SPADCALL
                  (CONS #'|UPXSCONS;integrate;$S$;57!0| (VECTOR $ |s|)) |upxs|
                  (QREFELT $ 116)))
                ('T
                 (|error|
                  "integrate: center is a function of variable of integration"))))) 

(SDEFUN |UPXSCONS;integrate;$S$;57!0| ((|z1| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|UPXSCONS;integrate;$S$;57|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|UPXSCONS;integrateWithOneAnswer| |z1| |s| $))))) 

(SDEFUN |UPXSCONS;^;$F$;58| ((|upxs| $) (|q| |Fraction| (|Integer|)) ($ $))
        (SPROG
         ((|ulsPow| (ULS)) (|coef| (|Coef|)) (|deg| (|Integer|)) (|uls| (ULS))
          (|r| (|Fraction| (|Integer|))) (|den| (|Integer|))
          (|num| (|Integer|)))
         (SEQ
          (LETT |num| (SPADCALL |q| (QREFELT $ 37)) . #1=(|UPXSCONS;^;$F$;58|))
          (LETT |den| (SPADCALL |q| (QREFELT $ 36)) . #1#)
          (EXIT
           (COND ((EQL |den| 1) (SPADCALL |upxs| |num| (QREFELT $ 145)))
                 ('T
                  (SEQ (LETT |r| (SPADCALL |upxs| (QREFELT $ 12)) . #1#)
                       (LETT |uls| (SPADCALL |upxs| (QREFELT $ 11)) . #1#)
                       (LETT |deg| (SPADCALL |uls| (QREFELT $ 14)) . #1#)
                       (COND
                        ((SPADCALL
                          (LETT |coef| (SPADCALL |uls| |deg| (QREFELT $ 83))
                                . #1#)
                          (QREFELT $ 84))
                         (SEQ
                          (LETT |deg|
                                (SPADCALL |uls| (+ |deg| 1000) (QREFELT $ 85))
                                . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL
                              (LETT |coef|
                                    (SPADCALL |uls| |deg| (QREFELT $ 83))
                                    . #1#)
                              (QREFELT $ 84))
                             (|error|
                              "power of series with many leading zero coefficients")))))))
                       (LETT |ulsPow|
                             (SPADCALL
                              (SPADCALL |uls|
                                        (SPADCALL (|spadConstant| $ 18)
                                                  (- |deg|) (QREFELT $ 30))
                                        (QREFELT $ 73))
                              |q| (QREFELT $ 81))
                             . #1#)
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
        (|UPXSCONS;applyUnary| (ELT $ 147) |upxs| $)) 

(SDEFUN |UPXSCONS;log;2$;61| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 149) |upxs| $)) 

(SDEFUN |UPXSCONS;sin;2$;62| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 151) |upxs| $)) 

(SDEFUN |UPXSCONS;cos;2$;63| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 153) |upxs| $)) 

(SDEFUN |UPXSCONS;tan;2$;64| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 155) |upxs| $)) 

(SDEFUN |UPXSCONS;cot;2$;65| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 157) |upxs| $)) 

(SDEFUN |UPXSCONS;sec;2$;66| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 159) |upxs| $)) 

(SDEFUN |UPXSCONS;csc;2$;67| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 161) |upxs| $)) 

(SDEFUN |UPXSCONS;asin;2$;68| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 163) |upxs| $)) 

(SDEFUN |UPXSCONS;acos;2$;69| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 165) |upxs| $)) 

(SDEFUN |UPXSCONS;atan;2$;70| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 167) |upxs| $)) 

(SDEFUN |UPXSCONS;acot;2$;71| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 169) |upxs| $)) 

(SDEFUN |UPXSCONS;asec;2$;72| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 171) |upxs| $)) 

(SDEFUN |UPXSCONS;acsc;2$;73| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 173) |upxs| $)) 

(SDEFUN |UPXSCONS;sinh;2$;74| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 175) |upxs| $)) 

(SDEFUN |UPXSCONS;cosh;2$;75| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 177) |upxs| $)) 

(SDEFUN |UPXSCONS;tanh;2$;76| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 179) |upxs| $)) 

(SDEFUN |UPXSCONS;coth;2$;77| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 181) |upxs| $)) 

(SDEFUN |UPXSCONS;sech;2$;78| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 183) |upxs| $)) 

(SDEFUN |UPXSCONS;csch;2$;79| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 185) |upxs| $)) 

(SDEFUN |UPXSCONS;asinh;2$;80| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 187) |upxs| $)) 

(SDEFUN |UPXSCONS;acosh;2$;81| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 189) |upxs| $)) 

(SDEFUN |UPXSCONS;atanh;2$;82| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 191) |upxs| $)) 

(SDEFUN |UPXSCONS;acoth;2$;83| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 193) |upxs| $)) 

(SDEFUN |UPXSCONS;asech;2$;84| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 195) |upxs| $)) 

(SDEFUN |UPXSCONS;acsch;2$;85| ((|upxs| $) ($ $))
        (|UPXSCONS;applyUnary| (ELT $ 197) |upxs| $)) 

(DECLAIM (NOTINLINE |UnivariatePuiseuxSeriesConstructor;|)) 

(DEFUN |UnivariatePuiseuxSeriesConstructor| (&REST #1=#:G989)
  (SPROG NIL
         (PROG (#2=#:G990)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariatePuiseuxSeriesConstructor|)
                                               '|domainEqualList|)
                    . #3=(|UnivariatePuiseuxSeriesConstructor|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |UnivariatePuiseuxSeriesConstructor;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariatePuiseuxSeriesConstructor|)))))))))) 

(DEFUN |UnivariatePuiseuxSeriesConstructor;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G980 NIL) (#2=#:G981 NIL) (#3=#:G982 NIL) (#4=#:G983 NIL)
    (#5=#:G984 NIL) (#6=#:G985 NIL) (#7=#:G987 NIL) ($ NIL) (|dv$| NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #8=(|UnivariatePuiseuxSeriesConstructor|))
    (LETT DV$2 (|devaluate| |#2|) . #8#)
    (LETT |dv$| (LIST '|UnivariatePuiseuxSeriesConstructor| DV$1 DV$2) . #8#)
    (LETT $ (GETREFV 218) . #8#)
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
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #8#)
                                        (OR #7#
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
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #8#)
                                        (OR #7# (|HasCategory| |#1| '(|Field|))
                                            #6#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #6#)
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              . #8#)
                                        (OR #5#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (LETT #4#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #8#)
                                        (OR #4#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #7# (|HasCategory| |#1| '(|Field|))
                                            #6# #4#
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
                                         #7# (|HasCategory| |#1| '(|Field|))
                                         #6# #4#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #8#)
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
                                         #7# (|HasCategory| |#1| '(|Field|))
                                         #6# #4#
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
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #8#)
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
                                         #7# (|HasCategory| |#1| '(|Field|))
                                         #6# #4#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              . #8#)
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
                                         #7# (|HasCategory| |#1| '(|Field|))
                                         #6# #4#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))))
                    . #8#))
    (|haddProp| |$ConstructorCache| '|UnivariatePuiseuxSeriesConstructor|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 134217728))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #5#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #4#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR #3# (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR #2# (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR #1# (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
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
       (QSETREFV $ 125
                 (CONS (|dispatchFunction| |UPXSCONS;differentiate;2$;50|) $))
       (COND
        ((|HasCategory| |#1| '(|PartialDifferentialRing| (|Symbol|)))
         (QSETREFV $ 128
                   (CONS (|dispatchFunction| |UPXSCONS;differentiate;$S$;51|)
                         $)))))))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV $ 129 (CONS (|dispatchFunction| |UPXSCONS;coerce;F$;52|) $))
       NIL
       (QSETREFV $ 136
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
           (QSETREFV $ 141
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
              (QSETREFV $ 141
                        (CONS (|dispatchFunction| |UPXSCONS;integrate;$S$;57|)
                              $)))))))))
       (COND
        ((|testBitVector| |pv$| 6)
         (QSETREFV $ 146 (CONS (|dispatchFunction| |UPXSCONS;^;$F$;58|) $))))
       NIL
       (QSETREFV $ 148 (CONS (|dispatchFunction| |UPXSCONS;exp;2$;60|) $))
       (QSETREFV $ 150 (CONS (|dispatchFunction| |UPXSCONS;log;2$;61|) $))
       (QSETREFV $ 152 (CONS (|dispatchFunction| |UPXSCONS;sin;2$;62|) $))
       (QSETREFV $ 154 (CONS (|dispatchFunction| |UPXSCONS;cos;2$;63|) $))
       (QSETREFV $ 156 (CONS (|dispatchFunction| |UPXSCONS;tan;2$;64|) $))
       (QSETREFV $ 158 (CONS (|dispatchFunction| |UPXSCONS;cot;2$;65|) $))
       (QSETREFV $ 160 (CONS (|dispatchFunction| |UPXSCONS;sec;2$;66|) $))
       (QSETREFV $ 162 (CONS (|dispatchFunction| |UPXSCONS;csc;2$;67|) $))
       (QSETREFV $ 164 (CONS (|dispatchFunction| |UPXSCONS;asin;2$;68|) $))
       (QSETREFV $ 166 (CONS (|dispatchFunction| |UPXSCONS;acos;2$;69|) $))
       (QSETREFV $ 168 (CONS (|dispatchFunction| |UPXSCONS;atan;2$;70|) $))
       (QSETREFV $ 170 (CONS (|dispatchFunction| |UPXSCONS;acot;2$;71|) $))
       (QSETREFV $ 172 (CONS (|dispatchFunction| |UPXSCONS;asec;2$;72|) $))
       (QSETREFV $ 174 (CONS (|dispatchFunction| |UPXSCONS;acsc;2$;73|) $))
       (QSETREFV $ 176 (CONS (|dispatchFunction| |UPXSCONS;sinh;2$;74|) $))
       (QSETREFV $ 178 (CONS (|dispatchFunction| |UPXSCONS;cosh;2$;75|) $))
       (QSETREFV $ 180 (CONS (|dispatchFunction| |UPXSCONS;tanh;2$;76|) $))
       (QSETREFV $ 182 (CONS (|dispatchFunction| |UPXSCONS;coth;2$;77|) $))
       (QSETREFV $ 184 (CONS (|dispatchFunction| |UPXSCONS;sech;2$;78|) $))
       (QSETREFV $ 186 (CONS (|dispatchFunction| |UPXSCONS;csch;2$;79|) $))
       (QSETREFV $ 188 (CONS (|dispatchFunction| |UPXSCONS;asinh;2$;80|) $))
       (QSETREFV $ 190 (CONS (|dispatchFunction| |UPXSCONS;acosh;2$;81|) $))
       (QSETREFV $ 192 (CONS (|dispatchFunction| |UPXSCONS;atanh;2$;82|) $))
       (QSETREFV $ 194 (CONS (|dispatchFunction| |UPXSCONS;acoth;2$;83|) $))
       (QSETREFV $ 196 (CONS (|dispatchFunction| |UPXSCONS;asech;2$;84|) $))
       (QSETREFV $ 198 (CONS (|dispatchFunction| |UPXSCONS;acsch;2$;85|) $)))))
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
              |UPXSCONS;elt;$FCoef;37| (255 . |positive?|) (260 . |order|)
              |UPXSCONS;order;$F;40| (265 . =) |UPXSCONS;order;$2F;41|
              (271 . |truncate|) |UPXSCONS;truncate;$F$;42| (277 . |truncate|)
              |UPXSCONS;truncate;$2F$;43| (284 . |complete|)
              |UPXSCONS;complete;2$;44| (289 . |extend|)
              |UPXSCONS;extend;$F$;45| (|Mapping| 6 6) (295 . |map|)
              |UPXSCONS;map;M2$;46| (301 . |characteristic|)
              |UPXSCONS;characteristic;Nni;47|
              |UPXSCONS;multiplyExponents;$F$;48| (305 . *)
              |UPXSCONS;multiplyExponents;$Pi$;49| (311 . |differentiate|)
              (316 . |coerce|) (321 . -) (327 . |differentiate|)
              (332 . |differentiate|) (338 . *) (344 . |differentiate|)
              (350 . |coerce|) (355 . |zero?|) (360 . |inv|) (365 . -)
              (370 . +) (|Mapping| 6 13) (376 . |multiplyCoefficients|)
              (382 . |integrate|) (|List| 94) (387 . |variables|)
              (392 . |entry?|) (398 . |integrate|) (404 . |integrate|)
              (|Union| 6 (|List| 6)) (|FunctionSpaceIntegration| 13 6)
              (410 . |integrate|) (416 . ^) (422 . ^) (428 . |exp|)
              (433 . |exp|) (438 . |log|) (443 . |log|) (448 . |sin|)
              (453 . |sin|) (458 . |cos|) (463 . |cos|) (468 . |tan|)
              (473 . |tan|) (478 . |cot|) (483 . |cot|) (488 . |sec|)
              (493 . |sec|) (498 . |csc|) (503 . |csc|) (508 . |asin|)
              (513 . |asin|) (518 . |acos|) (523 . |acos|) (528 . |atan|)
              (533 . |atan|) (538 . |acot|) (543 . |acot|) (548 . |asec|)
              (553 . |asec|) (558 . |acsc|) (563 . |acsc|) (568 . |sinh|)
              (573 . |sinh|) (578 . |cosh|) (583 . |cosh|) (588 . |tanh|)
              (593 . |tanh|) (598 . |coth|) (603 . |coth|) (608 . |sech|)
              (613 . |sech|) (618 . |csch|) (623 . |csch|) (628 . |asinh|)
              (633 . |asinh|) (638 . |acosh|) (643 . |acosh|) (648 . |atanh|)
              (653 . |atanh|) (658 . |acoth|) (663 . |acoth|) (668 . |asech|)
              (673 . |asech|) (678 . |acsch|) (683 . |acsch|) (|List| 60)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $)
              (|Union| 202 '"failed")
              (|Record| (|:| |coef| 202) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 207 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|List| 212) (|SingletonAsOrderedSet|) (|List| 9)
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 688 |zero?| 694 |variables| 699 |variable| 704 |unitNormal|
              709 |unitCanonical| 714 |unit?| 719 |truncate| 724 |terms| 737
              |tanh| 742 |tan| 747 |subtractIfCan| 752 |squareFreePart| 758
              |squareFree| 763 |sqrt| 768 |sizeLess?| 773 |sinh| 779 |sin| 784
              |series| 789 |sech| 795 |sec| 800 |sample| 805 |retractIfCan| 809
              |retract| 814 |rem| 819 |reductum| 825 |recip| 830
              |rationalPower| 835 |quo| 840 |puiseux| 846 |principalIdeal| 852
              |prime?| 857 |pole?| 862 |pi| 867 |order| 871 |opposite?| 882
              |one?| 888 |nthRoot| 893 |multiplyExponents| 899 |multiEuclidean|
              911 |monomial?| 917 |monomial| 922 |map| 942 |log| 948
              |leadingMonomial| 953 |leadingCoefficient| 958 |lcmCoef| 963
              |lcm| 969 |laurentRep| 980 |laurentIfCan| 985 |laurent| 990
              |latex| 995 |inv| 1000 |integrate| 1005 |hashUpdate!| 1016 |hash|
              1022 |gcdPolynomial| 1027 |gcd| 1033 |factor| 1044
              |extendedEuclidean| 1049 |extend| 1062 |exquo| 1068
              |expressIdealMember| 1074 |exp| 1080 |eval| 1085 |euclideanSize|
              1091 |elt| 1096 |divide| 1108 |differentiate| 1114 |degree| 1151
              |csch| 1156 |csc| 1161 |coth| 1166 |cot| 1171 |cosh| 1176 |cos|
              1181 |complete| 1186 |coerce| 1191 |coefficient| 1221
              |charthRoot| 1227 |characteristic| 1232 |center| 1236 |atanh|
              1241 |atan| 1246 |associates?| 1251 |asinh| 1257 |asin| 1262
              |asech| 1267 |asec| 1272 |approximate| 1277 |annihilate?| 1283
              |acsch| 1289 |acsc| 1294 |acoth| 1299 |acot| 1304 |acosh| 1309
              |acos| 1314 ^ 1319 |Zero| 1349 |One| 1353 D 1357 = 1394 / 1400 -
              1412 + 1423 * 1429)
           'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 0 6 0 6 0 6 6 0 6 15 6 9 15 6 7 1 2 9 4 3
                                  15 14 15 7 0 14 21 7 0 0 14 20 21 7 7 23 17
                                  25 0 17 27 0 0 0 7 0 0 0 0 5 19 14 15 6 6 7 7
                                  7 7 7 7))
            (CONS
             '#(|UnivariatePuiseuxSeriesConstructorCategory&| NIL |Field&|
                |UnivariatePowerSeriesCategory&| |EuclideanDomain&|
                |PowerSeriesCategory&| NIL |UniqueFactorizationDomain&|
                |AbelianMonoidRing&| |GcdDomain&| NIL |DivisionRing&|
                |Algebra&| |Algebra&| NIL |Algebra&| NIL NIL |Module&|
                |PartialDifferentialRing&| |DifferentialRing&| |Module&| NIL
                |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL NIL NIL NIL
                |Rng&| NIL NIL |AbelianGroup&| NIL NIL NIL |Monoid&|
                |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                |SetCategory&| |TranscendentalFunctionCategory&|
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesConstructorCategory| 6 7)
                 (|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 9) (|EuclideanDomain|)
                 (|PowerSeriesCategory| 6 9 212) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 9)
                 (|GcdDomain|) (|IntegralDomain|) (|DivisionRing|)
                 (|Algebra| 6) (|Algebra| $$) (|LeftOreRing|) (|Algebra| 9)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|PartialDifferentialRing| 94) (|DifferentialRing|)
                 (|Module| $$) (|CommutativeRing|) (|EntireRing|) (|Module| 9)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|Ring|) (|BiModule| 9 9)
                 (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|LeftModule| $$) (|Rng|) (|LeftModule| 9) (|RightModule| 9)
                 (|AbelianGroup|) (|SemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiRng|) (|Monoid|) (|AbelianMonoid|) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|RetractableTo| 7)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 217) (|Eltable| $$ $$) (|unitsKnown|)
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 217
                                  '(1 7 13 0 14 2 9 0 0 13 15 0 6 0 18 0 9 0 19
                                    0 7 0 20 0 7 0 22 0 6 0 23 0 9 0 24 2 9 25
                                    0 0 26 2 9 25 0 0 28 1 9 0 0 29 2 7 0 6 13
                                    30 1 7 0 6 33 1 6 0 13 34 1 9 13 0 36 1 9
                                    13 0 37 2 7 0 0 38 39 1 7 44 0 45 2 49 47
                                    48 44 50 2 9 0 13 0 52 1 9 53 0 54 2 56 44
                                    55 47 57 2 9 0 13 13 58 1 7 0 44 59 2 9 0 0
                                    0 62 2 13 0 0 0 63 2 9 0 0 0 64 2 7 25 0 0
                                    65 1 7 25 0 67 2 7 0 0 0 69 2 7 0 0 0 71 2
                                    7 0 0 0 73 2 7 0 0 60 75 1 7 77 0 78 2 7 0
                                    0 9 81 2 7 0 0 0 82 2 7 6 0 13 83 1 6 25 0
                                    84 2 7 13 0 13 85 2 6 0 0 9 87 2 7 88 0 6
                                    89 2 0 88 0 6 90 2 7 0 0 0 91 2 0 0 0 0 92
                                    1 0 0 0 93 1 7 94 0 95 1 7 6 0 97 1 13 25 0
                                    101 1 7 13 0 102 2 6 25 0 0 104 2 7 0 0 13
                                    106 3 7 0 0 13 13 108 1 7 0 0 110 2 7 0 0
                                    13 112 2 7 0 114 0 115 0 6 60 117 2 9 0 38
                                    0 120 1 7 0 0 122 1 6 0 9 123 2 9 0 0 0 124
                                    1 0 0 0 125 2 6 0 0 94 126 2 0 0 6 0 127 2
                                    0 0 0 94 128 1 0 0 9 129 1 9 25 0 130 1 9 0
                                    0 131 1 0 0 0 132 2 9 0 0 0 133 2 7 0 134 0
                                    135 1 0 0 0 136 1 6 137 0 138 2 137 25 94 0
                                    139 2 6 0 0 94 140 2 0 0 0 94 141 2 143 142
                                    6 94 144 2 0 0 0 13 145 2 0 0 0 9 146 1 7 0
                                    0 147 1 0 0 0 148 1 7 0 0 149 1 0 0 0 150 1
                                    7 0 0 151 1 0 0 0 152 1 7 0 0 153 1 0 0 0
                                    154 1 7 0 0 155 1 0 0 0 156 1 7 0 0 157 1 0
                                    0 0 158 1 7 0 0 159 1 0 0 0 160 1 7 0 0 161
                                    1 0 0 0 162 1 7 0 0 163 1 0 0 0 164 1 7 0 0
                                    165 1 0 0 0 166 1 7 0 0 167 1 0 0 0 168 1 7
                                    0 0 169 1 0 0 0 170 1 7 0 0 171 1 0 0 0 172
                                    1 7 0 0 173 1 0 0 0 174 1 7 0 0 175 1 0 0 0
                                    176 1 7 0 0 177 1 0 0 0 178 1 7 0 0 179 1 0
                                    0 0 180 1 7 0 0 181 1 0 0 0 182 1 7 0 0 183
                                    1 0 0 0 184 1 7 0 0 185 1 0 0 0 186 1 7 0 0
                                    187 1 0 0 0 188 1 7 0 0 189 1 0 0 0 190 1 7
                                    0 0 191 1 0 0 0 192 1 7 0 0 193 1 0 0 0 194
                                    1 7 0 0 195 1 0 0 0 196 1 7 0 0 197 1 0 0 0
                                    198 2 0 25 0 0 1 1 34 25 0 1 1 0 211 0 1 1
                                    0 94 0 96 1 29 200 0 1 1 29 0 0 1 1 29 25 0
                                    1 3 0 0 0 9 9 109 2 0 0 0 9 107 1 0 47 0 51
                                    1 7 0 0 180 1 7 0 0 156 2 33 77 0 0 1 1 6 0
                                    0 1 1 6 210 0 1 1 7 0 0 1 2 6 25 0 0 1 1 7
                                    0 0 176 1 7 0 0 152 2 0 0 60 47 61 1 7 0 0
                                    184 1 7 0 0 160 0 34 0 1 1 0 40 0 1 1 0 7 0
                                    1 2 6 0 0 0 1 1 0 0 0 1 1 30 77 0 79 1 0 9
                                    0 12 2 6 0 0 0 1 2 0 0 9 7 10 1 6 205 202 1
                                    1 6 25 0 1 1 0 25 0 68 0 7 0 1 2 0 9 0 9
                                    105 1 0 9 0 103 2 34 25 0 0 1 1 30 25 0 1 2
                                    7 0 0 13 1 2 0 0 0 9 119 2 0 0 0 38 121 2 6
                                    204 202 0 1 1 0 25 0 1 3 0 0 0 212 9 1 3 0
                                    0 0 211 213 1 2 0 0 6 9 31 2 0 0 114 0 116
                                    1 7 0 0 150 1 0 0 0 1 1 0 6 0 1 2 6 201 0 0
                                    1 2 6 0 0 0 1 1 6 0 202 1 1 0 7 0 11 1 0 40
                                    0 41 1 0 7 0 42 1 0 214 0 1 1 6 0 0 93 2 12
                                    0 0 94 141 1 7 0 0 136 2 0 216 216 0 1 1 0
                                    215 0 1 2 6 203 203 203 1 2 6 0 0 0 1 1 6 0
                                    202 1 1 6 210 0 1 3 6 208 0 0 0 1 2 6 209 0
                                    0 1 2 0 0 0 9 113 2 29 77 0 0 1 2 6 204 202
                                    0 1 1 7 0 0 148 2 10 88 0 6 90 1 6 60 0 1 2
                                    5 0 0 0 86 2 0 6 0 9 100 2 6 206 0 0 1 2 4
                                    0 0 94 128 3 4 0 0 94 60 1 2 4 0 0 137 1 3
                                    4 0 0 137 199 1 1 3 0 0 125 2 3 0 0 60 1 1
                                    0 9 0 16 1 7 0 0 186 1 7 0 0 162 1 7 0 0
                                    182 1 7 0 0 158 1 7 0 0 178 1 7 0 0 154 1 0
                                    0 0 111 1 28 0 6 27 1 31 0 13 35 1 29 0 0 1
                                    1 7 0 9 129 1 0 0 7 32 1 0 217 0 1 2 0 6 0
                                    9 99 1 1 77 0 1 0 31 60 118 1 0 6 0 98 1 7
                                    0 0 192 1 7 0 0 168 2 29 25 0 0 1 1 7 0 0
                                    188 1 7 0 0 164 1 7 0 0 196 1 7 0 0 172 2
                                    11 6 0 9 1 2 31 25 0 0 1 1 7 0 0 198 1 7 0
                                    0 174 1 7 0 0 194 1 7 0 0 170 1 7 0 0 190 1
                                    7 0 0 166 2 30 0 0 60 76 2 7 0 0 9 146 2 7
                                    0 0 0 1 2 6 0 0 13 145 2 0 0 0 38 1 0 34 0
                                    21 0 30 0 17 2 4 0 0 94 1 3 4 0 0 94 60 1 2
                                    4 0 0 137 1 3 4 0 0 137 199 1 1 3 0 0 1 2 3
                                    0 0 60 1 2 0 25 0 0 66 2 6 0 0 0 92 2 6 0 0
                                    6 1 2 32 0 0 0 72 1 32 0 0 132 2 0 0 0 0 70
                                    2 32 0 13 0 1 2 34 0 60 0 1 2 7 0 9 0 1 2 7
                                    0 0 9 1 2 0 0 6 0 127 2 0 0 0 0 74 2 0 0 0
                                    6 1 2 0 0 38 0 1)))))
           '|lookupComplete|)) 
