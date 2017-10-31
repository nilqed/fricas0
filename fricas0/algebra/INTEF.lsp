
(SDEFUN |INTEF;prim?| ((|k| |Kernel| F) (|x| |Symbol|) ($ |Boolean|))
        (COND ((SPADCALL |k| '|log| (QREFELT $ 13)) 'T)
              ('T
               (SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 8)
                         (QREFELT $ 16))))) 

(SDEFUN |INTEF;lambint|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((|r1|
           (|Record|
            (|:| |answer|
                 (|IntegrationResult|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |a0| (|IntegrationResult| F))))
          (|extint|
           (|Mapping|
            (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F))
          (|derivative|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|dfac| (|SparseUnivariatePolynomial| F)) (|eta'| (F)) (|eta| (F)))
         (SEQ
          (LETT |eta'|
                (SPADCALL
                 (LETT |eta| (|SPADfirst| (SPADCALL |k| (QREFELT $ 18)))
                       . #1=(|INTEF;lambint|))
                 |x| (QREFELT $ 19))
                . #1#)
          (LETT |dfac|
                (SPADCALL (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 24))
                          (|spadConstant| $ 25) (QREFELT $ 26))
                . #1#)
          (LETT |derivative|
                (CONS #'|INTEF;lambint!2| (VECTOR |eta| |eta'| |x| $ |dfac|))
                . #1#)
          (LETT |extint| (CONS #'|INTEF;lambint!3| (VECTOR $ |eta| |eta'| |x|))
                . #1#)
          (LETT |r1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 24))
                            (|spadConstant| $ 25) (QREFELT $ 26))
                  (SPADCALL |f| |k| (QREFELT $ 39)) (QREFELT $ 41))
                 (SPADCALL |eta'| |eta| (QREFELT $ 32))
                 (CONS #'|INTEF;lambint!4| (VECTOR $ |x|)) |derivative|
                 |extint| (CONS #'|INTEF;lambint!5| (VECTOR $ |x|))
                 (QREFELT $ 49))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|INTEF;lambint!6| (VECTOR $ |k|)) (QCAR |r1|)
                      (QREFELT $ 55))
            (QCDR |r1|) (QREFELT $ 56)))))) 

(SDEFUN |INTEF;lambint!6| ((|x1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;lambint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 51)))))) 

(SDEFUN |INTEF;lambint!5| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTEF;lambint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 43)))))) 

(SDEFUN |INTEF;lambint!4| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTEF;lambint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;lambint!3| ((|f| NIL) ($$ NIL))
        (PROG (|x| |eta'| |eta| $)
          (LETT |x| (QREFELT $$ 3) . #1=(|INTEF;lambint|))
          (LETT |eta'| (QREFELT $$ 2) . #1#)
          (LETT |eta| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |f| |x| (SPADCALL |eta'| |eta| (QREFELT $ 32))
                      (QREFELT $ 36)))))) 

(SDEFUN |INTEF;lambint!2| ((|x1| NIL) ($$ NIL))
        (PROG (|dfac| $ |x| |eta'| |eta|)
          (LETT |dfac| (QREFELT $$ 4) . #1=(|INTEF;lambint|))
          (LETT $ (QREFELT $$ 3) . #1#)
          (LETT |x| (QREFELT $$ 2) . #1#)
          (LETT |eta'| (QREFELT $$ 1) . #1#)
          (LETT |eta| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (SPADCALL |dfac|
                              (SPADCALL |x1|
                                        (CONS #'|INTEF;lambint!0|
                                              (VECTOR $ |x|))
                                        (|spadConstant| $ 27) (QREFELT $ 29))
                              (QREFELT $ 30))
                    (SPADCALL |x1| (CONS #'|INTEF;lambint!1| $)
                              (SPADCALL (SPADCALL |eta'| |eta| (QREFELT $ 32))
                                        (|spadConstant| $ 33) (QREFELT $ 24))
                              (QREFELT $ 29))
                    (QREFELT $ 26))))))) 

(SDEFUN |INTEF;lambint!1| ((|x2| NIL) ($ NIL)) (|spadConstant| $ 31)) 

(SDEFUN |INTEF;lambint!0| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;unknownint| ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (SPROG ((|c| (F)) (|da| (F)) (|a| (F)))
               (SEQ
                (COND
                 ((SPADCALL
                   (LETT |da|
                         (SPADCALL
                          (LETT |a|
                                (SPADCALL (SPADCALL |f| (QREFELT $ 58))
                                          (QREFELT $ 59))
                                . #1=(|INTEF;unknownint|))
                          |x| (QREFELT $ 19))
                         . #1#)
                   (|spadConstant| $ 31) (QREFELT $ 60))
                  (COND
                   ((SPADCALL
                     (SPADCALL
                      (LETT |c|
                            (SPADCALL
                             (SPADCALL (SPADCALL |f| (QREFELT $ 61))
                                       (QREFELT $ 59))
                             |da| (QREFELT $ 32))
                            . #1#)
                      |x| (QREFELT $ 19))
                     (QREFELT $ 62))
                    (EXIT
                     (SPADCALL
                      (SPADCALL |c| (SPADCALL |a| (QREFELT $ 63))
                                (QREFELT $ 64))
                      (QREFELT $ 65)))))))
                (EXIT
                 (SPADCALL (|spadConstant| $ 31) NIL
                           (LIST (CONS |f| (SPADCALL |x| (QREFELT $ 67))))
                           (QREFELT $ 72)))))) 

(SDEFUN |INTEF;diffint1|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F)
         ($ |Union| (|IntegrationResult| F) "failed"))
        (SPROG
         ((|f3| (F)) (|nres3| (|IntegrationResult| F))
          (|nres2| (|IntegrationResult| F)) (|nrat| (F)) (|alpha| (F))
          (#1=#:G815 NIL)
          (|nlogs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff| (|SparseUnivariatePolynomial| F))
                      (|:| |logand| (|SparseUnivariatePolynomial| F)))))
          (|cpol| #2=(|SparseUnivariatePolynomial| F)) (#3=#:G816 NIL)
          (|lg| NIL)
          (|logs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|))) (|:| |coeff| #2#)
                      (|:| |logand| (|SparseUnivariatePolynomial| F)))))
          (|nres| (|IntegrationResult| F)) (|f2| (F)) (|dv| (|Symbol|))
          (|k1| (F)) (|da3| (F)) (|arg3| (F)) (|args| (|List| F)) (|f1| (F))
          (|nfu| (|SparseUnivariatePolynomial| F))
          (|fu| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fu| (SPADCALL |f| |k| (QREFELT $ 39))
                  . #4=(|INTEF;diffint1|))
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |fu| (QREFELT $ 76)) (|spadConstant| $ 25)
                         (QREFELT $ 77))
               (CONS 1 "failed"))
              (#5='T
               (SEQ (LETT |nfu| (SPADCALL |fu| (QREFELT $ 78)) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |nfu| (QREFELT $ 79)) 1
                                 (QREFELT $ 80))
                       (CONS 1 "failed"))
                      (#5#
                       (SEQ (LETT |f1| (SPADCALL |nfu| (QREFELT $ 81)) . #4#)
                            (LETT |args| (SPADCALL |k| (QREFELT $ 18)) . #4#)
                            (EXIT
                             (COND
                              ((SPADCALL (LENGTH |args|) 3 (QREFELT $ 80))
                               (|error| "internal error, k is not a diff"))
                              (#5#
                               (SEQ
                                (LETT |arg3| (SPADCALL |args| 3 (QREFELT $ 83))
                                      . #4#)
                                (LETT |da3|
                                      (SPADCALL |arg3| |x| (QREFELT $ 19))
                                      . #4#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |da3| (|spadConstant| $ 31)
                                             (QREFELT $ 84))
                                   (CONS 1 "failed"))
                                  (#5#
                                   (SEQ
                                    (LETT |k1|
                                          (SPADCALL
                                           (SPADCALL |args| 1 (QREFELT $ 83))
                                           (SPADCALL
                                            (SPADCALL |args| 2 (QREFELT $ 83))
                                            (QREFELT $ 85))
                                           |arg3| (QREFELT $ 86))
                                          . #4#)
                                    (LETT |dv| (SPADCALL (QREFELT $ 87)) . #4#)
                                    (LETT |f2|
                                          (SPADCALL
                                           (SPADCALL |f1| |da3| (QREFELT $ 32))
                                           |k1| (SPADCALL |dv| (QREFELT $ 67))
                                           (QREFELT $ 88))
                                          . #4#)
                                    (LETT |nres|
                                          (SPADCALL |f2| |dv| (QREFELT $ 43))
                                          . #4#)
                                    (COND
                                     ((NULL
                                       (NULL (SPADCALL |nres| (QREFELT $ 89))))
                                      (EXIT (CONS 1 "failed"))))
                                    (LETT |logs|
                                          (SPADCALL |nres| (QREFELT $ 90))
                                          . #4#)
                                    (LETT |nlogs| NIL . #4#)
                                    (LETT |nrat| (|spadConstant| $ 31) . #4#)
                                    (SEQ (LETT |lg| NIL . #4#)
                                         (LETT #3# |logs| . #4#) G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |lg| (CAR #3#) . #4#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (LETT |cpol| (QVELT |lg| 1) . #4#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL
                                              (CONS #'|INTEF;diffint1!0|
                                                    (VECTOR $ |x|))
                                              (SPADCALL |cpol| (QREFELT $ 92))
                                              (QREFELT $ 94))
                                             (LETT |nlogs| (CONS |lg| |nlogs|)
                                                   . #4#))
                                            ((SPADCALL
                                              (SPADCALL |cpol| (QREFELT $ 79))
                                              1 (QREFELT $ 80))
                                             (PROGN
                                              (LETT #1# (CONS 1 "failed")
                                                    . #4#)
                                              (GO #6=#:G814)))
                                            ('T
                                             (SEQ
                                              (LETT |alpha|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |cpol| 0
                                                                (QREFELT $ 95))
                                                      (SPADCALL |cpol|
                                                                (QREFELT $ 81))
                                                      (QREFELT $ 32))
                                                     (QREFELT $ 96))
                                                    . #4#)
                                              (EXIT
                                               (LETT |nrat|
                                                     (SPADCALL |nrat|
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QVELT |lg| 0)
                                                                 |alpha|
                                                                 (QREFELT $
                                                                          98))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QVELT |lg|
                                                                          2)
                                                                   (QREFELT $
                                                                            75)
                                                                   |alpha|
                                                                   (QREFELT $
                                                                            99))
                                                                  (QREFELT $
                                                                           100))
                                                                 (QREFELT $
                                                                          63))
                                                                (QREFELT $ 64))
                                                               (QREFELT $ 101))
                                                     . #4#)))))))
                                         (LETT #3# (CDR #3#) . #4#) (GO G190)
                                         G191 (EXIT NIL))
                                    (LETT |nres2|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |nres| (QREFELT $ 102))
                                            |nrat| (QREFELT $ 101))
                                           (NREVERSE |nlogs|) NIL
                                           (QREFELT $ 72))
                                          . #4#)
                                    (LETT |nres3|
                                          (SPADCALL
                                           (CONS #'|INTEF;diffint1!1|
                                                 (VECTOR |k1| $ |dv|))
                                           |nres2| (QREFELT $ 105))
                                          . #4#)
                                    (LETT |f3|
                                          (SPADCALL |f|
                                                    (SPADCALL |nres3| |x|
                                                              (QREFELT $ 106))
                                                    (QREFELT $ 107))
                                          . #4#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |k|
                                                 (SPADCALL |f3|
                                                           (QREFELT $ 109))
                                                 (QREFELT $ 111))
                                       (CONS 1 "failed"))
                                      (#5#
                                       (CONS 0
                                             (SPADCALL |nres3|
                                                       (SPADCALL |f3| |x|
                                                                 (QREFELT $
                                                                          43))
                                                       (QREFELT $
                                                                56))))))))))))))))))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |INTEF;diffint1!1| ((|x1| NIL) ($$ NIL))
        (PROG (|dv| $ |k1|)
          (LETT |dv| (QREFELT $$ 2) . #1=(|INTEF;diffint1|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |k1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| (SPADCALL |dv| (QREFELT $ 103)) |k1|
                      (QREFELT $ 86)))))) 

(SDEFUN |INTEF;diffint1!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTEF;diffint1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| |x| (QREFELT $ 91)) (|spadConstant| $ 31)
                      (QREFELT $ 84)))))) 

(SDEFUN |INTEF;diffint|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG ((|r1| (|Union| (|IntegrationResult| F) "failed")))
               (SEQ
                (LETT |r1| (|INTEF;diffint1| |f| |x| |k| $) |INTEF;diffint|)
                (EXIT
                 (COND ((QEQCAR |r1| 0) (QCDR |r1|))
                       ('T
                        (SPADCALL (|spadConstant| $ 31) NIL
                                  (LIST
                                   (CONS |f| (SPADCALL |x| (QREFELT $ 67))))
                                  (QREFELT $ 72)))))))) 

(SDEFUN |INTEF;isx?| ((|f| F) (|x| |Symbol|) ($ |Boolean|))
        (SPROG
         ((|r| (|Union| (|Symbol|) "failed"))
          (|k| (|Union| (|Kernel| F) "failed")))
         (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 113)) . #1=(|INTEF;isx?|))
              (EXIT
               (COND ((QEQCAR |k| 1) NIL)
                     (#2='T
                      (SEQ
                       (LETT |r| (SPADCALL (QCDR |k|) (QREFELT $ 115)) . #1#)
                       (EXIT
                        (COND ((QEQCAR |r| 1) NIL)
                              (#2# (EQUAL (QCDR |r|) |x|))))))))))) 

(SDEFUN |INTEF;alglfint|
        ((|f| F) (|k| |Kernel| F) (|l| |List| (|Kernel| F)) (|x| |Symbol|)
         ($ |IntegrationResult| F))
        (SPROG
         ((|y| (F))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |pol1| (|SparseUnivariatePolynomial| F))
                     (|:| |pol2| (|SparseUnivariatePolynomial| F))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (|res| (|IntegrationResult| F)) (|ir1| (|IntegrationResult| F))
          (|oroot| (F)) (#1=#:G854 NIL)
          (|al|
           (|List|
            (|Record| (|:| |funs| (|List| F)) (|:| |nroot| F)
                      (|:| |npow1| (|Integer|)) (|:| |npow2| (|Integer|)))))
          (|kx| (|Kernel| F)) (|xf| (F)))
         (SEQ (LETT |xf| (SPADCALL |x| (QREFELT $ 67)) . #2=(|INTEF;alglfint|))
              (EXIT
               (COND
                ((QEQCAR
                  (SPADCALL
                   (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 117)) . #2#)
                   (QREFELT $ 115))
                  0)
                 (|INTEF;addx| (SPADCALL |f| |kx| |k| (QREFELT $ 119)) |xf| $))
                ((SPADCALL |kx| '|exp| (QREFELT $ 13))
                 (|INTEF;addx| (|INTEF;algexpint| |f| |kx| |k| |x| $) |xf| $))
                ((|INTEF;prim?| |kx| |x| $)
                 (|INTEF;addx| (|INTEF;algprimint| |f| |kx| |k| |x| $) |xf| $))
                ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 9)
                           (QREFELT $ 16))
                 (SEQ
                  (COND
                   ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) '|nthRoot|
                              (QREFELT $ 120))
                    (COND
                     ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) '|nthRoot|
                                (QREFELT $ 120))
                      (COND
                       ((NULL
                         (SPADCALL |kx|
                                   (SPADCALL (SPADCALL |k| (QREFELT $ 121))
                                             (QREFELT $ 122))
                                   (QREFELT $ 111)))
                        (EXIT
                         (SEQ
                          (LETT |al|
                                (SPADCALL (LIST |f|) |k| |kx| (QREFELT $ 126))
                                . #2#)
                          (LETT |res| (|spadConstant| $ 127) . #2#)
                          (SEQ (LETT |rec| NIL . #2#) (LETT #1# |al| . #2#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |ir1|
                                      (SPADCALL (|SPADfirst| (QVELT |rec| 0))
                                                |x| (QREFELT $ 43))
                                      . #2#)
                                (COND
                                 ((SPADCALL (+ (QVELT |rec| 2) (QVELT |rec| 3))
                                            0 (QREFELT $ 128))
                                  (SEQ
                                   (LETT |oroot|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |k| (QREFELT $ 121))
                                           (QVELT |rec| 2) (QREFELT $ 129))
                                          (SPADCALL
                                           (SPADCALL |kx| (QREFELT $ 121))
                                           (QVELT |rec| 3) (QREFELT $ 129))
                                          (QREFELT $ 64))
                                         . #2#)
                                   (EXIT
                                    (LETT |ir1|
                                          (SPADCALL
                                           (CONS #'|INTEF;alglfint!0|
                                                 (VECTOR |oroot| $ |rec|))
                                           |ir1| (QREFELT $ 105))
                                          . #2#)))))
                                (EXIT
                                 (LETT |res|
                                       (SPADCALL |res| |ir1| (QREFELT $ 56))
                                       . #2#)))
                               (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT |res|)))))))))
                  (LETT |rec|
                        (SPADCALL (SPADCALL |kx| (QREFELT $ 121))
                                  (SPADCALL |k| (QREFELT $ 121))
                                  (QREFELT $ 132))
                        . #2#)
                  (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 134)) . #2#)
                  (EXIT
                   (SPADCALL (CONS #'|INTEF;alglfint!1| (VECTOR |rec| $ |y|))
                             (SPADCALL
                              (SPADCALL |f| (LIST |kx| |k|)
                                        (LIST
                                         (SPADCALL (QVELT |rec| 1) |y|
                                                   (QREFELT $ 135))
                                         (SPADCALL (QVELT |rec| 2) |y|
                                                   (QREFELT $ 135)))
                                        (QREFELT $ 137))
                              |x| (QREFELT $ 43))
                             (QREFELT $ 105)))))
                ('T (|INTEF;unknownint| |f| |x| $))))))) 

(SDEFUN |INTEF;alglfint!1| ((|x1| NIL) ($$ NIL))
        (PROG (|y| $ |rec|)
          (LETT |y| (QREFELT $$ 2) . #1=(|INTEF;alglfint|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |rec| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| (SPADCALL |y| (QREFELT $ 85)) (QVELT |rec| 0)
                      (QREFELT $ 86)))))) 

(SDEFUN |INTEF;alglfint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|rec| $ |oroot|)
          (LETT |rec| (QREFELT $$ 2) . #1=(|INTEF;alglfint|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |oroot| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| (SPADCALL (QVELT |rec| 1) (QREFELT $ 85)) |oroot|
                      (QREFELT $ 86)))))) 

(SDEFUN |INTEF;lfintegrate;FSIr;8|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (SPADCALL |f| |x| (CONS (|function| |INTEF;lfintegrate0|) $)
                  (ELT $ 142) (QREFELT $ 145))) 

(SDEFUN |INTEF;lfintegrate;FSIr;9|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (|INTEF;lfintegrate0| |f| |x| $)) 

(SDEFUN |INTEF;lfintegrate;FSIr;10|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (|INTEF;lfintegrate0| |f| |x| $)) 

(SDEFUN |INTEF;lfintegrate;FSIr;11|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (|INTEF;lfintegrate0| |f| |x| $)) 

(SDEFUN |INTEF;lfintegrate0| ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (SPROG ((|k| (|Kernel| F)) (|l| (|List| (|Kernel| F))) (|xf| (F)))
               (SEQ
                (COND ((SPADCALL |f| (QREFELT $ 62)) (|spadConstant| $ 127))
                      (#1='T
                       (SEQ
                        (LETT |xf| (SPADCALL |x| (QREFELT $ 67))
                              . #2=(|INTEF;lfintegrate0|))
                        (EXIT
                         (COND
                          ((NULL
                            (LETT |l|
                                  (SPADCALL (SPADCALL |f| (QREFELT $ 109)) |x|
                                            (QREFELT $ 146))
                                  . #2#))
                           (SPADCALL (SPADCALL |xf| |f| (QREFELT $ 64))
                                     (QREFELT $ 65)))
                          ((QEQCAR
                            (SPADCALL
                             (LETT |k| (SPADCALL |l| (QREFELT $ 147)) . #2#)
                             (QREFELT $ 115))
                            0)
                           (SPADCALL
                            (CONS #'|INTEF;lfintegrate0!0| (VECTOR $ |k|))
                            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 39))
                                      (QREFELT $ 149))
                            (QREFELT $ 55)))
                          ((SPADCALL |k| '|exp| (QREFELT $ 13))
                           (|INTEF;addx| (|INTEF;expint| |f| |x| |k| $) |xf|
                            $))
                          ((SPADCALL |k| '|lambertW| (QREFELT $ 13))
                           (|INTEF;addx| (|INTEF;lambint| |f| |x| |k| $) |xf|
                            $))
                          ((|INTEF;prim?| |k| |x| $)
                           (|INTEF;addx| (|INTEF;primint| |f| |x| |k| $) |xf|
                            $))
                          ((SPADCALL (SPADCALL |k| (QREFELT $ 15))
                                     (QREFELT $ 9) (QREFELT $ 16))
                           (|INTEF;alglfint| |f| |k| |l| |x| $))
                          ((SPADCALL |k| '|%diff| (QREFELT $ 13))
                           (|INTEF;diffint| |f| |x| |k| $))
                          (#1# (|INTEF;unknownint| |f| |x| $)))))))))) 

(SDEFUN |INTEF;lfintegrate0!0| ((|x1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;lfintegrate0|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 51)))))) 

(SDEFUN |INTEF;addx|
        ((|i| |IntegrationResult| F) (|x| F) ($ |IntegrationResult| F))
        (SPROG ((#1=#:G889 NIL) (|ne| NIL) (#2=#:G888 NIL))
               (SEQ
                (COND ((SPADCALL |i| (QREFELT $ 150)) |i|)
                      ('T
                       (SPADCALL (SPADCALL |i| (QREFELT $ 102))
                                 (SPADCALL |i| (QREFELT $ 90))
                                 (PROGN
                                  (LETT #2# NIL . #3=(|INTEF;addx|))
                                  (SEQ (LETT |ne| NIL . #3#)
                                       (LETT #1# (SPADCALL |i| (QREFELT $ 89))
                                             . #3#)
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |ne| (CAR #1#) . #3#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS (CONS (QCAR |ne|) |x|)
                                                     #2#)
                                               . #3#)))
                                       (LETT #1# (CDR #1#) . #3#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 72))))))) 

(SDEFUN |INTEF;tryChangeVar|
        ((|f| F) (|t| |Kernel| F) (|x| |Symbol|)
         ($ |Union| (|IntegrationResult| F) "failed"))
        (SPROG ((|g| (F)) (|z| (|Symbol|)))
               (SEQ
                (LETT |z| (SPADCALL (QREFELT $ 87))
                      . #1=(|INTEF;tryChangeVar|))
                (LETT |g|
                      (SPADCALL
                       (SPADCALL |f|
                                 (SPADCALL (SPADCALL |t| (QREFELT $ 121)) |x|
                                           (QREFELT $ 19))
                                 (QREFELT $ 32))
                       (LIST |t|) (LIST (SPADCALL |z| (QREFELT $ 67)))
                       (QREFELT $ 151))
                      . #1#)
                (EXIT
                 (COND
                  ((SPADCALL |g| |x| (QREFELT $ 152))
                   (CONS 0
                         (SPADCALL
                          (CONS #'|INTEF;tryChangeVar!0| (VECTOR |t| $ |z|))
                          (SPADCALL |g| |z| (QREFELT $ 43)) (QREFELT $ 105))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |INTEF;tryChangeVar!0| ((|x1| NIL) ($$ NIL))
        (PROG (|z| $ |t|)
          (LETT |z| (QREFELT $$ 2) . #1=(|INTEF;tryChangeVar|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |t| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| (SPADCALL |z| (QREFELT $ 103))
                      (SPADCALL |t| (QREFELT $ 121)) (QREFELT $ 86)))))) 

(SDEFUN |INTEF;algexpint|
        ((|f| F) (|t| |Kernel| F) (|y| |Kernel| F) (|x| |Symbol|)
         ($ |IntegrationResult| F))
        (SPROG ((|u| (|Union| (|IntegrationResult| F) "failed")))
               (SEQ
                (LETT |u| (|INTEF;tryChangeVar| |f| |t| |x| $)
                      |INTEF;algexpint|)
                (EXIT
                 (COND ((QEQCAR |u| 0) (QCDR |u|))
                       ('T
                        (SPADCALL |f| |t| |y|
                                  (CONS #'|INTEF;algexpint!1|
                                        (VECTOR |t| |x| $))
                                  (QREFELT $ 155)))))))) 

(SDEFUN |INTEF;algexpint!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |x| |t|)
          (LETT $ (QREFELT $$ 2) . #1=(|INTEF;algexpint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |t| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x1| (CONS #'|INTEF;algexpint!0| (VECTOR $ |x|))
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL |t| (QREFELT $ 18))
                                         (QREFELT $ 153))
                               |x| (QREFELT $ 19))
                              (|spadConstant| $ 33) (QREFELT $ 24))
                             (QREFELT $ 29))))))) 

(SDEFUN |INTEF;algexpint!0| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;algprimint|
        ((|f| F) (|t| |Kernel| F) (|y| |Kernel| F) (|x| |Symbol|)
         ($ |IntegrationResult| F))
        (SPROG ((|u| (|Union| (|IntegrationResult| F) "failed")))
               (SEQ
                (LETT |u| (|INTEF;tryChangeVar| |f| |t| |x| $)
                      |INTEF;algprimint|)
                (EXIT
                 (COND ((QEQCAR |u| 0) (QCDR |u|))
                       ('T
                        (SPADCALL |f| |t| |y|
                                  (CONS #'|INTEF;algprimint!1|
                                        (VECTOR |t| |x| $))
                                  (QREFELT $ 155)))))))) 

(SDEFUN |INTEF;algprimint!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |x| |t|)
          (LETT $ (QREFELT $$ 2) . #1=(|INTEF;algprimint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |t| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x1| (CONS #'|INTEF;algprimint!0| (VECTOR $ |x|))
                             (SPADCALL
                              (SPADCALL (SPADCALL |t| (QREFELT $ 121)) |x|
                                        (QREFELT $ 19))
                              (QREFELT $ 156))
                             (QREFELT $ 29))))))) 

(SDEFUN |INTEF;algprimint!0| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;lfextendedint;FSFU;17|
        ((|f| F) (|x| |Symbol|) (|g| F)
         ($ |Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed"))
        (SPROG
         ((|res1|
           (|Union| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                    "failed")))
         (SEQ
          (LETT |res1| (QCAR (SPADCALL |f| |x| (LIST |g|) (QREFELT $ 161)))
                |INTEF;lfextendedint;FSFU;17|)
          (EXIT
           (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (CONS (QCAR (QCDR |res1|))
                              (SPADCALL (QCDR (QCDR |res1|)) 1
                                        (QREFELT $ 163)))))))))) 

(SDEFUN |INTEF;denint_dummy|
        ((|f| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |Record|
          (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |ir|
               (|IntegrationResult|
                (|Fraction| (|SparseUnivariatePolynomial| F))))))
        (VECTOR (|spadConstant| $ 164) |f| (|spadConstant| $ 165))) 

(SDEFUN |INTEF;primint|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((|r1|
           (|Record|
            (|:| |answer|
                 (|IntegrationResult|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |a0| F)))
          (|ext|
           (|Mapping|
            (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F))
          (|dk| (F))
          (|denint|
           (|Mapping|
            (|Record|
             (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |ir|
                  (|IntegrationResult|
                   (|Fraction| (|SparseUnivariatePolynomial| F)))))
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|lk| (|List| (|Kernel| F))) (#1=#:G985 NIL) (|a| NIL)
          (#2=#:G984 NIL))
         (SEQ
          (LETT |lk|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|INTEF;primint|))
                  (SEQ (LETT |a| NIL . #3#)
                       (LETT #1# (SPADCALL |f| (QREFELT $ 122)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |a| |k| (QREFELT $ 172))
                           (LETT #2# (CONS |a| #2#) . #3#)))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |x| (QREFELT $ 146))
                . #3#)
          (LETT |denint|
                (COND
                 ((SPADCALL |k| '|log| (QREFELT $ 13))
                  (CONS #'|INTEF;primint!0| (VECTOR (QREFELT $ 169) |x| |k|)))
                 ('T (CONS (|function| |INTEF;denint_dummy|) $)))
                . #3#)
          (LETT |dk|
                (SPADCALL (SPADCALL |k| (QREFELT $ 121)) |x| (QREFELT $ 19))
                . #3#)
          (LETT |ext| (CONS #'|INTEF;primint!1| (VECTOR $ |dk| |lk| |x|))
                . #3#)
          (LETT |r1|
                (SPADCALL (SPADCALL |f| |k| (QREFELT $ 39))
                          (CONS #'|INTEF;primint!3| (VECTOR |dk| |x| $))
                          |denint| |ext| (QREFELT $ 177))
                . #3#)
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|INTEF;primint!4| (VECTOR $ |k|)) (QCAR |r1|)
                      (QREFELT $ 55))
            (SPADCALL (QCDR |r1|) |x| (QREFELT $ 43)) (QREFELT $ 56)))))) 

(SDEFUN |INTEF;primint!4| ((|x1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;primint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 51)))))) 

(SDEFUN |INTEF;primint!3| ((|x1| NIL) ($$ NIL))
        (PROG ($ |x| |dk|)
          (LETT $ (QREFELT $$ 2) . #1=(|INTEF;primint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |dk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x1| (CONS #'|INTEF;primint!2| (VECTOR $ |x|))
                             (SPADCALL |dk| (QREFELT $ 156))
                             (QREFELT $ 29))))))) 

(SDEFUN |INTEF;primint!2| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;primint!1| ((|f1| NIL) ($$ NIL))
        (PROG (|x| |lk| |dk| $)
          (LETT |x| (QREFELT $$ 3) . #1=(|INTEF;primint|))
          (LETT |lk| (QREFELT $$ 2) . #1#)
          (LETT |dk| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|rf| NIL) (|r1| NIL))
                   (SEQ
                    (LETT |r1|
                          (QCAR
                           (SPADCALL |f1| |x| |lk| (LIST |dk|)
                                     (QREFELT $ 173)))
                          NIL)
                    (EXIT
                     (COND ((QEQCAR |r1| 1) (CONS 1 "failed"))
                           ('T
                            (SEQ (LETT |rf| (QCDR |r1|) NIL)
                                 (EXIT
                                  (CONS 0
                                        (CONS (QCAR |rf|)
                                              (SPADCALL (QCDR |rf|)
                                                        (|spadConstant| $ 174)
                                                        (QREFELT $
                                                                 163))))))))))))))) 

(SDEFUN |INTEF;primint!0| ((|rf| NIL) ($$ NIL))
        (PROG (|k| |x| |denint_li|)
          (LETT |k| (QREFELT $$ 2) . #1=(|INTEF;primint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |denint_li| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |rf| |k| |x| |denint_li|))))) 

(SDEFUN |INTEF;risch_de_solver|
        ((|x3| |Integer|) (|x4| F) (|eta| F) (|x| |Symbol|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPADCALL |x3| |eta| |x4| |x| (QREFELT $ 180))) 

(SDEFUN |INTEF;expint|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((|r1|
           (|Record|
            (|:| |answer|
                 (|IntegrationResult|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |a0| F)))
          (|eta| (F)))
         (SEQ
          (LETT |eta| (|SPADfirst| (SPADCALL |k| (QREFELT $ 18)))
                . #1=(|INTEF;expint|))
          (LETT |r1|
                (SPADCALL (SPADCALL |f| |k| (QREFELT $ 39))
                          (CONS #'|INTEF;expint!1| (VECTOR |eta| |x| $))
                          (CONS #'|INTEF;expint!2|
                                (VECTOR (QREFELT $ 171) |x| |k|))
                          (CONS #'|INTEF;expint!3| (VECTOR $ |x| |eta|))
                          (QREFELT $ 182))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|INTEF;expint!4| (VECTOR $ |k|)) (QCAR |r1|)
                      (QREFELT $ 55))
            (SPADCALL (QCDR |r1|) |x| (QREFELT $ 43)) (QREFELT $ 56)))))) 

(SDEFUN |INTEF;expint!4| ((|x1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;expint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 51)))))) 

(SDEFUN |INTEF;expint!3| ((|x3| NIL) (|x4| NIL) ($$ NIL))
        (PROG (|eta| |x| $)
          (LETT |eta| (QREFELT $$ 2) . #1=(|INTEF;expint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTEF;risch_de_solver| |x3| |x4| |eta| |x| $))))) 

(SDEFUN |INTEF;expint!2| ((|rf| NIL) ($$ NIL))
        (PROG (|k| |x| |denint_poly|)
          (LETT |k| (QREFELT $$ 2) . #1=(|INTEF;expint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |denint_poly| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |rf| |k| |x| |denint_poly|))))) 

(SDEFUN |INTEF;expint!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |x| |eta|)
          (LETT $ (QREFELT $$ 2) . #1=(|INTEF;expint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |eta| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x1| (CONS #'|INTEF;expint!0| (VECTOR $ |x|))
                             (SPADCALL (SPADCALL |eta| |x| (QREFELT $ 19))
                                       (|spadConstant| $ 33) (QREFELT $ 24))
                             (QREFELT $ 29))))))) 

(SDEFUN |INTEF;expint!0| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DECLAIM (NOTINLINE |ElementaryIntegration;|)) 

(DEFUN |ElementaryIntegration| (&REST #1=#:G1002)
  (SPROG NIL
         (PROG (#2=#:G1003)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryIntegration|)
                                               '|domainEqualList|)
                    . #3=(|ElementaryIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ElementaryIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ElementaryIntegration|)))))))))) 

(DEFUN |ElementaryIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (SEQ
          (PROGN
           (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryIntegration|))
           (LETT DV$2 (|devaluate| |#2|) . #1#)
           (LETT |dv$| (LIST '|ElementaryIntegration| DV$1 DV$2) . #1#)
           (LETT $ (GETREFV 183) . #1#)
           (QSETREFV $ 0 |dv$|)
           (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
           (|haddProp| |$ConstructorCache| '|ElementaryIntegration|
                       (LIST DV$1 DV$2) (CONS 1 $))
           (|stuffDomainSlots| $)
           (QSETREFV $ 6 |#1|)
           (QSETREFV $ 7 |#2|)
           (SETF |pv$| (QREFELT $ 3))
           (QSETREFV $ 8 '|prim|)
           (QSETREFV $ 9 '|%alg|)
           (QSETREFV $ 75 (SPADCALL (QREFELT $ 74)))
           (COND
            ((|HasCategory| |#1| '(|ConvertibleTo| (|Pattern| (|Integer|))))
             (COND
              ((|HasCategory| |#1| '(|PatternMatchable| (|Integer|)))
               (PROGN
                (QSETREFV $ 138
                          (COND
                           ((|HasCategory| |#2|
                                           '(|LiouvillianFunctionCategory|))
                            (|HasCategory| |#2| '(|RetractableTo| (|Symbol|))))
                           ('T NIL)))
                (COND
                 ((QREFELT $ 138)
                  (PROGN
                   (QSETREFV $ 43
                             (CONS
                              (|dispatchFunction| |INTEF;lfintegrate;FSIr;8|)
                              $))))
                 ('T
                  (QSETREFV $ 43
                            (CONS
                             (|dispatchFunction| |INTEF;lfintegrate;FSIr;9|)
                             $))))))
              ('T
               (QSETREFV $ 43
                         (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;10|)
                               $)))))
            ('T
             (QSETREFV $ 43
                       (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;11|)
                             $))))
           (QSETREFV $ 169
                     (SEQ
                      (COND
                       ((|domainEqual| |#1| (|Integer|))
                        (COND
                         ((|domainEqual| |#2| (|Expression| (|Integer|)))
                          (EXIT (ELT $ 168))))))
                      (COND
                       ((|domainEqual| |#1| (|Complex| (|Integer|)))
                        (COND
                         ((|domainEqual| |#2|
                                         (|Expression|
                                          (|Complex| (|Integer|))))
                          (EXIT (ELT $ 168))))))
                      (EXIT (CONS #'|ElementaryIntegration!0| $))))
           (QSETREFV $ 171
                     (SEQ
                      (COND
                       ((|domainEqual| |#1| (|Integer|))
                        (COND
                         ((|domainEqual| |#2| (|Expression| (|Integer|)))
                          (EXIT (ELT $ 170))))))
                      (COND
                       ((|domainEqual| |#1| (|Complex| (|Integer|)))
                        (COND
                         ((|domainEqual| |#2|
                                         (|Expression|
                                          (|Complex| (|Integer|))))
                          (EXIT (ELT $ 170))))))
                      (EXIT (CONS #'|ElementaryIntegration!1| $))))
           $)))) 

(DEFUN |ElementaryIntegration!1| (|rf| |k| |x| $) (|INTEF;denint_dummy| |rf| $)) 

(DEFUN |ElementaryIntegration!0| (|rf| |k| |x| $) (|INTEF;denint_dummy| |rf| $)) 

(MAKEPROP '|ElementaryIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'PRIM
              'ALGOP (|Boolean|) (|Symbol|) (|Kernel| 7) (0 . |is?|)
              (|BasicOperator|) (6 . |operator|) (11 . |has?|) (|List| 7)
              (17 . |argument|) (22 . |differentiate|) (28 . |One|)
              (32 . |One|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 7) (36 . |monomial|) (42 . |One|)
              (46 . +) (52 . |Zero|) (|Mapping| 7 7) (56 . |differentiate|)
              (63 . *) (69 . |Zero|) (73 . /) (79 . |One|)
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 34 '"failed") |INTEF;lfextendedint;FSFU;17|
              (|Fraction| 133) (|Kernel| $) (83 . |univariate|) (|Fraction| 23)
              (89 . *) (|IntegrationResult| 7) (95 . |lfintegrate|)
              (|Record| (|:| |answer| 53) (|:| |a0| 42)) (|Mapping| 23 23)
              (|Mapping| 35 7) (|Mapping| 42 7)
              (|TranscendentalIntegration| 7 23) (101 . |lambintegrate|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 12) 12
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 12)
                                                     7)
              (111 . |multivariate|) (|Mapping| 7 40) (|IntegrationResult| 40)
              (|IntegrationResultFunctions2| 40 7) (117 . |map|) (123 . +)
              (|SparseMultivariatePolynomial| 6 38) (129 . |denom|)
              (134 . |coerce|) (139 . ~=) (145 . |numer|) (150 . |zero?|)
              (155 . |log|) (160 . *) (166 . |coerce|) (171 . |Zero|)
              (175 . |coerce|)
              (|Record| (|:| |scalar| 97) (|:| |coeff| 23) (|:| |logand| 23))
              (|List| 68) (|Record| (|:| |integrand| 7) (|:| |intvar| 7))
              (|List| 70) (180 . |mkAnswer|) (|SingletonAsOrderedSet|)
              (187 . |create|) '|dummy| (191 . |denom|) (196 . ~=)
              (202 . |numer|) (207 . |degree|) (212 . ~=)
              (218 . |leadingCoefficient|) (|Integer|) (223 . |elt|) (229 . =)
              (235 . |retract|) (240 . |eval|) (247 . |new|) (251 . |eval|)
              (258 . |notelem|) (263 . |logpart|) (268 . D)
              (274 . |coefficients|) (|Mapping| 10 7) (279 . |every?|)
              (285 . |coefficient|) (291 . -) (|Fraction| 82) (296 . *)
              (302 . |eval|) (309 . |retract|) (314 . +) (320 . |ratpart|)
              (325 . |kernel|) (|IntegrationResultFunctions2| 7 7)
              (330 . |map|) (336 . |differentiate|) (342 . -) (|List| 38)
              (348 . |kernels|) (|List| 12) (353 . |member?|)
              (|Union| 38 '"failed") (359 . |retractIfCan|)
              (|Union| 11 '"failed") (364 . |symbolIfCan|)
              (|IntegrationTools| 6 7) (369 . |ksec|)
              (|PureAlgebraicIntegration| 6 7 7) (376 . |palgint|)
              (383 . |is?|) (389 . |coerce|) (394 . |tower|)
              (|Record| (|:| |funs| 17) (|:| |nroot| 7) (|:| |npow1| 82)
                        (|:| |npow2| 82))
              (|List| 123) (|RootFSSplit| 6 7) (399 . |alg_split_roots|)
              (406 . |Zero|) (410 . >) (416 . ^)
              (|Record| (|:| |primelt| 7) (|:| |pol1| 23) (|:| |pol2| 23)
                        (|:| |prim| 23))
              (|FunctionSpacePrimitiveElement| 6 7) (422 . |primitiveElement|)
              (|SparseUnivariatePolynomial| $) (428 . |rootOf|) (433 . |elt|)
              (|List| $) (439 . |eval|) '#:G708
              (|Record| (|:| |special| 7) (|:| |integrand| 7))
              (|Union| 139 '"failed") (|PatternMatchIntegration| 6 7)
              (446 . |pmintegrate|) (|Mapping| 42 7 11) (|Mapping| 140 7 11)
              (452 . |intPatternMatch|) (460 . |varselect|) (466 . |kmax|)
              (|RationalIntegration| 7 23) (471 . |integrate|) (476 . |elem?|)
              (481 . |subst|) (488 . |freeOf?|) (494 . |first|)
              (|AlgebraicIntegration| 6 7) (499 . |algint|) (507 . |coerce|)
              (|Record| (|:| |ratpart| 7) (|:| |coeffs| 162))
              (|Union| 157 '"failed")
              (|Record| (|:| |particular| 158) (|:| |basis| (|List| 157)))
              (|ParametricIntegration| 6 7) (512 . |extendedint|) (|Vector| 7)
              (519 . |elt|) (525 . |Zero|) (529 . |Zero|)
              (|Record| (|:| |answer| 40) (|:| |logpart| 40) (|:| |ir| 53))
              (|DenominatorIntegration| 6 7) (533 . |li_int|) '|denint_li|
              (540 . |poly_int|) '|denint_poly| (547 . ~=)
              (553 . |extendedint|) (561 . |One|)
              (|Record| (|:| |answer| 53) (|:| |a0| 7)) (|Mapping| 166 40)
              (565 . |primintegrate|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |primpart| 7)
                        (|:| |sol?| 10))
              (|ElementaryRischDEX2| 6 7) (573 . |risch_de_ext|)
              (|Mapping| 178 82 7) (581 . |expintegrate|))
           '#(|lfintegrate| 589 |lfextendedint| 595) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 182
                                                 '(2 12 10 0 11 13 1 12 14 0 15
                                                   2 14 10 0 11 16 1 12 17 0 18
                                                   2 7 0 0 11 19 0 6 0 20 0 7 0
                                                   21 2 23 0 7 22 24 0 23 0 25
                                                   2 23 0 0 0 26 0 23 0 27 3 23
                                                   0 0 28 0 29 2 23 0 0 0 30 0
                                                   7 0 31 2 7 0 0 0 32 0 22 0
                                                   33 2 7 37 0 38 39 2 40 0 23
                                                   0 41 2 0 42 7 11 43 6 48 44
                                                   40 7 28 45 46 47 49 2 50 7
                                                   40 12 51 2 54 42 52 53 55 2
                                                   42 0 0 0 56 1 7 57 0 58 1 7
                                                   0 57 59 2 7 10 0 0 60 1 7 57
                                                   0 61 1 7 10 0 62 1 7 0 0 63
                                                   2 7 0 0 0 64 1 42 0 7 65 0 6
                                                   0 66 1 7 0 11 67 3 42 0 7 69
                                                   71 72 0 73 0 74 1 40 23 0 76
                                                   2 23 10 0 0 77 1 40 23 0 78
                                                   1 23 22 0 79 2 22 10 0 0 80
                                                   1 23 7 0 81 2 17 7 0 82 83 2
                                                   7 10 0 0 84 1 7 38 0 85 3 7
                                                   0 0 38 0 86 0 11 0 87 3 7 0
                                                   0 0 0 88 1 42 71 0 89 1 42
                                                   69 0 90 2 7 0 0 11 91 1 23
                                                   17 0 92 2 17 10 93 0 94 2 23
                                                   7 0 22 95 1 7 0 0 96 2 7 0
                                                   97 0 98 3 23 0 0 73 7 99 1
                                                   23 7 0 100 2 7 0 0 0 101 1
                                                   42 7 0 102 1 12 0 11 103 2
                                                   104 42 28 42 105 2 42 7 0 11
                                                   106 2 7 0 0 0 107 1 7 108 0
                                                   109 2 110 10 12 0 111 1 7
                                                   112 0 113 1 12 114 0 115 3
                                                   116 12 12 110 11 117 3 118
                                                   42 7 12 12 119 2 14 10 0 11
                                                   120 1 7 0 38 121 1 7 108 0
                                                   122 3 125 124 17 12 12 126 0
                                                   42 0 127 2 82 10 0 0 128 2 7
                                                   0 0 82 129 2 131 130 7 7 132
                                                   1 7 0 133 134 2 23 7 0 7 135
                                                   3 7 0 0 108 136 137 2 141
                                                   140 7 11 142 4 116 42 7 11
                                                   143 144 145 2 116 110 110 11
                                                   146 1 116 12 110 147 1 148
                                                   53 40 149 1 42 10 0 150 3 7
                                                   0 0 108 136 151 2 7 10 0 11
                                                   152 1 17 7 0 153 4 154 42 7
                                                   12 12 45 155 1 23 0 7 156 3
                                                   160 159 7 11 17 161 2 162 7
                                                   0 82 163 0 40 0 164 0 53 0
                                                   165 3 167 166 40 12 11 168 3
                                                   167 166 40 12 11 170 2 12 10
                                                   0 0 172 4 160 159 7 11 110
                                                   17 173 0 82 0 174 4 48 175
                                                   40 45 176 46 177 4 179 178
                                                   82 7 7 11 180 4 48 175 40 45
                                                   176 181 182 2 0 42 7 11 43 3
                                                   0 35 7 11 7 36)))))
           '|lookupComplete|)) 
