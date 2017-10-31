
(SDEFUN |INTRVL;roundDown| ((|u| R) ($ R))
        (SPROG
         ((|dig| (|Integer|)) (|eu| (|Integer|)) (|l| (|Integer|))
          (|m| (|Integer|)) (|prec| (|PositiveInteger|)))
         (SEQ
          (COND ((SPADCALL |u| (QREFELT $ 9)) |u|)
                (#1='T
                 (SEQ
                  (LETT |prec| (SPADCALL (QREFELT $ 11))
                        . #2=(|INTRVL;roundDown|))
                  (LETT |m| (SPADCALL |u| (QREFELT $ 13)) . #2#)
                  (LETT |l| (INTEGER-LENGTH |m|) . #2#)
                  (LETT |eu| (SPADCALL |u| (QREFELT $ 14)) . #2#)
                  (EXIT
                   (COND
                    ((EQL |l| |prec|) (SPADCALL (- |m| 1) |eu| (QREFELT $ 17)))
                    (#1#
                     (SEQ (LETT |dig| (SPADCALL (QREFELT $ 18)) . #2#)
                          (EXIT
                           (COND
                            ((< |l| |prec|)
                             (SPADCALL
                              (- (* |m| (EXPT |dig| (- |prec| |l|))) 1)
                              (+ (- |eu| |prec|) |l|) (QREFELT $ 17)))
                            (#1#
                             (SPADCALL (- |m| (EXPT |dig| (- |l| |prec|))) |eu|
                                       (QREFELT $ 17))))))))))))))) 

(SDEFUN |INTRVL;roundUp| ((|u| R) ($ R))
        (SPROG
         ((|dig| (|Integer|)) (|eu| (|Integer|)) (|l| (|Integer|))
          (|m| (|Integer|)) (|prec| (|PositiveInteger|)))
         (SEQ
          (COND ((SPADCALL |u| (QREFELT $ 9)) |u|)
                (#1='T
                 (SEQ
                  (LETT |prec| (SPADCALL (QREFELT $ 11))
                        . #2=(|INTRVL;roundUp|))
                  (LETT |m| (SPADCALL |u| (QREFELT $ 13)) . #2#)
                  (LETT |l| (INTEGER-LENGTH |m|) . #2#)
                  (LETT |eu| (SPADCALL |u| (QREFELT $ 14)) . #2#)
                  (EXIT
                   (COND
                    ((EQL |l| |prec|) (SPADCALL (+ |m| 1) |eu| (QREFELT $ 17)))
                    (#1#
                     (SEQ (LETT |dig| (SPADCALL (QREFELT $ 18)) . #2#)
                          (EXIT
                           (COND
                            ((< |l| |prec|)
                             (SPADCALL
                              (+ (* |m| (EXPT |dig| (- |prec| |l|))) 1)
                              (+ (- |eu| |prec|) |l|) (QREFELT $ 17)))
                            (#1#
                             (SPADCALL (+ |m| (EXPT |dig| (- |l| |prec|))) |eu|
                                       (QREFELT $ 17))))))))))))))) 

(SDEFUN |INTRVL;normaliseFloat| ((|u| R) ($ R))
        (SPROG
         ((BASE (|Integer|)) (|l| (|Integer|)) (|b| (|Integer|))
          (|m| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |u| (QREFELT $ 9)) |u|)
                (#1='T
                 (SEQ
                  (LETT |m| (SPADCALL |u| (QREFELT $ 13))
                        . #2=(|INTRVL;normaliseFloat|))
                  (LETT |b| (SPADCALL (QREFELT $ 11)) . #2#)
                  (LETT |l| (INTEGER-LENGTH |m|) . #2#)
                  (EXIT
                   (COND
                    ((< |l| |b|)
                     (SEQ (LETT BASE (SPADCALL (QREFELT $ 18)) . #2#)
                          (EXIT
                           (SPADCALL (* |m| (EXPT BASE (- |b| |l|)))
                                     (+ (- (SPADCALL |u| (QREFELT $ 14)) |b|)
                                        |l|)
                                     (QREFELT $ 17)))))
                    (#1# |u|))))))))) 

(SDEFUN |INTRVL;interval;2R$;4| ((|i| R) (|s| R) ($ $))
        (COND
         ((SPADCALL |i| |s| (QREFELT $ 19))
          (CONS (|INTRVL;roundDown| |s| $) (|INTRVL;roundUp| |i| $)))
         ('T (CONS (|INTRVL;roundDown| |i| $) (|INTRVL;roundUp| |s| $))))) 

(SDEFUN |INTRVL;interval;R$;5| ((|f| R) ($ $))
        (COND ((SPADCALL |f| (QREFELT $ 9)) (|spadConstant| $ 21))
              ((SPADCALL |f| (QREFELT $ 22)) (|spadConstant| $ 15))
              ((QEQCAR (SPADCALL |f| (QREFELT $ 24)) 1)
               (CONS (|INTRVL;roundDown| |f| $) (|INTRVL;roundUp| |f| $)))
              ('T (CONS |f| |f|)))) 

(SDEFUN |INTRVL;qinterval;2R$;6| ((|i| R) (|s| R) ($ $))
        (CONS (|INTRVL;roundDown| |i| $) (|INTRVL;roundUp| |s| $))) 

(PUT '|INTRVL;exactInterval| '|SPADreplace| 'CONS) 

(SDEFUN |INTRVL;exactInterval| ((|i| R) (|s| R) ($ $)) (CONS |i| |s|)) 

(SDEFUN |INTRVL;exactSupInterval| ((|i| R) (|s| R) ($ $))
        (CONS (|INTRVL;roundDown| |i| $) |s|)) 

(SDEFUN |INTRVL;exactInfInterval| ((|i| R) (|s| R) ($ $))
        (CONS |i| (|INTRVL;roundUp| |s| $))) 

(PUT '|INTRVL;inf;$R;10| '|SPADreplace| 'QCAR) 

(SDEFUN |INTRVL;inf;$R;10| ((|u| $) ($ R)) (QCAR |u|)) 

(PUT '|INTRVL;sup;$R;11| '|SPADreplace| 'QCDR) 

(SDEFUN |INTRVL;sup;$R;11| ((|u| $) ($ R)) (QCDR |u|)) 

(SDEFUN |INTRVL;width;$R;12| ((|u| $) ($ R))
        (SPADCALL (QCDR |u|) (QCAR |u|) (QREFELT $ 29))) 

(SDEFUN |INTRVL;contains?;$RB;13| ((|u| $) (|f| R) ($ |Boolean|))
        (COND
         ((SPADCALL |f| (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 19))
          (SPADCALL |f| (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 31)))
         ('T NIL))) 

(SDEFUN |INTRVL;positive?;$B;14| ((|u| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (|spadConstant| $ 33)
                  (QREFELT $ 19))) 

(SDEFUN |INTRVL;negative?;$B;15| ((|u| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (|spadConstant| $ 33)
                  (QREFELT $ 31))) 

(SDEFUN |INTRVL;<;2$B;16| ((|a| $) (|b| $) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |a| (QREFELT $ 27)) (SPADCALL |b| (QREFELT $ 27))
                    (QREFELT $ 31))
          'T)
         ((SPADCALL (SPADCALL |a| (QREFELT $ 27)) (SPADCALL |b| (QREFELT $ 27))
                    (QREFELT $ 19))
          NIL)
         ('T
          (SPADCALL (SPADCALL |a| (QREFELT $ 28)) (SPADCALL |b| (QREFELT $ 28))
                    (QREFELT $ 31))))) 

(SDEFUN |INTRVL;+;3$;17| ((|a| $) (|b| $) ($ $))
        (SPROG ((#1=#:G799 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |a| (QREFELT $ 37))
                    (PROGN
                     (LETT #1# |b| . #2=(|INTRVL;+;3$;17|))
                     (GO #3=#:G798)))
                   ((SPADCALL |b| (QREFELT $ 37))
                    (PROGN (LETT #1# |a| . #2#) (GO #3#))))
                  (COND
                   ((SPADCALL |a| |b| (QREFELT $ 38))
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL 2 (SPADCALL |a| (QREFELT $ 27))
                                      (QREFELT $ 39))
                            (SPADCALL 2 (SPADCALL |a| (QREFELT $ 28))
                                      (QREFELT $ 39))
                            (QREFELT $ 26))
                           . #2#)
                     (GO #3#))))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT $ 27))
                              (SPADCALL |b| (QREFELT $ 27)) (QREFELT $ 40))
                    (SPADCALL (SPADCALL |a| (QREFELT $ 28))
                              (SPADCALL |b| (QREFELT $ 28)) (QREFELT $ 40))
                    (QREFELT $ 26)))))
                #3# (EXIT #1#)))) 

(SDEFUN |INTRVL;-;3$;18| ((|a| $) (|b| $) ($ $))
        (SPROG ((#1=#:G804 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |a| (QREFELT $ 37))
                    (PROGN
                     (LETT #1# (SPADCALL |b| (QREFELT $ 42))
                           . #2=(|INTRVL;-;3$;18|))
                     (GO #3=#:G803)))
                   ((SPADCALL |b| (QREFELT $ 37))
                    (PROGN (LETT #1# |a| . #2#) (GO #3#))))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT $ 27))
                              (SPADCALL |b| (QREFELT $ 28)) (QREFELT $ 29))
                    (SPADCALL (SPADCALL |a| (QREFELT $ 28))
                              (SPADCALL |b| (QREFELT $ 27)) (QREFELT $ 29))
                    (QREFELT $ 26)))))
                #3# (EXIT #1#)))) 

(SDEFUN |INTRVL;*;3$;19| ((|a| $) (|b| $) ($ $))
        (SPROG ((|prods| (|List| R)) (#1=#:G821 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |a| (QREFELT $ 44))
                    (PROGN
                     (LETT #1# |b| . #2=(|INTRVL;*;3$;19|))
                     (GO #3=#:G820)))
                   ((SPADCALL |b| (QREFELT $ 44))
                    (PROGN (LETT #1# |a| . #2#) (GO #3#))))
                  (COND
                   ((OR (SPADCALL |a| (QREFELT $ 37))
                        (SPADCALL |b| (QREFELT $ 37)))
                    (PROGN (LETT #1# (|spadConstant| $ 21) . #2#) (GO #3#))))
                  (LETT |prods|
                        (SPADCALL
                         (LIST
                          (SPADCALL (SPADCALL |a| (QREFELT $ 27))
                                    (SPADCALL |b| (QREFELT $ 27))
                                    (QREFELT $ 45))
                          (SPADCALL (SPADCALL |a| (QREFELT $ 28))
                                    (SPADCALL |b| (QREFELT $ 28))
                                    (QREFELT $ 45))
                          (SPADCALL (SPADCALL |a| (QREFELT $ 27))
                                    (SPADCALL |b| (QREFELT $ 28))
                                    (QREFELT $ 45))
                          (SPADCALL (SPADCALL |a| (QREFELT $ 28))
                                    (SPADCALL |b| (QREFELT $ 27))
                                    (QREFELT $ 45)))
                         (QREFELT $ 47))
                        . #2#)
                  (EXIT
                   (SPADCALL (|SPADfirst| |prods|)
                             (SPADCALL |prods| (QREFELT $ 48))
                             (QREFELT $ 26)))))
                #3# (EXIT #1#)))) 

(SDEFUN |INTRVL;*;I2$;20| ((|a| |Integer|) (|b| $) ($ $))
        (COND
         ((SPADCALL |a| 0 (QREFELT $ 50))
          (SPADCALL (SPADCALL |a| (SPADCALL |b| (QREFELT $ 27)) (QREFELT $ 51))
                    (SPADCALL |a| (SPADCALL |b| (QREFELT $ 28)) (QREFELT $ 51))
                    (QREFELT $ 26)))
         ((< |a| 0)
          (SPADCALL (SPADCALL |a| (SPADCALL |b| (QREFELT $ 28)) (QREFELT $ 51))
                    (SPADCALL |a| (SPADCALL |b| (QREFELT $ 27)) (QREFELT $ 51))
                    (QREFELT $ 26)))
         ('T (|spadConstant| $ 21)))) 

(SDEFUN |INTRVL;*;Pi2$;21| ((|a| |PositiveInteger|) (|b| $) ($ $))
        (SPADCALL (SPADCALL |a| (SPADCALL |b| (QREFELT $ 27)) (QREFELT $ 39))
                  (SPADCALL |a| (SPADCALL |b| (QREFELT $ 28)) (QREFELT $ 39))
                  (QREFELT $ 26))) 

(SDEFUN |INTRVL;^;$Pi$;22| ((|a| $) (|n| |PositiveInteger|) ($ $))
        (SEQ
         (COND
          ((SPADCALL |a| (|spadConstant| $ 33) (QREFELT $ 32))
           (COND
            ((ZEROP (REM |n| 2))
             (EXIT
              (SPADCALL (|spadConstant| $ 33)
                        (SPADCALL
                         (SPADCALL (SPADCALL |a| (QREFELT $ 27)) |n|
                                   (QREFELT $ 54))
                         (SPADCALL (SPADCALL |a| (QREFELT $ 28)) |n|
                                   (QREFELT $ 54))
                         (QREFELT $ 55))
                        (QREFELT $ 20)))))))
         (EXIT
          (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT $ 27)) |n| (QREFELT $ 54))
                    (SPADCALL (SPADCALL |a| (QREFELT $ 28)) |n| (QREFELT $ 54))
                    (QREFELT $ 20))))) 

(SDEFUN |INTRVL;-;2$;23| ((|a| $) ($ $))
        (|INTRVL;exactInterval|
         (SPADCALL (SPADCALL |a| (QREFELT $ 28)) (QREFELT $ 57))
         (SPADCALL (SPADCALL |a| (QREFELT $ 27)) (QREFELT $ 57)) $)) 

(SDEFUN |INTRVL;=;2$B;24| ((|a| $) (|b| $) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |a| (QREFELT $ 27)) (SPADCALL |b| (QREFELT $ 27))
                    (QREFELT $ 58))
          (SPADCALL (SPADCALL |a| (QREFELT $ 28)) (SPADCALL |b| (QREFELT $ 28))
                    (QREFELT $ 58)))
         ('T NIL))) 

(SDEFUN |INTRVL;~=;2$B;25| ((|a| $) (|b| $) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |a| (QREFELT $ 27)) (SPADCALL |b| (QREFELT $ 27))
                    (QREFELT $ 59))
          'T)
         ('T
          (SPADCALL (SPADCALL |a| (QREFELT $ 28)) (SPADCALL |b| (QREFELT $ 28))
                    (QREFELT $ 59))))) 

(SDEFUN |INTRVL;One;$;26| (($ $))
        (SPROG ((|one| (R)))
               (SEQ
                (LETT |one| (|INTRVL;normaliseFloat| (|spadConstant| $ 16) $)
                      |INTRVL;One;$;26|)
                (EXIT (CONS |one| |one|))))) 

(SDEFUN |INTRVL;Zero;$;27| (($ $))
        (CONS (|spadConstant| $ 33) (|spadConstant| $ 33))) 

(SDEFUN |INTRVL;recip;$U;28| ((|u| $) ($ |Union| $ "failed"))
        (SPROG ((|vals| (|List| R)))
               (SEQ
                (COND
                 ((SPADCALL |u| (|spadConstant| $ 33) (QREFELT $ 32))
                  (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |vals|
                         (SPADCALL
                          (LIST
                           (SPADCALL (|spadConstant| $ 16)
                                     (SPADCALL |u| (QREFELT $ 27))
                                     (QREFELT $ 61))
                           (SPADCALL (|spadConstant| $ 16)
                                     (SPADCALL |u| (QREFELT $ 28))
                                     (QREFELT $ 61)))
                          (QREFELT $ 47))
                         |INTRVL;recip;$U;28|)
                   (EXIT
                    (CONS 0
                          (SPADCALL (|SPADfirst| |vals|)
                                    (SPADCALL |vals| (QREFELT $ 48))
                                    (QREFELT $ 26)))))))))) 

(SDEFUN |INTRVL;unit?;$B;29| ((|u| $) ($ |Boolean|))
        (SPADCALL |u| (|spadConstant| $ 33) (QREFELT $ 32))) 

(SDEFUN |INTRVL;exquo;2$U;30| ((|u| $) (|v| $) ($ |Union| $ "failed"))
        (SPROG ((|vals| (|List| R)))
               (SEQ
                (COND
                 ((SPADCALL |v| (|spadConstant| $ 33) (QREFELT $ 32))
                  (CONS 1 "failed"))
                 ((OR (SPADCALL |v| (QREFELT $ 44))
                      (SPADCALL |u| (QREFELT $ 37)))
                  (CONS 0 |u|))
                 ((SPADCALL |u| |v| (QREFELT $ 38))
                  (CONS 0 (|spadConstant| $ 15)))
                 (#1='T
                  (COND
                   ((SPADCALL |u| (SPADCALL |v| (QREFELT $ 42)) (QREFELT $ 38))
                    (CONS 0 (SPADCALL (|spadConstant| $ 15) (QREFELT $ 42))))
                   (#1#
                    (SEQ
                     (LETT |vals|
                           (SPADCALL
                            (LIST
                             (SPADCALL (SPADCALL |u| (QREFELT $ 27))
                                       (SPADCALL |v| (QREFELT $ 27))
                                       (QREFELT $ 61))
                             (SPADCALL (SPADCALL |u| (QREFELT $ 27))
                                       (SPADCALL |v| (QREFELT $ 28))
                                       (QREFELT $ 61))
                             (SPADCALL (SPADCALL |u| (QREFELT $ 28))
                                       (SPADCALL |v| (QREFELT $ 27))
                                       (QREFELT $ 61))
                             (SPADCALL (SPADCALL |u| (QREFELT $ 28))
                                       (SPADCALL |v| (QREFELT $ 28))
                                       (QREFELT $ 61)))
                            (QREFELT $ 47))
                           |INTRVL;exquo;2$U;30|)
                     (EXIT
                      (CONS 0
                            (SPADCALL (|SPADfirst| |vals|)
                                      (SPADCALL |vals| (QREFELT $ 48))
                                      (QREFELT $ 26)))))))))))) 

(SDEFUN |INTRVL;gcd;3$;31| ((|u| $) (|v| $) ($ $)) (|spadConstant| $ 15)) 

(SDEFUN |INTRVL;coerce;I$;32| ((|u| |Integer|) ($ $))
        (SPROG ((|ur| (R)))
               (SEQ
                (LETT |ur|
                      (|INTRVL;normaliseFloat| (SPADCALL |u| (QREFELT $ 67)) $)
                      |INTRVL;coerce;I$;32|)
                (EXIT (|INTRVL;exactInterval| |ur| |ur| $))))) 

(SDEFUN |INTRVL;interval;F$;33| ((|u| |Fraction| (|Integer|)) ($ $))
        (SPROG ((|flt| (R)) (|bin| (|Union| (|Integer|) "failed")))
               (SEQ
                (LETT |flt| (SPADCALL |u| (QREFELT $ 70))
                      . #1=(|INTRVL;interval;F$;33|))
                (LETT |bin|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |u| (QREFELT $ 71)) (QREFELT $ 73))
                        (QREFELT $ 75))
                       (QREFELT $ 76))
                      . #1#)
                (COND
                 ((QEQCAR |bin| 0)
                  (COND
                   ((< (INTEGER-LENGTH (SPADCALL |u| (QREFELT $ 77)))
                       (SPADCALL (QREFELT $ 11)))
                    (EXIT
                     (SEQ (LETT |flt| (|INTRVL;normaliseFloat| |flt| $) . #1#)
                          (EXIT (|INTRVL;exactInterval| |flt| |flt| $))))))))
                (EXIT (SPADCALL |flt| |flt| (QREFELT $ 26)))))) 

(SDEFUN |INTRVL;retractIfCan;$U;34| ((|u| $) ($ |Union| (|Integer|) "failed"))
        (COND
         ((NULL (SPADCALL (SPADCALL |u| (QREFELT $ 30)) (QREFELT $ 9)))
          (CONS 1 "failed"))
         ('T (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 24))))) 

(SDEFUN |INTRVL;retract;$I;35| ((|u| $) ($ |Integer|))
        (COND
         ((NULL (SPADCALL (SPADCALL |u| (QREFELT $ 30)) (QREFELT $ 9)))
          (|error| "attempt to retract a non-Integer interval to an Integer"))
         ('T (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 80))))) 

(SDEFUN |INTRVL;coerce;$Of;36| ((|u| $) ($ |OutputForm|))
        (SPADCALL
         (LIST (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 83))
               (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 83)))
         (QREFELT $ 85))) 

(PUT '|INTRVL;characteristic;Nni;37| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |INTRVL;characteristic;Nni;37| (($ |NonNegativeInteger|)) 0) 

(SDEFUN |INTRVL;pi;$;38| (($ $))
        (SPADCALL (SPADCALL (QREFELT $ 89)) (SPADCALL (QREFELT $ 89))
                  (QREFELT $ 26))) 

(SDEFUN |INTRVL;log;2$;39| ((|u| $) ($ $))
        (COND
         ((SPADCALL |u| (QREFELT $ 34))
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 91))
                    (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 91))
                    (QREFELT $ 26)))
         ('T (|error| "negative logs in interval")))) 

(SDEFUN |INTRVL;exp;2$;40| ((|u| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 93))
                  (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 93))
                  (QREFELT $ 26))) 

(SDEFUN |INTRVL;^;3$;41| ((|u| $) (|v| $) ($ $))
        (SPROG ((|expts| (|List| R)))
               (SEQ
                (COND
                 ((SPADCALL |v| (QREFELT $ 37))
                  (COND
                   ((SPADCALL |u| (QREFELT $ 37)) (|error| "0^0 is undefined"))
                   (#1='T (|spadConstant| $ 15))))
                 ((SPADCALL |u| (QREFELT $ 44)) (|spadConstant| $ 15))
                 (#1#
                  (SEQ
                   (LETT |expts|
                         (SPADCALL
                          (LIST
                           (SPADCALL (SPADCALL |u| (QREFELT $ 27))
                                     (SPADCALL |v| (QREFELT $ 27))
                                     (QREFELT $ 95))
                           (SPADCALL (SPADCALL |u| (QREFELT $ 28))
                                     (SPADCALL |v| (QREFELT $ 28))
                                     (QREFELT $ 95))
                           (SPADCALL (SPADCALL |u| (QREFELT $ 27))
                                     (SPADCALL |v| (QREFELT $ 28))
                                     (QREFELT $ 95))
                           (SPADCALL (SPADCALL |u| (QREFELT $ 28))
                                     (SPADCALL |v| (QREFELT $ 27))
                                     (QREFELT $ 95)))
                          (QREFELT $ 47))
                         |INTRVL;^;3$;41|)
                   (EXIT
                    (SPADCALL (|SPADfirst| |expts|)
                              (SPADCALL |expts| (QREFELT $ 48))
                              (QREFELT $ 26))))))))) 

(SDEFUN |INTRVL;hasTwoPiMultiple|
        ((|offset| R) (|ipi| R) (|i| $) ($ |Boolean|))
        (SPROG ((|next| (|Integer|)))
               (SEQ
                (LETT |next|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |i| (QREFELT $ 27)) |offset|
                                   (QREFELT $ 29))
                         (SPADCALL 2 |ipi| (QREFELT $ 39)) (QREFELT $ 61))
                        (QREFELT $ 97))
                       (QREFELT $ 80))
                      |INTRVL;hasTwoPiMultiple|)
                (EXIT
                 (SPADCALL |i|
                           (SPADCALL |offset|
                                     (SPADCALL
                                      (SPADCALL 2 |next| (QREFELT $ 98)) |ipi|
                                      (QREFELT $ 51))
                                     (QREFELT $ 40))
                           (QREFELT $ 32)))))) 

(SDEFUN |INTRVL;hasPiMultiple| ((|offset| R) (|ipi| R) (|i| $) ($ |Boolean|))
        (SPROG ((|next| (|Integer|)))
               (SEQ
                (LETT |next|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |i| (QREFELT $ 27)) |offset|
                                   (QREFELT $ 29))
                         |ipi| (QREFELT $ 61))
                        (QREFELT $ 97))
                       (QREFELT $ 80))
                      |INTRVL;hasPiMultiple|)
                (EXIT
                 (SPADCALL |i|
                           (SPADCALL |offset|
                                     (SPADCALL |next| |ipi| (QREFELT $ 51))
                                     (QREFELT $ 40))
                           (QREFELT $ 32)))))) 

(SDEFUN |INTRVL;sin;2$;44| ((|u| $) ($ $))
        (SPROG
         ((|vals| (|List| R)) (|hasMinusOne?| #1=(|Boolean|)) (|hasOne?| #1#)
          (|ipi| (R)))
         (SEQ (LETT |ipi| (SPADCALL (QREFELT $ 89)) . #2=(|INTRVL;sin;2$;44|))
              (LETT |hasOne?|
                    (|INTRVL;hasTwoPiMultiple|
                     (SPADCALL |ipi| (SPADCALL 2 (QREFELT $ 67))
                               (QREFELT $ 61))
                     |ipi| |u| $)
                    . #2#)
              (LETT |hasMinusOne?|
                    (|INTRVL;hasTwoPiMultiple|
                     (SPADCALL (SPADCALL 3 |ipi| (QREFELT $ 39))
                               (SPADCALL 2 (QREFELT $ 67)) (QREFELT $ 61))
                     |ipi| |u| $)
                    . #2#)
              (EXIT
               (COND
                (|hasOne?|
                 (COND
                  (|hasMinusOne?|
                   (|INTRVL;exactInterval|
                    (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57))
                    (|spadConstant| $ 16) $))
                  (#3='T
                   (SEQ
                    (LETT |vals|
                          (SPADCALL
                           (LIST
                            (SPADCALL (SPADCALL |u| (QREFELT $ 27))
                                      (QREFELT $ 99))
                            (SPADCALL (SPADCALL |u| (QREFELT $ 28))
                                      (QREFELT $ 99)))
                           (QREFELT $ 47))
                          . #2#)
                    (EXIT
                     (COND
                      (|hasOne?|
                       (|INTRVL;exactSupInterval| (|SPADfirst| |vals|)
                        (|spadConstant| $ 16) $))
                      (|hasMinusOne?|
                       (|INTRVL;exactInfInterval|
                        (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57))
                        (SPADCALL |vals| (QREFELT $ 48)) $))
                      (#3#
                       (SPADCALL (|SPADfirst| |vals|)
                                 (SPADCALL |vals| (QREFELT $ 48))
                                 (QREFELT $ 26)))))))))
                (#3#
                 (SEQ
                  (LETT |vals|
                        (SPADCALL
                         (LIST
                          (SPADCALL (SPADCALL |u| (QREFELT $ 27))
                                    (QREFELT $ 99))
                          (SPADCALL (SPADCALL |u| (QREFELT $ 28))
                                    (QREFELT $ 99)))
                         (QREFELT $ 47))
                        . #2#)
                  (EXIT
                   (COND
                    (|hasOne?|
                     (|INTRVL;exactSupInterval| (|SPADfirst| |vals|)
                      (|spadConstant| $ 16) $))
                    (|hasMinusOne?|
                     (|INTRVL;exactInfInterval|
                      (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57))
                      (SPADCALL |vals| (QREFELT $ 48)) $))
                    (#3#
                     (SPADCALL (|SPADfirst| |vals|)
                               (SPADCALL |vals| (QREFELT $ 48))
                               (QREFELT $ 26)))))))))))) 

(SDEFUN |INTRVL;cos;2$;45| ((|u| $) ($ $))
        (SPROG
         ((|vals| (|List| R)) (|hasMinusOne?| #1=(|Boolean|)) (|hasOne?| #1#)
          (|ipi| (R)))
         (SEQ (LETT |ipi| (SPADCALL (QREFELT $ 89)) . #2=(|INTRVL;cos;2$;45|))
              (LETT |hasOne?|
                    (|INTRVL;hasTwoPiMultiple| (|spadConstant| $ 33) |ipi| |u|
                     $)
                    . #2#)
              (LETT |hasMinusOne?|
                    (|INTRVL;hasTwoPiMultiple| |ipi| |ipi| |u| $) . #2#)
              (EXIT
               (COND
                (|hasOne?|
                 (COND
                  (|hasMinusOne?|
                   (|INTRVL;exactInterval|
                    (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57))
                    (|spadConstant| $ 16) $))
                  (#3='T
                   (SEQ
                    (LETT |vals|
                          (SPADCALL
                           (LIST
                            (SPADCALL (SPADCALL |u| (QREFELT $ 27))
                                      (QREFELT $ 101))
                            (SPADCALL (SPADCALL |u| (QREFELT $ 28))
                                      (QREFELT $ 101)))
                           (QREFELT $ 47))
                          . #2#)
                    (EXIT
                     (COND
                      (|hasOne?|
                       (|INTRVL;exactSupInterval| (|SPADfirst| |vals|)
                        (|spadConstant| $ 16) $))
                      (|hasMinusOne?|
                       (|INTRVL;exactInfInterval|
                        (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57))
                        (SPADCALL |vals| (QREFELT $ 48)) $))
                      (#3#
                       (SPADCALL (|SPADfirst| |vals|)
                                 (SPADCALL |vals| (QREFELT $ 48))
                                 (QREFELT $ 26)))))))))
                (#3#
                 (SEQ
                  (LETT |vals|
                        (SPADCALL
                         (LIST
                          (SPADCALL (SPADCALL |u| (QREFELT $ 27))
                                    (QREFELT $ 101))
                          (SPADCALL (SPADCALL |u| (QREFELT $ 28))
                                    (QREFELT $ 101)))
                         (QREFELT $ 47))
                        . #2#)
                  (EXIT
                   (COND
                    (|hasOne?|
                     (|INTRVL;exactSupInterval| (|SPADfirst| |vals|)
                      (|spadConstant| $ 16) $))
                    (|hasMinusOne?|
                     (|INTRVL;exactInfInterval|
                      (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57))
                      (SPADCALL |vals| (QREFELT $ 48)) $))
                    (#3#
                     (SPADCALL (|SPADfirst| |vals|)
                               (SPADCALL |vals| (QREFELT $ 48))
                               (QREFELT $ 26)))))))))))) 

(SDEFUN |INTRVL;tan;2$;46| ((|u| $) ($ $))
        (SPROG ((|hi| (R)) (|lo| (R)) (|ipi| (R)))
               (SEQ
                (LETT |ipi| (SPADCALL (QREFELT $ 89))
                      . #1=(|INTRVL;tan;2$;46|))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |u| (QREFELT $ 30)) |ipi|
                             (QREFELT $ 19))
                   (|error| "Interval contains a singularity"))
                  (#2='T
                   (SEQ
                    (LETT |lo|
                          (SPADCALL (SPADCALL |u| (QREFELT $ 27))
                                    (QREFELT $ 103))
                          . #1#)
                    (LETT |hi|
                          (SPADCALL (SPADCALL |u| (QREFELT $ 28))
                                    (QREFELT $ 103))
                          . #1#)
                    (EXIT
                     (COND
                      ((SPADCALL |lo| |hi| (QREFELT $ 19))
                       (|error| "Interval contains a singularity"))
                      (#2# (SPADCALL |lo| |hi| (QREFELT $ 26)))))))))))) 

(SDEFUN |INTRVL;csc;2$;47| ((|u| $) ($ $))
        (SPROG ((|vals| (|List| R)) (|ipi| (R)))
               (SEQ
                (LETT |ipi| (SPADCALL (QREFELT $ 89))
                      . #1=(|INTRVL;csc;2$;47|))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |u| (QREFELT $ 30)) |ipi|
                             (QREFELT $ 19))
                   (|error| "Interval contains a singularity"))
                  (#2='T
                   (SEQ
                    (COND
                     ((|INTRVL;hasPiMultiple| (|spadConstant| $ 33) |ipi| |u|
                       $)
                      (|error| "Interval contains a singularity")))
                    (LETT |vals|
                          (SPADCALL
                           (LIST
                            (SPADCALL (SPADCALL |u| (QREFELT $ 27))
                                      (QREFELT $ 105))
                            (SPADCALL (SPADCALL |u| (QREFELT $ 28))
                                      (QREFELT $ 105)))
                           (QREFELT $ 47))
                          . #1#)
                    (EXIT
                     (COND
                      ((|INTRVL;hasTwoPiMultiple|
                        (SPADCALL |ipi| (SPADCALL 2 (QREFELT $ 67))
                                  (QREFELT $ 61))
                        |ipi| |u| $)
                       (|INTRVL;exactInfInterval| (|spadConstant| $ 16)
                        (SPADCALL |vals| (QREFELT $ 48)) $))
                      ((|INTRVL;hasTwoPiMultiple|
                        (SPADCALL (SPADCALL 3 |ipi| (QREFELT $ 39))
                                  (SPADCALL 2 (QREFELT $ 67)) (QREFELT $ 61))
                        |ipi| |u| $)
                       (|INTRVL;exactSupInterval| (|SPADfirst| |vals|)
                        (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57)) $))
                      (#2#
                       (SPADCALL (|SPADfirst| |vals|)
                                 (SPADCALL |vals| (QREFELT $ 48))
                                 (QREFELT $ 26)))))))))))) 

(SDEFUN |INTRVL;sec;2$;48| ((|u| $) ($ $))
        (SPROG ((|vals| (|List| R)) (|ipi| (R)))
               (SEQ
                (LETT |ipi| (SPADCALL (QREFELT $ 89))
                      . #1=(|INTRVL;sec;2$;48|))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |u| (QREFELT $ 30)) |ipi|
                             (QREFELT $ 19))
                   (|error| "Interval contains a singularity"))
                  (#2='T
                   (SEQ
                    (COND
                     ((|INTRVL;hasPiMultiple|
                       (SPADCALL |ipi| (SPADCALL 2 (QREFELT $ 67))
                                 (QREFELT $ 61))
                       |ipi| |u| $)
                      (|error| "Interval contains a singularity")))
                    (LETT |vals|
                          (SPADCALL
                           (LIST
                            (SPADCALL (SPADCALL |u| (QREFELT $ 27))
                                      (QREFELT $ 107))
                            (SPADCALL (SPADCALL |u| (QREFELT $ 28))
                                      (QREFELT $ 107)))
                           (QREFELT $ 47))
                          . #1#)
                    (EXIT
                     (COND
                      ((|INTRVL;hasTwoPiMultiple| (|spadConstant| $ 33) |ipi|
                        |u| $)
                       (|INTRVL;exactInfInterval| (|spadConstant| $ 16)
                        (SPADCALL |vals| (QREFELT $ 48)) $))
                      ((|INTRVL;hasTwoPiMultiple| |ipi| |ipi| |u| $)
                       (|INTRVL;exactSupInterval| (|SPADfirst| |vals|)
                        (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57)) $))
                      (#2#
                       (SPADCALL (|SPADfirst| |vals|)
                                 (SPADCALL |vals| (QREFELT $ 48))
                                 (QREFELT $ 26)))))))))))) 

(SDEFUN |INTRVL;cot;2$;49| ((|u| $) ($ $))
        (SPROG ((|lo| (R)) (|hi| (R)) (|ipi| (R)))
               (SEQ
                (LETT |ipi| (SPADCALL (QREFELT $ 89))
                      . #1=(|INTRVL;cot;2$;49|))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |u| (QREFELT $ 30)) |ipi|
                             (QREFELT $ 19))
                   (|error| "Interval contains a singularity"))
                  (#2='T
                   (SEQ
                    (LETT |hi|
                          (SPADCALL (SPADCALL |u| (QREFELT $ 27))
                                    (QREFELT $ 109))
                          . #1#)
                    (LETT |lo|
                          (SPADCALL (SPADCALL |u| (QREFELT $ 28))
                                    (QREFELT $ 109))
                          . #1#)
                    (EXIT
                     (COND
                      ((SPADCALL |lo| |hi| (QREFELT $ 19))
                       (|error| "Interval contains a singularity"))
                      (#2# (SPADCALL |lo| |hi| (QREFELT $ 26)))))))))))) 

(SDEFUN |INTRVL;asin;2$;50| ((|u| $) ($ $))
        (SPROG ((|hi| (R)) (|lo| (R)))
               (SEQ
                (LETT |lo| (SPADCALL |u| (QREFELT $ 27))
                      . #1=(|INTRVL;asin;2$;50|))
                (LETT |hi| (SPADCALL |u| (QREFELT $ 28)) . #1#)
                (COND
                 ((OR
                   (SPADCALL |lo|
                             (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57))
                             (QREFELT $ 31))
                   (SPADCALL |hi| (|spadConstant| $ 16) (QREFELT $ 19)))
                  (|error| "asin only defined on the region -1..1")))
                (EXIT
                 (SPADCALL (SPADCALL |lo| (QREFELT $ 111))
                           (SPADCALL |hi| (QREFELT $ 111)) (QREFELT $ 26)))))) 

(SDEFUN |INTRVL;acos;2$;51| ((|u| $) ($ $))
        (SPROG ((|hi| (R)) (|lo| (R)))
               (SEQ
                (LETT |lo| (SPADCALL |u| (QREFELT $ 27))
                      . #1=(|INTRVL;acos;2$;51|))
                (LETT |hi| (SPADCALL |u| (QREFELT $ 28)) . #1#)
                (COND
                 ((OR
                   (SPADCALL |lo|
                             (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57))
                             (QREFELT $ 31))
                   (SPADCALL |hi| (|spadConstant| $ 16) (QREFELT $ 19)))
                  (|error| "acos only defined on the region -1..1")))
                (EXIT
                 (SPADCALL (SPADCALL |hi| (QREFELT $ 113))
                           (SPADCALL |lo| (QREFELT $ 113)) (QREFELT $ 26)))))) 

(SDEFUN |INTRVL;atan;2$;52| ((|u| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 115))
                  (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 115))
                  (QREFELT $ 26))) 

(SDEFUN |INTRVL;acot;2$;53| ((|u| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 117))
                  (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 117))
                  (QREFELT $ 26))) 

(SDEFUN |INTRVL;acsc;2$;54| ((|u| $) ($ $))
        (SPROG ((|hi| (R)) (|lo| (R)))
               (SEQ
                (LETT |lo| (SPADCALL |u| (QREFELT $ 27))
                      . #1=(|INTRVL;acsc;2$;54|))
                (LETT |hi| (SPADCALL |u| (QREFELT $ 28)) . #1#)
                (COND
                 ((SPADCALL |lo|
                            (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57))
                            (QREFELT $ 119))
                  (COND
                   ((SPADCALL |hi|
                              (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57))
                              (QREFELT $ 120))
                    (|error| #2="acsc not defined on the region -1..1"))
                   ((SPADCALL |lo| (|spadConstant| $ 16) (QREFELT $ 119))
                    (COND
                     ((SPADCALL |hi| (|spadConstant| $ 16) (QREFELT $ 120))
                      (|error| #2#))))))
                 ((SPADCALL |lo| (|spadConstant| $ 16) (QREFELT $ 119))
                  (COND
                   ((SPADCALL |hi| (|spadConstant| $ 16) (QREFELT $ 120))
                    (|error| #2#)))))
                (EXIT
                 (SPADCALL (SPADCALL |hi| (QREFELT $ 121))
                           (SPADCALL |lo| (QREFELT $ 121)) (QREFELT $ 26)))))) 

(SDEFUN |INTRVL;asec;2$;55| ((|u| $) ($ $))
        (SPROG ((|hi| (R)) (|lo| (R)))
               (SEQ
                (LETT |lo| (SPADCALL |u| (QREFELT $ 27))
                      . #1=(|INTRVL;asec;2$;55|))
                (LETT |hi| (SPADCALL |u| (QREFELT $ 28)) . #1#)
                (COND
                 ((SPADCALL |lo|
                            (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57))
                            (QREFELT $ 31))
                  (COND
                   ((SPADCALL |hi|
                              (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57))
                              (QREFELT $ 19))
                    (|error| #2="asec not defined on the region -1..1"))
                   ((SPADCALL |lo| (|spadConstant| $ 16) (QREFELT $ 31))
                    (COND
                     ((SPADCALL |hi| (|spadConstant| $ 16) (QREFELT $ 19))
                      (|error| #2#))))))
                 ((SPADCALL |lo| (|spadConstant| $ 16) (QREFELT $ 31))
                  (COND
                   ((SPADCALL |hi| (|spadConstant| $ 16) (QREFELT $ 19))
                    (|error| #2#)))))
                (EXIT
                 (SPADCALL (SPADCALL |lo| (QREFELT $ 123))
                           (SPADCALL |hi| (QREFELT $ 123)) (QREFELT $ 26)))))) 

(SDEFUN |INTRVL;tanh;2$;56| ((|u| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 125))
                  (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 125))
                  (QREFELT $ 26))) 

(SDEFUN |INTRVL;sinh;2$;57| ((|u| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 127))
                  (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 127))
                  (QREFELT $ 26))) 

(SDEFUN |INTRVL;sech;2$;58| ((|u| $) ($ $))
        (SPROG ((|vals| (|List| R)))
               (SEQ
                (COND
                 ((SPADCALL |u| (QREFELT $ 35))
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 129))
                   (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 129))
                   (QREFELT $ 26)))
                 ((SPADCALL |u| (QREFELT $ 34))
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 129))
                   (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 129))
                   (QREFELT $ 26)))
                 ('T
                  (SEQ
                   (LETT |vals|
                         (SPADCALL
                          (LIST
                           (SPADCALL (SPADCALL |u| (QREFELT $ 27))
                                     (QREFELT $ 129))
                           (SPADCALL (SPADCALL |u| (QREFELT $ 28))
                                     (QREFELT $ 129)))
                          (QREFELT $ 47))
                         |INTRVL;sech;2$;58|)
                   (EXIT
                    (|INTRVL;exactSupInterval| (|SPADfirst| |vals|)
                     (|spadConstant| $ 16) $)))))))) 

(SDEFUN |INTRVL;cosh;2$;59| ((|u| $) ($ $))
        (SPROG ((|vals| (|List| R)))
               (SEQ
                (COND
                 ((SPADCALL |u| (QREFELT $ 35))
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 131))
                   (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 131))
                   (QREFELT $ 26)))
                 ((SPADCALL |u| (QREFELT $ 34))
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 131))
                   (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 131))
                   (QREFELT $ 26)))
                 ('T
                  (SEQ
                   (LETT |vals|
                         (SPADCALL
                          (LIST
                           (SPADCALL (SPADCALL |u| (QREFELT $ 27))
                                     (QREFELT $ 131))
                           (SPADCALL (SPADCALL |u| (QREFELT $ 28))
                                     (QREFELT $ 131)))
                          (QREFELT $ 47))
                         |INTRVL;cosh;2$;59|)
                   (EXIT
                    (|INTRVL;exactInfInterval| (|spadConstant| $ 16)
                     (SPADCALL |vals| (QREFELT $ 48)) $)))))))) 

(SDEFUN |INTRVL;csch;2$;60| ((|u| $) ($ $))
        (COND
         ((SPADCALL |u| (|spadConstant| $ 33) (QREFELT $ 32))
          (|error| "csch: singularity at zero"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 133))
                    (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 133))
                    (QREFELT $ 26))))) 

(SDEFUN |INTRVL;coth;2$;61| ((|u| $) ($ $))
        (COND
         ((SPADCALL |u| (|spadConstant| $ 33) (QREFELT $ 32))
          (|error| "coth: singularity at zero"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 135))
                    (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 135))
                    (QREFELT $ 26))))) 

(SDEFUN |INTRVL;acosh;2$;62| ((|u| $) ($ $))
        (COND
         ((SPADCALL (SPADCALL |u| (QREFELT $ 27)) (|spadConstant| $ 16)
                    (QREFELT $ 31))
          (|error| "invalid argument: acosh only defined on the region 1.."))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 137))
                    (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 137))
                    (QREFELT $ 26))))) 

(SDEFUN |INTRVL;acoth;2$;63| ((|u| $) ($ $))
        (SPROG ((|hi| (R)) (|lo| (R)))
               (SEQ
                (LETT |lo| (SPADCALL |u| (QREFELT $ 27))
                      . #1=(|INTRVL;acoth;2$;63|))
                (LETT |hi| (SPADCALL |u| (QREFELT $ 28)) . #1#)
                (COND
                 ((SPADCALL |lo|
                            (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57))
                            (QREFELT $ 119))
                  (COND
                   ((SPADCALL |hi|
                              (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57))
                              (QREFELT $ 120))
                    (|error| #2="acoth not defined on the region -1..1"))
                   ((SPADCALL |lo| (|spadConstant| $ 16) (QREFELT $ 119))
                    (COND
                     ((SPADCALL |hi| (|spadConstant| $ 16) (QREFELT $ 120))
                      (|error| #2#))))))
                 ((SPADCALL |lo| (|spadConstant| $ 16) (QREFELT $ 119))
                  (COND
                   ((SPADCALL |hi| (|spadConstant| $ 16) (QREFELT $ 120))
                    (|error| #2#)))))
                (EXIT
                 (SPADCALL (SPADCALL |hi| (QREFELT $ 139))
                           (SPADCALL |lo| (QREFELT $ 139)) (QREFELT $ 26)))))) 

(SDEFUN |INTRVL;acsch;2$;64| ((|u| $) ($ $))
        (COND
         ((SPADCALL |u| (|spadConstant| $ 33) (QREFELT $ 32))
          (|error| "acsch: singularity at zero"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 141))
                    (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 141))
                    (QREFELT $ 26))))) 

(SDEFUN |INTRVL;asech;2$;65| ((|u| $) ($ $))
        (SPROG ((|hi| (R)) (|lo| (R)))
               (SEQ
                (LETT |lo| (SPADCALL |u| (QREFELT $ 27))
                      . #1=(|INTRVL;asech;2$;65|))
                (LETT |hi| (SPADCALL |u| (QREFELT $ 28)) . #1#)
                (COND
                 ((OR (SPADCALL |lo| (|spadConstant| $ 33) (QREFELT $ 119))
                      (SPADCALL |hi| (|spadConstant| $ 16) (QREFELT $ 19)))
                  (|error| "asech only defined on the region 0 < x <= 1")))
                (EXIT
                 (SPADCALL (SPADCALL |hi| (QREFELT $ 143))
                           (SPADCALL |lo| (QREFELT $ 143)) (QREFELT $ 26)))))) 

(SDEFUN |INTRVL;asinh;2$;66| ((|u| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 145))
                  (SPADCALL (SPADCALL |u| (QREFELT $ 28)) (QREFELT $ 145))
                  (QREFELT $ 26))) 

(SDEFUN |INTRVL;atanh;2$;67| ((|u| $) ($ $))
        (SPROG ((|hi| (R)) (|lo| (R)))
               (SEQ
                (LETT |lo| (SPADCALL |u| (QREFELT $ 27))
                      . #1=(|INTRVL;atanh;2$;67|))
                (LETT |hi| (SPADCALL |u| (QREFELT $ 28)) . #1#)
                (COND
                 ((OR
                   (SPADCALL |lo|
                             (SPADCALL (|spadConstant| $ 16) (QREFELT $ 57))
                             (QREFELT $ 119))
                   (SPADCALL |hi| (|spadConstant| $ 16) (QREFELT $ 120)))
                  (|error| "atanh only defined on the region -1 < x < 1")))
                (EXIT
                 (SPADCALL (SPADCALL |lo| (QREFELT $ 147))
                           (SPADCALL |hi| (QREFELT $ 147)) (QREFELT $ 26)))))) 

(SDEFUN |INTRVL;^;$F$;68| ((|u| $) (|n| |Fraction| (|Integer|)) ($ $))
        (SPROG ((|hi| (R)) (|lo| (R)))
               (SEQ
                (LETT |lo| (SPADCALL |u| (QREFELT $ 27))
                      . #1=(|INTRVL;^;$F$;68|))
                (LETT |hi| (SPADCALL |u| (QREFELT $ 28)) . #1#)
                (EXIT
                 (COND
                  ((SPADCALL |lo| (|spadConstant| $ 33) (QREFELT $ 119))
                   (COND
                    ((SPADCALL (SPADCALL |n| (QREFELT $ 71)) (QREFELT $ 149))
                     (|error| "fractional power only defined for x > 0"))
                    ((SPADCALL (SPADCALL |n| (QREFELT $ 77)) (QREFELT $ 149))
                     (COND
                      ((SPADCALL |hi| (|spadConstant| $ 33) (QREFELT $ 31))
                       (SPADCALL (|spadConstant| $ 33)
                                 (SPADCALL |lo| |n| (QREFELT $ 150))
                                 (QREFELT $ 20)))
                      (#2='T
                       (SPADCALL (|spadConstant| $ 33)
                                 (SPADCALL (SPADCALL |lo| |n| (QREFELT $ 150))
                                           (SPADCALL |hi| |n| (QREFELT $ 150))
                                           (QREFELT $ 55))
                                 (QREFELT $ 20)))))
                    (#2#
                     (SPADCALL (SPADCALL |lo| |n| (QREFELT $ 150))
                               (SPADCALL |hi| |n| (QREFELT $ 150))
                               (QREFELT $ 20)))))
                  (#2#
                   (SPADCALL (SPADCALL |lo| |n| (QREFELT $ 150))
                             (SPADCALL |hi| |n| (QREFELT $ 150))
                             (QREFELT $ 20)))))))) 

(DECLAIM (NOTINLINE |Interval;|)) 

(DEFUN |Interval| (#1=#:G983)
  (SPROG NIL
         (PROG (#2=#:G984)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Interval|)
                                               '|domainEqualList|)
                    . #3=(|Interval|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Interval;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Interval|)))))))))) 

(DEFUN |Interval;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|Interval|))
          (LETT |dv$| (LIST '|Interval| DV$1) . #1#)
          (LETT $ (GETREFV 158) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Interval| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|Record| (|:| |Inf| |#1|) (|:| |Sup| |#1|)))
          $))) 

(MAKEPROP '|Interval| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|)
              (0 . |zero?|) (|PositiveInteger|) (5 . |bits|) (|Integer|)
              (9 . |mantissa|) (14 . |exponent|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |INTRVL;One;$;26|) $))
              (19 . |One|) (23 . |float|) (29 . |base|) (33 . >)
              |INTRVL;interval;2R$;4|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |INTRVL;Zero;$;27|) $))
              (39 . |one?|) (|Union| 12 '"failed") (44 . |retractIfCan|)
              |INTRVL;interval;R$;5| |INTRVL;qinterval;2R$;6|
              |INTRVL;inf;$R;10| |INTRVL;sup;$R;11| (49 . -)
              |INTRVL;width;$R;12| (55 . <) |INTRVL;contains?;$RB;13|
              (61 . |Zero|) |INTRVL;positive?;$B;14| |INTRVL;negative?;$B;15|
              |INTRVL;<;2$B;16| (65 . |zero?|) |INTRVL;=;2$B;24| (70 . *)
              (76 . +) |INTRVL;+;3$;17| |INTRVL;-;2$;23| |INTRVL;-;3$;18|
              (82 . |one?|) (87 . *) (|List| 6) (93 . |sort|) (98 . |last|)
              |INTRVL;*;3$;19| (103 . >) (109 . *) |INTRVL;*;I2$;20|
              |INTRVL;*;Pi2$;21| (115 . ^) (121 . |max|) |INTRVL;^;$Pi$;22|
              (127 . -) (132 . =) (138 . ~=) |INTRVL;~=;2$B;25| (144 . /)
              (|Union| $ '"failed") |INTRVL;recip;$U;28| |INTRVL;unit?;$B;29|
              |INTRVL;exquo;2$U;30| |INTRVL;gcd;3$;31| (150 . |coerce|)
              |INTRVL;coerce;I$;32| (|Fraction| 12) (155 . |coerce|)
              (160 . |denom|) (|Float|) (165 . |coerce|) (170 . |log2|)
              (174 . |log2|) (179 . |retractIfCan|) (184 . |numer|)
              |INTRVL;interval;F$;33| |INTRVL;retractIfCan;$U;34|
              (189 . |retract|) |INTRVL;retract;$I;35| (|OutputForm|)
              (194 . |coerce|) (|List| $) (199 . |bracket|)
              |INTRVL;coerce;$Of;36| (|NonNegativeInteger|)
              |INTRVL;characteristic;Nni;37| (204 . |pi|) |INTRVL;pi;$;38|
              (208 . |log|) |INTRVL;log;2$;39| (213 . |exp|) |INTRVL;exp;2$;40|
              (218 . ^) |INTRVL;^;3$;41| (224 . |ceiling|) (229 . *)
              (235 . |sin|) |INTRVL;sin;2$;44| (240 . |cos|) |INTRVL;cos;2$;45|
              (245 . |tan|) |INTRVL;tan;2$;46| (250 . |csc|) |INTRVL;csc;2$;47|
              (255 . |sec|) |INTRVL;sec;2$;48| (260 . |cot|) |INTRVL;cot;2$;49|
              (265 . |asin|) |INTRVL;asin;2$;50| (270 . |acos|)
              |INTRVL;acos;2$;51| (275 . |atan|) |INTRVL;atan;2$;52|
              (280 . |acot|) |INTRVL;acot;2$;53| (285 . <=) (291 . >=)
              (297 . |acsc|) |INTRVL;acsc;2$;54| (302 . |asec|)
              |INTRVL;asec;2$;55| (307 . |tanh|) |INTRVL;tanh;2$;56|
              (312 . |sinh|) |INTRVL;sinh;2$;57| (317 . |sech|)
              |INTRVL;sech;2$;58| (322 . |cosh|) |INTRVL;cosh;2$;59|
              (327 . |csch|) |INTRVL;csch;2$;60| (332 . |coth|)
              |INTRVL;coth;2$;61| (337 . |acosh|) |INTRVL;acosh;2$;62|
              (342 . |acoth|) |INTRVL;acoth;2$;63| (347 . |acsch|)
              |INTRVL;acsch;2$;64| (352 . |asech|) |INTRVL;asech;2$;65|
              (357 . |asinh|) |INTRVL;asinh;2$;66| (362 . |atanh|)
              |INTRVL;atanh;2$;67| (367 . |even?|) (372 . ^) |INTRVL;^;$F$;68|
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 378 |zero?| 384 |width| 389 |unitNormal| 394 |unitCanonical|
              399 |unit?| 404 |tanh| 409 |tan| 414 |sup| 419 |subtractIfCan|
              424 |sqrt| 430 |smaller?| 435 |sinh| 441 |sin| 446 |sech| 451
              |sec| 456 |sample| 461 |retractIfCan| 465 |retract| 470 |recip|
              475 |qinterval| 480 |positive?| 486 |pi| 491 |opposite?| 495
              |one?| 501 |nthRoot| 506 |negative?| 512 |min| 517 |max| 523
              |log| 529 |lcmCoef| 534 |lcm| 540 |latex| 551 |interval| 556
              |inf| 572 |hashUpdate!| 577 |hash| 583 |gcdPolynomial| 588 |gcd|
              594 |exquo| 605 |exp| 611 |csch| 616 |csc| 621 |coth| 626 |cot|
              631 |cosh| 636 |cos| 641 |contains?| 646 |coerce| 652
              |characteristic| 672 |atanh| 676 |atan| 681 |associates?| 686
              |asinh| 692 |asin| 697 |asech| 702 |asec| 707 |annihilate?| 712
              |acsch| 718 |acsc| 723 |acoth| 728 |acot| 733 |acosh| 738 |acos|
              743 ^ 748 |Zero| 772 |One| 776 >= 780 > 786 = 792 <= 798 < 804 -
              810 + 821 * 827)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(NIL |GcdDomain&| NIL NIL |Algebra&| NIL |EntireRing&| |Module&|
                NIL |Ring&| NIL |Rng&| NIL |AbelianGroup&| NIL NIL
                |OrderedSet&| |AbelianMonoid&| |Monoid&| NIL NIL |SemiGroup&|
                |AbelianSemiGroup&| |TranscendentalFunctionCategory&|
                |SetCategory&| NIL |RetractableTo&| |RadicalCategory&|
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| |PartialOrder&| NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|IntervalCategory| 6) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|Algebra| $$) (|CommutativeRing|)
                 (|EntireRing|) (|Module| $$) (|BiModule| $$ $$) (|Ring|)
                 (|LeftModule| $$) (|Rng|) (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|OrderedSet|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|Comparable|)
                 (|SemiGroup|) (|AbelianSemiGroup|)
                 (|TranscendentalFunctionCategory|) (|SetCategory|)
                 (|Approximate|) (|RetractableTo| 12) (|RadicalCategory|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|PartialOrder|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 82))
              (|makeByteWordVec2| 157
                                  '(1 6 8 0 9 0 6 10 11 1 6 12 0 13 1 6 12 0 14
                                    0 6 0 16 2 6 0 12 12 17 0 6 10 18 2 6 8 0 0
                                    19 1 6 8 0 22 1 6 23 0 24 2 6 0 0 0 29 2 6
                                    8 0 0 31 0 6 0 33 1 0 8 0 37 2 6 0 10 0 39
                                    2 6 0 0 0 40 1 0 8 0 44 2 6 0 0 0 45 1 46 0
                                    0 47 1 46 6 0 48 2 12 8 0 0 50 2 6 0 12 0
                                    51 2 6 0 0 10 54 2 6 0 0 0 55 1 6 0 0 57 2
                                    6 8 0 0 58 2 6 8 0 0 59 2 6 0 0 0 61 1 6 0
                                    12 67 1 6 0 69 70 1 69 12 0 71 1 72 0 12 73
                                    0 72 0 74 1 72 0 0 75 1 72 23 0 76 1 69 12
                                    0 77 1 6 12 0 80 1 6 82 0 83 1 82 0 84 85 0
                                    6 0 89 1 6 0 0 91 1 6 0 0 93 2 6 0 0 0 95 1
                                    6 0 0 97 2 12 0 10 0 98 1 6 0 0 99 1 6 0 0
                                    101 1 6 0 0 103 1 6 0 0 105 1 6 0 0 107 1 6
                                    0 0 109 1 6 0 0 111 1 6 0 0 113 1 6 0 0 115
                                    1 6 0 0 117 2 6 8 0 0 119 2 6 8 0 0 120 1 6
                                    0 0 121 1 6 0 0 123 1 6 0 0 125 1 6 0 0 127
                                    1 6 0 0 129 1 6 0 0 131 1 6 0 0 133 1 6 0 0
                                    135 1 6 0 0 137 1 6 0 0 139 1 6 0 0 141 1 6
                                    0 0 143 1 6 0 0 145 1 6 0 0 147 1 12 8 0
                                    149 2 6 0 0 69 150 2 0 8 0 0 60 1 0 8 0 37
                                    1 0 6 0 30 1 0 154 0 1 1 0 0 0 1 1 0 8 0 64
                                    1 0 0 0 126 1 0 0 0 104 1 0 6 0 28 2 0 62 0
                                    0 1 1 0 0 0 1 2 0 8 0 0 1 1 0 0 0 128 1 0 0
                                    0 100 1 0 0 0 130 1 0 0 0 108 0 0 0 1 1 0
                                    23 0 79 1 0 12 0 81 1 0 62 0 63 2 0 0 6 6
                                    26 1 0 8 0 34 0 0 0 90 2 0 8 0 0 1 1 0 8 0
                                    44 2 0 0 0 12 1 1 0 8 0 35 2 0 0 0 0 1 2 0
                                    0 0 0 1 1 0 0 0 92 2 0 153 0 0 1 1 0 0 84 1
                                    2 0 0 0 0 1 1 0 155 0 1 1 0 0 6 25 1 0 0 69
                                    78 2 0 0 6 6 20 1 0 6 0 27 2 0 157 157 0 1
                                    1 0 156 0 1 2 0 152 152 152 1 1 0 0 84 1 2
                                    0 0 0 0 66 2 0 62 0 0 65 1 0 0 0 94 1 0 0 0
                                    134 1 0 0 0 106 1 0 0 0 136 1 0 0 0 110 1 0
                                    0 0 132 1 0 0 0 102 2 0 8 0 6 32 1 0 0 12
                                    68 1 0 0 0 1 1 0 0 12 68 1 0 82 0 86 0 0 87
                                    88 1 0 0 0 148 1 0 0 0 116 2 0 8 0 0 1 1 0
                                    0 0 146 1 0 0 0 112 1 0 0 0 144 1 0 0 0 124
                                    2 0 8 0 0 1 1 0 0 0 142 1 0 0 0 122 1 0 0 0
                                    140 1 0 0 0 118 1 0 0 0 138 1 0 0 0 114 2 0
                                    0 0 69 151 2 0 0 0 0 96 2 0 0 0 87 1 2 0 0
                                    0 10 56 0 0 0 21 0 0 0 15 2 0 8 0 0 1 2 0 8
                                    0 0 1 2 0 8 0 0 38 2 0 8 0 0 1 2 0 8 0 0 36
                                    2 0 0 0 0 43 1 0 0 0 42 2 0 0 0 0 41 2 0 0
                                    0 0 49 2 0 0 12 0 52 2 0 0 87 0 1 2 0 0 10
                                    0 53)))))
           '|lookupComplete|)) 
