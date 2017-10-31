
(SDEFUN |RECLOS;relativeApprox;2$F;1|
        ((|nbe| $) (|prec| $) ($ |Fraction| (|Integer|)))
        (SPROG ((|appr| ($)))
               (SEQ
                (COND ((QEQCAR |nbe| 0) (SPADCALL |nbe| (QREFELT $ 14)))
                      ('T
                       (SEQ
                        (LETT |appr|
                              (SPADCALL (QVELT (QCDR |nbe|) 1)
                                        (QVELT (QCDR |nbe|) 0) |prec|
                                        (QREFELT $ 17))
                              |RECLOS;relativeApprox;2$F;1|)
                        (EXIT (SPADCALL |appr| |prec| (QREFELT $ 18))))))))) 

(SDEFUN |RECLOS;approximate;2$F;2|
        ((|nbe| $) (|prec| $) ($ |Fraction| (|Integer|)))
        (SPROG ((|appr| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |nbe| (QREFELT $ 19)) |prec|
                            (QREFELT $ 21))
                  (|spadConstant| $ 22))
                 ((QEQCAR |nbe| 0) (SPADCALL |nbe| (QREFELT $ 14)))
                 ('T
                  (SEQ
                   (LETT |appr|
                         (SPADCALL (QVELT (QCDR |nbe|) 1)
                                   (QVELT (QCDR |nbe|) 0) |prec|
                                   (QREFELT $ 23))
                         |RECLOS;approximate;2$F;2|)
                   (EXIT (SPADCALL |appr| |prec| (QREFELT $ 24))))))))) 

(SDEFUN |RECLOS;newElementIfneeded|
        ((|s| |RightOpenIntervalRootCharacterization| $
          (|SparseUnivariatePolynomial| $))
         (|o| |OutputForm|) ($ $))
        (SPROG ((|res| (|Rec|)) (|p| (|SparseUnivariatePolynomial| $)))
               (SEQ
                (LETT |p| (SPADCALL |s| (QREFELT $ 25))
                      . #1=(|RECLOS;newElementIfneeded|))
                (EXIT
                 (COND
                  ((EQL (SPADCALL |p| (QREFELT $ 27)) 1)
                   (SPADCALL
                    (SPADCALL (SPADCALL |p| 0 (QREFELT $ 30))
                              (SPADCALL |p| (QREFELT $ 31)) (QREFELT $ 32))
                    (QREFELT $ 33)))
                  ('T
                   (SEQ
                    (LETT |res|
                          (VECTOR |s|
                                  (SPADCALL (|spadConstant| $ 34) 1
                                            (QREFELT $ 36))
                                  |o| (QREFELT $ 9))
                          . #1#)
                    (SETELT $ 9 (+ (QREFELT $ 9) 1))
                    (EXIT (CONS 1 |res|))))))))) 

(SDEFUN |RECLOS;algebraicOf;RoircOf$;4|
        ((|s| |RightOpenIntervalRootCharacterization| $
          (|SparseUnivariatePolynomial| $))
         (|o| |OutputForm|) ($ $))
        (SPROG ((|res| (|Rec|)) (|pol| (|SparseUnivariatePolynomial| $)))
               (SEQ
                (LETT |pol| (SPADCALL |s| (QREFELT $ 25))
                      . #1=(|RECLOS;algebraicOf;RoircOf$;4|))
                (EXIT
                 (COND
                  ((EQL (SPADCALL |pol| (QREFELT $ 27)) 1)
                   (SPADCALL
                    (SPADCALL (SPADCALL |pol| 0 (QREFELT $ 30))
                              (SPADCALL |pol| (QREFELT $ 31)) (QREFELT $ 32))
                    (QREFELT $ 33)))
                  ('T
                   (SEQ
                    (LETT |res|
                          (VECTOR |s|
                                  (SPADCALL (|spadConstant| $ 34) 1
                                            (QREFELT $ 36))
                                  |o| (QREFELT $ 9))
                          . #1#)
                    (SETELT $ 9 (+ (QREFELT $ 9) 1))
                    (EXIT (CONS 1 |res|))))))))) 

(SDEFUN |RECLOS;rename!;$Of$;5| ((|x| $) (|o| |OutputForm|) ($ $))
        (SEQ (QSETVELT (QCDR |x|) 2 |o|) (EXIT |x|))) 

(SDEFUN |RECLOS;rename;$Of$;6| ((|x| $) (|o| |OutputForm|) ($ $))
        (CONS 1
              (VECTOR (QVELT (QCDR |x|) 0) (QVELT (QCDR |x|) 1) |o|
                      (QVELT (QCDR |x|) 3)))) 

(SDEFUN |RECLOS;rootOf;SupPiU;7|
        ((|pol| |SparseUnivariatePolynomial| $) (|n| |PositiveInteger|)
         ($ |Union| $ "failed"))
        (SPROG
         ((|o| (|OutputForm|))
          (|r|
           (|Union|
            (|RightOpenIntervalRootCharacterization| $
                                                     (|SparseUnivariatePolynomial|
                                                      $))
            "failed")))
         (SEQ
          (COND ((EQL (SPADCALL |pol| (QREFELT $ 27)) 0) (CONS 1 "failed"))
                ((EQL (SPADCALL |pol| (QREFELT $ 27)) 1)
                 (COND
                  ((EQL |n| 1)
                   (CONS 0
                         (SPADCALL
                          (SPADCALL (SPADCALL |pol| 0 (QREFELT $ 30))
                                    (SPADCALL |pol| (QREFELT $ 31))
                                    (QREFELT $ 32))
                          (QREFELT $ 33))))
                  (#1='T (CONS 1 "failed"))))
                (#1#
                 (SEQ
                  (LETT |r| (SPADCALL |pol| |n| (QREFELT $ 44))
                        . #2=(|RECLOS;rootOf;SupPiU;7|))
                  (EXIT
                   (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                         (#1#
                          (SEQ
                           (LETT |o|
                                 (SPADCALL
                                  (SPADCALL (QREFELT $ 12) (QREFELT $ 45))
                                  (SPADCALL (QREFELT $ 9) (QREFELT $ 46))
                                  (QREFELT $ 47))
                                 . #2#)
                           (EXIT
                            (CONS 0
                                  (SPADCALL (QCDR |r|) |o|
                                            (QREFELT $ 39)))))))))))))) 

(SDEFUN |RECLOS;allRootsOf;SupL;8|
        ((|pol| |SparseUnivariatePolynomial| $) ($ |List| $))
        (SPROG
         ((|res| (|List| $)) (|o| (|OutputForm|)) (#1=#:G790 NIL) (|term| NIL)
          (|liste|
           (|List|
            (|RightOpenIntervalRootCharacterization| $
                                                     (|SparseUnivariatePolynomial|
                                                      $)))))
         (SEQ
          (COND ((EQL (SPADCALL |pol| (QREFELT $ 27)) 0) NIL)
                ((EQL (SPADCALL |pol| (QREFELT $ 27)) 1)
                 (LIST
                  (SPADCALL
                   (SPADCALL (SPADCALL |pol| 0 (QREFELT $ 30))
                             (SPADCALL |pol| (QREFELT $ 31)) (QREFELT $ 32))
                   (QREFELT $ 33))))
                ('T
                 (SEQ
                  (LETT |liste| (SPADCALL |pol| (QREFELT $ 51))
                        . #2=(|RECLOS;allRootsOf;SupL;8|))
                  (LETT |res| NIL . #2#)
                  (SEQ (LETT |term| NIL . #2#) (LETT #1# |liste| . #2#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |term| (CAR #1#) . #2#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |o|
                              (SPADCALL
                               (SPADCALL (QREFELT $ 12) (QREFELT $ 45))
                               (SPADCALL (QREFELT $ 9) (QREFELT $ 46))
                               (QREFELT $ 47))
                              . #2#)
                        (EXIT
                         (LETT |res|
                               (SPADCALL (SPADCALL |term| |o| (QREFELT $ 39))
                                         |res| (QREFELT $ 53))
                               . #2#)))
                       (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL |res| (QREFELT $ 54))))))))) 

(SDEFUN |RECLOS;coerce;2$;9| ((|x| $) ($ $))
        (COND ((QEQCAR |x| 0) |x|)
              ('T
               (CONS 1
                     (VECTOR (QVELT (QCDR |x|) 0)
                             (SPADCALL (QVELT (QCDR |x|) 1)
                                       (SPADCALL (QVELT (QCDR |x|) 0)
                                                 (QREFELT $ 25))
                                       (QREFELT $ 56))
                             (QVELT (QCDR |x|) 2) (QVELT (QCDR |x|) 3)))))) 

(SDEFUN |RECLOS;positive?;$B;10| ((|x| $) ($ |Boolean|))
        (COND ((QEQCAR |x| 0) (SPADCALL (QCDR |x|) (QREFELT $ 58)))
              ('T
               (SPADCALL (QVELT (QCDR |x|) 1) (QVELT (QCDR |x|) 0)
                         (QREFELT $ 59))))) 

(SDEFUN |RECLOS;negative?;$B;11| ((|x| $) ($ |Boolean|))
        (COND ((QEQCAR |x| 0) (SPADCALL (QCDR |x|) (QREFELT $ 61)))
              ('T
               (SPADCALL (QVELT (QCDR |x|) 1) (QVELT (QCDR |x|) 0)
                         (QREFELT $ 62))))) 

(SDEFUN |RECLOS;abs;2$;12| ((|x| $) ($ $))
        (SPADCALL (SPADCALL |x| (QREFELT $ 65)) |x| (QREFELT $ 66))) 

(SDEFUN |RECLOS;sign;$I;13| ((|x| $) ($ |Integer|))
        (COND ((QEQCAR |x| 0) (SPADCALL (QCDR |x|) (QREFELT $ 67)))
              ('T
               (SPADCALL (QVELT (QCDR |x|) 1) (QVELT (QCDR |x|) 0)
                         (QREFELT $ 68))))) 

(SDEFUN |RECLOS;<;2$B;14| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |y| |x| (QREFELT $ 69)) (QREFELT $ 60))) 

(SDEFUN |RECLOS;=;2$B;15| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |x| |y| (QREFELT $ 69)) (QREFELT $ 70))) 

(SDEFUN |RECLOS;mainCharacterization;$U;16|
        ((|x| $)
         ($ |Union|
          (|RightOpenIntervalRootCharacterization| $
                                                   (|SparseUnivariatePolynomial|
                                                    $))
          "failed"))
        (COND ((QEQCAR |x| 0) (CONS 1 "failed"))
              ('T (CONS 0 (QVELT (QCDR |x|) 0))))) 

(SDEFUN |RECLOS;mainDefiningPolynomial;$U;17|
        ((|x| $) ($ |Union| (|SparseUnivariatePolynomial| $) "failed"))
        (COND ((QEQCAR |x| 0) (CONS 1 "failed"))
              ('T (CONS 0 (SPADCALL (QVELT (QCDR |x|) 0) (QREFELT $ 25)))))) 

(SDEFUN |RECLOS;mainForm;$U;18| ((|x| $) ($ |Union| (|OutputForm|) "failed"))
        (COND ((QEQCAR |x| 0) (CONS 1 "failed"))
              ('T (CONS 0 (QVELT (QCDR |x|) 2))))) 

(SDEFUN |RECLOS;mainValue;$U;19|
        ((|x| $) ($ |Union| (|SparseUnivariatePolynomial| $) "failed"))
        (COND ((QEQCAR |x| 0) (CONS 1 "failed"))
              ('T (CONS 0 (QVELT (QCDR |x|) 1))))) 

(SDEFUN |RECLOS;coerce;$Of;20| ((|x| $) ($ |OutputForm|))
        (SPROG ((|xx| ($)))
               (SEQ
                (COND ((QEQCAR |x| 0) (SPADCALL (QCDR |x|) (QREFELT $ 79)))
                      ('T
                       (SEQ
                        (LETT |xx| (SPADCALL |x| (QREFELT $ 57))
                              |RECLOS;coerce;$Of;20|)
                        (EXIT
                         (SPADCALL
                          (SPADCALL (QVELT (QCDR |xx|) 1) (QREFELT $ 80))
                          (QVELT (QCDR |x|) 2) (QREFELT $ 81))))))))) 

(SDEFUN |RECLOS;inv;2$;21| ((|x| $) ($ $))
        (SPROG ((|res| (|Union| $ "failed")))
               (SEQ
                (LETT |res| (SPADCALL |x| (QREFELT $ 83)) |RECLOS;inv;2$;21|)
                (EXIT
                 (COND ((QEQCAR |res| 1) (|error| "Division by 0"))
                       ('T (QCDR |res|))))))) 

(SDEFUN |RECLOS;recip;$U;22| ((|x| $) ($ |Union| $ "failed"))
        (SPROG ((|r| (|Union| (|SparseUnivariatePolynomial| $) "failed")))
               (SEQ
                (COND
                 ((QEQCAR |x| 0)
                  (SEQ
                   (LETT |r| (SPADCALL (QCDR |x|) (QREFELT $ 85))
                         . #1=(|RECLOS;recip;$U;22|))
                   (EXIT
                    (COND ((QEQCAR |r| 0) (CONS 0 (CONS 0 (QCDR |r|))))
                          (#2='T (CONS 1 "failed"))))))
                 (#2#
                  (SEQ
                   (LETT |r|
                         (SPADCALL (QVELT (QCDR |x|) 1) (QVELT (QCDR |x|) 0)
                                   (QREFELT $ 87))
                         . #1#)
                   (EXIT
                    (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                          (#2#
                           (CONS 0
                                 (|RECLOS;lessAlgebraic|
                                  (CONS 1
                                        (VECTOR (QVELT (QCDR |x|) 0) (QCDR |r|)
                                                (QVELT (QCDR |x|) 2)
                                                (QVELT (QCDR |x|) 3)))
                                  $))))))))))) 

(SDEFUN |RECLOS;*;I2$;23| ((|n| |Integer|) (|x| $) ($ $))
        (SPROG NIL
               (COND
                ((QEQCAR |x| 0)
                 (CONS 0 (SPADCALL |n| (QCDR |x|) (QREFELT $ 88))))
                ((ZEROP |n|) (|spadConstant| $ 28)) ((EQL |n| 1) |x|)
                ('T
                 (CONS 1
                       (VECTOR (QVELT (QCDR |x|) 0)
                               (SPADCALL
                                (CONS #'|RECLOS;*;I2$;23!0| (VECTOR $ |n|))
                                (QVELT (QCDR |x|) 1) (QREFELT $ 90))
                               (QVELT (QCDR |x|) 2) (QVELT (QCDR |x|) 3))))))) 

(SDEFUN |RECLOS;*;I2$;23!0| ((|z| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1) . #1=(|RECLOS;*;I2$;23|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |n| |z| (QREFELT $ 66)))))) 

(SDEFUN |RECLOS;*;TheField2$;24| ((|rn| |TheField|) (|x| $) ($ $))
        (SPROG NIL
               (COND
                ((QEQCAR |x| 0)
                 (CONS 0 (SPADCALL |rn| (QCDR |x|) (QREFELT $ 92))))
                ((SPADCALL |rn| (QREFELT $ 93)) (|spadConstant| $ 28))
                ((SPADCALL |rn| (QREFELT $ 94)) |x|)
                ('T
                 (CONS 1
                       (VECTOR (QVELT (QCDR |x|) 0)
                               (SPADCALL
                                (CONS #'|RECLOS;*;TheField2$;24!0|
                                      (VECTOR $ |rn|))
                                (QVELT (QCDR |x|) 1) (QREFELT $ 90))
                               (QVELT (QCDR |x|) 2) (QVELT (QCDR |x|) 3))))))) 

(SDEFUN |RECLOS;*;TheField2$;24!0| ((|z| NIL) ($$ NIL))
        (PROG (|rn| $)
          (LETT |rn| (QREFELT $$ 1) . #1=(|RECLOS;*;TheField2$;24|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |rn| |z| (QREFELT $ 95)))))) 

(SDEFUN |RECLOS;*;3$;25| ((|x| $) (|y| $) ($ $))
        (SPROG NIL
               (SEQ
                (COND
                 ((QEQCAR |x| 0)
                  (COND
                   ((QEQCAR |y| 0)
                    (EXIT
                     (CONS 0
                           (SPADCALL (QCDR |x|) (QCDR |y|)
                                     (QREFELT $ 92))))))))
                (EXIT
                 (COND
                  ((QEQCAR |x| 0) (SPADCALL (QCDR |x|) |y| (QREFELT $ 95)))
                  ((QEQCAR |y| 0) (SPADCALL (QCDR |y|) |x| (QREFELT $ 95)))
                  (#1='T
                   (COND
                    ((SPADCALL (QVELT (QCDR |y|) 3) (QVELT (QCDR |x|) 3)
                               (QREFELT $ 96))
                     (CONS 1
                           (VECTOR (QVELT (QCDR |y|) 0)
                                   (SPADCALL
                                    (CONS #'|RECLOS;*;3$;25!0| (VECTOR $ |x|))
                                    (QVELT (QCDR |y|) 1) (QREFELT $ 90))
                                   (QVELT (QCDR |y|) 2) (QVELT (QCDR |y|) 3))))
                    ((SPADCALL (QVELT (QCDR |x|) 3) (QVELT (QCDR |y|) 3)
                               (QREFELT $ 96))
                     (CONS 1
                           (VECTOR (QVELT (QCDR |x|) 0)
                                   (SPADCALL
                                    (CONS #'|RECLOS;*;3$;25!1| (VECTOR $ |y|))
                                    (QVELT (QCDR |x|) 1) (QREFELT $ 90))
                                   (QVELT (QCDR |x|) 2) (QVELT (QCDR |x|) 3))))
                    (#1#
                     (|RECLOS;lessAlgebraic|
                      (CONS 1
                            (VECTOR (QVELT (QCDR |x|) 0)
                                    (SPADCALL
                                     (SPADCALL (QVELT (QCDR |x|) 1)
                                               (QVELT (QCDR |y|) 1)
                                               (QREFELT $ 98))
                                     (SPADCALL (QVELT (QCDR |x|) 0)
                                               (QREFELT $ 25))
                                     (QREFELT $ 56))
                                    (QVELT (QCDR |x|) 2) (QVELT (QCDR |x|) 3)))
                      $))))))))) 

(SDEFUN |RECLOS;*;3$;25!1| ((|z| NIL) ($$ NIL))
        (PROG (|y| $)
          (LETT |y| (QREFELT $$ 1) . #1=(|RECLOS;*;3$;25|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z| |y| (QREFELT $ 97)))))) 

(SDEFUN |RECLOS;*;3$;25!0| ((|z| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|RECLOS;*;3$;25|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |z| (QREFELT $ 97)))))) 

(SDEFUN |RECLOS;nonNull| ((|rep| |Rec|) ($ $))
        (COND
         ((EQL (SPADCALL (QVELT |rep| 1) (QREFELT $ 27)) 0)
          (SPADCALL (QVELT |rep| 1) (QREFELT $ 31)))
         ((OR (EQL (SPADCALL (QVELT |rep| 1) (QREFELT $ 99)) 1)
              (NULL
               (SPADCALL (QVELT |rep| 1) (QVELT |rep| 0) (QREFELT $ 100))))
          (CONS 1 |rep|))
         ('T (|spadConstant| $ 28)))) 

(SDEFUN |RECLOS;zero?;$B;27| ((|x| $) ($ |Boolean|))
        (COND ((QEQCAR |x| 0) (SPADCALL (QCDR |x|) (QREFELT $ 93))) ('T NIL))) 

(SDEFUN |RECLOS;+;3$;28| ((|x| $) (|y| $) ($ $))
        (SEQ
         (COND
          ((QEQCAR |x| 0)
           (COND
            ((QEQCAR |y| 0)
             (EXIT
              (CONS 0 (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 101))))))))
         (EXIT
          (COND
           ((QEQCAR |x| 0)
            (COND ((SPADCALL |x| (QREFELT $ 70)) |y|)
                  (#1='T
                   (|RECLOS;nonNull|
                    (VECTOR (QVELT (QCDR |y|) 0)
                            (SPADCALL (SPADCALL |x| (QREFELT $ 102))
                                      (QVELT (QCDR |y|) 1) (QREFELT $ 103))
                            (QVELT (QCDR |y|) 2) (QVELT (QCDR |y|) 3))
                    $))))
           ((QEQCAR |y| 0)
            (COND ((SPADCALL |y| (QREFELT $ 70)) |x|)
                  (#1#
                   (|RECLOS;nonNull|
                    (VECTOR (QVELT (QCDR |x|) 0)
                            (SPADCALL (QVELT (QCDR |x|) 1)
                                      (SPADCALL |y| (QREFELT $ 102))
                                      (QREFELT $ 103))
                            (QVELT (QCDR |x|) 2) (QVELT (QCDR |x|) 3))
                    $))))
           (#1#
            (COND
             ((SPADCALL (QVELT (QCDR |y|) 3) (QVELT (QCDR |x|) 3)
                        (QREFELT $ 96))
              (|RECLOS;nonNull|
               (VECTOR (QVELT (QCDR |y|) 0)
                       (SPADCALL (SPADCALL |x| (QREFELT $ 102))
                                 (QVELT (QCDR |y|) 1) (QREFELT $ 103))
                       (QVELT (QCDR |y|) 2) (QVELT (QCDR |y|) 3))
               $))
             ((SPADCALL (QVELT (QCDR |x|) 3) (QVELT (QCDR |y|) 3)
                        (QREFELT $ 96))
              (|RECLOS;nonNull|
               (VECTOR (QVELT (QCDR |x|) 0)
                       (SPADCALL (QVELT (QCDR |x|) 1)
                                 (SPADCALL |y| (QREFELT $ 102))
                                 (QREFELT $ 103))
                       (QVELT (QCDR |x|) 2) (QVELT (QCDR |x|) 3))
               $))
             (#1#
              (|RECLOS;nonNull|
               (VECTOR (QVELT (QCDR |x|) 0)
                       (SPADCALL (QVELT (QCDR |x|) 1) (QVELT (QCDR |y|) 1)
                                 (QREFELT $ 103))
                       (QVELT (QCDR |x|) 2) (QVELT (QCDR |x|) 3))
               $)))))))) 

(SDEFUN |RECLOS;-;2$;29| ((|x| $) ($ $))
        (COND ((QEQCAR |x| 0) (CONS 0 (SPADCALL (QCDR |x|) (QREFELT $ 105))))
              ('T
               (CONS 1
                     (VECTOR (QVELT (QCDR |x|) 0)
                             (SPADCALL (QVELT (QCDR |x|) 1) (QREFELT $ 106))
                             (QVELT (QCDR |x|) 2) (QVELT (QCDR |x|) 3)))))) 

(SDEFUN |RECLOS;retractIfCan;$U;30| ((|x| $) ($ |Union| |TheField| "failed"))
        (SPROG ((|res| ($)) (|o| (|PositiveInteger|)))
               (SEQ
                (COND ((QEQCAR |x| 0) (CONS 0 (QCDR |x|)))
                      (#1='T
                       (SEQ
                        (LETT |o| (QVELT (QCDR |x|) 3)
                              . #2=(|RECLOS;retractIfCan;$U;30|))
                        (LETT |res| (|RECLOS;lessAlgebraic| |x| $) . #2#)
                        (EXIT
                         (COND ((QEQCAR |res| 0) (CONS 0 (QCDR |res|)))
                               ((EQL |o| (QVELT (QCDR |res|) 3))
                                (CONS 1 "failed"))
                               (#1# (SPADCALL |res| (QREFELT $ 108))))))))))) 

(SDEFUN |RECLOS;retract;$TheField;31| ((|x| $) ($ |TheField|))
        (SPROG ((|res| ($)) (|o| (|PositiveInteger|)))
               (SEQ
                (COND ((QEQCAR |x| 0) (QCDR |x|))
                      (#1='T
                       (SEQ
                        (LETT |o| (QVELT (QCDR |x|) 3)
                              . #2=(|RECLOS;retract;$TheField;31|))
                        (LETT |res| (|RECLOS;lessAlgebraic| |x| $) . #2#)
                        (EXIT
                         (COND ((QEQCAR |res| 0) (QCDR |res|))
                               ((EQL |o| (QVELT (QCDR |res|) 3))
                                (|error| "Can't retract"))
                               (#1# (SPADCALL |res| (QREFELT $ 109))))))))))) 

(SDEFUN |RECLOS;lessAlgebraic| ((|x| $) ($ $))
        (SPROG ((|def| (|SparseUnivariatePolynomial| $)))
               (SEQ
                (COND ((QEQCAR |x| 0) |x|)
                      ((EQL (SPADCALL (QVELT (QCDR |x|) 1) (QREFELT $ 27)) 0)
                       (SPADCALL (QVELT (QCDR |x|) 1) (QREFELT $ 31)))
                      (#1='T
                       (SEQ
                        (LETT |def|
                              (SPADCALL (QVELT (QCDR |x|) 0) (QREFELT $ 25))
                              |RECLOS;lessAlgebraic|)
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |def| (QREFELT $ 27)) 1)
                           (SPADCALL (QVELT (QCDR |x|) 1)
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |def| 0 (QREFELT $ 30))
                                       (SPADCALL |def| (QREFELT $ 31))
                                       (QREFELT $ 32))
                                      (QREFELT $ 33))
                                     (QREFELT $ 110)))
                          (#1# |x|))))))))) 

(SDEFUN |RECLOS;Zero;$;33| (($ $)) (CONS 0 (|spadConstant| $ 29))) 

(SDEFUN |RECLOS;One;$;34| (($ $)) (CONS 0 (|spadConstant| $ 35))) 

(PUT '|RECLOS;coerce;TheField$;35| '|SPADreplace| '(XLAM (|rn|) (CONS 0 |rn|))) 

(SDEFUN |RECLOS;coerce;TheField$;35| ((|rn| |TheField|) ($ $)) (CONS 0 |rn|)) 

(DECLAIM (NOTINLINE |RealClosure;|)) 

(DEFUN |RealClosure| (#1=#:G927)
  (SPROG NIL
         (PROG (#2=#:G928)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RealClosure|)
                                               '|domainEqualList|)
                    . #3=(|RealClosure|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|RealClosure;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|RealClosure|)))))))))) 

(DEFUN |RealClosure;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RealClosure|))
          (LETT |dv$| (LIST '|RealClosure| DV$1) . #1#)
          (LETT $ (GETREFV 131) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory|
                                                (|Fraction| (|Integer|))
                                                '(|RetractableTo|
                                                  (|Integer|))))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|RetractableTo|
                                                 (|Fraction| (|Integer|))))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|RealClosure| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record|
                     (|:| |seg|
                          (|RightOpenIntervalRootCharacterization| $
                                                                   (|SparseUnivariatePolynomial|
                                                                    $)))
                     (|:| |val| (|SparseUnivariatePolynomial| $))
                     (|:| |outForm| (|OutputForm|))
                     (|:| |order| (|PositiveInteger|))))
          (QSETREFV $ 8 (|Union| |#1| (QREFELT $ 7)))
          (QSETREFV $ 9 1)
          (QSETREFV $ 12 (SPADCALL (QREFELT $ 11)))
          $))) 

(MAKEPROP '|RealClosure| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rec| '|Rep|
              '|orderOfCreation| (|Symbol|) (0 . |new|) '|instanceName|
              (|Fraction| 64) (4 . |retract|) (|SparseUnivariatePolynomial| $$)
              (|RightOpenIntervalRootCharacterization| $$ 15)
              (9 . |relativeApprox|) |RECLOS;relativeApprox;2$F;1|
              |RECLOS;abs;2$;12| (|Boolean|) |RECLOS;<;2$B;14| (16 . |Zero|)
              (20 . |approximate|) |RECLOS;approximate;2$F;2|
              (27 . |definingPolynomial|) (|NonNegativeInteger|)
              (32 . |degree|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |RECLOS;Zero;$;33|) $))
              (37 . |Zero|) (41 . |coefficient|) (47 . |leadingCoefficient|)
              (52 . /) |RECLOS;-;2$;29|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |RECLOS;One;$;34|) $))
              (58 . |One|) (62 . |monomial|)
              (|RightOpenIntervalRootCharacterization| $ 48) (|OutputForm|)
              |RECLOS;algebraicOf;RoircOf$;4| |RECLOS;rename!;$Of$;5|
              |RECLOS;rename;$Of$;6| (|Union| $ '"failed") (|PositiveInteger|)
              (68 . |rootOf|) (74 . |coerce|) (79 . |coerce|) (84 . |hconcat|)
              (|SparseUnivariatePolynomial| $) |RECLOS;rootOf;SupPiU;7|
              (|List| $) (90 . |allRootsOf|) (|List| $$) (95 . |cons|)
              (101 . |reverse!|) |RECLOS;allRootsOf;SupL;8| (106 . |rem|)
              |RECLOS;coerce;2$;9| (112 . |positive?|) (117 . |positive?|)
              |RECLOS;positive?;$B;10| (123 . |negative?|) (128 . |negative?|)
              |RECLOS;negative?;$B;11| (|Integer|) |RECLOS;sign;$I;13|
              (134 . *) (140 . |sign|) (145 . |sign|) (151 . -)
              |RECLOS;zero?;$B;27| |RECLOS;=;2$B;15| (|Union| 37 '"failed")
              |RECLOS;mainCharacterization;$U;16| (|Union| 48 '#1="failed")
              |RECLOS;mainDefiningPolynomial;$U;17| (|Union| 38 '#1#)
              |RECLOS;mainForm;$U;18| |RECLOS;mainValue;$U;19| (157 . |coerce|)
              (162 . |univariate|) (167 . |outputForm|) |RECLOS;coerce;$Of;20|
              |RECLOS;recip;$U;22| |RECLOS;inv;2$;21| (173 . |recip|)
              (|Union| 15 '"failed") (178 . |recip|) (184 . *)
              (|Mapping| $$ $$) (190 . |map|) |RECLOS;*;I2$;23| (196 . *)
              (202 . |zero?|) (207 . |one?|) |RECLOS;*;TheField2$;24| (212 . >)
              |RECLOS;*;3$;25| (218 . *) (224 . |numberOfMonomials|)
              (229 . |zero?|) (235 . +) (241 . |coerce|) (246 . +)
              |RECLOS;+;3$;28| (252 . -) (257 . -) (|Union| 6 '#2="failed")
              |RECLOS;retractIfCan;$U;30| |RECLOS;retract;$TheField;31|
              (262 . |elt|) |RECLOS;coerce;TheField$;35| (|Union| 64 '#2#)
              (|Union| 13 '#2#) (|Polynomial| 13) (|Polynomial| 64)
              (|SparseUnivariatePolynomial| 64) (|Polynomial| $)
              (|SparseUnivariatePolynomial| 13)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Union| 50 '"failed")
              (|Record| (|:| |coef| 50) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 125 '"failed") (|Factored| $) (|HashState|) (|String|)
              (|SingleInteger|))
           '#(~= 268 |zero?| 274 |unitNormal| 279 |unitCanonical| 284 |unit?|
              289 |subtractIfCan| 294 |squareFreePart| 300 |squareFree| 305
              |sqrt| 310 |smaller?| 331 |sizeLess?| 337 |sign| 343 |sample| 348
              |rootOf| 352 |retractIfCan| 365 |retract| 385 |rename!| 405
              |rename| 411 |rem| 417 |relativeApprox| 423 |recip| 429 |quo| 434
              |principalIdeal| 440 |prime?| 445 |positive?| 450 |opposite?| 455
              |one?| 461 |nthRoot| 466 |negative?| 472 |multiEuclidean| 477
              |min| 483 |max| 489 |mainValue| 495 |mainForm| 500
              |mainDefiningPolynomial| 505 |mainCharacterization| 510 |lcmCoef|
              515 |lcm| 521 |latex| 532 |inv| 537 |hashUpdate!| 542 |hash| 548
              |gcdPolynomial| 553 |gcd| 559 |factor| 570 |extendedEuclidean|
              575 |exquo| 588 |expressIdealMember| 594 |euclideanSize| 600
              |divide| 605 |coerce| 611 |characteristic| 651 |associates?| 655
              |approximate| 661 |annihilate?| 667 |allRootsOf| 673
              |algebraicOf| 703 |abs| 709 ^ 714 |Zero| 738 |One| 742 >= 746 >
              752 = 758 <= 764 < 770 / 776 - 782 + 793 * 799)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1))
            (CONS
             '#(|RealClosedField&| |Field&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| |DivisionRing&|
                NIL |Algebra&| |Algebra&| |Algebra&| NIL |Algebra&|
                |OrderedRing&| NIL |Module&| |Module&| |Module&| |EntireRing&|
                |Module&| NIL NIL NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL NIL
                NIL NIL |Rng&| NIL NIL |AbelianGroup&| NIL NIL NIL NIL
                |AbelianMonoid&| |OrderedSet&| |Monoid&| NIL NIL |SemiGroup&|
                |AbelianSemiGroup&| |FullyRetractableTo&| |FullyRetractableTo&|
                |SetCategory&| |RetractableTo&| |RadicalCategory&|
                |RetractableTo&| NIL NIL NIL NIL |PartialOrder&| NIL
                |BasicType&| NIL |RetractableTo&|)
             (CONS
              '#((|RealClosedField|) (|Field|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|Algebra| 6) (|Algebra| 64) (|Algebra| 13) (|LeftOreRing|)
                 (|Algebra| $$) (|OrderedRing|) (|CharacteristicZero|)
                 (|Module| 6) (|Module| 64) (|Module| 13) (|EntireRing|)
                 (|Module| $$) (|CommutativeRing|) (|BiModule| 6 6)
                 (|BiModule| 64 64) (|BiModule| 13 13) (|BiModule| $$ $$)
                 (|Ring|) (|OrderedAbelianGroup|) (|RightModule| 6)
                 (|LeftModule| 6) (|RightModule| 64) (|LeftModule| 64)
                 (|RightModule| 13) (|LeftModule| 13) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|CancellationAbelianMonoid|) (|OrderedAbelianSemiGroup|)
                 (|SemiRing|) (|AbelianMonoid|) (|OrderedSet|) (|Monoid|)
                 (|SemiRng|) (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|FullyRetractableTo| 6) (|FullyRetractableTo| 13)
                 (|SetCategory|) (|RetractableTo| 6) (|RadicalCategory|)
                 (|RetractableTo| 13) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|PartialOrder|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 38) (|RetractableTo| 64))
              (|makeByteWordVec2| 130
                                  '(0 10 0 11 1 0 13 0 14 3 16 2 15 0 2 17 0 13
                                    0 22 3 16 2 15 0 2 23 1 16 15 0 25 1 15 26
                                    0 27 0 6 0 29 2 15 2 0 26 30 1 15 2 0 31 2
                                    0 0 0 0 32 0 6 0 35 2 15 0 2 26 36 2 16 42
                                    15 43 44 1 10 38 0 45 1 43 38 0 46 2 38 0 0
                                    0 47 1 16 50 15 51 2 52 0 2 0 53 1 52 0 0
                                    54 2 15 0 0 0 56 1 6 20 0 58 2 16 20 15 0
                                    59 1 6 20 0 61 2 16 20 15 0 62 2 0 0 64 0
                                    66 1 6 64 0 67 2 16 64 15 0 68 2 0 0 0 0 69
                                    1 6 38 0 79 1 15 15 0 80 2 15 38 0 38 81 1
                                    6 42 0 85 2 16 86 15 0 87 2 6 0 64 0 88 2
                                    15 0 89 0 90 2 6 0 0 0 92 1 6 20 0 93 1 6
                                    20 0 94 2 43 20 0 0 96 2 15 0 0 0 98 1 15
                                    26 0 99 2 16 20 15 0 100 2 6 0 0 0 101 1 15
                                    0 2 102 2 15 0 0 0 103 1 6 0 0 105 1 15 0 0
                                    106 2 15 2 0 2 110 2 0 20 0 0 1 1 0 20 0 70
                                    1 0 119 0 1 1 0 0 0 1 1 0 20 0 1 2 0 42 0 0
                                    1 1 0 0 0 1 1 0 127 0 1 1 0 0 64 1 2 0 0 0
                                    43 1 1 0 0 13 1 1 0 0 0 1 2 0 20 0 0 1 2 0
                                    20 0 0 1 1 0 64 0 65 0 0 0 1 2 0 42 48 43
                                    49 3 0 42 48 43 38 1 1 1 112 0 1 1 2 113 0
                                    1 1 0 107 0 108 1 0 113 0 1 1 1 64 0 1 1 2
                                    13 0 14 1 0 6 0 109 1 0 13 0 14 2 0 0 0 38
                                    40 2 0 0 0 38 41 2 0 0 0 0 1 2 0 13 0 0 18
                                    1 0 42 0 83 2 0 0 0 0 1 1 0 122 50 1 1 0 20
                                    0 1 1 0 20 0 60 2 0 20 0 0 1 1 0 20 0 1 2 0
                                    0 0 64 1 1 0 20 0 63 2 0 121 50 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 1 0 74 0 78 1 0 76 0 77 1 0
                                    74 0 75 1 0 72 0 73 2 0 120 0 0 1 2 0 0 0 0
                                    1 1 0 0 50 1 1 0 129 0 1 1 0 0 0 84 2 0 128
                                    128 0 1 1 0 130 0 1 2 0 48 48 48 1 2 0 0 0
                                    0 1 1 0 0 50 1 1 0 127 0 1 2 0 124 0 0 1 3
                                    0 126 0 0 0 1 2 0 42 0 0 1 2 0 121 50 0 1 1
                                    0 26 0 1 2 0 123 0 0 1 1 0 0 6 111 1 0 0 13
                                    1 1 0 0 64 1 1 0 0 13 1 1 0 0 0 57 1 0 0 13
                                    1 1 0 0 64 1 1 0 38 0 82 0 0 26 1 2 0 20 0
                                    0 1 2 0 13 0 0 24 2 0 20 0 0 1 1 0 50 114 1
                                    1 0 50 115 1 1 0 50 116 1 1 0 50 117 1 1 0
                                    50 118 1 1 0 50 48 55 2 0 0 37 38 39 1 0 0
                                    0 19 2 0 0 0 13 1 2 0 0 0 64 1 2 0 0 0 26 1
                                    2 0 0 0 43 1 0 0 0 28 0 0 0 34 2 0 20 0 0 1
                                    2 0 20 0 0 1 2 0 20 0 0 71 2 0 20 0 0 1 2 0
                                    20 0 0 21 2 0 0 0 0 32 1 0 0 0 33 2 0 0 0 0
                                    69 2 0 0 0 0 104 2 0 0 0 6 1 2 0 0 6 0 95 2
                                    0 0 13 0 1 2 0 0 0 13 1 2 0 0 0 64 1 2 0 0
                                    64 0 91 2 0 0 13 0 1 2 0 0 0 13 1 2 0 0 64
                                    0 91 2 0 0 0 0 97 2 0 0 26 0 1 2 0 0 43 0
                                    1)))))
           '|lookupComplete|)) 
