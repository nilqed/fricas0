
(SDEFUN |NUMQUAD;aromberg;M4F3IR;1|
        ((|func| |Mapping| (|Float|) (|Float|)) (|a| . #1=(|Float|))
         (|b| |Float|) (|epsrel| |Float|) (|epsabs| |Float|) (|nmin| |Integer|)
         (|nmax| |Integer|) (|nint| |Integer|)
         ($ |Record| (|:| |value| (|Float|)) (|:| |error| (|Float|))
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((#2=#:G733 NIL) (|x2| (|Float|)) (|x1| #1#) (|done| (|Boolean|))
          (|pts| (|Integer|)) (|err| #3=(|Float|)) (|sum| #3#)
          (|ans|
           (|Record| (|:| |value| (|Float|)) (|:| |error| (|Float|))
                     (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
          (#4=#:G734 NIL) (|i| NIL) (|io| (|List| (|OutputForm|)))
          (|hh| (|Float|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |sum| (SPADCALL 0 0 10 (QREFELT $ 10))
                  . #5=(|NUMQUAD;aromberg;M4F3IR;1|))
            (LETT |err| (SPADCALL 0 0 10 (QREFELT $ 10)) . #5#)
            (LETT |pts| 1 . #5#) (LETT |done| 'T . #5#)
            (LETT |hh|
                  (SPADCALL (SPADCALL |b| |a| (QREFELT $ 11)) |nint|
                            (QREFELT $ 12))
                  . #5#)
            (LETT |x1| |a| . #5#)
            (LETT |x2| (SPADCALL |a| |hh| (QREFELT $ 13)) . #5#)
            (LETT |io|
                  (LIST (SPADCALL |x1| (QREFELT $ 15))
                        (SPADCALL |x2| (QREFELT $ 15)))
                  . #5#)
            (SEQ (LETT |i| 1 . #5#) (LETT #4# |nint| . #5#) G190
                 (COND ((|greater_SI| |i| #4#) (GO G191)))
                 (SEQ
                  (LETT |ans|
                        (SPADCALL |func| |x1| |x2| |epsrel| |epsabs| |nmin|
                                  |nmax| (QREFELT $ 18))
                        . #5#)
                  (COND
                   ((NULL (QVELT |ans| 3))
                    (SEQ
                     (SPADCALL |io| 1 (SPADCALL |x1| (QREFELT $ 15))
                               (QREFELT $ 21))
                     (SPADCALL |io| 2 (SPADCALL |x2| (QREFELT $ 15))
                               (QREFELT $ 21))
                     (EXIT
                      (SPADCALL
                       (SPADCALL (CONS "accuracy not reached in interval" |io|)
                                 (QREFELT $ 23))
                       (QREFELT $ 25))))))
                  (LETT |sum| (SPADCALL |sum| (QVELT |ans| 0) (QREFELT $ 13))
                        . #5#)
                  (LETT |err|
                        (SPADCALL |err|
                                  (SPADCALL (QVELT |ans| 1) (QREFELT $ 26))
                                  (QREFELT $ 13))
                        . #5#)
                  (LETT |pts| (- (+ |pts| (QVELT |ans| 2)) 1) . #5#)
                  (LETT |done| (COND (|done| (QVELT |ans| 3)) ('T NIL)) . #5#)
                  (LETT |x1| |x2| . #5#)
                  (EXIT (LETT |x2| (SPADCALL |x2| |hh| (QREFELT $ 13)) . #5#)))
                 (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN
              (LETT #2# (VECTOR |sum| |err| |pts| |done|) . #5#)
              (GO #6=#:G732)))))
          #6# (EXIT #2#)))) 

(SDEFUN |NUMQUAD;asimpson;M4F3IR;2|
        ((|func| |Mapping| (|Float|) (|Float|)) (|a| . #1=(|Float|))
         (|b| |Float|) (|epsrel| |Float|) (|epsabs| |Float|) (|nmin| |Integer|)
         (|nmax| |Integer|) (|nint| |Integer|)
         ($ |Record| (|:| |value| (|Float|)) (|:| |error| (|Float|))
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((#2=#:G743 NIL) (|x2| (|Float|)) (|x1| #1#) (|done| (|Boolean|))
          (|pts| (|Integer|)) (|err| #3=(|Float|)) (|sum| #3#)
          (|ans|
           (|Record| (|:| |value| (|Float|)) (|:| |error| (|Float|))
                     (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
          (#4=#:G744 NIL) (|i| NIL) (|io| (|List| (|OutputForm|)))
          (|hh| (|Float|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |sum| (SPADCALL 0 0 10 (QREFELT $ 10))
                  . #5=(|NUMQUAD;asimpson;M4F3IR;2|))
            (LETT |err| (SPADCALL 0 0 10 (QREFELT $ 10)) . #5#)
            (LETT |pts| 1 . #5#) (LETT |done| 'T . #5#)
            (LETT |hh|
                  (SPADCALL (SPADCALL |b| |a| (QREFELT $ 11)) |nint|
                            (QREFELT $ 12))
                  . #5#)
            (LETT |x1| |a| . #5#)
            (LETT |x2| (SPADCALL |a| |hh| (QREFELT $ 13)) . #5#)
            (LETT |io|
                  (LIST (SPADCALL |x1| (QREFELT $ 15))
                        (SPADCALL |x2| (QREFELT $ 15)))
                  . #5#)
            (SEQ (LETT |i| 1 . #5#) (LETT #4# |nint| . #5#) G190
                 (COND ((|greater_SI| |i| #4#) (GO G191)))
                 (SEQ
                  (LETT |ans|
                        (SPADCALL |func| |x1| |x2| |epsrel| |epsabs| |nmin|
                                  |nmax| (QREFELT $ 28))
                        . #5#)
                  (COND
                   ((NULL (QVELT |ans| 3))
                    (SEQ
                     (SPADCALL |io| 1 (SPADCALL |x1| (QREFELT $ 15))
                               (QREFELT $ 21))
                     (SPADCALL |io| 2 (SPADCALL |x2| (QREFELT $ 15))
                               (QREFELT $ 21))
                     (EXIT
                      (SPADCALL
                       (SPADCALL (CONS "accuracy not reached in interval" |io|)
                                 (QREFELT $ 23))
                       (QREFELT $ 25))))))
                  (LETT |sum| (SPADCALL |sum| (QVELT |ans| 0) (QREFELT $ 13))
                        . #5#)
                  (LETT |err|
                        (SPADCALL |err|
                                  (SPADCALL (QVELT |ans| 1) (QREFELT $ 26))
                                  (QREFELT $ 13))
                        . #5#)
                  (LETT |pts| (- (+ |pts| (QVELT |ans| 2)) 1) . #5#)
                  (LETT |done| (COND (|done| (QVELT |ans| 3)) ('T NIL)) . #5#)
                  (LETT |x1| |x2| . #5#)
                  (EXIT (LETT |x2| (SPADCALL |x2| |hh| (QREFELT $ 13)) . #5#)))
                 (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN
              (LETT #2# (VECTOR |sum| |err| |pts| |done|) . #5#)
              (GO #6=#:G742)))))
          #6# (EXIT #2#)))) 

(SDEFUN |NUMQUAD;atrapezoidal;M4F3IR;3|
        ((|func| |Mapping| (|Float|) (|Float|)) (|a| . #1=(|Float|))
         (|b| |Float|) (|epsrel| |Float|) (|epsabs| |Float|) (|nmin| |Integer|)
         (|nmax| |Integer|) (|nint| |Integer|)
         ($ |Record| (|:| |value| (|Float|)) (|:| |error| (|Float|))
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((#2=#:G753 NIL) (|x2| (|Float|)) (|x1| #1#) (|done| (|Boolean|))
          (|pts| (|Integer|)) (|err| #3=(|Float|)) (|sum| #3#)
          (|ans|
           (|Record| (|:| |value| (|Float|)) (|:| |error| (|Float|))
                     (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
          (#4=#:G754 NIL) (|i| NIL) (|io| (|List| (|OutputForm|)))
          (|hh| (|Float|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |sum| (SPADCALL 0 0 10 (QREFELT $ 10))
                  . #5=(|NUMQUAD;atrapezoidal;M4F3IR;3|))
            (LETT |err| (SPADCALL 0 0 10 (QREFELT $ 10)) . #5#)
            (LETT |pts| 1 . #5#) (LETT |done| 'T . #5#)
            (LETT |hh|
                  (SPADCALL (SPADCALL |b| |a| (QREFELT $ 11)) |nint|
                            (QREFELT $ 12))
                  . #5#)
            (LETT |x1| |a| . #5#)
            (LETT |x2| (SPADCALL |a| |hh| (QREFELT $ 13)) . #5#)
            (LETT |io|
                  (LIST (SPADCALL |x1| (QREFELT $ 15))
                        (SPADCALL |x2| (QREFELT $ 15)))
                  . #5#)
            (SEQ (LETT |i| 1 . #5#) (LETT #4# |nint| . #5#) G190
                 (COND ((|greater_SI| |i| #4#) (GO G191)))
                 (SEQ
                  (LETT |ans|
                        (SPADCALL |func| |x1| |x2| |epsrel| |epsabs| |nmin|
                                  |nmax| (QREFELT $ 30))
                        . #5#)
                  (COND
                   ((NULL (QVELT |ans| 3))
                    (SEQ
                     (SPADCALL |io| 1 (SPADCALL |x1| (QREFELT $ 15))
                               (QREFELT $ 21))
                     (SPADCALL |io| 2 (SPADCALL |x2| (QREFELT $ 15))
                               (QREFELT $ 21))
                     (EXIT
                      (SPADCALL
                       (SPADCALL (CONS "accuracy not reached in interval" |io|)
                                 (QREFELT $ 23))
                       (QREFELT $ 25))))))
                  (LETT |sum| (SPADCALL |sum| (QVELT |ans| 0) (QREFELT $ 13))
                        . #5#)
                  (LETT |err|
                        (SPADCALL |err|
                                  (SPADCALL (QVELT |ans| 1) (QREFELT $ 26))
                                  (QREFELT $ 13))
                        . #5#)
                  (LETT |pts| (- (+ |pts| (QVELT |ans| 2)) 1) . #5#)
                  (LETT |done| (COND (|done| (QVELT |ans| 3)) ('T NIL)) . #5#)
                  (LETT |x1| |x2| . #5#)
                  (EXIT (LETT |x2| (SPADCALL |x2| |hh| (QREFELT $ 13)) . #5#)))
                 (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN
              (LETT #2# (VECTOR |sum| |err| |pts| |done|) . #5#)
              (GO #6=#:G752)))))
          #6# (EXIT #2#)))) 

(SDEFUN |NUMQUAD;romberg;M4F2IR;4|
        ((|func| |Mapping| (|Float|) (|Float|)) (|a| |Float|) (|b| |Float|)
         (|epsrel| |Float|) (|epsabs| |Float|) (|nmin| |Integer|)
         (|nmax| |Integer|)
         ($ |Record| (|:| |value| (|Float|)) (|:| |error| (|Float|))
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((#1=#:G776 NIL) (|qx1| #2=(|Float|)) (|pts| (|Integer|))
          (|delta| #3=(|Float|)) (|oldest| #4=(|Float|)) (|oldsum| #4#)
          (|change| #4#) (|four| (|Integer|)) (|i| (|Integer|)) (#5=#:G778 NIL)
          (|j| NIL) (|newest| #4#) (|newsum| #2#) (#6=#:G777 NIL)
          (|n| (|Integer|)) (|table| (|Vector| (|Float|))) (#7=#:G759 NIL)
          (|length| #3#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |length| (SPADCALL |b| |a| (QREFELT $ 11))
                  . #8=(|NUMQUAD;romberg;M4F2IR;4|))
            (LETT |delta| |length| . #8#)
            (LETT |newsum|
                  (SPADCALL
                   (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10)) |length|
                             (QREFELT $ 32))
                   (SPADCALL (SPADCALL |a| |func|) (SPADCALL |b| |func|)
                             (QREFELT $ 13))
                   (QREFELT $ 32))
                  . #8#)
            (LETT |newest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #8#)
            (LETT |oldsum| (SPADCALL 0 0 10 (QREFELT $ 10)) . #8#)
            (LETT |oldest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #8#)
            (LETT |change| (SPADCALL 0 0 10 (QREFELT $ 10)) . #8#)
            (LETT |qx1| |newsum| . #8#)
            (LETT |table|
                  (MAKEARR1
                   (PROG1 (LETT #7# (+ |nmax| 1) . #8#)
                     (|check_subtype2| (> #7# 0) '(|PositiveInteger|)
                                       '(|Integer|) #7#))
                   (SPADCALL 0 0 10 (QREFELT $ 10)))
                  . #8#)
            (LETT |n| 1 . #8#) (LETT |pts| 1 . #8#)
            (COND
             ((< |nmin| 2)
              (SEQ
               (SPADCALL "romberg: nmin to small (nmin > 1) nmin = "
                         (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 36))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                               (SPADCALL 0 0 10 (QREFELT $ 10)) 0 NIL)
                       . #8#)
                 (GO #9=#:G775))))))
            (COND
             ((< |nmax| |nmin|)
              (SEQ
               (SPADCALL "romberg: nmax < nmin : nmax = "
                         (SPADCALL |nmax| (QREFELT $ 33)) (QREFELT $ 36))
               (SPADCALL "                       nmin = "
                         (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 36))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                               (SPADCALL 0 0 10 (QREFELT $ 10)) 0 NIL)
                       . #8#)
                 (GO #9#))))))
            (COND
             ((SPADCALL |a| |b| (QREFELT $ 38))
              (SEQ
               (SPADCALL "romberg: integration limits are equal  = "
                         (SPADCALL |a| (QREFELT $ 15)) (QREFELT $ 36))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                               (SPADCALL 0 0 10 (QREFELT $ 10)) 1 'T)
                       . #8#)
                 (GO #9#))))))
            (COND
             ((SPADCALL |epsrel| (SPADCALL 0 0 10 (QREFELT $ 10))
                        (QREFELT $ 39))
              (SEQ
               (SPADCALL "romberg: eps_r < 0.0            eps_r  = "
                         (SPADCALL |epsrel| (QREFELT $ 15)) (QREFELT $ 36))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                               (SPADCALL 0 0 10 (QREFELT $ 10)) 0 NIL)
                       . #8#)
                 (GO #9#))))))
            (COND
             ((SPADCALL |epsabs| (SPADCALL 0 0 10 (QREFELT $ 10))
                        (QREFELT $ 39))
              (SEQ
               (SPADCALL "romberg: eps_a < 0.0            eps_a  = "
                         (SPADCALL |epsabs| (QREFELT $ 15)) (QREFELT $ 36))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                               (SPADCALL 0 0 10 (QREFELT $ 10)) 0 NIL)
                       . #8#)
                 (GO #9#))))))
            (SEQ (LETT |n| 1 . #8#) (LETT #6# |nmax| . #8#) G190
                 (COND ((|greater_SI| |n| #6#) (GO G191)))
                 (SEQ (LETT |oldsum| |newsum| . #8#)
                      (LETT |newsum|
                            (|NUMQUAD;trapclosed| |func| |a| |delta| |oldsum|
                             |pts| $)
                            . #8#)
                      (LETT |newest|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL 4 0 10 (QREFELT $ 10))
                                        |newsum| (QREFELT $ 32))
                              |oldsum| (QREFELT $ 11))
                             (SPADCALL 3 0 10 (QREFELT $ 10)) (QREFELT $ 40))
                            . #8#)
                      (LETT |four| 4 . #8#)
                      (SPADCALL |table| |n| |newest| (QREFELT $ 42))
                      (SEQ (LETT |j| 2 . #8#) (LETT #5# |n| . #8#) G190
                           (COND ((|greater_SI| |j| #5#) (GO G191)))
                           (SEQ (LETT |i| (- (+ |n| 1) |j|) . #8#)
                                (LETT |four| (SPADCALL |four| 4 (QREFELT $ 44))
                                      . #8#)
                                (EXIT
                                 (SPADCALL |table| |i|
                                           (SPADCALL
                                            (SPADCALL |table| (+ |i| 1)
                                                      (QREFELT $ 45))
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |table| (+ |i| 1)
                                                        (QREFELT $ 45))
                                              (SPADCALL |table| |i|
                                                        (QREFELT $ 45))
                                              (QREFELT $ 11))
                                             (- |four| 1) (QREFELT $ 12))
                                            (QREFELT $ 13))
                                           (QREFELT $ 42))))
                           (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                           (EXIT NIL))
                      (COND
                       ((SPADCALL |n| |nmin| (QREFELT $ 46))
                        (SEQ
                         (LETT |change|
                               (SPADCALL
                                (SPADCALL (SPADCALL |table| 1 (QREFELT $ 45))
                                          |qx1| (QREFELT $ 11))
                                (QREFELT $ 26))
                               . #8#)
                         (COND
                          ((SPADCALL |change|
                                     (SPADCALL
                                      (SPADCALL |epsrel| |qx1| (QREFELT $ 32))
                                      (QREFELT $ 26))
                                     (QREFELT $ 39))
                           (PROGN
                            (LETT #1#
                                  (VECTOR (SPADCALL |table| 1 (QREFELT $ 45))
                                          |change|
                                          (+ (SPADCALL 2 |pts| (QREFELT $ 47))
                                             1)
                                          'T)
                                  . #8#)
                            (GO #9#))))
                         (EXIT
                          (COND
                           ((SPADCALL |change| |epsabs| (QREFELT $ 39))
                            (PROGN
                             (LETT #1#
                                   (VECTOR (SPADCALL |table| 1 (QREFELT $ 45))
                                           |change|
                                           (+ (SPADCALL 2 |pts| (QREFELT $ 47))
                                              1)
                                           'T)
                                   . #8#)
                             (GO #9#))))))))
                      (LETT |oldsum| |newsum| . #8#)
                      (LETT |oldest| |newest| . #8#)
                      (LETT |delta|
                            (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10)) |delta|
                                      (QREFELT $ 32))
                            . #8#)
                      (LETT |pts| (SPADCALL 2 |pts| (QREFELT $ 47)) . #8#)
                      (EXIT
                       (LETT |qx1| (SPADCALL |table| 1 (QREFELT $ 45)) . #8#)))
                 (LETT |n| (|inc_SI| |n|) . #8#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN
              (LETT #1#
                    (VECTOR (SPADCALL |table| 1 (QREFELT $ 45))
                            (SPADCALL (SPADCALL 125 -2 10 (QREFELT $ 10))
                                      |change| (QREFELT $ 32))
                            (+ |pts| 1) NIL)
                    . #8#)
              (GO #9#)))))
          #9# (EXIT #1#)))) 

(SDEFUN |NUMQUAD;simpson;M4F2IR;5|
        ((|func| |Mapping| (|Float|) (|Float|)) (|a| |Float|) (|b| |Float|)
         (|epsrel| |Float|) (|epsabs| |Float|) (|nmin| |Integer|)
         (|nmax| |Integer|)
         ($ |Record| (|:| |value| (|Float|)) (|:| |error| (|Float|))
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((#1=#:G794 NIL) (|pts| (|Integer|)) (|delta| #2=(|Float|))
          (|oldest| #3=(|Float|)) (|oldsum| #3#) (|change| #3#) (|newest| #3#)
          (|newsum| (|Float|)) (#4=#:G795 NIL) (|n| (|Integer|))
          (|length| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |length| (SPADCALL |b| |a| (QREFELT $ 11))
                  . #5=(|NUMQUAD;simpson;M4F2IR;5|))
            (LETT |delta| |length| . #5#)
            (LETT |newsum|
                  (SPADCALL
                   (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10))
                             (SPADCALL |b| |a| (QREFELT $ 11)) (QREFELT $ 32))
                   (SPADCALL (SPADCALL |a| |func|) (SPADCALL |b| |func|)
                             (QREFELT $ 13))
                   (QREFELT $ 32))
                  . #5#)
            (LETT |newest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #5#)
            (LETT |oldsum| (SPADCALL 0 0 10 (QREFELT $ 10)) . #5#)
            (LETT |oldest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #5#)
            (LETT |change| (SPADCALL 0 0 10 (QREFELT $ 10)) . #5#)
            (LETT |n| 1 . #5#) (LETT |pts| 1 . #5#)
            (COND
             ((< |nmin| 2)
              (SEQ
               (SPADCALL "simpson: nmin to small (nmin > 1) nmin = "
                         (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 36))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                               (SPADCALL 0 0 10 (QREFELT $ 10)) 0 NIL)
                       . #5#)
                 (GO #6=#:G793))))))
            (COND
             ((< |nmax| |nmin|)
              (SEQ
               (SPADCALL "simpson: nmax < nmin : nmax = "
                         (SPADCALL |nmax| (QREFELT $ 33)) (QREFELT $ 36))
               (SPADCALL "                       nmin = "
                         (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 36))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                               (SPADCALL 0 0 10 (QREFELT $ 10)) 0 NIL)
                       . #5#)
                 (GO #6#))))))
            (COND
             ((SPADCALL |a| |b| (QREFELT $ 38))
              (SEQ
               (SPADCALL "simpson: integration limits are equal  = "
                         (SPADCALL |a| (QREFELT $ 15)) (QREFELT $ 36))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                               (SPADCALL 0 0 10 (QREFELT $ 10)) 1 'T)
                       . #5#)
                 (GO #6#))))))
            (COND
             ((SPADCALL |epsrel| (SPADCALL 0 0 10 (QREFELT $ 10))
                        (QREFELT $ 39))
              (SEQ
               (SPADCALL "simpson: eps_r < 0.0 : eps_r = "
                         (SPADCALL |epsrel| (QREFELT $ 15)) (QREFELT $ 36))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                               (SPADCALL 0 0 10 (QREFELT $ 10)) 0 NIL)
                       . #5#)
                 (GO #6#))))))
            (COND
             ((SPADCALL |epsabs| (SPADCALL 0 0 10 (QREFELT $ 10))
                        (QREFELT $ 39))
              (SEQ
               (SPADCALL "simpson: eps_a < 0.0 : eps_a = "
                         (SPADCALL |epsabs| (QREFELT $ 15)) (QREFELT $ 36))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                               (SPADCALL 0 0 10 (QREFELT $ 10)) 0 NIL)
                       . #5#)
                 (GO #6#))))))
            (SEQ (LETT |n| 1 . #5#) (LETT #4# |nmax| . #5#) G190
                 (COND ((|greater_SI| |n| #4#) (GO G191)))
                 (SEQ (LETT |oldsum| |newsum| . #5#)
                      (LETT |newsum|
                            (|NUMQUAD;trapclosed| |func| |a| |delta| |oldsum|
                             |pts| $)
                            . #5#)
                      (LETT |newest|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL 4 0 10 (QREFELT $ 10))
                                        |newsum| (QREFELT $ 32))
                              |oldsum| (QREFELT $ 11))
                             (SPADCALL 3 0 10 (QREFELT $ 10)) (QREFELT $ 40))
                            . #5#)
                      (COND
                       ((SPADCALL |n| |nmin| (QREFELT $ 46))
                        (SEQ
                         (LETT |change|
                               (SPADCALL
                                (SPADCALL |newest| |oldest| (QREFELT $ 11))
                                (QREFELT $ 26))
                               . #5#)
                         (COND
                          ((SPADCALL |change|
                                     (SPADCALL
                                      (SPADCALL |epsrel| |oldest|
                                                (QREFELT $ 32))
                                      (QREFELT $ 26))
                                     (QREFELT $ 39))
                           (PROGN
                            (LETT #1#
                                  (VECTOR |newest|
                                          (SPADCALL
                                           (SPADCALL 125 -2 10 (QREFELT $ 10))
                                           |change| (QREFELT $ 32))
                                          (+ (SPADCALL 2 |pts| (QREFELT $ 47))
                                             1)
                                          'T)
                                  . #5#)
                            (GO #6#))))
                         (EXIT
                          (COND
                           ((SPADCALL |change| |epsabs| (QREFELT $ 39))
                            (PROGN
                             (LETT #1#
                                   (VECTOR |newest|
                                           (SPADCALL
                                            (SPADCALL 125 -2 10 (QREFELT $ 10))
                                            |change| (QREFELT $ 32))
                                           (+ (SPADCALL 2 |pts| (QREFELT $ 47))
                                              1)
                                           'T)
                                   . #5#)
                             (GO #6#))))))))
                      (LETT |oldsum| |newsum| . #5#)
                      (LETT |oldest| |newest| . #5#)
                      (LETT |delta|
                            (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10)) |delta|
                                      (QREFELT $ 32))
                            . #5#)
                      (EXIT
                       (LETT |pts| (SPADCALL 2 |pts| (QREFELT $ 47)) . #5#)))
                 (LETT |n| (|inc_SI| |n|) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN
              (LETT #1#
                    (VECTOR |newest|
                            (SPADCALL (SPADCALL 125 -2 10 (QREFELT $ 10))
                                      |change| (QREFELT $ 32))
                            (+ |pts| 1) NIL)
                    . #5#)
              (GO #6#)))))
          #6# (EXIT #1#)))) 

(SDEFUN |NUMQUAD;trapezoidal;M4F2IR;6|
        ((|func| |Mapping| (|Float|) (|Float|)) (|a| |Float|) (|b| |Float|)
         (|epsrel| |Float|) (|epsabs| |Float|) (|nmin| |Integer|)
         (|nmax| |Integer|)
         ($ |Record| (|:| |value| (|Float|)) (|:| |error| (|Float|))
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((#1=#:G811 NIL) (|pts| (|Integer|)) (|delta| #2=(|Float|))
          (|change| (|Float|)) (|newsum| #3=(|Float|)) (|oldsum| #3#)
          (#4=#:G812 NIL) (|n| (|Integer|)) (|length| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |length| (SPADCALL |b| |a| (QREFELT $ 11))
                  . #5=(|NUMQUAD;trapezoidal;M4F2IR;6|))
            (LETT |delta| |length| . #5#)
            (LETT |newsum|
                  (SPADCALL
                   (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10))
                             (SPADCALL |b| |a| (QREFELT $ 11)) (QREFELT $ 32))
                   (SPADCALL (SPADCALL |a| |func|) (SPADCALL |b| |func|)
                             (QREFELT $ 13))
                   (QREFELT $ 32))
                  . #5#)
            (LETT |change| (SPADCALL 0 0 10 (QREFELT $ 10)) . #5#)
            (LETT |n| 1 . #5#) (LETT |pts| 1 . #5#)
            (COND
             ((< |nmin| 2)
              (SEQ
               (SPADCALL "trapezoidal: nmin to small (nmin > 1) nmin = "
                         (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 36))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                               (SPADCALL 0 0 10 (QREFELT $ 10)) 0 NIL)
                       . #5#)
                 (GO #6=#:G810))))))
            (COND
             ((< |nmax| |nmin|)
              (SEQ
               (SPADCALL "trapezoidal: nmax < nmin : nmax = "
                         (SPADCALL |nmax| (QREFELT $ 33)) (QREFELT $ 36))
               (SPADCALL "                           nmin = "
                         (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 36))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                               (SPADCALL 0 0 10 (QREFELT $ 10)) 0 NIL)
                       . #5#)
                 (GO #6#))))))
            (COND
             ((SPADCALL |a| |b| (QREFELT $ 38))
              (SEQ
               (SPADCALL "trapezoidal: integration limits are equal  = "
                         (SPADCALL |a| (QREFELT $ 15)) (QREFELT $ 36))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                               (SPADCALL 0 0 10 (QREFELT $ 10)) 1 'T)
                       . #5#)
                 (GO #6#))))))
            (COND
             ((SPADCALL |epsrel| (SPADCALL 0 0 10 (QREFELT $ 10))
                        (QREFELT $ 39))
              (SEQ
               (SPADCALL "trapezoidal: eps_r < 0.0 : eps_r = "
                         (SPADCALL |epsrel| (QREFELT $ 15)) (QREFELT $ 36))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                               (SPADCALL 0 0 10 (QREFELT $ 10)) 0 NIL)
                       . #5#)
                 (GO #6#))))))
            (COND
             ((SPADCALL |epsabs| (SPADCALL 0 0 10 (QREFELT $ 10))
                        (QREFELT $ 39))
              (SEQ
               (SPADCALL "trapezoidal: eps_a < 0.0 : eps_a = "
                         (SPADCALL |epsabs| (QREFELT $ 15)) (QREFELT $ 36))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                               (SPADCALL 0 0 10 (QREFELT $ 10)) 0 NIL)
                       . #5#)
                 (GO #6#))))))
            (SEQ (LETT |n| 1 . #5#) (LETT #4# |nmax| . #5#) G190
                 (COND ((|greater_SI| |n| #4#) (GO G191)))
                 (SEQ (LETT |oldsum| |newsum| . #5#)
                      (LETT |newsum|
                            (|NUMQUAD;trapclosed| |func| |a| |delta| |oldsum|
                             |pts| $)
                            . #5#)
                      (COND
                       ((SPADCALL |n| |nmin| (QREFELT $ 46))
                        (SEQ
                         (LETT |change|
                               (SPADCALL
                                (SPADCALL |newsum| |oldsum| (QREFELT $ 11))
                                (QREFELT $ 26))
                               . #5#)
                         (COND
                          ((SPADCALL |change|
                                     (SPADCALL
                                      (SPADCALL |epsrel| |oldsum|
                                                (QREFELT $ 32))
                                      (QREFELT $ 26))
                                     (QREFELT $ 39))
                           (PROGN
                            (LETT #1#
                                  (VECTOR |newsum|
                                          (SPADCALL
                                           (SPADCALL 125 -2 10 (QREFELT $ 10))
                                           |change| (QREFELT $ 32))
                                          (+ (SPADCALL 2 |pts| (QREFELT $ 47))
                                             1)
                                          'T)
                                  . #5#)
                            (GO #6#))))
                         (EXIT
                          (COND
                           ((SPADCALL |change| |epsabs| (QREFELT $ 39))
                            (PROGN
                             (LETT #1#
                                   (VECTOR |newsum|
                                           (SPADCALL
                                            (SPADCALL 125 -2 10 (QREFELT $ 10))
                                            |change| (QREFELT $ 32))
                                           (+ (SPADCALL 2 |pts| (QREFELT $ 47))
                                              1)
                                           'T)
                                   . #5#)
                             (GO #6#))))))))
                      (LETT |delta|
                            (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10)) |delta|
                                      (QREFELT $ 32))
                            . #5#)
                      (EXIT
                       (LETT |pts| (SPADCALL 2 |pts| (QREFELT $ 47)) . #5#)))
                 (LETT |n| (|inc_SI| |n|) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN
              (LETT #1#
                    (VECTOR |newsum|
                            (SPADCALL (SPADCALL 125 -2 10 (QREFELT $ 10))
                                      |change| (QREFELT $ 32))
                            (+ |pts| 1) NIL)
                    . #5#)
              (GO #6#)))))
          #6# (EXIT #1#)))) 

(SDEFUN |NUMQUAD;rombergo;M4F2IR;7|
        ((|func| |Mapping| (|Float|) (|Float|)) (|a| |Float|) (|b| |Float|)
         (|epsrel| |Float|) (|epsabs| |Float|) (|nmin| |Integer|)
         (|nmax| |Integer|)
         ($ |Record| (|:| |value| (|Float|)) (|:| |error| (|Float|))
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((#1=#:G824 NIL) (|qx1| #2=(|Float|)) (|pts| (|Integer|))
          (|delta| (|Float|)) (|oldest| #3=(|Float|)) (|oldsum| #3#)
          (|change| #3#) (|nine| (|PositiveInteger|)) (|i| (|Integer|))
          (#4=#:G826 NIL) (|j| NIL) (|newest| #3#) (|newsum| #2#)
          (#5=#:G825 NIL) (|n| (|Integer|)) (|table| (|Vector| (|Float|)))
          (#6=#:G814 NIL) (|length| (|Float|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |length| (SPADCALL |b| |a| (QREFELT $ 11))
                  . #7=(|NUMQUAD;rombergo;M4F2IR;7|))
            (LETT |delta|
                  (SPADCALL |length| (SPADCALL 3 0 10 (QREFELT $ 10))
                            (QREFELT $ 40))
                  . #7#)
            (LETT |newsum|
                  (SPADCALL |length|
                            (SPADCALL
                             (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10))
                                       (SPADCALL |a| |b| (QREFELT $ 13))
                                       (QREFELT $ 32))
                             |func|)
                            (QREFELT $ 32))
                  . #7#)
            (LETT |newest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #7#)
            (LETT |oldsum| (SPADCALL 0 0 10 (QREFELT $ 10)) . #7#)
            (LETT |oldest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #7#)
            (LETT |change| (SPADCALL 0 0 10 (QREFELT $ 10)) . #7#)
            (LETT |qx1| |newsum| . #7#)
            (LETT |table|
                  (MAKEARR1
                   (PROG1 (LETT #6# (+ |nmax| 1) . #7#)
                     (|check_subtype2| (> #6# 0) '(|PositiveInteger|)
                                       '(|Integer|) #6#))
                   (SPADCALL 0 0 10 (QREFELT $ 10)))
                  . #7#)
            (LETT |n| 1 . #7#) (LETT |pts| 1 . #7#)
            (SEQ (LETT |n| 1 . #7#) (LETT #5# |nmax| . #7#) G190
                 (COND ((|greater_SI| |n| #5#) (GO G191)))
                 (SEQ (LETT |oldsum| |newsum| . #7#)
                      (LETT |newsum|
                            (|NUMQUAD;trapopen| |func| |a| |delta| |oldsum|
                             |pts| $)
                            . #7#)
                      (LETT |newest|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL 9 0 10 (QREFELT $ 10))
                                        |newsum| (QREFELT $ 32))
                              |oldsum| (QREFELT $ 11))
                             (SPADCALL 8 0 10 (QREFELT $ 10)) (QREFELT $ 40))
                            . #7#)
                      (SPADCALL |table| |n| |newest| (QREFELT $ 42))
                      (LETT |nine| 9 . #7#)
                      (SPADCALL (SPADCALL |newest| (QREFELT $ 15))
                                (QREFELT $ 48))
                      (SEQ (LETT |j| 2 . #7#) (LETT #4# |n| . #7#) G190
                           (COND ((|greater_SI| |j| #4#) (GO G191)))
                           (SEQ (LETT |i| (- (+ |n| 1) |j|) . #7#)
                                (LETT |nine| (* |nine| 9) . #7#)
                                (EXIT
                                 (SPADCALL |table| |i|
                                           (SPADCALL
                                            (SPADCALL |table| (+ |i| 1)
                                                      (QREFELT $ 45))
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |table| (+ |i| 1)
                                                        (QREFELT $ 45))
                                              (SPADCALL |table| |i|
                                                        (QREFELT $ 45))
                                              (QREFELT $ 11))
                                             (- |nine| 1) (QREFELT $ 12))
                                            (QREFELT $ 13))
                                           (QREFELT $ 42))))
                           (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191
                           (EXIT NIL))
                      (COND
                       ((SPADCALL |n| |nmin| (QREFELT $ 46))
                        (SEQ
                         (LETT |change|
                               (SPADCALL
                                (SPADCALL (SPADCALL |table| 1 (QREFELT $ 45))
                                          |qx1| (QREFELT $ 11))
                                (QREFELT $ 26))
                               . #7#)
                         (COND
                          ((SPADCALL |change|
                                     (SPADCALL
                                      (SPADCALL |epsrel| |qx1| (QREFELT $ 32))
                                      (QREFELT $ 26))
                                     (QREFELT $ 39))
                           (PROGN
                            (LETT #1#
                                  (VECTOR (SPADCALL |table| 1 (QREFELT $ 45))
                                          (SPADCALL
                                           (SPADCALL 15 -1 10 (QREFELT $ 10))
                                           |change| (QREFELT $ 32))
                                          (SPADCALL 3 |pts| (QREFELT $ 47)) 'T)
                                  . #7#)
                            (GO #8=#:G823))))
                         (EXIT
                          (COND
                           ((SPADCALL |change| |epsabs| (QREFELT $ 39))
                            (PROGN
                             (LETT #1#
                                   (VECTOR (SPADCALL |table| 1 (QREFELT $ 45))
                                           (SPADCALL
                                            (SPADCALL 15 -1 10 (QREFELT $ 10))
                                            |change| (QREFELT $ 32))
                                           (SPADCALL 3 |pts| (QREFELT $ 47))
                                           'T)
                                   . #7#)
                             (GO #8#))))))))
                      (SPADCALL (SPADCALL |table| (QREFELT $ 49))
                                (QREFELT $ 48))
                      (LETT |oldsum| |newsum| . #7#)
                      (LETT |oldest| |newest| . #7#)
                      (LETT |delta|
                            (SPADCALL |delta| (SPADCALL 3 0 10 (QREFELT $ 10))
                                      (QREFELT $ 40))
                            . #7#)
                      (LETT |pts| (SPADCALL 3 |pts| (QREFELT $ 47)) . #7#)
                      (EXIT
                       (LETT |qx1| (SPADCALL |table| 1 (QREFELT $ 45)) . #7#)))
                 (LETT |n| (|inc_SI| |n|) . #7#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN
              (LETT #1#
                    (VECTOR (SPADCALL |table| 1 (QREFELT $ 45))
                            (SPADCALL (SPADCALL 15 -1 10 (QREFELT $ 10))
                                      |change| (QREFELT $ 32))
                            |pts| NIL)
                    . #7#)
              (GO #8#)))))
          #8# (EXIT #1#)))) 

(SDEFUN |NUMQUAD;simpsono;M4F2IR;8|
        ((|func| |Mapping| (|Float|) (|Float|)) (|a| |Float|) (|b| |Float|)
         (|epsrel| |Float|) (|epsabs| |Float|) (|nmin| |Integer|)
         (|nmax| |Integer|)
         ($ |Record| (|:| |value| (|Float|)) (|:| |error| (|Float|))
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((#1=#:G835 NIL) (|pts| (|Integer|)) (|delta| (|Float|))
          (|oldest| #2=(|Float|)) (|oldsum| #2#) (|change| #2#) (|newest| #2#)
          (|newsum| (|Float|)) (#3=#:G836 NIL) (|n| (|Integer|))
          (|length| (|Float|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |length| (SPADCALL |b| |a| (QREFELT $ 11))
                  . #4=(|NUMQUAD;simpsono;M4F2IR;8|))
            (LETT |delta|
                  (SPADCALL |length| (SPADCALL 3 0 10 (QREFELT $ 10))
                            (QREFELT $ 40))
                  . #4#)
            (LETT |newsum|
                  (SPADCALL |length|
                            (SPADCALL
                             (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10))
                                       (SPADCALL |a| |b| (QREFELT $ 13))
                                       (QREFELT $ 32))
                             |func|)
                            (QREFELT $ 32))
                  . #4#)
            (LETT |newest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #4#)
            (LETT |oldsum| (SPADCALL 0 0 10 (QREFELT $ 10)) . #4#)
            (LETT |oldest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #4#)
            (LETT |change| (SPADCALL 0 0 10 (QREFELT $ 10)) . #4#)
            (LETT |n| 1 . #4#) (LETT |pts| 1 . #4#)
            (SEQ (LETT |n| 1 . #4#) (LETT #3# |nmax| . #4#) G190
                 (COND ((|greater_SI| |n| #3#) (GO G191)))
                 (SEQ (LETT |oldsum| |newsum| . #4#)
                      (LETT |newsum|
                            (|NUMQUAD;trapopen| |func| |a| |delta| |oldsum|
                             |pts| $)
                            . #4#)
                      (LETT |newest|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL 9 0 10 (QREFELT $ 10))
                                        |newsum| (QREFELT $ 32))
                              |oldsum| (QREFELT $ 11))
                             (SPADCALL 8 0 10 (QREFELT $ 10)) (QREFELT $ 40))
                            . #4#)
                      (SPADCALL (SPADCALL |newest| (QREFELT $ 15))
                                (QREFELT $ 48))
                      (COND
                       ((SPADCALL |n| |nmin| (QREFELT $ 46))
                        (SEQ
                         (LETT |change|
                               (SPADCALL
                                (SPADCALL |newest| |oldest| (QREFELT $ 11))
                                (QREFELT $ 26))
                               . #4#)
                         (COND
                          ((SPADCALL |change|
                                     (SPADCALL
                                      (SPADCALL |epsrel| |oldest|
                                                (QREFELT $ 32))
                                      (QREFELT $ 26))
                                     (QREFELT $ 39))
                           (PROGN
                            (LETT #1#
                                  (VECTOR |newest|
                                          (SPADCALL
                                           (SPADCALL 15 -1 10 (QREFELT $ 10))
                                           |change| (QREFELT $ 32))
                                          (SPADCALL 3 |pts| (QREFELT $ 47)) 'T)
                                  . #4#)
                            (GO #5=#:G834))))
                         (EXIT
                          (COND
                           ((SPADCALL |change| |epsabs| (QREFELT $ 39))
                            (PROGN
                             (LETT #1#
                                   (VECTOR |newest|
                                           (SPADCALL
                                            (SPADCALL 15 -1 10 (QREFELT $ 10))
                                            |change| (QREFELT $ 32))
                                           (SPADCALL 3 |pts| (QREFELT $ 47))
                                           'T)
                                   . #4#)
                             (GO #5#))))))))
                      (LETT |oldsum| |newsum| . #4#)
                      (LETT |oldest| |newest| . #4#)
                      (LETT |delta|
                            (SPADCALL |delta| (SPADCALL 3 0 10 (QREFELT $ 10))
                                      (QREFELT $ 40))
                            . #4#)
                      (EXIT
                       (LETT |pts| (SPADCALL 3 |pts| (QREFELT $ 47)) . #4#)))
                 (LETT |n| (|inc_SI| |n|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN
              (LETT #1#
                    (VECTOR |newest|
                            (SPADCALL (SPADCALL 15 -1 10 (QREFELT $ 10))
                                      |change| (QREFELT $ 32))
                            |pts| NIL)
                    . #4#)
              (GO #5#)))))
          #5# (EXIT #1#)))) 

(SDEFUN |NUMQUAD;trapezoidalo;M4F2IR;9|
        ((|func| |Mapping| (|Float|) (|Float|)) (|a| |Float|) (|b| |Float|)
         (|epsrel| |Float|) (|epsabs| |Float|) (|nmin| |Integer|)
         (|nmax| |Integer|)
         ($ |Record| (|:| |value| (|Float|)) (|:| |error| (|Float|))
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((#1=#:G845 NIL) (|pts| (|Integer|)) (|delta| (|Float|))
          (|change| (|Float|)) (|newsum| #2=(|Float|)) (|oldsum| #2#)
          (#3=#:G846 NIL) (|n| NIL) (|length| (|Float|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |length| (SPADCALL |b| |a| (QREFELT $ 11))
                  . #4=(|NUMQUAD;trapezoidalo;M4F2IR;9|))
            (LETT |delta|
                  (SPADCALL |length| (SPADCALL 3 0 10 (QREFELT $ 10))
                            (QREFELT $ 40))
                  . #4#)
            (LETT |newsum|
                  (SPADCALL |length|
                            (SPADCALL
                             (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10))
                                       (SPADCALL |a| |b| (QREFELT $ 13))
                                       (QREFELT $ 32))
                             |func|)
                            (QREFELT $ 32))
                  . #4#)
            (LETT |change| (SPADCALL 0 0 10 (QREFELT $ 10)) . #4#)
            (LETT |pts| 1 . #4#)
            (SEQ (LETT |n| 1 . #4#) (LETT #3# |nmax| . #4#) G190
                 (COND ((|greater_SI| |n| #3#) (GO G191)))
                 (SEQ (LETT |oldsum| |newsum| . #4#)
                      (LETT |newsum|
                            (|NUMQUAD;trapopen| |func| |a| |delta| |oldsum|
                             |pts| $)
                            . #4#)
                      (SPADCALL (SPADCALL |newsum| (QREFELT $ 15))
                                (QREFELT $ 48))
                      (COND
                       ((SPADCALL |n| |nmin| (QREFELT $ 46))
                        (SEQ
                         (LETT |change|
                               (SPADCALL
                                (SPADCALL |newsum| |oldsum| (QREFELT $ 11))
                                (QREFELT $ 26))
                               . #4#)
                         (COND
                          ((SPADCALL |change|
                                     (SPADCALL
                                      (SPADCALL |epsrel| |oldsum|
                                                (QREFELT $ 32))
                                      (QREFELT $ 26))
                                     (QREFELT $ 39))
                           (PROGN
                            (LETT #1#
                                  (VECTOR |newsum|
                                          (SPADCALL
                                           (SPADCALL 15 -1 10 (QREFELT $ 10))
                                           |change| (QREFELT $ 32))
                                          (SPADCALL 3 |pts| (QREFELT $ 47)) 'T)
                                  . #4#)
                            (GO #5=#:G844))))
                         (EXIT
                          (COND
                           ((SPADCALL |change| |epsabs| (QREFELT $ 39))
                            (PROGN
                             (LETT #1#
                                   (VECTOR |newsum|
                                           (SPADCALL
                                            (SPADCALL 15 -1 10 (QREFELT $ 10))
                                            |change| (QREFELT $ 32))
                                           (SPADCALL 3 |pts| (QREFELT $ 47))
                                           'T)
                                   . #4#)
                             (GO #5#))))))))
                      (LETT |delta|
                            (SPADCALL |delta| (SPADCALL 3 0 10 (QREFELT $ 10))
                                      (QREFELT $ 40))
                            . #4#)
                      (EXIT
                       (LETT |pts| (SPADCALL 3 |pts| (QREFELT $ 47)) . #4#)))
                 (LETT |n| (|inc_SI| |n|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN
              (LETT #1#
                    (VECTOR |newsum|
                            (SPADCALL (SPADCALL 15 -1 10 (QREFELT $ 10))
                                      |change| (QREFELT $ 32))
                            |pts| NIL)
                    . #4#)
              (GO #5#)))))
          #5# (EXIT #1#)))) 

(SDEFUN |NUMQUAD;trapclosed|
        ((|func| |Mapping| (|Float|) (|Float|)) (|start| |Float|) (|h| |Float|)
         (|oldsum| |Float|) (|numpoints| |Integer|) ($ |Float|))
        (SPROG
         ((#1=#:G851 NIL) (|x| (|Float|)) (|sum| (|Float|)) (#2=#:G852 NIL)
          (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |x|
                  (SPADCALL |start|
                            (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10)) |h|
                                      (QREFELT $ 32))
                            (QREFELT $ 13))
                  . #3=(|NUMQUAD;trapclosed|))
            (LETT |sum| (SPADCALL 0 0 10 (QREFELT $ 10)) . #3#)
            (SEQ (LETT |i| 1 . #3#) (LETT #2# |numpoints| . #3#) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (LETT |sum|
                        (SPADCALL |sum| (SPADCALL |x| |func|) (QREFELT $ 13))
                        . #3#)
                  (EXIT (LETT |x| (SPADCALL |x| |h| (QREFELT $ 13)) . #3#)))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN
              (LETT #1#
                    (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10))
                              (SPADCALL |oldsum|
                                        (SPADCALL |sum| |h| (QREFELT $ 32))
                                        (QREFELT $ 13))
                              (QREFELT $ 32))
                    . #3#)
              (GO #4=#:G850)))))
          #4# (EXIT #1#)))) 

(SDEFUN |NUMQUAD;trapopen|
        ((|func| |Mapping| (|Float|) (|Float|)) (|start| |Float|)
         (|del| |Float|) (|oldsum| |Float|) (|numpoints| |Integer|)
         ($ |Float|))
        (SPROG
         ((#1=#:G857 NIL) (|x| (|Float|)) (|sum| (|Float|)) (#2=#:G858 NIL)
          (|i| NIL) (|ddel| (|Float|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ddel|
                  (SPADCALL (SPADCALL 2 0 10 (QREFELT $ 10)) |del|
                            (QREFELT $ 32))
                  . #3=(|NUMQUAD;trapopen|))
            (LETT |x|
                  (SPADCALL |start|
                            (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10)) |del|
                                      (QREFELT $ 32))
                            (QREFELT $ 13))
                  . #3#)
            (LETT |sum| (SPADCALL 0 0 10 (QREFELT $ 10)) . #3#)
            (SEQ (LETT |i| 1 . #3#) (LETT #2# |numpoints| . #3#) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (LETT |sum|
                        (SPADCALL |sum| (SPADCALL |x| |func|) (QREFELT $ 13))
                        . #3#)
                  (LETT |x| (SPADCALL |x| |ddel| (QREFELT $ 13)) . #3#)
                  (LETT |sum|
                        (SPADCALL |sum| (SPADCALL |x| |func|) (QREFELT $ 13))
                        . #3#)
                  (EXIT (LETT |x| (SPADCALL |x| |del| (QREFELT $ 13)) . #3#)))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN
              (LETT #1#
                    (SPADCALL
                     (SPADCALL |oldsum| (SPADCALL 3 0 10 (QREFELT $ 10))
                               (QREFELT $ 40))
                     (SPADCALL |sum| |del| (QREFELT $ 32)) (QREFELT $ 13))
                    . #3#)
              (GO #4=#:G856)))))
          #4# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |NumericalQuadrature;|)) 

(DEFUN |NumericalQuadrature| ()
  (SPROG NIL
         (PROG (#1=#:G860)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|NumericalQuadrature|)
                    . #2=(|NumericalQuadrature|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|NumericalQuadrature|
                             (LIST
                              (CONS NIL (CONS 1 (|NumericalQuadrature;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|NumericalQuadrature|)))))))))) 

(DEFUN |NumericalQuadrature;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|NumericalQuadrature|) . #1=(|NumericalQuadrature|))
          (LETT $ (GETREFV 53) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|NumericalQuadrature| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|NumericalQuadrature| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Float|) (0 . |Zero|) (|Integer|)
              (|PositiveInteger|) (4 . |float|) (11 . -) (17 . /) (23 . +)
              (|OutputForm|) (29 . |coerce|)
              (|Record| (|:| |value| 6) (|:| |error| 6) (|:| |totalpts| 8)
                        (|:| |success| 37))
              (|Mapping| 6 6) |NUMQUAD;romberg;M4F2IR;4| (34 . |One|)
              (|List| 14) (38 . |setelt!|) (|List| $) (45 . |blankSeparate|)
              (|Void|) (50 . |print|) (55 . |abs|) |NUMQUAD;aromberg;M4F3IR;1|
              |NUMQUAD;simpson;M4F2IR;5| |NUMQUAD;asimpson;M4F3IR;2|
              |NUMQUAD;trapezoidal;M4F2IR;6| |NUMQUAD;atrapezoidal;M4F3IR;3|
              (60 . *) (66 . |coerce|) (|String|) (|OutputPackage|)
              (71 . |output|) (|Boolean|) (77 . =) (83 . <) (89 . /)
              (|Vector| 6) (95 . |setelt!|) (|SingleInteger|) (102 . *)
              (108 . |elt|) (114 . >) (120 . *) (126 . |output|)
              (131 . |coerce|) |NUMQUAD;rombergo;M4F2IR;7|
              |NUMQUAD;simpsono;M4F2IR;8| |NUMQUAD;trapezoidalo;M4F2IR;9|)
           '#(|trapezoidalo| 136 |trapezoidal| 147 |simpsono| 158 |simpson| 169
              |rombergo| 180 |romberg| 191 |atrapezoidal| 202 |asimpson| 214
              |aromberg| 226)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 52
                                                 '(0 6 0 7 3 6 0 8 8 9 10 2 6 0
                                                   0 0 11 2 6 0 0 8 12 2 6 0 0
                                                   0 13 1 6 14 0 15 0 6 0 19 3
                                                   20 14 0 8 14 21 1 14 0 22 23
                                                   1 14 24 0 25 1 6 0 0 26 2 6
                                                   0 0 0 32 1 8 14 0 33 2 35 24
                                                   34 14 36 2 6 37 0 0 38 2 6
                                                   37 0 0 39 2 6 0 0 0 40 3 41
                                                   6 0 8 6 42 2 43 0 8 0 44 2
                                                   41 6 0 8 45 2 8 37 0 0 46 2
                                                   8 0 9 0 47 1 35 24 14 48 1
                                                   41 14 0 49 7 0 16 17 6 6 6 6
                                                   8 8 52 7 0 16 17 6 6 6 6 8 8
                                                   30 7 0 16 17 6 6 6 6 8 8 51
                                                   7 0 16 17 6 6 6 6 8 8 28 7 0
                                                   16 17 6 6 6 6 8 8 50 7 0 16
                                                   17 6 6 6 6 8 8 18 8 0 16 17
                                                   6 6 6 6 8 8 8 31 8 0 16 17 6
                                                   6 6 6 8 8 8 29 8 0 16 17 6 6
                                                   6 6 8 8 8 27)))))
           '|lookupComplete|)) 

(MAKEPROP '|NumericalQuadrature| 'NILADIC T) 
