
(SDEFUN |INTFACT;squareFree;IF;1| ((|n| I) ($ |Factored| I))
        (SPROG
         ((|y|
           #1=(|List|
               (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                         (|:| |fctr| I) (|:| |xpnt| (|Integer|)))))
          (|v| (|Union| I "failed")) (|m| (I)) (|x| (|Factored| I)) (|lim| (I))
          (#2=#:G745 NIL) (#3=#:G746 NIL) (|l| #1#) (|sv| (|Factored| I))
          (|rec| NIL) (|u| (I)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |n| (|spadConstant| $ 7) (QREFELT $ 11))
              (SEQ
               (LETT |m| (SPADCALL |n| (QREFELT $ 12))
                     . #4=(|INTFACT;squareFree;IF;1|))
               (EXIT
                (LETT |u| (SPADCALL (|spadConstant| $ 13) (QREFELT $ 12))
                      . #4#))))
             (#5='T
              (SEQ (LETT |m| |n| . #4#)
                   (EXIT (LETT |u| (|spadConstant| $ 13) . #4#)))))
            (COND
             ((SPADCALL |m| (|spadConstant| $ 13) (QREFELT $ 15))
              (SEQ (LETT |v| (SPADCALL |m| (QREFELT $ 18)) . #4#)
                   (EXIT
                    (COND
                     ((QEQCAR |v| 0)
                      (PROGN
                       (LETT #2#
                             (SEQ
                              (SEQ (LETT |rec| NIL . #4#)
                                   (LETT #3#
                                         (LETT |l|
                                               (SPADCALL
                                                (LETT |sv|
                                                      (SPADCALL (QCDR |v|)
                                                                (QREFELT $ 19))
                                                      . #4#)
                                                (QREFELT $ 23))
                                               . #4#)
                                         . #4#)
                                   G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN
                                          (LETT |rec| (CAR #3#) . #4#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (QSETVELT |rec| 2
                                               (SPADCALL 2 (QVELT |rec| 2)
                                                         (QREFELT $ 26)))))
                                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (SPADCALL
                                (SPADCALL |u| (SPADCALL |sv| (QREFELT $ 27))
                                          (QREFELT $ 28))
                                |l| (QREFELT $ 29))))
                             . #4#)
                       (GO #6=#:G743))))))))
            (LETT |lim|
                  (SPADCALL (|spadConstant| $ 13)
                            (SPADCALL |m| 3 (QREFELT $ 31)) (QREFELT $ 32))
                  . #4#)
            (EXIT
             (COND
              ((SPADCALL |lim| (SPADCALL 100000 (QREFELT $ 33)) (QREFELT $ 15))
               (SPADCALL |u|
                         (SPADCALL (SPADCALL |m| (QREFELT $ 34))
                                   (QREFELT $ 23))
                         (QREFELT $ 29)))
              (#5#
               (SEQ (LETT |x| (|INTFACT;BasicSieve| |m| |lim| $) . #4#)
                    (LETT |y|
                          (SEQ (LETT |m| (SPADCALL |x| (QREFELT $ 27)) . #4#)
                               (EXIT
                                (COND
                                 ((SPADCALL |m| (|spadConstant| $ 13)
                                            (QREFELT $ 35))
                                  (SPADCALL |x| (QREFELT $ 23)))
                                 (#5#
                                  (SEQ
                                   (LETT |v| (SPADCALL |m| (QREFELT $ 18))
                                         . #4#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR |v| 0)
                                      (SPADCALL (SPADCALL |x| (QREFELT $ 23))
                                                (VECTOR (CONS 1 "sqfr")
                                                        (QCDR |v|) 2)
                                                (QREFELT $ 36)))
                                     (#5#
                                      (SPADCALL (SPADCALL |x| (QREFELT $ 23))
                                                (VECTOR (CONS 1 "sqfr") |m| 1)
                                                (QREFELT $ 36))))))))))
                          . #4#)
                    (EXIT (SPADCALL |u| |y| (QREFELT $ 29)))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |INTFACT;PollardSmallFactor;IU;2| ((|n| I) ($ |Union| I "failed"))
        (SPROG
         ((G (I)) (|x| (I)) (|y| (I)) (#1=#:G774 NIL) (#2=#:G773 NIL) (|i| NIL)
          (|l| (I)) (|ys| (I)) (#3=#:G772 NIL) (|r| (I)) (|k| (I)) (|q| (I))
          (#4=#:G771 NIL) (#5=#:G770 NIL) (#6=#:G769 NIL) (#7=#:G768 NIL)
          (|m| (I)) (|x0| (I)))
         (SEQ
          (LETT |x0| (SPADCALL |n| (QREFELT $ 37))
                . #8=(|INTFACT;PollardSmallFactor;IU;2|))
          (LETT |m| (SPADCALL 100 (QREFELT $ 33)) . #8#) (LETT |y| |x0| . #8#)
          (LETT |r| (|spadConstant| $ 13) . #8#)
          (LETT |q| (|spadConstant| $ 13) . #8#)
          (LETT G (|spadConstant| $ 13) . #8#)
          (SEQ (LETT #7# NIL . #8#) G190 (COND (#7# (GO G191)))
               (SEQ (LETT |x| |y| . #8#) (LETT |ys| |y| . #8#)
                    (SEQ (LETT |i| 1 . #8#)
                         (LETT #6# (SPADCALL |r| (QREFELT $ 38)) . #8#) G190
                         (COND ((|greater_SI| |i| #6#) (GO G191)))
                         (SEQ
                          (LETT |y|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |y| |y| (QREFELT $ 28))
                                           (SPADCALL 5 (QREFELT $ 33))
                                           (QREFELT $ 32))
                                 |n| (QREFELT $ 39))
                                . #8#)
                          (EXIT
                           (LETT |q|
                                 (SPADCALL
                                  (SPADCALL |q|
                                            (SPADCALL
                                             (SPADCALL |x| |y| (QREFELT $ 40))
                                             (QREFELT $ 41))
                                            (QREFELT $ 28))
                                  |n| (QREFELT $ 39))
                                 . #8#)))
                         (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |k| (|spadConstant| $ 7) . #8#)
                    (LETT G (SPADCALL |q| |n| (QREFELT $ 42)) . #8#)
                    (SEQ (LETT #5# NIL . #8#) G190 (COND (#5# (GO G191)))
                         (SEQ (LETT |ys| |y| . #8#)
                              (SEQ (LETT |i| 1 . #8#)
                                   (LETT #4#
                                         (SPADCALL
                                          (SPADCALL |m|
                                                    (SPADCALL |r| |k|
                                                              (QREFELT $ 40))
                                                    (QREFELT $ 43))
                                          (QREFELT $ 38))
                                         . #8#)
                                   G190
                                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                                   (SEQ
                                    (LETT |y|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |y| |y| (QREFELT $ 28))
                                            (SPADCALL 5 (QREFELT $ 33))
                                            (QREFELT $ 32))
                                           |n| (QREFELT $ 39))
                                          . #8#)
                                    (EXIT
                                     (LETT |q|
                                           (SPADCALL
                                            (SPADCALL |q|
                                                      (SPADCALL
                                                       (SPADCALL |x| |y|
                                                                 (QREFELT $
                                                                          40))
                                                       (QREFELT $ 41))
                                                      (QREFELT $ 28))
                                            |n| (QREFELT $ 39))
                                           . #8#)))
                                   (LETT |i| (|inc_SI| |i|) . #8#) (GO G190)
                                   G191 (EXIT NIL))
                              (LETT G (SPADCALL |q| |n| (QREFELT $ 42)) . #8#)
                              (EXIT
                               (LETT |k| (SPADCALL |k| |m| (QREFELT $ 32))
                                     . #8#)))
                         (LETT #5#
                               (COND ((SPADCALL |k| |r| (QREFELT $ 44)) 'T)
                                     ('T
                                      (SPADCALL G (|spadConstant| $ 13)
                                                (QREFELT $ 15))))
                               . #8#)
                         (GO G190) G191 (EXIT NIL))
                    (LETT |k| (SPADCALL |k| |r| (QREFELT $ 32)) . #8#)
                    (EXIT (LETT |r| (SPADCALL 2 |r| (QREFELT $ 45)) . #8#)))
               (LETT #7# (SPADCALL G (|spadConstant| $ 13) (QREFELT $ 15))
                     . #8#)
               (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL G |n| (QREFELT $ 35))
            (SEQ (LETT |l| (SPADCALL |k| |m| (QREFELT $ 40)) . #8#)
                 (LETT G (|spadConstant| $ 13) . #8#)
                 (SEQ (LETT #3# NIL . #8#) G190 (COND (#3# (GO G191)))
                      (SEQ
                       (LETT |ys|
                             (SPADCALL
                              (SPADCALL (SPADCALL |ys| |ys| (QREFELT $ 28))
                                        (SPADCALL 5 (QREFELT $ 33))
                                        (QREFELT $ 32))
                              |n| (QREFELT $ 39))
                             . #8#)
                       (LETT G
                             (SPADCALL
                              (SPADCALL (SPADCALL |x| |ys| (QREFELT $ 40))
                                        (QREFELT $ 41))
                              |n| (QREFELT $ 42))
                             . #8#)
                       (EXIT
                        (LETT |l|
                              (SPADCALL |l| (|spadConstant| $ 13)
                                        (QREFELT $ 32))
                              . #8#)))
                      (LETT #3#
                            (SPADCALL G (|spadConstant| $ 13) (QREFELT $ 15))
                            . #8#)
                      (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((SPADCALL G |n| (QREFELT $ 35))
                    (SEQ (LETT |y| |x0| . #8#) (LETT |x| |x0| . #8#)
                         (SEQ (LETT |i| 1 . #8#)
                              (LETT #2# (SPADCALL |l| (QREFELT $ 38)) . #8#)
                              G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |y|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |y| |y| (QREFELT $ 28))
                                        (SPADCALL 5 (QREFELT $ 33))
                                        (QREFELT $ 32))
                                       |n| (QREFELT $ 39))
                                      . #8#)))
                              (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                              (EXIT NIL))
                         (LETT G
                               (SPADCALL
                                (SPADCALL (SPADCALL |x| |y| (QREFELT $ 40))
                                          (QREFELT $ 41))
                                |n| (QREFELT $ 42))
                               . #8#)
                         (EXIT
                          (SEQ (LETT #1# NIL . #8#) G190 (COND (#1# (GO G191)))
                               (SEQ
                                (LETT |y|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |y| |y| (QREFELT $ 28))
                                        (SPADCALL 5 (QREFELT $ 33))
                                        (QREFELT $ 32))
                                       |n| (QREFELT $ 39))
                                      . #8#)
                                (LETT |x|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |x| |x| (QREFELT $ 28))
                                        (SPADCALL 5 (QREFELT $ 33))
                                        (QREFELT $ 32))
                                       |n| (QREFELT $ 39))
                                      . #8#)
                                (EXIT
                                 (LETT G
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |x| |y| (QREFELT $ 40))
                                         (QREFELT $ 41))
                                        |n| (QREFELT $ 42))
                                       . #8#)))
                               (LETT #1#
                                     (SPADCALL G (|spadConstant| $ 13)
                                               (QREFELT $ 15))
                                     . #8#)
                               (GO G190) G191 (EXIT NIL))))))))))
          (EXIT
           (COND ((SPADCALL G |n| (QREFELT $ 35)) (CONS 1 "failed"))
                 ('T (CONS 0 G))))))) 

(SDEFUN |INTFACT;PollardSmallFactor20| ((|n| I) ($ |Union| I "failed"))
        (SPROG ((#1=#:G782 NIL) (|r| (|Union| I "failed")) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 1 . #2=(|INTFACT;PollardSmallFactor20|)) G190
                       (COND ((|greater_SI| |i| 20) (GO G191)))
                       (SEQ (LETT |r| (SPADCALL |n| (QREFELT $ 46)) . #2#)
                            (EXIT
                             (COND
                              ((QEQCAR |r| 0)
                               (PROGN (LETT #1# |r| . #2#) (GO #3=#:G781))))))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |r|)))
                #3# (EXIT #1#)))) 

(SDEFUN |INTFACT;BasicSieve| ((|r| I) (|lim| I) ($ |Factored| I))
        (SPROG
         ((|d| (I))
          (|ls|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| I) (|:| |xpnt| (|Integer|)))))
          (|n| (I)) (|m| NIL) (#1=#:G796 NIL) (#2=#:G797 NIL) (|s| NIL)
          (|l| (|List| I)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |l|
                  (LIST (|spadConstant| $ 13) (SPADCALL 2 (QREFELT $ 33))
                        (SPADCALL 2 (QREFELT $ 33)) (SPADCALL 4 (QREFELT $ 33))
                        (SPADCALL 2 (QREFELT $ 33)) (SPADCALL 4 (QREFELT $ 33))
                        (SPADCALL 2 (QREFELT $ 33)) (SPADCALL 4 (QREFELT $ 33))
                        (SPADCALL 6 (QREFELT $ 33)) (SPADCALL 2 (QREFELT $ 33))
                        (SPADCALL 6 (QREFELT $ 33)))
                  . #3=(|INTFACT;BasicSieve|))
            (SPADCALL |l| (SPADCALL |l| 3 (QREFELT $ 48)) (QREFELT $ 49))
            (LETT |d| (SPADCALL 2 (QREFELT $ 33)) . #3#) (LETT |n| |r| . #3#)
            (LETT |ls| NIL . #3#)
            (EXIT
             (SEQ (LETT |s| NIL . #3#) (LETT #2# |l| . #3#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL |d| |lim| (QREFELT $ 15))
                      (PROGN
                       (LETT #1# (SPADCALL |n| |ls| (QREFELT $ 29)) . #3#)
                       (GO #4=#:G795)))
                     ('T
                      (SEQ
                       (COND
                        ((SPADCALL |n| (SPADCALL |d| |d| (QREFELT $ 28))
                                   (QREFELT $ 11))
                         (SEQ
                          (COND
                           ((SPADCALL |n| (|spadConstant| $ 13) (QREFELT $ 15))
                            (LETT |ls|
                                  (SPADCALL |ls|
                                            (VECTOR (CONS 3 "prime") |n| 1)
                                            (QREFELT $ 36))
                                  . #3#)))
                          (EXIT
                           (PROGN
                            (LETT #1#
                                  (SPADCALL (|spadConstant| $ 13) |ls|
                                            (QREFELT $ 29))
                                  . #3#)
                            (GO #4#))))))
                       (SEQ (LETT |m| 0 . #3#) G190
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |n| |d| (QREFELT $ 39))
                                         (QREFELT $ 50)))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |n| (SPADCALL |n| |d| (QREFELT $ 51))
                                    . #3#)))
                            (LETT |m| (|inc_SI| |m|) . #3#) (GO G190) G191
                            (EXIT NIL))
                       (COND
                        ((SPADCALL |m| 0 (QREFELT $ 52))
                         (LETT |ls|
                               (SPADCALL |ls| (VECTOR (CONS 3 "prime") |d| |m|)
                                         (QREFELT $ 36))
                               . #3#)))
                       (EXIT
                        (LETT |d| (SPADCALL |d| |s| (QREFELT $ 32))
                              . #3#)))))))
                  (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL)))))
          #4# (EXIT #1#)))) 

(SDEFUN |INTFACT;BasicMethod;IF;5| ((|n| I) ($ |Factored| I))
        (SPROG ((|x| (|Factored| I)) (|u| (I)) (|m| (I)))
               (SEQ
                (COND
                 ((SPADCALL |n| (|spadConstant| $ 7) (QREFELT $ 11))
                  (SEQ
                   (LETT |m| (SPADCALL |n| (QREFELT $ 12))
                         . #1=(|INTFACT;BasicMethod;IF;5|))
                   (EXIT
                    (LETT |u| (SPADCALL (|spadConstant| $ 13) (QREFELT $ 12))
                          . #1#))))
                 ('T
                  (SEQ (LETT |m| |n| . #1#)
                       (EXIT (LETT |u| (|spadConstant| $ 13) . #1#)))))
                (LETT |x|
                      (|INTFACT;BasicSieve| |m|
                       (SPADCALL (|spadConstant| $ 13)
                                 (SPADCALL |m| (QREFELT $ 53)) (QREFELT $ 32))
                       $)
                      . #1#)
                (EXIT
                 (SPADCALL |u| (SPADCALL |x| (QREFELT $ 23)) (QREFELT $ 29)))))) 

(SDEFUN |INTFACT;factor;IF;6| ((|m| I) ($ |Factored| I))
        (SPROG
         ((|flb|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| I) (|:| |xpnt| (|Integer|)))))
          (|c| (|NonNegativeInteger|)) (|n| (I)) (|d| (|Union| I "failed"))
          (|y| (|Union| I "failed")) (|x| (I))
          (|s|
           (|Record| (|:| |base| I) (|:| |exponent| (|NonNegativeInteger|))))
          (|f| #1=(|ListMultiDictionary| I)) (|b| #1#) (|a| #1#) (|u| (I)))
         (SEQ
          (COND ((SPADCALL |m| (QREFELT $ 50)) (|spadConstant| $ 9))
                (#2='T
                 (SEQ
                  (COND
                   ((SPADCALL |m| (QREFELT $ 55))
                    (SEQ
                     (LETT |n| (SPADCALL |m| (QREFELT $ 12))
                           . #3=(|INTFACT;factor;IF;6|))
                     (EXIT
                      (LETT |u| (SPADCALL (|spadConstant| $ 13) (QREFELT $ 12))
                            . #3#))))
                   (#2#
                    (SEQ (LETT |n| |m| . #3#)
                         (EXIT (LETT |u| (|spadConstant| $ 13) . #3#)))))
                  (LETT |b|
                        (|INTFACT;BasicSieve| |n|
                         (SPADCALL 10000 (QREFELT $ 33)) $)
                        . #3#)
                  (LETT |flb| (SPADCALL |b| (QREFELT $ 23)) . #3#)
                  (LETT |n| (SPADCALL |b| (QREFELT $ 27)) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |n| (|spadConstant| $ 13) (QREFELT $ 35))
                     (SPADCALL |u| |flb| (QREFELT $ 29)))
                    (#2#
                     (SEQ (LETT |a| (SPADCALL (QREFELT $ 57)) . #3#)
                          (LETT |b| (SPADCALL (QREFELT $ 57)) . #3#)
                          (LETT |f| (SPADCALL (QREFELT $ 57)) . #3#)
                          (SPADCALL |n| |a| (QREFELT $ 58))
                          (SEQ G190
                               (COND
                                ((NULL (NULL (SPADCALL |a| (QREFELT $ 59))))
                                 (GO G191)))
                               (SEQ
                                (LETT |n| (SPADCALL |a| (QREFELT $ 60)) . #3#)
                                (LETT |c| (SPADCALL |n| |a| (QREFELT $ 61))
                                      . #3#)
                                (SPADCALL |n| |a| (QREFELT $ 62))
                                (EXIT
                                 (COND
                                  ((SPADCALL |n| (QREFELT $ 64))
                                   (SPADCALL |n| |b| |c| (QREFELT $ 65)))
                                  ((SPADCALL
                                    (QCDR
                                     (LETT |s| (SPADCALL |n| (QREFELT $ 67))
                                           . #3#))
                                    1 (QREFELT $ 52))
                                   (SPADCALL (QCAR |s|) |a| (* |c| (QCDR |s|))
                                             (QREFELT $ 65)))
                                  ('T
                                   (SEQ
                                    (LETT |x| (SPADCALL |n| (QREFELT $ 53))
                                          . #3#)
                                    (COND
                                     ((SPADCALL (SPADCALL |x| 2 (QREFELT $ 69))
                                                |n| (QREFELT $ 11))
                                      (LETT |x|
                                            (SPADCALL |x| (|spadConstant| $ 13)
                                                      (QREFELT $ 32))
                                            . #3#)))
                                    (LETT |y|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |x| 2 (QREFELT $ 69)) |n|
                                            (QREFELT $ 40))
                                           (QREFELT $ 18))
                                          . #3#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |y| 0)
                                       (SEQ
                                        (SPADCALL
                                         (SPADCALL |x| (QCDR |y|)
                                                   (QREFELT $ 32))
                                         |a| |c| (QREFELT $ 65))
                                        (EXIT
                                         (SPADCALL
                                          (SPADCALL |x| (QCDR |y|)
                                                    (QREFELT $ 40))
                                          |a| |c| (QREFELT $ 65)))))
                                      ('T
                                       (SEQ
                                        (LETT |d|
                                              (|INTFACT;PollardSmallFactor20|
                                               |n| $)
                                              . #3#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |d| 0)
                                           (SEQ
                                            (SEQ (LETT |m| 0 . #3#) G190
                                                 (COND
                                                  ((NULL
                                                    (SPADCALL
                                                     (SPADCALL |n| (QCDR |d|)
                                                               (QREFELT $ 39))
                                                     (QREFELT $ 50)))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |n|
                                                         (SPADCALL |n|
                                                                   (QCDR |d|)
                                                                   (QREFELT $
                                                                            51))
                                                         . #3#)))
                                                 (LETT |m| (|inc_SI| |m|)
                                                       . #3#)
                                                 (GO G190) G191 (EXIT NIL))
                                            (SPADCALL (QCDR |d|) |a|
                                                      (* |m| |c|)
                                                      (QREFELT $ 65))
                                            (EXIT
                                             (COND
                                              ((SPADCALL |n|
                                                         (|spadConstant| $ 13)
                                                         (QREFELT $ 15))
                                               (SPADCALL |n| |a| |c|
                                                         (QREFELT $ 65)))))))
                                          ('T
                                           (SPADCALL |n| |f| |c|
                                                     (QREFELT $
                                                              65))))))))))))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (SEQ G190
                               (COND
                                ((NULL (NULL (SPADCALL |b| (QREFELT $ 59))))
                                 (GO G191)))
                               (SEQ
                                (LETT |n| (SPADCALL |b| (QREFELT $ 60)) . #3#)
                                (LETT |c| (SPADCALL |n| |b| (QREFELT $ 61))
                                      . #3#)
                                (SPADCALL |n| |b| (QREFELT $ 62))
                                (EXIT
                                 (LETT |flb|
                                       (SPADCALL |flb|
                                                 (VECTOR (CONS 3 "prime") |n|
                                                         |c|)
                                                 (QREFELT $ 36))
                                       . #3#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (SEQ G190
                               (COND
                                ((NULL (NULL (SPADCALL |f| (QREFELT $ 59))))
                                 (GO G191)))
                               (SEQ
                                (LETT |n| (SPADCALL |f| (QREFELT $ 60)) . #3#)
                                (LETT |c| (SPADCALL |n| |f| (QREFELT $ 61))
                                      . #3#)
                                (SPADCALL |n| |f| (QREFELT $ 62))
                                (EXIT
                                 (LETT |flb|
                                       (SPADCALL |flb|
                                                 (VECTOR (CONS 0 "nil") |n|
                                                         |c|)
                                                 (QREFELT $ 36))
                                       . #3#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT (SPADCALL |u| |flb| (QREFELT $ 29))))))))))))) 

(DECLAIM (NOTINLINE |IntegerFactorizationPackage;|)) 

(DEFUN |IntegerFactorizationPackage| (#1=#:G833)
  (SPROG NIL
         (PROG (#2=#:G834)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|IntegerFactorizationPackage|)
                                               '|domainEqualList|)
                    . #3=(|IntegerFactorizationPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|IntegerFactorizationPackage;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|IntegerFactorizationPackage|)))))))))) 

(DEFUN |IntegerFactorizationPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|IntegerFactorizationPackage|))
          (LETT |dv$| (LIST '|IntegerFactorizationPackage| DV$1) . #1#)
          (LETT $ (GETREFV 70) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|IntegerFactorizationPackage|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|IntegerFactorizationPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|)
              (|Factored| 6) (4 . |Zero|) (|Boolean|) (8 . <) (14 . -)
              (19 . |One|) (23 . |One|) (27 . >) (|Union| 6 '"failed")
              (|IntegerRoots| 6) (33 . |perfectSqrt|) |INTFACT;squareFree;IF;1|
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 20) (|:| |fctr| 6) (|:| |xpnt| 25))
              (|List| 21) (38 . |factorList|) (|PositiveInteger|) (|Integer|)
              (43 . *) (49 . |unit|) (54 . *) (60 . |makeFR|)
              (|NonNegativeInteger|) (66 . |approxNthRoot|) (72 . +)
              (78 . |coerce|) |INTFACT;factor;IF;6| (83 . =) (89 . |concat!|)
              (95 . |random|) (100 . |convert|) (105 . |rem|) (111 . -)
              (117 . |abs|) (122 . |gcd|) (128 . |min|) (134 . >=) (140 . *)
              |INTFACT;PollardSmallFactor;IU;2| (|List| 6) (146 . |rest|)
              (152 . |concat!|) (158 . |zero?|) (163 . |quo|) (169 . >)
              (175 . |approxSqrt|) |INTFACT;BasicMethod;IF;5|
              (180 . |negative?|) (|ListMultiDictionary| 6)
              (185 . |dictionary|) (189 . |insert!|) (195 . |empty?|)
              (200 . |inspect|) (205 . |count|) (211 . |remove!|)
              (|IntegerPrimesPackage| 6) (217 . |prime?|) (222 . |insert!|)
              (|Record| (|:| |base| 6) (|:| |exponent| 30))
              (229 . |perfectNthRoot|) (234 . |base|) (238 . ^))
           '#(|squareFree| 244 |factor| 249 |PollardSmallFactor| 254
              |BasicMethod| 259)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 69
                                                 '(0 6 0 7 0 8 0 9 2 6 10 0 0
                                                   11 1 6 0 0 12 0 6 0 13 0 8 0
                                                   14 2 6 10 0 0 15 1 17 16 6
                                                   18 1 8 22 0 23 2 25 0 24 0
                                                   26 1 8 6 0 27 2 6 0 0 0 28 2
                                                   8 0 6 22 29 2 17 6 6 30 31 2
                                                   6 0 0 0 32 1 6 0 25 33 2 6
                                                   10 0 0 35 2 22 0 0 21 36 1 6
                                                   0 0 37 1 6 25 0 38 2 6 0 0 0
                                                   39 2 6 0 0 0 40 1 6 0 0 41 2
                                                   6 0 0 0 42 2 6 0 0 0 43 2 6
                                                   10 0 0 44 2 6 0 24 0 45 2 47
                                                   0 0 30 48 2 47 0 0 0 49 1 6
                                                   10 0 50 2 6 0 0 0 51 2 30 10
                                                   0 0 52 1 17 6 6 53 1 6 10 0
                                                   55 0 56 0 57 2 56 0 6 0 58 1
                                                   56 10 0 59 1 56 6 0 60 2 56
                                                   30 6 0 61 2 56 0 6 0 62 1 63
                                                   10 6 64 3 56 0 6 0 30 65 1
                                                   17 66 6 67 0 6 0 68 2 6 0 0
                                                   24 69 1 0 8 6 19 1 0 8 6 34
                                                   1 0 16 6 46 1 0 8 6 54)))))
           '|lookupComplete|)) 
