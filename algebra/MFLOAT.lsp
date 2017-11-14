
(SDEFUN |MFLOAT;retractIfCan;$U;1|
        ((|u| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (CONS 0
              (SPADCALL (SPADCALL |u| (QREFELT $ 16))
                        (SPADCALL (SPADCALL (QREFELT $ 8) 1 (QREFELT $ 21))
                                  (SPADCALL |u| (QREFELT $ 22)) (QREFELT $ 23))
                        (QREFELT $ 24)))) 

(SDEFUN |MFLOAT;wholePart;$I;2| ((|u| $) ($ . #1=(|Integer|)))
        (SPROG ((|f| #1#) (|exp| (|Integer|)) (|man| (|Integer|)))
               (SEQ
                (LETT |man| (SPADCALL |u| (QREFELT $ 16))
                      . #2=(|MFLOAT;wholePart;$I;2|))
                (LETT |exp| (SPADCALL |u| (QREFELT $ 22)) . #2#)
                (EXIT
                 (LETT |f|
                       (COND
                        ((SPADCALL |exp| (QREFELT $ 28))
                         (* |man|
                            (SPADCALL (QREFELT $ 8) |exp| (QREFELT $ 13))))
                        ((ZEROP |exp|) |man|)
                        ('T
                         (SPADCALL
                          (SPADCALL |man|
                                    (SPADCALL (QREFELT $ 8) (- |exp|)
                                              (QREFELT $ 13))
                                    (QREFELT $ 21))
                          (QREFELT $ 29))))
                       . #2#))))) 

(SDEFUN |MFLOAT;normalise| ((|u| $) ($ $))
        (SPROG
         ((|man| (|Integer|)) (|exp| (|Integer|))
          (|q1| #1=(|Fraction| (|Integer|))) (BBF #1#) (|sgn| (|Integer|))
          (BB (|Integer|)))
         (SEQ
          (LETT |exp| (SPADCALL |u| (QREFELT $ 22)) . #2=(|MFLOAT;normalise|))
          (LETT |man| (SPADCALL |u| (QREFELT $ 16)) . #2#)
          (LETT BB (QREFELT $ 8) . #2#)
          (LETT |sgn| (SPADCALL |man| (QREFELT $ 31)) . #2#)
          (LETT |man| (ABS |man|) . #2#)
          (EXIT
           (COND ((ZEROP |man|) (CONS 0 0))
                 (#3='T
                  (SEQ
                   (COND
                    ((< |man| (QREFELT $ 14))
                     (SEQ G190
                          (COND ((NULL (< |man| (QREFELT $ 14))) (GO G191)))
                          (SEQ (LETT |exp| (- |exp| 1) . #2#)
                               (EXIT (LETT |man| (* |man| BB) . #2#)))
                          NIL (GO G190) G191 (EXIT NIL))))
                   (COND
                    ((SPADCALL |man| (QREFELT $ 14) (QREFELT $ 34))
                     (SEQ (LETT |q1| (SPADCALL |man| 1 (QREFELT $ 21)) . #2#)
                          (LETT BBF (SPADCALL BB 1 (QREFELT $ 21)) . #2#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (SPADCALL (SPADCALL |q1| (QREFELT $ 29))
                                            (QREFELT $ 14) (QREFELT $ 34)))
                                 (GO G191)))
                               (SEQ
                                (LETT |q1| (SPADCALL |q1| BBF (QREFELT $ 35))
                                      . #2#)
                                (EXIT (LETT |exp| (+ |exp| 1) . #2#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (LETT |man| (|MFLOAT;locRound| |q1| $) . #2#)))))
                   (EXIT
                    (COND
                     ((SPADCALL |sgn| (QREFELT $ 28))
                      (|MFLOAT;checkExponent| (CONS |man| |exp|) $))
                     (#3#
                      (|MFLOAT;checkExponent| (CONS (- |man|) |exp|)
                       $))))))))))) 

(PUT '|MFLOAT;mantissa;$I;4| '|SPADreplace| 'QCAR) 

(SDEFUN |MFLOAT;mantissa;$I;4| ((|u| $) ($ |Integer|)) (QCAR |u|)) 

(PUT '|MFLOAT;exponent;$I;5| '|SPADreplace| 'QCDR) 

(SDEFUN |MFLOAT;exponent;$I;5| ((|u| $) ($ |Integer|)) (QCDR |u|)) 

(SDEFUN |MFLOAT;newPower|
        ((|base| . #1=(|PositiveInteger|)) (|prec| |PositiveInteger|)
         ($ |Void|))
        (SPROG
         ((|power| (|PositiveInteger|)) (|current| #1#)
          (|target| (|PositiveInteger|)))
         (SEQ (LETT |power| 1 . #2=(|MFLOAT;newPower|))
              (LETT |target| (SPADCALL 10 |prec| (QREFELT $ 13)) . #2#)
              (LETT |current| |base| . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (< (LETT |current| (* |current| |base|) . #2#) |target|))
                     (GO G191)))
                   (SEQ (EXIT (LETT |power| (+ |power| 1) . #2#))) NIL
                   (GO G190) G191 (EXIT NIL))
              (SETELT $ 11 |power|)
              (SETELT $ 14
                      (SPADCALL (QREFELT $ 8) (QREFELT $ 11) (QREFELT $ 13)))
              (EXIT (SPADCALL (QREFELT $ 37)))))) 

(SDEFUN |MFLOAT;changeBase;2IPi$;7|
        ((|exp| |Integer|) (|man| |Integer|) (|base| |PositiveInteger|) ($ $))
        (SPROG
         ((|newMan| (|Integer|)) (|f| (|Fraction| (|Integer|)))
          (|newExp| (|Integer|)) (BB (|Fraction| (|Integer|)))
          (|sign| (|Integer|)))
         (SEQ (LETT |newExp| 0 . #1=(|MFLOAT;changeBase;2IPi$;7|))
              (LETT |f|
                    (SPADCALL |man|
                              (SPADCALL (SPADCALL |base| (QREFELT $ 38)) |exp|
                                        (QREFELT $ 23))
                              (QREFELT $ 24))
                    . #1#)
              (LETT |sign| (SPADCALL |f| (QREFELT $ 39)) . #1#)
              (LETT |f| (SPADCALL |f| (QREFELT $ 40)) . #1#)
              (LETT |newMan| (SPADCALL |f| (QREFELT $ 29)) . #1#)
              (EXIT
               (COND ((SPADCALL |f| (QREFELT $ 41)) (CONS 0 0))
                     ('T
                      (SEQ
                       (LETT BB (SPADCALL (QREFELT $ 8) (QREFELT $ 38)) . #1#)
                       (COND
                        ((< |newMan| (QREFELT $ 14))
                         (SEQ G190
                              (COND
                               ((NULL (< |newMan| (QREFELT $ 14))) (GO G191)))
                              (SEQ (LETT |newExp| (- |newExp| 1) . #1#)
                                   (LETT |f| (SPADCALL |f| BB (QREFELT $ 42))
                                         . #1#)
                                   (EXIT
                                    (LETT |newMan|
                                          (SPADCALL |f| (QREFELT $ 29))
                                          . #1#)))
                              NIL (GO G190) G191 (EXIT NIL))))
                       (COND
                        ((SPADCALL |newMan| (QREFELT $ 14) (QREFELT $ 34))
                         (SEQ G190
                              (COND
                               ((NULL
                                 (SPADCALL |newMan| (QREFELT $ 14)
                                           (QREFELT $ 34)))
                                (GO G191)))
                              (SEQ (LETT |newExp| (+ |newExp| 1) . #1#)
                                   (LETT |f| (SPADCALL |f| BB (QREFELT $ 35))
                                         . #1#)
                                   (EXIT
                                    (LETT |newMan|
                                          (SPADCALL |f| (QREFELT $ 29))
                                          . #1#)))
                              NIL (GO G190) G191 (EXIT NIL))))
                       (EXIT (CONS (* |sign| |newMan|) |newExp|))))))))) 

(SDEFUN |MFLOAT;checkExponent| ((|u| $) ($ $))
        (SPROG ((|message| (|String|)))
               (SEQ
                (COND
                 ((OR (< (SPADCALL |u| (QREFELT $ 22)) (QREFELT $ 9))
                      (SPADCALL (SPADCALL |u| (QREFELT $ 22)) (QREFELT $ 10)
                                (QREFELT $ 34)))
                  (SEQ
                   (LETT |message|
                         (SPADCALL
                          (LIST "Exponent out of range: "
                                (STRINGIMAGE (QREFELT $ 9)) ".."
                                (STRINGIMAGE (QREFELT $ 10)))
                          (QREFELT $ 46))
                         |MFLOAT;checkExponent|)
                   (EXIT (|error| |message|))))
                 ('T |u|))))) 

(SDEFUN |MFLOAT;coerce;$Of;9| ((|u| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL |u| (QREFELT $ 47)) (QREFELT $ 49))) 

(SDEFUN |MFLOAT;coerce;Mi$;10| ((|u| |MachineInteger|) ($ $))
        (|MFLOAT;checkExponent|
         (SPADCALL 0 (SPADCALL |u| (QREFELT $ 52)) 10 (QREFELT $ 43)) $)) 

(SDEFUN |MFLOAT;coerce;$F;11| ((|u| $) ($ |Float|))
        (SPROG ((|r| (|Float|)) (|oldDigits| (|PositiveInteger|)))
               (SEQ
                (LETT |oldDigits| (SPADCALL (QREFELT $ 7) (QREFELT $ 54))
                      . #1=(|MFLOAT;coerce;$F;11|))
                (LETT |r|
                      (SPADCALL (SPADCALL |u| (QREFELT $ 16))
                                (SPADCALL |u| (QREFELT $ 22)) (QREFELT $ 8)
                                (QREFELT $ 55))
                      . #1#)
                (SPADCALL |oldDigits| (QREFELT $ 54)) (EXIT |r|)))) 

(SDEFUN |MFLOAT;coerce;F$;12| ((|u| |Float|) ($ $))
        (|MFLOAT;checkExponent|
         (SPADCALL (SPADCALL |u| (QREFELT $ 56)) (SPADCALL |u| (QREFELT $ 57))
                   (SPADCALL (QREFELT $ 58)) (QREFELT $ 43))
         $)) 

(SDEFUN |MFLOAT;coerce;I$;13| ((|u| |Integer|) ($ $))
        (|MFLOAT;checkExponent| (SPADCALL 0 |u| 10 (QREFELT $ 43)) $)) 

(SDEFUN |MFLOAT;coerce;F$;14| ((|u| |Fraction| (|Integer|)) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 61)) (QREFELT $ 62))
                  (SPADCALL (SPADCALL |u| (QREFELT $ 63)) (QREFELT $ 62))
                  (QREFELT $ 64))) 

(SDEFUN |MFLOAT;retract;$F;15| ((|u| $) ($ |Fraction| (|Integer|)))
        (SPROG ((|value| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (LETT |value| (SPADCALL |u| (QREFELT $ 26))
                      |MFLOAT;retract;$F;15|)
                (EXIT
                 (COND
                  ((QEQCAR |value| 1)
                   (|error| "Cannot retract to a Fraction Integer"))
                  ('T (QCDR |value|))))))) 

(SDEFUN |MFLOAT;retract;$F;16| ((|u| $) ($ |Float|))
        (SPADCALL |u| (QREFELT $ 47))) 

(SDEFUN |MFLOAT;retractIfCan;$U;17| ((|u| $) ($ |Union| (|Float|) "failed"))
        (CONS 0 (SPADCALL |u| (QREFELT $ 47)))) 

(SDEFUN |MFLOAT;retractIfCan;$U;18| ((|u| $) ($ |Union| (|Integer|) "failed"))
        (SPROG ((|value| (|Fraction| (|Integer|))))
               (SEQ
                (LETT |value|
                      (SPADCALL (SPADCALL |u| (QREFELT $ 16))
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 8) (QREFELT $ 38))
                                 (SPADCALL |u| (QREFELT $ 22)) (QREFELT $ 23))
                                (QREFELT $ 24))
                      |MFLOAT;retractIfCan;$U;18|)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |value| (QREFELT $ 70)) (QREFELT $ 41))
                   (CONS 0 (SPADCALL |value| (QREFELT $ 29))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |MFLOAT;retract;$I;19| ((|u| $) ($ |Integer|))
        (SPROG ((#1=#:G803 NIL) (|result| (|Union| (|Integer|) "failed")))
               (SEQ
                (LETT |result| (SPADCALL |u| (QREFELT $ 72))
                      . #2=(|MFLOAT;retract;$I;19|))
                (EXIT
                 (COND
                  ((SPADCALL |result| (CONS 1 "failed") (QREFELT $ 73))
                   (|error| "Not an Integer"))
                  ('T
                   (PROG2 (LETT #1# |result| . #2#)
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                     (|Union| (|Integer|) "failed") #1#)))))))) 

(SDEFUN |MFLOAT;precision;2Pi;20|
        ((|p| |PositiveInteger|) ($ |PositiveInteger|))
        (SPROG ((|old| (|PositiveInteger|)))
               (SEQ (LETT |old| (QREFELT $ 7) |MFLOAT;precision;2Pi;20|)
                    (|MFLOAT;newPower| (QREFELT $ 8) |p| $) (SETELT $ 7 |p|)
                    (EXIT |old|)))) 

(SDEFUN |MFLOAT;precision;Pi;21| (($ |PositiveInteger|)) (QREFELT $ 7)) 

(SDEFUN |MFLOAT;base;2Pi;22| ((|b| |PositiveInteger|) ($ |PositiveInteger|))
        (SPROG ((|old| (|PositiveInteger|)))
               (SEQ (LETT |old| |b| |MFLOAT;base;2Pi;22|)
                    (|MFLOAT;newPower| |b| (QREFELT $ 7) $) (SETELT $ 8 |b|)
                    (EXIT |old|)))) 

(SDEFUN |MFLOAT;base;Pi;23| (($ |PositiveInteger|)) (QREFELT $ 8)) 

(SDEFUN |MFLOAT;maximumExponent;2I;24| ((|u| |Integer|) ($ |Integer|))
        (SPROG ((|old| (|Integer|)))
               (SEQ (LETT |old| (QREFELT $ 10) |MFLOAT;maximumExponent;2I;24|)
                    (SETELT $ 10 |u|) (EXIT |old|)))) 

(SDEFUN |MFLOAT;maximumExponent;I;25| (($ |Integer|)) (QREFELT $ 10)) 

(SDEFUN |MFLOAT;minimumExponent;2I;26| ((|u| |Integer|) ($ |Integer|))
        (SPROG ((|old| (|Integer|)))
               (SEQ (LETT |old| (QREFELT $ 9) |MFLOAT;minimumExponent;2I;26|)
                    (SETELT $ 9 |u|) (EXIT |old|)))) 

(SDEFUN |MFLOAT;minimumExponent;I;27| (($ |Integer|)) (QREFELT $ 9)) 

(PUT '|MFLOAT;Zero;$;28| '|SPADreplace| '(XLAM NIL (CONS 0 0))) 

(SDEFUN |MFLOAT;Zero;$;28| (($ $)) (CONS 0 0)) 

(SDEFUN |MFLOAT;One;$;29| (($ $)) (SPADCALL 0 1 10 (QREFELT $ 43))) 

(SDEFUN |MFLOAT;zero?;$B;30| ((|u| $) ($ |Boolean|))
        (SPADCALL |u| (CONS 0 0) (QREFELT $ 83))) 

(SDEFUN |MFLOAT;locRound| ((|x| |Fraction| (|Integer|)) ($ |Integer|))
        (COND
         ((SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 70)) (QREFELT $ 40))
                    (SPADCALL 1 2 (QREFELT $ 21)) (QREFELT $ 85))
          (+ (SPADCALL |x| (QREFELT $ 29)) (SPADCALL |x| (QREFELT $ 39))))
         ('T (SPADCALL |x| (QREFELT $ 29))))) 

(SDEFUN |MFLOAT;recip;$U;32| ((|f1| $) ($ |Union| $ "failed"))
        (COND ((SPADCALL |f1| (QREFELT $ 84)) (CONS 1 "failed"))
              ('T
               (CONS 0
                     (|MFLOAT;normalise|
                      (CONS
                       (|MFLOAT;locRound|
                        (SPADCALL
                         (SPADCALL (QREFELT $ 8) (* 2 (QREFELT $ 11))
                                   (QREFELT $ 13))
                         (SPADCALL |f1| (QREFELT $ 16)) (QREFELT $ 21))
                        $)
                       (-
                        (+ (SPADCALL |f1| (QREFELT $ 22))
                           (* 2 (QREFELT $ 11)))))
                      $))))) 

(SDEFUN |MFLOAT;*;3$;33| ((|f1| $) (|f2| $) ($ $))
        (|MFLOAT;normalise|
         (CONS
          (* (SPADCALL |f1| (QREFELT $ 16)) (SPADCALL |f2| (QREFELT $ 16)))
          (+ (SPADCALL |f1| (QREFELT $ 22)) (SPADCALL |f2| (QREFELT $ 22))))
         $)) 

(SDEFUN |MFLOAT;^;$F$;34| ((|f1| $) (|p| |Fraction| (|Integer|)) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |f1| (QREFELT $ 47)) |p| (QREFELT $ 89))
                  (QREFELT $ 59))) 

(SDEFUN |MFLOAT;/;3$;35| ((|f1| $) (|f2| $) ($ $))
        (COND ((SPADCALL |f2| (QREFELT $ 84)) (|error| "division by zero"))
              ((SPADCALL |f1| (QREFELT $ 84)) (|spadConstant| $ 32))
              ((SPADCALL |f1| |f2| (QREFELT $ 83)) (|spadConstant| $ 17))
              ('T
               (|MFLOAT;normalise|
                (CONS
                 (|MFLOAT;locRound|
                  (SPADCALL
                   (* (SPADCALL |f1| (QREFELT $ 16))
                      (SPADCALL (QREFELT $ 8) (* 2 (QREFELT $ 11))
                                (QREFELT $ 13)))
                   (SPADCALL |f2| (QREFELT $ 16)) (QREFELT $ 21))
                  $)
                 (- (SPADCALL |f1| (QREFELT $ 22))
                    (+ (SPADCALL |f2| (QREFELT $ 22)) (* 2 (QREFELT $ 11)))))
                $)))) 

(SDEFUN |MFLOAT;inv;2$;36| ((|f1| $) ($ $))
        (SPADCALL (|spadConstant| $ 17) |f1| (QREFELT $ 64))) 

(SDEFUN |MFLOAT;exquo;2$U;37| ((|f1| $) (|f2| $) ($ |Union| $ "failed"))
        (CONS 0 (SPADCALL |f1| |f2| (QREFELT $ 64)))) 

(SDEFUN |MFLOAT;divide;2$R;38|
        ((|f1| $) (|f2| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (CONS (SPADCALL |f1| |f2| (QREFELT $ 64)) (|spadConstant| $ 32))) 

(SDEFUN |MFLOAT;quo;3$;39| ((|f1| $) (|f2| $) ($ $))
        (SPADCALL |f1| |f2| (QREFELT $ 64))) 

(SDEFUN |MFLOAT;rem;3$;40| ((|f1| $) (|f2| $) ($ $)) (|spadConstant| $ 32)) 

(SDEFUN |MFLOAT;*;I2$;41| ((|u| |Integer|) (|f1| $) ($ $))
        (|MFLOAT;normalise|
         (CONS (* |u| (SPADCALL |f1| (QREFELT $ 16)))
               (SPADCALL |f1| (QREFELT $ 22)))
         $)) 

(SDEFUN |MFLOAT;=;2$B;42| ((|f1| $) (|f2| $) ($ |Boolean|))
        (COND
         ((EQL (SPADCALL |f1| (QREFELT $ 16)) (SPADCALL |f2| (QREFELT $ 16)))
          (EQL (SPADCALL |f1| (QREFELT $ 22)) (SPADCALL |f2| (QREFELT $ 22))))
         ('T NIL))) 

(SDEFUN |MFLOAT;+;3$;43| ((|f1| $) (|f2| $) ($ $))
        (SPROG
         ((|e2| #1=(|Integer|)) (|e1| #1#) (|m2| #2=(|Integer|)) (|m1| #2#))
         (SEQ
          (LETT |m1| (SPADCALL |f1| (QREFELT $ 16)) . #3=(|MFLOAT;+;3$;43|))
          (LETT |m2| (SPADCALL |f2| (QREFELT $ 16)) . #3#)
          (LETT |e1| (SPADCALL |f1| (QREFELT $ 22)) . #3#)
          (LETT |e2| (SPADCALL |f2| (QREFELT $ 22)) . #3#)
          (EXIT
           (COND
            ((SPADCALL |e1| |e2| (QREFELT $ 34))
             (COND
              ((SPADCALL |e1| (+ (+ |e2| (QREFELT $ 11)) 2) (QREFELT $ 34))
               (COND ((SPADCALL |f1| (QREFELT $ 84)) |f2|) (#4='T |f1|)))
              (#4#
               (|MFLOAT;normalise|
                (CONS (+ (* |m1| (EXPT (QREFELT $ 8) (- |e1| |e2|))) |m2|)
                      |e2|)
                $))))
            ((SPADCALL |e2| (+ (+ |e1| (QREFELT $ 11)) 2) (QREFELT $ 34))
             (COND ((SPADCALL |f2| (QREFELT $ 84)) |f1|) (#4# |f2|)))
            (#4#
             (|MFLOAT;normalise|
              (CONS (+ (* |m2| (EXPT (QREFELT $ 8) (- |e2| |e1|))) |m1|) |e1|)
              $))))))) 

(SDEFUN |MFLOAT;-;2$;44| ((|f1| $) ($ $))
        (CONS (- (SPADCALL |f1| (QREFELT $ 16)))
              (SPADCALL |f1| (QREFELT $ 22)))) 

(SDEFUN |MFLOAT;-;3$;45| ((|f1| $) (|f2| $) ($ $))
        (SPADCALL |f1| (SPADCALL |f2| (QREFELT $ 99)) (QREFELT $ 98))) 

(SDEFUN |MFLOAT;<;2$B;46| ((|f1| $) (|f2| $) ($ |Boolean|))
        (SPROG
         ((|e2| #1=(|Integer|)) (|e1| #1#) (|m2| #2=(|Integer|)) (|m1| #2#))
         (SEQ
          (LETT |m1| (SPADCALL |f1| (QREFELT $ 16)) . #3=(|MFLOAT;<;2$B;46|))
          (LETT |m2| (SPADCALL |f2| (QREFELT $ 16)) . #3#)
          (LETT |e1| (SPADCALL |f1| (QREFELT $ 22)) . #3#)
          (LETT |e2| (SPADCALL |f2| (QREFELT $ 22)) . #3#)
          (EXIT
           (COND
            ((EQL (SPADCALL |m1| (QREFELT $ 31))
                  (SPADCALL |m2| (QREFELT $ 31)))
             (COND ((< |e1| |e2|) 'T)
                   (#4='T
                    (SEQ
                     (COND ((EQL |e1| |e2|) (COND ((< |m1| |m2|) (EXIT 'T)))))
                     (EXIT NIL)))))
            ((EQL (SPADCALL |m1| (QREFELT $ 31)) 1) NIL)
            (#4#
             (SEQ
              (COND
               ((EQL (SPADCALL |m1| (QREFELT $ 31)) 0)
                (COND ((EQL (SPADCALL |m2| (QREFELT $ 31)) -1) (EXIT NIL)))))
              (EXIT 'T)))))))) 

(PUT '|MFLOAT;characteristic;Nni;47| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |MFLOAT;characteristic;Nni;47| (($ |NonNegativeInteger|)) 0) 

(DECLAIM (NOTINLINE |MachineFloat;|)) 

(DEFUN |MachineFloat| ()
  (SPROG NIL
         (PROG (#1=#:G898)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|MachineFloat|)
                    . #2=(|MachineFloat|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|MachineFloat|
                             (LIST (CONS NIL (CONS 1 (|MachineFloat;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|MachineFloat|)))))))))) 

(DEFUN |MachineFloat;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|MachineFloat|) . #1=(|MachineFloat|))
          (LETT $ (GETREFV 118) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|MachineFloat| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (AND (|HasCategory| $ '(|arbitraryPrecision|))
               (|augmentPredVector| $ 1))
          (AND (|not| (|HasCategory| $ '(|arbitraryExponent|)))
               (|not| (|HasCategory| $ '(|arbitraryPrecision|)))
               (|augmentPredVector| $ 2))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |mantissa| (|Integer|))
                              (|:| |exponent| (|Integer|))))
          (QSETREFV $ 7 16)
          (QSETREFV $ 8 2)
          (QSETREFV $ 9 -1021)
          (QSETREFV $ 10 1024)
          (QSETREFV $ 11 53)
          (QSETREFV $ 14
                    (SPADCALL (QREFELT $ 8) (QREFELT $ 11) (QREFELT $ 13)))
          $))) 

(MAKEPROP '|MachineFloat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| 'P 'B 'EMIN 'EMAX 'POWER
              (|PositiveInteger|) (0 . ^) 'MMAX (|Integer|)
              |MFLOAT;mantissa;$I;4|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MFLOAT;One;$;29|) $))
              (|Float|) (6 . |One|) (|Fraction| 15) (10 . /)
              |MFLOAT;exponent;$I;5| (16 . ^) (22 . *) (|Union| 20 '"failed")
              |MFLOAT;retractIfCan;$U;1| (|Boolean|) (28 . |positive?|)
              (33 . |wholePart|) |MFLOAT;wholePart;$I;2| (38 . |sign|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MFLOAT;Zero;$;28|) $))
              (43 . |Zero|) (47 . >) (53 . /) (|Void|) (59 . |void|)
              (63 . |coerce|) (68 . |sign|) (73 . |abs|) (78 . |zero?|)
              (83 . *) |MFLOAT;changeBase;2IPi$;7| (|List| $) (|String|)
              (89 . |concat|) |MFLOAT;coerce;$F;11| (|OutputForm|)
              (94 . |coerce|) |MFLOAT;coerce;$Of;9| (|MachineInteger|)
              (99 . |retract|) |MFLOAT;coerce;Mi$;10| (104 . |digits|)
              (109 . |float|) (116 . |exponent|) (121 . |mantissa|)
              (126 . |base|) |MFLOAT;coerce;F$;12| (130 . |coerce|)
              (135 . |numer|) |MFLOAT;coerce;I$;13| (140 . |denom|)
              |MFLOAT;/;3$;35| |MFLOAT;coerce;F$;14| |MFLOAT;retract;$F;15|
              |MFLOAT;retract;$F;16| (|Union| 18 '"failed")
              |MFLOAT;retractIfCan;$U;17| (145 . |fractionPart|)
              (|Union| 15 '"failed") |MFLOAT;retractIfCan;$U;18| (150 . =)
              |MFLOAT;retract;$I;19| |MFLOAT;precision;2Pi;20|
              |MFLOAT;precision;Pi;21| |MFLOAT;base;2Pi;22| |MFLOAT;base;Pi;23|
              |MFLOAT;maximumExponent;2I;24| |MFLOAT;maximumExponent;I;25|
              |MFLOAT;minimumExponent;2I;26| |MFLOAT;minimumExponent;I;27|
              |MFLOAT;=;2$B;42| |MFLOAT;zero?;$B;30| (156 . >=)
              (|Union| $ '"failed") |MFLOAT;recip;$U;32| |MFLOAT;*;3$;33|
              (162 . ^) |MFLOAT;^;$F$;34| |MFLOAT;inv;2$;36|
              |MFLOAT;exquo;2$U;37|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |MFLOAT;divide;2$R;38| |MFLOAT;quo;3$;39| |MFLOAT;rem;3$;40|
              |MFLOAT;*;I2$;41| |MFLOAT;+;3$;43| |MFLOAT;-;2$;44|
              |MFLOAT;-;3$;45| |MFLOAT;<;2$B;46| (|NonNegativeInteger|)
              |MFLOAT;characteristic;Nni;47| (|Pattern| 18)
              (|PatternMatchResult| 18 $) (|DoubleFloat|) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 108 '#1="failed") (|Union| 44 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef| 44) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|SingleInteger|) (|HashState|))
           '#(~= 168 |zero?| 174 |wholePart| 179 |unitNormal| 184
              |unitCanonical| 189 |unit?| 194 |truncate| 199 |toString| 204
              |subtractIfCan| 215 |squareFreePart| 221 |squareFree| 226 |sqrt|
              231 |smaller?| 236 |sizeLess?| 242 |sign| 248 |sample| 253
              |round| 257 |rightRecip| 262 |rightPower| 267 |retractIfCan| 279
              |retract| 294 |rem| 309 |recip| 315 |quo| 320 |principalIdeal|
              326 |prime?| 331 |precision| 336 |positive?| 345 |patternMatch|
              350 |order| 357 |opposite?| 362 |one?| 368 |nthRoot| 373 |norm|
              379 |negative?| 384 |multiEuclidean| 389 |minimumExponent| 395
              |min| 404 |maximumExponent| 414 |max| 423 |mantissa| 433
              |leftRecip| 438 |leftPower| 443 |lcmCoef| 455 |lcm| 461 |latex|
              472 |inv| 477 |increasePrecision| 482 |hashUpdate!| 487 |hash|
              493 |gcdPolynomial| 498 |gcd| 504 |fractionPart| 515 |floor| 520
              |float| 525 |factor| 538 |extendedEuclidean| 543 |exquo| 556
              |expressIdealMember| 562 |exponent| 568 |euclideanSize| 573
              |divide| 578 |digits| 584 |decreasePrecision| 593 |convert| 598
              |commutator| 618 |coerce| 624 |characteristic| 659 |changeBase|
              663 |ceiling| 670 |bits| 675 |base| 684 |associator| 693
              |associates?| 700 |antiCommutator| 706 |annihilate?| 712 |abs|
              718 ^ 723 |Zero| 747 |One| 751 >= 755 > 761 = 767 <= 773 < 779 /
              785 - 797 + 808 * 814)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|FloatingPointSystem&| |RealNumberSystem&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&| NIL
                |GcdDomain&| NIL |OrderedRing&| |DivisionRing&| NIL NIL NIL
                |Algebra&| |EntireRing&| |Algebra&| NIL |Rng&| NIL |Module&|
                |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL NIL NIL NIL
                |OrderedSet&| NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| NIL NIL |Magma&| |AbelianSemiGroup&| NIL
                |SetCategory&| |RetractableTo&| NIL NIL NIL |RadicalCategory&|
                |RetractableTo&| |RetractableTo&| NIL NIL |PartialOrder&| NIL
                NIL NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|FloatingPointSystem|) (|RealNumberSystem|) (|Field|)
                 (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|FortranMachineTypeCategory|)
                 (|GcdDomain|) (|IntegralDomain|) (|OrderedRing|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|CharacteristicZero|) (|Algebra| 20) (|EntireRing|)
                 (|Algebra| $$) (|Ring|) (|Rng|) (|SemiRing|) (|Module| 20)
                 (|Module| $$) (|SemiRng|) (|OrderedAbelianGroup|)
                 (|BiModule| 20 20) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| 20)
                 (|LeftModule| 20) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|PatternMatchable| 18) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|RealConstant|) (|SetCategory|)
                 (|RetractableTo| 18) (|ConvertibleTo| 45) (|Approximate|)
                 (|ConvertibleTo| 104) (|RadicalCategory|) (|RetractableTo| 20)
                 (|RetractableTo| 15) (|ConvertibleTo| 18)
                 (|ConvertibleTo| 106) (|PartialOrder|) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 48))
              (|makeByteWordVec2| 117
                                  '(2 12 0 0 12 13 0 18 0 19 2 20 0 15 15 21 2
                                    20 0 0 15 23 2 20 0 15 0 24 1 15 27 0 28 1
                                    20 15 0 29 1 15 15 0 31 0 18 0 33 2 15 27 0
                                    0 34 2 20 0 0 0 35 0 36 0 37 1 20 0 15 38 1
                                    20 15 0 39 1 20 0 0 40 1 20 27 0 41 2 20 0
                                    0 20 42 1 45 0 44 46 1 18 48 0 49 1 51 15 0
                                    52 1 18 12 12 54 3 18 0 15 15 12 55 1 18 15
                                    0 56 1 18 15 0 57 0 18 12 58 1 0 0 15 60 1
                                    20 15 0 61 1 20 15 0 63 1 20 0 0 70 2 71 27
                                    0 0 73 2 20 27 0 0 85 2 18 0 0 20 89 2 0 27
                                    0 0 1 1 0 27 0 84 1 0 15 0 30 1 0 115 0 1 1
                                    0 0 0 1 1 0 27 0 1 1 0 0 0 1 2 0 45 0 102 1
                                    1 0 45 0 1 2 0 86 0 0 1 1 0 0 0 1 1 0 107 0
                                    1 1 0 0 0 1 2 0 27 0 0 1 2 0 27 0 0 1 1 0
                                    15 0 1 0 0 0 1 1 0 0 0 1 1 0 86 0 1 2 0 0 0
                                    102 1 2 0 0 0 12 1 1 0 68 0 69 1 0 25 0 26
                                    1 0 71 0 72 1 0 18 0 67 1 0 20 0 66 1 0 15
                                    0 74 2 0 0 0 0 96 1 0 86 0 87 2 0 0 0 0 95
                                    1 0 112 44 1 1 0 27 0 1 1 0 12 12 75 0 0 12
                                    76 1 0 27 0 1 3 0 105 0 104 105 1 1 0 15 0
                                    1 2 0 27 0 0 1 1 0 27 0 1 2 0 0 0 15 1 1 0
                                    0 0 1 1 0 27 0 1 2 0 110 44 0 1 0 0 15 82 1
                                    0 15 15 81 0 2 0 1 2 0 0 0 0 1 0 0 15 80 1
                                    0 15 15 79 0 2 0 1 2 0 0 0 0 1 1 0 15 0 16
                                    1 0 86 0 1 2 0 0 0 102 1 2 0 0 0 12 1 2 0
                                    114 0 0 1 1 0 0 44 1 2 0 0 0 0 1 1 0 45 0 1
                                    1 0 0 0 91 1 1 12 15 1 2 0 117 117 0 1 1 0
                                    116 0 1 2 0 113 113 113 1 1 0 0 44 1 2 0 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 15 15 12 1
                                    2 0 0 15 15 1 1 0 107 0 1 3 0 109 0 0 0 1 2
                                    0 111 0 0 1 2 0 86 0 0 92 2 0 110 44 0 1 1
                                    0 15 0 22 1 0 102 0 1 2 0 93 0 0 94 1 1 12
                                    12 1 0 0 12 1 1 1 12 15 1 1 0 45 0 1 1 0
                                    104 0 1 1 0 106 0 1 1 0 18 0 1 2 0 0 0 0 1
                                    1 0 0 51 53 1 0 18 0 47 1 0 0 18 59 1 0 0
                                    20 65 1 0 0 15 62 1 0 0 0 1 1 0 48 0 50 0 0
                                    102 103 3 0 0 15 15 12 43 1 0 0 0 1 1 1 12
                                    12 1 0 0 12 1 1 0 12 12 77 0 0 12 78 3 0 0
                                    0 0 0 1 2 0 27 0 0 1 2 0 0 0 0 1 2 0 27 0 0
                                    1 1 0 0 0 1 2 0 0 0 20 90 2 0 0 0 15 1 2 0
                                    0 0 102 1 2 0 0 0 12 1 0 0 0 32 0 0 0 17 2
                                    0 27 0 0 1 2 0 27 0 0 1 2 0 27 0 0 83 2 0
                                    27 0 0 1 2 0 27 0 0 101 2 0 0 0 15 1 2 0 0
                                    0 0 64 1 0 0 0 99 2 0 0 0 0 100 2 0 0 0 0
                                    98 2 0 0 0 20 1 2 0 0 20 0 1 2 0 0 102 0 1
                                    2 0 0 15 0 97 2 0 0 0 0 88 2 0 0 12 0
                                    1)))))
           '|lookupComplete|)) 

(MAKEPROP '|MachineFloat| 'NILADIC T) 
