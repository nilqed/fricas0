
(PUT '|ULSCONS;getExpon| '|SPADreplace| 'QCAR) 

(SDEFUN |ULSCONS;getExpon| ((|x| $) ($ |Integer|)) (QCAR |x|)) 

(PUT '|ULSCONS;getUTS| '|SPADreplace| 'QCDR) 

(SDEFUN |ULSCONS;getUTS| ((|x| $) ($ UTS)) (QCDR |x|)) 

(PUT '|ULSCONS;laurent;IUTS$;3| '|SPADreplace| 'CONS) 

(SDEFUN |ULSCONS;laurent;IUTS$;3| ((|n| |Integer|) (|psr| UTS) ($ $))
        (CONS |n| |psr|)) 

(SDEFUN |ULSCONS;taylorRep;$UTS;4| ((|x| $) ($ UTS)) (|ULSCONS;getUTS| |x| $)) 

(SDEFUN |ULSCONS;degree;$I;5| ((|x| $) ($ |Integer|))
        (|ULSCONS;getExpon| |x| $)) 

(SDEFUN |ULSCONS;Zero;$;6| (($ $))
        (SPADCALL 0 (|spadConstant| $ 15) (QREFELT $ 10))) 

(SDEFUN |ULSCONS;One;$;7| (($ $))
        (SPADCALL 0 (|spadConstant| $ 17) (QREFELT $ 10))) 

(SDEFUN |ULSCONS;monomial;CoefI$;8| ((|s| |Coef|) (|e| |Integer|) ($ $))
        (SPADCALL |e| (SPADCALL |s| (QREFELT $ 18)) (QREFELT $ 10))) 

(SDEFUN |ULSCONS;coerce;UTS$;9| ((|uts| UTS) ($ $))
        (SPADCALL 0 |uts| (QREFELT $ 10))) 

(SDEFUN |ULSCONS;coerce;Coef$;10| ((|r| |Coef|) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 18)) (QREFELT $ 20))) 

(SDEFUN |ULSCONS;coerce;I$;11| ((|i| |Integer|) ($ $))
        (SPADCALL (SPADCALL |i| (QREFELT $ 22)) (QREFELT $ 21))) 

(SDEFUN |ULSCONS;taylorIfCan;$U;12| ((|uls| $) ($ |Union| UTS "failed"))
        (SPROG ((#1=#:G760 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (|ULSCONS;getExpon| |uls| $)
                      . #2=(|ULSCONS;taylorIfCan;$U;12|))
                (EXIT
                 (COND
                  ((< |n| 0)
                   (SEQ
                    (LETT |uls| (SPADCALL (- |n|) |uls| (QREFELT $ 24)) . #2#)
                    (EXIT
                     (COND
                      ((< (|ULSCONS;getExpon| |uls| $) 0) (CONS 1 "failed"))
                      (#3='T (CONS 0 (|ULSCONS;getUTS| |uls| $)))))))
                  ((EQL |n| 0) (CONS 0 (|ULSCONS;getUTS| |uls| $)))
                  (#3#
                   (CONS 0
                         (SPADCALL (|ULSCONS;getUTS| |uls| $)
                                   (SPADCALL (|spadConstant| $ 25)
                                             (PROG1 (LETT #1# |n| . #2#)
                                               (|check_subtype2| (>= #1# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #1#))
                                             (QREFELT $ 27))
                                   (QREFELT $ 28))))))))) 

(SDEFUN |ULSCONS;taylor;$UTS;13| ((|uls| $) ($ UTS))
        (SPROG ((|uts| (|Union| UTS "failed")))
               (SEQ
                (LETT |uts| (SPADCALL |uls| (QREFELT $ 30))
                      |ULSCONS;taylor;$UTS;13|)
                (EXIT
                 (COND
                  ((QEQCAR |uts| 1)
                   (|error| "taylor: Laurent series has a pole"))
                  ('T (QCDR |uts|))))))) 

(PUT '|ULSCONS;termExpon| '|SPADreplace| 'QCAR) 

(SDEFUN |ULSCONS;termExpon|
        ((|term| |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))
         ($ |Integer|))
        (QCAR |term|)) 

(PUT '|ULSCONS;termCoef| '|SPADreplace| 'QCDR) 

(SDEFUN |ULSCONS;termCoef|
        ((|term| |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)) ($ |Coef|))
        (QCDR |term|)) 

(PUT '|ULSCONS;rec| '|SPADreplace| 'CONS) 

(SDEFUN |ULSCONS;rec|
        ((|exponent| |Integer|) (|coef| |Coef|)
         ($ |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
        (CONS |exponent| |coef|)) 

(SDEFUN |ULSCONS;recs|
        ((|st| |Stream| |Coef|) (|n| |Integer|)
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG NIL
               (SPADCALL (CONS #'|ULSCONS;recs!0| (VECTOR |n| $ |st|))
                         (QREFELT $ 45)))) 

(SDEFUN |ULSCONS;recs!0| (($$ NIL))
        (PROG (|st| $ |n|)
          (LETT |st| (QREFELT $$ 2) . #1=(|ULSCONS;recs|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|coef| NIL))
                   (COND
                    ((SPADCALL |st| (QREFELT $ 34)) (SPADCALL (QREFELT $ 37)))
                    ((SPADCALL (LETT |coef| (SPADCALL |st| (QREFELT $ 38)) NIL)
                               (QREFELT $ 39))
                     (|ULSCONS;recs| (SPADCALL |st| (QREFELT $ 40))
                      (SPADCALL |n| (|spadConstant| $ 41) (QREFELT $ 42)) $))
                    ('T
                     (SPADCALL (|ULSCONS;rec| |n| |coef| $)
                               (|ULSCONS;recs| (SPADCALL |st| (QREFELT $ 40))
                                (SPADCALL |n| (|spadConstant| $ 41)
                                          (QREFELT $ 42))
                                $)
                               (QREFELT $ 43))))))))) 

(SDEFUN |ULSCONS;terms;$S;18|
        ((|x| $)
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (|ULSCONS;recs| (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 46))
         (|ULSCONS;getExpon| |x| $) $)) 

(SDEFUN |ULSCONS;recsToCoefs|
        ((|st| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|n| |Integer|) ($ |Stream| |Coef|))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|ULSCONS;recsToCoefs!0| (VECTOR |n| $ |st|))
                          (QREFELT $ 54))))) 

(SDEFUN |ULSCONS;recsToCoefs!0| (($$ NIL))
        (PROG (|st| $ |n|)
          (LETT |st| (QREFELT $$ 2) . #1=(|ULSCONS;recsToCoefs|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|term| NIL) (|ex| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |st| (QREFELT $ 48)) (SPADCALL (QREFELT $ 49)))
                     ('T
                      (SEQ (LETT |term| (SPADCALL |st| (QREFELT $ 50)) NIL)
                           (LETT |ex| (|ULSCONS;termExpon| |term| $) NIL)
                           (EXIT
                            (COND
                             ((SPADCALL |n| |ex| (QREFELT $ 51))
                              (SPADCALL (|ULSCONS;termCoef| |term| $)
                                        (|ULSCONS;recsToCoefs|
                                         (SPADCALL |st| (QREFELT $ 52))
                                         (SPADCALL |n| (|spadConstant| $ 41)
                                                   (QREFELT $ 42))
                                         $)
                                        (QREFELT $ 53)))
                             ('T
                              (SPADCALL (|spadConstant| $ 14)
                                        (|ULSCONS;recsToCoefs| |st|
                                         (SPADCALL |n| (|spadConstant| $ 41)
                                                   (QREFELT $ 42))
                                         $)
                                        (QREFELT $ 53)))))))))))))) 

(SDEFUN |ULSCONS;series;S$;20|
        ((|st| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         ($ $))
        (SPROG ((|ex| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |st| (QREFELT $ 48)) (|spadConstant| $ 13))
                      ('T
                       (SEQ
                        (LETT |ex|
                              (|ULSCONS;termExpon|
                               (SPADCALL |st| (QREFELT $ 50)) $)
                              |ULSCONS;series;S$;20|)
                        (EXIT
                         (SPADCALL |ex|
                                   (SPADCALL
                                    (|ULSCONS;recsToCoefs| |st| |ex| $)
                                    (QREFELT $ 55))
                                   (QREFELT $ 10))))))))) 

(SDEFUN |ULSCONS;removeZeroes;2$;21| ((|x| $) ($ $))
        (SPROG ((|xUTS| (UTS)))
               (COND
                ((SPADCALL
                  (SPADCALL
                   (LETT |xUTS| (|ULSCONS;getUTS| |x| $)
                         |ULSCONS;removeZeroes;2$;21|)
                   (QREFELT $ 46))
                  (QREFELT $ 34))
                 (|spadConstant| $ 13))
                ((SPADCALL (SPADCALL |xUTS| 0 (QREFELT $ 57))
                           (|spadConstant| $ 14) (QREFELT $ 58))
                 (SPADCALL
                  (SPADCALL (+ (|ULSCONS;getExpon| |x| $) 1)
                            (SPADCALL |xUTS| (QREFELT $ 59)) (QREFELT $ 10))
                  (QREFELT $ 60)))
                ('T |x|)))) 

(SDEFUN |ULSCONS;removeZeroes;I2$;22| ((|n| |Integer|) (|x| $) ($ $))
        (SPROG ((|xUTS| (UTS)))
               (COND ((SPADCALL |n| 0 (QREFELT $ 61)) |x|)
                     ((SPADCALL
                       (SPADCALL
                        (LETT |xUTS| (|ULSCONS;getUTS| |x| $)
                              |ULSCONS;removeZeroes;I2$;22|)
                        (QREFELT $ 46))
                       (QREFELT $ 34))
                      (|spadConstant| $ 13))
                     ((SPADCALL (SPADCALL |xUTS| 0 (QREFELT $ 57))
                                (|spadConstant| $ 14) (QREFELT $ 58))
                      (SPADCALL (- |n| 1)
                                (SPADCALL (+ (|ULSCONS;getExpon| |x| $) 1)
                                          (SPADCALL |xUTS| (QREFELT $ 59))
                                          (QREFELT $ 10))
                                (QREFELT $ 24)))
                     ('T |x|)))) 

(SDEFUN |ULSCONS;=;2$B;23| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G832 NIL) (#2=#:G823 NIL) (|expDiff| (|Integer|)))
               (SEQ
                (COND ((EQ |x| |y|) 'T)
                      (#3='T
                       (SEQ
                        (LETT |expDiff|
                              (- (|ULSCONS;getExpon| |x| $)
                                 (|ULSCONS;getExpon| |y| $))
                              . #4=(|ULSCONS;=;2$B;23|))
                        (EXIT
                         (COND
                          ((EQL |expDiff| 0)
                           (SPADCALL (|ULSCONS;getUTS| |x| $)
                                     (|ULSCONS;getUTS| |y| $) (QREFELT $ 62)))
                          ((SPADCALL (ABS |expDiff|) |$streamCount|
                                     (QREFELT $ 63))
                           NIL)
                          ((SPADCALL |expDiff| 0 (QREFELT $ 63))
                           (SPADCALL
                            (SPADCALL (|ULSCONS;getUTS| |x| $)
                                      (SPADCALL (|spadConstant| $ 25)
                                                (PROG1
                                                    (LETT #2# |expDiff| . #4#)
                                                  (|check_subtype2| (>= #2# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #2#))
                                                (QREFELT $ 27))
                                      (QREFELT $ 28))
                            (|ULSCONS;getUTS| |y| $) (QREFELT $ 62)))
                          (#3#
                           (SPADCALL
                            (SPADCALL (|ULSCONS;getUTS| |y| $)
                                      (SPADCALL (|spadConstant| $ 25)
                                                (PROG1
                                                    (LETT #1# (- |expDiff|)
                                                          . #4#)
                                                  (|check_subtype2| (>= #1# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #1#))
                                                (QREFELT $ 27))
                                      (QREFELT $ 28))
                            (|ULSCONS;getUTS| |x| $) (QREFELT $ 62))))))))))) 

(SDEFUN |ULSCONS;pole?;$B;24| ((|x| $) ($ |Boolean|))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |x| (QREFELT $ 12))
                      . #1=(|ULSCONS;pole?;$B;24|))
                (EXIT
                 (COND ((>= |n| 0) NIL)
                       ('T
                        (SEQ
                         (LETT |x| (SPADCALL (- |n|) |x| (QREFELT $ 24)) . #1#)
                         (EXIT (< (SPADCALL |x| (QREFELT $ 12)) 0))))))))) 

(SDEFUN |ULSCONS;+;3$;25| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G849 NIL) (#2=#:G845 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n|
                      (- (|ULSCONS;getExpon| |x| $) (|ULSCONS;getExpon| |y| $))
                      . #3=(|ULSCONS;+;3$;25|))
                (EXIT
                 (COND
                  ((>= |n| 0)
                   (SPADCALL (|ULSCONS;getExpon| |y| $)
                             (SPADCALL (|ULSCONS;getUTS| |y| $)
                                       (SPADCALL (|ULSCONS;getUTS| |x| $)
                                                 (SPADCALL
                                                  (|spadConstant| $ 25)
                                                  (PROG1 (LETT #2# |n| . #3#)
                                                    (|check_subtype2|
                                                     (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                                  (QREFELT $ 27))
                                                 (QREFELT $ 28))
                                       (QREFELT $ 66))
                             (QREFELT $ 10)))
                  ('T
                   (SPADCALL (|ULSCONS;getExpon| |x| $)
                             (SPADCALL (|ULSCONS;getUTS| |x| $)
                                       (SPADCALL (|ULSCONS;getUTS| |y| $)
                                                 (SPADCALL
                                                  (|spadConstant| $ 25)
                                                  (PROG1
                                                      (LETT #1# (- |n|) . #3#)
                                                    (|check_subtype2|
                                                     (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                                  (QREFELT $ 27))
                                                 (QREFELT $ 28))
                                       (QREFELT $ 66))
                             (QREFELT $ 10)))))))) 

(SDEFUN |ULSCONS;-;3$;26| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G860 NIL) (#2=#:G856 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n|
                      (- (|ULSCONS;getExpon| |x| $) (|ULSCONS;getExpon| |y| $))
                      . #3=(|ULSCONS;-;3$;26|))
                (EXIT
                 (COND
                  ((>= |n| 0)
                   (SPADCALL (|ULSCONS;getExpon| |y| $)
                             (SPADCALL
                              (SPADCALL (|ULSCONS;getUTS| |x| $)
                                        (SPADCALL (|spadConstant| $ 25)
                                                  (PROG1 (LETT #2# |n| . #3#)
                                                    (|check_subtype2|
                                                     (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                                  (QREFELT $ 27))
                                        (QREFELT $ 28))
                              (|ULSCONS;getUTS| |y| $) (QREFELT $ 68))
                             (QREFELT $ 10)))
                  ('T
                   (SPADCALL (|ULSCONS;getExpon| |x| $)
                             (SPADCALL (|ULSCONS;getUTS| |x| $)
                                       (SPADCALL (|ULSCONS;getUTS| |y| $)
                                                 (SPADCALL
                                                  (|spadConstant| $ 25)
                                                  (PROG1
                                                      (LETT #1# (- |n|) . #3#)
                                                    (|check_subtype2|
                                                     (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                                  (QREFELT $ 27))
                                                 (QREFELT $ 28))
                                       (QREFELT $ 68))
                             (QREFELT $ 10)))))))) 

(SDEFUN |ULSCONS;*;3$;27| ((|x| $) (|y| $) ($ $))
        (SPADCALL (+ (|ULSCONS;getExpon| |x| $) (|ULSCONS;getExpon| |y| $))
                  (SPADCALL (|ULSCONS;getUTS| |x| $) (|ULSCONS;getUTS| |y| $)
                            (QREFELT $ 28))
                  (QREFELT $ 10))) 

(SDEFUN |ULSCONS;^;$Nni$;28| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (COND
         ((ZEROP |n|)
          (COND ((SPADCALL |x| (QREFELT $ 71)) (|error| "0 ^ 0 is undefined"))
                (#1='T (|spadConstant| $ 16))))
         (#1#
          (SPADCALL (SPADCALL |n| (|ULSCONS;getExpon| |x| $) (QREFELT $ 72))
                    (SPADCALL (|ULSCONS;getUTS| |x| $) |n| (QREFELT $ 73))
                    (QREFELT $ 10))))) 

(SDEFUN |ULSCONS;recip;$U;29| ((|x| $) ($ |Union| $ #1="failed"))
        (SPROG ((|uts| (|Union| UTS #1#)) (|d| (|Integer|)))
               (SEQ
                (LETT |x| (SPADCALL 1000 |x| (QREFELT $ 24))
                      . #2=(|ULSCONS;recip;$U;29|))
                (EXIT
                 (COND
                  ((SPADCALL
                    (SPADCALL |x|
                              (LETT |d| (SPADCALL |x| (QREFELT $ 12)) . #2#)
                              (QREFELT $ 75))
                    (QREFELT $ 39))
                   (CONS 1 "failed"))
                  (#3='T
                   (SEQ
                    (LETT |uts|
                          (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 77))
                          . #2#)
                    (EXIT
                     (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                           (#3#
                            (CONS 0
                                  (SPADCALL (- |d|) (QCDR |uts|)
                                            (QREFELT $ 10))))))))))))) 

(SDEFUN |ULSCONS;elt;3$;30| ((|uls1| $) (|uls2| $) ($ $))
        (SPROG
         ((#1=#:G891 NIL) (|uts1| (UTS)) (|recipr| (|Union| $ "failed"))
          (|deg| (|Integer|)) (|uts2| (UTS)) (|uts| (|Union| UTS "failed")))
         (SEQ
          (LETT |uts| (SPADCALL |uls2| (QREFELT $ 30))
                . #2=(|ULSCONS;elt;3$;30|))
          (EXIT
           (COND
            ((QEQCAR |uts| 1)
             (|error| "elt: second argument must have positive order"))
            (#3='T
             (SEQ (LETT |uts2| (QCDR |uts|) . #2#)
                  (COND
                   ((NULL
                     (SPADCALL (SPADCALL |uts2| 0 (QREFELT $ 57))
                               (QREFELT $ 39)))
                    (EXIT
                     (|error|
                      "elt: second argument must have positive order"))))
                  (SEQ (LETT |deg| (|ULSCONS;getExpon| |uls1| $) . #2#)
                       (EXIT
                        (COND
                         ((< |deg| 0)
                          (LETT |uls1|
                                (SPADCALL (- |deg|) |uls1| (QREFELT $ 24))
                                . #2#)))))
                  (LETT |deg| (|ULSCONS;getExpon| |uls1| $) . #2#)
                  (EXIT
                   (COND
                    ((< |deg| 0)
                     (SEQ
                      (LETT |recipr|
                            (SPADCALL (SPADCALL |uts2| (QREFELT $ 20))
                                      (QREFELT $ 78))
                            . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |recipr| 1)
                         (|error| "elt: second argument not invertible"))
                        (#3#
                         (SEQ
                          (LETT |uts1|
                                (SPADCALL
                                 (SPADCALL |uls1|
                                           (SPADCALL (|spadConstant| $ 25)
                                                     (- |deg|) (QREFELT $ 19))
                                           (QREFELT $ 70))
                                 (QREFELT $ 31))
                                . #2#)
                          (EXIT
                           (SPADCALL
                            (SPADCALL (SPADCALL |uts1| |uts2| (QREFELT $ 79))
                                      (QREFELT $ 20))
                            (SPADCALL (QCDR |recipr|)
                                      (PROG1 (LETT #1# (- |deg|) . #2#)
                                        (|check_subtype2| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #1#))
                                      (QREFELT $ 74))
                            (QREFELT $ 70)))))))))
                    (#3#
                     (SPADCALL
                      (SPADCALL (SPADCALL |uls1| (QREFELT $ 31)) |uts2|
                                (QREFELT $ 79))
                      (QREFELT $ 20)))))))))))) 

(SDEFUN |ULSCONS;eval;$CoefS;31| ((|uls| $) (|r| |Coef|) ($ |Stream| |Coef|))
        (SPROG
         ((#1=#:G910 NIL) (#2=#:G903 NIL) (|recipr| (|Union| |Coef| "failed"))
          (|n| (|Integer|)) (|uts| (UTS)))
         (SEQ
          (SEQ
           (LETT |n| (|ULSCONS;getExpon| |uls| $)
                 . #3=(|ULSCONS;eval;$CoefS;31|))
           (EXIT
            (COND
             ((< |n| 0)
              (LETT |uls| (SPADCALL (- |n|) |uls| (QREFELT $ 24)) . #3#)))))
          (LETT |uts| (|ULSCONS;getUTS| |uls| $) . #3#)
          (LETT |n| (|ULSCONS;getExpon| |uls| $) . #3#)
          (EXIT
           (COND
            ((< |n| 0)
             (COND
              ((SPADCALL |r| (QREFELT $ 39))
               (|error| "eval: 0 raised to negative power"))
              (#4='T
               (SEQ (LETT |recipr| (SPADCALL |r| (QREFELT $ 81)) . #3#)
                    (EXIT
                     (COND
                      ((QEQCAR |recipr| 1)
                       (|error| "eval: non-unit raised to negative power"))
                      (#4#
                       (SPADCALL
                        (SPADCALL (QCDR |recipr|)
                                  (PROG1 (LETT #2# (- |n|) . #3#)
                                    (|check_subtype2| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #2#))
                                  (QREFELT $ 82))
                        (SPADCALL |uts| |r| (QREFELT $ 83))
                        (QREFELT $ 85)))))))))
            ((ZEROP |n|) (SPADCALL |uts| |r| (QREFELT $ 83)))
            (#4#
             (SPADCALL
              (SPADCALL |r|
                        (PROG1 (LETT #1# |n| . #3#)
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#))
                        (QREFELT $ 82))
              (SPADCALL |uts| |r| (QREFELT $ 83)) (QREFELT $ 85)))))))) 

(SDEFUN |ULSCONS;variable;$S;32| ((|x| $) ($ |Symbol|))
        (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 88))) 

(SDEFUN |ULSCONS;center;$Coef;33| ((|x| $) ($ |Coef|))
        (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 90))) 

(SDEFUN |ULSCONS;coefficient;$ICoef;34| ((|x| $) (|n| |Integer|) ($ |Coef|))
        (SPROG ((#1=#:G919 NIL) (|a| (|Integer|)))
               (SEQ
                (LETT |a| (- |n| (|ULSCONS;getExpon| |x| $))
                      . #2=(|ULSCONS;coefficient;$ICoef;34|))
                (EXIT
                 (COND
                  ((>= |a| 0)
                   (SPADCALL (|ULSCONS;getUTS| |x| $)
                             (PROG1 (LETT #1# |a| . #2#)
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#))
                             (QREFELT $ 57)))
                  ('T (|spadConstant| $ 14))))))) 

(SDEFUN |ULSCONS;elt;$ICoef;35| ((|x| $) (|n| |Integer|) ($ |Coef|))
        (SPADCALL |x| |n| (QREFELT $ 75))) 

(SDEFUN |ULSCONS;order;$I;36| ((|x| $) ($ |Integer|))
        (+ (|ULSCONS;getExpon| |x| $)
           (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 93)))) 

(SDEFUN |ULSCONS;order;$2I;37| ((|x| $) (|n| . #1=(|Integer|)) ($ . #1#))
        (SPROG ((#2=#:G926 NIL) (|m| (|Integer|)) (|e| (|Integer|)))
               (SEQ
                (LETT |m|
                      (- |n|
                         (LETT |e| (|ULSCONS;getExpon| |x| $)
                               . #3=(|ULSCONS;order;$2I;37|)))
                      . #3#)
                (EXIT
                 (COND ((< |m| 0) |n|)
                       ('T
                        (+ |e|
                           (SPADCALL (|ULSCONS;getUTS| |x| $)
                                     (PROG1 (LETT #2# |m| . #3#)
                                       (|check_subtype2| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                     (QREFELT $ 95))))))))) 

(SDEFUN |ULSCONS;truncate;$I$;38| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((#1=#:G930 NIL) (|m| (|Integer|)) (|e| (|Integer|)))
               (SEQ
                (LETT |m|
                      (- |n|
                         (LETT |e| (|ULSCONS;getExpon| |x| $)
                               . #2=(|ULSCONS;truncate;$I$;38|)))
                      . #2#)
                (EXIT
                 (COND ((< |m| 0) (|spadConstant| $ 13))
                       ('T
                        (SPADCALL |e|
                                  (SPADCALL (|ULSCONS;getUTS| |x| $)
                                            (PROG1 (LETT #1# |m| . #2#)
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            (QREFELT $ 97))
                                  (QREFELT $ 10)))))))) 

(SDEFUN |ULSCONS;truncate;$2I$;39|
        ((|x| $) (|n1| . #1=(|Integer|)) (|n2| . #1#) ($ $))
        (SPROG
         ((#2=#:G936 NIL) (#3=#:G935 NIL) (|m1| (|Integer|)) (|e| (|Integer|))
          (|#G61| #1#) (|#G60| #1#))
         (SEQ
          (COND
           ((< |n2| |n1|)
            (PROGN
             (LETT |#G60| |n2| . #4=(|ULSCONS;truncate;$2I$;39|))
             (LETT |#G61| |n1| . #4#)
             (LETT |n1| |#G60| . #4#)
             (LETT |n2| |#G61| . #4#))))
          (LETT |m1| (- |n1| (LETT |e| (|ULSCONS;getExpon| |x| $) . #4#))
                . #4#)
          (EXIT
           (COND ((< |m1| 0) (SPADCALL |x| |n2| (QREFELT $ 98)))
                 ('T
                  (SPADCALL |e|
                            (SPADCALL (|ULSCONS;getUTS| |x| $)
                                      (PROG1 (LETT #3# |m1| . #4#)
                                        (|check_subtype2| (>= #3# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #3#))
                                      (PROG1 (LETT #2# (- |n2| |e|) . #4#)
                                        (|check_subtype2| (>= #2# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #2#))
                                      (QREFELT $ 99))
                            (QREFELT $ 10)))))))) 

(SDEFUN |ULSCONS;rationalFunction;$IF;40|
        ((|x| $) (|n| |Integer|) ($ |Fraction| (|Polynomial| |Coef|)))
        (SPROG
         ((#1=#:G947 NIL) (#2=#:G946 NIL)
          (|c| (|Fraction| (|Polynomial| |Coef|)))
          (|v| (|Fraction| (|Polynomial| |Coef|)))
          (|poly| (|Fraction| (|Polynomial| |Coef|))) (#3=#:G943 NIL)
          (|m| (|Integer|)) (|e| (|Integer|)))
         (SEQ
          (LETT |m|
                (- |n|
                   (LETT |e| (|ULSCONS;getExpon| |x| $)
                         . #4=(|ULSCONS;rationalFunction;$IF;40|)))
                . #4#)
          (EXIT
           (COND ((< |m| 0) (|spadConstant| $ 102))
                 (#5='T
                  (SEQ
                   (LETT |poly|
                         (SPADCALL
                          (SPADCALL (|ULSCONS;getUTS| |x| $)
                                    (PROG1 (LETT #3# |m| . #4#)
                                      (|check_subtype2| (>= #3# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #3#))
                                    (QREFELT $ 104))
                          (QREFELT $ 105))
                         . #4#)
                   (EXIT
                    (COND ((ZEROP |e|) |poly|)
                          (#5#
                           (SEQ
                            (LETT |v|
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 89))
                                            (QREFELT $ 106))
                                  . #4#)
                            (LETT |c|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |x| (QREFELT $ 91))
                                             (QREFELT $ 107))
                                   (QREFELT $ 105))
                                  . #4#)
                            (EXIT
                             (COND
                              ((SPADCALL |e| (QREFELT $ 108))
                               (SPADCALL |poly|
                                         (SPADCALL
                                          (SPADCALL |v| |c| (QREFELT $ 109))
                                          (PROG1 (LETT #2# |e| . #4#)
                                            (|check_subtype2| (>= #2# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #2#))
                                          (QREFELT $ 110))
                                         (QREFELT $ 111)))
                              (#5#
                               (SPADCALL |poly|
                                         (SPADCALL
                                          (SPADCALL |v| |c| (QREFELT $ 109))
                                          (PROG1 (LETT #1# (- |e|) . #4#)
                                            (|check_subtype2| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #1#))
                                          (QREFELT $ 110))
                                         (QREFELT $ 112)))))))))))))))) 

(SDEFUN |ULSCONS;rationalFunction;$2IF;41|
        ((|x| $) (|n1| . #1=(|Integer|)) (|n2| . #1#)
         ($ |Fraction| (|Polynomial| |Coef|)))
        (SPROG
         ((#2=#:G959 NIL) (#3=#:G958 NIL)
          (|c| (|Fraction| (|Polynomial| |Coef|)))
          (|v| (|Fraction| (|Polynomial| |Coef|)))
          (|poly| (|Fraction| (|Polynomial| |Coef|))) (#4=#:G955 NIL)
          (#5=#:G954 NIL) (|m1| (|Integer|)) (|e| (|Integer|)) (|#G68| #1#)
          (|#G67| #1#))
         (SEQ
          (COND
           ((< |n2| |n1|)
            (PROGN
             (LETT |#G67| |n2| . #6=(|ULSCONS;rationalFunction;$2IF;41|))
             (LETT |#G68| |n1| . #6#)
             (LETT |n1| |#G67| . #6#)
             (LETT |n2| |#G68| . #6#))))
          (LETT |m1| (- |n1| (LETT |e| (|ULSCONS;getExpon| |x| $) . #6#))
                . #6#)
          (EXIT
           (COND ((< |m1| 0) (SPADCALL |x| |n2| (QREFELT $ 113)))
                 (#7='T
                  (SEQ
                   (LETT |poly|
                         (SPADCALL
                          (SPADCALL (|ULSCONS;getUTS| |x| $)
                                    (PROG1 (LETT #5# |m1| . #6#)
                                      (|check_subtype2| (>= #5# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #5#))
                                    (PROG1 (LETT #4# (- |n2| |e|) . #6#)
                                      (|check_subtype2| (>= #4# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #4#))
                                    (QREFELT $ 114))
                          (QREFELT $ 105))
                         . #6#)
                   (EXIT
                    (COND ((ZEROP |e|) |poly|)
                          (#7#
                           (SEQ
                            (LETT |v|
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 89))
                                            (QREFELT $ 106))
                                  . #6#)
                            (LETT |c|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |x| (QREFELT $ 91))
                                             (QREFELT $ 107))
                                   (QREFELT $ 105))
                                  . #6#)
                            (EXIT
                             (COND
                              ((SPADCALL |e| (QREFELT $ 108))
                               (SPADCALL |poly|
                                         (SPADCALL
                                          (SPADCALL |v| |c| (QREFELT $ 109))
                                          (PROG1 (LETT #3# |e| . #6#)
                                            (|check_subtype2| (>= #3# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #3#))
                                          (QREFELT $ 110))
                                         (QREFELT $ 111)))
                              (#7#
                               (SPADCALL |poly|
                                         (SPADCALL
                                          (SPADCALL |v| |c| (QREFELT $ 109))
                                          (PROG1 (LETT #2# (- |e|) . #6#)
                                            (|check_subtype2| (>= #2# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #2#))
                                          (QREFELT $ 110))
                                         (QREFELT $ 112)))))))))))))))) 

(SDEFUN |ULSCONS;exquo;2$U;42| ((|x| $) (|y| $) ($ |Union| $ #1="failed"))
        (SPROG ((|uts| (|Union| UTS #1#)) (|d| (|Integer|)))
               (SEQ
                (LETT |x| (SPADCALL 1000 |x| (QREFELT $ 24))
                      . #2=(|ULSCONS;exquo;2$U;42|))
                (LETT |y| (SPADCALL 1000 |y| (QREFELT $ 24)) . #2#)
                (EXIT
                 (COND
                  ((SPADCALL
                    (SPADCALL |y|
                              (LETT |d| (SPADCALL |y| (QREFELT $ 12)) . #2#)
                              (QREFELT $ 75))
                    (QREFELT $ 39))
                   (CONS 1 "failed"))
                  (#3='T
                   (SEQ
                    (LETT |uts|
                          (SPADCALL (|ULSCONS;getUTS| |x| $)
                                    (|ULSCONS;getUTS| |y| $) (QREFELT $ 116))
                          . #2#)
                    (EXIT
                     (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                           (#3#
                            (CONS 0
                                  (SPADCALL
                                   (- (SPADCALL |x| (QREFELT $ 12)) |d|)
                                   (QCDR |uts|) (QREFELT $ 10))))))))))))) 

(SDEFUN |ULSCONS;approximate;$ICoef;43| ((|x| $) (|n| |Integer|) ($ |Coef|))
        (SPROG
         ((|app| (|Coef|)) (#1=#:G975 NIL) (|m| (|Integer|)) (|e| (|Integer|)))
         (SEQ
          (LETT |m|
                (- |n|
                   (LETT |e| (|ULSCONS;getExpon| |x| $)
                         . #2=(|ULSCONS;approximate;$ICoef;43|)))
                . #2#)
          (EXIT
           (COND ((< |m| 0) (|spadConstant| $ 14))
                 (#3='T
                  (SEQ
                   (LETT |app|
                         (SPADCALL (|ULSCONS;getUTS| |x| $)
                                   (PROG1 (LETT #1# |m| . #2#)
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   (QREFELT $ 118))
                         . #2#)
                   (EXIT
                    (COND ((ZEROP |e|) |app|)
                          (#3#
                           (SPADCALL |app|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (SPADCALL |x| (QREFELT $ 89))
                                                 (QREFELT $ 119))
                                       (SPADCALL |x| (QREFELT $ 91))
                                       (QREFELT $ 120))
                                      |e| (QREFELT $ 121))
                                     (QREFELT $ 122)))))))))))) 

(SDEFUN |ULSCONS;complete;2$;44| ((|x| $) ($ $))
        (SPADCALL (|ULSCONS;getExpon| |x| $)
                  (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 124))
                  (QREFELT $ 10))) 

(SDEFUN |ULSCONS;extend;$I$;45| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((#1=#:G981 NIL) (|m| (|Integer|)) (|e| (|Integer|)))
               (SEQ
                (LETT |e| (|ULSCONS;getExpon| |x| $)
                      . #2=(|ULSCONS;extend;$I$;45|))
                (LETT |m| (- |n| |e|) . #2#)
                (EXIT
                 (COND ((< |m| 0) |x|)
                       ('T
                        (SPADCALL |e|
                                  (SPADCALL (|ULSCONS;getUTS| |x| $)
                                            (PROG1 (LETT #1# |m| . #2#)
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            (QREFELT $ 126))
                                  (QREFELT $ 10)))))))) 

(SDEFUN |ULSCONS;map;M2$;46| ((|f| |Mapping| |Coef| |Coef|) (|x| $) ($ $))
        (SPADCALL (|ULSCONS;getExpon| |x| $)
                  (SPADCALL |f| (|ULSCONS;getUTS| |x| $) (QREFELT $ 129))
                  (QREFELT $ 10))) 

(SDEFUN |ULSCONS;multiplyCoefficients;M2$;47|
        ((|f| |Mapping| |Coef| (|Integer|)) (|x| $) ($ $))
        (SPROG ((|e| (|Integer|)))
               (SEQ
                (LETT |e| (|ULSCONS;getExpon| |x| $)
                      |ULSCONS;multiplyCoefficients;M2$;47|)
                (EXIT
                 (SPADCALL |e|
                           (SPADCALL
                            (CONS #'|ULSCONS;multiplyCoefficients;M2$;47!0|
                                  (VECTOR |f| $ |e|))
                            (|ULSCONS;getUTS| |x| $) (QREFELT $ 132))
                           (QREFELT $ 10)))))) 

(SDEFUN |ULSCONS;multiplyCoefficients;M2$;47!0| ((|z1| NIL) ($$ NIL))
        (PROG (|e| $ |f|)
          (LETT |e| (QREFELT $$ 2)
                . #1=(|ULSCONS;multiplyCoefficients;M2$;47|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |e| |z1| (QREFELT $ 42)) |f|))))) 

(SDEFUN |ULSCONS;multiplyExponents;$Pi$;48|
        ((|x| $) (|n| |PositiveInteger|) ($ $))
        (SPADCALL (SPADCALL |n| (|ULSCONS;getExpon| |x| $) (QREFELT $ 135))
                  (SPADCALL (|ULSCONS;getUTS| |x| $) |n| (QREFELT $ 136))
                  (QREFELT $ 10))) 

(SDEFUN |ULSCONS;differentiate;2$;49| ((|x| $) ($ $))
        (SPROG ((|e| (|Integer|)))
               (SEQ
                (LETT |e| (|ULSCONS;getExpon| |x| $)
                      |ULSCONS;differentiate;2$;49|)
                (EXIT
                 (SPADCALL (- |e| 1)
                           (SPADCALL
                            (CONS #'|ULSCONS;differentiate;2$;49!0|
                                  (VECTOR $ |e|))
                            (|ULSCONS;getUTS| |x| $) (QREFELT $ 132))
                           (QREFELT $ 10)))))) 

(SDEFUN |ULSCONS;differentiate;2$;49!0| ((|z1| NIL) ($$ NIL))
        (PROG (|e| $)
          (LETT |e| (QREFELT $$ 1) . #1=(|ULSCONS;differentiate;2$;49|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |e| |z1| (QREFELT $ 42)) (QREFELT $ 22)))))) 

(SDEFUN |ULSCONS;differentiate;$S$;50| ((|x| $) (|s| |Symbol|) ($ $))
        (SPROG NIL
               (COND
                ((EQUAL |s| (SPADCALL |x| (QREFELT $ 89)))
                 (SPADCALL |x| (QREFELT $ 138)))
                ('T
                 (SPADCALL
                  (SPADCALL
                   (CONS #'|ULSCONS;differentiate;$S$;50!0| (VECTOR $ |s|)) |x|
                   (QREFELT $ 130))
                  (SPADCALL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 91)) |s| (QREFELT $ 139))
                   (SPADCALL |x| (QREFELT $ 138)) (QREFELT $ 140))
                  (QREFELT $ 69)))))) 

(SDEFUN |ULSCONS;differentiate;$S$;50!0| ((|z1| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|ULSCONS;differentiate;$S$;50|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |s| (QREFELT $ 139)))))) 

(SDEFUN |ULSCONS;characteristic;Nni;51| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 142))) 

(SDEFUN |ULSCONS;retract;$UTS;52| ((|x| $) ($ UTS))
        (SPADCALL |x| (QREFELT $ 31))) 

(SDEFUN |ULSCONS;retractIfCan;$U;53| ((|x| $) ($ |Union| UTS "failed"))
        (SPADCALL |x| (QREFELT $ 30))) 

(SDEFUN |ULSCONS;^;$I$;54| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG
         ((|minusN| (|NonNegativeInteger|)) (#1=#:G1028 NIL) (|xInv| ($))
          (#2=#:G1027 NIL))
         (SEQ
          (COND
           ((ZEROP |n|)
            (COND
             ((SPADCALL |x| (QREFELT $ 71)) (|error| "0 ^ 0 is undefined"))
             (#3='T (|spadConstant| $ 16))))
           ((SPADCALL |n| 0 (QREFELT $ 63))
            (SPADCALL (* |n| (|ULSCONS;getExpon| |x| $))
                      (SPADCALL (|ULSCONS;getUTS| |x| $)
                                (PROG1 (LETT #2# |n| . #4=(|ULSCONS;^;$I$;54|))
                                  (|check_subtype2| (>= #2# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #2#))
                                (QREFELT $ 73))
                      (QREFELT $ 10)))
           (#3#
            (SEQ (LETT |xInv| (SPADCALL |x| (QREFELT $ 146)) . #4#)
                 (LETT |minusN|
                       (PROG1 (LETT #1# (- |n|) . #4#)
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#))
                       . #4#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL |minusN| (|ULSCONS;getExpon| |xInv| $)
                             (QREFELT $ 72))
                   (SPADCALL (|ULSCONS;getUTS| |xInv| $) |minusN|
                             (QREFELT $ 73))
                   (QREFELT $ 10))))))))) 

(SDEFUN |ULSCONS;*;UTS2$;55| ((|x| UTS) (|y| $) ($ $))
        (SPADCALL (SPADCALL |x| (QREFELT $ 20)) |y| (QREFELT $ 70))) 

(SDEFUN |ULSCONS;*;$UTS$;56| ((|x| $) (|y| UTS) ($ $))
        (SPADCALL |x| (SPADCALL |y| (QREFELT $ 20)) (QREFELT $ 70))) 

(SDEFUN |ULSCONS;inv;2$;57| ((|x| $) ($ $))
        (SPROG ((|xInv| (|Union| $ "failed")))
               (SEQ
                (LETT |xInv| (SPADCALL |x| (QREFELT $ 78)) |ULSCONS;inv;2$;57|)
                (EXIT
                 (COND
                  ((QEQCAR |xInv| 1)
                   (|error| "multiplicative inverse does not exist"))
                  ('T (QCDR |xInv|))))))) 

(SDEFUN |ULSCONS;/;3$;58| ((|x| $) (|y| $) ($ $))
        (SPROG ((|yInv| (|Union| $ "failed")))
               (SEQ
                (LETT |yInv| (SPADCALL |y| (QREFELT $ 78)) |ULSCONS;/;3$;58|)
                (EXIT
                 (COND
                  ((QEQCAR |yInv| 1)
                   (|error| "inv: multiplicative inverse does not exist"))
                  ('T (SPADCALL |x| (QCDR |yInv|) (QREFELT $ 70)))))))) 

(SDEFUN |ULSCONS;/;2UTS$;59| ((|x| UTS) (|y| UTS) ($ $))
        (SPADCALL (SPADCALL |x| (QREFELT $ 20)) (SPADCALL |y| (QREFELT $ 20))
                  (QREFELT $ 150))) 

(SDEFUN |ULSCONS;numer;$UTS;60| ((|x| $) ($ UTS))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |x| (QREFELT $ 12))
                      . #1=(|ULSCONS;numer;$UTS;60|))
                (EXIT
                 (COND ((>= |n| 0) (SPADCALL |x| (QREFELT $ 31)))
                       (#2='T
                        (SEQ
                         (LETT |x| (SPADCALL (- |n|) |x| (QREFELT $ 24)) . #1#)
                         (LETT |n| (SPADCALL |x| (QREFELT $ 12)) . #1#)
                         (EXIT
                          (COND ((EQL |n| 0) (SPADCALL |x| (QREFELT $ 31)))
                                (#2# (|ULSCONS;getUTS| |x| $))))))))))) 

(SDEFUN |ULSCONS;denom;$UTS;61| ((|x| $) ($ UTS))
        (SPROG ((#1=#:G1051 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |x| (QREFELT $ 12))
                      . #2=(|ULSCONS;denom;$UTS;61|))
                (EXIT
                 (COND ((>= |n| 0) (|spadConstant| $ 17))
                       (#3='T
                        (SEQ
                         (LETT |x| (SPADCALL (- |n|) |x| (QREFELT $ 24)) . #2#)
                         (LETT |n| (SPADCALL |x| (QREFELT $ 12)) . #2#)
                         (EXIT
                          (COND ((EQL |n| 0) (|spadConstant| $ 17))
                                (#3#
                                 (SPADCALL (|spadConstant| $ 25)
                                           (PROG1 (LETT #1# (- |n|) . #2#)
                                             (|check_subtype2| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #1#))
                                           (QREFELT $ 27)))))))))))) 

(SDEFUN |ULSCONS;coerce;F$;62| ((|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 155)) (QREFELT $ 21))) 

(SDEFUN |ULSCONS;^;$F$;63| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL |x| |r| (QREFELT $ 158))) 

(SDEFUN |ULSCONS;exp;2$;64| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 160))) 

(SDEFUN |ULSCONS;log;2$;65| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 162))) 

(SDEFUN |ULSCONS;sin;2$;66| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 164))) 

(SDEFUN |ULSCONS;cos;2$;67| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 166))) 

(SDEFUN |ULSCONS;tan;2$;68| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 168))) 

(SDEFUN |ULSCONS;cot;2$;69| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 170))) 

(SDEFUN |ULSCONS;sec;2$;70| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 172))) 

(SDEFUN |ULSCONS;csc;2$;71| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 174))) 

(SDEFUN |ULSCONS;asin;2$;72| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 176))) 

(SDEFUN |ULSCONS;acos;2$;73| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 178))) 

(SDEFUN |ULSCONS;atan;2$;74| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 180))) 

(SDEFUN |ULSCONS;acot;2$;75| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 182))) 

(SDEFUN |ULSCONS;asec;2$;76| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 184))) 

(SDEFUN |ULSCONS;acsc;2$;77| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 186))) 

(SDEFUN |ULSCONS;sinh;2$;78| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 188))) 

(SDEFUN |ULSCONS;cosh;2$;79| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 190))) 

(SDEFUN |ULSCONS;tanh;2$;80| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 192))) 

(SDEFUN |ULSCONS;coth;2$;81| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 194))) 

(SDEFUN |ULSCONS;sech;2$;82| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 196))) 

(SDEFUN |ULSCONS;csch;2$;83| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 198))) 

(SDEFUN |ULSCONS;asinh;2$;84| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 200))) 

(SDEFUN |ULSCONS;acosh;2$;85| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 202))) 

(SDEFUN |ULSCONS;atanh;2$;86| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 204))) 

(SDEFUN |ULSCONS;acoth;2$;87| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 206))) 

(SDEFUN |ULSCONS;asech;2$;88| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 208))) 

(SDEFUN |ULSCONS;acsch;2$;89| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 210))) 

(SDEFUN |ULSCONS;ratInv| ((|n| |Integer|) ($ |Coef|))
        (COND ((ZEROP |n|) (|spadConstant| $ 25))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |n| (QREFELT $ 212)) (QREFELT $ 213))
                (QREFELT $ 155))))) 

(SDEFUN |ULSCONS;integrate;2$;91| ((|x| $) ($ $))
        (SPROG ((|e| (|Integer|)))
               (SEQ
                (COND
                 ((NULL
                   (SPADCALL (SPADCALL |x| -1 (QREFELT $ 75)) (QREFELT $ 39)))
                  (|error| "integrate: series has term of order -1"))
                 ('T
                  (SEQ
                   (LETT |e| (|ULSCONS;getExpon| |x| $)
                         |ULSCONS;integrate;2$;91|)
                   (EXIT
                    (SPADCALL (+ |e| 1)
                              (SPADCALL
                               (CONS #'|ULSCONS;integrate;2$;91!0|
                                     (VECTOR $ |e|))
                               (|ULSCONS;getUTS| |x| $) (QREFELT $ 132))
                              (QREFELT $ 10))))))))) 

(SDEFUN |ULSCONS;integrate;2$;91!0| ((|z1| NIL) ($$ NIL))
        (PROG (|e| $)
          (LETT |e| (QREFELT $$ 1) . #1=(|ULSCONS;integrate;2$;91|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|ULSCONS;ratInv|
             (SPADCALL (SPADCALL |e| (|spadConstant| $ 41) (QREFELT $ 42)) |z1|
                       (QREFELT $ 42))
             $))))) 

(SDEFUN |ULSCONS;integrate;$S$;92| ((|x| $) (|s| |Symbol|) ($ $))
        (SPROG NIL
               (COND
                ((EQUAL |s| (SPADCALL |x| (QREFELT $ 89)))
                 (SPADCALL |x| (QREFELT $ 215)))
                ((NULL
                  (SPADCALL |s|
                            (SPADCALL (SPADCALL |x| (QREFELT $ 91))
                                      (QREFELT $ 217))
                            (QREFELT $ 218)))
                 (SPADCALL (CONS #'|ULSCONS;integrate;$S$;92!0| (VECTOR $ |s|))
                           |x| (QREFELT $ 130)))
                ('T
                 (|error|
                  "integrate: center is a function of variable of integration"))))) 

(SDEFUN |ULSCONS;integrate;$S$;92!0| ((|z1| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|ULSCONS;integrate;$S$;92|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |s| (QREFELT $ 219)))))) 

(SDEFUN |ULSCONS;integrateWithOneAnswer|
        ((|f| |Coef|) (|s| |Symbol|) ($ |Coef|))
        (SPROG ((|res| (|Union| |Coef| (|List| |Coef|))))
               (SEQ
                (LETT |res| (SPADCALL |f| |s| (QREFELT $ 223))
                      |ULSCONS;integrateWithOneAnswer|)
                (EXIT
                 (COND ((QEQCAR |res| 0) (QCDR |res|))
                       ('T (|SPADfirst| (QCDR |res|)))))))) 

(SDEFUN |ULSCONS;integrate;$S$;94| ((|x| $) (|s| |Symbol|) ($ $))
        (SPROG NIL
               (COND
                ((EQUAL |s| (SPADCALL |x| (QREFELT $ 89)))
                 (SPADCALL |x| (QREFELT $ 215)))
                ((NULL
                  (SPADCALL |s|
                            (SPADCALL (SPADCALL |x| (QREFELT $ 91))
                                      (QREFELT $ 217))
                            (QREFELT $ 218)))
                 (SPADCALL (CONS #'|ULSCONS;integrate;$S$;94!0| (VECTOR $ |s|))
                           |x| (QREFELT $ 130)))
                ('T
                 (|error|
                  "integrate: center is a function of variable of integration"))))) 

(SDEFUN |ULSCONS;integrate;$S$;94!0| ((|z1| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|ULSCONS;integrate;$S$;94|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|ULSCONS;integrateWithOneAnswer| |z1| |s| $))))) 

(SDEFUN |ULSCONS;termOutput|
        ((|k| |Integer|) (|c| |Coef|) (|vv| |OutputForm|) ($ |OutputForm|))
        (SPROG ((|mon| (|OutputForm|)))
               (SEQ
                (COND ((EQL |k| 0) (SPADCALL |c| (QREFELT $ 225)))
                      (#1='T
                       (SEQ
                        (LETT |mon|
                              (COND ((EQL |k| 1) |vv|)
                                    (#1#
                                     (SPADCALL |vv|
                                               (SPADCALL |k| (QREFELT $ 226))
                                               (QREFELT $ 227))))
                              |ULSCONS;termOutput|)
                        (EXIT
                         (COND
                          ((SPADCALL |c| (|spadConstant| $ 25) (QREFELT $ 58))
                           |mon|)
                          ((SPADCALL |c|
                                     (SPADCALL (|spadConstant| $ 25)
                                               (QREFELT $ 228))
                                     (QREFELT $ 58))
                           (SPADCALL |mon| (QREFELT $ 229)))
                          (#1#
                           (SPADCALL (SPADCALL |c| (QREFELT $ 225)) |mon|
                                     (QREFELT $ 230))))))))))) 

(PUT '|ULSCONS;showAll?| '|SPADreplace| '(XLAM NIL |$streamsShowAll|)) 

(SDEFUN |ULSCONS;showAll?| (($ |Boolean|)) |$streamsShowAll|) 

(SDEFUN |ULSCONS;termsToOutputForm|
        ((|m| |Integer|) (|uu| |Stream| |Coef|) (|xxx| |OutputForm|)
         ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|uu1| (|Stream| |Coef|)) (|n| NIL)
          (#1=#:G1134 NIL) (|count| (|NonNegativeInteger|)))
         (SEQ (LETT |l| NIL . #2=(|ULSCONS;termsToOutputForm|))
              (EXIT
               (COND
                ((SPADCALL |uu| (QREFELT $ 34))
                 (SPADCALL (|spadConstant| $ 14) (QREFELT $ 225)))
                (#3='T
                 (SEQ (LETT |count| |$streamCount| . #2#)
                      (SEQ (LETT |n| 0 . #2#) (LETT #1# |count| . #2#) G190
                           (COND
                            ((OR (|greater_SI| |n| #1#)
                                 (NULL (NULL (SPADCALL |uu| (QREFELT $ 34)))))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL (SPADCALL |uu| (QREFELT $ 38))
                                        (|spadConstant| $ 14) (QREFELT $ 231))
                              (LETT |l|
                                    (CONS
                                     (|ULSCONS;termOutput| (+ |n| |m|)
                                      (SPADCALL |uu| (QREFELT $ 38)) |xxx| $)
                                     |l|)
                                    . #2#)))
                            (EXIT
                             (LETT |uu| (SPADCALL |uu| (QREFELT $ 40)) . #2#)))
                           (LETT |n| (|inc_SI| |n|) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (COND
                       ((|ULSCONS;showAll?| $)
                        (SEQ (LETT |uu1| |uu| . #2#)
                             (EXIT
                              (SEQ (LETT |n| (+ |count| 1) . #2#) G190
                                   (COND
                                    ((NULL
                                      (COND
                                       ((SPADCALL |uu| (QREFELT $ 232))
                                        (NULL
                                         (SPADCALL |uu1|
                                                   (SPADCALL |uu|
                                                             (QREFELT $ 40))
                                                   (QREFELT $ 233))))
                                       ('T NIL)))
                                     (GO G191)))
                                   (SEQ
                                    (COND
                                     ((SPADCALL (SPADCALL |uu| (QREFELT $ 38))
                                                (|spadConstant| $ 14)
                                                (QREFELT $ 231))
                                      (LETT |l|
                                            (CONS
                                             (|ULSCONS;termOutput| (+ |n| |m|)
                                              (SPADCALL |uu| (QREFELT $ 38))
                                              |xxx| $)
                                             |l|)
                                            . #2#)))
                                    (COND
                                     ((ODDP |n|)
                                      (LETT |uu1|
                                            (SPADCALL |uu1| (QREFELT $ 40))
                                            . #2#)))
                                    (EXIT
                                     (LETT |uu| (SPADCALL |uu| (QREFELT $ 40))
                                           . #2#)))
                                   (LETT |n| (+ |n| 1) . #2#) (GO G190) G191
                                   (EXIT NIL))))))
                      (LETT |l|
                            (COND ((SPADCALL |uu| (QREFELT $ 234)) |l|)
                                  (#3#
                                   (SEQ
                                    (COND
                                     ((SPADCALL |uu|
                                                (SPADCALL |uu| (QREFELT $ 40))
                                                (QREFELT $ 233))
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |uu| (QREFELT $ 38))
                                         (|spadConstant| $ 14) (QREFELT $ 58))
                                        (EXIT |l|)))))
                                    (EXIT
                                     (CONS
                                      (SPADCALL (SPADCALL 'O (QREFELT $ 235))
                                                (LIST
                                                 (SPADCALL |xxx|
                                                           (SPADCALL
                                                            (+ |n| |m|)
                                                            (QREFELT $ 226))
                                                           (QREFELT $ 227)))
                                                (QREFELT $ 237))
                                      |l|)))))
                            . #2#)
                      (EXIT
                       (COND
                        ((NULL |l|)
                         (SPADCALL (|spadConstant| $ 14) (QREFELT $ 225)))
                        (#3#
                         (SPADCALL (ELT $ 238) (NREVERSE |l|)
                                   (QREFELT $ 241)))))))))))) 

(SDEFUN |ULSCONS;coerce;$Of;98| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|xxx| (|OutputForm|)) (|cen| (|Coef|)) (|var| (|Symbol|))
          (|p| (|Stream| |Coef|)) (|uts| (UTS)) (|m| (|Integer|)))
         (SEQ
          (LETT |x| (SPADCALL |$streamCount| |x| (QREFELT $ 24))
                . #1=(|ULSCONS;coerce;$Of;98|))
          (LETT |m| (SPADCALL |x| (QREFELT $ 12)) . #1#)
          (LETT |uts| (|ULSCONS;getUTS| |x| $) . #1#)
          (LETT |p| (SPADCALL |uts| (QREFELT $ 46)) . #1#)
          (LETT |var| (SPADCALL |uts| (QREFELT $ 88)) . #1#)
          (LETT |cen| (SPADCALL |uts| (QREFELT $ 90)) . #1#)
          (LETT |xxx|
                (COND
                 ((SPADCALL |cen| (QREFELT $ 39))
                  (SPADCALL |var| (QREFELT $ 235)))
                 ('T
                  (SPADCALL
                   (SPADCALL (SPADCALL |var| (QREFELT $ 235))
                             (SPADCALL |cen| (QREFELT $ 225)) (QREFELT $ 242))
                   (QREFELT $ 243))))
                . #1#)
          (EXIT (|ULSCONS;termsToOutputForm| |m| |p| |xxx| $))))) 

(DECLAIM (NOTINLINE |UnivariateLaurentSeriesConstructor;|)) 

(DEFUN |UnivariateLaurentSeriesConstructor| (&REST #1=#:G1196)
  (SPROG NIL
         (PROG (#2=#:G1197)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariateLaurentSeriesConstructor|)
                                               '|domainEqualList|)
                    . #3=(|UnivariateLaurentSeriesConstructor|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |UnivariateLaurentSeriesConstructor;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariateLaurentSeriesConstructor|)))))))))) 

(DEFUN |UnivariateLaurentSeriesConstructor;| (|#1| |#2|)
  (SPROG
   ((#1=#:G1195 NIL) (|pv$| NIL) (#2=#:G1184 NIL) (#3=#:G1185 NIL)
    (#4=#:G1187 NIL) (#5=#:G1188 NIL) (#6=#:G1189 NIL) (#7=#:G1190 NIL)
    (#8=#:G1191 NIL) (#9=#:G1193 NIL) (#10=#:G1194 NIL) ($ NIL) (|dv$| NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #11=(|UnivariateLaurentSeriesConstructor|))
    (LETT DV$2 (|devaluate| |#2|) . #11#)
    (LETT |dv$| (LIST '|UnivariateLaurentSeriesConstructor| DV$1 DV$2) . #11#)
    (LETT $ (GETREFV 286) . #11#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiGroup|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|RetractableTo|
                                                              (|Symbol|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|ConvertibleTo|
                                                              (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|RealConstant|)))
                                        (LETT #10#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              '(|OrderedIntegralDomain|)))
                                              . #11#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|)))
                                         #10#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|RetractableTo|
                                                              (|Integer|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|StepThrough|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            (LIST
                                                             '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#2|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#2|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            (LIST '|Eltable|
                                                                  (|devaluate|
                                                                   |#2|)
                                                                  (|devaluate|
                                                                   |#2|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|LinearlyExplicitOver|
                                                              (|Integer|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|ConvertibleTo|
                                                              (|Pattern|
                                                               (|Float|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|ConvertibleTo|
                                                              (|Pattern|
                                                               (|Integer|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|PatternMatchable|
                                                              (|Float|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|PatternMatchable|
                                                              (|Integer|))))
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #11#)
                                        (OR #9#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Integer|))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #11#)
                                        (OR #9# (|HasCategory| |#1| '(|Field|))
                                            #8#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #8#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|Comparable|)))
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              '(|OrderedSet|)))
                                              . #11#)
                                        (OR #10# #7#)
                                        (OR
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#2|
                                                             '(|Comparable|)))
                                         #10# #7#)
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (LETT #6#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicNonZero|))
                                              . #11#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              #6#))
                                        (LETT #5#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|))
                                              . #11#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             #5#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|IntegerNumberSystem|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|EuclideanDomain|)))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              . #11#)
                                        (OR #4#
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|ConvertibleTo|
                                                              (|Pattern|
                                                               (|Float|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|ConvertibleTo|
                                                              (|Pattern|
                                                               (|Integer|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|ConvertibleTo|
                                                              (|InputForm|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            (LIST '|Eltable|
                                                                  (|devaluate|
                                                                   |#2|)
                                                                  (|devaluate|
                                                                   |#2|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#2|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            (LIST
                                                             '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#2|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|LinearlyExplicitOver|
                                                              (|Integer|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|PatternMatchable|
                                                              (|Float|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|PatternMatchable|
                                                              (|Integer|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|RetractableTo|
                                                              (|Integer|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|RetractableTo|
                                                              (|Symbol|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|Comparable|)))
                                            #10# #7#
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             #5#)
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|RealConstant|)))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|StepThrough|))))
                                        (OR
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|AlgebraicallyClosedFunctionSpace|
                                                               (|Integer|)))
                                              (|HasCategory| |#1|
                                                             '(|PrimitiveFunctionCategory|))
                                              (|HasCategory| |#1|
                                                             '(|TranscendentalFunctionCategory|)))
                                         (AND #4#
                                              (|HasSignature| |#1|
                                                              (LIST
                                                               '|integrate|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|))))
                                              (|HasSignature| |#1|
                                                              (LIST
                                                               '|variables|
                                                               (LIST
                                                                '(|List|
                                                                  (|Symbol|))
                                                                (|devaluate|
                                                                 |#1|))))))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Integer|)
                                                               (|devaluate|
                                                                |#1|))))
                                        (OR (|HasCategory| |#1| '(|SemiRing|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasSignature| |#1|
                                                          (LIST '*
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Integer|)
                                                                 (|devaluate|
                                                                  |#1|)))))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))))
                                        (OR
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#2|
                                                             '(|DifferentialRing|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #11#)
                                        (OR #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicNonZero|))
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicZero|))
                                            #9# (|HasCategory| |#1| '(|Field|))
                                            #8# #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #11#)
                                        (OR
                                         (AND #4#
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianMonoid|)))
                                         #2#
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #2#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))))
                    . #11#))
    (|haddProp| |$ConstructorCache| '|UnivariateLaurentSeriesConstructor|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 4503599627370496))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|Field|))
                (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #11#)
     (|augmentPredVector| $ 9007199254740992))
    (AND
     (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
         (AND (|HasCategory| |#1| '(|Field|)) #6#) #1#)
     (|augmentPredVector| $ 18014398509481984))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 36028797018963968))
    (AND
     (OR (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 72057594037927936))
    (AND
     (OR (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 144115188075855872))
    (AND
     (OR (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #3#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 288230376151711744))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 576460752303423488))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 1152921504606846976))
    (AND
     (OR #2# (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 2305843009213693952))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|Record| (|:| |expon| (|Integer|)) (|:| |ps| |#2|)))
    (COND
     ((|testBitVector| |pv$| 22)
      (PROGN
       (QSETREFV $ 113
                 (CONS (|dispatchFunction| |ULSCONS;rationalFunction;$IF;40|)
                       $))
       (QSETREFV $ 115
                 (CONS (|dispatchFunction| |ULSCONS;rationalFunction;$2IF;41|)
                       $))
       (QSETREFV $ 117 (CONS (|dispatchFunction| |ULSCONS;exquo;2$U;42|) $)))))
    (COND
     ((|HasSignature| |#1|
                      (LIST '|coerce| (LIST (|devaluate| |#1|) '(|Symbol|))))
      (COND
       ((|testBitVector| |pv$| 20)
        (QSETREFV $ 123
                  (CONS (|dispatchFunction| |ULSCONS;approximate;$ICoef;43|)
                        $))))))
    (COND
     ((|HasCategory| |#1| '(|PartialDifferentialRing| (|Symbol|)))
      (QSETREFV $ 141
                (CONS (|dispatchFunction| |ULSCONS;differentiate;$S$;50|) $))))
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (QSETREFV $ 144 (CONS (|dispatchFunction| |ULSCONS;retract;$UTS;52|) $))
       (QSETREFV $ 145
                 (CONS (|dispatchFunction| |ULSCONS;retractIfCan;$U;53|) $))
       (QSETREFV $ 147 (CONS (|dispatchFunction| |ULSCONS;^;$I$;54|) $))
       (QSETREFV $ 148 (CONS (|dispatchFunction| |ULSCONS;*;UTS2$;55|) $))
       (QSETREFV $ 149 (CONS (|dispatchFunction| |ULSCONS;*;$UTS$;56|) $))
       (QSETREFV $ 146 (CONS (|dispatchFunction| |ULSCONS;inv;2$;57|) $))
       (QSETREFV $ 150 (CONS (|dispatchFunction| |ULSCONS;/;3$;58|) $))
       (QSETREFV $ 151 (CONS (|dispatchFunction| |ULSCONS;/;2UTS$;59|) $))
       (QSETREFV $ 152 (CONS (|dispatchFunction| |ULSCONS;numer;$UTS;60|) $))
       (QSETREFV $ 153
                 (CONS (|dispatchFunction| |ULSCONS;denom;$UTS;61|) $)))))
    (COND
     ((|testBitVector| |pv$| 36)
      (PROGN
       (QSETREFV $ 156 (CONS (|dispatchFunction| |ULSCONS;coerce;F$;62|) $))
       (COND
        ((|testBitVector| |pv$| 2)
         (QSETREFV $ 159 (CONS (|dispatchFunction| |ULSCONS;^;$F$;63|) $))))
       (QSETREFV $ 161 (CONS (|dispatchFunction| |ULSCONS;exp;2$;64|) $))
       (QSETREFV $ 163 (CONS (|dispatchFunction| |ULSCONS;log;2$;65|) $))
       (QSETREFV $ 165 (CONS (|dispatchFunction| |ULSCONS;sin;2$;66|) $))
       (QSETREFV $ 167 (CONS (|dispatchFunction| |ULSCONS;cos;2$;67|) $))
       (QSETREFV $ 169 (CONS (|dispatchFunction| |ULSCONS;tan;2$;68|) $))
       (QSETREFV $ 171 (CONS (|dispatchFunction| |ULSCONS;cot;2$;69|) $))
       (QSETREFV $ 173 (CONS (|dispatchFunction| |ULSCONS;sec;2$;70|) $))
       (QSETREFV $ 175 (CONS (|dispatchFunction| |ULSCONS;csc;2$;71|) $))
       (QSETREFV $ 177 (CONS (|dispatchFunction| |ULSCONS;asin;2$;72|) $))
       (QSETREFV $ 179 (CONS (|dispatchFunction| |ULSCONS;acos;2$;73|) $))
       (QSETREFV $ 181 (CONS (|dispatchFunction| |ULSCONS;atan;2$;74|) $))
       (QSETREFV $ 183 (CONS (|dispatchFunction| |ULSCONS;acot;2$;75|) $))
       (QSETREFV $ 185 (CONS (|dispatchFunction| |ULSCONS;asec;2$;76|) $))
       (QSETREFV $ 187 (CONS (|dispatchFunction| |ULSCONS;acsc;2$;77|) $))
       (QSETREFV $ 189 (CONS (|dispatchFunction| |ULSCONS;sinh;2$;78|) $))
       (QSETREFV $ 191 (CONS (|dispatchFunction| |ULSCONS;cosh;2$;79|) $))
       (QSETREFV $ 193 (CONS (|dispatchFunction| |ULSCONS;tanh;2$;80|) $))
       (QSETREFV $ 195 (CONS (|dispatchFunction| |ULSCONS;coth;2$;81|) $))
       (QSETREFV $ 197 (CONS (|dispatchFunction| |ULSCONS;sech;2$;82|) $))
       (QSETREFV $ 199 (CONS (|dispatchFunction| |ULSCONS;csch;2$;83|) $))
       (QSETREFV $ 201 (CONS (|dispatchFunction| |ULSCONS;asinh;2$;84|) $))
       (QSETREFV $ 203 (CONS (|dispatchFunction| |ULSCONS;acosh;2$;85|) $))
       (QSETREFV $ 205 (CONS (|dispatchFunction| |ULSCONS;atanh;2$;86|) $))
       (QSETREFV $ 207 (CONS (|dispatchFunction| |ULSCONS;acoth;2$;87|) $))
       (QSETREFV $ 209 (CONS (|dispatchFunction| |ULSCONS;asech;2$;88|) $))
       (QSETREFV $ 211 (CONS (|dispatchFunction| |ULSCONS;acsch;2$;89|) $))
       NIL
       (QSETREFV $ 215 (CONS (|dispatchFunction| |ULSCONS;integrate;2$;91|) $))
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
           (QSETREFV $ 220
                     (CONS (|dispatchFunction| |ULSCONS;integrate;$S$;92|)
                           $))))))
       (COND
        ((|HasCategory| |#1| '(|TranscendentalFunctionCategory|))
         (COND
          ((|HasCategory| |#1| '(|PrimitiveFunctionCategory|))
           (COND
            ((|HasCategory| |#1|
                            '(|AlgebraicallyClosedFunctionSpace| (|Integer|)))
             (PROGN
              (QSETREFV $ 220
                        (CONS (|dispatchFunction| |ULSCONS;integrate;$S$;94|)
                              $))))))))))))
    $))) 

(MAKEPROP '|UnivariateLaurentSeriesConstructor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Integer|) |ULSCONS;laurent;IUTS$;3| |ULSCONS;taylorRep;$UTS;4|
              |ULSCONS;degree;$I;5|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |ULSCONS;Zero;$;6|) $))
              (0 . |Zero|) (4 . |Zero|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |ULSCONS;One;$;7|) $))
              (8 . |One|) (12 . |coerce|) |ULSCONS;monomial;CoefI$;8|
              |ULSCONS;coerce;UTS$;9| |ULSCONS;coerce;Coef$;10| (17 . |coerce|)
              |ULSCONS;coerce;I$;11| |ULSCONS;removeZeroes;I2$;22| (22 . |One|)
              (|NonNegativeInteger|) (26 . |monomial|) (32 . *)
              (|Union| 7 '"failed") |ULSCONS;taylorIfCan;$U;12|
              |ULSCONS;taylor;$UTS;13| (|Boolean|) (|Stream| 6) (38 . |empty?|)
              (|Record| (|:| |k| 9) (|:| |c| 6)) (|Stream| 35) (43 . |empty|)
              (47 . |frst|) (52 . |zero?|) (57 . |rst|) (62 . |One|) (66 . +)
              (72 . |concat|) (|Mapping| $) (78 . |delay|)
              (83 . |coefficients|) |ULSCONS;terms;$S;18| (88 . |empty?|)
              (93 . |empty|) (97 . |frst|) (102 . =) (108 . |rst|)
              (113 . |concat|) (119 . |delay|) (124 . |series|)
              |ULSCONS;series;S$;20| (129 . |coefficient|) (135 . =)
              (141 . |quoByVar|) |ULSCONS;removeZeroes;2$;21| (146 . <=)
              (152 . =) (158 . >) |ULSCONS;=;2$B;23| |ULSCONS;pole?;$B;24|
              (164 . +) |ULSCONS;+;3$;25| (170 . -) |ULSCONS;-;3$;26|
              |ULSCONS;*;3$;27| (176 . |zero?|) (181 . *) (187 . ^)
              |ULSCONS;^;$Nni$;28| |ULSCONS;coefficient;$ICoef;34|
              (|Union| $ '"failed") (193 . |recip|) |ULSCONS;recip;$U;29|
              (198 . |elt|) |ULSCONS;elt;3$;30| (204 . |recip|) (209 . ^)
              (215 . |eval|) (|StreamTaylorSeriesOperations| 6) (221 . *)
              |ULSCONS;eval;$CoefS;31| (|Symbol|) (227 . |variable|)
              |ULSCONS;variable;$S;32| (232 . |center|)
              |ULSCONS;center;$Coef;33| |ULSCONS;elt;$ICoef;35| (237 . |order|)
              |ULSCONS;order;$I;36| (242 . |order|) |ULSCONS;order;$2I;37|
              (248 . |truncate|) |ULSCONS;truncate;$I$;38| (254 . |truncate|)
              |ULSCONS;truncate;$2I$;39| (|Fraction| 103) (261 . |Zero|)
              (|Polynomial| 6) (265 . |polynomial|) (271 . |coerce|)
              (276 . |coerce|) (281 . |coerce|) (286 . |positive?|) (291 . -)
              (297 . ^) (303 . *) (309 . /) (315 . |rationalFunction|)
              (321 . |polynomial|) (328 . |rationalFunction|) (335 . |exquo|)
              (341 . |exquo|) (347 . |approximate|) (353 . |coerce|) (358 . -)
              (364 . ^) (370 . *) (376 . |approximate|) (382 . |complete|)
              |ULSCONS;complete;2$;44| (387 . |extend|) |ULSCONS;extend;$I$;45|
              (|Mapping| 6 6) (393 . |map|) |ULSCONS;map;M2$;46|
              (|Mapping| 6 9) (399 . |multiplyCoefficients|)
              |ULSCONS;multiplyCoefficients;M2$;47| (|PositiveInteger|)
              (405 . *) (411 . |multiplyExponents|)
              |ULSCONS;multiplyExponents;$Pi$;48| |ULSCONS;differentiate;2$;49|
              (417 . |differentiate|) (423 . *) (429 . |differentiate|)
              (435 . |characteristic|) |ULSCONS;characteristic;Nni;51|
              (439 . |retract|) (444 . |retractIfCan|) (449 . |inv|) (454 . ^)
              (460 . *) (466 . *) (472 . /) (478 . /) (484 . |numer|)
              (489 . |denom|) (|Fraction| 9) (494 . |coerce|) (499 . |coerce|)
              (|ElementaryFunctionsUnivariateLaurentSeries| 6 7 $$) (504 . ^)
              (510 . ^) (516 . |exp|) (521 . |exp|) (526 . |log|) (531 . |log|)
              (536 . |sin|) (541 . |sin|) (546 . |cos|) (551 . |cos|)
              (556 . |tan|) (561 . |tan|) (566 . |cot|) (571 . |cot|)
              (576 . |sec|) (581 . |sec|) (586 . |csc|) (591 . |csc|)
              (596 . |asin|) (601 . |asin|) (606 . |acos|) (611 . |acos|)
              (616 . |atan|) (621 . |atan|) (626 . |acot|) (631 . |acot|)
              (636 . |asec|) (641 . |asec|) (646 . |acsc|) (651 . |acsc|)
              (656 . |sinh|) (661 . |sinh|) (666 . |cosh|) (671 . |cosh|)
              (676 . |tanh|) (681 . |tanh|) (686 . |coth|) (691 . |coth|)
              (696 . |sech|) (701 . |sech|) (706 . |csch|) (711 . |csch|)
              (716 . |asinh|) (721 . |asinh|) (726 . |acosh|) (731 . |acosh|)
              (736 . |atanh|) (741 . |atanh|) (746 . |acoth|) (751 . |acoth|)
              (756 . |asech|) (761 . |asech|) (766 . |acsch|) (771 . |acsch|)
              (776 . |coerce|) (781 . |inv|) (786 . -) (791 . |integrate|)
              (|List| 87) (796 . |variables|) (801 . |entry?|)
              (807 . |integrate|) (813 . |integrate|) (|Union| 6 (|List| 6))
              (|FunctionSpaceIntegration| 9 6) (819 . |integrate|)
              (|OutputForm|) (825 . |coerce|) (830 . |coerce|) (835 . ^)
              (841 . -) (846 . -) (851 . *) (857 . ~=)
              (863 . |explicitEntries?|) (868 . |eq?|)
              (874 . |explicitlyEmpty?|) (879 . |coerce|) (|List| $)
              (884 . |prefix|) (890 . +) (|Mapping| 224 224 224) (|List| 224)
              (896 . |reduce|) (902 . -) (908 . |paren|)
              |ULSCONS;coerce;$Of;98| (|Union| 255 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| 262) (|Pattern| 9) (|List| 7)
              (|List| 252) (|Equation| 7) (|Matrix| 9)
              (|Record| (|:| |mat| 253) (|:| |vec| (|Vector| 9))) (|Vector| $)
              (|PatternMatchResult| 262 $) (|PatternMatchResult| 9 $)
              (|Factored| 259) (|SparseUnivariatePolynomial| $)
              (|Union| 261 '#1#) (|List| 259) (|Float|) (|DoubleFloat|)
              (|Union| 154 '#2="failed") (|Union| 9 '#2#) (|Union| 87 '#2#)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|List| 26) (|Mapping| 7 7)
              (|Record| (|:| |mat| 271) (|:| |vec| (|Vector| 7))) (|Matrix| 7)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Union| 236 '"failed")
              (|Record| (|:| |coef| 236) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 276 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|List| 282) (|List| 9) (|SingletonAsOrderedSet|)
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 913 |zero?| 919 |wholePart| 924 |variables| 929 |variable| 934
              |unitNormal| 939 |unitCanonical| 944 |unit?| 949 |truncate| 954
              |terms| 967 |taylorRep| 972 |taylorIfCan| 977 |taylor| 982 |tanh|
              987 |tan| 992 |subtractIfCan| 997 |squareFreePolynomial| 1003
              |squareFreePart| 1008 |squareFree| 1013 |sqrt| 1018
              |solveLinearPolynomialEquation| 1023 |smaller?| 1029 |sizeLess?|
              1035 |sinh| 1041 |sin| 1046 |sign| 1051 |series| 1056 |sech| 1061
              |sec| 1066 |sample| 1071 |rightRecip| 1075 |rightPower| 1080
              |retractIfCan| 1092 |retract| 1112 |removeZeroes| 1132 |rem| 1143
              |reductum| 1149 |reducedSystem| 1154 |recip| 1176
              |rationalFunction| 1181 |quo| 1194 |principalIdeal| 1200 |prime?|
              1205 |positive?| 1210 |pole?| 1215 |pi| 1220 |patternMatch| 1224
              |order| 1238 |opposite?| 1249 |one?| 1255 |numerator| 1260
              |numer| 1265 |nthRoot| 1270 |nextItem| 1276 |negative?| 1281
              |multiplyExponents| 1286 |multiplyCoefficients| 1292
              |multiEuclidean| 1298 |monomial?| 1304 |monomial| 1309 |min| 1329
              |max| 1335 |map| 1341 |log| 1353 |leftRecip| 1358 |leftPower|
              1363 |leadingMonomial| 1375 |leadingCoefficient| 1380 |lcmCoef|
              1385 |lcm| 1391 |laurent| 1402 |latex| 1414 |inv| 1419
              |integrate| 1424 |init| 1435 |hashUpdate!| 1439 |hash| 1445
              |gcdPolynomial| 1450 |gcd| 1456 |fractionPart| 1467 |floor| 1472
              |factorSquareFreePolynomial| 1477 |factorPolynomial| 1482
              |factor| 1487 |extendedEuclidean| 1492 |extend| 1505 |exquo| 1511
              |expressIdealMember| 1517 |exp| 1523 |eval| 1528 |euclideanSize|
              1574 |elt| 1579 |divide| 1597 |differentiate| 1603 |denominator|
              1653 |denom| 1658 |degree| 1663 |csch| 1668 |csc| 1673 |coth|
              1678 |cot| 1683 |cosh| 1688 |cos| 1693 |convert| 1698
              |conditionP| 1723 |complete| 1728 |commutator| 1733 |coerce| 1739
              |coefficient| 1774 |charthRoot| 1780 |characteristic| 1785
              |center| 1789 |ceiling| 1794 |atanh| 1799 |atan| 1804
              |associator| 1809 |associates?| 1816 |asinh| 1822 |asin| 1827
              |asech| 1832 |asec| 1837 |approximate| 1842 |antiCommutator| 1848
              |annihilate?| 1854 |acsch| 1860 |acsc| 1865 |acoth| 1870 |acot|
              1875 |acosh| 1880 |acos| 1885 |abs| 1890 ^ 1895 |Zero| 1925 |One|
              1929 D 1933 >= 1983 > 1989 = 1995 <= 2001 < 2007 / 2013 - 2031 +
              2042 * 2048)
           'NIL
           (CONS
            (|makeByteWordVec2| 52
                                '(0 0 2 2 0 2 33 0 2 2 0 2 6 24 2 2 23 6 2 2 19
                                  23 24 37 31 7 2 42 43 2 13 46 41 46 0 19 23
                                  37 2 0 0 45 37 6 2 0 0 0 0 37 37 6 2 2 46 52
                                  6 51 41 41 6 0 0 50 41 27 2 0 0 28 9 2 16 17
                                  0 37 5 11 2 0 0 0 0 1 23 24 2 2 37 37 37 37
                                  37 37 45 3 4 5 5 27 8 8 10 11 12 14 15 2))
            (CONS
             '#(|UnivariateLaurentSeriesConstructorCategory&|
                |UnivariateLaurentSeriesCategory&| |QuotientFieldCategory&|
                |Field&| |UnivariatePowerSeriesCategory&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| |PowerSeriesCategory&| NIL
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL NIL NIL |DivisionRing&| NIL |OrderedRing&|
                |DifferentialExtension&| |FullyLinearlyExplicitOver&|
                |Algebra&| |Algebra&| |EntireRing&| |Algebra&| NIL NIL
                |Algebra&| |PartialDifferentialRing&| |DifferentialRing&| NIL
                NIL NIL NIL |Rng&| NIL |Module&| |Module&| |Module&| |Module&|
                NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL NIL
                NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&| NIL NIL
                NIL NIL NIL |NonAssociativeSemiRng&| NIL |AbelianMonoid&|
                |MagmaWithUnit&| |OrderedSet&| NIL |Magma&| |AbelianSemiGroup&|
                NIL NIL |FullyEvalableOver&| NIL NIL |SetCategory&|
                |TranscendentalFunctionCategory&| NIL |Evalable&| NIL
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&| NIL |RetractableTo&| NIL NIL NIL
                |PartialOrder&| |RetractableTo&| |RetractableTo&|
                |InnerEvalable&| |InnerEvalable&| NIL NIL NIL NIL)
             (CONS
              '#((|UnivariateLaurentSeriesConstructorCategory| 6 7)
                 (|UnivariateLaurentSeriesCategory| 6)
                 (|QuotientFieldCategory| 7) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 9) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|)
                 (|PowerSeriesCategory| 6 9 282) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 9)
                 (|GcdDomain|) (|OrderedIntegralDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|DivisionRing|) (|CommutativeRing|)
                 (|OrderedRing|) (|DifferentialExtension| 7)
                 (|FullyLinearlyExplicitOver| 7) (|Algebra| 6) (|Algebra| $$)
                 (|EntireRing|) (|Algebra| 154) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 7)
                 (|PartialDifferentialRing| 87) (|DifferentialRing|)
                 (|LinearlyExplicitOver| 7) (|LinearlyExplicitOver| 9) (|Ring|)
                 (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 6) (|Module| $$)
                 (|Module| 154) (|Module| 7) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 154 154)
                 (|OrderedAbelianGroup|) (|BiModule| 7 7) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 154) (|RightModule| 154)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| 7)
                 (|RightModule| 7) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|OrderedAbelianSemiGroup|) (|NonAssociativeSemiRng|)
                 (|SemiGroup|) (|AbelianMonoid|) (|MagmaWithUnit|)
                 (|OrderedSet|) (|FullyPatternMatchable| 7) (|Magma|)
                 (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|FullyEvalableOver| 7) (|PatternMatchable| 262)
                 (|PatternMatchable| 9) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|RealConstant|)
                 (|Evalable| 7) (|Patternable| 7) (|RetractableTo| 7)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 224) (|Eltable| $$ $$) (|CommutativeStar|)
                 (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|unitsKnown|) (|RetractableTo| 87) (|ConvertibleTo| 247)
                 (|ConvertibleTo| 263) (|ConvertibleTo| 262) (|PartialOrder|)
                 (|RetractableTo| 154) (|RetractableTo| 9)
                 (|InnerEvalable| 87 7) (|InnerEvalable| 7 7) (|Eltable| 7 $$)
                 (|ConvertibleTo| 248) (|ConvertibleTo| 249) (|Type|))
              (|makeByteWordVec2| 285
                                  '(0 6 0 14 0 7 0 15 0 7 0 17 1 7 0 6 18 1 6 0
                                    9 22 0 6 0 25 2 7 0 6 26 27 2 7 0 0 0 28 1
                                    33 32 0 34 0 36 0 37 1 33 6 0 38 1 6 32 0
                                    39 1 33 0 0 40 0 9 0 41 2 9 0 0 0 42 2 36 0
                                    35 0 43 1 36 0 44 45 1 7 33 0 46 1 36 32 0
                                    48 0 33 0 49 1 36 35 0 50 2 9 32 0 0 51 1
                                    36 0 0 52 2 33 0 6 0 53 1 33 0 44 54 1 7 0
                                    33 55 2 7 6 0 26 57 2 6 32 0 0 58 1 7 0 0
                                    59 2 9 32 0 0 61 2 7 32 0 0 62 2 9 32 0 0
                                    63 2 7 0 0 0 66 2 7 0 0 0 68 1 0 32 0 71 2
                                    9 0 26 0 72 2 7 0 0 26 73 1 7 76 0 77 2 7 0
                                    0 0 79 1 6 76 0 81 2 6 0 0 26 82 2 7 33 0 6
                                    83 2 84 33 6 33 85 1 7 87 0 88 1 7 6 0 90 1
                                    7 26 0 93 2 7 26 0 26 95 2 7 0 0 26 97 3 7
                                    0 0 26 26 99 0 101 0 102 2 7 103 0 26 104 1
                                    101 0 103 105 1 101 0 87 106 1 103 0 6 107
                                    1 9 32 0 108 2 101 0 0 0 109 2 101 0 0 9
                                    110 2 101 0 0 0 111 2 101 0 0 0 112 2 0 101
                                    0 9 113 3 7 103 0 26 26 114 3 0 101 0 9 9
                                    115 2 7 76 0 0 116 2 0 76 0 0 117 2 7 6 0
                                    26 118 1 6 0 87 119 2 6 0 0 0 120 2 6 0 0 9
                                    121 2 6 0 0 0 122 2 0 6 0 9 123 1 7 0 0 124
                                    2 7 0 0 26 126 2 7 0 128 0 129 2 7 0 131 0
                                    132 2 9 0 134 0 135 2 7 0 0 134 136 2 6 0 0
                                    87 139 2 0 0 6 0 140 2 0 0 0 87 141 0 6 26
                                    142 1 0 7 0 144 1 0 29 0 145 1 0 0 0 146 2
                                    0 0 0 9 147 2 0 0 7 0 148 2 0 0 0 7 149 2 0
                                    0 0 0 150 2 0 0 7 7 151 1 0 7 0 152 1 0 7 0
                                    153 1 6 0 154 155 1 0 0 154 156 2 157 2 2
                                    154 158 2 0 0 0 154 159 1 157 2 2 160 1 0 0
                                    0 161 1 157 2 2 162 1 0 0 0 163 1 157 2 2
                                    164 1 0 0 0 165 1 157 2 2 166 1 0 0 0 167 1
                                    157 2 2 168 1 0 0 0 169 1 157 2 2 170 1 0 0
                                    0 171 1 157 2 2 172 1 0 0 0 173 1 157 2 2
                                    174 1 0 0 0 175 1 157 2 2 176 1 0 0 0 177 1
                                    157 2 2 178 1 0 0 0 179 1 157 2 2 180 1 0 0
                                    0 181 1 157 2 2 182 1 0 0 0 183 1 157 2 2
                                    184 1 0 0 0 185 1 157 2 2 186 1 0 0 0 187 1
                                    157 2 2 188 1 0 0 0 189 1 157 2 2 190 1 0 0
                                    0 191 1 157 2 2 192 1 0 0 0 193 1 157 2 2
                                    194 1 0 0 0 195 1 157 2 2 196 1 0 0 0 197 1
                                    157 2 2 198 1 0 0 0 199 1 157 2 2 200 1 0 0
                                    0 201 1 157 2 2 202 1 0 0 0 203 1 157 2 2
                                    204 1 0 0 0 205 1 157 2 2 206 1 0 0 0 207 1
                                    157 2 2 208 1 0 0 0 209 1 157 2 2 210 1 0 0
                                    0 211 1 154 0 9 212 1 154 0 0 213 1 0 0 0
                                    214 1 0 0 0 215 1 6 216 0 217 2 216 32 87 0
                                    218 2 6 0 0 87 219 2 0 0 0 87 220 2 222 221
                                    6 87 223 1 6 224 0 225 1 9 224 0 226 2 224
                                    0 0 0 227 1 6 0 0 228 1 224 0 0 229 2 224 0
                                    0 0 230 2 6 32 0 0 231 1 33 32 0 232 2 33
                                    32 0 0 233 1 33 32 0 234 1 87 224 0 235 2
                                    224 0 0 236 237 2 224 0 0 0 238 2 240 224
                                    239 0 241 2 224 0 0 0 242 1 224 0 0 243 2 0
                                    32 0 0 1 1 60 32 0 71 1 35 7 0 1 1 0 280 0
                                    1 1 0 87 0 89 1 56 267 0 1 1 56 0 0 1 1 56
                                    32 0 1 3 0 0 0 9 9 100 2 0 0 0 9 98 1 0 36
                                    0 47 1 0 7 0 11 1 0 29 0 30 1 0 7 0 31 1 36
                                    0 0 193 1 36 0 0 169 2 61 76 0 0 1 1 33 258
                                    259 1 1 2 0 0 1 1 2 279 0 1 1 36 0 0 1 2 33
                                    260 261 259 1 2 25 32 0 0 1 2 2 32 0 0 1 1
                                    36 0 0 189 1 36 0 0 165 1 6 9 0 1 1 0 0 36
                                    56 1 36 0 0 197 1 36 0 0 173 0 60 0 1 1 58
                                    76 0 1 2 58 0 0 26 1 2 0 0 0 134 1 1 8 264
                                    0 1 1 8 265 0 1 1 3 266 0 1 1 0 29 0 145 1
                                    8 154 0 1 1 8 9 0 1 1 3 87 0 1 1 0 7 0 144
                                    2 0 0 9 0 24 1 0 0 0 60 2 2 0 0 0 1 1 0 0 0
                                    1 1 13 253 246 1 2 13 254 246 255 1 2 2 270
                                    246 255 1 1 2 271 246 1 1 58 76 0 78 3 22
                                    101 0 9 9 115 2 22 101 0 9 113 2 2 0 0 0 1
                                    1 2 274 236 1 1 2 32 0 1 1 6 32 0 1 1 0 32
                                    0 65 0 36 0 1 3 16 256 0 248 256 1 3 17 257
                                    0 249 257 1 2 0 9 0 9 96 1 0 9 0 94 2 60 32
                                    0 0 1 1 58 32 0 1 1 2 0 0 1 1 2 7 0 152 2
                                    36 0 0 9 1 1 9 76 0 1 1 6 32 0 1 2 0 0 0
                                    134 137 2 0 0 131 0 133 2 2 273 236 0 1 1 0
                                    32 0 1 3 0 0 0 280 281 1 3 0 0 0 282 9 1 2
                                    0 0 6 9 19 2 26 0 0 0 1 2 26 0 0 0 1 2 2 0
                                    269 0 1 2 0 0 128 0 130 1 36 0 0 163 1 58
                                    76 0 1 2 58 0 0 26 1 2 0 0 0 134 1 1 0 0 0
                                    1 1 0 6 0 1 2 2 272 0 0 1 1 2 0 236 1 2 2 0
                                    0 0 1 2 0 0 9 7 10 2 0 0 9 33 1 1 0 284 0 1
                                    1 2 0 0 146 2 38 0 0 87 220 1 36 0 0 215 0
                                    9 0 1 2 0 283 283 0 1 1 0 285 0 1 2 2 259
                                    259 259 1 1 2 0 236 1 2 2 0 0 0 1 1 35 0 0
                                    1 1 34 7 0 1 1 33 258 259 1 1 33 258 259 1
                                    1 2 279 0 1 3 2 277 0 0 0 1 2 2 278 0 0 1 2
                                    0 0 0 9 127 2 56 76 0 0 117 2 2 273 236 0 1
                                    1 36 0 0 161 3 11 0 0 7 7 1 3 11 0 0 250
                                    250 1 2 11 0 0 251 1 2 11 0 0 252 1 3 10 0
                                    0 87 7 1 3 10 0 0 216 250 1 2 20 33 0 6 86
                                    1 2 26 0 1 2 12 0 0 7 1 2 1 0 0 0 80 2 0 6
                                    0 9 92 2 2 275 0 0 1 1 43 0 0 138 2 43 0 0
                                    26 1 2 42 0 0 216 1 2 42 0 0 87 141 3 42 0
                                    0 87 26 1 3 42 0 0 216 268 1 2 2 0 0 269 1
                                    3 2 0 0 269 26 1 1 2 0 0 1 1 2 7 0 153 1 0
                                    9 0 12 1 36 0 0 199 1 36 0 0 175 1 36 0 0
                                    195 1 36 0 0 171 1 36 0 0 191 1 36 0 0 167
                                    1 4 247 0 1 1 14 248 0 1 1 15 249 0 1 1 5
                                    262 0 1 1 5 263 0 1 1 54 245 246 1 1 0 0 0
                                    125 2 59 0 0 0 1 1 53 0 6 21 1 3 0 87 1 1
                                    57 0 0 1 1 59 0 9 23 1 36 0 154 156 1 0 0 7
                                    20 1 0 224 0 244 2 0 6 0 9 75 1 55 76 0 1 0
                                    59 26 143 1 0 6 0 91 1 34 7 0 1 1 36 0 0
                                    205 1 36 0 0 181 3 59 0 0 0 0 1 2 56 32 0 0
                                    1 1 36 0 0 201 1 36 0 0 177 1 36 0 0 209 1
                                    36 0 0 185 2 21 6 0 9 123 2 0 0 0 0 1 2 59
                                    32 0 0 1 1 36 0 0 211 1 36 0 0 187 1 36 0 0
                                    207 1 36 0 0 183 1 36 0 0 203 1 36 0 0 179
                                    1 6 0 0 1 2 58 0 0 26 74 2 36 0 0 154 159 2
                                    36 0 0 0 1 2 2 0 0 9 147 2 0 0 0 134 1 0 60
                                    0 13 0 58 0 16 1 43 0 0 1 2 43 0 0 26 1 2
                                    42 0 0 87 1 3 42 0 0 87 26 1 2 42 0 0 216 1
                                    3 42 0 0 216 268 1 3 2 0 0 269 26 1 2 2 0 0
                                    269 1 2 26 32 0 0 1 2 26 32 0 0 1 2 0 32 0
                                    0 64 2 26 32 0 0 1 2 26 32 0 0 1 2 2 0 7 7
                                    151 2 2 0 0 0 150 2 2 0 0 6 1 1 62 0 0 214
                                    2 62 0 0 0 69 2 0 0 0 0 67 2 62 0 9 0 1 2
                                    60 0 26 0 1 2 36 0 154 0 1 2 36 0 0 154 1 2
                                    2 0 0 7 149 2 2 0 7 0 148 2 0 0 6 0 140 2 0
                                    0 0 6 1 2 0 0 0 0 70 2 0 0 134 0 1)))))
           '|lookupComplete|)) 
