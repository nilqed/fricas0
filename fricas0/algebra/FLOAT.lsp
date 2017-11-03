
(SDEFUN |FLOAT;writeOMFloat| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 13))
             (SPADCALL |dev| "bigfloat1" "bigfloat" (QREFELT $ 15))
             (SPADCALL |dev| (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 18))
             (SPADCALL |dev| 2 (QREFELT $ 18))
             (SPADCALL |dev| (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 18))
             (EXIT (SPADCALL |dev| (QREFELT $ 20))))) 

(SDEFUN |FLOAT;OMwrite;Omd$BV;2|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 21))))
             (|FLOAT;writeOMFloat| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 22))))))) 

(SDEFUN |FLOAT;shift2| ((|x| |Integer|) (|y| |Integer|) ($ |Integer|))
        (* (SPADCALL |x| (QREFELT $ 25))
           (ASH (* (SPADCALL |x| (QREFELT $ 25)) |x|) |y|))) 

(SDEFUN |FLOAT;asin;2$;4| ((|x| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 26)) (|spadConstant| $ 27))
                      ((SPADCALL |x| (QREFELT $ 28))
                       (SPADCALL
                        (SPADCALL (SPADCALL |x| (QREFELT $ 29)) (QREFELT $ 30))
                        (QREFELT $ 29)))
                      ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 32))
                       (SPADCALL (SPADCALL (QREFELT $ 33)) 2 (QREFELT $ 34)))
                      ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 35))
                       (|error|
                        (SPADCALL
                         (LIST "asin: argument > 1 in magnitude" ": "
                               (SPADCALL |x| (QREFELT $ 36)))
                         (QREFELT $ 38))))
                      ('T
                       (SEQ (SPADCALL 5 (QREFELT $ 39))
                            (LETT |r|
                                  (SPADCALL
                                   (SPADCALL |x|
                                             (SPADCALL
                                              (|FLOAT;sub|
                                               (|spadConstant| $ 31)
                                               (|FLOAT;times| |x| |x| $) $)
                                              (QREFELT $ 40))
                                             (QREFELT $ 41))
                                   (QREFELT $ 42))
                                  |FLOAT;asin;2$;4|)
                            (SPADCALL 5 (QREFELT $ 43))
                            (EXIT (SPADCALL |r| (QREFELT $ 44))))))))) 

(SDEFUN |FLOAT;acos;2$;5| ((|x| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 26))
                  (SPADCALL (SPADCALL (QREFELT $ 33)) 2 (QREFELT $ 34)))
                 ((SPADCALL |x| (QREFELT $ 28))
                  (SEQ (SPADCALL 3 (QREFELT $ 39))
                       (LETT |r|
                             (SPADCALL (SPADCALL (QREFELT $ 33))
                                       (SPADCALL (SPADCALL |x| (QREFELT $ 29))
                                                 (QREFELT $ 45))
                                       (QREFELT $ 46))
                             . #1=(|FLOAT;acos;2$;5|))
                       (SPADCALL 3 (QREFELT $ 43))
                       (EXIT (SPADCALL |r| (QREFELT $ 44)))))
                 ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 32))
                  (|spadConstant| $ 27))
                 ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 35))
                  (|error|
                   (SPADCALL
                    (LIST "acos: argument > 1 in magnitude" ": "
                          (SPADCALL |x| (QREFELT $ 36)))
                    (QREFELT $ 38))))
                 ('T
                  (SEQ (SPADCALL 5 (QREFELT $ 39))
                       (LETT |r|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (|FLOAT;sub| (|spadConstant| $ 31)
                                 (|FLOAT;times| |x| |x| $) $)
                                (QREFELT $ 40))
                               |x| (QREFELT $ 41))
                              (QREFELT $ 42))
                             . #1#)
                       (SPADCALL 5 (QREFELT $ 43))
                       (EXIT (SPADCALL |r| (QREFELT $ 44))))))))) 

(SDEFUN |FLOAT;atan;3$;6| ((|x| $) (|y| $) ($ $))
        (SPROG ((|theta| ($)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 32))
                  (COND
                   ((SPADCALL |y| (|spadConstant| $ 27) (QREFELT $ 35))
                    (SPADCALL (SPADCALL (QREFELT $ 33)) 2 (QREFELT $ 34)))
                   ((SPADCALL |y| (|spadConstant| $ 27) (QREFELT $ 47))
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT $ 33)) 2 (QREFELT $ 34))
                     (QREFELT $ 29)))
                   (#1='T (|spadConstant| $ 27))))
                 (#1#
                  (SEQ
                   (LETT |theta|
                         (SPADCALL
                          (SPADCALL (SPADCALL |y| |x| (QREFELT $ 41))
                                    (QREFELT $ 48))
                          (QREFELT $ 42))
                         . #2=(|FLOAT;atan;3$;6|))
                   (COND
                    ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 47))
                     (LETT |theta|
                           (SPADCALL (SPADCALL (QREFELT $ 33)) |theta|
                                     (QREFELT $ 46))
                           . #2#)))
                   (COND
                    ((SPADCALL |y| (|spadConstant| $ 27) (QREFELT $ 47))
                     (LETT |theta| (SPADCALL |theta| (QREFELT $ 29)) . #2#)))
                   (EXIT |theta|))))))) 

(SDEFUN |FLOAT;atan;2$;7| ((|x| $) ($ $))
        (SPROG
         ((|t| ($)) (#1=#:G835 NIL) (|i| NIL) (|k| (|Integer|)) (#2=#:G834 NIL)
          (|r| ($)))
         (SEQ
          (EXIT
           (COND ((SPADCALL |x| (QREFELT $ 26)) (|spadConstant| $ 27))
                 ((SPADCALL |x| (QREFELT $ 28))
                  (SPADCALL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 29)) (QREFELT $ 42))
                   (QREFELT $ 29)))
                 (#3='T
                  (SEQ
                   (COND
                    ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 35))
                     (SEQ (SPADCALL 4 (QREFELT $ 39))
                          (LETT |r|
                                (COND
                                 ((SPADCALL (SPADCALL |x| (QREFELT $ 50))
                                            (QREFELT $ 26))
                                  (COND
                                   ((SPADCALL |x|
                                              (CONS (SPADCALL (QREFELT $ 51))
                                                    0)
                                              (QREFELT $ 47))
                                    (|FLOAT;atanInverse|
                                     (SPADCALL |x| (QREFELT $ 52)) $))
                                   (#3#
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 31) |x|
                                               (QREFELT $ 41))
                                     (QREFELT $ 42)))))
                                 (#3#
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 31) |x|
                                             (QREFELT $ 41))
                                   (QREFELT $ 42))))
                                . #4=(|FLOAT;atan;2$;7|))
                          (LETT |r|
                                (SPADCALL
                                 (SPADCALL (SPADCALL (QREFELT $ 33)) 2
                                           (QREFELT $ 34))
                                 |r| (QREFELT $ 46))
                                . #4#)
                          (SPADCALL 4 (QREFELT $ 43))
                          (EXIT
                           (PROGN
                            (LETT #2# (SPADCALL |r| (QREFELT $ 44)) . #4#)
                            (GO #5=#:G833))))))
                   (LETT |k|
                         (QUOTIENT2
                          (SPADCALL (- (SPADCALL (QREFELT $ 51)) 100)
                                    (QREFELT $ 54))
                          5)
                         . #4#)
                   (LETT |k|
                         (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 55))))
                         . #4#)
                   (SPADCALL (SPADCALL 2 |k| (QREFELT $ 56)) (QREFELT $ 39))
                   (SEQ (LETT |i| 1 . #4#) (LETT #1# |k| . #4#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |x|
                                (SPADCALL |x|
                                          (SPADCALL (|spadConstant| $ 31)
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (|spadConstant| $ 31)
                                                      (SPADCALL |x| |x|
                                                                (QREFELT $ 57))
                                                      (QREFELT $ 58))
                                                     (QREFELT $ 40))
                                                    (QREFELT $ 58))
                                          (QREFELT $ 41))
                                . #4#)))
                        (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |t| (|FLOAT;atanSeries| |x| $) . #4#)
                   (SPADCALL (SPADCALL 2 |k| (QREFELT $ 56)) (QREFELT $ 43))
                   (LETT |t| (SPADCALL |t| |k| (QREFELT $ 59)) . #4#)
                   (EXIT (SPADCALL |t| (QREFELT $ 44)))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FLOAT;atanSeries| ((|x| $) ($ $))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|i| NIL) (|m| #1#)
          (|y| ($)) (|d| #2#) (|p| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p|
                (+
                 (+ (SPADCALL (QREFELT $ 51))
                    (INTEGER-LENGTH (SPADCALL (QREFELT $ 51))))
                 2)
                . #3=(|FLOAT;atanSeries|))
          (LETT |s| (LETT |d| (ASH 1 |p|) . #3#) . #3#)
          (LETT |y| (|FLOAT;times| |x| |x| $) . #3#)
          (LETT |t|
                (LETT |m| (- (|FLOAT;shift2| (QCAR |y|) (+ (QCDR |y|) |p|) $))
                      . #3#)
                . #3#)
          (SEQ (LETT |i| 3 . #3#) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
               (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |i|)) . #3#)
                    (EXIT (LETT |t| (QUOTIENT2 (* |m| |t|) |d|) . #3#)))
               (LETT |i| (|add_SI| |i| 2) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| (CONS |s| (- |p|)) (QREFELT $ 57)))))) 

(SDEFUN |FLOAT;atanInverse| ((|n| |Integer|) ($ $))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #1#) (|k| NIL) (|e| (|Integer|))
          (|n2| (|Integer|)))
         (SEQ (LETT |n2| (- (* |n| |n|)) . #2=(|FLOAT;atanInverse|))
              (LETT |e|
                    (+
                     (+
                      (+ (SPADCALL (QREFELT $ 51))
                         (INTEGER-LENGTH (SPADCALL (QREFELT $ 51))))
                      (INTEGER-LENGTH |n|))
                     1)
                    . #2#)
              (LETT |s| (QUOTIENT2 (ASH 1 |e|) |n|) . #2#)
              (LETT |t| (QUOTIENT2 |s| |n2|) . #2#)
              (SEQ (LETT |k| 3 . #2#) G190
                   (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
                   (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |k|)) . #2#)
                        (EXIT (LETT |t| (QUOTIENT2 |t| |n2|) . #2#)))
                   (LETT |k| (|add_SI| |k| 2) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (CONS |s| (- |e|)) (QREFELT $ 44)))))) 

(SDEFUN |FLOAT;sin;2$;10| ((|x| $) ($ $))
        (SPROG
         ((|r| ($)) (#1=#:G865 NIL) (|i| NIL) (#2=#:G860 NIL) (|k| (|Integer|))
          (|s| (|Integer|)) (|p| (|PositiveInteger|)))
         (SEQ (LETT |s| (SPADCALL |x| (QREFELT $ 61)) . #3=(|FLOAT;sin;2$;10|))
              (LETT |x| (SPADCALL |x| (QREFELT $ 48)) . #3#)
              (LETT |p| (SPADCALL (QREFELT $ 51)) . #3#)
              (SPADCALL 4 (QREFELT $ 39))
              (COND
               ((SPADCALL |x| (CONS 6 0) (QREFELT $ 35))
                (SEQ (SPADCALL |p| (QREFELT $ 39))
                     (LETT |x|
                           (SPADCALL
                            (SPADCALL 2 (SPADCALL (QREFELT $ 33))
                                      (QREFELT $ 62))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL |x| (SPADCALL (QREFELT $ 33))
                                        (QREFELT $ 41))
                              2 (QREFELT $ 34))
                             (QREFELT $ 50))
                            (QREFELT $ 57))
                           . #3#)
                     (EXIT (SPADCALL |p| (QREFELT $ 63))))))
              (COND
               ((SPADCALL |x| (CONS 3 0) (QREFELT $ 35))
                (SEQ (SPADCALL |p| (QREFELT $ 39)) (LETT |s| (- |s|) . #3#)
                     (LETT |x|
                           (SPADCALL |x| (SPADCALL (QREFELT $ 33))
                                     (QREFELT $ 46))
                           . #3#)
                     (EXIT (SPADCALL |p| (QREFELT $ 63))))))
              (COND
               ((SPADCALL |x| (CONS 3 -1) (QREFELT $ 35))
                (SEQ (SPADCALL |p| (QREFELT $ 39))
                     (LETT |x|
                           (SPADCALL (SPADCALL (QREFELT $ 33)) |x|
                                     (QREFELT $ 46))
                           . #3#)
                     (EXIT (SPADCALL |p| (QREFELT $ 43))))))
              (LETT |k|
                    (QUOTIENT2
                     (SPADCALL (- (SPADCALL (QREFELT $ 51)) 100)
                               (QREFELT $ 54))
                     4)
                    . #3#)
              (LETT |k| (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 55))))
                    . #3#)
              (COND
               ((SPADCALL |k| 0 (QREFELT $ 64))
                (SEQ (SPADCALL |k| (QREFELT $ 39))
                     (EXIT
                      (LETT |x|
                            (SPADCALL |x|
                                      (EXPT 3
                                            (PROG1 (LETT #2# |k| . #3#)
                                              (|check_subtype2| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #2#)))
                                      (QREFELT $ 34))
                            . #3#)))))
              (LETT |r| (|FLOAT;sinSeries| |x| $) . #3#)
              (SEQ (LETT |i| 1 . #3#) (LETT #1# |k| . #3#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |r|
                           (SPADCALL (|FLOAT;itimes| 3 |r| $)
                                     (SPADCALL (SPADCALL |r| 3 (QREFELT $ 65))
                                               2 (QREFELT $ 59))
                                     (QREFELT $ 46))
                           . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (SPADCALL |p| (QREFELT $ 63))
              (EXIT (SPADCALL |s| |r| (QREFELT $ 66)))))) 

(SDEFUN |FLOAT;sinSeries| ((|x| $) ($ $))
        (SPROG
         ((|t| (|Integer|)) (|s| #1=(|Integer|)) (|i| NIL) (|m| (|Integer|))
          (|d| #1#) (|y| ($)) (|p| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p|
                (+
                 (+ (SPADCALL (QREFELT $ 51))
                    (INTEGER-LENGTH (SPADCALL (QREFELT $ 51))))
                 2)
                . #2=(|FLOAT;sinSeries|))
          (LETT |y| (|FLOAT;times| |x| |x| $) . #2#)
          (LETT |s| (LETT |d| (ASH 1 |p|) . #2#) . #2#)
          (LETT |m| (- (|FLOAT;shift2| (QCAR |y|) (+ (QCDR |y|) |p|) $)) . #2#)
          (LETT |t| (QUOTIENT2 |m| 6) . #2#)
          (SEQ (LETT |i| 4 . #2#) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
               (SEQ (LETT |s| (+ |s| |t|) . #2#)
                    (LETT |t| (QUOTIENT2 (* |m| |t|) (* |i| (+ |i| 1))) . #2#)
                    (EXIT (LETT |t| (QUOTIENT2 |t| |d|) . #2#)))
               (LETT |i| (|add_SI| |i| 2) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| (CONS |s| (- |p|)) (QREFELT $ 57)))))) 

(SDEFUN |FLOAT;cos;2$;12| ((|x| $) ($ $))
        (SPROG
         ((|r| ($)) (#1=#:G883 NIL) (|i| NIL) (|k| (|Integer|)) (#2=#:G882 NIL)
          (|s| (|Integer|)) (|p| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |s| 1 . #3=(|FLOAT;cos;2$;12|))
                (LETT |x| (SPADCALL |x| (QREFELT $ 48)) . #3#)
                (LETT |p| (SPADCALL (QREFELT $ 51)) . #3#)
                (SPADCALL 4 (QREFELT $ 39))
                (COND
                 ((SPADCALL |x| (CONS 6 0) (QREFELT $ 35))
                  (SEQ (SPADCALL |p| (QREFELT $ 39))
                       (LETT |x|
                             (SPADCALL
                              (SPADCALL 2 (SPADCALL (QREFELT $ 33))
                                        (QREFELT $ 62))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |x| (SPADCALL (QREFELT $ 33))
                                          (QREFELT $ 41))
                                2 (QREFELT $ 34))
                               (QREFELT $ 50))
                              (QREFELT $ 57))
                             . #3#)
                       (EXIT (SPADCALL |p| (QREFELT $ 43))))))
                (COND
                 ((SPADCALL |x| (CONS 3 0) (QREFELT $ 35))
                  (SEQ (SPADCALL |p| (QREFELT $ 39)) (LETT |s| (- |s|) . #3#)
                       (LETT |x|
                             (SPADCALL |x| (SPADCALL (QREFELT $ 33))
                                       (QREFELT $ 46))
                             . #3#)
                       (EXIT (SPADCALL |p| (QREFELT $ 43))))))
                (COND
                 ((SPADCALL |x| (CONS 1 0) (QREFELT $ 35))
                  (SEQ (SPADCALL |p| (QREFELT $ 39))
                       (LETT |x|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QREFELT $ 33)) 2
                                        (QREFELT $ 34))
                              |x| (QREFELT $ 46))
                             . #3#)
                       (SPADCALL |p| (QREFELT $ 63))
                       (LETT |x| (SPADCALL |x| (QREFELT $ 44)) . #3#)
                       (EXIT
                        (PROGN
                         (LETT #2#
                               (SPADCALL |s| (SPADCALL |x| (QREFELT $ 67))
                                         (QREFELT $ 66))
                               . #3#)
                         (GO #4=#:G881))))))
                (LETT |k|
                      (QUOTIENT2
                       (SPADCALL (- (SPADCALL (QREFELT $ 51)) 100)
                                 (QREFELT $ 54))
                       3)
                      . #3#)
                (LETT |k| (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 55))))
                      . #3#)
                (COND
                 ((SPADCALL |k| 0 (QREFELT $ 64))
                  (SEQ
                   (SPADCALL (+ |k| (EXPT (INTEGER-LENGTH |k|) 2))
                             (QREFELT $ 39))
                   (EXIT
                    (LETT |x| (SPADCALL |x| (- |k|) (QREFELT $ 59)) . #3#)))))
                (LETT |r| (|FLOAT;cosSeries| |x| $) . #3#)
                (SEQ (LETT |i| 1 . #3#) (LETT #1# |k| . #3#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |r|
                             (SPADCALL
                              (SPADCALL (SPADCALL |r| |r| (QREFELT $ 57)) 1
                                        (QREFELT $ 59))
                              (|spadConstant| $ 31) (QREFELT $ 46))
                             . #3#)))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
                (SPADCALL |p| (QREFELT $ 63))
                (EXIT (SPADCALL |s| |r| (QREFELT $ 66)))))
          #4# (EXIT #2#)))) 

(SDEFUN |FLOAT;cosSeries| ((|x| $) ($ $))
        (SPROG
         ((|t| (|Integer|)) (|s| #1=(|Integer|)) (|i| NIL) (|m| (|Integer|))
          (|d| #1#) (|y| ($)) (|p| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p|
                (+
                 (+ (SPADCALL (QREFELT $ 51))
                    (INTEGER-LENGTH (SPADCALL (QREFELT $ 51))))
                 1)
                . #2=(|FLOAT;cosSeries|))
          (LETT |y| (|FLOAT;times| |x| |x| $) . #2#)
          (LETT |s| (LETT |d| (ASH 1 |p|) . #2#) . #2#)
          (LETT |m| (- (|FLOAT;shift2| (QCAR |y|) (+ (QCDR |y|) |p|) $)) . #2#)
          (LETT |t| (QUOTIENT2 |m| 2) . #2#)
          (SEQ (LETT |i| 3 . #2#) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
               (SEQ (LETT |s| (+ |s| |t|) . #2#)
                    (LETT |t| (QUOTIENT2 (* |m| |t|) (* |i| (+ |i| 1))) . #2#)
                    (EXIT (LETT |t| (QUOTIENT2 |t| |d|) . #2#)))
               (LETT |i| (|add_SI| |i| 2) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (CONS |s| (- |p|)) (QREFELT $ 44)))))) 

(SDEFUN |FLOAT;tan;2$;14| ((|x| $) ($ $))
        (SPROG
         ((|t| ($)) (|c| ($)) (|s| (|Integer|)) (|p| (|PositiveInteger|)))
         (SEQ (LETT |s| (SPADCALL |x| (QREFELT $ 61)) . #1=(|FLOAT;tan;2$;14|))
              (LETT |x| (SPADCALL |x| (QREFELT $ 48)) . #1#)
              (LETT |p| (SPADCALL (QREFELT $ 51)) . #1#)
              (SPADCALL 6 (QREFELT $ 39))
              (COND
               ((SPADCALL |x| (CONS 3 0) (QREFELT $ 35))
                (SEQ (SPADCALL |p| (QREFELT $ 39))
                     (LETT |x|
                           (SPADCALL (SPADCALL (QREFELT $ 33))
                                     (SPADCALL
                                      (SPADCALL |x| (SPADCALL (QREFELT $ 33))
                                                (QREFELT $ 41))
                                      (QREFELT $ 50))
                                     (QREFELT $ 57))
                           . #1#)
                     (EXIT (SPADCALL |p| (QREFELT $ 43))))))
              (COND
               ((SPADCALL |x| (CONS 3 -1) (QREFELT $ 35))
                (SEQ (SPADCALL |p| (QREFELT $ 39))
                     (LETT |x|
                           (SPADCALL (SPADCALL (QREFELT $ 33)) |x|
                                     (QREFELT $ 46))
                           . #1#)
                     (LETT |s| (- |s|) . #1#)
                     (EXIT (SPADCALL |p| (QREFELT $ 43))))))
              (COND
               ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 35))
                (SEQ (LETT |c| (SPADCALL |x| (QREFELT $ 68)) . #1#)
                     (EXIT
                      (LETT |t|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 31)
                                        (SPADCALL |c| |c| (QREFELT $ 57))
                                        (QREFELT $ 46))
                              (QREFELT $ 40))
                             |c| (QREFELT $ 41))
                            . #1#))))
               ('T
                (SEQ (LETT |c| (SPADCALL |x| (QREFELT $ 67)) . #1#)
                     (EXIT
                      (LETT |t|
                            (SPADCALL |c|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 31)
                                                 (SPADCALL |c| |c|
                                                           (QREFELT $ 57))
                                                 (QREFELT $ 46))
                                       (QREFELT $ 40))
                                      (QREFELT $ 41))
                            . #1#)))))
              (SPADCALL |p| (QREFELT $ 63))
              (EXIT (SPADCALL |s| |t| (QREFELT $ 66)))))) 

(SDEFUN |FLOAT;pi;$;15| (($ $))
        (COND
         ((SPADCALL (SPADCALL (QREFELT $ 51)) (QCAR (QREFELT $ 70))
                    (QREFELT $ 72))
          (SPADCALL (QCDR (QREFELT $ 70)) (QREFELT $ 44)))
         ('T
          (QCDR
           (SETELT $ 70
                   (CONS (SPADCALL (QREFELT $ 51)) (|FLOAT;piRamanujan| $))))))) 

(SDEFUN |FLOAT;piRamanujan| (($ $))
        (SPROG
         ((|t| (|Integer|)) (|m| (|Integer|)) (|s| (|Integer|)) (|i| NIL)
          (|j| NIL) (|d| (|Integer|)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n|
                (+
                 (+ (SPADCALL (QREFELT $ 51))
                    (INTEGER-LENGTH (SPADCALL (QREFELT $ 51))))
                 11)
                . #1=(|FLOAT;piRamanujan|))
          (LETT |t| (QUOTIENT2 (ASH 1 |n|) 882) . #1#)
          (LETT |d| (* 4 (SPADCALL 882 2 (QREFELT $ 73))) . #1#)
          (LETT |s| 0 . #1#)
          (SEQ (LETT |j| 1123 . #1#) (LETT |i| 2 . #1#) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
               (SEQ (LETT |s| (+ |s| (SPADCALL |j| |t| (QREFELT $ 75))) . #1#)
                    (LETT |m|
                          (-
                           (*
                            (* (- |i| 1) (- (SPADCALL 2 |i| (QREFELT $ 76)) 1))
                            (- (SPADCALL 2 |i| (QREFELT $ 76)) 3)))
                          . #1#)
                    (EXIT
                     (LETT |t|
                           (QUOTIENT2 (* |m| |t|)
                                      (* |d| (SPADCALL |i| 3 (QREFELT $ 77))))
                           . #1#)))
               (LETT |i|
                     (PROG1 (|add_SI| |i| 2)
                       (LETT |j| (|add_SI| |j| 21460) . #1#))
                     . #1#)
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|spadConstant| $ 31) (CONS |s| (- (- |n|) 2))
                     (QREFELT $ 41)))))) 

(SDEFUN |FLOAT;sinh;2$;17| ((|x| $) ($ $))
        (SPROG ((|s| ($)) (|e| ($)) (|lost| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 26)) (|spadConstant| $ 27))
                      (#1='T
                       (SEQ
                        (LETT |lost| (MAX (- (SPADCALL |x| (QREFELT $ 55))) 0)
                              . #2=(|FLOAT;sinh;2$;17|))
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL 2 |lost| (QREFELT $ 56))
                                     (SPADCALL (QREFELT $ 51)) (QREFELT $ 64))
                           |x|)
                          (#1#
                           (SEQ (SPADCALL (+ 5 |lost|) (QREFELT $ 39))
                                (LETT |e| (SPADCALL |x| (QREFELT $ 78)) . #2#)
                                (LETT |s|
                                      (SPADCALL
                                       (SPADCALL |e|
                                                 (SPADCALL
                                                  (|spadConstant| $ 31) |e|
                                                  (QREFELT $ 41))
                                                 (QREFELT $ 46))
                                       2 (QREFELT $ 34))
                                      . #2#)
                                (SPADCALL (+ 5 |lost|) (QREFELT $ 43))
                                (EXIT (SPADCALL |s| (QREFELT $ 44))))))))))))) 

(SDEFUN |FLOAT;cosh;2$;18| ((|x| $) ($ $))
        (SPROG ((|c| ($)) (|e| ($)))
               (SEQ (SPADCALL 5 (QREFELT $ 39))
                    (LETT |e| (SPADCALL |x| (QREFELT $ 78))
                          . #1=(|FLOAT;cosh;2$;18|))
                    (LETT |c|
                          (SPADCALL
                           (SPADCALL |e|
                                     (SPADCALL (|spadConstant| $ 31) |e|
                                               (QREFELT $ 41))
                                     (QREFELT $ 58))
                           2 (QREFELT $ 34))
                          . #1#)
                    (SPADCALL 5 (QREFELT $ 43))
                    (EXIT (SPADCALL |c| (QREFELT $ 44)))))) 

(SDEFUN |FLOAT;tanh;2$;19| ((|x| $) ($ $))
        (SPROG ((|t| ($)) (|e| ($)) (|lost| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 26)) (|spadConstant| $ 27))
                      (#1='T
                       (SEQ
                        (LETT |lost| (MAX (- (SPADCALL |x| (QREFELT $ 55))) 0)
                              . #2=(|FLOAT;tanh;2$;19|))
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL 2 |lost| (QREFELT $ 56))
                                     (SPADCALL (QREFELT $ 51)) (QREFELT $ 64))
                           |x|)
                          (#1#
                           (SEQ (SPADCALL (+ 6 |lost|) (QREFELT $ 39))
                                (LETT |e| (SPADCALL |x| (QREFELT $ 78)) . #2#)
                                (LETT |e| (SPADCALL |e| |e| (QREFELT $ 57))
                                      . #2#)
                                (LETT |t|
                                      (SPADCALL
                                       (SPADCALL |e| (|spadConstant| $ 31)
                                                 (QREFELT $ 46))
                                       (SPADCALL |e| (|spadConstant| $ 31)
                                                 (QREFELT $ 58))
                                       (QREFELT $ 41))
                                      . #2#)
                                (SPADCALL (+ 6 |lost|) (QREFELT $ 43))
                                (EXIT (SPADCALL |t| (QREFELT $ 44))))))))))))) 

(SDEFUN |FLOAT;asinh;2$;20| ((|x| $) ($ $))
        (SPROG ((|r| ($)) (#1=#:G924 NIL) (|p| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |p| (MIN 0 (SPADCALL |x| (QREFELT $ 55)))
                        . #2=(|FLOAT;asinh;2$;20|))
                  (COND
                   ((OR (SPADCALL |x| (QREFELT $ 26))
                        (< (SPADCALL 2 |p| (QREFELT $ 56))
                           (- (SPADCALL (QREFELT $ 51)))))
                    (PROGN (LETT #1# |x| . #2#) (GO #3=#:G923))))
                  (SPADCALL (- 5 |p|) (QREFELT $ 39))
                  (LETT |r|
                        (SPADCALL
                         (SPADCALL |x|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 31)
                                              (SPADCALL |x| |x| (QREFELT $ 57))
                                              (QREFELT $ 58))
                                    (QREFELT $ 40))
                                   (QREFELT $ 58))
                         (QREFELT $ 82))
                        . #2#)
                  (SPADCALL (- 5 |p|) (QREFELT $ 43))
                  (EXIT (SPADCALL |r| (QREFELT $ 44)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FLOAT;acosh;2$;21| ((|x| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 47))
                  (|error|
                   (SPADCALL
                    (LIST "acosh: invalid argument" ": "
                          (SPADCALL |x| (QREFELT $ 36)))
                    (QREFELT $ 38)))))
                (SPADCALL 5 (QREFELT $ 39))
                (LETT |r|
                      (SPADCALL
                       (SPADCALL |x|
                                 (SPADCALL
                                  (|FLOAT;sub| (|FLOAT;times| |x| |x| $)
                                   (|spadConstant| $ 31) $)
                                  (QREFELT $ 40))
                                 (QREFELT $ 58))
                       (QREFELT $ 82))
                      |FLOAT;acosh;2$;21|)
                (SPADCALL 5 (QREFELT $ 43))
                (EXIT (SPADCALL |r| (QREFELT $ 44)))))) 

(SDEFUN |FLOAT;atanh;2$;22| ((|x| $) ($ $))
        (SPROG ((|r| ($)) (#1=#:G933 NIL) (|p| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((OR (SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 35))
                        (SPADCALL |x|
                                  (SPADCALL (|spadConstant| $ 31)
                                            (QREFELT $ 29))
                                  (QREFELT $ 47)))
                    (|error|
                     (SPADCALL
                      (LIST "atanh: invalid argument" ": "
                            (SPADCALL |x| (QREFELT $ 36)))
                      (QREFELT $ 38)))))
                  (LETT |p| (MIN 0 (SPADCALL |x| (QREFELT $ 55)))
                        . #2=(|FLOAT;atanh;2$;22|))
                  (COND
                   ((OR (SPADCALL |x| (QREFELT $ 26))
                        (< (SPADCALL 2 |p| (QREFELT $ 56))
                           (- (SPADCALL (QREFELT $ 51)))))
                    (PROGN (LETT #1# |x| . #2#) (GO #3=#:G932))))
                  (SPADCALL (- 5 |p|) (QREFELT $ 39))
                  (LETT |r|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 58))
                           (SPADCALL (|spadConstant| $ 31) |x| (QREFELT $ 46))
                           (QREFELT $ 41))
                          (QREFELT $ 82))
                         2 (QREFELT $ 34))
                        . #2#)
                  (SPADCALL (- 5 |p|) (QREFELT $ 43))
                  (EXIT (SPADCALL |r| (QREFELT $ 44)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FLOAT;log;2$;23| ((|x| $) ($ $))
        (SPROG
         ((|l| ($)) (|m| #1=(|Integer|)) (|ek| ($)) (#2=#:G938 NIL)
          (|k| (|Integer|)) (|n| #1#) (|p| (|PositiveInteger|)))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 28))
            (|error|
             (SPADCALL
              (LIST "log: negative argument" ": "
                    (SPADCALL |x| (QREFELT $ 36)))
              (QREFELT $ 38))))
           ((SPADCALL |x| (QREFELT $ 26)) (|error| "log 0 generated"))
           (#3='T
            (SEQ (LETT |p| (SPADCALL (QREFELT $ 51)) . #4=(|FLOAT;log;2$;23|))
                 (SPADCALL 5 (QREFELT $ 39))
                 (SEQ (LETT |n| (SPADCALL |x| (QREFELT $ 55)) . #4#)
                      (EXIT (COND ((< |n| 0) (LETT |n| (+ |n| 1) . #4#)))))
                 (LETT |l|
                       (COND ((EQL |n| 0) (|spadConstant| $ 27))
                             (#3#
                              (SEQ
                               (LETT |x| (SPADCALL |x| (- |n|) (QREFELT $ 59))
                                     . #4#)
                               (EXIT
                                (SPADCALL |n| (SPADCALL (QREFELT $ 86))
                                          (QREFELT $ 66))))))
                       . #4#)
                 (LETT |k| (QUOTIENT2 (SPADCALL (- |p| 100) (QREFELT $ 54)) 3)
                       . #4#)
                 (COND
                  ((SPADCALL |k| 1 (QREFELT $ 64))
                   (SEQ
                    (LETT |k|
                          (MAX 1
                               (+ |k|
                                  (SPADCALL
                                   (SPADCALL |x| (|spadConstant| $ 31)
                                             (QREFELT $ 46))
                                   (QREFELT $ 55))))
                          . #4#)
                    (SPADCALL |k| (QREFELT $ 39))
                    (LETT |ek|
                          (|FLOAT;expInverse|
                           (EXPT 2
                                 (PROG1 (LETT #2# |k| . #4#)
                                   (|check_subtype2| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#)))
                           $)
                          . #4#)
                    (SPADCALL (QUOTIENT2 |p| 2) (QREFELT $ 43))
                    (LETT |m|
                          (SPADCALL (|FLOAT;square| |x| |k| $) (QREFELT $ 55))
                          . #4#)
                    (SPADCALL (QUOTIENT2 |p| 2) (QREFELT $ 39))
                    (LETT |m|
                          (QUOTIENT2 (SPADCALL 6847196937 |m| (QREFELT $ 56))
                                     9878417065)
                          . #4#)
                    (LETT |x|
                          (SPADCALL |x| (SPADCALL |ek| (- |m|) (QREFELT $ 87))
                                    (QREFELT $ 57))
                          . #4#)
                    (EXIT
                     (LETT |l| (SPADCALL |l| (CONS |m| (- |k|)) (QREFELT $ 58))
                           . #4#)))))
                 (LETT |l|
                       (SPADCALL |l| (|FLOAT;logSeries| |x| $) (QREFELT $ 58))
                       . #4#)
                 (SPADCALL |p| (QREFELT $ 63))
                 (EXIT (SPADCALL |l| (QREFELT $ 44))))))))) 

(SDEFUN |FLOAT;logSeries| ((|x| $) ($ $))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|i| NIL) (|m| #1#)
          (|z| ($)) (|d| #2#) (|y| ($)) (|p| #3=(|NonNegativeInteger|))
          (|g| #3#))
         (SEQ
          (LETT |p|
                (+ (SPADCALL (QREFELT $ 51))
                   (LETT |g| (+ (INTEGER-LENGTH (SPADCALL (QREFELT $ 51))) 3)
                         . #4=(|FLOAT;logSeries|)))
                . #4#)
          (SPADCALL |g| (QREFELT $ 39))
          (LETT |y|
                (SPADCALL (SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 46))
                          (SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 58))
                          (QREFELT $ 41))
                . #4#)
          (SPADCALL |g| (QREFELT $ 43))
          (LETT |s| (LETT |d| (ASH 1 |p|) . #4#) . #4#)
          (LETT |z| (|FLOAT;times| |y| |y| $) . #4#)
          (LETT |t|
                (LETT |m| (|FLOAT;shift2| (QCAR |z|) (+ (QCDR |z|) |p|) $)
                      . #4#)
                . #4#)
          (SEQ (LETT |i| 3 . #4#) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
               (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |i|)) . #4#)
                    (EXIT (LETT |t| (QUOTIENT2 (* |m| |t|) |d|) . #4#)))
               (LETT |i| (|add_SI| |i| 2) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |y| (CONS |s| (- 1 |p|)) (QREFELT $ 57)))))) 

(SDEFUN |FLOAT;log2;$;25| (($ $))
        (SPROG
         ((|t| (|Integer|)) (|s| (|Integer|)) (|k| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT $ 51)) . #1=(|FLOAT;log2;$;25|))
              (EXIT
               (COND
                ((SPADCALL |n| (QCAR (QREFELT $ 88)) (QREFELT $ 89))
                 (SPADCALL (QCDR (QREFELT $ 88)) (QREFELT $ 44)))
                ('T
                 (SEQ (LETT |n| (+ (+ |n| (INTEGER-LENGTH |n|)) 3) . #1#)
                      (LETT |s| (QUOTIENT2 (ASH 1 (+ |n| 1)) 3) . #1#)
                      (LETT |t| (QUOTIENT2 |s| 9) . #1#)
                      (SEQ (LETT |k| 3 . #1#) G190
                           (COND
                            ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
                           (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |k|)) . #1#)
                                (EXIT (LETT |t| (QUOTIENT2 |t| 9) . #1#)))
                           (LETT |k| (|add_SI| |k| 2) . #1#) (GO G190) G191
                           (EXIT NIL))
                      (SETELT $ 88
                              (CONS (SPADCALL (QREFELT $ 51))
                                    (CONS |s| (- |n|))))
                      (EXIT
                       (SPADCALL (QCDR (QREFELT $ 88)) (QREFELT $ 44)))))))))) 

(SDEFUN |FLOAT;log10;$;26| (($ $))
        (SPROG
         ((|t| (|Integer|)) (|s| (|Integer|)) (|k| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT $ 51)) . #1=(|FLOAT;log10;$;26|))
              (EXIT
               (COND
                ((SPADCALL |n| (QCAR (QREFELT $ 90)) (QREFELT $ 89))
                 (SPADCALL (QCDR (QREFELT $ 90)) (QREFELT $ 44)))
                ('T
                 (SEQ (LETT |n| (+ (+ |n| (INTEGER-LENGTH |n|)) 5) . #1#)
                      (LETT |s| (QUOTIENT2 (ASH 1 (+ |n| 1)) 9) . #1#)
                      (LETT |t| (QUOTIENT2 |s| 81) . #1#)
                      (SEQ (LETT |k| 3 . #1#) G190
                           (COND
                            ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
                           (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |k|)) . #1#)
                                (EXIT (LETT |t| (QUOTIENT2 |t| 81) . #1#)))
                           (LETT |k| (|add_SI| |k| 2) . #1#) (GO G190) G191
                           (EXIT NIL))
                      (SPADCALL 2 (QREFELT $ 39))
                      (SETELT $ 90
                              (CONS (SPADCALL (QREFELT $ 51))
                                    (SPADCALL (CONS |s| (- |n|))
                                              (SPADCALL 3
                                                        (SPADCALL
                                                         (QREFELT $ 86))
                                                        (QREFELT $ 62))
                                              (QREFELT $ 58))))
                      (SPADCALL 2 (QREFELT $ 43))
                      (EXIT
                       (SPADCALL (QCDR (QREFELT $ 90)) (QREFELT $ 44)))))))))) 

(SDEFUN |FLOAT;log2;2$;27| ((|x| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ (SPADCALL 2 (QREFELT $ 39))
                    (LETT |r|
                          (SPADCALL (SPADCALL |x| (QREFELT $ 82))
                                    (SPADCALL (QREFELT $ 86)) (QREFELT $ 41))
                          |FLOAT;log2;2$;27|)
                    (SPADCALL 2 (QREFELT $ 43))
                    (EXIT (SPADCALL |r| (QREFELT $ 44)))))) 

(SDEFUN |FLOAT;log10;2$;28| ((|x| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ (SPADCALL 2 (QREFELT $ 39))
                    (LETT |r|
                          (SPADCALL (SPADCALL |x| (QREFELT $ 82))
                                    (SPADCALL (QREFELT $ 91)) (QREFELT $ 41))
                          |FLOAT;log10;2$;28|)
                    (SPADCALL 2 (QREFELT $ 43))
                    (EXIT (SPADCALL |r| (QREFELT $ 44)))))) 

(SDEFUN |FLOAT;exp;2$;29| ((|x| $) ($ $))
        (SPROG
         ((|e| ($)) (|k| (|Integer|)) (#1=#:G971 NIL) (|e1| ($))
          (|n| (|Integer|)) (|p| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |p| (SPADCALL (QREFELT $ 51)) . #2=(|FLOAT;exp;2$;29|))
                (SPADCALL 5 (QREFELT $ 39))
                (LETT |e1| (|spadConstant| $ 31) . #2#)
                (COND
                 ((SPADCALL (LETT |n| (SPADCALL |x| (QREFELT $ 52)) . #2#) 0
                            (QREFELT $ 60))
                  (SEQ (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 39))
                       (LETT |e1|
                             (SPADCALL (SPADCALL (QREFELT $ 94)) |n|
                                       (QREFELT $ 87))
                             . #2#)
                       (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 43))
                       (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 50)) . #2#)))))
                (COND
                 ((SPADCALL |x| (QREFELT $ 26))
                  (SEQ (SPADCALL |p| (QREFELT $ 63))
                       (EXIT
                        (PROGN
                         (LETT #1# (SPADCALL |e1| (QREFELT $ 44)) . #2#)
                         (GO #3=#:G970))))))
                (LETT |k| (QUOTIENT2 (SPADCALL (- |p| 100) (QREFELT $ 54)) 3)
                      . #2#)
                (LETT |k| (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 55))))
                      . #2#)
                (COND
                 ((SPADCALL |k| 0 (QREFELT $ 64))
                  (SEQ (SPADCALL |k| (QREFELT $ 39))
                       (EXIT
                        (LETT |x| (SPADCALL |x| (- |k|) (QREFELT $ 59))
                              . #2#)))))
                (LETT |e| (|FLOAT;expSeries| |x| $) . #2#)
                (COND
                 ((SPADCALL |k| 0 (QREFELT $ 64))
                  (LETT |e| (|FLOAT;square| |e| |k| $) . #2#)))
                (SPADCALL |p| (QREFELT $ 63))
                (EXIT (SPADCALL |e| |e1| (QREFELT $ 57)))))
          #3# (EXIT #1#)))) 

(SDEFUN |FLOAT;expSeries| ((|x| $) ($ $))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|i| NIL) (|n| #1#)
          (|d| #2#) (|p| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p|
                (+
                 (+ (SPADCALL (QREFELT $ 51))
                    (INTEGER-LENGTH (SPADCALL (QREFELT $ 51))))
                 1)
                . #3=(|FLOAT;expSeries|))
          (LETT |s| (LETT |d| (ASH 1 |p|) . #3#) . #3#)
          (LETT |t|
                (LETT |n| (|FLOAT;shift2| (QCAR |x|) (+ (QCDR |x|) |p|) $)
                      . #3#)
                . #3#)
          (SEQ (LETT |i| 2 . #3#) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
               (SEQ (LETT |s| (+ |s| |t|) . #3#)
                    (LETT |t| (QUOTIENT2 (* |n| |t|) |i|) . #3#)
                    (EXIT (LETT |t| (QUOTIENT2 |t| |d|) . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (CONS |s| (- |p|)) (QREFELT $ 44)))))) 

(SDEFUN |FLOAT;mat0|
        ((|n0| . #1=(|Integer|)) (|bl| |Integer|) (|ki| |Integer|)
         ($ |Record| (|:| |highn| (|Integer|))
          (|:| |matr| (|Matrix| (|Integer|)))))
        (SPROG
         ((|i| #1#) (|m22| #2=(|Integer|)) (|m21| #3=(|Integer|))
          (|m12| (|Integer|)) (|m11| (|Integer|)) (|#G60| #4=(|Integer|))
          (|#G59| #4#) (|#G58| #2#) (|#G57| #3#))
         (SEQ (LETT |m11| 1 . #5=(|FLOAT;mat0|)) (LETT |m12| 0 . #5#)
              (LETT |m21| 0 . #5#) (LETT |m22| 1 . #5#) (LETT |i| |n0| . #5#)
              (SEQ G190
                   (COND ((NULL (< (INTEGER-LENGTH |m11|) |bl|)) (GO G191)))
                   (SEQ
                    (PROGN
                     (LETT |#G57| |m21| . #5#)
                     (LETT |#G58| |m22| . #5#)
                     (LETT |#G59| (+ |m11| (* |i| |m21|)) . #5#)
                     (LETT |#G60| (+ |m12| (* |i| |m22|)) . #5#)
                     (LETT |m11| |#G57| . #5#)
                     (LETT |m12| |#G58| . #5#)
                     (LETT |m21| |#G59| . #5#)
                     (LETT |m22| |#G60| . #5#))
                    (EXIT (LETT |i| (+ |i| |ki|) . #5#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (CONS |i|
                     (SPADCALL (LIST (LIST |m11| |m12|) (LIST |m21| |m22|))
                               (QREFELT $ 97))))))) 

(SDEFUN |FLOAT;mat1|
        ((|n0| |Integer|) (|bl| |Integer|) (|ki| |Integer|)
         ($
          . #1=(|Record| (|:| |highn| (|Integer|))
                         (|:| |matr| (|Matrix| (|Integer|))))))
        (SPROG
         ((|r2| #1#) (|bl1| (|Integer|)) (|m1| (|Matrix| (|Integer|)))
          (|r1| #1#))
         (SEQ
          (COND
           ((SPADCALL |bl| 300 (QREFELT $ 98)) (|FLOAT;mat0| |n0| |bl| |ki| $))
           ('T
            (SEQ (LETT |bl1| (QUOTIENT2 |bl| 2) . #2=(|FLOAT;mat1|))
                 (LETT |r1| (|FLOAT;mat1| |n0| |bl1| |ki| $) . #2#)
                 (LETT |m1| (QCDR |r1|) . #2#)
                 (LETT |bl1|
                       (- |bl|
                          (INTEGER-LENGTH (SPADCALL |m1| 1 1 (QREFELT $ 99))))
                       . #2#)
                 (LETT |r2| (|FLOAT;mat1| (QCAR |r1|) |bl1| |ki| $) . #2#)
                 (EXIT
                  (CONS (QCAR |r2|)
                        (SPADCALL (QCDR |r2|) |m1| (QREFELT $ 100)))))))))) 

(SDEFUN |FLOAT;expInverse| ((|k| |Integer|) ($ $))
        (SPROG
         ((|q1| (|Integer|)) (|p1| (|Integer|)) (|mm0| (|Matrix| (|Integer|)))
          (|l| (|NonNegativeInteger|)) (|ki| #1=(|Integer|)) (|k0| #1#)
          (|q0| (|Integer|)) (|p0| (|Integer|)))
         (SEQ
          (LETT |p1| (+ (SPADCALL 2 |k| (QREFELT $ 56)) 1)
                . #2=(|FLOAT;expInverse|))
          (LETT |p0| 1 . #2#)
          (LETT |q1| (- (SPADCALL 2 |k| (QREFELT $ 56)) 1) . #2#)
          (LETT |q0| 1 . #2#) (LETT |k0| (SPADCALL 6 |k| (QREFELT $ 56)) . #2#)
          (LETT |ki| (SPADCALL 4 |k| (QREFELT $ 56)) . #2#)
          (LETT |l| (QUOTIENT2 (+ (SPADCALL (QREFELT $ 51)) 1) 2) . #2#)
          (LETT |mm0|
                (SPADCALL (LIST (LIST |p0| |q0|) (LIST |p1| |q1|))
                          (QREFELT $ 97))
                . #2#)
          (LETT |mm0|
                (SPADCALL (QCDR (|FLOAT;mat1| |k0| |l| |ki| $)) |mm0|
                          (QREFELT $ 100))
                . #2#)
          (LETT |p1| (SPADCALL |mm0| 2 1 (QREFELT $ 99)) . #2#)
          (LETT |q1| (SPADCALL |mm0| 2 2 (QREFELT $ 99)) . #2#)
          (EXIT (|FLOAT;dvide| (CONS |p1| 0) (CONS |q1| 0) $))))) 

(SDEFUN |FLOAT;exp1;$;34| (($ $))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL (QREFELT $ 51)) (QCAR (QREFELT $ 101))
                     (QREFELT $ 102))
           (SETELT $ 101
                   (CONS (SPADCALL (QREFELT $ 51)) (|FLOAT;expInverse| 1 $)))))
         (EXIT (SPADCALL (QCDR (QREFELT $ 101)) (QREFELT $ 44))))) 

(SDEFUN |FLOAT;sqrt;2$;35| ((|x| $) ($ $))
        (SPROG
         ((|i| (|Integer|)) (|p| (|Integer|)) (|l| (|Integer|))
          (|e| (|Integer|)) (|m| (|Integer|)))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 28))
            (|error|
             (SPADCALL
              (LIST "sqrt: negative argument" ": "
                    (SPADCALL |x| (QREFELT $ 36)))
              (QREFELT $ 38))))
           ('T
            (SEQ (LETT |m| (QCAR |x|) . #1=(|FLOAT;sqrt;2$;35|))
                 (LETT |e| (QCDR |x|) . #1#)
                 (LETT |l| (INTEGER-LENGTH |m|) . #1#)
                 (LETT |p| (+ (- (* 2 (SPADCALL (QREFELT $ 51))) |l|) 2) . #1#)
                 (COND ((ODDP (- |e| |l|)) (LETT |p| (- |p| 1) . #1#)))
                 (LETT |i| (|FLOAT;shift2| (QCAR |x|) |p| $) . #1#)
                 (LETT |i| (SPADCALL |i| (QREFELT $ 54)) . #1#)
                 (EXIT
                  (SPADCALL (CONS |i| (QUOTIENT2 (- |e| |p|) 2))
                            (QREFELT $ 44))))))))) 

(SDEFUN |FLOAT;bits;Pi;36| (($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 9) (QREFELT $ 103))) 

(SDEFUN |FLOAT;bits;2Pi;37| ((|n| . #1=(|PositiveInteger|)) ($ . #1#))
        (SPROG ((|t| (|PositiveInteger|)))
               (SEQ (LETT |t| (SPADCALL (QREFELT $ 51)) |FLOAT;bits;2Pi;37|)
                    (SPADCALL (QREFELT $ 9) |n| (QREFELT $ 104)) (EXIT |t|)))) 

(SDEFUN |FLOAT;precision;Pi;38| (($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 51))) 

(SDEFUN |FLOAT;precision;2Pi;39| ((|n| . #1=(|PositiveInteger|)) ($ . #1#))
        (SPADCALL |n| (QREFELT $ 63))) 

(SDEFUN |FLOAT;increasePrecision;IPi;40|
        ((|n| |Integer|) ($ |PositiveInteger|))
        (SPROG ((#1=#:G1005 NIL) (|b| (|PositiveInteger|)))
               (SEQ
                (LETT |b| (SPADCALL (QREFELT $ 51))
                      . #2=(|FLOAT;increasePrecision;IPi;40|))
                (SPADCALL
                 (PROG1 (LETT #1# (+ |b| |n|) . #2#)
                   (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                     '(|Integer|) #1#))
                 (QREFELT $ 63))
                (EXIT |b|)))) 

(SDEFUN |FLOAT;decreasePrecision;IPi;41|
        ((|n| |Integer|) ($ |PositiveInteger|))
        (SPROG ((#1=#:G1009 NIL) (|b| (|PositiveInteger|)))
               (SEQ
                (LETT |b| (SPADCALL (QREFELT $ 51))
                      . #2=(|FLOAT;decreasePrecision;IPi;41|))
                (SPADCALL
                 (PROG1 (LETT #1# (- |b| |n|) . #2#)
                   (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                     '(|Integer|) #1#))
                 (QREFELT $ 63))
                (EXIT |b|)))) 

(SDEFUN |FLOAT;ceillog10base2| ((|n| |PositiveInteger|) ($ |PositiveInteger|))
        (SPROG ((#1=#:G1013 NIL))
               (PROG1
                   (LETT #1# (QUOTIENT2 (+ (* 13301 |n|) 4003) 4004)
                         |FLOAT;ceillog10base2|)
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |FLOAT;digits;Pi;43| (($ |PositiveInteger|))
        (SPROG ((#1=#:G1016 NIL))
               (PROG1
                   (LETT #1#
                         (MAX 1
                              (QUOTIENT2
                               (SPADCALL 4004 (- (SPADCALL (QREFELT $ 51)) 1)
                                         (QREFELT $ 56))
                               13301))
                         |FLOAT;digits;Pi;43|)
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                   #1#)))) 

(SDEFUN |FLOAT;digits;2Pi;44| ((|n| . #1=(|PositiveInteger|)) ($ . #1#))
        (SPROG ((|t| (|PositiveInteger|)))
               (SEQ (LETT |t| (SPADCALL (QREFELT $ 106)) |FLOAT;digits;2Pi;44|)
                    (SPADCALL (+ 1 (|FLOAT;ceillog10base2| |n| $))
                              (QREFELT $ 63))
                    (EXIT |t|)))) 

(SDEFUN |FLOAT;order;$I;45| ((|a| $) ($ |Integer|))
        (- (+ (INTEGER-LENGTH (QCAR |a|)) (QCDR |a|)) 1)) 

(SDEFUN |FLOAT;relerror;3$;46| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (SPADCALL (SPADCALL |a| |b| (QREFELT $ 46)) |b| (QREFELT $ 41))
         (QREFELT $ 48))) 

(PUT '|FLOAT;Zero;$;47| '|SPADreplace| '(XLAM NIL (CONS 0 0))) 

(SDEFUN |FLOAT;Zero;$;47| (($ $)) (CONS 0 0)) 

(PUT '|FLOAT;One;$;48| '|SPADreplace| '(XLAM NIL (CONS 1 0))) 

(SDEFUN |FLOAT;One;$;48| (($ $)) (CONS 1 0)) 

(PUT '|FLOAT;base;Pi;49| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |FLOAT;base;Pi;49| (($ |PositiveInteger|)) 2) 

(PUT '|FLOAT;mantissa;$I;50| '|SPADreplace| 'QCAR) 

(SDEFUN |FLOAT;mantissa;$I;50| ((|x| $) ($ |Integer|)) (QCAR |x|)) 

(PUT '|FLOAT;exponent;$I;51| '|SPADreplace| 'QCDR) 

(SDEFUN |FLOAT;exponent;$I;51| ((|x| $) ($ |Integer|)) (QCDR |x|)) 

(SDEFUN |FLOAT;one?;$B;52| ((|a| $) ($ |Boolean|))
        (SPADCALL |a| (|spadConstant| $ 31) (QREFELT $ 32))) 

(SDEFUN |FLOAT;zero?;$B;53| ((|a| $) ($ |Boolean|)) (ZEROP (QCAR |a|))) 

(SDEFUN |FLOAT;negative?;$B;54| ((|a| $) ($ |Boolean|)) (MINUSP (QCAR |a|))) 

(SDEFUN |FLOAT;positive?;$B;55| ((|a| $) ($ |Boolean|))
        (SPADCALL (QCAR |a|) (QREFELT $ 111))) 

(SDEFUN |FLOAT;chop| ((|x| $) (|p| |PositiveInteger|) ($ $))
        (SPROG ((|e| (|Integer|)))
               (SEQ
                (LETT |e| (- (INTEGER-LENGTH (QCAR |x|)) |p|)
                      . #1=(|FLOAT;chop|))
                (COND
                 ((SPADCALL |e| 0 (QREFELT $ 64))
                  (LETT |x|
                        (CONS (|FLOAT;shift2| (QCAR |x|) (- |e|) $)
                              (+ (QCDR |x|) |e|))
                        . #1#)))
                (EXIT |x|)))) 

(SDEFUN |FLOAT;float;2I$;57| ((|m| . #1=(|Integer|)) (|e| . #1#) ($ $))
        (SPADCALL (CONS |m| |e|) (QREFELT $ 44))) 

(SDEFUN |FLOAT;float;2IPi$;58|
        ((|m| . #1=(|Integer|)) (|e| . #1#) (|b| |PositiveInteger|) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (COND ((EQL |m| 0) (|spadConstant| $ 27))
                      ('T
                       (SEQ (SPADCALL 4 (QREFELT $ 39))
                            (LETT |r|
                                  (SPADCALL |m|
                                            (SPADCALL (CONS |b| 0) |e|
                                                      (QREFELT $ 87))
                                            (QREFELT $ 66))
                                  |FLOAT;float;2IPi$;58|)
                            (SPADCALL 4 (QREFELT $ 43))
                            (EXIT (SPADCALL |r| (QREFELT $ 44))))))))) 

(SDEFUN |FLOAT;normalize;2$;59| ((|x| $) ($ $))
        (SPROG ((|y| (|Integer|)) (|e| (|Integer|)) (|m| (|Integer|)))
               (SEQ (LETT |m| (QCAR |x|) . #1=(|FLOAT;normalize;2$;59|))
                    (EXIT
                     (COND ((EQL |m| 0) (|spadConstant| $ 27))
                           (#2='T
                            (SEQ
                             (LETT |e|
                                   (- (INTEGER-LENGTH |m|)
                                      (SPADCALL (QREFELT $ 51)))
                                   . #1#)
                             (COND
                              ((SPADCALL |e| 0 (QREFELT $ 64))
                               (SEQ
                                (LETT |y| (|FLOAT;shift2| |m| (- 1 |e|) $)
                                      . #1#)
                                (COND
                                 ((ODDP |y|)
                                  (SEQ
                                   (LETT |y|
                                         (QUOTIENT2
                                          (COND
                                           ((SPADCALL |y| 0 (QREFELT $ 64))
                                            (+ |y| 1))
                                           (#2# (- |y| 1)))
                                          2)
                                         . #1#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL (INTEGER-LENGTH |y|)
                                                (SPADCALL (QREFELT $ 51))
                                                (QREFELT $ 115))
                                      (SEQ (LETT |y| (QUOTIENT2 |y| 2) . #1#)
                                           (EXIT
                                            (LETT |e| (+ |e| 1) . #1#))))))))
                                 (#2# (LETT |y| (QUOTIENT2 |y| 2) . #1#)))
                                (EXIT
                                 (LETT |x| (CONS |y| (+ (QCDR |x|) |e|))
                                       . #1#)))))
                             (EXIT |x|)))))))) 

(SDEFUN |FLOAT;shift;$I$;60| ((|x| $) (|n| |Integer|) ($ $))
        (CONS (QCAR |x|) (+ (QCDR |x|) |n|))) 

(SDEFUN |FLOAT;=;2$B;61| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((EQL (QCDR |x|) (QCDR |y|)) (EQL (QCAR |x|) (QCAR |y|)))
              ((EQL (SPADCALL |x| (QREFELT $ 55))
                    (SPADCALL |y| (QREFELT $ 55)))
               (COND
                ((EQL (SPADCALL |x| (QREFELT $ 61))
                      (SPADCALL |y| (QREFELT $ 61)))
                 (SPADCALL (SPADCALL |x| |y| (QREFELT $ 46)) (QREFELT $ 26)))
                (#1='T NIL)))
              (#1# NIL))) 

(SDEFUN |FLOAT;<;2$B;62| ((|x| $) (|y| $) ($ |Boolean|))
        (SEQ
         (COND ((EQL (QCAR |y|) 0) (< (QCAR |x|) 0))
               ((EQL (QCAR |x|) 0) (SPADCALL (QCAR |y|) 0 (QREFELT $ 64)))
               (#1='T
                (SEQ
                 (COND
                  ((SPADCALL |x| (QREFELT $ 28))
                   (COND ((SPADCALL |y| (QREFELT $ 112)) (EXIT 'T)))))
                 (COND
                  ((SPADCALL |y| (QREFELT $ 28))
                   (COND ((SPADCALL |x| (QREFELT $ 112)) (EXIT NIL)))))
                 (EXIT
                  (COND
                   ((< (SPADCALL |x| (QREFELT $ 55))
                       (SPADCALL |y| (QREFELT $ 55)))
                    (SPADCALL |x| (QREFELT $ 112)))
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 55))
                              (SPADCALL |y| (QREFELT $ 55)) (QREFELT $ 64))
                    (SPADCALL |x| (QREFELT $ 28)))
                   (#1#
                    (SPADCALL (SPADCALL |x| |y| (QREFELT $ 46))
                              (QREFELT $ 28)))))))))) 

(SDEFUN |FLOAT;abs;2$;63| ((|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 28)) (SPADCALL |x| (QREFELT $ 29)))
              ('T (SPADCALL |x| (QREFELT $ 44))))) 

(SDEFUN |FLOAT;ceiling;2$;64| ((|x| $) ($ $))
        (SPROG ((#1=#:G1068 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |x| (QREFELT $ 28))
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL (SPADCALL |x| (QREFELT $ 29))
                                      (QREFELT $ 116))
                            (QREFELT $ 29))
                           |FLOAT;ceiling;2$;64|)
                     (GO #2=#:G1067))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |x| (QREFELT $ 50)) (QREFELT $ 26))
                     |x|)
                    ('T
                     (SPADCALL (SPADCALL |x| (QREFELT $ 117))
                               (|spadConstant| $ 31) (QREFELT $ 58)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |FLOAT;wholePart;$I;65| ((|x| $) ($ |Integer|))
        (|FLOAT;shift2| (QCAR |x|) (QCDR |x|) $)) 

(SDEFUN |FLOAT;floor;2$;66| ((|x| $) ($ $))
        (COND
         ((SPADCALL |x| (QREFELT $ 28))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 29)) (QREFELT $ 118))
                    (QREFELT $ 29)))
         ('T (SPADCALL |x| (QREFELT $ 117))))) 

(SDEFUN |FLOAT;round;2$;67| ((|x| $) ($ $))
        (SPROG ((|half| ($)))
               (SEQ
                (LETT |half| (CONS (SPADCALL |x| (QREFELT $ 61)) -1)
                      |FLOAT;round;2$;67|)
                (EXIT
                 (SPADCALL (SPADCALL |x| |half| (QREFELT $ 58))
                           (QREFELT $ 117)))))) 

(SDEFUN |FLOAT;sign;$I;68| ((|x| $) ($ |Integer|))
        (COND ((< (QCAR |x|) 0) -1) ('T 1))) 

(SDEFUN |FLOAT;truncate;2$;69| ((|x| $) ($ $))
        (SPROG ((#1=#:G1081 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((>= (QCDR |x|) 0)
                    (PROGN
                     (LETT #1# |x| |FLOAT;truncate;2$;69|)
                     (GO #2=#:G1080))))
                  (EXIT
                   (SPADCALL (CONS (|FLOAT;shift2| (QCAR |x|) (QCDR |x|) $) 0)
                             (QREFELT $ 44)))))
                #2# (EXIT #1#)))) 

(SDEFUN |FLOAT;recip;$U;70| ((|x| $) ($ |Union| $ "failed"))
        (COND
         ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 32))
          (CONS 1 "failed"))
         ('T (CONS 0 (SPADCALL (|spadConstant| $ 31) |x| (QREFELT $ 41)))))) 

(SDEFUN |FLOAT;differentiate;2$;71| ((|x| $) ($ $)) (|spadConstant| $ 27)) 

(SDEFUN |FLOAT;-;2$;72| ((|x| $) ($ $))
        (SPADCALL (|FLOAT;negate| |x| $) (QREFELT $ 44))) 

(SDEFUN |FLOAT;negate| ((|x| $) ($ $)) (CONS (- (QCAR |x|)) (QCDR |x|))) 

(SDEFUN |FLOAT;+;3$;74| ((|x| $) (|y| $) ($ $))
        (SPADCALL (|FLOAT;plus| |x| |y| $) (QREFELT $ 44))) 

(SDEFUN |FLOAT;-;3$;75| ((|x| $) (|y| $) ($ $))
        (SPADCALL (|FLOAT;plus| |x| (|FLOAT;negate| |y| $) $) (QREFELT $ 44))) 

(SDEFUN |FLOAT;sub| ((|x| $) (|y| $) ($ $))
        (|FLOAT;plus| |x| (|FLOAT;negate| |y| $) $)) 

(SDEFUN |FLOAT;plus| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|mw| (|Integer|)) (|ey| #1=(|Integer|)) (|ex| #1#)
          (|my| #2=(|Integer|)) (|mx| #2#) (|#G119| #1#) (|#G118| #1#)
          (|#G117| #2#) (|#G116| #2#) (|de| (|Integer|)))
         (SEQ (LETT |mx| (QCAR |x|) . #3=(|FLOAT;plus|))
              (LETT |my| (QCAR |y|) . #3#)
              (EXIT
               (COND ((EQL |mx| 0) |y|) ((EQL |my| 0) |x|)
                     (#4='T
                      (SEQ (LETT |ex| (QCDR |x|) . #3#)
                           (LETT |ey| (QCDR |y|) . #3#)
                           (EXIT
                            (COND ((EQL |ex| |ey|) (CONS (+ |mx| |my|) |ex|))
                                  (#4#
                                   (SEQ
                                    (LETT |de|
                                          (-
                                           (- (+ |ex| (INTEGER-LENGTH |mx|))
                                              |ey|)
                                           (INTEGER-LENGTH |my|))
                                          . #3#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |de|
                                                 (+ (SPADCALL (QREFELT $ 51))
                                                    1)
                                                 (QREFELT $ 64))
                                       |x|)
                                      ((< |de|
                                          (- (+ (SPADCALL (QREFELT $ 51)) 1)))
                                       |y|)
                                      (#4#
                                       (SEQ
                                        (COND
                                         ((< |ex| |ey|)
                                          (PROGN
                                           (LETT |#G116| |my| . #3#)
                                           (LETT |#G117| |mx| . #3#)
                                           (LETT |#G118| |ey| . #3#)
                                           (LETT |#G119| |ex| . #3#)
                                           (LETT |mx| |#G116| . #3#)
                                           (LETT |my| |#G117| . #3#)
                                           (LETT |ex| |#G118| . #3#)
                                           (LETT |ey| |#G119| . #3#))))
                                        (LETT |mw|
                                              (+ |my|
                                                 (|FLOAT;shift2| |mx|
                                                  (- |ex| |ey|) $))
                                              . #3#)
                                        (EXIT (CONS |mw| |ey|))))))))))))))))) 

(SDEFUN |FLOAT;*;3$;78| ((|x| $) (|y| $) ($ $))
        (SPADCALL (|FLOAT;times| |x| |y| $) (QREFELT $ 44))) 

(SDEFUN |FLOAT;*;I2$;79| ((|x| |Integer|) (|y| $) ($ $))
        (COND
         ((SPADCALL (INTEGER-LENGTH |x|) (SPADCALL (QREFELT $ 51))
                    (QREFELT $ 115))
          (SPADCALL (SPADCALL (CONS |x| 0) (QREFELT $ 44)) |y| (QREFELT $ 57)))
         ('T (SPADCALL (CONS (* |x| (QCAR |y|)) (QCDR |y|)) (QREFELT $ 44))))) 

(SDEFUN |FLOAT;/;3$;80| ((|x| $) (|y| $) ($ $))
        (SPADCALL (|FLOAT;dvide| |x| |y| $) (QREFELT $ 44))) 

(SDEFUN |FLOAT;/;$I$;81| ((|x| $) (|y| |Integer|) ($ $))
        (COND
         ((SPADCALL (INTEGER-LENGTH |y|) (SPADCALL (QREFELT $ 51))
                    (QREFELT $ 115))
          (SPADCALL |x| (SPADCALL (CONS |y| 0) (QREFELT $ 44)) (QREFELT $ 41)))
         ('T (SPADCALL |x| (CONS |y| 0) (QREFELT $ 41))))) 

(SDEFUN |FLOAT;inv;2$;82| ((|x| $) ($ $))
        (SPADCALL (|spadConstant| $ 31) |x| (QREFELT $ 41))) 

(SDEFUN |FLOAT;times| ((|x| $) (|y| $) ($ $))
        (CONS (* (QCAR |x|) (QCAR |y|)) (+ (QCDR |x|) (QCDR |y|)))) 

(SDEFUN |FLOAT;itimes| ((|n| |Integer|) (|y| $) ($ $))
        (CONS (* |n| (QCAR |y|)) (QCDR |y|))) 

(SDEFUN |FLOAT;dvide| ((|x| $) (|y| $) ($ $))
        (SPROG ((|ew| (|Integer|)) (|mw| (|Integer|)))
               (SEQ
                (LETT |ew|
                      (+
                       (+
                        (- (INTEGER-LENGTH (QCAR |y|))
                           (INTEGER-LENGTH (QCAR |x|)))
                        (SPADCALL (QREFELT $ 51)))
                       1)
                      . #1=(|FLOAT;dvide|))
                (LETT |mw|
                      (QUOTIENT2 (|FLOAT;shift2| (QCAR |x|) |ew| $) (QCAR |y|))
                      . #1#)
                (LETT |ew| (- (- (QCDR |x|) (QCDR |y|)) |ew|) . #1#)
                (EXIT (CONS |mw| |ew|))))) 

(SDEFUN |FLOAT;square| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG
         ((|ex| (|Integer|)) (|ma| (|Integer|)) (|l| (|Integer|))
          (#1=#:G1120 NIL) (|k| NIL))
         (SEQ (LETT |ma| (QCAR |x|) . #2=(|FLOAT;square|))
              (LETT |ex| (QCDR |x|) . #2#)
              (SEQ (LETT |k| 1 . #2#) (LETT #1# |n| . #2#) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ (LETT |ma| (* |ma| |ma|) . #2#)
                        (LETT |ex| (+ |ex| |ex|) . #2#)
                        (LETT |l|
                              (- (SPADCALL (QREFELT $ 51))
                                 (INTEGER-LENGTH |ma|))
                              . #2#)
                        (LETT |ma| (|FLOAT;shift2| |ma| |l| $) . #2#)
                        (EXIT (LETT |ex| (- |ex| |l|) . #2#)))
                   (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |ma| |ex|))))) 

(SDEFUN |FLOAT;power| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((|z| ($)) (#1=#:G1127 NIL) (|y| ($)))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| (|spadConstant| $ 31) . #2=(|FLOAT;power|))
                      (LETT |z| |x| . #2#)
                      (EXIT
                       (SEQ G190 NIL
                            (SEQ
                             (COND
                              ((ODDP |n|)
                               (LETT |y|
                                     (|FLOAT;chop| (|FLOAT;times| |y| |z| $)
                                      (SPADCALL (QREFELT $ 51)) $)
                                     . #2#)))
                             (SEQ (LETT |n| (QUOTIENT2 |n| 2) . #2#)
                                  (EXIT
                                   (COND
                                    ((EQL |n| 0)
                                     (PROGN
                                      (LETT #1# |y| . #2#)
                                      (GO #3=#:G1126))))))
                             (EXIT
                              (LETT |z|
                                    (|FLOAT;chop| (|FLOAT;times| |z| |z| $)
                                     (SPADCALL (QREFELT $ 51)) $)
                                    . #2#)))
                            NIL (GO G190) G191 (EXIT NIL)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FLOAT;^;3$;88| ((|x| $) (|y| $) ($ $))
        (SPROG ((|r| ($)) (|p| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 32))
                  (COND
                   ((SPADCALL |y| (|spadConstant| $ 27) (QREFELT $ 32))
                    (|error| "0^0 is undefined"))
                   ((SPADCALL |y| (|spadConstant| $ 27) (QREFELT $ 47))
                    (|error| "division by 0"))
                   (#1='T (|spadConstant| $ 27))))
                 ((SPADCALL |y| (|spadConstant| $ 27) (QREFELT $ 32))
                  (|spadConstant| $ 31))
                 ((SPADCALL |y| (|spadConstant| $ 31) (QREFELT $ 32)) |x|)
                 ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 32))
                  (|spadConstant| $ 31))
                 (#1#
                  (SEQ
                   (LETT |p| (+ (ABS (SPADCALL |y| (QREFELT $ 55))) 5)
                         . #2=(|FLOAT;^;3$;88|))
                   (SPADCALL |p| (QREFELT $ 39))
                   (LETT |r|
                         (SPADCALL
                          (SPADCALL |y| (SPADCALL |x| (QREFELT $ 82))
                                    (QREFELT $ 57))
                          (QREFELT $ 78))
                         . #2#)
                   (SPADCALL |p| (QREFELT $ 43))
                   (EXIT (SPADCALL |r| (QREFELT $ 44))))))))) 

(SDEFUN |FLOAT;^;$F$;89| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG ((|y| ($)) (#1=#:G1138 NIL) (|d| (|Integer|)) (|n| (|Integer|)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 32))
                   (COND
                    ((SPADCALL |r| (|spadConstant| $ 126) (QREFELT $ 127))
                     (|spadConstant| $ 31))
                    ((SPADCALL |r| (|spadConstant| $ 126) (QREFELT $ 128))
                     (|error| "division by 0"))
                    (#2='T (|spadConstant| $ 27))))
                  ((SPADCALL |r| (|spadConstant| $ 126) (QREFELT $ 127))
                   (|spadConstant| $ 31))
                  ((SPADCALL |r| (|spadConstant| $ 129) (QREFELT $ 127)) |x|)
                  ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 32))
                   (|spadConstant| $ 31))
                  (#2#
                   (SEQ
                    (LETT |n| (SPADCALL |r| (QREFELT $ 130))
                          . #3=(|FLOAT;^;$F$;89|))
                    (LETT |d| (SPADCALL |r| (QREFELT $ 131)) . #3#)
                    (EXIT
                     (COND
                      ((SPADCALL |x| (QREFELT $ 28))
                       (COND
                        ((ODDP |d|)
                         (COND
                          ((ODDP |n|)
                           (PROGN
                            (LETT #1#
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |x| (QREFELT $ 29)) |r|
                                             (QREFELT $ 132))
                                   (QREFELT $ 29))
                                  . #3#)
                            (GO #4=#:G1137)))
                          (#2#
                           (PROGN
                            (LETT #1#
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 29)) |r|
                                            (QREFELT $ 132))
                                  . #3#)
                            (GO #4#)))))
                        (#2# (|error| "negative root"))))
                      (#2#
                       (SEQ
                        (COND
                         ((EQL |d| 2)
                          (SEQ (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 39))
                               (LETT |y| (SPADCALL |x| (QREFELT $ 40)) . #3#)
                               (LETT |y| (SPADCALL |y| |n| (QREFELT $ 87))
                                     . #3#)
                               (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 43))
                               (EXIT
                                (PROGN
                                 (LETT #1# (SPADCALL |y| (QREFELT $ 44)) . #3#)
                                 (GO #4#))))))
                        (LETT |y|
                              (SPADCALL (CONS |n| 0) (CONS |d| 0)
                                        (QREFELT $ 41))
                              . #3#)
                        (EXIT (SPADCALL |x| |y| (QREFELT $ 124)))))))))))
                #4# (EXIT #1#)))) 

(SDEFUN |FLOAT;^;$I$;90| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((|y| ($)) (|p| (|PositiveInteger|)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 32))
                  (COND ((EQL |n| 0) (|spadConstant| $ 31))
                        ((< |n| 0) (|error| "division by 0"))
                        (#1='T (|spadConstant| $ 27))))
                 ((EQL |n| 0) (|spadConstant| $ 31)) ((EQL |n| 1) |x|)
                 ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 32))
                  (|spadConstant| $ 31))
                 (#1#
                  (SEQ
                   (LETT |p| (SPADCALL (QREFELT $ 51)) . #2=(|FLOAT;^;$I$;90|))
                   (SPADCALL (+ (+ |p| (INTEGER-LENGTH |n|)) 2) (QREFELT $ 63))
                   (LETT |y| (|FLOAT;power| |x| (ABS |n|) $) . #2#)
                   (COND
                    ((< |n| 0)
                     (LETT |y| (|FLOAT;dvide| (|spadConstant| $ 31) |y| $)
                           . #2#)))
                   (SPADCALL |p| (QREFELT $ 63))
                   (EXIT (SPADCALL |y| (QREFELT $ 44))))))))) 

(SDEFUN |FLOAT;convert10| ((|x| $) (|d| |Integer|) ($ $))
        (SPROG
         ((|h| ($)) (|r| #1=(|Integer|)) (#2=#:G1144 NIL)
          (|b| (|PositiveInteger|)) (|q| #3=(|Integer|))
          (|#G149| (|Record| (|:| |quotient| #3#) (|:| |remainder| #1#)))
          (|e| (|Integer|)) (|m| (|Integer|)))
         (SEQ (LETT |m| (QCAR |x|) . #4=(|FLOAT;convert10|))
              (LETT |e| (QCDR |x|) . #4#)
              (LETT |b| (SPADCALL (QREFELT $ 51)) . #4#)
              (PROGN
               (LETT |#G149| (DIVIDE2 (ABS |e|) |b|) . #4#)
               (LETT |q| (QCAR |#G149|) . #4#)
               (LETT |r| (QCDR |#G149|) . #4#)
               |#G149|)
              (LETT |b| (EXPT 2 |b|) . #4#)
              (LETT |r|
                    (EXPT 2
                          (PROG1 (LETT #2# |r| . #4#)
                            (|check_subtype2| (>= #2# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #2#)))
                    . #4#)
              (LETT |h| (|FLOAT;power10| (CONS |b| 0) |q| (+ |d| 5) $) . #4#)
              (LETT |h|
                    (|FLOAT;chop10| (CONS (* |r| (QCAR |h|)) (QCDR |h|))
                     (+ |d| 5) $)
                    . #4#)
              (EXIT
               (COND
                ((< |e| 0)
                 (LETT |h| (|FLOAT;quotient10| (CONS |m| 0) |h| |d| $) . #4#))
                ('T (|FLOAT;times10| (CONS |m| 0) |h| |d| $))))))) 

(SDEFUN |FLOAT;ceilLength10| ((|n| |Integer|) ($ |Integer|))
        (+ (QUOTIENT2 (* 146 (INTEGER-LENGTH |n|)) 485) 1)) 

(SDEFUN |FLOAT;floorLength10| ((|n| |Integer|) ($ |Integer|))
        (QUOTIENT2 (* 643 (INTEGER-LENGTH |n|)) 2136)) 

(SDEFUN |FLOAT;length10| ((|n| |Integer|) ($ |Integer|))
        (SPROG
         ((|lower| #1=(|Integer|)) (#2=#:G1152 NIL) (|upper| #1#)
          (|ln| (|Integer|)))
         (SEQ
          (LETT |ln|
                (INTEGER-LENGTH (LETT |n| (ABS |n|) . #3=(|FLOAT;length10|)))
                . #3#)
          (LETT |upper| (QUOTIENT2 (SPADCALL 76573 |ln| (QREFELT $ 56)) 254370)
                . #3#)
          (LETT |lower|
                (QUOTIENT2 (SPADCALL 21306 (- |ln| 1) (QREFELT $ 56)) 70777)
                . #3#)
          (EXIT
           (COND ((EQL |upper| |lower|) (+ |upper| 1))
                 ('T
                  (SEQ
                   (LETT |n|
                         (QUOTIENT2 |n|
                                    (EXPT 10
                                          (PROG1 (LETT #2# |lower| . #3#)
                                            (|check_subtype2| (>= #2# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #2#))))
                         . #3#)
                   (SEQ G190 (COND ((NULL (>= |n| 10)) (GO G191)))
                        (SEQ (LETT |n| (QUOTIENT2 |n| 10) . #3#)
                             (EXIT (LETT |lower| (+ |lower| 1) . #3#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT (+ |lower| 1))))))))) 

(SDEFUN |FLOAT;chop10| ((|x| $) (|p| |Integer|) ($ $))
        (SPROG ((#1=#:G1159 NIL) (|e| (|Integer|)))
               (SEQ
                (LETT |e| (- (|FLOAT;floorLength10| (QCAR |x|) $) |p|)
                      . #2=(|FLOAT;chop10|))
                (COND
                 ((SPADCALL |e| 0 (QREFELT $ 64))
                  (LETT |x|
                        (CONS
                         (QUOTIENT2 (QCAR |x|)
                                    (EXPT 10
                                          (PROG1 (LETT #1# |e| . #2#)
                                            (|check_subtype2| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #1#))))
                         (+ (QCDR |x|) |e|))
                        . #2#)))
                (EXIT |x|)))) 

(SDEFUN |FLOAT;normalize10| ((|x| $) (|p| |Integer|) ($ $))
        (SPROG
         ((|ex| (|Integer|)) (|ma| (|Integer|)) (#1=#:G1167 NIL)
          (|r| #2=(|Integer|))
          (|#G159|
           (|Record| (|:| |quotient| (|Integer|)) (|:| |remainder| #2#)))
          (#3=#:G1163 NIL) (|e| (|Integer|)))
         (SEQ (LETT |ma| (QCAR |x|) . #4=(|FLOAT;normalize10|))
              (LETT |ex| (QCDR |x|) . #4#)
              (LETT |e| (- (|FLOAT;length10| |ma| $) |p|) . #4#)
              (COND
               ((SPADCALL |e| 0 (QREFELT $ 64))
                (SEQ
                 (LETT |ma|
                       (QUOTIENT2 |ma|
                                  (EXPT 10
                                        (PROG1 (LETT #3# (- |e| 1) . #4#)
                                          (|check_subtype2| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|)
                                                            #3#))))
                       . #4#)
                 (LETT |ex| (+ |ex| |e|) . #4#)
                 (PROGN
                  (LETT |#G159| (DIVIDE2 |ma| 10) . #4#)
                  (LETT |ma| (QCAR |#G159|) . #4#)
                  (LETT |r| (QCDR |#G159|) . #4#)
                  |#G159|)
                 (EXIT
                  (COND
                   ((SPADCALL |r| 4 (QREFELT $ 64))
                    (SEQ (LETT |ma| (+ |ma| 1) . #4#)
                         (EXIT
                          (COND
                           ((EQL |ma|
                                 (EXPT 10
                                       (PROG1 (LETT #1# |p| . #4#)
                                         (|check_subtype2| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #1#))))
                            (SEQ (LETT |ma| 1 . #4#)
                                 (EXIT
                                  (LETT |ex| (+ |ex| |p|) . #4#)))))))))))))
              (EXIT (CONS |ma| |ex|))))) 

(SDEFUN |FLOAT;times10| ((|x| $) (|y| $) (|p| |Integer|) ($ $))
        (|FLOAT;normalize10| (|FLOAT;times| |x| |y| $) |p| $)) 

(SDEFUN |FLOAT;quotient10| ((|x| $) (|y| $) (|p| |Integer|) ($ $))
        (SPROG ((|ew| (|Integer|)) (|mw| (|Integer|)) (#1=#:G1200 NIL))
               (SEQ
                (LETT |ew|
                      (+
                       (+
                        (- (|FLOAT;floorLength10| (QCAR |y|) $)
                           (|FLOAT;ceilLength10| (QCAR |x|) $))
                        |p|)
                       2)
                      . #2=(|FLOAT;quotient10|))
                (COND ((< |ew| 0) (LETT |ew| 0 . #2#)))
                (LETT |mw|
                      (QUOTIENT2
                       (* (QCAR |x|)
                          (EXPT 10
                                (PROG1 (LETT #1# |ew| . #2#)
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))))
                       (QCAR |y|))
                      . #2#)
                (LETT |ew| (- (- (QCDR |x|) (QCDR |y|)) |ew|) . #2#)
                (EXIT (|FLOAT;normalize10| (CONS |mw| |ew|) |p| $))))) 

(SDEFUN |FLOAT;power10| ((|x| $) (|n| . #1=(|Integer|)) (|d| |Integer|) ($ $))
        (SPROG
         ((|z| ($)) (#2=#:G1209 NIL) (|e| #1#) (|y| ($)) (|p| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 32))
             (|spadConstant| $ 27))
            ((EQL |n| 0) (|spadConstant| $ 31)) ((EQL |n| 1) |x|)
            ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 32))
             (|spadConstant| $ 31))
            ('T
             (SEQ
              (LETT |p| (+ (+ |d| (INTEGER-LENGTH |n|)) 1)
                    . #3=(|FLOAT;power10|))
              (LETT |e| |n| . #3#) (LETT |y| (|spadConstant| $ 31) . #3#)
              (LETT |z| |x| . #3#)
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (COND
                      ((ODDP |e|)
                       (LETT |y|
                             (|FLOAT;chop10| (|FLOAT;times| |y| |z| $) |p| $)
                             . #3#)))
                     (SEQ (LETT |e| (QUOTIENT2 |e| 2) . #3#)
                          (EXIT
                           (COND
                            ((EQL |e| 0)
                             (PROGN (LETT #2# |y| . #3#) (GO #4=#:G1208))))))
                     (EXIT
                      (LETT |z|
                            (|FLOAT;chop10| (|FLOAT;times| |z| |z| $) |p| $)
                            . #3#)))
                    NIL (GO G190) G191 (EXIT NIL)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |FLOAT;padFromLeft| ((|s| |String|) ($ |String|))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G1217 NIL) (|i| NIL) (|t| (|String|))
          (#2=#:G1211 NIL) (|n| (|Integer|)))
         (SEQ
          (COND ((ZEROP (SPADCALL (QREFELT $ 135) (QREFELT $ 142))) |s|)
                ('T
                 (SEQ (LETT |n| (- (QCSIZE |s|) 1) . #3=(|FLOAT;padFromLeft|))
                      (LETT |t|
                            (|make_full_CVEC|
                             (PROG1
                                 (LETT #2#
                                       (+ (+ |n| 1)
                                          (QUOTIENT2 |n|
                                                     (SPADCALL (QREFELT $ 135)
                                                               (QREFELT $
                                                                        142))))
                                       . #3#)
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
                             (STR_ELT "_ " 0))
                            . #3#)
                      (SEQ (LETT |j| (SPADCALL |t| (QREFELT $ 143)) . #3#)
                           (LETT |i| 0 . #3#) (LETT #1# |n| . #3#) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (SPADCALL |t| |j|
                                      (SPADCALL |s|
                                                (+ |i|
                                                   (SPADCALL |s|
                                                             (QREFELT $ 143)))
                                                (QREFELT $ 145))
                                      (QREFELT $ 146))
                            (EXIT
                             (COND
                              ((EQL
                                (REM (+ |i| 1)
                                     (SPADCALL (QREFELT $ 135)
                                               (QREFELT $ 142)))
                                0)
                               (LETT |j| (+ |j| 1) . #3#)))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|)
                                   (LETT |j| (+ |j| 1) . #3#))
                                 . #3#)
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |t|))))))) 

(SDEFUN |FLOAT;padFromRight| ((|s| |String|) ($ |String|))
        (SPROG
         ((|j| #1=(|Integer|)) (|i| NIL) (|t| (|String|)) (#2=#:G1219 NIL)
          (|n| #1#))
         (SEQ
          (COND ((EQL (SPADCALL (QREFELT $ 135) (QREFELT $ 142)) 0) |s|)
                ('T
                 (SEQ (LETT |n| (- (QCSIZE |s|) 1) . #3=(|FLOAT;padFromRight|))
                      (LETT |t|
                            (|make_full_CVEC|
                             (PROG1
                                 (LETT #2#
                                       (+ (+ |n| 1)
                                          (QUOTIENT2 |n|
                                                     (SPADCALL (QREFELT $ 135)
                                                               (QREFELT $
                                                                        142))))
                                       . #3#)
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
                             (STR_ELT "_ " 0))
                            . #3#)
                      (SEQ (LETT |j| (SPADCALL |t| (QREFELT $ 147)) . #3#)
                           (LETT |i| |n| . #3#) G190
                           (COND ((< |i| 0) (GO G191)))
                           (SEQ
                            (SPADCALL |t| |j|
                                      (SPADCALL |s|
                                                (+ |i|
                                                   (SPADCALL |s|
                                                             (QREFELT $ 143)))
                                                (QREFELT $ 145))
                                      (QREFELT $ 146))
                            (EXIT
                             (COND
                              ((EQL
                                (REM (+ (- |n| |i|) 1)
                                     (SPADCALL (QREFELT $ 135)
                                               (QREFELT $ 142)))
                                0)
                               (LETT |j| (- |j| 1) . #3#)))))
                           (LETT |i|
                                 (PROG1 (+ |i| -1) (LETT |j| (+ |j| -1) . #3#))
                                 . #3#)
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |t|))))))) 

(SDEFUN |FLOAT;fixed| ((|f| $) ($ |String|))
        (SPROG
         ((|t| (|String|)) (#1=#:G1244 NIL) (|n| (|NonNegativeInteger|))
          (|s| (|String|)) (#2=#:G1240 NIL) (#3=#:G1238 NIL)
          (|p| #4=(|Integer|)) (|o| #5=(|Integer|)) (|e| (|Integer|))
          (|m| (|Integer|)) (|g| ($)) (|l| (|Integer|)) (|dd| #4#) (|bl| #5#)
          (#6=#:G1230 NIL) (#7=#:G1227 NIL) (|d| #4#))
         (SEQ
          (LETT |d|
                (COND
                 ((EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 148)) -1)
                  (SPADCALL (QREFELT $ 106)))
                 (#8='T (SPADCALL (QREFELT $ 141) (QREFELT $ 148))))
                . #9=(|FLOAT;fixed|))
          (EXIT
           (COND
            ((SPADCALL |f| (QREFELT $ 26))
             (COND ((EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 148)) -1) "0.0")
                   (#8#
                    (STRCONC "0"
                             (STRCONC "."
                                      (|FLOAT;padFromLeft|
                                       (|make_full_CVEC|
                                        (PROG1 (LETT #7# |d| . #9#)
                                          (|check_subtype2| (>= #7# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #7#))
                                        (|STR_to_CHAR| #10="0"))
                                       $))))))
            ((ZEROP (SPADCALL |f| (QREFELT $ 19)))
             (STRCONC
              (|FLOAT;padFromRight| (STRINGIMAGE (SPADCALL |f| (QREFELT $ 17)))
               $)
              (STRCONC "."
                       (|FLOAT;padFromLeft|
                        (|make_full_CVEC|
                         (PROG1 (LETT #6# |d| . #9#)
                           (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #6#))
                         (|STR_to_CHAR| #10#))
                        $))))
            ((SPADCALL |f| (QREFELT $ 28))
             (STRCONC "-" (|FLOAT;fixed| (SPADCALL |f| (QREFELT $ 48)) $)))
            (#8#
             (SEQ (LETT |bl| (+ (INTEGER-LENGTH (QCAR |f|)) (QCDR |f|)) . #9#)
                  (LETT |dd|
                        (COND
                         ((OR
                           (EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 148)) -1)
                           (NULL (SPADCALL |bl| 0 (QREFELT $ 64))))
                          |d|)
                         ('T
                          (+
                           (+
                            (QUOTIENT2 (SPADCALL 146 |bl| (QREFELT $ 56)) 485)
                            1)
                           |d|)))
                        . #9#)
                  (LETT |g|
                        (|FLOAT;convert10| (SPADCALL |f| (QREFELT $ 48)) |dd|
                         $)
                        . #9#)
                  (LETT |m| (QCAR |g|) . #9#) (LETT |e| (QCDR |g|) . #9#)
                  (COND
                   ((SPADCALL (SPADCALL (QREFELT $ 141) (QREFELT $ 148)) -1
                              (QREFELT $ 60))
                    (SEQ (LETT |l| (|FLOAT;length10| |m| $) . #9#)
                         (EXIT
                          (COND
                           ((SPADCALL (- |e|)
                                      (SPADCALL (QREFELT $ 141)
                                                (QREFELT $ 148))
                                      (QREFELT $ 64))
                            (COND
                             ((< (- |e|)
                                 (SPADCALL 2 (SPADCALL (QREFELT $ 106))
                                           (QREFELT $ 56)))
                              (SEQ
                               (LETT |g|
                                     (|FLOAT;normalize10| |g|
                                      (+ (+ |l| |e|)
                                         (SPADCALL (QREFELT $ 141)
                                                   (QREFELT $ 148)))
                                      $)
                                     . #9#)
                               (LETT |m| (QCAR |g|) . #9#)
                               (EXIT (LETT |e| (QCDR |g|) . #9#)))))))))))
                  (LETT |s| (STRINGIMAGE |m|) . #9#)
                  (LETT |n| (QCSIZE |s|) . #9#) (LETT |o| (+ |e| |n|) . #9#)
                  (LETT |p|
                        (COND
                         ((EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 148)) -1)
                          |n|)
                         (#8# (SPADCALL (QREFELT $ 141) (QREFELT $ 148))))
                        . #9#)
                  (COND
                   ((>= |e| 0)
                    (SEQ
                     (LETT |s|
                           (STRCONC |s|
                                    (|make_full_CVEC|
                                     (PROG1 (LETT #3# |e| . #9#)
                                       (|check_subtype2| (>= #3# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #3#))
                                     (|STR_to_CHAR| #10#)))
                           . #9#)
                     (EXIT (LETT |t| "" . #9#))))
                   ((SPADCALL |o| 0 (QREFELT $ 98))
                    (SEQ
                     (LETT |t|
                           (STRCONC
                            (|make_full_CVEC|
                             (PROG1 (LETT #2# (- |o|) . #9#)
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
                             (|STR_to_CHAR| #10#))
                            |s|)
                           . #9#)
                     (EXIT (LETT |s| "0" . #9#))))
                   (#8#
                    (SEQ
                     (LETT |t|
                           (SPADCALL |s|
                                     (SPADCALL
                                      (+ |o| (SPADCALL |s| (QREFELT $ 143)))
                                      (- (+ |n| (SPADCALL |s| (QREFELT $ 143)))
                                         1)
                                      (QREFELT $ 150))
                                     (QREFELT $ 151))
                           . #9#)
                     (EXIT
                      (LETT |s|
                            (SPADCALL |s|
                                      (SPADCALL (SPADCALL |s| (QREFELT $ 143))
                                                (-
                                                 (+ |o|
                                                    (SPADCALL |s|
                                                              (QREFELT $ 143)))
                                                 1)
                                                (QREFELT $ 150))
                                      (QREFELT $ 151))
                            . #9#)))))
                  (LETT |n| (QCSIZE |t|) . #9#)
                  (COND
                   ((EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 148)) -1)
                    (SEQ
                     (LETT |t|
                           (SPADCALL |t| (|STR_to_CHAR| #10#) (QREFELT $ 152))
                           . #9#)
                     (EXIT (COND ((EQUAL |t| "") (LETT |t| "0" . #9#))))))
                   ((SPADCALL |n| |p| (QREFELT $ 64))
                    (LETT |t|
                          (SPADCALL |t|
                                    (SPADCALL (SPADCALL |t| (QREFELT $ 143))
                                              (-
                                               (+ |p|
                                                  (SPADCALL |t|
                                                            (QREFELT $ 143)))
                                               1)
                                              (QREFELT $ 150))
                                    (QREFELT $ 151))
                          . #9#))
                   (#8#
                    (LETT |t|
                          (STRCONC |t|
                                   (|make_full_CVEC|
                                    (PROG1 (LETT #1# (- |p| |n|) . #9#)
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))
                                    (|STR_to_CHAR| #10#)))
                          . #9#)))
                  (EXIT
                   (STRCONC (|FLOAT;padFromRight| |s| $)
                            (STRCONC "." (|FLOAT;padFromLeft| |t| $))))))))))) 

(SDEFUN |FLOAT;floating| ((|f| $) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|o| (|Integer|)) (|n| (|NonNegativeInteger|))
          (|e| (|Integer|)) (|m| (|Integer|)) (|g| ($)) (|d| (|Integer|))
          (|t| (|String|)))
         (SEQ
          (COND ((SPADCALL |f| (QREFELT $ 26)) "0.0")
                ((SPADCALL |f| (QREFELT $ 28))
                 (STRCONC "-"
                          (|FLOAT;floating| (SPADCALL |f| (QREFELT $ 48)) $)))
                (#1='T
                 (SEQ
                  (LETT |t|
                        (COND
                         ((ZEROP (SPADCALL (QREFELT $ 135) (QREFELT $ 142)))
                          "E")
                         (#1# " E "))
                        . #2=(|FLOAT;floating|))
                  (EXIT
                   (COND
                    ((ZEROP (SPADCALL |f| (QREFELT $ 19)))
                     (SEQ
                      (LETT |s| (STRINGIMAGE (SPADCALL |f| (QREFELT $ 17)))
                            . #2#)
                      (EXIT
                       (SPADCALL
                        (LIST "0." (|FLOAT;padFromLeft| |s| $) |t|
                              (STRINGIMAGE (QCSIZE |s|)))
                        (QREFELT $ 38)))))
                    (#1#
                     (SEQ
                      (LETT |d|
                            (COND
                             ((EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 148))
                                   -1)
                              (SPADCALL (QREFELT $ 106)))
                             (#1# (SPADCALL (QREFELT $ 141) (QREFELT $ 148))))
                            . #2#)
                      (LETT |g| (|FLOAT;convert10| |f| |d| $) . #2#)
                      (LETT |m| (QCAR |g|) . #2#) (LETT |e| (QCDR |g|) . #2#)
                      (LETT |s| (STRINGIMAGE |m|) . #2#)
                      (LETT |n| (QCSIZE |s|) . #2#)
                      (LETT |o| (+ |e| |n|) . #2#)
                      (LETT |s| (|FLOAT;padFromLeft| |s| $) . #2#)
                      (EXIT
                       (SPADCALL (LIST "0." |s| |t| (STRINGIMAGE |o|))
                                 (QREFELT $ 38))))))))))))) 

(SDEFUN |FLOAT;general| ((|f| $) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|t| (|String|)) (#1=#:G1276 NIL) (#2=#:G1269 NIL)
          (#3=#:G1267 NIL) (|o| (|Integer|)) (|n| (|NonNegativeInteger|))
          (|e| (|Integer|)) (|m| (|Integer|)) (|g| ($)) (#4=#:G1287 NIL)
          (|d| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |f| (QREFELT $ 26)) "0.0")
                ((SPADCALL |f| (QREFELT $ 28))
                 (STRCONC "-"
                          (|FLOAT;general| (SPADCALL |f| (QREFELT $ 48)) $)))
                (#5='T
                 (SEQ
                  (LETT |d|
                        (COND
                         ((EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 148)) -1)
                          (SPADCALL (QREFELT $ 106)))
                         (#5# (SPADCALL (QREFELT $ 141) (QREFELT $ 148))))
                        . #6=(|FLOAT;general|))
                  (EXIT
                   (COND
                    ((ZEROP (SPADCALL |f| (QREFELT $ 19)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |d| (+ |d| 1) . #6#)
                            (LETT |s|
                                  (STRINGIMAGE (SPADCALL |f| (QREFELT $ 17)))
                                  . #6#)
                            (COND
                             ((SPADCALL
                               (SPADCALL (QREFELT $ 141) (QREFELT $ 148)) -1
                               (QREFELT $ 60))
                              (SEQ (LETT |e| (QCSIZE |s|) . #6#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |e| |d| (QREFELT $ 64))
                                      (PROGN
                                       (LETT #4#
                                             (SEQ
                                              (LETT |t|
                                                    (COND
                                                     ((ZEROP
                                                       (SPADCALL
                                                        (QREFELT $ 135)
                                                        (QREFELT $ 142)))
                                                      "E")
                                                     (#5# " E "))
                                                    . #6#)
                                              (EXIT
                                               (SPADCALL
                                                (LIST "0."
                                                      (|FLOAT;padFromLeft| |s|
                                                       $)
                                                      |t| (STRINGIMAGE |e|))
                                                (QREFELT $ 38))))
                                             . #6#)
                                       (GO #7=#:G1266))))))))
                            (EXIT
                             (|FLOAT;padFromRight| (STRCONC |s| ".0") $))))
                      #7# (EXIT #4#)))
                    (#5#
                     (SEQ (LETT |g| (|FLOAT;convert10| |f| |d| $) . #6#)
                          (LETT |m| (QCAR |g|) . #6#)
                          (LETT |e| (QCDR |g|) . #6#)
                          (LETT |s| (STRINGIMAGE |m|) . #6#)
                          (LETT |n| (QCSIZE |s|) . #6#)
                          (LETT |o| (+ |n| |e|) . #6#)
                          (EXIT
                           (COND
                            ((SPADCALL |o| 0 (QREFELT $ 64))
                             (COND
                              ((SPADCALL |o| (MAX |n| |d|) (QREFELT $ 98))
                               (SEQ
                                (COND
                                 ((SPADCALL |o| |n| (QREFELT $ 64))
                                  (LETT |s|
                                        (STRCONC |s|
                                                 (|make_full_CVEC|
                                                  (PROG1
                                                      (LETT #3# (- |o| |n|)
                                                            . #6#)
                                                    (|check_subtype2|
                                                     (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#))
                                                  (|STR_to_CHAR| #8="0")))
                                        . #6#)))
                                (LETT |t|
                                      (SPADCALL
                                       (SPADCALL |s|
                                                 (SPADCALL
                                                  (+ |o|
                                                     (SPADCALL |s|
                                                               (QREFELT $
                                                                        143)))
                                                  (-
                                                   (+ |n|
                                                      (SPADCALL |s|
                                                                (QREFELT $
                                                                         143)))
                                                   1)
                                                  (QREFELT $ 150))
                                                 (QREFELT $ 151))
                                       (|STR_to_CHAR| #8#) (QREFELT $ 152))
                                      . #6#)
                                (COND ((EQUAL |t| "") (LETT |t| "0" . #6#))
                                      (#5#
                                       (LETT |t| (|FLOAT;padFromLeft| |t| $)
                                             . #6#)))
                                (LETT |s|
                                      (|FLOAT;padFromRight|
                                       (SPADCALL |s|
                                                 (SPADCALL
                                                  (SPADCALL |s|
                                                            (QREFELT $ 143))
                                                  (-
                                                   (+ |o|
                                                      (SPADCALL |s|
                                                                (QREFELT $
                                                                         143)))
                                                   1)
                                                  (QREFELT $ 150))
                                                 (QREFELT $ 151))
                                       $)
                                      . #6#)
                                (EXIT (STRCONC |s| (STRCONC "." |t|)))))
                              ((SPADCALL |o| 0 (QREFELT $ 98))
                               (COND
                                ((>= |o| -5)
                                 (STRCONC #9="0."
                                          (|FLOAT;padFromLeft|
                                           (STRCONC
                                            (|make_full_CVEC|
                                             (PROG1 (LETT #2# (- |o|) . #6#)
                                               (|check_subtype2| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #2#))
                                             (|STR_to_CHAR| #8#))
                                            (SPADCALL |s| (|STR_to_CHAR| #8#)
                                                      (QREFELT $ 152)))
                                           $)))
                                (#5#
                                 (SEQ
                                  (LETT |t|
                                        (|FLOAT;padFromLeft|
                                         (SPADCALL |s| (|STR_to_CHAR| #8#)
                                                   (QREFELT $ 152))
                                         $)
                                        . #6#)
                                  (LETT |s|
                                        (COND
                                         ((ZEROP
                                           (SPADCALL (QREFELT $ 135)
                                                     (QREFELT $ 142)))
                                          #10="E")
                                         (#5# #11=" E "))
                                        . #6#)
                                  (EXIT
                                   (SPADCALL
                                    (LIST #12="0." |t| |s|
                                          (STRINGIMAGE (+ |e| |n|)))
                                    (QREFELT $ 38)))))))
                              (#5#
                               (SEQ
                                (LETT |t|
                                      (|FLOAT;padFromLeft|
                                       (SPADCALL |s| (|STR_to_CHAR| #8#)
                                                 (QREFELT $ 152))
                                       $)
                                      . #6#)
                                (LETT |s|
                                      (COND
                                       ((ZEROP
                                         (SPADCALL (QREFELT $ 135)
                                                   (QREFELT $ 142)))
                                        #10#)
                                       (#5# #11#))
                                      . #6#)
                                (EXIT
                                 (SPADCALL
                                  (LIST #12# |t| |s| (STRINGIMAGE (+ |e| |n|)))
                                  (QREFELT $ 38)))))))
                            ((SPADCALL |o| 0 (QREFELT $ 98))
                             (COND
                              ((>= |o| -5)
                               (STRCONC #9#
                                        (|FLOAT;padFromLeft|
                                         (STRCONC
                                          (|make_full_CVEC|
                                           (PROG1 (LETT #1# (- |o|) . #6#)
                                             (|check_subtype2| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #1#))
                                           (|STR_to_CHAR| #8#))
                                          (SPADCALL |s| (|STR_to_CHAR| #8#)
                                                    (QREFELT $ 152)))
                                         $)))
                              (#5#
                               (SEQ
                                (LETT |t|
                                      (|FLOAT;padFromLeft|
                                       (SPADCALL |s| (|STR_to_CHAR| #8#)
                                                 (QREFELT $ 152))
                                       $)
                                      . #6#)
                                (LETT |s|
                                      (COND
                                       ((ZEROP
                                         (SPADCALL (QREFELT $ 135)
                                                   (QREFELT $ 142)))
                                        #10#)
                                       (#5# #11#))
                                      . #6#)
                                (EXIT
                                 (SPADCALL
                                  (LIST #12# |t| |s| (STRINGIMAGE (+ |e| |n|)))
                                  (QREFELT $ 38)))))))
                            (#5#
                             (SEQ
                              (LETT |t|
                                    (|FLOAT;padFromLeft|
                                     (SPADCALL |s| (|STR_to_CHAR| #8#)
                                               (QREFELT $ 152))
                                     $)
                                    . #6#)
                              (LETT |s|
                                    (COND
                                     ((ZEROP
                                       (SPADCALL (QREFELT $ 135)
                                                 (QREFELT $ 142)))
                                      #10#)
                                     (#5# #11#))
                                    . #6#)
                              (EXIT
                               (SPADCALL
                                (LIST #12# |t| |s| (STRINGIMAGE (+ |e| |n|)))
                                (QREFELT $ 38))))))))))))))))) 

(SDEFUN |FLOAT;outputSpacing;NniV;105| ((|n| |NonNegativeInteger|) ($ |Void|))
        (SPADCALL (QREFELT $ 135) |n| (QREFELT $ 153))) 

(SDEFUN |FLOAT;outputFixed;V;106| (($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 138) "fixed" (QREFELT $ 155))
             (EXIT (SPADCALL (QREFELT $ 141) -1 (QREFELT $ 156))))) 

(SDEFUN |FLOAT;outputFixed;NniV;107| ((|n| |NonNegativeInteger|) ($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 138) "fixed" (QREFELT $ 155))
             (EXIT (SPADCALL (QREFELT $ 141) |n| (QREFELT $ 156))))) 

(SDEFUN |FLOAT;outputGeneral;V;108| (($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 138) "general" (QREFELT $ 155))
             (EXIT (SPADCALL (QREFELT $ 141) -1 (QREFELT $ 156))))) 

(SDEFUN |FLOAT;outputGeneral;NniV;109| ((|n| |NonNegativeInteger|) ($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 138) "general" (QREFELT $ 155))
             (EXIT (SPADCALL (QREFELT $ 141) |n| (QREFELT $ 156))))) 

(SDEFUN |FLOAT;outputFloating;V;110| (($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 138) "floating" (QREFELT $ 155))
             (EXIT (SPADCALL (QREFELT $ 141) -1 (QREFELT $ 156))))) 

(SDEFUN |FLOAT;outputFloating;NniV;111| ((|n| |NonNegativeInteger|) ($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 138) "floating" (QREFELT $ 155))
             (EXIT (SPADCALL (QREFELT $ 141) |n| (QREFELT $ 156))))) 

(SDEFUN |FLOAT;convert;$S;112| ((|f| $) ($ |String|))
        (SPROG
         ((#1=#:G1307 NIL) (|s| (|String|)) (|b| (|Integer|)) (#2=#:G1302 NIL))
         (SEQ
          (LETT |b|
                (SEQ
                 (COND
                  ((EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 148)) -1)
                   (COND
                    ((NULL (SPADCALL |f| (QREFELT $ 26)))
                     (EXIT
                      (SPADCALL
                       (PROG1
                           (LETT #2#
                                 (INTEGER-LENGTH
                                  (ABS (SPADCALL |f| (QREFELT $ 17))))
                                 . #3=(|FLOAT;convert;$S;112|))
                         (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                           '(|Integer|) #2#))
                       (QREFELT $ 63)))))))
                 (EXIT 0))
                . #3#)
          (LETT |s|
                (COND
                 ((EQUAL (SPADCALL (QREFELT $ 138) (QREFELT $ 163)) "fixed")
                  (|FLOAT;fixed| |f| $))
                 ((EQUAL (SPADCALL (QREFELT $ 138) (QREFELT $ 163)) "floating")
                  (|FLOAT;floating| |f| $))
                 ((EQUAL (SPADCALL (QREFELT $ 138) (QREFELT $ 163)) "general")
                  (|FLOAT;general| |f| $))
                 (#4='T (|make_full_CVEC| 0)))
                . #3#)
          (COND
           ((SPADCALL |b| 0 (QREFELT $ 64))
            (SPADCALL
             (PROG1 (LETT #1# |b| . #3#)
               (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                 #1#))
             (QREFELT $ 63))))
          (EXIT
           (COND ((EQUAL |s| (|make_full_CVEC| 0)) (|error| "bad output mode"))
                 (#4# |s|)))))) 

(SDEFUN |FLOAT;coerce;$Of;113| ((|f| $) ($ |OutputForm|))
        (COND
         ((SPADCALL |f| (|spadConstant| $ 27) (QREFELT $ 165))
          (SPADCALL (SPADCALL |f| (QREFELT $ 164)) (QREFELT $ 167)))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 29)) (QREFELT $ 168))
                    (QREFELT $ 169))))) 

(SDEFUN |FLOAT;convert;$If;114| ((|f| $) ($ |InputForm|))
        (SPADCALL
         (LIST (SPADCALL '|float| (QREFELT $ 172))
               (SPADCALL (SPADCALL |f| (QREFELT $ 17)) (QREFELT $ 174))
               (SPADCALL (SPADCALL |f| (QREFELT $ 19)) (QREFELT $ 174))
               (SPADCALL (SPADCALL (QREFELT $ 109)) (QREFELT $ 173)))
         (QREFELT $ 175))) 

(PUT '|FLOAT;convert;2$;115| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |FLOAT;convert;2$;115| ((|x| $) ($ |Float|)) |x|) 

(SDEFUN |FLOAT;convert;$Df;116| ((|x| $) ($ |DoubleFloat|))
        (|makeSF| (QCAR |x|) (QCDR |x|))) 

(SDEFUN |FLOAT;coerce;$Df;117| ((|x| $) ($ |DoubleFloat|))
        (SPADCALL |x| (QREFELT $ 180))) 

(SDEFUN |FLOAT;convert;Df$;118| ((|sf| |DoubleFloat|) ($ $))
        (SPADCALL (SPADCALL |sf| (QREFELT $ 182))
                  (SPADCALL |sf| (QREFELT $ 183)) (FLOAT-RADIX 0.0)
                  (QREFELT $ 114))) 

(SDEFUN |FLOAT;retract;$F;119| ((|f| $) ($ |Fraction| (|Integer|)))
        (SPROG ((#1=#:G1319 NIL))
               (SPADCALL |f|
                         (PROG1
                             (LETT #1# (- (SPADCALL (QREFELT $ 51)) 1)
                                   |FLOAT;retract;$F;119|)
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         2 (QREFELT $ 185)))) 

(SDEFUN |FLOAT;retractIfCan;$U;120|
        ((|f| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG ((#1=#:G1325 NIL))
               (CONS 0
                     (SPADCALL |f|
                               (PROG1
                                   (LETT #1# (- (SPADCALL (QREFELT $ 51)) 1)
                                         |FLOAT;retractIfCan;$U;120|)
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               2 (QREFELT $ 185))))) 

(SDEFUN |FLOAT;retract;$I;121| ((|f| $) ($ |Integer|))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |f| (QREFELT $ 52)) |FLOAT;retract;$I;121|)
                (EXIT
                 (COND
                  ((SPADCALL |f| (SPADCALL |n| (QREFELT $ 189)) (QREFELT $ 32))
                   |n|)
                  ('T (|error| "Not an integer"))))))) 

(SDEFUN |FLOAT;retractIfCan;$U;122| ((|f| $) ($ |Union| (|Integer|) "failed"))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |f| (QREFELT $ 52))
                      |FLOAT;retractIfCan;$U;122|)
                (EXIT
                 (COND
                  ((SPADCALL |f| (SPADCALL |n| (QREFELT $ 189)) (QREFELT $ 32))
                   (CONS 0 |n|))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |FLOAT;rationalApproximation;$NniF;123|
        ((|f| $) (|d| |NonNegativeInteger|) ($ |Fraction| (|Integer|)))
        (SPADCALL |f| |d| 10 (QREFELT $ 185))) 

(SDEFUN |FLOAT;rationalApproximation;$2NniF;124|
        ((|f| $) (|d| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Fraction| (|Integer|)))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|#G222| #3=(|Integer|))
          (|#G221| #1#) (|q1| #4=(|Integer|)) (|q0| #4#)
          (|#G220| #5=(|Integer|)) (|#G219| #4#) (|p1| #4#) (|p0| #4#)
          (|#G218| #5#) (|#G217| #4#) (#6=#:G1356 NIL) (|q2| #5#) (|p2| #5#)
          (|r| #3#) (|q| #7=(|Integer|))
          (|#G216| (|Record| (|:| |quotient| #7#) (|:| |remainder| #3#)))
          (|tol| (|NonNegativeInteger|)) (|de| (|PositiveInteger|))
          (#8=#:G1348 NIL) (#9=#:G1346 NIL) (|ex| (|Integer|)) (|nu| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |nu| (QCAR |f|)
                  . #10=(|FLOAT;rationalApproximation;$2NniF;124|))
            (LETT |ex| (QCDR |f|) . #10#)
            (COND
             ((>= |ex| 0)
              (PROGN
               (LETT #6#
                     (SPADCALL
                      (* |nu|
                         (EXPT 2
                               (PROG1 (LETT #9# |ex| . #10#)
                                 (|check_subtype2| (>= #9# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #9#))))
                      1 (QREFELT $ 194))
                     . #10#)
               (GO #11=#:G1355))))
            (LETT |de|
                  (EXPT 2
                        (PROG1 (LETT #8# (- |ex|) . #10#)
                          (|check_subtype2| (>= #8# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #8#)))
                  . #10#)
            (COND ((< |b| 2) (|error| "base must be > 1")))
            (LETT |tol| (EXPT |b| |d|) . #10#) (LETT |s| |nu| . #10#)
            (LETT |t| |de| . #10#) (LETT |p0| 0 . #10#) (LETT |p1| 1 . #10#)
            (LETT |q0| 1 . #10#) (LETT |q1| 0 . #10#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (PROGN
                    (LETT |#G216| (DIVIDE2 |s| |t|) . #10#)
                    (LETT |q| (QCAR |#G216|) . #10#)
                    (LETT |r| (QCDR |#G216|) . #10#)
                    |#G216|)
                   (LETT |p2| (+ (* |q| |p1|) |p0|) . #10#)
                   (LETT |q2| (+ (* |q| |q1|) |q0|) . #10#)
                   (COND
                    ((OR (EQL |r| 0)
                         (<
                          (SPADCALL |tol|
                                    (ABS
                                     (- (* |nu| |q2|)
                                        (SPADCALL |de| |p2| (QREFELT $ 56))))
                                    (QREFELT $ 75))
                          (SPADCALL |de| (ABS |p2|) (QREFELT $ 56))))
                     (PROGN
                      (LETT #6# (SPADCALL |p2| |q2| (QREFELT $ 194)) . #10#)
                      (GO #11#))))
                   (PROGN
                    (LETT |#G217| |p1| . #10#)
                    (LETT |#G218| |p2| . #10#)
                    (LETT |p0| |#G217| . #10#)
                    (LETT |p1| |#G218| . #10#))
                   (PROGN
                    (LETT |#G219| |q1| . #10#)
                    (LETT |#G220| |q2| . #10#)
                    (LETT |q0| |#G219| . #10#)
                    (LETT |q1| |#G220| . #10#))
                   (EXIT
                    (PROGN
                     (LETT |#G221| |t| . #10#)
                     (LETT |#G222| |r| . #10#)
                     (LETT |s| |#G221| . #10#)
                     (LETT |t| |#G222| . #10#))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #11# (EXIT #6#)))) 

(SDEFUN |FLOAT;hashUpdate!;Hs$Hs;125|
        ((|s| |HashState|) (|x| $) ($ |HashState|))
        (SPROG
         ((|e| (|Integer|)) (|m| (|Integer|)) (#1=#:G1359 NIL)
          (|tmp| (|Union| (|Integer|) #2="failed")))
         (SEQ (LETT |m| (QCAR |x|) . #3=(|FLOAT;hashUpdate!;Hs$Hs;125|))
              (LETT |e| (QCDR |x|) . #3#)
              (SEQ G190
                   (COND
                    ((NULL
                      (QEQCAR
                       (LETT |tmp| (SPADCALL |m| 2 (QREFELT $ 195)) . #3#) 0))
                     (GO G191)))
                   (SEQ
                    (LETT |m|
                          (PROG2 (LETT #1# |tmp| . #3#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                            (|Union| (|Integer|) #2#) #1#))
                          . #3#)
                    (EXIT (LETT |e| (+ |e| 1) . #3#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |s| (SPADCALL |s| |m| (QREFELT $ 197)) . #3#)
              (EXIT (SPADCALL |s| |e| (QREFELT $ 197)))))) 

(DECLAIM (NOTINLINE |Float;|)) 

(DEFUN |Float| ()
  (SPROG NIL
         (PROG (#1=#:G1389)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Float|) . #2=(|Float|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Float|
                             (LIST (CONS NIL (CONS 1 (|Float;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Float|)))))))))) 

(DEFUN |Float;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Float|) . #1=(|Float|))
          (LETT $ (GETREFV 212) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Float| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (AND (|HasCategory| $ '(|arbitraryPrecision|))
               (|augmentPredVector| $ 1))
          (AND (|not| (|HasCategory| $ '(|arbitraryExponent|)))
               (|not| (|HasCategory| $ '(|arbitraryPrecision|)))
               (|augmentPredVector| $ 2))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (SPADCALL 68 (QREFELT $ 8)))
          (QSETREFV $ 10
                    (|Record| (|:| |mantissa| (|Integer|))
                              (|:| |exponent| (|Integer|))))
          (QSETREFV $ 70 (CONS 1 (CONS 1 2)))
          (QSETREFV $ 88 (CONS 1 (|spadConstant| $ 31)))
          (QSETREFV $ 90 (CONS 1 (CONS 1 1)))
          (QSETREFV $ 101 (CONS 1 (CONS 1 1)))
          (QSETREFV $ 135 (SPADCALL 10 (QREFELT $ 134)))
          (QSETREFV $ 138 (SPADCALL "general" (QREFELT $ 137)))
          (QSETREFV $ 141 (SPADCALL -1 (QREFELT $ 140)))
          $))) 

(MAKEPROP '|Float| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|PositiveInteger|) (|Reference| 6)
              (0 . |ref|) 'BITS '|Rep| (|Void|) (|OpenMathDevice|)
              (5 . |OMputApp|) (|String|) (10 . |OMputSymbol|) (|Integer|)
              |FLOAT;mantissa;$I;50| (17 . |OMputInteger|)
              |FLOAT;exponent;$I;51| (23 . |OMputEndApp|) (28 . |OMputObject|)
              (33 . |OMputEndObject|) (|Boolean|) |FLOAT;OMwrite;Omd$BV;2|
              (38 . |sign|) |FLOAT;zero?;$B;53|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |FLOAT;Zero;$;47|) $))
              |FLOAT;negative?;$B;54| |FLOAT;-;2$;72| |FLOAT;asin;2$;4|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FLOAT;One;$;48|) $))
              |FLOAT;=;2$B;61| |FLOAT;pi;$;15| |FLOAT;/;$I$;81| (43 . >)
              (49 . |toString|) (|List| $) (54 . |concat|)
              |FLOAT;increasePrecision;IPi;40| |FLOAT;sqrt;2$;35|
              |FLOAT;/;3$;80| |FLOAT;atan;2$;7|
              |FLOAT;decreasePrecision;IPi;41| |FLOAT;normalize;2$;59|
              |FLOAT;acos;2$;5| |FLOAT;-;3$;75| |FLOAT;<;2$B;62|
              |FLOAT;abs;2$;63| |FLOAT;atan;3$;6| (59 . |fractionPart|)
              |FLOAT;bits;Pi;36| |FLOAT;wholePart;$I;65| (|IntegerRoots| 16)
              (64 . |approxSqrt|) |FLOAT;order;$I;45| (69 . *) |FLOAT;*;3$;78|
              |FLOAT;+;3$;74| |FLOAT;shift;$I$;60| (75 . ~=) |FLOAT;sign;$I;68|
              (81 . *) |FLOAT;bits;2Pi;37| (87 . >) (93 . ^) |FLOAT;*;I2$;79|
              |FLOAT;sin;2$;10| |FLOAT;cos;2$;12| |FLOAT;tan;2$;14| 'P
              |FLOAT;precision;Pi;38| (99 . <=) (105 . ^)
              (|NonNegativeInteger|) (111 . *) (117 . *) (123 . ^)
              |FLOAT;exp;2$;29| |FLOAT;sinh;2$;17| |FLOAT;cosh;2$;18|
              |FLOAT;tanh;2$;19| |FLOAT;log;2$;23| |FLOAT;asinh;2$;20|
              |FLOAT;acosh;2$;21| |FLOAT;atanh;2$;22| |FLOAT;log2;$;25|
              |FLOAT;^;$I$;90| 'L2 (129 . <=) 'L10 |FLOAT;log10;$;26|
              |FLOAT;log2;2$;27| |FLOAT;log10;2$;28| |FLOAT;exp1;$;34|
              (|List| (|List| 16)) (|Matrix| 16) (135 . |matrix|) (140 . <=)
              (146 . |elt|) (153 . *) 'E (159 . >) (165 . |elt|)
              (170 . |setelt!|) |FLOAT;precision;2Pi;39| |FLOAT;digits;Pi;43|
              |FLOAT;digits;2Pi;44| |FLOAT;relerror;3$;46| |FLOAT;base;Pi;49|
              |FLOAT;one?;$B;52| (176 . |positive?|) |FLOAT;positive?;$B;55|
              |FLOAT;float;2I$;57| |FLOAT;float;2IPi$;58| (181 . >)
              |FLOAT;floor;2$;66| |FLOAT;truncate;2$;69| |FLOAT;ceiling;2$;64|
              |FLOAT;round;2$;67| (|Union| $ '"failed") |FLOAT;recip;$U;70|
              |FLOAT;differentiate;2$;71| |FLOAT;inv;2$;82| |FLOAT;^;3$;88|
              (|Fraction| 16) (187 . |Zero|) (191 . =) (197 . <) (203 . |One|)
              (207 . |numer|) (212 . |denom|) |FLOAT;^;$F$;89| (|Reference| 74)
              (217 . |ref|) 'SPACING (|Reference| 14) (222 . |ref|) 'OUTMODE
              (|Reference| 16) (227 . |ref|) 'OUTPREC (232 . |elt|)
              (237 . |minIndex|) (|Character|) (242 . |elt|) (248 . |setelt!|)
              (255 . |maxIndex|) (260 . |elt|) (|UniversalSegment| 16)
              (265 . SEGMENT) (271 . |elt|) (277 . |rightTrim|)
              (283 . |setelt!|) |FLOAT;outputSpacing;NniV;105|
              (289 . |setelt!|) (295 . |setelt!|) |FLOAT;outputFixed;V;106|
              |FLOAT;outputFixed;NniV;107| |FLOAT;outputGeneral;V;108|
              |FLOAT;outputGeneral;NniV;109| |FLOAT;outputFloating;V;110|
              |FLOAT;outputFloating;NniV;111| (301 . |elt|)
              |FLOAT;convert;$S;112| (306 . >=) (|OutputForm|)
              (312 . |message|) |FLOAT;coerce;$Of;113| (317 . -) (|Symbol|)
              (|InputForm|) (322 . |convert|) (327 . |convert|)
              (332 . |convert|) (337 . |convert|) |FLOAT;convert;$If;114|
              (|Float|) |FLOAT;convert;2$;115| (|DoubleFloat|)
              |FLOAT;convert;$Df;116| |FLOAT;coerce;$Df;117| (342 . |mantissa|)
              (347 . |exponent|) |FLOAT;convert;Df$;118|
              |FLOAT;rationalApproximation;$2NniF;124| |FLOAT;retract;$F;119|
              (|Union| 125 '"failed") |FLOAT;retractIfCan;$U;120|
              (352 . |coerce|) |FLOAT;retract;$I;121| (|Union| 16 '"failed")
              |FLOAT;retractIfCan;$U;122|
              |FLOAT;rationalApproximation;$NniF;123| (357 . /) (363 . |exquo|)
              (|HashState|) (369 . |hashUpdate!|) |FLOAT;hashUpdate!;Hs$Hs;125|
              (|PatternMatchResult| 177 $) (|Pattern| 177) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 202 '#1="failed") (|Union| 37 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 37) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|SingleInteger|))
           '#(~= 375 |zero?| 381 |wholePart| 386 |unitNormal| 391
              |unitCanonical| 396 |unit?| 401 |truncate| 406 |toString| 411
              |tanh| 422 |tan| 427 |subtractIfCan| 432 |squareFreePart| 438
              |squareFree| 443 |sqrt| 448 |smaller?| 453 |sizeLess?| 459 |sinh|
              465 |sin| 470 |sign| 475 |shift| 480 |sech| 486 |sec| 491
              |sample| 496 |round| 500 |rightRecip| 505 |rightPower| 510
              |retractIfCan| 522 |retract| 532 |rem| 542 |relerror| 548 |recip|
              554 |rationalApproximation| 559 |quo| 572 |principalIdeal| 578
              |prime?| 583 |precision| 588 |positive?| 597 |pi| 602
              |patternMatch| 606 |outputSpacing| 613 |outputGeneral| 618
              |outputFloating| 627 |outputFixed| 636 |order| 645 |opposite?|
              650 |one?| 656 |nthRoot| 661 |normalize| 667 |norm| 672
              |negative?| 677 |multiEuclidean| 682 |min| 688 |max| 698
              |mantissa| 708 |log2| 713 |log10| 722 |log| 731 |leftRecip| 736
              |leftPower| 741 |lcmCoef| 753 |lcm| 759 |latex| 770 |inv| 775
              |increasePrecision| 780 |hashUpdate!| 785 |hash| 791
              |gcdPolynomial| 796 |gcd| 802 |fractionPart| 813 |floor| 818
              |float| 823 |factor| 836 |extendedEuclidean| 841 |exquo| 854
              |expressIdealMember| 860 |exponent| 866 |exp1| 871 |exp| 875
              |euclideanSize| 880 |divide| 885 |digits| 891 |differentiate| 900
              |decreasePrecision| 911 |csch| 916 |csc| 921 |coth| 926 |cot| 931
              |cosh| 936 |cos| 941 |convert| 946 |commutator| 976 |coerce| 982
              |characteristic| 1007 |ceiling| 1011 |bits| 1016 |base| 1025
              |atanh| 1029 |atan| 1034 |associator| 1045 |associates?| 1052
              |asinh| 1058 |asin| 1063 |asech| 1068 |asec| 1073
              |antiCommutator| 1078 |annihilate?| 1084 |acsch| 1090 |acsc| 1095
              |acoth| 1100 |acot| 1105 |acosh| 1110 |acos| 1115 |abs| 1120 ^
              1125 |Zero| 1155 |One| 1159 |OMwrite| 1163 D 1187 >= 1198 > 1204
              = 1210 <= 1216 < 1222 / 1228 - 1240 + 1251 * 1257)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0))
            (CONS
             '#(|FloatingPointSystem&| |RealNumberSystem&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| NIL |OrderedRing&| |DivisionRing&| NIL NIL
                |DifferentialRing&| NIL |Algebra&| |EntireRing&| |Algebra&| NIL
                |Rng&| NIL |Module&| |Module&| NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL |AbelianGroup&| NIL NIL NIL NIL |OrderedSet&| NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&| NIL
                NIL |Magma&| |AbelianSemiGroup&|
                |TranscendentalFunctionCategory&| NIL |SetCategory&| NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL |OpenMath&| NIL NIL
                NIL |RadicalCategory&| |RetractableTo&| |RetractableTo&| NIL
                NIL |PartialOrder&| NIL NIL NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|FloatingPointSystem|) (|RealNumberSystem|) (|Field|)
                 (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|DivisionRing|) (|CommutativeRing|)
                 (|LeftOreRing|) (|DifferentialRing|) (|CharacteristicZero|)
                 (|Algebra| 125) (|EntireRing|) (|Algebra| $$) (|Ring|) (|Rng|)
                 (|SemiRing|) (|Module| 125) (|Module| $$) (|SemiRng|)
                 (|OrderedAbelianGroup|) (|BiModule| 125 125)
                 (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| 125)
                 (|LeftModule| 125) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|PatternMatchable| 177) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|TranscendentalFunctionCategory|)
                 (|RealConstant|) (|SetCategory|) (|arbitraryExponent|)
                 (|arbitraryPrecision|) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|ConvertibleTo| 171)
                 (|CoercibleTo| 179) (|OpenMath|) (|ConvertibleTo| 14)
                 (|Approximate|) (|ConvertibleTo| 200) (|RadicalCategory|)
                 (|RetractableTo| 125) (|RetractableTo| 16)
                 (|ConvertibleTo| 177) (|ConvertibleTo| 179) (|PartialOrder|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 166))
              (|makeByteWordVec2| 211
                                  '(1 7 0 6 8 1 12 11 0 13 3 12 11 0 14 14 15 2
                                    12 11 0 16 18 1 12 11 0 20 1 12 11 0 21 1
                                    12 11 0 22 1 16 16 0 25 2 0 23 0 0 35 1 0
                                    14 0 36 1 14 0 37 38 1 0 0 0 50 1 53 16 16
                                    54 2 16 0 6 0 56 2 16 23 0 0 60 2 0 0 6 0
                                    62 2 16 23 0 0 64 2 0 0 0 6 65 2 6 23 0 0
                                    72 2 6 0 0 6 73 2 16 0 74 0 75 2 74 0 6 0
                                    76 2 74 0 0 6 77 2 74 23 0 0 89 1 96 0 95
                                    97 2 16 23 0 0 98 3 96 16 0 16 16 99 2 96 0
                                    0 0 100 2 6 23 0 0 102 1 7 6 0 103 2 7 6 0
                                    6 104 1 16 23 0 111 2 74 23 0 0 115 0 125 0
                                    126 2 125 23 0 0 127 2 125 23 0 0 128 0 125
                                    0 129 1 125 16 0 130 1 125 16 0 131 1 133 0
                                    74 134 1 136 0 14 137 1 139 0 16 140 1 133
                                    74 0 142 1 14 16 0 143 2 14 144 0 16 145 3
                                    14 144 0 16 144 146 1 14 16 0 147 1 139 16
                                    0 148 2 149 0 16 16 150 2 14 0 0 149 151 2
                                    14 0 0 144 152 2 133 74 0 74 153 2 136 14 0
                                    14 155 2 139 16 0 16 156 1 136 14 0 163 2 0
                                    23 0 0 165 1 166 0 14 167 1 166 0 0 169 1
                                    171 0 170 172 1 6 171 0 173 1 16 171 0 174
                                    1 171 0 37 175 1 179 16 0 182 1 179 16 0
                                    183 1 0 0 16 189 2 125 0 16 16 194 2 16 120
                                    0 0 195 2 16 196 196 0 197 2 0 23 0 0 1 1 0
                                    23 0 26 1 0 16 0 52 1 0 210 0 1 1 0 0 0 1 1
                                    0 23 0 1 1 0 0 0 117 2 0 14 0 74 1 1 0 14 0
                                    36 1 0 0 0 81 1 0 0 0 69 2 0 120 0 0 1 1 0
                                    0 0 1 1 0 201 0 1 1 0 0 0 40 2 0 23 0 0 1 2
                                    0 23 0 0 1 1 0 0 0 79 1 0 0 0 67 1 0 16 0
                                    61 2 0 0 0 16 59 1 0 0 0 1 1 0 0 0 1 0 0 0
                                    1 1 0 0 0 119 1 0 120 0 1 2 0 0 0 74 1 2 0
                                    0 0 6 1 1 0 187 0 188 1 0 191 0 192 1 0 125
                                    0 186 1 0 16 0 190 2 0 0 0 0 1 2 0 0 0 0
                                    108 1 0 120 0 121 3 0 125 0 74 74 185 2 0
                                    125 0 74 193 2 0 0 0 0 1 1 0 207 37 1 1 0
                                    23 0 1 1 1 6 6 105 0 0 6 71 1 0 23 0 112 0
                                    0 0 33 3 0 199 0 200 199 1 1 0 11 74 154 1
                                    0 11 74 160 0 0 11 159 0 0 11 161 1 0 11 74
                                    162 0 0 11 157 1 0 11 74 158 1 0 16 0 55 2
                                    0 23 0 0 1 1 0 23 0 110 2 0 0 0 16 1 1 0 0
                                    0 44 1 0 0 0 1 1 0 23 0 28 2 0 204 37 0 1 0
                                    2 0 1 2 0 0 0 0 1 0 2 0 1 2 0 0 0 0 1 1 0
                                    16 0 17 1 0 0 0 92 0 0 0 86 1 0 0 0 93 0 0
                                    0 91 1 0 0 0 82 1 0 120 0 1 2 0 0 0 74 1 2
                                    0 0 0 6 1 2 0 209 0 0 1 2 0 0 0 0 1 1 0 0
                                    37 1 1 0 14 0 1 1 0 0 0 123 1 1 6 16 39 2 0
                                    196 196 0 198 1 0 211 0 1 2 0 208 208 208 1
                                    2 0 0 0 0 1 1 0 0 37 1 1 0 0 0 50 1 0 0 0
                                    116 3 0 0 16 16 6 114 2 0 0 16 16 113 1 0
                                    201 0 1 3 0 203 0 0 0 1 2 0 205 0 0 1 2 0
                                    120 0 0 1 2 0 204 37 0 1 1 0 16 0 19 0 0 0
                                    94 1 0 0 0 78 1 0 74 0 1 2 0 206 0 0 1 1 1
                                    6 6 107 0 0 6 106 1 0 0 0 122 2 0 0 0 74 1
                                    1 1 6 16 43 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 80 1 0 0 0 68 1 0 0 179 184
                                    1 0 171 0 176 1 0 14 0 164 1 0 200 0 1 1 0
                                    179 0 180 1 0 177 0 178 2 0 0 0 0 1 1 0 179
                                    0 181 1 0 0 125 1 1 0 0 16 189 1 0 0 0 1 1
                                    0 166 0 168 0 0 74 1 1 0 0 0 118 1 1 6 6 63
                                    0 0 6 51 0 0 6 109 1 0 0 0 85 2 0 0 0 0 49
                                    1 0 0 0 42 3 0 0 0 0 0 1 2 0 23 0 0 1 1 0 0
                                    0 83 1 0 0 0 30 1 0 0 0 1 1 0 0 0 1 2 0 0 0
                                    0 1 2 0 23 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 84 1 0 0 0 45 1 0 0 0
                                    48 2 0 0 0 0 124 2 0 0 0 125 132 2 0 0 0 16
                                    87 2 0 0 0 74 1 2 0 0 0 6 65 0 0 0 27 0 0 0
                                    31 2 0 11 12 0 1 3 0 11 12 0 23 24 2 0 14 0
                                    23 1 1 0 14 0 1 1 0 0 0 1 2 0 0 0 74 1 2 0
                                    23 0 0 165 2 0 23 0 0 35 2 0 23 0 0 32 2 0
                                    23 0 0 1 2 0 23 0 0 47 2 0 0 0 16 34 2 0 0
                                    0 0 41 2 0 0 0 0 46 1 0 0 0 29 2 0 0 0 0 58
                                    2 0 0 125 0 1 2 0 0 0 125 1 2 0 0 74 0 1 2
                                    0 0 16 0 66 2 0 0 0 0 57 2 0 0 6 0 62)))))
           '|lookupComplete|)) 

(MAKEPROP '|Float| 'NILADIC T) 
