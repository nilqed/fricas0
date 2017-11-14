
(SDEFUN |NUMQUAD;aromberg;M4F3IR;1|
        ((|func| |Mapping| F F) (|a| F) (|b| F) (|epsrel| F) (|epsabs| F)
         (|nmin| |Integer|) (|nmax| |Integer|) (|nint| |Integer|)
         ($ |Record| (|:| |value| F) (|:| |error| F)
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((|x2| (F)) (|x1| (F)) (|done| (|Boolean|)) (|pts| (|Integer|))
          (|err| (F)) (|sum| (F))
          (|ans|
           (|Record| (|:| |value| F) (|:| |error| F)
                     (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
          (#1=#:G730 NIL) (|i| NIL) (|io| (|List| (|OutputForm|))) (|hh| (F)))
         (SEQ
          (LETT |sum| (|spadConstant| $ 7) . #2=(|NUMQUAD;aromberg;M4F3IR;1|))
          (LETT |err| (|spadConstant| $ 7) . #2#) (LETT |pts| 1 . #2#)
          (LETT |done| 'T . #2#)
          (LETT |hh|
                (SPADCALL (SPADCALL |b| |a| (QREFELT $ 8)) |nint|
                          (QREFELT $ 10))
                . #2#)
          (LETT |x1| |a| . #2#)
          (LETT |x2| (SPADCALL |a| |hh| (QREFELT $ 11)) . #2#)
          (LETT |io|
                (LIST (SPADCALL |x1| (QREFELT $ 13))
                      (SPADCALL |x2| (QREFELT $ 13)))
                . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# |nint| . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |ans|
                      (SPADCALL |func| |x1| |x2| |epsrel| |epsabs| |nmin|
                                |nmax| (QREFELT $ 16))
                      . #2#)
                (COND
                 ((NULL (QVELT |ans| 3))
                  (SEQ
                   (SPADCALL |io| 1 (SPADCALL |x1| (QREFELT $ 13))
                             (QREFELT $ 19))
                   (SPADCALL |io| 2 (SPADCALL |x2| (QREFELT $ 13))
                             (QREFELT $ 19))
                   (EXIT
                    (SPADCALL
                     (SPADCALL
                      (CONS
                       (SPADCALL "accuracy not reached in interval"
                                 (QREFELT $ 21))
                       |io|)
                      (QREFELT $ 23))
                     (QREFELT $ 25))))))
                (LETT |sum| (SPADCALL |sum| (QVELT |ans| 0) (QREFELT $ 11))
                      . #2#)
                (LETT |err|
                      (SPADCALL |err| (SPADCALL (QVELT |ans| 1) (QREFELT $ 26))
                                (QREFELT $ 11))
                      . #2#)
                (LETT |pts| (- (+ |pts| (QVELT |ans| 2)) 1) . #2#)
                (LETT |done| (COND (|done| (QVELT |ans| 3)) ('T NIL)) . #2#)
                (LETT |x1| |x2| . #2#)
                (EXIT (LETT |x2| (SPADCALL |x2| |hh| (QREFELT $ 11)) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |sum| |err| |pts| |done|))))) 

(SDEFUN |NUMQUAD;asimpson;M4F3IR;2|
        ((|func| |Mapping| F F) (|a| F) (|b| F) (|epsrel| F) (|epsabs| F)
         (|nmin| |Integer|) (|nmax| |Integer|) (|nint| |Integer|)
         ($ |Record| (|:| |value| F) (|:| |error| F)
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((|x2| (F)) (|x1| (F)) (|done| (|Boolean|)) (|pts| (|Integer|))
          (|err| (F)) (|sum| (F))
          (|ans|
           (|Record| (|:| |value| F) (|:| |error| F)
                     (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
          (#1=#:G739 NIL) (|i| NIL) (|io| (|List| (|OutputForm|))) (|hh| (F)))
         (SEQ
          (LETT |sum| (|spadConstant| $ 7) . #2=(|NUMQUAD;asimpson;M4F3IR;2|))
          (LETT |err| (|spadConstant| $ 7) . #2#) (LETT |pts| 1 . #2#)
          (LETT |done| 'T . #2#)
          (LETT |hh|
                (SPADCALL (SPADCALL |b| |a| (QREFELT $ 8)) |nint|
                          (QREFELT $ 10))
                . #2#)
          (LETT |x1| |a| . #2#)
          (LETT |x2| (SPADCALL |a| |hh| (QREFELT $ 11)) . #2#)
          (LETT |io|
                (LIST (SPADCALL |x1| (QREFELT $ 13))
                      (SPADCALL |x2| (QREFELT $ 13)))
                . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# |nint| . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |ans|
                      (SPADCALL |func| |x1| |x2| |epsrel| |epsabs| |nmin|
                                |nmax| (QREFELT $ 28))
                      . #2#)
                (COND
                 ((NULL (QVELT |ans| 3))
                  (SEQ
                   (SPADCALL |io| 1 (SPADCALL |x1| (QREFELT $ 13))
                             (QREFELT $ 19))
                   (SPADCALL |io| 2 (SPADCALL |x2| (QREFELT $ 13))
                             (QREFELT $ 19))
                   (EXIT
                    (SPADCALL
                     (SPADCALL
                      (CONS
                       (SPADCALL "accuracy not reached in interval"
                                 (QREFELT $ 21))
                       |io|)
                      (QREFELT $ 23))
                     (QREFELT $ 25))))))
                (LETT |sum| (SPADCALL |sum| (QVELT |ans| 0) (QREFELT $ 11))
                      . #2#)
                (LETT |err|
                      (SPADCALL |err| (SPADCALL (QVELT |ans| 1) (QREFELT $ 26))
                                (QREFELT $ 11))
                      . #2#)
                (LETT |pts| (- (+ |pts| (QVELT |ans| 2)) 1) . #2#)
                (LETT |done| (COND (|done| (QVELT |ans| 3)) ('T NIL)) . #2#)
                (LETT |x1| |x2| . #2#)
                (EXIT (LETT |x2| (SPADCALL |x2| |hh| (QREFELT $ 11)) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |sum| |err| |pts| |done|))))) 

(SDEFUN |NUMQUAD;atrapezoidal;M4F3IR;3|
        ((|func| |Mapping| F F) (|a| F) (|b| F) (|epsrel| F) (|epsabs| F)
         (|nmin| |Integer|) (|nmax| |Integer|) (|nint| |Integer|)
         ($ |Record| (|:| |value| F) (|:| |error| F)
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((|x2| (F)) (|x1| (F)) (|done| (|Boolean|)) (|pts| (|Integer|))
          (|err| (F)) (|sum| (F))
          (|ans|
           (|Record| (|:| |value| F) (|:| |error| F)
                     (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
          (#1=#:G748 NIL) (|i| NIL) (|io| (|List| (|OutputForm|))) (|hh| (F)))
         (SEQ
          (LETT |sum| (|spadConstant| $ 7)
                . #2=(|NUMQUAD;atrapezoidal;M4F3IR;3|))
          (LETT |err| (|spadConstant| $ 7) . #2#) (LETT |pts| 1 . #2#)
          (LETT |done| 'T . #2#)
          (LETT |hh|
                (SPADCALL (SPADCALL |b| |a| (QREFELT $ 8)) |nint|
                          (QREFELT $ 10))
                . #2#)
          (LETT |x1| |a| . #2#)
          (LETT |x2| (SPADCALL |a| |hh| (QREFELT $ 11)) . #2#)
          (LETT |io|
                (LIST (SPADCALL |x1| (QREFELT $ 13))
                      (SPADCALL |x2| (QREFELT $ 13)))
                . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# |nint| . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |ans|
                      (SPADCALL |func| |x1| |x2| |epsrel| |epsabs| |nmin|
                                |nmax| (QREFELT $ 30))
                      . #2#)
                (COND
                 ((NULL (QVELT |ans| 3))
                  (SEQ
                   (SPADCALL |io| 1 (SPADCALL |x1| (QREFELT $ 13))
                             (QREFELT $ 19))
                   (SPADCALL |io| 2 (SPADCALL |x2| (QREFELT $ 13))
                             (QREFELT $ 19))
                   (EXIT
                    (SPADCALL
                     (SPADCALL
                      (CONS
                       (SPADCALL "accuracy not reached in interval"
                                 (QREFELT $ 21))
                       |io|)
                      (QREFELT $ 23))
                     (QREFELT $ 25))))))
                (LETT |sum| (SPADCALL |sum| (QVELT |ans| 0) (QREFELT $ 11))
                      . #2#)
                (LETT |err|
                      (SPADCALL |err| (SPADCALL (QVELT |ans| 1) (QREFELT $ 26))
                                (QREFELT $ 11))
                      . #2#)
                (LETT |pts| (- (+ |pts| (QVELT |ans| 2)) 1) . #2#)
                (LETT |done| (COND (|done| (QVELT |ans| 3)) ('T NIL)) . #2#)
                (LETT |x1| |x2| . #2#)
                (EXIT (LETT |x2| (SPADCALL |x2| |hh| (QREFELT $ 11)) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |sum| |err| |pts| |done|))))) 

(SDEFUN |NUMQUAD;romberg;M4F2IR;4|
        ((|func| |Mapping| F F) (|a| F) (|b| F) (|epsrel| F) (|epsabs| F)
         (|nmin| |Integer|) (|nmax| |Integer|)
         ($ |Record| (|:| |value| F) (|:| |error| F)
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((|qx1| (F)) (|pts| (|Integer|)) (|delta| (F)) (|oldest| (F))
          (|oldsum| (F)) (#1=#:G768 NIL) (|change| (F))
          (|four| (|PositiveInteger|)) (|i| (|Integer|)) (#2=#:G770 NIL)
          (|j| NIL) (|newest| (F)) (|newsum| (F)) (#3=#:G769 NIL) (|n| NIL)
          (|table| (|Vector| F)) (#4=#:G750 NIL) (|length| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |length| (SPADCALL |b| |a| (QREFELT $ 8))
                  . #5=(|NUMQUAD;romberg;M4F2IR;4|))
            (LETT |delta| |length| . #5#)
            (LETT |newsum|
                  (SPADCALL
                   (SPADCALL |length|
                             (SPADCALL (SPADCALL |a| |func|)
                                       (SPADCALL |b| |func|) (QREFELT $ 11))
                             (QREFELT $ 32))
                   2 (QREFELT $ 10))
                  . #5#)
            (LETT |newest| (|spadConstant| $ 7) . #5#)
            (LETT |oldsum| (|spadConstant| $ 7) . #5#)
            (LETT |oldest| (|spadConstant| $ 7) . #5#)
            (LETT |change| (|spadConstant| $ 7) . #5#)
            (LETT |qx1| |newsum| . #5#)
            (LETT |table|
                  (MAKEARR1
                   (PROG1 (LETT #4# (+ |nmax| 1) . #5#)
                     (|check_subtype2| (> #4# 0) '(|PositiveInteger|)
                                       '(|Integer|) #4#))
                   (|spadConstant| $ 7))
                  . #5#)
            (LETT |pts| 1 . #5#)
            (COND
             ((< |nmin| 2)
              (SEQ
               (SPADCALL "romberg: nmin to small (nmin > 1) nmin = "
                         (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 35))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7) 0 NIL)
                       . #5#)
                 (GO #6=#:G767))))))
            (COND
             ((< |nmax| |nmin|)
              (SEQ
               (SPADCALL "romberg: nmax < nmin : nmax = "
                         (SPADCALL |nmax| (QREFELT $ 33)) (QREFELT $ 35))
               (SPADCALL "                       nmin = "
                         (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 35))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7) 0 NIL)
                       . #5#)
                 (GO #6#))))))
            (COND
             ((SPADCALL |a| |b| (QREFELT $ 37))
              (SEQ
               (SPADCALL "romberg: integration limits are equal  = "
                         (SPADCALL |a| (QREFELT $ 13)) (QREFELT $ 35))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7) 1 'T)
                       . #5#)
                 (GO #6#))))))
            (COND
             ((SPADCALL |epsrel| (|spadConstant| $ 7) (QREFELT $ 38))
              (SEQ
               (SPADCALL "romberg: eps_r < 0.0            eps_r  = "
                         (SPADCALL |epsrel| (QREFELT $ 13)) (QREFELT $ 35))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7) 0 NIL)
                       . #5#)
                 (GO #6#))))))
            (COND
             ((SPADCALL |epsabs| (|spadConstant| $ 7) (QREFELT $ 38))
              (SEQ
               (SPADCALL "romberg: eps_a < 0.0            eps_a  = "
                         (SPADCALL |epsabs| (QREFELT $ 13)) (QREFELT $ 35))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7) 0 NIL)
                       . #5#)
                 (GO #6#))))))
            (SEQ (LETT |n| 1 . #5#) (LETT #3# |nmax| . #5#) G190
                 (COND ((|greater_SI| |n| #3#) (GO G191)))
                 (SEQ (LETT |oldsum| |newsum| . #5#)
                      (LETT |newsum|
                            (|NUMQUAD;trapclosed| |func| |a| |delta| |oldsum|
                             |pts| $)
                            . #5#)
                      (LETT |newest|
                            (SPADCALL
                             (SPADCALL (SPADCALL 4 |newsum| (QREFELT $ 40))
                                       |oldsum| (QREFELT $ 8))
                             3 (QREFELT $ 10))
                            . #5#)
                      (LETT |four| 4 . #5#)
                      (SPADCALL |table| |n| |newest| (QREFELT $ 42))
                      (SEQ (LETT |j| 2 . #5#) (LETT #2# |n| . #5#) G190
                           (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ (LETT |i| (- (+ |n| 1) |j|) . #5#)
                                (LETT |four| (* |four| 4) . #5#)
                                (EXIT
                                 (SPADCALL |table| |i|
                                           (SPADCALL
                                            (SPADCALL |table| (+ |i| 1)
                                                      (QREFELT $ 43))
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |table| (+ |i| 1)
                                                        (QREFELT $ 43))
                                              (SPADCALL |table| |i|
                                                        (QREFELT $ 43))
                                              (QREFELT $ 8))
                                             (- |four| 1) (QREFELT $ 10))
                                            (QREFELT $ 11))
                                           (QREFELT $ 42))))
                           (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                           (EXIT NIL))
                      (COND
                       ((SPADCALL |n| |nmin| (QREFELT $ 44))
                        (SEQ
                         (LETT |change|
                               (SPADCALL
                                (SPADCALL (SPADCALL |table| 1 (QREFELT $ 43))
                                          |qx1| (QREFELT $ 8))
                                (QREFELT $ 26))
                               . #5#)
                         (EXIT
                          (COND
                           ((OR
                             (SPADCALL |change|
                                       (SPADCALL
                                        (SPADCALL |epsrel| |qx1|
                                                  (QREFELT $ 32))
                                        (QREFELT $ 26))
                                       (QREFELT $ 38))
                             (SPADCALL |change| |epsabs| (QREFELT $ 38)))
                            (PROGN
                             (LETT #1#
                                   (VECTOR (SPADCALL |table| 1 (QREFELT $ 43))
                                           |change|
                                           (+ (SPADCALL 2 |pts| (QREFELT $ 45))
                                              1)
                                           'T)
                                   . #5#)
                             (GO #6#))))))))
                      (LETT |oldsum| |newsum| . #5#)
                      (LETT |oldest| |newest| . #5#)
                      (LETT |delta| (SPADCALL |delta| 2 (QREFELT $ 10)) . #5#)
                      (LETT |pts| (SPADCALL 2 |pts| (QREFELT $ 45)) . #5#)
                      (EXIT
                       (LETT |qx1| (SPADCALL |table| 1 (QREFELT $ 43)) . #5#)))
                 (LETT |n| (|inc_SI| |n|) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (VECTOR (SPADCALL |table| 1 (QREFELT $ 43))
                     (SPADCALL (SPADCALL 5 4 (QREFELT $ 47)) |change|
                               (QREFELT $ 48))
                     (+ |pts| 1) NIL))))
          #6# (EXIT #1#)))) 

(SDEFUN |NUMQUAD;simpson;M4F2IR;5|
        ((|func| |Mapping| F F) (|a| F) (|b| F) (|epsrel| F) (|epsabs| F)
         (|nmin| |Integer|) (|nmax| |Integer|)
         ($ |Record| (|:| |value| F) (|:| |error| F)
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((|pts| (|Integer|)) (|delta| (F)) (|oldest| (F)) (|oldsum| (F))
          (#1=#:G783 NIL) (|change| (F)) (|newest| (F)) (|newsum| (F))
          (#2=#:G784 NIL) (|n| NIL) (|length| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |length| (SPADCALL |b| |a| (QREFELT $ 8))
                  . #3=(|NUMQUAD;simpson;M4F2IR;5|))
            (LETT |delta| |length| . #3#)
            (LETT |newsum|
                  (SPADCALL
                   (SPADCALL |length|
                             (SPADCALL (SPADCALL |a| |func|)
                                       (SPADCALL |b| |func|) (QREFELT $ 11))
                             (QREFELT $ 32))
                   2 (QREFELT $ 10))
                  . #3#)
            (LETT |newest| (|spadConstant| $ 7) . #3#)
            (LETT |oldsum| (|spadConstant| $ 7) . #3#)
            (LETT |oldest| (|spadConstant| $ 7) . #3#)
            (LETT |change| (|spadConstant| $ 7) . #3#) (LETT |pts| 1 . #3#)
            (COND
             ((< |nmin| 2)
              (SEQ
               (SPADCALL "simpson: nmin to small (nmin > 1) nmin = "
                         (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 35))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7) 0 NIL)
                       . #3#)
                 (GO #4=#:G782))))))
            (COND
             ((< |nmax| |nmin|)
              (SEQ
               (SPADCALL "simpson: nmax < nmin : nmax = "
                         (SPADCALL |nmax| (QREFELT $ 33)) (QREFELT $ 35))
               (SPADCALL "                       nmin = "
                         (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 35))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7) 0 NIL)
                       . #3#)
                 (GO #4#))))))
            (COND
             ((SPADCALL |a| |b| (QREFELT $ 37))
              (SEQ
               (SPADCALL "simpson: integration limits are equal  = "
                         (SPADCALL |a| (QREFELT $ 13)) (QREFELT $ 35))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7) 1 'T)
                       . #3#)
                 (GO #4#))))))
            (COND
             ((SPADCALL |epsrel| (|spadConstant| $ 7) (QREFELT $ 38))
              (SEQ
               (SPADCALL "simpson: eps_r < 0.0 : eps_r = "
                         (SPADCALL |epsrel| (QREFELT $ 13)) (QREFELT $ 35))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7) 0 NIL)
                       . #3#)
                 (GO #4#))))))
            (COND
             ((SPADCALL |epsabs| (|spadConstant| $ 7) (QREFELT $ 38))
              (SEQ
               (SPADCALL "simpson: eps_a < 0.0 : eps_a = "
                         (SPADCALL |epsabs| (QREFELT $ 13)) (QREFELT $ 35))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7) 0 NIL)
                       . #3#)
                 (GO #4#))))))
            (SEQ (LETT |n| 1 . #3#) (LETT #2# |nmax| . #3#) G190
                 (COND ((|greater_SI| |n| #2#) (GO G191)))
                 (SEQ (LETT |oldsum| |newsum| . #3#)
                      (LETT |newsum|
                            (|NUMQUAD;trapclosed| |func| |a| |delta| |oldsum|
                             |pts| $)
                            . #3#)
                      (LETT |newest|
                            (SPADCALL
                             (SPADCALL (SPADCALL 4 |newsum| (QREFELT $ 40))
                                       |oldsum| (QREFELT $ 8))
                             3 (QREFELT $ 10))
                            . #3#)
                      (COND
                       ((SPADCALL |n| |nmin| (QREFELT $ 44))
                        (SEQ
                         (LETT |change|
                               (SPADCALL
                                (SPADCALL |newest| |oldest| (QREFELT $ 8))
                                (QREFELT $ 26))
                               . #3#)
                         (EXIT
                          (COND
                           ((OR
                             (SPADCALL |change|
                                       (SPADCALL
                                        (SPADCALL |epsrel| |oldest|
                                                  (QREFELT $ 32))
                                        (QREFELT $ 26))
                                       (QREFELT $ 38))
                             (SPADCALL |change| |epsabs| (QREFELT $ 38)))
                            (PROGN
                             (LETT #1#
                                   (VECTOR |newest|
                                           (SPADCALL
                                            (SPADCALL 5 4 (QREFELT $ 47))
                                            |change| (QREFELT $ 48))
                                           (+ (SPADCALL 2 |pts| (QREFELT $ 45))
                                              1)
                                           'T)
                                   . #3#)
                             (GO #4#))))))))
                      (LETT |oldsum| |newsum| . #3#)
                      (LETT |oldest| |newest| . #3#)
                      (LETT |delta| (SPADCALL |delta| 2 (QREFELT $ 10)) . #3#)
                      (EXIT
                       (LETT |pts| (SPADCALL 2 |pts| (QREFELT $ 45)) . #3#)))
                 (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (VECTOR |newest|
                     (SPADCALL (SPADCALL 5 4 (QREFELT $ 47)) |change|
                               (QREFELT $ 48))
                     (+ |pts| 1) NIL))))
          #4# (EXIT #1#)))) 

(SDEFUN |NUMQUAD;trapezoidal;M4F2IR;6|
        ((|func| |Mapping| F F) (|a| F) (|b| F) (|epsrel| F) (|epsabs| F)
         (|nmin| |Integer|) (|nmax| |Integer|)
         ($ |Record| (|:| |value| F) (|:| |error| F)
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((|pts| (|Integer|)) (|delta| (F)) (#1=#:G797 NIL) (|change| (F))
          (|newsum| (F)) (|oldsum| (F)) (#2=#:G798 NIL) (|n| NIL)
          (|length| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |length| (SPADCALL |b| |a| (QREFELT $ 8))
                  . #3=(|NUMQUAD;trapezoidal;M4F2IR;6|))
            (LETT |delta| |length| . #3#)
            (LETT |newsum|
                  (SPADCALL
                   (SPADCALL |length|
                             (SPADCALL (SPADCALL |a| |func|)
                                       (SPADCALL |b| |func|) (QREFELT $ 11))
                             (QREFELT $ 32))
                   2 (QREFELT $ 10))
                  . #3#)
            (LETT |change| (|spadConstant| $ 7) . #3#) (LETT |pts| 1 . #3#)
            (COND
             ((< |nmin| 2)
              (SEQ
               (SPADCALL "trapezoidal: nmin to small (nmin > 1) nmin = "
                         (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 35))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7) 0 NIL)
                       . #3#)
                 (GO #4=#:G796))))))
            (COND
             ((< |nmax| |nmin|)
              (SEQ
               (SPADCALL "trapezoidal: nmax < nmin : nmax = "
                         (SPADCALL |nmax| (QREFELT $ 33)) (QREFELT $ 35))
               (SPADCALL "                           nmin = "
                         (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 35))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7) 0 NIL)
                       . #3#)
                 (GO #4#))))))
            (COND
             ((SPADCALL |a| |b| (QREFELT $ 37))
              (SEQ
               (SPADCALL "trapezoidal: integration limits are equal  = "
                         (SPADCALL |a| (QREFELT $ 13)) (QREFELT $ 35))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7) 1 'T)
                       . #3#)
                 (GO #4#))))))
            (COND
             ((SPADCALL |epsrel| (|spadConstant| $ 7) (QREFELT $ 38))
              (SEQ
               (SPADCALL "trapezoidal: eps_r < 0.0 : eps_r = "
                         (SPADCALL |epsrel| (QREFELT $ 13)) (QREFELT $ 35))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7) 0 NIL)
                       . #3#)
                 (GO #4#))))))
            (COND
             ((SPADCALL |epsabs| (|spadConstant| $ 7) (QREFELT $ 38))
              (SEQ
               (SPADCALL "trapezoidal: eps_a < 0.0 : eps_a = "
                         (SPADCALL |epsabs| (QREFELT $ 13)) (QREFELT $ 35))
               (EXIT
                (PROGN
                 (LETT #1#
                       (VECTOR (|spadConstant| $ 7) (|spadConstant| $ 7) 0 NIL)
                       . #3#)
                 (GO #4#))))))
            (SEQ (LETT |n| 1 . #3#) (LETT #2# |nmax| . #3#) G190
                 (COND ((|greater_SI| |n| #2#) (GO G191)))
                 (SEQ (LETT |oldsum| |newsum| . #3#)
                      (LETT |newsum|
                            (|NUMQUAD;trapclosed| |func| |a| |delta| |oldsum|
                             |pts| $)
                            . #3#)
                      (COND
                       ((SPADCALL |n| |nmin| (QREFELT $ 44))
                        (SEQ
                         (LETT |change|
                               (SPADCALL
                                (SPADCALL |newsum| |oldsum| (QREFELT $ 8))
                                (QREFELT $ 26))
                               . #3#)
                         (EXIT
                          (COND
                           ((OR
                             (SPADCALL |change|
                                       (SPADCALL
                                        (SPADCALL |epsrel| |oldsum|
                                                  (QREFELT $ 32))
                                        (QREFELT $ 26))
                                       (QREFELT $ 38))
                             (SPADCALL |change| |epsabs| (QREFELT $ 38)))
                            (PROGN
                             (LETT #1#
                                   (VECTOR |newsum|
                                           (SPADCALL
                                            (SPADCALL 5 4 (QREFELT $ 47))
                                            |change| (QREFELT $ 48))
                                           (+ (SPADCALL 2 |pts| (QREFELT $ 45))
                                              1)
                                           'T)
                                   . #3#)
                             (GO #4#))))))))
                      (LETT |delta| (SPADCALL |delta| 2 (QREFELT $ 10)) . #3#)
                      (EXIT
                       (LETT |pts| (SPADCALL 2 |pts| (QREFELT $ 45)) . #3#)))
                 (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (VECTOR |newsum|
                     (SPADCALL (SPADCALL 5 4 (QREFELT $ 47)) |change|
                               (QREFELT $ 48))
                     (+ |pts| 1) NIL))))
          #4# (EXIT #1#)))) 

(SDEFUN |NUMQUAD;rombergo;M4F2IR;7|
        ((|func| |Mapping| F F) (|a| F) (|b| F) (|epsrel| F) (|epsabs| F)
         (|nmin| |Integer|) (|nmax| |Integer|)
         ($ |Record| (|:| |value| F) (|:| |error| F)
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((|qx1| (F)) (|pts| (|Integer|)) (|delta| (F)) (|oldest| (F))
          (|oldsum| (F)) (#1=#:G809 NIL) (|change| (F))
          (|nine| (|PositiveInteger|)) (|i| (|Integer|)) (#2=#:G811 NIL)
          (|j| NIL) (|newest| (F)) (|newsum| (F)) (#3=#:G810 NIL) (|n| NIL)
          (|table| (|Vector| F)) (#4=#:G800 NIL) (|length| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |length| (SPADCALL |b| |a| (QREFELT $ 8))
                  . #5=(|NUMQUAD;rombergo;M4F2IR;7|))
            (LETT |delta| (SPADCALL |length| 3 (QREFELT $ 10)) . #5#)
            (LETT |newsum|
                  (SPADCALL |length|
                            (SPADCALL
                             (SPADCALL (SPADCALL |a| |b| (QREFELT $ 11)) 2
                                       (QREFELT $ 10))
                             |func|)
                            (QREFELT $ 32))
                  . #5#)
            (LETT |newest| (|spadConstant| $ 7) . #5#)
            (LETT |oldsum| (|spadConstant| $ 7) . #5#)
            (LETT |oldest| (|spadConstant| $ 7) . #5#)
            (LETT |change| (|spadConstant| $ 7) . #5#)
            (LETT |qx1| |newsum| . #5#)
            (LETT |table|
                  (MAKEARR1
                   (PROG1 (LETT #4# (+ |nmax| 1) . #5#)
                     (|check_subtype2| (> #4# 0) '(|PositiveInteger|)
                                       '(|Integer|) #4#))
                   (|spadConstant| $ 7))
                  . #5#)
            (LETT |pts| 1 . #5#)
            (SEQ (LETT |n| 1 . #5#) (LETT #3# |nmax| . #5#) G190
                 (COND ((|greater_SI| |n| #3#) (GO G191)))
                 (SEQ (LETT |oldsum| |newsum| . #5#)
                      (LETT |newsum|
                            (|NUMQUAD;trapopen| |func| |a| |delta| |oldsum|
                             |pts| $)
                            . #5#)
                      (LETT |newest|
                            (SPADCALL
                             (SPADCALL (SPADCALL 9 |newsum| (QREFELT $ 40))
                                       |oldsum| (QREFELT $ 8))
                             8 (QREFELT $ 10))
                            . #5#)
                      (SPADCALL |table| |n| |newest| (QREFELT $ 42))
                      (LETT |nine| 9 . #5#)
                      (SPADCALL (SPADCALL |newest| (QREFELT $ 13))
                                (QREFELT $ 49))
                      (SEQ (LETT |j| 2 . #5#) (LETT #2# |n| . #5#) G190
                           (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ (LETT |i| (- (+ |n| 1) |j|) . #5#)
                                (LETT |nine| (* |nine| 9) . #5#)
                                (EXIT
                                 (SPADCALL |table| |i|
                                           (SPADCALL
                                            (SPADCALL |table| (+ |i| 1)
                                                      (QREFELT $ 43))
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |table| (+ |i| 1)
                                                        (QREFELT $ 43))
                                              (SPADCALL |table| |i|
                                                        (QREFELT $ 43))
                                              (QREFELT $ 8))
                                             (- |nine| 1) (QREFELT $ 10))
                                            (QREFELT $ 11))
                                           (QREFELT $ 42))))
                           (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                           (EXIT NIL))
                      (COND
                       ((SPADCALL |n| |nmin| (QREFELT $ 44))
                        (SEQ
                         (LETT |change|
                               (SPADCALL
                                (SPADCALL (SPADCALL |table| 1 (QREFELT $ 43))
                                          |qx1| (QREFELT $ 8))
                                (QREFELT $ 26))
                               . #5#)
                         (EXIT
                          (COND
                           ((OR
                             (SPADCALL |change|
                                       (SPADCALL
                                        (SPADCALL |epsrel| |qx1|
                                                  (QREFELT $ 32))
                                        (QREFELT $ 26))
                                       (QREFELT $ 38))
                             (SPADCALL |change| |epsabs| (QREFELT $ 38)))
                            (PROGN
                             (LETT #1#
                                   (VECTOR (SPADCALL |table| 1 (QREFELT $ 43))
                                           (SPADCALL
                                            (SPADCALL 3 2 (QREFELT $ 47))
                                            |change| (QREFELT $ 48))
                                           (SPADCALL 3 |pts| (QREFELT $ 45))
                                           'T)
                                   . #5#)
                             (GO #6=#:G808))))))))
                      (SPADCALL (SPADCALL |table| (QREFELT $ 50))
                                (QREFELT $ 49))
                      (LETT |oldsum| |newsum| . #5#)
                      (LETT |oldest| |newest| . #5#)
                      (LETT |delta| (SPADCALL |delta| 3 (QREFELT $ 10)) . #5#)
                      (LETT |pts| (SPADCALL 3 |pts| (QREFELT $ 45)) . #5#)
                      (EXIT
                       (LETT |qx1| (SPADCALL |table| 1 (QREFELT $ 43)) . #5#)))
                 (LETT |n| (|inc_SI| |n|) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (VECTOR (SPADCALL |table| 1 (QREFELT $ 43))
                     (SPADCALL (SPADCALL 3 2 (QREFELT $ 47)) |change|
                               (QREFELT $ 48))
                     |pts| NIL))))
          #6# (EXIT #1#)))) 

(SDEFUN |NUMQUAD;simpsono;M4F2IR;8|
        ((|func| |Mapping| F F) (|a| F) (|b| F) (|epsrel| F) (|epsabs| F)
         (|nmin| |Integer|) (|nmax| |Integer|)
         ($ |Record| (|:| |value| F) (|:| |error| F)
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((|pts| (|Integer|)) (|delta| (F)) (|oldest| (F)) (|oldsum| (F))
          (#1=#:G819 NIL) (|change| (F)) (|newest| (F)) (|newsum| (F))
          (#2=#:G820 NIL) (|n| NIL) (|length| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |length| (SPADCALL |b| |a| (QREFELT $ 8))
                  . #3=(|NUMQUAD;simpsono;M4F2IR;8|))
            (LETT |delta| (SPADCALL |length| 3 (QREFELT $ 10)) . #3#)
            (LETT |newsum|
                  (SPADCALL |length|
                            (SPADCALL
                             (SPADCALL (SPADCALL |a| |b| (QREFELT $ 11)) 2
                                       (QREFELT $ 10))
                             |func|)
                            (QREFELT $ 32))
                  . #3#)
            (LETT |newest| (|spadConstant| $ 7) . #3#)
            (LETT |oldsum| (|spadConstant| $ 7) . #3#)
            (LETT |oldest| (|spadConstant| $ 7) . #3#)
            (LETT |change| (|spadConstant| $ 7) . #3#) (LETT |pts| 1 . #3#)
            (SEQ (LETT |n| 1 . #3#) (LETT #2# |nmax| . #3#) G190
                 (COND ((|greater_SI| |n| #2#) (GO G191)))
                 (SEQ (LETT |oldsum| |newsum| . #3#)
                      (LETT |newsum|
                            (|NUMQUAD;trapopen| |func| |a| |delta| |oldsum|
                             |pts| $)
                            . #3#)
                      (LETT |newest|
                            (SPADCALL
                             (SPADCALL (SPADCALL 9 |newsum| (QREFELT $ 40))
                                       |oldsum| (QREFELT $ 8))
                             8 (QREFELT $ 10))
                            . #3#)
                      (SPADCALL (SPADCALL |newest| (QREFELT $ 13))
                                (QREFELT $ 49))
                      (COND
                       ((SPADCALL |n| |nmin| (QREFELT $ 44))
                        (SEQ
                         (LETT |change|
                               (SPADCALL
                                (SPADCALL |newest| |oldest| (QREFELT $ 8))
                                (QREFELT $ 26))
                               . #3#)
                         (EXIT
                          (COND
                           ((OR
                             (SPADCALL |change|
                                       (SPADCALL
                                        (SPADCALL |epsrel| |oldest|
                                                  (QREFELT $ 32))
                                        (QREFELT $ 26))
                                       (QREFELT $ 38))
                             (SPADCALL |change| |epsabs| (QREFELT $ 38)))
                            (PROGN
                             (LETT #1#
                                   (VECTOR |newest|
                                           (SPADCALL
                                            (SPADCALL 3 2 (QREFELT $ 47))
                                            |change| (QREFELT $ 48))
                                           (SPADCALL 3 |pts| (QREFELT $ 45))
                                           'T)
                                   . #3#)
                             (GO #4=#:G818))))))))
                      (LETT |oldsum| |newsum| . #3#)
                      (LETT |oldest| |newest| . #3#)
                      (LETT |delta| (SPADCALL |delta| 3 (QREFELT $ 10)) . #3#)
                      (EXIT
                       (LETT |pts| (SPADCALL 3 |pts| (QREFELT $ 45)) . #3#)))
                 (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (VECTOR |newest|
                     (SPADCALL (SPADCALL 3 2 (QREFELT $ 47)) |change|
                               (QREFELT $ 48))
                     |pts| NIL))))
          #4# (EXIT #1#)))) 

(SDEFUN |NUMQUAD;trapezoidalo;M4F2IR;9|
        ((|func| |Mapping| F F) (|a| F) (|b| F) (|epsrel| F) (|epsabs| F)
         (|nmin| |Integer|) (|nmax| |Integer|)
         ($ |Record| (|:| |value| F) (|:| |error| F)
          (|:| |totalpts| (|Integer|)) (|:| |success| (|Boolean|))))
        (SPROG
         ((|pts| (|Integer|)) (|delta| (F)) (#1=#:G828 NIL) (|change| (F))
          (|newsum| (F)) (|oldsum| (F)) (#2=#:G829 NIL) (|n| NIL)
          (|length| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |length| (SPADCALL |b| |a| (QREFELT $ 8))
                  . #3=(|NUMQUAD;trapezoidalo;M4F2IR;9|))
            (LETT |delta| (SPADCALL |length| 3 (QREFELT $ 10)) . #3#)
            (LETT |newsum|
                  (SPADCALL |length|
                            (SPADCALL
                             (SPADCALL (SPADCALL |a| |b| (QREFELT $ 11)) 2
                                       (QREFELT $ 10))
                             |func|)
                            (QREFELT $ 32))
                  . #3#)
            (LETT |change| (|spadConstant| $ 7) . #3#) (LETT |pts| 1 . #3#)
            (SEQ (LETT |n| 1 . #3#) (LETT #2# |nmax| . #3#) G190
                 (COND ((|greater_SI| |n| #2#) (GO G191)))
                 (SEQ (LETT |oldsum| |newsum| . #3#)
                      (LETT |newsum|
                            (|NUMQUAD;trapopen| |func| |a| |delta| |oldsum|
                             |pts| $)
                            . #3#)
                      (SPADCALL (SPADCALL |newsum| (QREFELT $ 13))
                                (QREFELT $ 49))
                      (COND
                       ((SPADCALL |n| |nmin| (QREFELT $ 44))
                        (SEQ
                         (LETT |change|
                               (SPADCALL
                                (SPADCALL |newsum| |oldsum| (QREFELT $ 8))
                                (QREFELT $ 26))
                               . #3#)
                         (EXIT
                          (COND
                           ((OR
                             (SPADCALL |change|
                                       (SPADCALL
                                        (SPADCALL |epsrel| |oldsum|
                                                  (QREFELT $ 32))
                                        (QREFELT $ 26))
                                       (QREFELT $ 38))
                             (SPADCALL |change| |epsabs| (QREFELT $ 38)))
                            (PROGN
                             (LETT #1#
                                   (VECTOR |newsum|
                                           (SPADCALL
                                            (SPADCALL 3 2 (QREFELT $ 47))
                                            |change| (QREFELT $ 48))
                                           (SPADCALL 3 |pts| (QREFELT $ 45))
                                           'T)
                                   . #3#)
                             (GO #4=#:G827))))))))
                      (LETT |delta| (SPADCALL |delta| 3 (QREFELT $ 10)) . #3#)
                      (EXIT
                       (LETT |pts| (SPADCALL 3 |pts| (QREFELT $ 45)) . #3#)))
                 (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (VECTOR |newsum|
                     (SPADCALL (SPADCALL 3 2 (QREFELT $ 47)) |change|
                               (QREFELT $ 48))
                     |pts| NIL))))
          #4# (EXIT #1#)))) 

(SDEFUN |NUMQUAD;trapclosed|
        ((|func| |Mapping| F F) (|start| F) (|h| F) (|oldsum| F)
         (|numpoints| |Integer|) ($ F))
        (SPROG ((|x| (F)) (|sum| (F)) (#1=#:G834 NIL) (|i| NIL))
               (SEQ
                (LETT |x|
                      (SPADCALL |start| (SPADCALL |h| 2 (QREFELT $ 10))
                                (QREFELT $ 11))
                      . #2=(|NUMQUAD;trapclosed|))
                (LETT |sum| (|spadConstant| $ 7) . #2#)
                (SEQ (LETT |i| 1 . #2#) (LETT #1# |numpoints| . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (LETT |sum|
                            (SPADCALL |sum| (SPADCALL |x| |func|)
                                      (QREFELT $ 11))
                            . #2#)
                      (EXIT
                       (LETT |x| (SPADCALL |x| |h| (QREFELT $ 11)) . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL
                  (SPADCALL |oldsum| (SPADCALL |sum| |h| (QREFELT $ 32))
                            (QREFELT $ 11))
                  2 (QREFELT $ 10)))))) 

(SDEFUN |NUMQUAD;trapopen|
        ((|func| |Mapping| F F) (|start| F) (|del| F) (|oldsum| F)
         (|numpoints| |Integer|) ($ F))
        (SPROG ((|x| (F)) (|sum| (F)) (#1=#:G839 NIL) (|i| NIL) (|ddel| (F)))
               (SEQ
                (LETT |ddel| (SPADCALL 2 |del| (QREFELT $ 40))
                      . #2=(|NUMQUAD;trapopen|))
                (LETT |x|
                      (SPADCALL |start| (SPADCALL |del| 2 (QREFELT $ 10))
                                (QREFELT $ 11))
                      . #2#)
                (LETT |sum| (|spadConstant| $ 7) . #2#)
                (SEQ (LETT |i| 1 . #2#) (LETT #1# |numpoints| . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (LETT |sum|
                            (SPADCALL |sum| (SPADCALL |x| |func|)
                                      (QREFELT $ 11))
                            . #2#)
                      (LETT |x| (SPADCALL |x| |ddel| (QREFELT $ 11)) . #2#)
                      (LETT |sum|
                            (SPADCALL |sum| (SPADCALL |x| |func|)
                                      (QREFELT $ 11))
                            . #2#)
                      (EXIT
                       (LETT |x| (SPADCALL |x| |del| (QREFELT $ 11)) . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL (SPADCALL |oldsum| 3 (QREFELT $ 10))
                           (SPADCALL |sum| |del| (QREFELT $ 32))
                           (QREFELT $ 11)))))) 

(DECLAIM (NOTINLINE |NumericalQuadrature;|)) 

(DEFUN |NumericalQuadrature| (#1=#:G840)
  (SPROG NIL
         (PROG (#2=#:G841)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|NumericalQuadrature|)
                                               '|domainEqualList|)
                    . #3=(|NumericalQuadrature|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|NumericalQuadrature;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|NumericalQuadrature|)))))))))) 

(DEFUN |NumericalQuadrature;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|NumericalQuadrature|))
          (LETT |dv$| (LIST '|NumericalQuadrature| DV$1) . #1#)
          (LETT $ (GETREFV 54) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|NumericalQuadrature| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|NumericalQuadrature| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|) (4 . -)
              (|Integer|) (10 . /) (16 . +) (|OutputForm|) (22 . |coerce|)
              (|Record| (|:| |value| 6) (|:| |error| 6) (|:| |totalpts| 9)
                        (|:| |success| 36))
              (|Mapping| 6 6) |NUMQUAD;romberg;M4F2IR;4| (27 . |One|)
              (|List| 12) (31 . |setelt!|) (|String|) (38 . |message|)
              (|List| $) (43 . |blankSeparate|) (|Void|) (48 . |print|)
              (53 . |abs|) |NUMQUAD;aromberg;M4F3IR;1|
              |NUMQUAD;simpson;M4F2IR;5| |NUMQUAD;asimpson;M4F3IR;2|
              |NUMQUAD;trapezoidal;M4F2IR;6| |NUMQUAD;atrapezoidal;M4F3IR;3|
              (58 . *) (64 . |coerce|) (|OutputPackage|) (69 . |output|)
              (|Boolean|) (75 . =) (81 . <) (|PositiveInteger|) (87 . *)
              (|Vector| 6) (93 . |setelt!|) (100 . |elt|) (106 . >) (112 . *)
              (|Fraction| 9) (118 . /) (124 . *) (130 . |output|)
              (135 . |coerce|) |NUMQUAD;rombergo;M4F2IR;7|
              |NUMQUAD;simpsono;M4F2IR;8| |NUMQUAD;trapezoidalo;M4F2IR;9|)
           '#(|trapezoidalo| 140 |trapezoidal| 151 |simpsono| 162 |simpson| 173
              |rombergo| 184 |romberg| 195 |atrapezoidal| 206 |asimpson| 218
              |aromberg| 230)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 53
                                                 '(0 6 0 7 2 6 0 0 0 8 2 6 0 0
                                                   9 10 2 6 0 0 0 11 1 6 12 0
                                                   13 0 6 0 17 3 18 12 0 9 12
                                                   19 1 12 0 20 21 1 12 0 22 23
                                                   1 12 24 0 25 1 6 0 0 26 2 6
                                                   0 0 0 32 1 9 12 0 33 2 34 24
                                                   20 12 35 2 6 36 0 0 37 2 6
                                                   36 0 0 38 2 6 0 39 0 40 3 41
                                                   6 0 9 6 42 2 41 6 0 9 43 2 9
                                                   36 0 0 44 2 9 0 39 0 45 2 46
                                                   0 9 9 47 2 6 0 46 0 48 1 34
                                                   24 12 49 1 41 12 0 50 7 0 14
                                                   15 6 6 6 6 9 9 53 7 0 14 15
                                                   6 6 6 6 9 9 30 7 0 14 15 6 6
                                                   6 6 9 9 52 7 0 14 15 6 6 6 6
                                                   9 9 28 7 0 14 15 6 6 6 6 9 9
                                                   51 7 0 14 15 6 6 6 6 9 9 16
                                                   8 0 14 15 6 6 6 6 9 9 9 31 8
                                                   0 14 15 6 6 6 6 9 9 9 29 8 0
                                                   14 15 6 6 6 6 9 9 9 27)))))
           '|lookupComplete|)) 
