
(SDEFUN |CARTEN;sample;$;1| (($ $)) (SPADCALL (QREFELT $ 16))) 

(SDEFUN |CARTEN;int2index|
        ((|n| |Integer|) (|indv| |Vector| (|Integer|))
         ($ |Vector| (|Integer|)))
        (SPROG
         ((|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (#1=#:G725 NIL) (|i| NIL) (|rnk| (|NonNegativeInteger|)))
         (SEQ
          (COND ((< |n| 0) (|error| "Index error (too small)"))
                (#2='T
                 (SEQ (LETT |rnk| (QVSIZE |indv|) . #3=(|CARTEN;int2index|))
                      (SEQ (LETT |i| 1 . #3#) (LETT #1# |rnk| . #3#) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ (LETT |qr| (DIVIDE2 |n| (QREFELT $ 7)) . #3#)
                                (LETT |n| (QCAR |qr|) . #3#)
                                (EXIT
                                 (SPADCALL |indv| (+ (- |rnk| |i|) 1)
                                           (+ (QCDR |qr|) (QREFELT $ 6))
                                           (QREFELT $ 20))))
                           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((SPADCALL |n| 0 (QREFELT $ 22))
                         (|error| "Index error (too big)"))
                        (#2# |indv|))))))))) 

(SDEFUN |CARTEN;index2int| ((|indv| |Vector| (|Integer|)) ($ |Integer|))
        (SPROG ((|n| (|Integer|)) (|ix| (|Integer|)) (#1=#:G731 NIL) (|i| NIL))
               (SEQ (LETT |n| 0 . #2=(|CARTEN;index2int|))
                    (SEQ (LETT |i| 1 . #2#) (LETT #1# (QVSIZE |indv|) . #2#)
                         G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (LETT |ix|
                                (- (SPADCALL |indv| |i| (QREFELT $ 23))
                                   (QREFELT $ 6))
                                . #2#)
                          (COND
                           ((OR (< |ix| 0)
                                (SPADCALL |ix| (- (QREFELT $ 7) 1)
                                          (QREFELT $ 24)))
                            (EXIT (|error| "Index error (out of range)"))))
                          (EXIT
                           (LETT |n|
                                 (+ (SPADCALL (QREFELT $ 7) |n| (QREFELT $ 25))
                                    |ix|)
                                 . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |n|)))) 

(SDEFUN |CARTEN;lengthRankOrElse| ((|v| |Integer|) ($ |NonNegativeInteger|))
        (SPROG
         ((|rx| (|NonNegativeInteger|))
          (|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|)))))
         (SEQ
          (COND ((EQL |v| 1) 0) ((EQL |v| (QREFELT $ 7)) 1)
                ((EQL |v| (QREFELT $ 13)) 2) ((EQL |v| (QREFELT $ 14)) 3)
                ((EQL |v| (QREFELT $ 15)) 4)
                ('T
                 (SEQ (LETT |rx| 0 . #1=(|CARTEN;lengthRankOrElse|))
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |v| 0 (QREFELT $ 22))) (GO G191)))
                           (SEQ (LETT |qr| (DIVIDE2 |v| (QREFELT $ 7)) . #1#)
                                (LETT |v| (QCAR |qr|) . #1#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |v| 0 (QREFELT $ 22))
                                   (COND
                                    ((SPADCALL (QCDR |qr|) 0 (QREFELT $ 22))
                                     (|error| "Rank is not a whole number"))
                                    ('T (LETT |rx| (+ |rx| 1) . #1#)))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |rx|))))))) 

(SDEFUN |CARTEN;mkPerm|
        ((|n| |NonNegativeInteger|) (|l| |List| (|Integer|))
         ($ |Vector| (|Integer|)))
        (SPROG
         ((#1=#:G753 NIL) (#2=#:G756 NIL) (|e| NIL) (#3=#:G754 NIL) (|i| NIL)
          (#4=#:G755 NIL) (|seen| (|Vector| (|Boolean|)))
          (|p| (|Vector| (|Integer|))))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |l|) |n| (QREFELT $ 26))
            (|error| "The list is not a permutation."))
           ('T
            (SEQ (LETT |p| (MAKEARR1 |n| 0) . #5=(|CARTEN;mkPerm|))
                 (LETT |seen| (MAKEARR1 |n| NIL) . #5#)
                 (SEQ (LETT |e| NIL . #5#) (LETT #4# |l| . #5#)
                      (LETT |i| 1 . #5#) (LETT #3# |n| . #5#) G190
                      (COND
                       ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                            (PROGN (LETT |e| (CAR #4#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((OR (< |e| 1) (SPADCALL |e| |n| (QREFELT $ 24)))
                          (|error| "The list is not a permutation."))
                         ('T
                          (SEQ (SPADCALL |p| |i| |e| (QREFELT $ 20))
                               (EXIT
                                (SPADCALL |seen| |e| 'T (QREFELT $ 28))))))))
                      (LETT |i|
                            (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#) . #5#))
                            . #5#)
                      (GO G190) G191 (EXIT NIL))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |e| 1 . #5#) (LETT #2# |n| . #5#) G190
                        (COND ((|greater_SI| |e| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL (SPADCALL |seen| |e| (QREFELT $ 29)))
                            (PROGN
                             (LETT #1#
                                   (|error| "The list is not a permutation.")
                                   . #5#)
                             (GO #6=#:G749))))))
                        (LETT |e| (|inc_SI| |e|) . #5#) (GO G190) G191
                        (EXIT NIL)))
                  #6# (EXIT #1#))
                 (EXIT |p|))))))) 

(SDEFUN |CARTEN;permute!|
        ((|t| |Vector| (|Integer|)) (|s| |Vector| (|Integer|))
         (|p| |Vector| (|Integer|)) ($ |Vector| (|Integer|)))
        (SPROG ((#1=#:G760 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1 . #2=(|CARTEN;permute!|))
                     (LETT #1# (QVSIZE |p|) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |t| |i|
                                 (SPADCALL |s|
                                           (SPADCALL |p| |i| (QREFELT $ 23))
                                           (QREFELT $ 23))
                                 (QREFELT $ 20))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |t|)))) 

(SDEFUN |CARTEN;permsign!| ((|v| |Vector| (|Integer|)) ($ |Integer|))
        (SPROG
         ((#1=#:G775 NIL) (#2=#:G779 NIL) (|i| NIL) (|totTrans| (|Integer|))
          (|e| (|Integer|)) (|nTrans| (|Integer|)) (#3=#:G777 NIL)
          (#4=#:G778 NIL) (|j| NIL) (|n| (|Integer|)) (#5=#:G776 NIL)
          (|psum| (|Integer|)) (#6=#:G762 NIL) (|maxix| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |maxix| (- (+ (QREFELT $ 6) (QVSIZE |v|)) 1)
                  . #7=(|CARTEN;permsign!|))
            (LETT |psum|
                  (PROG2
                      (LETT #6#
                            (SPADCALL
                             (- (* (+ |maxix| 1) |maxix|)
                                (* (QREFELT $ 6) (- (QREFELT $ 6) 1)))
                             2 (QREFELT $ 31))
                            . #7#)
                      (QCDR #6#)
                    (|check_union2| (QEQCAR #6# 0) (|Integer|)
                                    (|Union| (|Integer|) "failed") #6#))
                  . #7#)
            (LETT |n| 0 . #7#)
            (SEQ (LETT |i| 1 . #7#) (LETT #5# (QVSIZE |v|) . #7#) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |n| (+ |n| (SPADCALL |v| |i| (QREFELT $ 23))) . #7#)))
                 (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND ((SPADCALL |n| |psum| (QREFELT $ 22)) 0)
                   (#8='T
                    (SEQ (LETT |totTrans| 0 . #7#) (LETT |nTrans| 1 . #7#)
                         (SEQ G190
                              (COND
                               ((NULL (SPADCALL |nTrans| 0 (QREFELT $ 22)))
                                (GO G191)))
                              (SEQ (LETT |nTrans| 0 . #7#)
                                   (SEQ (LETT |j| 2 . #7#)
                                        (LETT #4# (QVSIZE |v|) . #7#)
                                        (LETT |i| 1 . #7#)
                                        (LETT #3# (- (QVSIZE |v|) 1) . #7#)
                                        G190
                                        (COND
                                         ((OR (|greater_SI| |i| #3#)
                                              (|greater_SI| |j| #4#))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL |v| |i| (QREFELT $ 23))
                                             (SPADCALL |v| |j| (QREFELT $ 23))
                                             (QREFELT $ 24))
                                            (SEQ
                                             (LETT |nTrans| (+ |nTrans| 1)
                                                   . #7#)
                                             (LETT |e|
                                                   (SPADCALL |v| |i|
                                                             (QREFELT $ 23))
                                                   . #7#)
                                             (SPADCALL |v| |i|
                                                       (SPADCALL |v| |j|
                                                                 (QREFELT $
                                                                          23))
                                                       (QREFELT $ 20))
                                             (EXIT
                                              (SPADCALL |v| |j| |e|
                                                        (QREFELT $ 20))))))))
                                        (LETT |i|
                                              (PROG1 (|inc_SI| |i|)
                                                (LETT |j| (|inc_SI| |j|)
                                                      . #7#))
                                              . #7#)
                                        (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (LETT |totTrans| (+ |totTrans| |nTrans|)
                                          . #7#)))
                              NIL (GO G190) G191 (EXIT NIL))
                         (SEQ (LETT |i| 1 . #7#) (LETT #2# (QREFELT $ 7) . #7#)
                              G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (SPADCALL |v| |i| (QREFELT $ 23))
                                            (- (+ (QREFELT $ 6) |i|) 1)
                                            (QREFELT $ 22))
                                  (PROGN (LETT #1# 0 . #7#) (GO #9=#:G774))))))
                              (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (COND ((ODDP |totTrans|) -1) (#8# 1)))))))))
          #9# (EXIT #1#)))) 

(SDEFUN |CARTEN;ravel;$L;8| ((|x| $) ($ |List| R))
        (SPROG ((#1=#:G783 NIL) (|i| NIL) (#2=#:G782 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|CARTEN;ravel;$L;8|))
                 (SEQ (LETT |i| 0 . #3#)
                      (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |x| |i| (QREFELT $ 33)) #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |CARTEN;unravel;L$;9| ((|l| |List| R) ($ $))
        (SPROG
         ((#1=#:G787 NIL) (|i| NIL) (#2=#:G788 NIL) (|r| NIL) (|z| ($))
          (|nz| (|NonNegativeInteger|)))
         (SEQ (LETT |nz| (LENGTH |l|) . #3=(|CARTEN;unravel;L$;9|))
              (|CARTEN;lengthRankOrElse| |nz| $)
              (LETT |z| (SPADCALL |nz| (|spadConstant| $ 36) (QREFELT $ 37))
                    . #3#)
              (SEQ (LETT |r| NIL . #3#) (LETT #2# |l| . #3#) (LETT |i| 0 . #3#)
                   (LETT #1# (- |nz| 1) . #3#) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                         (PROGN (LETT |r| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |z| |i| |r| (QREFELT $ 38))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;kroneckerDelta;$;10| (($ $))
        (SPROG ((#1=#:G792 NIL) (|i| NIL) (#2=#:G793 NIL) (|zi| NIL) (|z| ($)))
               (SEQ
                (LETT |z|
                      (SPADCALL (QREFELT $ 13) (|spadConstant| $ 36)
                                (QREFELT $ 37))
                      . #3=(|CARTEN;kroneckerDelta;$;10|))
                (SEQ (LETT |zi| 0 . #3#) (LETT #2# (+ (QREFELT $ 7) 1) . #3#)
                     (LETT |i| 1 . #3#) (LETT #1# (QREFELT $ 7) . #3#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |zi| (|spadConstant| $ 40)
                                 (QREFELT $ 38))))
                     (LETT |i|
                           (PROG1 (|inc_SI| |i|)
                             (LETT |zi| (|add_SI| |zi| #2#) . #3#))
                           . #3#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;leviCivitaSymbol;$;11| (($ $))
        (SPROG
         ((#1=#:G797 NIL) (|i| NIL) (|indv| (|Vector| (|Integer|))) (|z| ($))
          (|nz| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nz| (EXPT (QREFELT $ 7) (QREFELT $ 7))
                . #2=(|CARTEN;leviCivitaSymbol;$;11|))
          (LETT |z| (SPADCALL |nz| (|spadConstant| $ 36) (QREFELT $ 37)) . #2#)
          (LETT |indv| (MAKEARR1 (QREFELT $ 7) 0) . #2#)
          (SEQ (LETT |i| 0 . #2#) (LETT #1# (- |nz| 1) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |z| |i|
                           (SPADCALL
                            (|CARTEN;permsign!|
                             (|CARTEN;int2index| |i| |indv| $) $)
                            (QREFELT $ 41))
                           (QREFELT $ 38))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |z|)))) 

(SDEFUN |CARTEN;degree;$Nni;12| ((|x| $) ($ |NonNegativeInteger|))
        (SPADCALL |x| (QREFELT $ 43))) 

(SDEFUN |CARTEN;rank;$Nni;13| ((|x| $) ($ |NonNegativeInteger|))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |x| (QREFELT $ 32)) |CARTEN;rank;$Nni;13|)
                (EXIT (|CARTEN;lengthRankOrElse| |n| $))))) 

(SDEFUN |CARTEN;elt;$R;14| ((|x| $) ($ R))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) 1 (QREFELT $ 26))
          (|error| "Index error (the rank is not 0)"))
         ('T (SPADCALL |x| 0 (QREFELT $ 33))))) 

(SDEFUN |CARTEN;elt;$IR;15| ((|x| $) (|i| |Integer|) ($ R))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 7) (QREFELT $ 26))
          (|error| "Index error (the rank is not 1)"))
         ('T (SPADCALL |x| (- |i| (QREFELT $ 6)) (QREFELT $ 33))))) 

(SDEFUN |CARTEN;elt;$2IR;16| ((|x| $) (|i| |Integer|) (|j| |Integer|) ($ R))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 13)
                    (QREFELT $ 26))
          (|error| "Index error (the rank is not 2)"))
         ('T
          (SPADCALL |x|
                    (+
                     (SPADCALL (QREFELT $ 7) (- |i| (QREFELT $ 6))
                               (QREFELT $ 25))
                     (- |j| (QREFELT $ 6)))
                    (QREFELT $ 33))))) 

(SDEFUN |CARTEN;elt;$3IR;17|
        ((|x| $) (|i| |Integer|) (|j| |Integer|) (|k| |Integer|) ($ R))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 14)
                    (QREFELT $ 26))
          (|error| "Index error (the rank is not 3)"))
         ('T
          (SPADCALL |x|
                    (+
                     (+
                      (SPADCALL (QREFELT $ 13) (- |i| (QREFELT $ 6))
                                (QREFELT $ 25))
                      (SPADCALL (QREFELT $ 7) (- |j| (QREFELT $ 6))
                                (QREFELT $ 25)))
                     (- |k| (QREFELT $ 6)))
                    (QREFELT $ 33))))) 

(SDEFUN |CARTEN;elt;$4IR;18|
        ((|x| $) (|i| |Integer|) (|j| |Integer|) (|k| |Integer|)
         (|l| |Integer|) ($ R))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 15)
                    (QREFELT $ 26))
          (|error| "Index error (the rank is not 4)"))
         ('T
          (SPADCALL |x|
                    (+
                     (+
                      (+
                       (SPADCALL (QREFELT $ 14) (- |i| (QREFELT $ 6))
                                 (QREFELT $ 25))
                       (SPADCALL (QREFELT $ 13) (- |j| (QREFELT $ 6))
                                 (QREFELT $ 25)))
                      (SPADCALL (QREFELT $ 7) (- |k| (QREFELT $ 6))
                                (QREFELT $ 25)))
                     (- |l| (QREFELT $ 6)))
                    (QREFELT $ 33))))) 

(SDEFUN |CARTEN;elt;$LR;19| ((|x| $) (|i| |List| (|Integer|)) ($ R))
        (SPROG
         ((|n| (|Integer|)) (|ix| (|Integer|)) (#1=#:G817 NIL) (|ii| NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |i|) (SPADCALL |x| (QREFELT $ 43))
                      (QREFELT $ 26))
            (|error| "Index error (wrong rank)"))
           ('T
            (SEQ (LETT |n| 0 . #2=(|CARTEN;elt;$LR;19|))
                 (SEQ (LETT |ii| NIL . #2#) (LETT #1# |i| . #2#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ii| (CAR #1#) . #2#) NIL))
                        (GO G191)))
                      (SEQ (LETT |ix| (- |ii| (QREFELT $ 6)) . #2#)
                           (COND
                            ((OR (< |ix| 0)
                                 (SPADCALL |ix| (- (QREFELT $ 7) 1)
                                           (QREFELT $ 24)))
                             (EXIT (|error| "Index error (out of range)"))))
                           (EXIT
                            (LETT |n|
                                  (+
                                   (SPADCALL (QREFELT $ 7) |n| (QREFELT $ 25))
                                   |ix|)
                                  . #2#)))
                      (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL |x| |n| (QREFELT $ 33))))))))) 

(SDEFUN |CARTEN;coerce;L$;20| ((|lr| |List| R) ($ $))
        (SPROG ((#1=#:G822 NIL) (|r| NIL) (#2=#:G823 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (COND
                 ((SPADCALL (LENGTH |lr|) (QREFELT $ 7) (QREFELT $ 26))
                  (|error| "Incorrect number of components"))
                 ('T
                  (SEQ
                   (LETT |z|
                         (SPADCALL (QREFELT $ 7) (|spadConstant| $ 36)
                                   (QREFELT $ 37))
                         . #3=(|CARTEN;coerce;L$;20|))
                   (SEQ (LETT |i| 0 . #3#) (LETT #2# (- (QREFELT $ 7) 1) . #3#)
                        (LETT |r| NIL . #3#) (LETT #1# |lr| . #3#) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #3#) NIL)
                              (|greater_SI| |i| #2#))
                          (GO G191)))
                        (SEQ (EXIT (SPADCALL |z| |i| |r| (QREFELT $ 38))))
                        (LETT #1#
                              (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #3#))
                              . #3#)
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |z|))))))) 

(SDEFUN |CARTEN;coerce;L$;21| ((|lx| |List| $) ($ $))
        (SPROG
         ((#1=#:G837 NIL) (|i| NIL) (#2=#:G835 NIL) (|x| NIL) (#3=#:G836 NIL)
          (|offz| NIL) (|z| ($)) (|nx| (|NonNegativeInteger|)) (#4=#:G833 NIL)
          (#5=#:G834 NIL) (|rx| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |lx| (QREFELT $ 54)) (QREFELT $ 7)
                      (QREFELT $ 26))
            (|error| "Incorrect number of slices"))
           ('T
            (SEQ
             (LETT |rx|
                   (SPADCALL (SPADCALL |lx| (QREFELT $ 55)) (QREFELT $ 43))
                   . #6=(|CARTEN;coerce;L$;21|))
             (SEQ
              (EXIT
               (SEQ (LETT |x| NIL . #6#) (LETT #5# |lx| . #6#) G190
                    (COND
                     ((OR (ATOM #5#) (PROGN (LETT |x| (CAR #5#) . #6#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |x| (QREFELT $ 43)) |rx|
                                  (QREFELT $ 26))
                        (PROGN
                         (LETT #4# (|error| "Inhomogeneous slice ranks") . #6#)
                         (GO #7=#:G827))))))
                    (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL)))
              #7# (EXIT #4#))
             (LETT |nx|
                   (SPADCALL (SPADCALL |lx| (QREFELT $ 55)) (QREFELT $ 32))
                   . #6#)
             (LETT |z|
                   (SPADCALL (* (QREFELT $ 7) |nx|) (|spadConstant| $ 36)
                             (QREFELT $ 37))
                   . #6#)
             (SEQ (LETT |offz| 0 . #6#) (LETT #3# |nx| . #6#)
                  (LETT |x| NIL . #6#) (LETT #2# |lx| . #6#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0 . #6#) (LETT #1# (- |nx| 1) . #6#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |z| (+ |offz| |i|)
                                     (SPADCALL |x| |i| (QREFELT $ 33))
                                     (QREFELT $ 38))))
                         (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT #2#
                        (PROG1 (CDR #2#)
                          (LETT |offz| (|add_SI| |offz| #3#) . #6#))
                        . #6#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |z|))))))) 

(SDEFUN |CARTEN;retractIfCan;$U;22| ((|x| $) ($ |Union| R "failed"))
        (COND
         ((ZEROP (SPADCALL |x| (QREFELT $ 43)))
          (CONS 0 (SPADCALL |x| (QREFELT $ 45))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |CARTEN;mkOutf|
        ((|x| $) (|i0| |Integer|) (|rnk| |NonNegativeInteger|)
         ($ |OutputForm|))
        (SPROG
         ((#1=#:G858 NIL) (|j| NIL) (#2=#:G857 NIL) (#3=#:G856 NIL) (|i| NIL)
          (#4=#:G855 NIL) (|nskip| (|NonNegativeInteger|))
          (|rnk1| (|NonNegativeInteger|)) (#5=#:G854 NIL) (#6=#:G853 NIL))
         (SEQ
          (COND
           ((ODDP |rnk|)
            (SEQ (LETT |rnk1| (- |rnk| 1) . #7=(|CARTEN;mkOutf|))
                 (LETT |nskip| (EXPT (QREFELT $ 7) |rnk1|) . #7#)
                 (EXIT
                  (SPADCALL
                   (PROGN
                    (LETT #6# NIL . #7#)
                    (SEQ (LETT |i| 0 . #7#)
                         (LETT #5# (- (QREFELT $ 7) 1) . #7#) G190
                         (COND ((|greater_SI| |i| #5#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #6#
                                 (CONS
                                  (|CARTEN;mkOutf| |x| (+ |i0| (* |nskip| |i|))
                                   |rnk1| $)
                                  #6#)
                                 . #7#)))
                         (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                         (EXIT (NREVERSE #6#))))
                   (QREFELT $ 62)))))
           ((EQL |rnk| 0)
            (SPADCALL (SPADCALL |x| |i0| (QREFELT $ 33)) (QREFELT $ 63)))
           ('T
            (SEQ (LETT |rnk1| (- |rnk| 2) . #7#)
                 (LETT |nskip| (EXPT (QREFELT $ 7) |rnk1|) . #7#)
                 (EXIT
                  (SPADCALL
                   (PROGN
                    (LETT #4# NIL . #7#)
                    (SEQ (LETT |i| 0 . #7#)
                         (LETT #3# (- (QREFELT $ 7) 1) . #7#) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4#
                                 (CONS
                                  (PROGN
                                   (LETT #2# NIL . #7#)
                                   (SEQ (LETT |j| 0 . #7#)
                                        (LETT #1# (- (QREFELT $ 7) 1) . #7#)
                                        G190
                                        (COND
                                         ((|greater_SI| |j| #1#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (|CARTEN;mkOutf| |x|
                                                  (+ |i0|
                                                     (* |nskip|
                                                        (+
                                                         (* (QREFELT $ 7) |i|)
                                                         |j|)))
                                                  |rnk1| $)
                                                 #2#)
                                                . #7#)))
                                        (LETT |j| (|inc_SI| |j|) . #7#)
                                        (GO G190) G191 (EXIT (NREVERSE #2#))))
                                  #4#)
                                 . #7#)))
                         (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                         (EXIT (NREVERSE #4#))))
                   (QREFELT $ 65))))))))) 

(SDEFUN |CARTEN;coerce;$Of;24| ((|x| $) ($ |OutputForm|))
        (|CARTEN;mkOutf| |x| 0 (SPADCALL |x| (QREFELT $ 43)) $)) 

(SDEFUN |CARTEN;Zero;$;25| (($ $))
        (SPADCALL (|spadConstant| $ 36) (QREFELT $ 67))) 

(SDEFUN |CARTEN;One;$;26| (($ $))
        (SPADCALL (|spadConstant| $ 40) (QREFELT $ 67))) 

(SDEFUN |CARTEN;coerce;R$;27| ((|r| R) ($ $)) (SPADCALL 1 |r| (QREFELT $ 37))) 

(SDEFUN |CARTEN;coerce;Dp$;28| ((|v| |DirectProduct| |dim| R) ($ $))
        (SPROG ((#1=#:G867 NIL) (|i| NIL) (#2=#:G868 NIL) (|j| NIL) (|z| ($)))
               (SEQ
                (LETT |z|
                      (SPADCALL (QREFELT $ 7) (|spadConstant| $ 36)
                                (QREFELT $ 37))
                      . #3=(|CARTEN;coerce;Dp$;28|))
                (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 71)) . #3#)
                     (LETT #2# (SPADCALL |v| (QREFELT $ 72)) . #3#)
                     (LETT |i| 0 . #3#) (LETT #1# (- (QREFELT $ 7) 1) . #3#)
                     G190
                     (COND ((OR (|greater_SI| |i| #1#) (> |j| #2#)) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i| (SPADCALL |v| |j| (QREFELT $ 73))
                                 (QREFELT $ 38))))
                     (LETT |i|
                           (PROG1 (|inc_SI| |i|) (LETT |j| (+ |j| 1) . #3#))
                           . #3#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;coerce;Sm$;29| ((|m| |SquareMatrix| |dim| R) ($ $))
        (SPROG
         ((|offz| (|NonNegativeInteger|)) (#1=#:G876 NIL) (|j| NIL)
          (#2=#:G875 NIL) (|i| NIL) (|z| ($)))
         (SEQ
          (LETT |z|
                (SPADCALL (SPADCALL (QREFELT $ 7) 2 (QREFELT $ 12))
                          (|spadConstant| $ 36) (QREFELT $ 37))
                . #3=(|CARTEN;coerce;Sm$;29|))
          (LETT |offz| 0 . #3#)
          (SEQ (LETT |i| 0 . #3#) (LETT #2# (- (QREFELT $ 7) 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (SEQ (LETT |j| 0 . #3#) (LETT #1# (- (QREFELT $ 7) 1) . #3#)
                     G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| (+ |offz| |j|)
                                 (SPADCALL |m| (+ |i| 1) (+ |j| 1)
                                           (QREFELT $ 76))
                                 (QREFELT $ 38))))
                     (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |offz| (+ |offz| (QREFELT $ 7)) . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |z|)))) 

(SDEFUN |CARTEN;=;2$B;30| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G882 NIL) (#2=#:G883 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |x| (QREFELT $ 32))
                             (SPADCALL |y| (QREFELT $ 32)) (QREFELT $ 26))
                   NIL)
                  ('T
                   (SEQ
                    (SEQ (LETT |i| 0 . #3=(|CARTEN;=;2$B;30|))
                         (LETT #2# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #3#)
                         G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |x| |i| (QREFELT $ 33))
                                       (SPADCALL |y| |i| (QREFELT $ 33))
                                       (QREFELT $ 78))
                             (PROGN (LETT #1# NIL . #3#) (GO #4=#:G881))))))
                         (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT 'T)))))
                #4# (EXIT #1#)))) 

(SDEFUN |CARTEN;+;3$;31| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G888 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT $ 32))
                            (SPADCALL |y| (QREFELT $ 32)) (QREFELT $ 26))
                  (|error| "Rank mismatch"))
                 ('T
                  (SEQ
                   (LETT |z|
                         (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                   (|spadConstant| $ 36) (QREFELT $ 37))
                         . #2=(|CARTEN;+;3$;31|))
                   (SEQ (LETT |i| 0 . #2#)
                        (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #2#)
                        G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |z| |i|
                                    (SPADCALL (SPADCALL |x| |i| (QREFELT $ 33))
                                              (SPADCALL |y| |i| (QREFELT $ 33))
                                              (QREFELT $ 80))
                                    (QREFELT $ 38))))
                        (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT |z|))))))) 

(SDEFUN |CARTEN;-;3$;32| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G893 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT $ 32))
                            (SPADCALL |y| (QREFELT $ 32)) (QREFELT $ 26))
                  (|error| "Rank mismatch"))
                 ('T
                  (SEQ
                   (LETT |z|
                         (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                   (|spadConstant| $ 36) (QREFELT $ 37))
                         . #2=(|CARTEN;-;3$;32|))
                   (SEQ (LETT |i| 0 . #2#)
                        (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #2#)
                        G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |z| |i|
                                    (SPADCALL (SPADCALL |x| |i| (QREFELT $ 33))
                                              (SPADCALL |y| |i| (QREFELT $ 33))
                                              (QREFELT $ 82))
                                    (QREFELT $ 38))))
                        (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT |z|))))))) 

(SDEFUN |CARTEN;-;2$;33| ((|x| $) ($ $))
        (SPROG ((#1=#:G897 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                (|spadConstant| $ 36) (QREFELT $ 37))
                      . #2=(|CARTEN;-;2$;33|))
                (SEQ (LETT |i| 0 . #2#)
                     (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL (SPADCALL |x| |i| (QREFELT $ 33))
                                           (QREFELT $ 84))
                                 (QREFELT $ 38))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;I2$;34| ((|n| |Integer|) (|x| $) ($ $))
        (SPROG ((#1=#:G901 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                (|spadConstant| $ 36) (QREFELT $ 37))
                      . #2=(|CARTEN;*;I2$;34|))
                (SEQ (LETT |i| 0 . #2#)
                     (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |n|
                                           (SPADCALL |x| |i| (QREFELT $ 33))
                                           (QREFELT $ 86))
                                 (QREFELT $ 38))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;$I$;35| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((#1=#:G905 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                (|spadConstant| $ 36) (QREFELT $ 37))
                      . #2=(|CARTEN;*;$I$;35|))
                (SEQ (LETT |i| 0 . #2#)
                     (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |n|
                                           (SPADCALL |x| |i| (QREFELT $ 33))
                                           (QREFELT $ 86))
                                 (QREFELT $ 38))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;R2$;36| ((|r| R) (|x| $) ($ $))
        (SPROG ((#1=#:G909 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                (|spadConstant| $ 36) (QREFELT $ 37))
                      . #2=(|CARTEN;*;R2$;36|))
                (SEQ (LETT |i| 0 . #2#)
                     (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |r|
                                           (SPADCALL |x| |i| (QREFELT $ 33))
                                           (QREFELT $ 89))
                                 (QREFELT $ 38))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;$R$;37| ((|x| $) (|r| R) ($ $))
        (SPROG ((#1=#:G913 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                (|spadConstant| $ 36) (QREFELT $ 37))
                      . #2=(|CARTEN;*;$R$;37|))
                (SEQ (LETT |i| 0 . #2#)
                     (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |r|
                                           (SPADCALL |x| |i| (QREFELT $ 33))
                                           (QREFELT $ 89))
                                 (QREFELT $ 38))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;product;3$;38| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G920 NIL) (|j| NIL) (#2=#:G918 NIL) (|i| NIL) (#3=#:G919 NIL)
          (|ioff| NIL) (|z| ($)) (|ny| #4=(|NonNegativeInteger|)) (|nx| #4#))
         (SEQ
          (LETT |nx| (SPADCALL |x| (QREFELT $ 32))
                . #5=(|CARTEN;product;3$;38|))
          (LETT |ny| (SPADCALL |y| (QREFELT $ 32)) . #5#)
          (LETT |z|
                (SPADCALL (* |nx| |ny|) (|spadConstant| $ 36) (QREFELT $ 37))
                . #5#)
          (SEQ (LETT |ioff| 0 . #5#) (LETT #3# |ny| . #5#) (LETT |i| 0 . #5#)
               (LETT #2# (- |nx| 1) . #5#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 0 . #5#) (LETT #1# (- |ny| 1) . #5#) G190
                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |z| (+ |ioff| |j|)
                                  (SPADCALL (SPADCALL |x| |i| (QREFELT $ 33))
                                            (SPADCALL |y| |j| (QREFELT $ 33))
                                            (QREFELT $ 89))
                                  (QREFELT $ 38))))
                      (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i|
                     (PROG1 (|inc_SI| |i|)
                       (LETT |ioff| (|add_SI| |ioff| #3#) . #5#))
                     . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |z|)))) 

(SDEFUN |CARTEN;*;3$;39| ((|x| $) (|y| $) ($ $))
        (SPROG ((|ry| #1=(|NonNegativeInteger|)) (|rx| #1#))
               (SEQ
                (LETT |rx| (SPADCALL |x| (QREFELT $ 43))
                      . #2=(|CARTEN;*;3$;39|))
                (LETT |ry| (SPADCALL |y| (QREFELT $ 43)) . #2#)
                (EXIT
                 (COND
                  ((EQL |rx| 0)
                   (SPADCALL (SPADCALL |x| 0 (QREFELT $ 33)) |y|
                             (QREFELT $ 90)))
                  ((EQL |ry| 0)
                   (SPADCALL |x| (SPADCALL |y| 0 (QREFELT $ 33))
                             (QREFELT $ 91)))
                  ('T (SPADCALL |x| |rx| |y| 1 (QREFELT $ 93)))))))) 

(SDEFUN |CARTEN;contract;$2I$;40|
        ((|x| $) (|i| . #1=(|Integer|)) (|j| . #2=(|Integer|)) ($ $))
        (SPROG
         ((#3=#:G939 NIL) (|k| NIL) (#4=#:G940 NIL) (|xk| NIL) (#5=#:G936 NIL)
          (|l| NIL) (#6=#:G937 NIL) (|xl| NIL) (#7=#:G938 NIL) (|zl| NIL)
          (#8=#:G933 NIL) (|m| NIL) (#9=#:G934 NIL) (|xm| NIL) (#10=#:G935 NIL)
          (|zm| NIL) (#11=#:G930 NIL) (|h| NIL) (#12=#:G931 NIL) (|xh| NIL)
          (#13=#:G932 NIL) (|zh| NIL) (|z| ($))
          (|xok| #14=(|NonNegativeInteger|)) (|xoh| #14#) (|zoh| #14#)
          (|nh| #15=(|NonNegativeInteger|)) (|rh| (|NonNegativeInteger|))
          (|xom| #14#) (|zom| #15#) (|nm| #15#) (|rm| (|NonNegativeInteger|))
          (|xol| #16=(|PositiveInteger|)) (|zol| #16#) (|nl| #15#)
          (|rl| (|NonNegativeInteger|)) (|#G111| #1#) (|#G110| #2#)
          (|rx| (|NonNegativeInteger|)))
         (SEQ
          (LETT |rx| (SPADCALL |x| (QREFELT $ 43))
                . #17=(|CARTEN;contract;$2I$;40|))
          (COND
           ((OR
             (OR
              (OR (OR (< |i| 1) (SPADCALL |i| |rx| (QREFELT $ 24))) (< |j| 1))
              (SPADCALL |j| |rx| (QREFELT $ 24)))
             (EQL |i| |j|))
            (EXIT (|error| "Improper index for contraction"))))
          (COND
           ((SPADCALL |i| |j| (QREFELT $ 24))
            (PROGN
             (LETT |#G110| |j| . #17#)
             (LETT |#G111| |i| . #17#)
             (LETT |i| |#G110| . #17#)
             (LETT |j| |#G111| . #17#))))
          (LETT |rl| (- |rx| |j|) . #17#)
          (LETT |nl| (EXPT (QREFELT $ 7) |rl|) . #17#) (LETT |zol| 1 . #17#)
          (LETT |xol| |zol| . #17#) (LETT |rm| (- (- |j| |i|) 1) . #17#)
          (LETT |nm| (EXPT (QREFELT $ 7) |rm|) . #17#) (LETT |zom| |nl| . #17#)
          (LETT |xom| (* |zom| (QREFELT $ 7)) . #17#)
          (LETT |rh| (- |i| 1) . #17#)
          (LETT |nh| (EXPT (QREFELT $ 7) |rh|) . #17#)
          (LETT |zoh| (* |nl| |nm|) . #17#)
          (LETT |xoh| (* |zoh| (SPADCALL (QREFELT $ 7) 2 (QREFELT $ 12)))
                . #17#)
          (LETT |xok| (* |nl| (+ 1 (* |nm| (QREFELT $ 7)))) . #17#)
          (LETT |z|
                (SPADCALL (* (* |nl| |nm|) |nh|) (|spadConstant| $ 36)
                          (QREFELT $ 37))
                . #17#)
          (SEQ (LETT |zh| 0 . #17#) (LETT #13# |zoh| . #17#)
               (LETT |xh| 0 . #17#) (LETT #12# |xoh| . #17#)
               (LETT |h| 1 . #17#) (LETT #11# |nh| . #17#) G190
               (COND ((|greater_SI| |h| #11#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |zm| |zh| . #17#) (LETT #10# |zom| . #17#)
                      (LETT |xm| |xh| . #17#) (LETT #9# |xom| . #17#)
                      (LETT |m| 1 . #17#) (LETT #8# |nm| . #17#) G190
                      (COND ((|greater_SI| |m| #8#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |zl| |zm| . #17#) (LETT #7# |zol| . #17#)
                             (LETT |xl| |xm| . #17#) (LETT #6# |xol| . #17#)
                             (LETT |l| 1 . #17#) (LETT #5# |nl| . #17#) G190
                             (COND ((|greater_SI| |l| #5#) (GO G191)))
                             (SEQ
                              (SPADCALL |z| |zl| (|spadConstant| $ 36)
                                        (QREFELT $ 38))
                              (EXIT
                               (SEQ (LETT |xk| |xl| . #17#)
                                    (LETT #4# |xok| . #17#) (LETT |k| 1 . #17#)
                                    (LETT #3# (QREFELT $ 7) . #17#) G190
                                    (COND ((|greater_SI| |k| #3#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |z| |zl|
                                                (SPADCALL
                                                 (SPADCALL |z| |zl|
                                                           (QREFELT $ 33))
                                                 (SPADCALL |x| |xk|
                                                           (QREFELT $ 33))
                                                 (QREFELT $ 80))
                                                (QREFELT $ 38))))
                                    (LETT |k|
                                          (PROG1 (|inc_SI| |k|)
                                            (LETT |xk| (+ |xk| #4#) . #17#))
                                          . #17#)
                                    (GO G190) G191 (EXIT NIL))))
                             (LETT |l|
                                   (PROG1 (|inc_SI| |l|)
                                     (LETT |xl|
                                           (PROG1 (+ |xl| #6#)
                                             (LETT |zl| (+ |zl| #7#) . #17#))
                                           . #17#))
                                   . #17#)
                             (GO G190) G191 (EXIT NIL))))
                      (LETT |m|
                            (PROG1 (|inc_SI| |m|)
                              (LETT |xm|
                                    (PROG1 (+ |xm| #9#)
                                      (LETT |zm| (+ |zm| #10#) . #17#))
                                    . #17#))
                            . #17#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |h|
                     (PROG1 (|inc_SI| |h|)
                       (LETT |xh|
                             (PROG1 (|add_SI| |xh| #12#)
                               (LETT |zh| (|add_SI| |zh| #13#) . #17#))
                             . #17#))
                     . #17#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |z|)))) 

(SDEFUN |CARTEN;contract;$I$I$;41|
        ((|x| $) (|i| |Integer|) (|y| $) (|j| |Integer|) ($ $))
        (SPROG
         ((#1=#:G961 NIL) (|k| NIL) (#2=#:G962 NIL) (|xk| NIL) (#3=#:G963 NIL)
          (|yk| NIL) (#4=#:G958 NIL) (|dyl| NIL) (#5=#:G959 NIL) (|yl| NIL)
          (#6=#:G960 NIL) (|zly| NIL) (#7=#:G955 NIL) (|dyh| NIL)
          (#8=#:G956 NIL) (|yh| NIL) (#9=#:G957 NIL) (|zhy| NIL)
          (#10=#:G952 NIL) (|dxl| NIL) (#11=#:G953 NIL) (|xl| NIL)
          (#12=#:G954 NIL) (|zlx| NIL) (#13=#:G949 NIL) (|dxh| NIL)
          (#14=#:G950 NIL) (|xh| NIL) (#15=#:G951 NIL) (|zhx| NIL) (|z| ($))
          (|zohx| #16=(|NonNegativeInteger|)) (|ohx| #16#)
          (|nhx| #17=(|NonNegativeInteger|)) (|rhx| (|NonNegativeInteger|))
          (|zolx| #16#) (|olx| #18=(|PositiveInteger|)) (|nlx| #17#)
          (|rlx| (|NonNegativeInteger|)) (|zohy| (|NonNegativeInteger|))
          (|ohy| #16#) (|nhy| #17#) (|rhy| (|NonNegativeInteger|))
          (|zoly| #18#) (|oly| #18#) (|nly| #17#)
          (|rly| (|NonNegativeInteger|)) (|ry| #19=(|NonNegativeInteger|))
          (|rx| #19#))
         (SEQ
          (LETT |rx| (SPADCALL |x| (QREFELT $ 43))
                . #20=(|CARTEN;contract;$I$I$;41|))
          (LETT |ry| (SPADCALL |y| (QREFELT $ 43)) . #20#)
          (COND
           ((OR
             (OR (OR (< |i| 1) (SPADCALL |i| |rx| (QREFELT $ 24))) (< |j| 1))
             (SPADCALL |j| |ry| (QREFELT $ 24)))
            (EXIT (|error| "Improper index for contraction"))))
          (LETT |rly| (- |ry| |j|) . #20#)
          (LETT |nly| (EXPT (QREFELT $ 7) |rly|) . #20#) (LETT |oly| 1 . #20#)
          (LETT |zoly| 1 . #20#) (LETT |rhy| (- |j| 1) . #20#)
          (LETT |nhy| (EXPT (QREFELT $ 7) |rhy|) . #20#)
          (LETT |ohy| (* |nly| (QREFELT $ 7)) . #20#)
          (LETT |zohy| (SPADCALL |zoly| |nly| (QREFELT $ 96)) . #20#)
          (LETT |rlx| (- |rx| |i|) . #20#)
          (LETT |nlx| (EXPT (QREFELT $ 7) |rlx|) . #20#) (LETT |olx| 1 . #20#)
          (LETT |zolx| (* |zohy| |nhy|) . #20#) (LETT |rhx| (- |i| 1) . #20#)
          (LETT |nhx| (EXPT (QREFELT $ 7) |rhx|) . #20#)
          (LETT |ohx| (* |nlx| (QREFELT $ 7)) . #20#)
          (LETT |zohx| (* |zolx| |nlx|) . #20#)
          (LETT |z|
                (SPADCALL (* (* (* |nlx| |nhx|) |nly|) |nhy|)
                          (|spadConstant| $ 36) (QREFELT $ 37))
                . #20#)
          (SEQ (LETT |zhx| 0 . #20#) (LETT #15# |zohx| . #20#)
               (LETT |xh| 0 . #20#) (LETT #14# |ohx| . #20#)
               (LETT |dxh| 1 . #20#) (LETT #13# |nhx| . #20#) G190
               (COND ((|greater_SI| |dxh| #13#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |zlx| |zhx| . #20#) (LETT #12# |zolx| . #20#)
                      (LETT |xl| |xh| . #20#) (LETT #11# |olx| . #20#)
                      (LETT |dxl| 1 . #20#) (LETT #10# |nlx| . #20#) G190
                      (COND ((|greater_SI| |dxl| #10#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |zhy| |zlx| . #20#) (LETT #9# |zohy| . #20#)
                             (LETT |yh| 0 . #20#) (LETT #8# |ohy| . #20#)
                             (LETT |dyh| 1 . #20#) (LETT #7# |nhy| . #20#) G190
                             (COND ((|greater_SI| |dyh| #7#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |zly| |zhy| . #20#)
                                    (LETT #6# |zoly| . #20#)
                                    (LETT |yl| |yh| . #20#)
                                    (LETT #5# |oly| . #20#)
                                    (LETT |dyl| 1 . #20#)
                                    (LETT #4# |nly| . #20#) G190
                                    (COND ((|greater_SI| |dyl| #4#) (GO G191)))
                                    (SEQ
                                     (SPADCALL |z| |zly| (|spadConstant| $ 36)
                                               (QREFELT $ 38))
                                     (EXIT
                                      (SEQ (LETT |yk| |yl| . #20#)
                                           (LETT #3# |nly| . #20#)
                                           (LETT |xk| |xl| . #20#)
                                           (LETT #2# |nlx| . #20#)
                                           (LETT |k| 1 . #20#)
                                           (LETT #1# (QREFELT $ 7) . #20#) G190
                                           (COND
                                            ((|greater_SI| |k| #1#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (SPADCALL |z| |zly|
                                                       (SPADCALL
                                                        (SPADCALL |z| |zly|
                                                                  (QREFELT $
                                                                           33))
                                                        (SPADCALL
                                                         (SPADCALL |x| |xk|
                                                                   (QREFELT $
                                                                            33))
                                                         (SPADCALL |y| |yk|
                                                                   (QREFELT $
                                                                            33))
                                                         (QREFELT $ 89))
                                                        (QREFELT $ 80))
                                                       (QREFELT $ 38))))
                                           (LETT |k|
                                                 (PROG1 (|inc_SI| |k|)
                                                   (LETT |xk|
                                                         (PROG1 (+ |xk| #2#)
                                                           (LETT |yk|
                                                                 (+ |yk| #3#)
                                                                 . #20#))
                                                         . #20#))
                                                 . #20#)
                                           (GO G190) G191 (EXIT NIL))))
                                    (LETT |dyl|
                                          (PROG1 (|inc_SI| |dyl|)
                                            (LETT |yl|
                                                  (PROG1 (+ |yl| #5#)
                                                    (LETT |zly| (+ |zly| #6#)
                                                          . #20#))
                                                  . #20#))
                                          . #20#)
                                    (GO G190) G191 (EXIT NIL))))
                             (LETT |dyh|
                                   (PROG1 (|inc_SI| |dyh|)
                                     (LETT |yh|
                                           (PROG1 (|add_SI| |yh| #8#)
                                             (LETT |zhy| (+ |zhy| #9#) . #20#))
                                           . #20#))
                                   . #20#)
                             (GO G190) G191 (EXIT NIL))))
                      (LETT |dxl|
                            (PROG1 (|inc_SI| |dxl|)
                              (LETT |xl|
                                    (PROG1 (+ |xl| #11#)
                                      (LETT |zlx| (+ |zlx| #12#) . #20#))
                                    . #20#))
                            . #20#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |dxh|
                     (PROG1 (|inc_SI| |dxh|)
                       (LETT |xh|
                             (PROG1 (|add_SI| |xh| #14#)
                               (LETT |zhx| (|add_SI| |zhx| #15#) . #20#))
                             . #20#))
                     . #20#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |z|)))) 

(SDEFUN |CARTEN;transpose;2$;42| ((|x| $) ($ $))
        (SPADCALL |x| 1 (SPADCALL |x| (QREFELT $ 43)) (QREFELT $ 97))) 

(SDEFUN |CARTEN;transpose;$2I$;43|
        ((|x| $) (|i| . #1=(|Integer|)) (|j| . #2=(|Integer|)) ($ $))
        (SPROG
         ((#3=#:G981 NIL) (|q| NIL) (#4=#:G982 NIL) (|zq| NIL) (#5=#:G983 NIL)
          (|xq| NIL) (#6=#:G978 NIL) (|p| NIL) (#7=#:G979 NIL) (|zp| NIL)
          (#8=#:G980 NIL) (|xp| NIL) (#9=#:G976 NIL) (|l| NIL) (#10=#:G977 NIL)
          (|zl| NIL) (#11=#:G974 NIL) (|m| NIL) (#12=#:G975 NIL) (|zm| NIL)
          (#13=#:G972 NIL) (|h| NIL) (#14=#:G973 NIL) (|zh| NIL) (|z| ($))
          (|zoh| #15=(|NonNegativeInteger|)) (|nh| #16=(|NonNegativeInteger|))
          (|rh| (|NonNegativeInteger|)) (|zoj| #15#) (|zom| #15#) (|nm| #16#)
          (|rm| (|NonNegativeInteger|)) (|zoi| (|NonNegativeInteger|))
          (|zol| (|PositiveInteger|)) (|nl| #16#) (|rl| (|NonNegativeInteger|))
          (|#G147| #1#) (|#G146| #2#) (|rx| (|NonNegativeInteger|)))
         (SEQ
          (LETT |rx| (SPADCALL |x| (QREFELT $ 43))
                . #17=(|CARTEN;transpose;$2I$;43|))
          (COND
           ((OR
             (OR
              (OR (OR (< |i| 1) (SPADCALL |i| |rx| (QREFELT $ 24))) (< |j| 1))
              (SPADCALL |j| |rx| (QREFELT $ 24)))
             (EQL |i| |j|))
            (EXIT (|error| "Improper indicies for transposition"))))
          (COND
           ((SPADCALL |i| |j| (QREFELT $ 24))
            (PROGN
             (LETT |#G146| |j| . #17#)
             (LETT |#G147| |i| . #17#)
             (LETT |i| |#G146| . #17#)
             (LETT |j| |#G147| . #17#))))
          (LETT |rl| (- |rx| |j|) . #17#)
          (LETT |nl| (EXPT (QREFELT $ 7) |rl|) . #17#) (LETT |zol| 1 . #17#)
          (LETT |zoi| (SPADCALL |zol| |nl| (QREFELT $ 96)) . #17#)
          (LETT |rm| (- (- |j| |i|) 1) . #17#)
          (LETT |nm| (EXPT (QREFELT $ 7) |rm|) . #17#)
          (LETT |zom| (* |nl| (QREFELT $ 7)) . #17#)
          (LETT |zoj| (* |zom| |nm|) . #17#) (LETT |rh| (- |i| 1) . #17#)
          (LETT |nh| (EXPT (QREFELT $ 7) |rh|) . #17#)
          (LETT |zoh|
                (* (* |nl| |nm|) (SPADCALL (QREFELT $ 7) 2 (QREFELT $ 12)))
                . #17#)
          (LETT |z|
                (SPADCALL (SPADCALL |x| (QREFELT $ 32)) (|spadConstant| $ 36)
                          (QREFELT $ 37))
                . #17#)
          (SEQ (LETT |zh| 0 . #17#) (LETT #14# |zoh| . #17#)
               (LETT |h| 1 . #17#) (LETT #13# |nh| . #17#) G190
               (COND ((|greater_SI| |h| #13#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |zm| |zh| . #17#) (LETT #12# |zom| . #17#)
                      (LETT |m| 1 . #17#) (LETT #11# |nm| . #17#) G190
                      (COND ((|greater_SI| |m| #11#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |zl| |zm| . #17#) (LETT #10# |zol| . #17#)
                             (LETT |l| 1 . #17#) (LETT #9# |nl| . #17#) G190
                             (COND ((|greater_SI| |l| #9#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |xp| |zl| . #17#)
                                    (LETT #8# |zoj| . #17#)
                                    (LETT |zp| |zl| . #17#)
                                    (LETT #7# |zoi| . #17#) (LETT |p| 1 . #17#)
                                    (LETT #6# (QREFELT $ 7) . #17#) G190
                                    (COND ((|greater_SI| |p| #6#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ (LETT |xq| |xp| . #17#)
                                           (LETT #5# |zoi| . #17#)
                                           (LETT |zq| |zp| . #17#)
                                           (LETT #4# |zoj| . #17#)
                                           (LETT |q| 1 . #17#)
                                           (LETT #3# (QREFELT $ 7) . #17#) G190
                                           (COND
                                            ((|greater_SI| |q| #3#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (SPADCALL |z| |zq|
                                                       (SPADCALL |x| |xq|
                                                                 (QREFELT $
                                                                          33))
                                                       (QREFELT $ 38))))
                                           (LETT |q|
                                                 (PROG1 (|inc_SI| |q|)
                                                   (LETT |zq|
                                                         (PROG1 (+ |zq| #4#)
                                                           (LETT |xq|
                                                                 (+ |xq| #5#)
                                                                 . #17#))
                                                         . #17#))
                                                 . #17#)
                                           (GO G190) G191 (EXIT NIL))))
                                    (LETT |p|
                                          (PROG1 (|inc_SI| |p|)
                                            (LETT |zp|
                                                  (PROG1 (+ |zp| #7#)
                                                    (LETT |xp| (+ |xp| #8#)
                                                          . #17#))
                                                  . #17#))
                                          . #17#)
                                    (GO G190) G191 (EXIT NIL))))
                             (LETT |l|
                                   (PROG1 (|inc_SI| |l|)
                                     (LETT |zl| (+ |zl| #10#) . #17#))
                                   . #17#)
                             (GO G190) G191 (EXIT NIL))))
                      (LETT |m|
                            (PROG1 (|inc_SI| |m|)
                              (LETT |zm| (+ |zm| #12#) . #17#))
                            . #17#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |h|
                     (PROG1 (|inc_SI| |h|)
                       (LETT |zh| (|add_SI| |zh| #14#) . #17#))
                     . #17#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |z|)))) 

(SDEFUN |CARTEN;reindex;$L$;44| ((|x| $) (|l| |List| (|Integer|)) ($ $))
        (SPROG
         ((|pi| (|Integer|)) (#1=#:G988 NIL) (|i| NIL)
          (|ziv| #2=(|Vector| (|Integer|))) (|xiv| #2#)
          (|p| (|Vector| (|Integer|))) (|rx| (|NonNegativeInteger|)) (|z| ($))
          (|nx| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nx| (SPADCALL |x| (QREFELT $ 32))
                . #3=(|CARTEN;reindex;$L$;44|))
          (LETT |z| (SPADCALL |nx| (|spadConstant| $ 36) (QREFELT $ 37)) . #3#)
          (LETT |rx| (SPADCALL |x| (QREFELT $ 43)) . #3#)
          (LETT |p| (|CARTEN;mkPerm| |rx| |l| $) . #3#)
          (LETT |xiv| (MAKEARR1 |rx| 0) . #3#)
          (LETT |ziv| (MAKEARR1 |rx| 0) . #3#)
          (SEQ (LETT |i| 0 . #3#)
               (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #3#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |pi|
                      (|CARTEN;index2int|
                       (|CARTEN;permute!| |ziv|
                        (|CARTEN;int2index| |i| |xiv| $) |p| $)
                       $)
                      . #3#)
                (EXIT
                 (SPADCALL |z| |pi| (SPADCALL |x| |i| (QREFELT $ 33))
                           (QREFELT $ 38))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |z|)))) 

(DECLAIM (NOTINLINE |CartesianTensor;|)) 

(DEFUN |CartesianTensor| (&REST #1=#:G989)
  (SPROG NIL
         (PROG (#2=#:G990)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|CartesianTensor|)
                                               '|domainEqualList|)
                    . #3=(|CartesianTensor|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |CartesianTensor;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|CartesianTensor|)))))))))) 

(DEFUN |CartesianTensor;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|CartesianTensor|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|CartesianTensor| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 103) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CartesianTensor|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (|IndexedVector| |#3| 0))
          (QSETREFV $ 13 (SPADCALL |#2| 2 (QREFELT $ 12)))
          (QSETREFV $ 14 (SPADCALL |#2| 3 (QREFELT $ 12)))
          (QSETREFV $ 15 (SPADCALL |#2| 4 (QREFELT $ 12)))
          $))) 

(MAKEPROP '|CartesianTensor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| (|PositiveInteger|) (|NonNegativeInteger|)
              (0 . ^) '|dim2| '|dim3| '|dim4| |CARTEN;kroneckerDelta;$;10|
              |CARTEN;sample;$;1| (|Integer|) (|Vector| 18) (6 . |setelt!|)
              (|Boolean|) (13 . ~=) (19 . |elt|) (25 . >) (31 . *) (37 . ~=)
              (|Vector| 21) (43 . |setelt!|) (50 . |elt|) (|Union| $ '"failed")
              (56 . |exquo|) (62 . |#|) (67 . |elt|) (|List| 8)
              |CARTEN;ravel;$L;8| (73 . |Zero|) (77 . |new|) (83 . |setelt!|)
              |CARTEN;unravel;L$;9| (90 . |One|) (94 . |coerce|)
              |CARTEN;leviCivitaSymbol;$;11| |CARTEN;rank;$Nni;13|
              |CARTEN;degree;$Nni;12| |CARTEN;elt;$R;14| |CARTEN;elt;$IR;15|
              |CARTEN;elt;$2IR;16| |CARTEN;elt;$3IR;17| |CARTEN;elt;$4IR;18|
              (|List| 18) |CARTEN;elt;$LR;19| |CARTEN;coerce;L$;20| (|List| $$)
              (99 . |#|) (104 . |first|) (|List| $) |CARTEN;coerce;L$;21|
              (|Union| 8 '"failed") |CARTEN;retractIfCan;$U;22| (|OutputForm|)
              (|List| 60) (109 . |coerce|) (114 . |coerce|) (|List| 56)
              (119 . |matrix|) |CARTEN;coerce;$Of;24| |CARTEN;coerce;R$;27|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CARTEN;Zero;$;25|) $))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CARTEN;One;$;26|) $))
              (|DirectProduct| 7 8) (124 . |minIndex|) (129 . |maxIndex|)
              (134 . |elt|) |CARTEN;coerce;Dp$;28| (|SquareMatrix| 7 8)
              (140 . |elt|) |CARTEN;coerce;Sm$;29| (147 . ~=) |CARTEN;=;2$B;30|
              (153 . +) |CARTEN;+;3$;31| (159 . -) |CARTEN;-;3$;32| (165 . -)
              |CARTEN;-;2$;33| (170 . *) |CARTEN;*;I2$;34| |CARTEN;*;$I$;35|
              (176 . *) |CARTEN;*;R2$;36| |CARTEN;*;$R$;37|
              |CARTEN;product;3$;38| |CARTEN;contract;$I$I$;41|
              |CARTEN;*;3$;39| |CARTEN;contract;$2I$;40| (182 . *)
              |CARTEN;transpose;$2I$;43| |CARTEN;transpose;2$;42|
              |CARTEN;reindex;$L$;44| (|String|) (|SingleInteger|)
              (|HashState|))
           '#(~= 188 |unravel| 194 |transpose| 199 |sample| 211 |retractIfCan|
              215 |retract| 220 |reindex| 225 |ravel| 231 |rank| 236 |product|
              241 |leviCivitaSymbol| 247 |latex| 251 |kroneckerDelta| 256
              |hashUpdate!| 260 |hash| 266 |elt| 271 |degree| 312 |contract|
              317 |coerce| 332 |Zero| 362 |One| 366 = 370 - 376 + 387 * 393)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|GradedAlgebra&| |GradedModule&| |GradedModule&|
                     |SetCategory&| |BasicType&| |RetractableTo&| NIL)
                  (CONS
                   '#((|GradedAlgebra| 8 11) (|GradedModule| 8 11)
                      (|GradedModule| 18 11) (|SetCategory|) (|BasicType|)
                      (|RetractableTo| 8) (|CoercibleTo| 60))
                   (|makeByteWordVec2| 102
                                       '(2 11 0 0 10 12 3 19 18 0 18 18 20 2 18
                                         21 0 0 22 2 19 18 0 18 23 2 18 21 0 0
                                         24 2 18 0 11 0 25 2 11 21 0 0 26 3 27
                                         21 0 18 21 28 2 27 21 0 18 29 2 18 30
                                         0 0 31 1 9 11 0 32 2 9 8 0 18 33 0 8 0
                                         36 2 9 0 11 8 37 3 9 8 0 18 8 38 0 8 0
                                         40 1 8 0 18 41 1 53 11 0 54 1 53 2 0
                                         55 1 61 60 0 62 1 8 60 0 63 1 60 0 64
                                         65 1 70 18 0 71 1 70 18 0 72 2 70 8 0
                                         18 73 3 75 8 0 18 18 76 2 8 21 0 0 78
                                         2 8 0 0 0 80 2 8 0 0 0 82 1 8 0 0 84 2
                                         8 0 18 0 86 2 8 0 0 0 89 2 11 0 10 0
                                         96 2 0 21 0 0 1 1 0 0 34 39 3 0 0 0 18
                                         18 97 1 0 0 0 98 0 0 0 17 1 0 58 0 59
                                         1 0 8 0 1 2 0 0 0 50 99 1 0 34 0 35 1
                                         0 11 0 43 2 0 0 0 0 92 0 0 0 42 1 0
                                         100 0 1 0 0 0 16 2 0 102 102 0 1 1 0
                                         101 0 1 2 0 8 0 50 51 5 0 8 0 18 18 18
                                         18 49 3 0 8 0 18 18 47 4 0 8 0 18 18
                                         18 48 2 0 8 0 18 46 1 0 8 0 45 1 0 11
                                         0 44 4 0 0 0 18 0 18 93 3 0 0 0 18 18
                                         95 1 0 0 56 57 1 0 0 75 77 1 0 0 34 52
                                         1 0 0 70 74 1 0 0 8 67 1 0 60 0 66 0 0
                                         0 68 0 0 0 69 2 0 21 0 0 79 2 0 0 0 0
                                         83 1 0 0 0 85 2 0 0 0 0 81 2 0 0 0 0
                                         94 2 0 0 18 0 87 2 0 0 0 18 88 2 0 0 0
                                         8 91 2 0 0 8 0 90)))))
           '|lookupComplete|)) 
