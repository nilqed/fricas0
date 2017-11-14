
(SDEFUN |AF;belong?;BoB;1| ((|op| |BasicOperator|) ($ |Boolean|))
        (COND ((SPADCALL |op| (QREFELT $ 8) (QREFELT $ 17)) 'T)
              ('T (SPADCALL |op| '|%root_sum| (QREFELT $ 18))))) 

(SDEFUN |AF;dalg| ((|l| |List| F) ($ |OutputForm|))
        (SPADCALL (SPADCALL |l| (QREFELT $ 21)) (QREFELT $ 23))) 

(SDEFUN |AF;rootOf;SupSF;3|
        ((|p| |SparseUnivariatePolynomial| F) (|x| |Symbol|) ($ F))
        (SPROG
         ((|n| (|SparseUnivariatePolynomial| F))
          (|f| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|r| (|Union| F "failed")) (|k| (|Kernel| F)))
         (SEQ
          (LETT |k| (SPADCALL |x| (QREFELT $ 25)) . #1=(|AF;rootOf;SupSF;3|))
          (LETT |r| (SPADCALL |p| (QREFELT $ 28)) . #1#)
          (EXIT
           (COND
            ((QEQCAR |r| 1)
             (SPADCALL |p| (SPADCALL |k| (QREFELT $ 30)) (QREFELT $ 31)))
            (#2='T
             (SEQ
              (LETT |n|
                    (SPADCALL
                     (LETT |f| (SPADCALL (QCDR |r|) |k| (QREFELT $ 33)) . #1#)
                     (QREFELT $ 35))
                    . #1#)
              (EXIT
               (COND
                ((SPADCALL
                  (SPADCALL (SPADCALL |f| (QREFELT $ 36)) (QREFELT $ 38)) 0
                  (QREFELT $ 40))
                 (|error| "roofOf: variable appears in denom"))
                (#2#
                 (SPADCALL |n| (SPADCALL |k| (QREFELT $ 30))
                           (QREFELT $ 31)))))))))))) 

(SDEFUN |AF;dvalg| ((|l| |List| F) (|x| |Symbol|) ($ F))
        (SPROG ((|alpha| (F)) (|p| (|SparseUnivariatePolynomial| F)))
               (SEQ
                (LETT |p|
                      (SPADCALL
                       (SPADCALL (|SPADfirst| |l|)
                                 (SPADCALL (SPADCALL |l| (QREFELT $ 21))
                                           (QREFELT $ 42))
                                 (QREFELT $ 33))
                       (QREFELT $ 35))
                      . #1=(|AF;dvalg|))
                (LETT |alpha| (SPADCALL (QREFELT $ 13) |l| (QREFELT $ 44))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (CONS #'|AF;dvalg!0| (VECTOR $ |x|)) |p|
                              (QREFELT $ 47))
                    |alpha| (QREFELT $ 48))
                   (SPADCALL (SPADCALL |p| (QREFELT $ 49)) |alpha|
                             (QREFELT $ 48))
                   (QREFELT $ 50))
                  (QREFELT $ 51)))))) 

(SDEFUN |AF;dvalg!0| ((|s| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|AF;dvalg|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |s| |x| (QREFELT $ 45)))))) 

(SDEFUN |AF;ialg| ((|l| |List| F) ($ F))
        (SPROG
         ((|f| (|Fraction| (|SparseUnivariatePolynomial| F))) (|x| (F))
          (|p| (F)))
         (SEQ
          (LETT |f|
                (SPADCALL (LETT |p| (|SPADfirst| |l|) . #1=(|AF;ialg|))
                          (SPADCALL
                           (LETT |x| (SPADCALL |l| (QREFELT $ 21)) . #1#)
                           (QREFELT $ 42))
                          (QREFELT $ 33))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 36)) (QREFELT $ 38))
                       0 (QREFELT $ 40))
             (|error| "roofOf: variable appears in denom"))
            ('T
             (SPADCALL (SPADCALL |f| (QREFELT $ 35)) |x| (QREFELT $ 31)))))))) 

(SDEFUN |AF;operator;2Bo;6| ((|op| |BasicOperator|) ($ |BasicOperator|))
        (COND ((SPADCALL |op| '|rootOf| (QREFELT $ 18)) (QREFELT $ 13))
              ((SPADCALL |op| '|nthRoot| (QREFELT $ 18)) (QREFELT $ 14))
              ((SPADCALL |op| '|%root_sum| (QREFELT $ 18)) (QREFELT $ 15))
              ('T (|error| "Unknown operator")))) 

(SDEFUN |AF;inrootof;Sup2F;7|
        ((|q| |SparseUnivariatePolynomial| F) (|x| F) ($ F))
        (SPROG
         ((#1=#:G810 NIL)
          (|r| (|Union| (|SparseUnivariatePolynomial| R) "failed"))
          (|rx| (|Union| (|Symbol|) "failed")) (|d| (|NonNegativeInteger|)))
         (SEQ
          (COND ((SPADCALL |q| (QREFELT $ 53)) (|spadConstant| $ 54))
                (#2='T
                 (SEQ
                  (LETT |d| (SPADCALL |q| (QREFELT $ 38))
                        . #3=(|AF;inrootof;Sup2F;7|))
                  (EXIT
                   (COND
                    ((SPADCALL |d| 0 (QREFELT $ 55))
                     (|error| "rootOf: constant polynomial"))
                    ((EQL |d| 1)
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |q| (QREFELT $ 58)) (QREFELT $ 59))
                       (SPADCALL |q| (QREFELT $ 59)) (QREFELT $ 50))
                      (QREFELT $ 51)))
                    (#2#
                     (SEQ
                      (EXIT
                       (SEQ
                        (SEQ (LETT |rx| (SPADCALL |x| (QREFELT $ 61)) . #3#)
                             (EXIT
                              (COND
                               ((QEQCAR |rx| 0)
                                (SEQ (LETT |r| (|AF;UP2R| |q| $) . #3#)
                                     (EXIT
                                      (COND
                                       ((QEQCAR |r| 0)
                                        (PROGN
                                         (LETT #1#
                                               (SPADCALL
                                                (SPADCALL (QCDR |r|)
                                                          (QCDR |rx|)
                                                          (QREFELT $ 63))
                                                (QREFELT $ 64))
                                               . #3#)
                                         (GO #4=#:G806))))))))))
                        (EXIT
                         (SPADCALL (QREFELT $ 13)
                                   (LIST (SPADCALL |q| |x| (QREFELT $ 48)) |x|)
                                   (QREFELT $ 44)))))
                      #4# (EXIT #1#))))))))))) 

(SDEFUN |AF;UP2R|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |Union| (|SparseUnivariatePolynomial| R) "failed"))
        (SPROG
         ((|ans| (|SparseUnivariatePolynomial| R)) (#1=#:G822 NIL)
          (|r| (|Union| R "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |ans| (|spadConstant| $ 66) . #2=(|AF;UP2R|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |p| (|spadConstant| $ 67) (QREFELT $ 68)))
                       (GO G191)))
                     (SEQ
                      (LETT |r|
                            (SPADCALL (SPADCALL |p| (QREFELT $ 59))
                                      (QREFELT $ 70))
                            . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |r| 1)
                         (PROGN
                          (LETT #1# (CONS 1 "failed") . #2#)
                          (GO #3=#:G821)))
                        ('T
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL (QCDR |r|)
                                                    (SPADCALL |p|
                                                              (QREFELT $ 38))
                                                    (QREFELT $ 71))
                                          (QREFELT $ 72))
                                . #2#)
                          (EXIT
                           (LETT |p| (SPADCALL |p| (QREFELT $ 58)) . #2#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |ans|))))
          #3# (EXIT #1#)))) 

(SDEFUN |AF;inrootof;Sup2F;9|
        ((|q| |SparseUnivariatePolynomial| F) (|x| F) ($ F))
        (SPROG ((|d| (|NonNegativeInteger|)))
               (SEQ
                (COND ((SPADCALL |q| (QREFELT $ 53)) (|spadConstant| $ 54))
                      (#1='T
                       (SEQ
                        (LETT |d| (SPADCALL |q| (QREFELT $ 38))
                              |AF;inrootof;Sup2F;9|)
                        (EXIT
                         (COND
                          ((SPADCALL |d| 0 (QREFELT $ 55))
                           (|error| "rootOf: constant polynomial"))
                          ((EQL |d| 1)
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL |q| (QREFELT $ 58))
                                       (QREFELT $ 59))
                             (SPADCALL |q| (QREFELT $ 59)) (QREFELT $ 50))
                            (QREFELT $ 51)))
                          (#1#
                           (SPADCALL (QREFELT $ 13)
                                     (LIST (SPADCALL |q| |x| (QREFELT $ 48))
                                           |x|)
                                     (QREFELT $ 44))))))))))) 

(SDEFUN |AF;eqopalg| ((|k1| |Kernel| F) (|k2| |Kernel| F) ($ |Boolean|))
        (SPROG
         ((|lc2| #1=(|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|lc1| #1#)
          (|p2|
           #2=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|p1| #2#) (|pe2| (F)) (|pe1| (F)) (|dv2| #3=(|Kernel| F))
          (|dv1| #3#) (|al2| #4=(|List| F)) (|al1| #4#))
         (SEQ (LETT |al1| (SPADCALL |k1| (QREFELT $ 73)) . #5=(|AF;eqopalg|))
              (LETT |al2| (SPADCALL |k2| (QREFELT $ 73)) . #5#)
              (LETT |dv1|
                    (SPADCALL (SPADCALL |al1| 2 (QREFELT $ 75)) (QREFELT $ 42))
                    . #5#)
              (LETT |dv2|
                    (SPADCALL (SPADCALL |al2| 2 (QREFELT $ 75)) (QREFELT $ 42))
                    . #5#)
              (LETT |pe1| (SPADCALL |al1| 1 (QREFELT $ 75)) . #5#)
              (LETT |pe2| (SPADCALL |al2| 1 (QREFELT $ 75)) . #5#)
              (EXIT
               (COND
                ((SPADCALL |dv1| |dv2| (QREFELT $ 76))
                 (SPADCALL |pe1| |pe2| (QREFELT $ 77)))
                (#6='T
                 (SEQ
                  (LETT |p1|
                        (SPADCALL (SPADCALL |pe1| (QREFELT $ 79)) |dv1|
                                  (QREFELT $ 81))
                        . #5#)
                  (LETT |p2|
                        (SPADCALL (SPADCALL |pe2| (QREFELT $ 79)) |dv2|
                                  (QREFELT $ 81))
                        . #5#)
                  (LETT |lc1| (SPADCALL |p1| (QREFELT $ 83)) . #5#)
                  (LETT |lc2| (SPADCALL |p2| (QREFELT $ 83)) . #5#)
                  (EXIT
                   (COND
                    ((SPADCALL |lc1| |lc2| (QREFELT $ 84))
                     (SPADCALL |p1| |p2| (QREFELT $ 85)))
                    (#6#
                     (SPADCALL (SPADCALL |lc2| |p1| (QREFELT $ 86))
                               (SPADCALL |lc1| |p2| (QREFELT $ 86))
                               (QREFELT $ 85)))))))))))) 

(SDEFUN |AF;root_sum1|
        ((|expr| F) (|p| |SparseUnivariatePolynomial| F) (|x| F) ($ F))
        (SPROG
         ((|nexpr| (|SparseUnivariatePolynomial| F)) (|res| (F))
          (#1=#:G860 NIL) (|i| NIL) (|xs| (|Symbol|)) (|a| (F))
          (|k| (|Kernel| F)))
         (SEQ
          (COND
           ((SPADCALL |expr| (|spadConstant| $ 54) (QREFELT $ 77))
            (|spadConstant| $ 54))
           (#2='T
            (SEQ (LETT |k| (SPADCALL |x| (QREFELT $ 42)) . #3=(|AF;root_sum1|))
                 (EXIT
                  (COND
                   ((EQL (SPADCALL |p| (QREFELT $ 38)) 1)
                    (SEQ
                     (LETT |a|
                           (SPADCALL
                            (SPADCALL (SPADCALL |p| 0 (QREFELT $ 92))
                                      (SPADCALL |p| 1 (QREFELT $ 92))
                                      (QREFELT $ 50))
                            (QREFELT $ 51))
                           . #3#)
                     (EXIT (SPADCALL |expr| |k| |a| (QREFELT $ 93)))))
                   (#2#
                    (SEQ
                     (LETT |nexpr| (SPADCALL |expr| |k| |p| (QREFELT $ 95))
                           . #3#)
                     (LETT |xs| (SPADCALL |x| (QREFELT $ 96)) . #3#)
                     (EXIT
                      (COND
                       ((SPADCALL (CONS #'|AF;root_sum1!0| (VECTOR $ |xs|))
                                  (SPADCALL |nexpr| (QREFELT $ 98))
                                  (QREFELT $ 100))
                        (SEQ (LETT |res| (|spadConstant| $ 54) . #3#)
                             (SEQ (LETT |i| 0 . #3#)
                                  (LETT #1# (- (SPADCALL |p| (QREFELT $ 38)) 1)
                                        . #3#)
                                  G190
                                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                                  (SEQ
                                   (LETT |nexpr|
                                         (SPADCALL |nexpr| |p| (QREFELT $ 101))
                                         . #3#)
                                   (LETT |res|
                                         (SPADCALL |res|
                                                   (SPADCALL |nexpr| |i|
                                                             (QREFELT $ 92))
                                                   (QREFELT $ 102))
                                         . #3#)
                                   (EXIT
                                    (LETT |nexpr|
                                          (SPADCALL
                                           (SPADCALL (|spadConstant| $ 57) 1
                                                     (QREFELT $ 103))
                                           |nexpr| (QREFELT $ 104))
                                          . #3#)))
                                  (LETT |i| (|inc_SI| |i|) . #3#) (GO G190)
                                  G191 (EXIT NIL))
                             (EXIT |res|)))
                       (#2#
                        (SPADCALL (QREFELT $ 15)
                                  (LIST (SPADCALL |nexpr| |x| (QREFELT $ 48))
                                        |x| (SPADCALL |p| |x| (QREFELT $ 48)))
                                  (QREFELT $ 44))))))))))))))) 

(SDEFUN |AF;root_sum1!0| ((|c| NIL) ($$ NIL))
        (PROG (|xs| $)
          (LETT |xs| (QREFELT $$ 1) . #1=(|AF;root_sum1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |xs| (QREFELT $ 97)) (|spadConstant| $ 54)
                      (QREFELT $ 77)))))) 

(SDEFUN |AF;rootSum;FSupSF;12|
        ((|expr| F) (|p| |SparseUnivariatePolynomial| F) (|s| |Symbol|) ($ F))
        (SPROG ((|k| (|Kernel| F)))
               (SEQ
                (LETT |k| (SPADCALL |s| (QREFELT $ 25)) |AF;rootSum;FSupSF;12|)
                (EXIT
                 (|AF;root_sum1| |expr| |p| (SPADCALL |k| (QREFELT $ 30)) $))))) 

(SDEFUN |AF;irootsum| ((|l| |List| F) ($ F))
        (SPROG ((|p| (|Fraction| (|SparseUnivariatePolynomial| F))) (|x| (F)))
               (SEQ
                (LETT |p|
                      (SPADCALL
                       (LETT |p| (SPADCALL |l| 3 (QREFELT $ 75))
                             . #1=(|AF;irootsum|))
                       (SPADCALL
                        (LETT |x| (SPADCALL |l| 2 (QREFELT $ 75)) . #1#)
                        (QREFELT $ 42))
                       (QREFELT $ 33))
                      . #1#)
                (EXIT
                 (COND
                  ((SPADCALL
                    (SPADCALL (SPADCALL |p| (QREFELT $ 36)) (QREFELT $ 38)) 0
                    (QREFELT $ 40))
                   (|error| "roofSum: variable appears in denom of p"))
                  ('T
                   (|AF;root_sum1| (SPADCALL |l| 1 (QREFELT $ 75))
                    (SPADCALL |p| (QREFELT $ 35)) |x| $))))))) 

(SDEFUN |AF;drootsum| ((|l| |List| F) ($ |OutputForm|))
        (SPROG
         ((|p|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|dv| (|Kernel| F)))
         (SEQ
          (LETT |dv| (SPADCALL (SPADCALL |l| 2 (QREFELT $ 75)) (QREFELT $ 42))
                . #1=(|AF;drootsum|))
          (LETT |p|
                (SPADCALL
                 (SPADCALL (SPADCALL |l| 3 (QREFELT $ 75)) (QREFELT $ 79)) |dv|
                 (QREFELT $ 81))
                . #1#)
          (EXIT
           (SPADCALL (SPADCALL (SPADCALL |l| 1 (QREFELT $ 75)) (QREFELT $ 23))
                     (SPADCALL
                      (SPADCALL |p| (SPADCALL |dv| (QREFELT $ 106))
                                (QREFELT $ 107))
                      (SPADCALL 0 (QREFELT $ 108)) (QREFELT $ 109))
                     (QREFELT $ 110)))))) 

(SDEFUN |AF;dvrootsum| ((|l| |List| F) (|x| |Symbol|) ($ F))
        (SPROG
         ((|nexpr| (F)) (|expr| (F)) (|dalpha| (F))
          (|p| (|SparseUnivariatePolynomial| F)) (|dvs| (|Symbol|))
          (|dv| (|Kernel| F)) (|alpha| (F)))
         (SEQ
          (LETT |dv|
                (SPADCALL
                 (LETT |alpha| (SPADCALL |l| 2 (QREFELT $ 75))
                       . #1=(|AF;dvrootsum|))
                 (QREFELT $ 42))
                . #1#)
          (LETT |dvs| (SPADCALL |alpha| (QREFELT $ 96)) . #1#)
          (LETT |p|
                (SPADCALL
                 (SPADCALL (SPADCALL |l| 3 (QREFELT $ 75)) |dv| (QREFELT $ 33))
                 (QREFELT $ 35))
                . #1#)
          (LETT |dalpha|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (CONS #'|AF;dvrootsum!0| (VECTOR $ |x|)) |p|
                             (QREFELT $ 47))
                   |alpha| (QREFELT $ 48))
                  (SPADCALL (SPADCALL |p| (QREFELT $ 49)) |alpha|
                            (QREFELT $ 48))
                  (QREFELT $ 50))
                 (QREFELT $ 51))
                . #1#)
          (LETT |expr| (SPADCALL |l| 1 (QREFELT $ 75)) . #1#)
          (LETT |nexpr|
                (SPADCALL
                 (SPADCALL |dalpha| (SPADCALL |expr| |dvs| (QREFELT $ 45))
                           (QREFELT $ 111))
                 (SPADCALL |expr| |x| (QREFELT $ 45)) (QREFELT $ 102))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL |nexpr| (|spadConstant| $ 54) (QREFELT $ 77))
             (|spadConstant| $ 54))
            ('T (|AF;root_sum1| |nexpr| |p| |alpha| $))))))) 

(SDEFUN |AF;dvrootsum!0| ((|s| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|AF;dvrootsum|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |s| |x| (QREFELT $ 45)))))) 

(SDEFUN |AF;lzero| ((|l| |List| F) ($ F)) (|spadConstant| $ 54)) 

(SDEFUN |AF;droot;LOf;17| ((|l| |List| F) ($ |OutputForm|))
        (SPROG ((|n| (|Integer|)) (|x| (|OutputForm|)))
               (SEQ
                (LETT |x| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 23))
                      . #1=(|AF;droot;LOf;17|))
                (LETT |n|
                      (SPADCALL (SPADCALL |l| (QREFELT $ 21)) (QREFELT $ 114))
                      . #1#)
                (EXIT
                 (COND ((EQL |n| 2) (SPADCALL |x| (QREFELT $ 115)))
                       ('T
                        (SPADCALL |x| (SPADCALL |n| (QREFELT $ 108))
                                  (QREFELT $ 116)))))))) 

(SDEFUN |AF;dvroot| ((|l| |List| F) ($ F))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |l| (QREFELT $ 21)) (QREFELT $ 114))
                      |AF;dvroot|)
                (EXIT
                 (SPADCALL
                  (SPADCALL (|SPADfirst| |l|)
                            (SPADCALL (- 1 |n|) |n| (QREFELT $ 120))
                            (QREFELT $ 121))
                  (SPADCALL |n| (QREFELT $ 122)) (QREFELT $ 50)))))) 

(SDEFUN |AF;^;FFF;19| ((|x| F) (|q| |Fraction| (|Integer|)) ($ F))
        (SPROG
         ((|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|)))))
         (SEQ
          (LETT |qr|
                (DIVIDE2 (SPADCALL |q| (QREFELT $ 123))
                         (SPADCALL |q| (QREFELT $ 124)))
                |AF;^;FFF;19|)
          (EXIT
           (SPADCALL (SPADCALL |x| (QCAR |qr|) (QREFELT $ 125))
                     (SPADCALL
                      (|AF;inroot|
                       (LIST |x|
                             (SPADCALL (SPADCALL |q| (QREFELT $ 124))
                                       (QREFELT $ 122)))
                       $)
                      (QCDR |qr|) (QREFELT $ 125))
                     (QREFELT $ 111)))))) 

(SDEFUN |AF;hackroot| ((|x| F) (|n| |Integer|) ($ F))
        (SPROG
         ((#1=#:G1004 NIL) (|rx| (|Union| (|Integer|) "failed"))
          (|dx| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ
          (EXIT
           (COND
            ((OR (EQL |n| 1)
                 (SPADCALL |x| (|spadConstant| $ 57) (QREFELT $ 77)))
             |x|)
            ('T
             (SEQ
              (COND
               ((SPADCALL
                 (LETT |dx| (SPADCALL |x| (QREFELT $ 126))
                       . #2=(|AF;hackroot|))
                 (|spadConstant| $ 118) (QREFELT $ 127))
                (SEQ (LETT |rx| (SPADCALL |dx| (QREFELT $ 129)) . #2#)
                     (EXIT
                      (COND
                       ((QEQCAR |rx| 0)
                        (COND
                         ((SPADCALL (QCDR |rx|) (QREFELT $ 130))
                          (PROGN
                           (LETT #1#
                                 (SPADCALL
                                  (|AF;hackroot|
                                   (SPADCALL (SPADCALL |x| (QREFELT $ 79))
                                             (QREFELT $ 131))
                                   |n| $)
                                  (|AF;hackroot|
                                   (SPADCALL (QCDR |rx|) (QREFELT $ 122)) |n|
                                   $)
                                  (QREFELT $ 50))
                                 . #2#)
                           (GO #3=#:G1002))))))))))
              (COND
               ((SPADCALL |x| (SPADCALL (|spadConstant| $ 57) (QREFELT $ 51))
                          (QREFELT $ 77))
                (COND
                 ((EQL |n| 4)
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL (|spadConstant| $ 57) (QREFELT $ 51))
                               (SPADCALL (|spadConstant| $ 132)
                                         (SPADCALL 2 (QREFELT $ 133))
                                         (QREFELT $ 134))
                               (QREFELT $ 121))
                     (|spadConstant| $ 57) (QREFELT $ 102))
                    (SPADCALL (SPADCALL 2 (QREFELT $ 122))
                              (SPADCALL (|spadConstant| $ 132)
                                        (SPADCALL 2 (QREFELT $ 133))
                                        (QREFELT $ 134))
                              (QREFELT $ 121))
                    (QREFELT $ 50)))))))
              (EXIT
               (SPADCALL (QREFELT $ 14)
                         (LIST |x| (SPADCALL |n| (QREFELT $ 122)))
                         (QREFELT $ 44)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |AF;inroot| ((|l| |List| F) ($ F))
        (SPROG
         ((|pr|
           (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|)))
            "failed"))
          (|r| (|Union| R "failed")) (#1=#:G1020 NIL) (|x| (F))
          (|n| (|Integer|)))
         (SEQ
          (COND
           ((ZEROP
             (LETT |n| (SPADCALL (SPADCALL |l| (QREFELT $ 21)) (QREFELT $ 114))
                   . #2=(|AF;inroot|)))
            (|error| "root: exponent = 0"))
           (#3='T
            (SEQ
             (EXIT
              (SEQ
               (SEQ (LETT |x| (|SPADfirst| |l|) . #2#)
                    (EXIT
                     (COND
                      ((OR (SPADCALL |x| (|spadConstant| $ 57) (QREFELT $ 77))
                           (EQL |n| 1))
                       (PROGN (LETT #1# |x| . #2#) (GO #4=#:G1017))))))
               (LETT |r| (SPADCALL |x| (QREFELT $ 70)) . #2#)
               (EXIT
                (COND
                 ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) |n| (QREFELT $ 135)))
                 (#3#
                  (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 138)) . #2#)
                       (EXIT
                        (COND
                         ((QEQCAR |u| 0)
                          (SEQ (LETT |pr| (QCDR |u|) . #2#)
                               (COND
                                ((SPADCALL (QCAR |pr|) (QREFELT $ 14)
                                           (QREFELT $ 139))
                                 (COND
                                  ((EQL
                                    (LENGTH
                                     (SPADCALL (QCAR |pr|) (QREFELT $ 73)))
                                    2)
                                   (EXIT
                                    (SPADCALL
                                     (|SPADfirst|
                                      (SPADCALL (QCAR |pr|) (QREFELT $ 73)))
                                     (SPADCALL (QCDR |pr|)
                                               (* |n|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL (QCAR |pr|)
                                                              (QREFELT $ 73))
                                                    (QREFELT $ 21))
                                                   (QREFELT $ 114)))
                                               (QREFELT $ 120))
                                     (QREFELT $ 121)))))))
                               (EXIT (|AF;inroot0| |x| |n| NIL NIL $))))
                         (#3# (|AF;inroot0| |x| |n| NIL NIL $))))))))))
             #4# (EXIT #1#))))))) 

(SDEFUN |AF;inroot0|
        ((|x| F) (|n| |Integer|) (|num?| |Boolean|) (|den?| |Boolean|) ($ F))
        (SPROG
         ((#1=#:G1022 NIL)
          (|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (#2=#:G1031 NIL) (#3=#:G1028 NIL) (#4=#:G1024 NIL)
          (|rd| #5=(|Union| (|Integer|) "failed")) (|rn| #5#))
         (SEQ
          (LETT |rn|
                (COND (|num?| (CONS 1 "failed"))
                      (#6='T
                       (SPADCALL (SPADCALL |x| (QREFELT $ 79))
                                 (QREFELT $ 129))))
                . #7=(|AF;inroot0|))
          (LETT |rd|
                (COND (|den?| (CONS 1 "failed"))
                      (#6#
                       (SPADCALL (SPADCALL |x| (QREFELT $ 126))
                                 (QREFELT $ 129))))
                . #7#)
          (COND
           ((QEQCAR |rn| 0)
            (COND
             ((QEQCAR |rd| 0)
              (EXIT
               (SEQ
                (LETT |rec|
                      (SPADCALL
                       (SPADCALL (QCDR |rn|) (QCDR |rd|) (QREFELT $ 120))
                       (PROG1 (LETT #4# |n| . #7#)
                         (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #4#))
                       (QREFELT $ 142))
                      . #7#)
                (EXIT
                 (SPADCALL (QVELT |rec| 1)
                           (|AF;hackroot| (QVELT |rec| 2) (QVELT |rec| 0) $)
                           (QREFELT $ 111)))))))))
          (EXIT
           (COND
            ((QEQCAR |rn| 0)
             (SEQ
              (LETT |rec|
                    (SPADCALL (SPADCALL (QCDR |rn|) (QREFELT $ 133))
                              (PROG1 (LETT #3# |n| . #7#)
                                (|check_subtype2| (>= #3# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #3#))
                              (QREFELT $ 142))
                    . #7#)
              (EXIT
               (SPADCALL (QVELT |rec| 1)
                         (|AF;inroot0|
                          (SPADCALL
                           (SPADCALL (QVELT |rec| 2)
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL |n| (QVELT |rec| 0)
                                                         (QREFELT $ 144))
                                               . #7#)
                                         (QCDR #1#)
                                       (|check_union2| (QEQCAR #1# 0)
                                                       (|Integer|)
                                                       (|Union| (|Integer|)
                                                                #8="failed")
                                                       #1#))
                                     (QREFELT $ 125))
                           (SPADCALL (SPADCALL |x| (QREFELT $ 126))
                                     (QREFELT $ 131))
                           (QREFELT $ 50))
                          |n| 'T |den?| $)
                         (QREFELT $ 111)))))
            ((QEQCAR |rd| 0)
             (SEQ
              (LETT |rec|
                    (SPADCALL (SPADCALL (QCDR |rd|) (QREFELT $ 133))
                              (PROG1 (LETT #2# |n| . #7#)
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              (QREFELT $ 142))
                    . #7#)
              (EXIT
               (SPADCALL
                (|AF;inroot0|
                 (SPADCALL
                  (SPADCALL (SPADCALL |x| (QREFELT $ 79)) (QREFELT $ 131))
                  (SPADCALL (QVELT |rec| 2)
                            (PROG2
                                (LETT #1#
                                      (SPADCALL |n| (QVELT |rec| 0)
                                                (QREFELT $ 144))
                                      . #7#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                              (|Union| (|Integer|) #8#) #1#))
                            (QREFELT $ 125))
                  (QREFELT $ 50))
                 |n| |num?| 'T $)
                (QVELT |rec| 1) (QREFELT $ 50)))))
            (#6# (|AF;hackroot| |x| |n| $))))))) 

(SDEFUN |AF;iroot;RIF;23| ((|r| R) (|n| |Integer|) ($ F))
        (SPADCALL (SPADCALL |r| |n| (QREFELT $ 145)) (QREFELT $ 64))) 

(SDEFUN |AF;iroot;RIF;24| ((|r| R) (|n| |Integer|) ($ F))
        (SPADCALL (SPADCALL |r| |n| (QREFELT $ 145)) (QREFELT $ 64))) 

(SDEFUN |AF;iroot;RIF;25| ((|r| R) (|n| |Integer|) ($ F))
        (COND
         ((OR (ODDP |n|)
              (NULL (SPADCALL |r| (|spadConstant| $ 39) (QREFELT $ 146))))
          (SPADCALL (SPADCALL |r| |n| (QREFELT $ 145)) (QREFELT $ 64)))
         ('T (|AF;iroot0| |r| |n| $)))) 

(SDEFUN |AF;iroot;RIF;26| ((|r| R) (|n| |Integer|) ($ F))
        (|AF;iroot0| |r| |n| $)) 

(SDEFUN |AF;iroot0| ((|r| R) (|n| |Integer|) ($ F))
        (SPROG
         ((|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (#1=#:G1043 NIL))
         (SEQ
          (LETT |rec|
                (SPADCALL |r|
                          (PROG1 (LETT #1# |n| . #2=(|AF;iroot0|))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          (QREFELT $ 147))
                . #2#)
          (EXIT
           (SPADCALL (QVELT |rec| 1)
                     (|AF;hackroot| (QVELT |rec| 2) (QVELT |rec| 0) $)
                     (QREFELT $ 111)))))) 

(SDEFUN |AF;definingPolynomial;2F;28| ((|x| F) ($ F))
        (SPROG ((|k| (|Kernel| F)) (|r| (|Union| (|Kernel| F) "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 149))
                      . #1=(|AF;definingPolynomial;2F;28|))
                (EXIT
                 (COND
                  ((QEQCAR |r| 0)
                   (COND
                    ((SPADCALL (LETT |k| (QCDR |r|) . #1#) (QREFELT $ 13)
                               (QREFELT $ 139))
                     (|SPADfirst| (SPADCALL |k| (QREFELT $ 73))))
                    ((SPADCALL |k| (QREFELT $ 14) (QREFELT $ 139))
                     (SPADCALL
                      (SPADCALL (QREFELT $ 113)
                                (SPADCALL
                                 (SPADCALL (SPADCALL |k| (QREFELT $ 73))
                                           (QREFELT $ 21))
                                 (QREFELT $ 114))
                                (QREFELT $ 125))
                      (|SPADfirst| (SPADCALL |k| (QREFELT $ 73)))
                      (QREFELT $ 150)))
                    (#2='T (SPADCALL (QREFELT $ 113) |x| (QREFELT $ 150)))))
                  (#2# (SPADCALL (QREFELT $ 113) |x| (QREFELT $ 150)))))))) 

(SDEFUN |AF;minPoly;KSup;29|
        ((|k| |Kernel| F) ($ |SparseUnivariatePolynomial| F))
        (SPROG ((#1=#:G1054 NIL))
               (COND
                ((SPADCALL |k| (QREFELT $ 13) (QREFELT $ 139))
                 (SPADCALL
                  (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 73)))
                            (SPADCALL
                             (SPADCALL (SPADCALL |k| (QREFELT $ 73))
                                       (QREFELT $ 21))
                             (QREFELT $ 42))
                            (QREFELT $ 33))
                  (QREFELT $ 35)))
                ((SPADCALL |k| (QREFELT $ 14) (QREFELT $ 139))
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 57)
                            (PROG1
                                (LETT #1#
                                      (SPADCALL
                                       (SPADCALL (SPADCALL |k| (QREFELT $ 73))
                                                 (QREFELT $ 21))
                                       (QREFELT $ 114))
                                      |AF;minPoly;KSup;29|)
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#))
                            (QREFELT $ 103))
                  (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 73)))
                            (QREFELT $ 152))
                  (QREFELT $ 153)))
                ('T
                 (SPADCALL (SPADCALL (|spadConstant| $ 57) 1 (QREFELT $ 103))
                           (SPADCALL (SPADCALL |k| (QREFELT $ 30))
                                     (QREFELT $ 152))
                           (QREFELT $ 153)))))) 

(SDEFUN |AF;droot;LOf;30| ((|l| |List| F) ($ |OutputForm|))
        (SPROG ((|n| (F)) (|x| (|OutputForm|)))
               (SEQ
                (LETT |x| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 23))
                      . #1=(|AF;droot;LOf;30|))
                (LETT |n| (SPADCALL |l| (QREFELT $ 21)) . #1#)
                (EXIT
                 (COND
                  ((SPADCALL |n| (SPADCALL 2 (QREFELT $ 122)) (QREFELT $ 77))
                   (SPADCALL |x| (QREFELT $ 115)))
                  ('T
                   (SPADCALL |x| (SPADCALL |n| (QREFELT $ 23))
                             (QREFELT $ 116)))))))) 

(SDEFUN |AF;minPoly;KSup;31|
        ((|k| |Kernel| F) ($ |SparseUnivariatePolynomial| F))
        (COND
         ((SPADCALL |k| (QREFELT $ 13) (QREFELT $ 139))
          (SPADCALL
           (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 73)))
                     (SPADCALL
                      (SPADCALL (SPADCALL |k| (QREFELT $ 73)) (QREFELT $ 21))
                      (QREFELT $ 42))
                     (QREFELT $ 33))
           (QREFELT $ 35)))
         ('T
          (SPADCALL (SPADCALL (|spadConstant| $ 57) 1 (QREFELT $ 103))
                    (SPADCALL (SPADCALL |k| (QREFELT $ 30)) (QREFELT $ 152))
                    (QREFELT $ 153))))) 

(DECLAIM (NOTINLINE |AlgebraicFunction;|)) 

(DEFUN |AlgebraicFunction| (&REST #1=#:G1067)
  (SPROG NIL
         (PROG (#2=#:G1068)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraicFunction|)
                                               '|domainEqualList|)
                    . #3=(|AlgebraicFunction|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraicFunction;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraicFunction|)))))))))) 

(DEFUN |AlgebraicFunction;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgebraicFunction|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|AlgebraicFunction| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 157) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|)))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|AlgebraicFunction| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|%alg|)
          (QSETREFV $ 13 (SPADCALL '|rootOf| (QREFELT $ 12)))
          (QSETREFV $ 14 (SPADCALL '|nthRoot| (QREFELT $ 12)))
          (QSETREFV $ 15 (SPADCALL '|%root_sum| (QREFELT $ 12)))
          (COND
           ((|HasCategory| |#1| '(|AlgebraicallyClosedField|))
            (PROGN
             (QSETREFV $ 31
                       (CONS (|dispatchFunction| |AF;inrootof;Sup2F;7|) $))))
           ('T
            (QSETREFV $ 31
                      (CONS (|dispatchFunction| |AF;inrootof;Sup2F;9|) $))))
          (SPADCALL (QREFELT $ 13) (CONS (|function| |AF;ialg|) $)
                    (QREFELT $ 89))
          (SPADCALL (QREFELT $ 13) '|%specialDiff|
                    (CONS (|function| |AF;dvalg|) $) (QREFELT $ 91))
          (SPADCALL (QREFELT $ 13) '|%specialDisp|
                    (CONS (|function| |AF;dalg|) $) (QREFELT $ 91))
          (SPADCALL (QREFELT $ 13) '|%specialEqual|
                    (CONS (|function| |AF;eqopalg|) $) (QREFELT $ 91))
          (SPADCALL (QREFELT $ 15) (CONS (|function| |AF;irootsum|) $)
                    (QREFELT $ 89))
          (SPADCALL (QREFELT $ 15) '|%specialDiff|
                    (CONS (|function| |AF;dvrootsum|) $) (QREFELT $ 91))
          (SPADCALL (QREFELT $ 15) '|%specialDisp|
                    (CONS (|function| |AF;drootsum|) $) (QREFELT $ 91))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 113 (SPADCALL '|%%var| (QREFELT $ 112)))
             NIL
             NIL
             NIL
             NIL
             NIL
             (QSETREFV $ 117 (CONS (|dispatchFunction| |AF;droot;LOf;17|) $))
             (QSETREFV $ 121 (CONS (|dispatchFunction| |AF;^;FFF;19|) $))
             (COND
              ((|HasCategory| |#1| '(|AlgebraicallyClosedField|))
               (QSETREFV $ 135
                         (CONS (|dispatchFunction| |AF;iroot;RIF;23|) $)))
              ('T
               (PROGN
                (COND
                 ((|HasCategory| |#1| '(|RadicalCategory|))
                  (COND
                   ((|HasSignature| |#1|
                                    (LIST '|imaginary|
                                          (LIST (|devaluate| |#1|))))
                    (QSETREFV $ 135
                              (CONS (|dispatchFunction| |AF;iroot;RIF;24|) $)))
                   ('T
                    (QSETREFV $ 135
                              (CONS (|dispatchFunction| |AF;iroot;RIF;25|)
                                    $)))))
                 ('T
                  (QSETREFV $ 135
                            (CONS (|dispatchFunction| |AF;iroot;RIF;26|)
                                  $)))))))
             (QSETREFV $ 151
                       (CONS (|dispatchFunction| |AF;definingPolynomial;2F;28|)
                             $))
             (QSETREFV $ 154
                       (CONS (|dispatchFunction| |AF;minPoly;KSup;29|) $))
             (SPADCALL (QREFELT $ 14) (CONS (|function| |AF;inroot|) $)
                       (QREFELT $ 89))
             (SPADCALL (QREFELT $ 14)
                       (LIST (CONS (|function| |AF;dvroot|) $)
                             (CONS (|function| |AF;lzero|) $))
                       (QREFELT $ 156))))
           ('T
            (PROGN
             (QSETREFV $ 117 (CONS (|dispatchFunction| |AF;droot;LOf;30|) $))
             (QSETREFV $ 154
                       (CONS (|dispatchFunction| |AF;minPoly;KSup;31|) $)))))
          (SPADCALL (QREFELT $ 14) '|%specialDisp| (ELT $ 117) (QREFELT $ 91))
          $))) 

(MAKEPROP '|AlgebraicFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|opalg| '|oproot| '|oprootsum| (|Boolean|) (5 . |has?|)
              (11 . |is?|) |AF;belong?;BoB;1| (|List| 7) (17 . |second|)
              (|OutputForm|) (22 . |coerce|) (|Kernel| 7) (27 . |kernel|)
              (|Union| 7 '"failed") (|SparseUnivariatePolynomial| 7)
              (32 . |retractIfCan|) (|Kernel| $) (37 . |coerce|)
              (42 . |inrootof|) (|Fraction| 62) (48 . |univariate|)
              (|Fraction| 27) (54 . |numer|) (59 . |denom|)
              (|NonNegativeInteger|) (64 . |degree|) (69 . |Zero|) (73 . >)
              |AF;rootOf;SupSF;3| (79 . |retract|) (|List| $) (84 . |kernel|)
              (90 . |differentiate|) (|Mapping| 7 7) (96 . |map|) (102 . |elt|)
              (108 . |differentiate|) (113 . /) (119 . -) |AF;operator;2Bo;6|
              (124 . |monomial?|) (129 . |Zero|) (133 . <=) (139 . |One|)
              (143 . |One|) (147 . |reductum|) (152 . |leadingCoefficient|)
              (|Union| 10 '#1="failed") (157 . |retractIfCan|)
              (|SparseUnivariatePolynomial| $) (162 . |rootOf|)
              (168 . |coerce|) (|SparseUnivariatePolynomial| 6) (173 . |Zero|)
              (177 . |Zero|) (181 . ~=) (|Union| 6 '#1#) (187 . |retractIfCan|)
              (192 . |monomial|) (198 . +) (204 . |argument|) (|Integer|)
              (209 . |elt|) (215 . =) (221 . =)
              (|SparseMultivariatePolynomial| 6 29) (227 . |numer|)
              (|SparseMultivariatePolynomial| 6 24) (232 . |univariate|)
              (|SparseUnivariatePolynomial| 80) (238 . |leadingCoefficient|)
              (243 . =) (249 . =) (255 . *) (|Mapping| 7 20)
              (|BasicOperatorFunctions1| 7) (261 . |evaluate|) (|None|)
              (267 . |setProperty|) (274 . |coefficient|) (280 . |eval|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 24) 24
                                                     6 80 7)
              (287 . |univariate|) (294 . |retract|) (299 . D)
              (305 . |coefficients|) (|Mapping| 16 7) (310 . |every?|)
              (316 . |rem|) (322 . +) (328 . |monomial|) (334 . *)
              |AF;rootSum;FSupSF;12| (340 . |coerce|) (345 . |outputForm|)
              (351 . |coerce|) (356 . =) (362 . |sum|) (368 . *)
              (374 . |coerce|) '|dumvar| (379 . |retract|) (384 . |root|)
              (389 . |root|) (395 . |droot|) (400 . |One|) (|Fraction| 74)
              (404 . /) (410 . ^) (416 . |coerce|) (421 . |numer|)
              (426 . |denom|) (431 . ^) (437 . |denom|) (442 . ~=)
              (|Union| 74 '"failed") (448 . |retractIfCan|) (453 . |positive?|)
              (458 . |coerce|) (463 . |One|) (467 . |coerce|) (472 . /)
              (478 . |iroot|) (|Record| (|:| |var| 29) (|:| |exponent| 74))
              (|Union| 136 '"failed") (484 . |isExpt|) (489 . |is?|)
              (|Record| (|:| |exponent| 37) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 24) 24 6 80 7)
              (495 . |qroot|) (|Union| $ '"failed") (501 . |exquo|)
              (507 . |nthRoot|) (513 . |smaller?|) (519 . |rroot|)
              (|Union| 29 '#1#) (525 . |retractIfCan|) (530 . -)
              (536 . |definingPolynomial|) (541 . |coerce|) (546 . -)
              (552 . |minPoly|) (|List| 87) (557 . |derivative|))
           '#(|rootSum| 563 |rootOf| 570 |operator| 576 |minPoly| 581 |iroot|
              586 |inrootof| 592 |droot| 598 |definingPolynomial| 603 |belong?|
              608 ^ 613)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 156
                                                 '(1 11 9 10 12 2 9 16 0 10 17
                                                   2 9 16 0 10 18 1 20 7 0 21 1
                                                   7 22 0 23 1 24 0 10 25 1 27
                                                   26 0 28 1 7 0 29 30 2 0 7 27
                                                   7 31 2 7 32 0 29 33 1 34 27
                                                   0 35 1 34 27 0 36 1 27 37 0
                                                   38 0 6 0 39 2 37 16 0 0 40 1
                                                   7 29 0 42 2 7 0 9 43 44 2 7
                                                   0 0 10 45 2 27 0 46 0 47 2
                                                   27 7 0 7 48 1 27 0 0 49 2 7
                                                   0 0 0 50 1 7 0 0 51 1 27 16
                                                   0 53 0 7 0 54 2 37 16 0 0 55
                                                   0 6 0 56 0 7 0 57 1 27 0 0
                                                   58 1 27 7 0 59 1 7 60 0 61 2
                                                   6 0 62 10 63 1 7 0 6 64 0 65
                                                   0 66 0 27 0 67 2 27 16 0 0
                                                   68 1 7 69 0 70 2 65 0 6 37
                                                   71 2 65 0 0 0 72 1 24 20 0
                                                   73 2 20 7 0 74 75 2 24 16 0
                                                   0 76 2 7 16 0 0 77 1 7 78 0
                                                   79 2 80 62 0 24 81 1 82 80 0
                                                   83 2 80 16 0 0 84 2 82 16 0
                                                   0 85 2 82 0 80 0 86 2 88 9 9
                                                   87 89 3 9 0 0 10 90 91 2 27
                                                   7 0 37 92 3 7 0 0 29 0 93 3
                                                   94 27 7 24 27 95 1 7 10 0 96
                                                   2 7 0 0 10 97 1 27 20 0 98 2
                                                   20 16 99 0 100 2 27 0 0 0
                                                   101 2 7 0 0 0 102 2 27 0 7
                                                   37 103 2 27 0 0 0 104 1 24
                                                   22 0 106 2 82 22 0 22 107 1
                                                   74 22 0 108 2 22 0 0 0 109 2
                                                   22 0 0 0 110 2 7 0 0 0 111 1
                                                   7 0 10 112 1 7 74 0 114 1 22
                                                   0 0 115 2 22 0 0 0 116 1 0
                                                   22 20 117 0 80 0 118 2 119 0
                                                   74 74 120 2 0 7 7 119 121 1
                                                   7 0 74 122 1 119 74 0 123 1
                                                   119 74 0 124 2 7 0 0 74 125
                                                   1 7 78 0 126 2 80 16 0 0 127
                                                   1 80 128 0 129 1 74 16 0 130
                                                   1 7 0 78 131 0 119 0 132 1
                                                   119 0 74 133 2 119 0 0 0 134
                                                   2 0 7 6 74 135 1 7 137 0 138
                                                   2 24 16 0 9 139 2 141 140
                                                   119 37 142 2 74 143 0 0 144
                                                   2 6 0 0 74 145 2 6 16 0 0
                                                   146 2 141 140 6 37 147 1 7
                                                   148 0 149 2 7 0 0 0 150 1 0
                                                   7 7 151 1 27 0 7 152 2 27 0
                                                   0 0 153 1 0 27 24 154 2 88 9
                                                   9 155 156 3 0 7 7 27 10 105
                                                   2 0 7 27 10 41 1 0 9 9 52 1
                                                   1 27 24 154 2 1 7 6 74 135 2
                                                   0 7 27 7 31 1 0 22 20 117 1
                                                   1 7 7 151 1 0 16 9 19 2 1 7
                                                   7 119 121)))))
           '|lookupComplete|)) 
