
(SDEFUN |NFINTBAS;frobMatrix|
        ((|rb| |Matrix| (|Integer|)) (|rbinv| |Matrix| (|Integer|))
         (|rbden| |Integer|) (|p| |NonNegativeInteger|)
         ($ |Matrix| (|Integer|)))
        (SPROG
         ((#1=#:G712 NIL) (|mat| (|Matrix| (|Integer|))) (|a| (F))
          (#2=#:G718 NIL) (|j| NIL) (#3=#:G719 NIL) (|jj| NIL) (#4=#:G716 NIL)
          (|i| NIL) (#5=#:G717 NIL) (|ii| NIL) (|v| (|Vector| F))
          (|b| (|Vector| F)) (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT $ 9)) . #6=(|NFINTBAS;frobMatrix|))
              (LETT |b| (SPADCALL (QREFELT $ 11)) . #6#)
              (LETT |v| (MAKEARR1 |n| (|spadConstant| $ 13)) . #6#)
              (SEQ (LETT |ii| 1 . #6#)
                   (LETT #5# (SPADCALL |rb| (QREFELT $ 18)) . #6#)
                   (LETT |i| (SPADCALL |v| (QREFELT $ 16)) . #6#)
                   (LETT #4# (QVSIZE |v|) . #6#) G190
                   (COND ((OR (> |i| #4#) (|greater_SI| |ii| #5#)) (GO G191)))
                   (SEQ (LETT |a| (|spadConstant| $ 13) . #6#)
                        (SEQ (LETT |jj| 1 . #6#)
                             (LETT #3# (SPADCALL |rb| (QREFELT $ 19)) . #6#)
                             (LETT |j| (SPADCALL |b| (QREFELT $ 16)) . #6#)
                             (LETT #2# (QVSIZE |b|) . #6#) G190
                             (COND
                              ((OR (> |j| #2#) (|greater_SI| |jj| #3#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |a|
                                     (SPADCALL |a|
                                               (SPADCALL
                                                (QAREF2O |rb| |ii| |jj| 1 1)
                                                (QAREF1O |b| |j| 1)
                                                (QREFELT $ 20))
                                               (QREFELT $ 21))
                                     . #6#)))
                             (LETT |j|
                                   (PROG1 (+ |j| 1)
                                     (LETT |jj| (|inc_SI| |jj|) . #6#))
                                   . #6#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (QSETAREF1O |v| |i| (SPADCALL |a| |p| (QREFELT $ 23))
                                     1)))
                   (LETT |i|
                         (PROG1 (+ |i| 1) (LETT |ii| (|inc_SI| |ii|) . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |mat|
                    (SPADCALL (SPADCALL |v| (QREFELT $ 24)) (QREFELT $ 25))
                    . #6#)
              (EXIT
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |rbinv| (QREFELT $ 25)) |mat|
                                    (QREFELT $ 26))
                          (EXPT |rbden| |p|) (QREFELT $ 28))
                         . #6#)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|Matrix| (|Integer|))
                                 (|Union| (|Matrix| (|Integer|)) "failed")
                                 #1#)))))) 

(SDEFUN |NFINTBAS;wildPrimes|
        ((|factoredDisc| |Factored| (|Integer|)) (|n| |Integer|)
         ($ |List| (|Integer|)))
        (SPROG ((|ans| (|List| (|Integer|))) (#1=#:G743 NIL) (|f| NIL))
               (SEQ (LETT |ans| NIL . #2=(|NFINTBAS;wildPrimes|))
                    (SEQ (LETT |f| NIL . #2#)
                         (LETT #1# (SPADCALL |factoredDisc| (QREFELT $ 32))
                               . #2#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QCDR |f|) 1 (QREFELT $ 34))
                             (COND
                              ((SPADCALL (QCAR |f|) |n| (QREFELT $ 35))
                               (LETT |ans| (CONS (QCAR |f|) |ans|) . #2#)))))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |NFINTBAS;tameProduct|
        ((|factoredDisc| |Factored| (|Integer|)) (|n| |Integer|) ($ |Integer|))
        (SPROG ((|ans| (|Integer|)) (#1=#:G750 NIL) (|f| NIL))
               (SEQ (LETT |ans| 1 . #2=(|NFINTBAS;tameProduct|))
                    (SEQ (LETT |f| NIL . #2#)
                         (LETT #1# (SPADCALL |factoredDisc| (QREFELT $ 32))
                               . #2#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QCDR |f|) 1 (QREFELT $ 34))
                             (COND
                              ((SPADCALL (QCAR |f|) |n| (QREFELT $ 34))
                               (LETT |ans| (* (QCAR |f|) |ans|) . #2#)))))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |NFINTBAS;integralBasis;R;4|
        (($ |Record| (|:| |basis| (|Matrix| (|Integer|)))
          (|:| |basisDen| (|Integer|))
          (|:| |basisInv| (|Matrix| (|Integer|)))))
        (SPROG
         ((|runningRbinv| #1=(|Matrix| (|Integer|))) (|runningRb| #1#)
          (|runningRbden| (|Integer|)) (|mat| (|Matrix| (|Integer|)))
          (|disc| #2=(|Integer|)) (|rbden| #3=(|Integer|))
          (|rbinv| #4=(|Matrix| (|Integer|))) (|rb| #5=(|Matrix| (|Integer|)))
          (|lb|
           (|Record| (|:| |basis| #5#) (|:| |basisDen| #3#)
                     (|:| |basisInv| #4#) (|:| |discr| (|Integer|))))
          (#6=#:G762 NIL) (|p| NIL) (|matrixOut| #1#) (|sing| (|Integer|))
          (|wilds| (|List| (|Integer|)))
          (|factoredDisc| (|Factored| (|Integer|))) (|disc0| #2#)
          (|n| (|PositiveInteger|)) (|traceMat| (|Matrix| (|Integer|))))
         (SEQ
          (LETT |traceMat| (SPADCALL (QREFELT $ 36))
                . #7=(|NFINTBAS;integralBasis;R;4|))
          (LETT |n| (SPADCALL (QREFELT $ 9)) . #7#)
          (LETT |disc| (SPADCALL |traceMat| (QREFELT $ 37)) . #7#)
          (LETT |disc0| |disc| . #7#)
          (LETT |factoredDisc| (SPADCALL |disc0| (QREFELT $ 39)) . #7#)
          (LETT |wilds| (|NFINTBAS;wildPrimes| |factoredDisc| |n| $) . #7#)
          (LETT |sing| (|NFINTBAS;tameProduct| |factoredDisc| |n| $) . #7#)
          (LETT |runningRb| (SPADCALL |n| 1 (QREFELT $ 42)) . #7#)
          (LETT |runningRbinv| (SPADCALL |n| 1 (QREFELT $ 42)) . #7#)
          (LETT |runningRbden| 1 . #7#)
          (COND
           ((EQL |sing| 1)
            (COND
             ((NULL |wilds|)
              (EXIT (VECTOR |runningRb| |runningRbden| |runningRbinv|))))))
          (LETT |matrixOut| (SPADCALL |n| 0 (QREFELT $ 42)) . #7#)
          (SEQ (LETT |p| NIL . #7#) (LETT #6# |wilds| . #7#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |lb|
                      (|NFINTBAS;iWildLocalIntegralBasis| |matrixOut| |disc|
                       |p| $)
                      . #7#)
                (LETT |rb| (QVELT |lb| 0) . #7#)
                (LETT |rbinv| (QVELT |lb| 2) . #7#)
                (LETT |rbden| (QVELT |lb| 1) . #7#)
                (LETT |disc| (QVELT |lb| 3) . #7#)
                (EXIT
                 (COND
                  ((SPADCALL 1 |rbden| (QREFELT $ 43))
                   (SEQ
                    (LETT |mat|
                          (SPADCALL
                           (SPADCALL |rbden| |runningRb| (QREFELT $ 44))
                           (SPADCALL |runningRbden| |rb| (QREFELT $ 44))
                           (QREFELT $ 45))
                          . #7#)
                    (LETT |runningRbden| (* |runningRbden| |rbden|) . #7#)
                    (LETT |runningRb|
                          (SPADCALL
                           (SPADCALL |mat| |runningRbden| (QREFELT $ 47))
                           (QREFELT $ 48))
                          . #7#)
                    (EXIT
                     (LETT |runningRbinv|
                           (SPADCALL |runningRb| |runningRbden| (QREFELT $ 50))
                           . #7#)))))))
               (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
          (LETT |lb|
                (|NFINTBAS;iTameLocalIntegralBasis| |traceMat| |disc| |sing| $)
                . #7#)
          (LETT |rb| (QVELT |lb| 0) . #7#) (LETT |rbinv| (QVELT |lb| 2) . #7#)
          (LETT |rbden| (QVELT |lb| 1) . #7#)
          (LETT |disc| (QVELT |lb| 3) . #7#)
          (COND
           ((SPADCALL 1 |rbden| (QREFELT $ 43))
            (SEQ
             (LETT |mat|
                   (SPADCALL (SPADCALL |rbden| |runningRb| (QREFELT $ 44))
                             (SPADCALL |runningRbden| |rb| (QREFELT $ 44))
                             (QREFELT $ 45))
                   . #7#)
             (LETT |runningRbden| (* |runningRbden| |rbden|) . #7#)
             (LETT |runningRb|
                   (SPADCALL (SPADCALL |mat| |runningRbden| (QREFELT $ 47))
                             (QREFELT $ 48))
                   . #7#)
             (EXIT
              (LETT |runningRbinv|
                    (SPADCALL |runningRb| |runningRbden| (QREFELT $ 50))
                    . #7#)))))
          (EXIT (VECTOR |runningRb| |runningRbden| |runningRbinv|))))) 

(SDEFUN |NFINTBAS;localIntegralBasis;IR;5|
        ((|p| |Integer|)
         ($ |Record| (|:| |basis| (|Matrix| (|Integer|)))
          (|:| |basisDen| (|Integer|))
          (|:| |basisInv| (|Matrix| (|Integer|)))))
        (SPROG
         ((|lb|
           (|Record| (|:| |basis| (|Matrix| (|Integer|)))
                     (|:| |basisDen| (|Integer|))
                     (|:| |basisInv| (|Matrix| (|Integer|)))
                     (|:| |discr| (|Integer|))))
          (|disc| (|Integer|)) (|n| (|PositiveInteger|))
          (|traceMat| (|Matrix| (|Integer|))))
         (SEQ
          (LETT |traceMat| (SPADCALL (QREFELT $ 36))
                . #1=(|NFINTBAS;localIntegralBasis;IR;5|))
          (LETT |n| (SPADCALL (QREFELT $ 9)) . #1#)
          (LETT |disc| (SPADCALL |traceMat| (QREFELT $ 37)) . #1#)
          (EXIT
           (COND
            ((QEQCAR (SPADCALL |disc| (* |p| |p|) (QREFELT $ 53)) 1)
             (VECTOR (SPADCALL |n| 1 (QREFELT $ 42)) 1
                     (SPADCALL |n| 1 (QREFELT $ 42))))
            (#2='T
             (SEQ
              (LETT |lb|
                    (COND
                     ((SPADCALL |p| (SPADCALL (QREFELT $ 9)) (QREFELT $ 34))
                      (|NFINTBAS;iTameLocalIntegralBasis| |traceMat| |disc| |p|
                       $))
                     (#2#
                      (|NFINTBAS;iWildLocalIntegralBasis|
                       (SPADCALL |n| 0 (QREFELT $ 42)) |disc| |p| $)))
                    . #1#)
              (EXIT
               (VECTOR (QVELT |lb| 0) (QVELT |lb| 1) (QVELT |lb| 2)))))))))) 

(SDEFUN |NFINTBAS;iTameLocalIntegralBasis|
        ((|traceMat| . #1=(|Matrix| (|Integer|))) (|disc| . #2=(|Integer|))
         (|sing| |Integer|)
         ($ |Record| (|:| |basis| (|Matrix| (|Integer|)))
          (|:| |basisDen| (|Integer|)) (|:| |basisInv| (|Matrix| (|Integer|)))
          (|:| |discr| (|Integer|))))
        (SPROG
         ((|tfm| #1#) (#3=#:G773 NIL) (#4=#:G780 NIL) (|oldIndex| (|Integer|))
          (|indexChange| (|Integer|)) (|rbinv| #5=(|Matrix| (|Integer|)))
          (|rbden| (|Integer|)) (|rb| #5#) (|g| (|Integer|))
          (|index| (|Integer|)) (|idinv| (|Matrix| (|Integer|)))
          (|id| (|Matrix| (|Integer|))) (|disc0| #2#)
          (|n| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL (QREFELT $ 9))
                  . #6=(|NFINTBAS;iTameLocalIntegralBasis|))
            (LETT |disc0| |disc| . #6#)
            (LETT |rb| (SPADCALL |n| 1 (QREFELT $ 42)) . #6#)
            (LETT |rbinv| (SPADCALL |n| 1 (QREFELT $ 42)) . #6#)
            (LETT |rbden| 1 . #6#) (LETT |index| 1 . #6#)
            (LETT |oldIndex| 1 . #6#) (LETT |tfm| |traceMat| . #6#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (LETT |idinv|
                         (SPADCALL
                          (SPADCALL (SPADCALL |tfm| |sing| (QREFELT $ 47))
                                    (QREFELT $ 48))
                          (QREFELT $ 25))
                         . #6#)
                   (LETT |id|
                         (SPADCALL (SPADCALL |idinv| |sing| (QREFELT $ 55))
                                   (QREFELT $ 56))
                         . #6#)
                   (LETT |idinv| (SPADCALL |id| |sing| (QREFELT $ 50)) . #6#)
                   (LETT |rbinv|
                         (SPADCALL (SPADCALL |id| |rb| (QREFELT $ 26))
                                   (SPADCALL |rbinv| |idinv| (QREFELT $ 26))
                                   (* |sing| |rbden|) (QREFELT $ 58))
                         . #6#)
                   (LETT |index| (SPADCALL |rbinv| (QREFELT $ 59)) . #6#)
                   (LETT |rb|
                         (SPADCALL
                          (SPADCALL |rbinv| (* |sing| |rbden|) (QREFELT $ 55))
                          (QREFELT $ 56))
                         . #6#)
                   (LETT |g| (SPADCALL |rb| |sing| |n| (QREFELT $ 60)) . #6#)
                   (COND
                    ((SPADCALL 1 |g| (QREFELT $ 43))
                     (LETT |rb|
                           (PROG2
                               (LETT #3# (SPADCALL |rb| |g| (QREFELT $ 28))
                                     . #6#)
                               (QCDR #3#)
                             (|check_union2| (QEQCAR #3# 0)
                                             (|Matrix| (|Integer|))
                                             (|Union| (|Matrix| (|Integer|))
                                                      #7="failed")
                                             #3#))
                           . #6#)))
                   (LETT |rbden| (* |rbden| (QUOTIENT2 |sing| |g|)) . #6#)
                   (LETT |rbinv| (SPADCALL |rb| |rbden| (QREFELT $ 50)) . #6#)
                   (LETT |disc| (QUOTIENT2 |disc0| (* |index| |index|)) . #6#)
                   (LETT |indexChange| (QUOTIENT2 |index| |oldIndex|) . #6#)
                   (LETT |oldIndex| |index| . #6#)
                   (EXIT
                    (COND
                     ((EQL |indexChange| 1)
                      (PROGN
                       (LETT #4# (VECTOR |rb| |rbden| |rbinv| |disc|) . #6#)
                       (GO #8=#:G779)))
                     ('T
                      (LETT |tfm|
                            (PROG2
                                (LETT #3#
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |rb| |traceMat|
                                                  (QREFELT $ 26))
                                        (SPADCALL |rb| (QREFELT $ 25))
                                        (QREFELT $ 26))
                                       (* |rbden| |rbden|) (QREFELT $ 28))
                                      . #6#)
                                (QCDR #3#)
                              (|check_union2| (QEQCAR #3# 0)
                                              (|Matrix| (|Integer|))
                                              (|Union| (|Matrix| (|Integer|))
                                                       #7#)
                                              #3#))
                            . #6#)))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #8# (EXIT #4#)))) 

(SDEFUN |NFINTBAS;iWildLocalIntegralBasis|
        ((|matrixOut| |Matrix| (|Integer|)) (|disc| . #1=(|Integer|))
         (|p| |Integer|)
         ($ |Record| (|:| |basis| (|Matrix| (|Integer|)))
          (|:| |basisDen| (|Integer|)) (|:| |basisInv| (|Matrix| (|Integer|)))
          (|:| |discr| (|Integer|))))
        (SPROG
         ((#2=#:G824 NIL) (#3=#:G825 NIL) (|oldIndex| (|Integer|))
          (|indexChange| (|Integer|)) (|rbinv| #4=(|Matrix| (|Integer|)))
          (|rbden| (|Integer|)) (|rb| #4#) (|index| (|Integer|))
          (|idinv| (|Matrix| (|Integer|))) (|id| (|Matrix| (|Integer|)))
          (|tfm| (|Matrix| (|Integer|))) (#5=#:G817 NIL)
          (|lp| (|NonNegativeInteger|)) (#6=#:G783 NIL) (|p2| (|Integer|))
          (|disc0| #1#) (|n| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL (QREFELT $ 9))
                  . #7=(|NFINTBAS;iWildLocalIntegralBasis|))
            (LETT |disc0| |disc| . #7#)
            (LETT |rb| (SPADCALL |n| 1 (QREFELT $ 42)) . #7#)
            (LETT |rbinv| (SPADCALL |n| 1 (QREFELT $ 42)) . #7#)
            (LETT |rbden| 1 . #7#) (LETT |index| 1 . #7#)
            (LETT |oldIndex| 1 . #7#) (LETT |p2| (* |p| |p|) . #7#)
            (LETT |lp|
                  (SPADCALL
                   (PROG1 (LETT #6# |p| . #7#)
                     (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #6#))
                   |n| (QREFELT $ 61))
                  . #7#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (LETT |tfm|
                         (SPADCALL
                          (|NFINTBAS;frobMatrix| |rb| |rbinv| |rbden|
                           (PROG1 (LETT #5# |p| . #7#)
                             (|check_subtype2| (>= #5# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #5#))
                           $)
                          |lp| (QREFELT $ 62))
                         . #7#)
                   (LETT |idinv|
                         (SPADCALL
                          (SPADCALL (SPADCALL |tfm| |p| (QREFELT $ 47))
                                    (QREFELT $ 48))
                          (QREFELT $ 25))
                         . #7#)
                   (LETT |id|
                         (SPADCALL (SPADCALL |idinv| |p| (QREFELT $ 55))
                                   (QREFELT $ 56))
                         . #7#)
                   (LETT |idinv| (SPADCALL |id| |p| (QREFELT $ 50)) . #7#)
                   (LETT |rbinv|
                         (SPADCALL (SPADCALL |id| |rb| (QREFELT $ 26))
                                   (SPADCALL |rbinv| |idinv| (QREFELT $ 26))
                                   (* |p| |rbden|) (QREFELT $ 58))
                         . #7#)
                   (LETT |index| (SPADCALL |rbinv| (QREFELT $ 59)) . #7#)
                   (LETT |rb|
                         (SPADCALL
                          (SPADCALL |rbinv| (* |p| |rbden|) (QREFELT $ 55))
                          (QREFELT $ 56))
                         . #7#)
                   (COND
                    ((EQL (SPADCALL |rb| |matrixOut| |p| |n| (QREFELT $ 63)) 1)
                     (LETT |rb| |matrixOut| . #7#))
                    ('T (LETT |rbden| (* |p| |rbden|) . #7#)))
                   (LETT |rbinv| (SPADCALL |rb| |rbden| (QREFELT $ 50)) . #7#)
                   (LETT |indexChange| (QUOTIENT2 |index| |oldIndex|) . #7#)
                   (LETT |oldIndex| |index| . #7#)
                   (LETT |disc|
                         (QUOTIENT2 |disc| (* |indexChange| |indexChange|))
                         . #7#)
                   (EXIT
                    (COND
                     ((EQL |indexChange| 1)
                      (PROGN
                       (LETT #3# (VECTOR |rb| |rbden| |rbinv| |disc|) . #7#)
                       (GO #8=#:G823)))
                     ('T
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (GCD |p2| |disc|) |p2| (QREFELT $ 64))
                          (PROGN
                           (LETT #2#
                                 (PROGN
                                  (LETT #3#
                                        (VECTOR |rb| |rbden| |rbinv| |disc|)
                                        . #7#)
                                  (GO #8#))
                                 . #7#)
                           (GO #9=#:G819)))))
                       #9# (EXIT #2#))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #8# (EXIT #3#)))) 

(SDEFUN |NFINTBAS;discriminant;I;8| (($ |Integer|))
        (SPROG
         ((#1=#:G828 NIL) (|index| (|Integer|)) (|rbden| #2=(|Integer|))
          (|rb| #3=(|Matrix| (|Integer|)))
          (|intBas|
           (|Record| (|:| |basis| #3#) (|:| |basisDen| #2#)
                     (|:| |basisInv| (|Matrix| (|Integer|)))))
          (|disc| (|Integer|)))
         (SEQ
          (LETT |disc| (SPADCALL (SPADCALL (QREFELT $ 36)) (QREFELT $ 37))
                . #4=(|NFINTBAS;discriminant;I;8|))
          (LETT |intBas| (SPADCALL (QREFELT $ 52)) . #4#)
          (LETT |rb| (QVELT |intBas| 0) . #4#)
          (LETT |rbden| (QVELT |intBas| 1) . #4#)
          (LETT |index|
                (PROG2
                    (LETT #1#
                          (SPADCALL (EXPT |rbden| (SPADCALL (QREFELT $ 9)))
                                    (SPADCALL |rb| (QREFELT $ 37))
                                    (QREFELT $ 53))
                          . #4#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                  (|Union| (|Integer|) #5="failed") #1#))
                . #4#)
          (EXIT
           (PROG2
               (LETT #1# (SPADCALL |disc| (* |index| |index|) (QREFELT $ 53))
                     . #4#)
               (QCDR #1#)
             (|check_union2| (QEQCAR #1# 0) (|Integer|)
                             (|Union| (|Integer|) #5#) #1#)))))) 

(DECLAIM (NOTINLINE |NumberFieldIntegralBasis;|)) 

(DEFUN |NumberFieldIntegralBasis| (&REST #1=#:G832)
  (SPROG NIL
         (PROG (#2=#:G833)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|NumberFieldIntegralBasis|)
                                               '|domainEqualList|)
                    . #3=(|NumberFieldIntegralBasis|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |NumberFieldIntegralBasis;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|NumberFieldIntegralBasis|)))))))))) 

(DEFUN |NumberFieldIntegralBasis;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|NumberFieldIntegralBasis|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|NumberFieldIntegralBasis| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 66) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|NumberFieldIntegralBasis|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|NumberFieldIntegralBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |rank|) (|Vector| $) (4 . |basis|)
              (8 . |Zero|) (12 . |Zero|) (|Integer|) (|Vector| 7)
              (16 . |minIndex|) (|Matrix| 14) (21 . |maxRowIndex|)
              (26 . |maxColIndex|) (31 . *) (37 . +) (|NonNegativeInteger|)
              (43 . ^) (49 . |coordinates|) (54 . |transpose|) (59 . *)
              (|Union| $ '"failed") (65 . |exquo|)
              (|Record| (|:| |factor| 14) (|:| |exponent| 14)) (|List| 29)
              (|Factored| 14) (71 . |factors|) (|Boolean|) (76 . >) (82 . <=)
              (88 . |traceMatrix|) (92 . |determinant|)
              (|IntegerFactorizationPackage| 14) (97 . |factor|) (102 . |One|)
              (106 . |One|) (110 . |scalarMatrix|) (116 . |sizeLess?|)
              (122 . *) (128 . |vertConcat|)
              (|ModularHermitianRowReduction| 14) (134 . |rowEchelon|)
              (140 . |squareTop|)
              (|TriangularMatrixOperations| 14 (|Vector| 14) (|Vector| 14) 17)
              (145 . |UpTriBddDenomInv|)
              (|Record| (|:| |basis| 17) (|:| |basisDen| 14)
                        (|:| |basisInv| 17))
              |NFINTBAS;integralBasis;R;4| (151 . |exquo|)
              |NFINTBAS;localIntegralBasis;IR;5| (157 . |LowTriBddDenomInv|)
              (163 . |rowEchelon|) (|IntegralBasisTools| 14 6 7)
              (168 . |idealiser|) (175 . |diagonalProduct|) (180 . |matrixGcd|)
              (187 . |leastPower|) (193 . ^) (199 . |divideIfCan!|) (207 . ~=)
              |NFINTBAS;discriminant;I;8|)
           '#(|localIntegralBasis| 213 |integralBasis| 218 |discriminant| 222)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 65
                                                 '(0 7 8 9 0 7 10 11 0 6 0 12 0
                                                   7 0 13 1 15 14 0 16 1 17 14
                                                   0 18 1 17 14 0 19 2 7 0 14 0
                                                   20 2 7 0 0 0 21 2 7 0 0 22
                                                   23 1 7 17 10 24 1 17 0 0 25
                                                   2 17 0 0 0 26 2 17 27 0 14
                                                   28 1 31 30 0 32 2 14 33 0 0
                                                   34 2 14 33 0 0 35 0 7 17 36
                                                   1 17 14 0 37 1 38 31 14 39 0
                                                   6 0 40 0 7 0 41 2 17 0 22 14
                                                   42 2 14 33 0 0 43 2 17 0 14
                                                   0 44 2 17 0 0 0 45 2 46 17
                                                   17 14 47 1 17 0 0 48 2 49 17
                                                   17 14 50 2 14 27 0 0 53 2 49
                                                   17 17 14 55 1 17 0 0 56 3 57
                                                   17 17 17 14 58 1 57 14 17 59
                                                   3 57 14 17 14 22 60 2 57 22
                                                   22 22 61 2 17 0 0 22 62 4 57
                                                   14 17 17 14 14 63 2 14 33 0
                                                   0 64 1 0 51 14 54 0 0 51 52
                                                   0 0 14 65)))))
           '|lookupComplete|)) 
