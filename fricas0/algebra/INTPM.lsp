
(SDEFUN |INTPM;mkalist|
        ((|res| |PatternMatchResult| (|Integer|) F)
         ($ |AssociationList| (|Symbol|) F))
        (SPADCALL (SPADCALL |res| (QREFELT $ 53)) (QREFELT $ 55))) 

(SDEFUN |INTPM;splitConstant;FSR;2|
        ((|f| F) (|x| |Symbol|) ($ |Record| (|:| |const| F) (|:| |nconst| F)))
        (SPROG
         ((#1=#:G789 NIL) (|rec| (|Record| (|:| |const| F) (|:| |nconst| F)))
          (|vv| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|))))
          (|v|
           (|Union| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|)))
                    #2="failed"))
          (|cc| (F)) (#3=#:G791 NIL) (|g| NIL) (|nc| (F))
          (|u| (|Union| (|List| F) #2#)) (#4=#:G790 NIL))
         (SEQ
          (EXIT
           (COND
            ((NULL (SPADCALL |x| (SPADCALL |f| (QREFELT $ 23)) (QREFELT $ 56)))
             (CONS |f| (|spadConstant| $ 44)))
            ('T
             (COND
              ((QEQCAR (SPADCALL |f| (QREFELT $ 59)) 0)
               (CONS (|spadConstant| $ 44) |f|))
              (#5='T
               (SEQ
                (LETT |u| (SPADCALL |f| (QREFELT $ 61))
                      . #6=(|INTPM;splitConstant;FSR;2|))
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (SEQ
                    (LETT |cc| (LETT |nc| (|spadConstant| $ 44) . #6#) . #6#)
                    (SEQ (LETT |g| NIL . #6#) (LETT #4# (QCDR |u|) . #6#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |g| (CAR #4#) . #6#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |rec| (SPADCALL |g| |x| (QREFELT $ 63)) . #6#)
                          (LETT |cc|
                                (SPADCALL |cc| (QCAR |rec|) (QREFELT $ 64))
                                . #6#)
                          (EXIT
                           (LETT |nc|
                                 (SPADCALL |nc| (QCDR |rec|) (QREFELT $ 64))
                                 . #6#)))
                         (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS |cc| |nc|))))
                  (#5#
                   (SEQ (LETT |u| (SPADCALL |f| (QREFELT $ 65)) . #6#)
                        (EXIT
                         (COND
                          ((QEQCAR |u| 0)
                           (SEQ
                            (LETT |rec|
                                  (SPADCALL (|SPADfirst| (QCDR |u|)) |x|
                                            (QREFELT $ 63))
                                  . #6#)
                            (LETT |cc| (QCAR |rec|) . #6#)
                            (LETT |nc| (QCDR |rec|) . #6#)
                            (SEQ (LETT |g| NIL . #6#)
                                 (LETT #3# (CDR (QCDR |u|)) . #6#) G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |g| (CAR #3#) . #6#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |rec| (SPADCALL |g| |x| (QREFELT $ 63))
                                        . #6#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL (QCDR |rec|) |nc|
                                               (QREFELT $ 66))
                                     (LETT |cc|
                                           (SPADCALL |cc| (QCAR |rec|)
                                                     (QREFELT $ 67))
                                           . #6#))
                                    ((SPADCALL (QCDR |rec|)
                                               (SPADCALL |nc| (QREFELT $ 68))
                                               (QREFELT $ 66))
                                     (LETT |cc|
                                           (SPADCALL |cc| (QCAR |rec|)
                                                     (QREFELT $ 69))
                                           . #6#))
                                    ('T
                                     (PROGN
                                      (LETT #1#
                                            (CONS (|spadConstant| $ 44) |f|)
                                            . #6#)
                                      (GO #7=#:G788))))))
                                 (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT (CONS |cc| |nc|))))
                          (#5#
                           (SEQ
                            (SEQ (LETT |v| (SPADCALL |f| (QREFELT $ 72)) . #6#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |v| 0)
                                    (SEQ (LETT |vv| (QCDR |v|) . #6#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL (QCDR |vv|) 1
                                                      (QREFELT $ 73))
                                            (SEQ
                                             (LETT |rec|
                                                   (SPADCALL (QCAR |vv|) |x|
                                                             (QREFELT $ 63))
                                                   . #6#)
                                             (EXIT
                                              (PROGN
                                               (LETT #1#
                                                     (CONS
                                                      (SPADCALL (QCAR |rec|)
                                                                (QCDR |vv|)
                                                                (QREFELT $ 74))
                                                      (SPADCALL (QCDR |rec|)
                                                                (QCDR |vv|)
                                                                (QREFELT $
                                                                         74)))
                                                     . #6#)
                                               (GO #7#))))))))))))
                            (EXIT
                             (|error|
                              "splitConstant: should not happen"))))))))))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |INTPM;goodlilog?|
        ((|k| |Kernel| F) (|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         ($ |Boolean|))
        (COND
         ((SPADCALL |k| '|log| (QREFELT $ 76))
          (EQL (SPADCALL |p| |k| (QREFELT $ 79)) 1))
         ('T NIL))) 

(SDEFUN |INTPM;gooddilog?|
        ((|k| |Kernel| F) (|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         (|q| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ |Boolean|))
        (COND
         ((SPADCALL |k| '|log| (QREFELT $ 76))
          (COND
           ((EQL (SPADCALL |p| |k| (QREFELT $ 80)) 1)
            (ZEROP (SPADCALL |q| |k| (QREFELT $ 80))))
           (#1='T NIL)))
         (#1# NIL))) 

(SDEFUN |INTPM;matcherfei|
        ((|f| F) (|x| |Symbol|) (|comp?| |Boolean|)
         ($ |Record| (|:| |which| (|Integer|)) (|:| |exponent| F)
          (|:| |coeff| F)))
        (SPROG
         ((#1=#:G809 NIL) (|d| (F)) (|sa| (F))
          (|u| (|Union| (|Integer|) "failed")) (|cc| (F)) (|da| (F)) (|a| (F))
          (|l| (|AssociationList| (|Symbol|) F))
          (|res| (|PatternMatchResult| (|Integer|) F)) (|pat| (F))
          (|res0| (|PatternMatchResult| (|Integer|) F)))
         (SEQ (LETT |res0| (SPADCALL (QREFELT $ 81)) . #2=(|INTPM;matcherfei|))
              (LETT |pat|
                    (SPADCALL (QREFELT $ 21)
                              (SPADCALL
                               (SPADCALL (QREFELT $ 16) (QREFELT $ 18))
                               (QREFELT $ 82))
                              (QREFELT $ 64))
                    . #2#)
              (EXIT
               (COND
                ((SPADCALL
                  (LETT |res|
                        (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 84)) |res0|
                                  (QREFELT $ 86))
                        . #2#)
                  (QREFELT $ 87))
                 (COND
                  (|comp?|
                   (VECTOR 0 (|spadConstant| $ 36) (|spadConstant| $ 36)))
                  (#3='T (|INTPM;matchei| |f| |x| $))))
                (#3#
                 (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #2#)
                      (LETT |da|
                            (SPADCALL
                             (LETT |a|
                                   (SPADCALL |l| (QREFELT $ 16) (QREFELT $ 88))
                                   . #2#)
                             |x| (QREFELT $ 89))
                            . #2#)
                      (LETT |d|
                            (SPADCALL
                             (SPADCALL |a|
                                       (LETT |cc|
                                             (SPADCALL |l| (QREFELT $ 15)
                                                       (QREFELT $ 88))
                                             . #2#)
                                       (QREFELT $ 64))
                             |da| (QREFELT $ 46))
                            . #2#)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |d| |x| (QREFELT $ 89))
                                   (QREFELT $ 90))
                         (VECTOR 1 |a| |d|))
                        (#3#
                         (SEQ
                          (EXIT
                           (SEQ
                            (COND
                             (|comp?|
                              (EXIT
                               (SEQ
                                (LETT |d|
                                      (SPADCALL
                                       (SPADCALL |cc|
                                                 (LETT |sa|
                                                       (|INTPM;insqrt|
                                                        (SPADCALL |a|
                                                                  (QREFELT $
                                                                           68))
                                                        $)
                                                       . #2#)
                                                 (QREFELT $ 64))
                                       |da| (QREFELT $ 46))
                                      . #2#)
                                (EXIT
                                 (COND
                                  ((SPADCALL (SPADCALL |d| |x| (QREFELT $ 89))
                                             (QREFELT $ 90))
                                   (VECTOR 2 |sa|
                                           (SPADCALL
                                            (SPADCALL |d| (QREFELT $ 43)
                                                      (QREFELT $ 64))
                                            (QREFELT $ 68))))
                                  (#3#
                                   (VECTOR 0 (|spadConstant| $ 36)
                                           (|spadConstant| $ 36))))))))
                             (#3#
                              (SEQ
                               (LETT |u| (SPADCALL |a| (QREFELT $ 92)) . #2#)
                               (EXIT
                                (COND
                                 ((QEQCAR |u| 0)
                                  (COND
                                   ((< (QCDR |u|) 0)
                                    (PROGN
                                     (LETT #1#
                                           (SEQ
                                            (LETT |d|
                                                  (SPADCALL
                                                   (SPADCALL |cc|
                                                             (LETT |sa|
                                                                   (|INTPM;insqrt|
                                                                    (SPADCALL
                                                                     |a|
                                                                     (QREFELT $
                                                                              68))
                                                                    $)
                                                                   . #2#)
                                                             (QREFELT $ 64))
                                                   |da| (QREFELT $ 46))
                                                  . #2#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL
                                                (SPADCALL |d| |x|
                                                          (QREFELT $ 89))
                                                (QREFELT $ 90))
                                               (VECTOR 2 |sa|
                                                       (SPADCALL
                                                        (SPADCALL |d|
                                                                  (QREFELT $
                                                                           43)
                                                                  (QREFELT $
                                                                           64))
                                                        (QREFELT $ 68))))
                                              (#3#
                                               (VECTOR 0 (|spadConstant| $ 36)
                                                       (|spadConstant| $
                                                                       36))))))
                                           . #2#)
                                     (GO #4=#:G805))))))))))
                            (EXIT
                             (VECTOR 0 (|spadConstant| $ 36)
                                     (|spadConstant| $ 36)))))
                          #4# (EXIT #1#)))))))))))) 

(SDEFUN |INTPM;matchei|
        ((|f| F) (|x| |Symbol|)
         ($ |Record| (|:| |which| (|Integer|)) (|:| |exponent| F)
          (|:| |coeff| F)))
        (SPROG
         ((|d| (F)) (|cc| (F)) (|da| (F)) (|a| (F))
          (|l| (|AssociationList| (|Symbol|) F))
          (|res| (|PatternMatchResult| (|Integer|) F)) (|pat| (F))
          (|res0| (|PatternMatchResult| (|Integer|) F)))
         (SEQ (LETT |res0| (SPADCALL (QREFELT $ 81)) . #1=(|INTPM;matchei|))
              (LETT |a| (SPADCALL (QREFELT $ 16) (QREFELT $ 18)) . #1#)
              (LETT |pat|
                    (SPADCALL
                     (SPADCALL (QREFELT $ 21)
                               (SPADCALL |a| (QREFELT $ 29) (QREFELT $ 93))
                               (QREFELT $ 64))
                     (SPADCALL |a| (QREFELT $ 94)) (QREFELT $ 46))
                    . #1#)
              (EXIT
               (COND
                ((SPADCALL
                  (LETT |res|
                        (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 84)) |res0|
                                  (QREFELT $ 86))
                        . #1#)
                  (QREFELT $ 87))
                 (VECTOR 0 (|spadConstant| $ 36) (|spadConstant| $ 36)))
                (#2='T
                 (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                      (LETT |da|
                            (SPADCALL
                             (LETT |a|
                                   (SPADCALL |l| (QREFELT $ 16) (QREFELT $ 88))
                                   . #1#)
                             |x| (QREFELT $ 89))
                            . #1#)
                      (LETT |d|
                            (SPADCALL
                             (LETT |cc|
                                   (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 88))
                                   . #1#)
                             |da| (QREFELT $ 46))
                            . #1#)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |d| |x| (QREFELT $ 89))
                                   (QREFELT $ 90))
                         (VECTOR 1
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 44)
                                            (SPADCALL |l| (QREFELT $ 12)
                                                      (QREFELT $ 88))
                                            (QREFELT $ 67))
                                  (SPADCALL |a| (QREFELT $ 94)) (QREFELT $ 64))
                                 |d|))
                        (#2#
                         (VECTOR 0 (|spadConstant| $ 36)
                                 (|spadConstant| $ 36)))))))))))) 

(SDEFUN |INTPM;matchdilog| ((|f| F) (|x| |Symbol|) ($ |List| F))
        (SPROG
         ((#1=#:G819 NIL) (#2=#:G820 NIL) (|l| (|List| F)) (#3=#:G821 NIL)
          (|k| NIL) (|df| (F))
          (|d| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|n| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL |f| (QREFELT $ 98)) . #4=(|INTPM;matchdilog|))
            (LETT |df|
                  (SPADCALL (LETT |d| (SPADCALL |f| (QREFELT $ 99)) . #4#)
                            (QREFELT $ 100))
                  . #4#)
            (SEQ
             (EXIT
              (SEQ (LETT |k| NIL . #4#)
                   (LETT #3#
                         (SPADCALL
                          (CONS #'|INTPM;matchdilog!0| (VECTOR $ |d| |n|))
                          (SPADCALL |n| (QREFELT $ 102)) (QREFELT $ 104))
                         . #4#)
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL
                        (NULL
                         (LETT |l| (|INTPM;matchdilog0| |f| |k| |x| |n| |df| $)
                               . #4#)))
                       (PROGN
                        (LETT #1# (PROGN (LETT #2# |l| . #4#) (GO #5=#:G818))
                              . #4#)
                        (GO #6=#:G816))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
             #6# (EXIT #1#))
            (EXIT NIL)))
          #5# (EXIT #2#)))) 

(SDEFUN |INTPM;matchdilog!0| ((|x1| NIL) ($$ NIL))
        (PROG (|n| |d| $)
          (LETT |n| (QREFELT $$ 2) . #1=(|INTPM;matchdilog|))
          (LETT |d| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTPM;gooddilog?| |x1| |n| |d| $))))) 

(SDEFUN |INTPM;matchdilog0|
        ((|f| F) (|k| |Kernel| F) (|x| |Symbol|)
         (|p| |SparseMultivariatePolynomial| R (|Kernel| F)) (|q| F)
         ($ |List| F))
        (SPROG ((|d| (F)) (|a1| (F)) (|da| (F)) (|a| (F)))
               (SEQ
                (COND
                 ((SPADCALL
                   (LETT |da|
                         (SPADCALL
                          (LETT |a|
                                (|SPADfirst| (SPADCALL |k| (QREFELT $ 106)))
                                . #1=(|INTPM;matchdilog0|))
                          |x| (QREFELT $ 89))
                         . #1#)
                   (QREFELT $ 90))
                  NIL)
                 (#2='T
                  (SEQ
                   (LETT |a1|
                         (SPADCALL (|spadConstant| $ 44) |a| (QREFELT $ 69))
                         . #1#)
                   (LETT |d|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |p| |k| (QREFELT $ 108)) 1
                                      (QREFELT $ 110))
                            (QREFELT $ 100))
                           |a1| (QREFELT $ 64))
                          (SPADCALL |q| |da| (QREFELT $ 64)) (QREFELT $ 46))
                         . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |d| |x| (QREFELT $ 89))
                                (QREFELT $ 90))
                      (LIST |a| |d|
                            (SPADCALL |f|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |d| |da| (QREFELT $ 64))
                                        (SPADCALL |k| (QREFELT $ 112))
                                        (QREFELT $ 64))
                                       |a1| (QREFELT $ 46))
                                      (QREFELT $ 69))))
                     (#2# NIL))))))))) 

(SDEFUN |INTPM;matchli| ((|f| F) (|x| |Symbol|) ($ |List| F))
        (SPROG
         ((#1=#:G831 NIL) (#2=#:G832 NIL) (|l| (|List| F)) (#3=#:G833 NIL)
          (|k| NIL) (|d| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ
          (EXIT
           (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 99)) . #4=(|INTPM;matchli|))
                (SEQ
                 (EXIT
                  (SEQ (LETT |k| NIL . #4#)
                       (LETT #3#
                             (SPADCALL
                              (CONS #'|INTPM;matchli!0| (VECTOR $ |d|))
                              (SPADCALL |d| (QREFELT $ 102)) (QREFELT $ 104))
                             . #4#)
                       G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (NULL
                             (LETT |l| (|INTPM;matchli0| |f| |k| |x| $)
                                   . #4#)))
                           (PROGN
                            (LETT #1#
                                  (PROGN (LETT #2# |l| . #4#) (GO #5=#:G830))
                                  . #4#)
                            (GO #6=#:G828))))))
                       (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                 #6# (EXIT #1#))
                (EXIT NIL)))
          #5# (EXIT #2#)))) 

(SDEFUN |INTPM;matchli!0| ((|x1| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1) . #1=(|INTPM;matchli|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTPM;goodlilog?| |x1| |d| $))))) 

(SDEFUN |INTPM;matchli0| ((|f| F) (|k| |Kernel| F) (|x| |Symbol|) ($ |List| F))
        (SPROG
         ((|d| (F)) (|p| (|SparseUnivariatePolynomial| F))
          (|u| (|Union| (|SparseUnivariatePolynomial| F) "failed"))
          (|ug| (|Fraction| (|SparseUnivariatePolynomial| F))) (|da| (F))
          (|a| (F)) (|g| (F)) (|lg| (F)))
         (SEQ
          (LETT |g|
                (SPADCALL
                 (LETT |lg| (SPADCALL |k| (QREFELT $ 112))
                       . #1=(|INTPM;matchli0|))
                 |f| (QREFELT $ 64))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL
              (LETT |da|
                    (SPADCALL
                     (LETT |a| (|SPADfirst| (SPADCALL |k| (QREFELT $ 106)))
                           . #1#)
                     |x| (QREFELT $ 89))
                    . #1#)
              (QREFELT $ 90))
             NIL)
            ((SPADCALL
              (SPADCALL (LETT |d| (SPADCALL |g| |da| (QREFELT $ 46)) . #1#) |x|
                        (QREFELT $ 89))
              (QREFELT $ 90))
             (LIST |a| |d| (|spadConstant| $ 36)))
            ('T
             (SEQ (LETT |ug| (SPADCALL |g| |k| (QREFELT $ 114)) . #1#)
                  (LETT |u| (SPADCALL |ug| (QREFELT $ 117)) . #1#)
                  (EXIT
                   (COND
                    ((OR (QEQCAR |u| 1)
                         (OR
                          (SPADCALL
                           (SPADCALL (LETT |p| (QCDR |u|) . #1#)
                                     (QREFELT $ 119))
                           1 (QREFELT $ 120))
                          (NULL
                           (SPADCALL
                            (SPADCALL
                             (LETT |d|
                                   (SPADCALL (SPADCALL |p| 0 (QREFELT $ 121))
                                             |da| (QREFELT $ 46))
                                   . #1#)
                             |x| (QREFELT $ 89))
                            (QREFELT $ 90)))))
                     NIL)
                    ('T (LIST |a| |d| (SPADCALL |p| (QREFELT $ 122))))))))))))) 

(SDEFUN |INTPM;insqrt| ((|y| F) ($ F))
        (SPROG
         ((|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F))))
         (SEQ (LETT |rec| (SPADCALL |y| 2 (QREFELT $ 130)) |INTPM;insqrt|)
              (EXIT
               (COND
                ((EQL (QVELT |rec| 0) 1)
                 (SPADCALL (QVELT |rec| 1) (QVELT |rec| 2) (QREFELT $ 64)))
                ((SPADCALL (QVELT |rec| 0) 2 (QREFELT $ 131))
                 (|error| "insqrt: should not happen"))
                ('T
                 (SPADCALL (QVELT |rec| 1)
                           (SPADCALL (QVELT |rec| 2) (QREFELT $ 42))
                           (QREFELT $ 64)))))))) 

(SDEFUN |INTPM;pmintegrate;FSU;12|
        ((|f| F) (|x| |Symbol|)
         ($
          . #1=(|Union| (|Record| (|:| |special| F) (|:| |integrand| F))
                        "failed")))
        (SPROG
         ((|cse| #2=(|Integer|))
          (|rec|
           (|Record| (|:| |which| #2#) (|:| |exponent| F) (|:| |coeff| F)))
          (|l| (|List| F)) (|u| #1#)
          (|rc| (|Record| (|:| |const| F) (|:| |nconst| F))))
         (SEQ
          (COND
           ((SPADCALL
             (QCAR
              (LETT |rc| (SPADCALL |f| |x| (QREFELT $ 63))
                    . #3=(|INTPM;pmintegrate;FSU;12|)))
             (|spadConstant| $ 44) (QREFELT $ 132))
            (SEQ (LETT |u| (SPADCALL (QCDR |rc|) |x| (QREFELT $ 135)) . #3#)
                 (EXIT
                  (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                        (#4='T
                         (SEQ (LETT |rec| (QCDR |u|) . #3#)
                              (EXIT
                               (CONS 0
                                     (CONS
                                      (SPADCALL (QCAR |rc|) (QCAR |rec|)
                                                (QREFELT $ 64))
                                      (SPADCALL (QCAR |rc|) (QCDR |rec|)
                                                (QREFELT $ 64)))))))))))
           ((NULL (NULL (LETT |l| (|INTPM;matchli| |f| |x| $) . #3#)))
            (CONS 0
                  (CONS
                   (SPADCALL (SPADCALL |l| (QREFELT $ 136))
                             (SPADCALL (|SPADfirst| |l|) (QREFELT $ 137))
                             (QREFELT $ 64))
                   (SPADCALL |l| (QREFELT $ 138)))))
           ((NULL (NULL (LETT |l| (|INTPM;matchdilog| |f| |x| $) . #3#)))
            (CONS 0
                  (CONS
                   (SPADCALL (SPADCALL |l| (QREFELT $ 136))
                             (SPADCALL (|SPADfirst| |l|) (QREFELT $ 139))
                             (QREFELT $ 64))
                   (SPADCALL |l| (QREFELT $ 138)))))
           ('T
            (SEQ
             (LETT |cse|
                   (QVELT (LETT |rec| (|INTPM;matcherfei| |f| |x| NIL $) . #3#)
                          0)
                   . #3#)
             (EXIT
              (COND
               ((EQL |cse| 1)
                (CONS 0
                      (CONS
                       (SPADCALL (QVELT |rec| 2)
                                 (SPADCALL (QVELT |rec| 1) (QREFELT $ 140))
                                 (QREFELT $ 64))
                       (|spadConstant| $ 36))))
               ((EQL |cse| 2)
                (CONS 0
                      (CONS
                       (SPADCALL (QVELT |rec| 2)
                                 (SPADCALL (QVELT |rec| 1) (QREFELT $ 141))
                                 (QREFELT $ 64))
                       (|spadConstant| $ 36))))
               (#4# (CONS 1 "failed")))))))))) 

(SDEFUN |INTPM;pmComplexintegrate;FSU;13|
        ((|f| F) (|x| |Symbol|)
         ($
          . #1=(|Union| (|Record| (|:| |special| F) (|:| |integrand| F))
                        "failed")))
        (SPROG
         ((|cse| #2=(|Integer|))
          (|rec|
           (|Record| (|:| |which| #2#) (|:| |exponent| F) (|:| |coeff| F)))
          (|u| #1#) (|rc| (|Record| (|:| |const| F) (|:| |nconst| F))))
         (SEQ
          (COND
           ((SPADCALL
             (QCAR
              (LETT |rc| (SPADCALL |f| |x| (QREFELT $ 63))
                    . #3=(|INTPM;pmComplexintegrate;FSU;13|)))
             (|spadConstant| $ 44) (QREFELT $ 132))
            (SEQ (LETT |u| (SPADCALL (QCDR |rc|) |x| (QREFELT $ 142)) . #3#)
                 (EXIT
                  (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                        (#4='T
                         (SEQ (LETT |rec| (QCDR |u|) . #3#)
                              (EXIT
                               (CONS 0
                                     (CONS
                                      (SPADCALL (QCAR |rc|) (QCAR |rec|)
                                                (QREFELT $ 64))
                                      (SPADCALL (QCAR |rc|) (QCDR |rec|)
                                                (QREFELT $ 64)))))))))))
           (#4#
            (SEQ
             (LETT |cse|
                   (QVELT (LETT |rec| (|INTPM;matcherfei| |f| |x| 'T $) . #3#)
                          0)
                   . #3#)
             (EXIT
              (COND
               ((EQL |cse| 2)
                (CONS 0
                      (CONS
                       (SPADCALL (QVELT |rec| 2)
                                 (SPADCALL (QVELT |rec| 1) (QREFELT $ 141))
                                 (QREFELT $ 64))
                       (|spadConstant| $ 36))))
               (#4# (CONS 1 "failed")))))))))) 

(SDEFUN |INTPM;formula1|
        ((|f| F) (|x| |Symbol|) (|t| F) (|cc| F) ($ |Union| F "failed"))
        (SPROG
         ((#1=#:G890 NIL) (|mmi| (|Integer|)) (|mm| (F)) (#2=#:G894 NIL)
          (|sgz| #3=(|Union| (|Integer|) "failed")) (|z| (F)) (|sgs| #3#)
          (|ms| (F)) (|mw| (F)) (|l| (|List| F)))
         (SEQ
          (COND
           ((NULL
             (LETT |l| (|INTPM;match1| |f| |x| |t| |cc| $)
                   . #4=(|INTPM;formula1|)))
            (CONS 1 "failed"))
           (#5='T
            (SEQ
             (EXIT
              (SEQ (LETT |mw| (|SPADfirst| |l|) . #4#)
                   (COND
                    ((SPADCALL (LETT |ms| (SPADCALL |l| (QREFELT $ 138)) . #4#)
                               (QREFELT $ 90))
                     (EXIT (CONS 1 #6="failed")))
                    (#5#
                     (SEQ (LETT |sgs| (SPADCALL |ms| (QREFELT $ 92)) . #4#)
                          (EXIT
                           (COND
                            ((QEQCAR |sgs| 1)
                             (PROGN
                              (LETT #2# (CONS 1 #6#) . #4#)
                              (GO #7=#:G891))))))))
                   (SEQ
                    (LETT |sgz|
                          (SPADCALL
                           (LETT |z|
                                 (SPADCALL
                                  (SPADCALL |mw| (|spadConstant| $ 44)
                                            (QREFELT $ 67))
                                  |ms| (QREFELT $ 46))
                                 . #4#)
                           (QREFELT $ 92))
                          . #4#)
                    (EXIT
                     (COND
                      ((OR (QEQCAR |sgz| 1) (< (QCDR |sgz|) 0))
                       (PROGN (LETT #2# (CONS 1 "failed") . #4#) (GO #7#))))))
                   (LETT |mmi|
                         (SPADCALL
                          (LETT |mm| (SPADCALL |l| (QREFELT $ 136)) . #4#)
                          (QREFELT $ 143))
                         . #4#)
                   (EXIT
                    (CONS 0
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (QCDR |sgs|)
                                      (SPADCALL |l| (QREFELT $ 144))
                                      (QREFELT $ 145))
                            (SPADCALL |ms| (- (- |mmi|) 1) (QREFELT $ 74))
                            (QREFELT $ 64))
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                       (QREFELT $ 146))
                             |x|
                             (PROG1 (LETT #1# |mmi| . #4#)
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#))
                             (QREFELT $ 147))
                            (LIST (SPADCALL |x| (QREFELT $ 148))) (LIST |z|)
                            (QREFELT $ 151))
                           (QREFELT $ 64))))))
             #7# (EXIT #2#))))))) 

(SDEFUN |INTPM;match1| ((|f| F) (|x| |Symbol|) (|t| F) (|cc| F) ($ |List| F))
        (SPROG
         ((|l| (|AssociationList| (|Symbol|) F))
          (|res| (|PatternMatchResult| (|Integer|) F)) (|pat| (F))
          (|res0| (|PatternMatchResult| (|Integer|) F)))
         (SEQ (LETT |res0| (SPADCALL (QREFELT $ 81)) . #1=(|INTPM;match1|))
              (LETT |pat|
                    (SPADCALL
                     (SPADCALL |cc|
                               (SPADCALL (SPADCALL |t| (QREFELT $ 94))
                                         (QREFELT $ 40) (QREFELT $ 93))
                               (QREFELT $ 64))
                     (SPADCALL
                      (SPADCALL (SPADCALL |t| (QREFELT $ 32) (QREFELT $ 93))
                                (QREFELT $ 68))
                      (QREFELT $ 82))
                     (QREFELT $ 64))
                    . #1#)
              (COND
               ((NULL
                 (SPADCALL
                  (LETT |res|
                        (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 84)) |res0|
                                  (QREFELT $ 86))
                        . #1#)
                  (QREFELT $ 87)))
                (EXIT
                 (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                      (EXIT
                       (LIST (|spadConstant| $ 36)
                             (SPADCALL |l| (QREFELT $ 13) (QREFELT $ 88))
                             (SPADCALL |l| (QREFELT $ 14) (QREFELT $ 88))
                             (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 88))))))))
              (LETT |pat|
                    (SPADCALL
                     (SPADCALL |cc|
                               (SPADCALL |t| (QREFELT $ 29) (QREFELT $ 93))
                               (QREFELT $ 64))
                     (SPADCALL
                      (SPADCALL (SPADCALL |t| (QREFELT $ 32) (QREFELT $ 93))
                                (QREFELT $ 68))
                      (QREFELT $ 82))
                     (QREFELT $ 64))
                    . #1#)
              (COND
               ((NULL
                 (SPADCALL
                  (LETT |res|
                        (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 84)) |res0|
                                  (QREFELT $ 86))
                        . #1#)
                  (QREFELT $ 87)))
                (EXIT
                 (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                      (EXIT
                       (LIST (SPADCALL |l| (QREFELT $ 12) (QREFELT $ 88))
                             (|spadConstant| $ 36)
                             (SPADCALL |l| (QREFELT $ 14) (QREFELT $ 88))
                             (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 88))))))))
              (LETT |pat|
                    (SPADCALL
                     (SPADCALL |cc|
                               (SPADCALL |t| (QREFELT $ 29) (QREFELT $ 93))
                               (QREFELT $ 46))
                     (SPADCALL
                      (SPADCALL (SPADCALL |t| (QREFELT $ 32) (QREFELT $ 93))
                                (QREFELT $ 68))
                      (QREFELT $ 82))
                     (QREFELT $ 64))
                    . #1#)
              (COND
               ((NULL
                 (SPADCALL
                  (LETT |res|
                        (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 84)) |res0|
                                  (QREFELT $ 86))
                        . #1#)
                  (QREFELT $ 87)))
                (EXIT
                 (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                      (EXIT
                       (LIST
                        (SPADCALL (SPADCALL |l| (QREFELT $ 12) (QREFELT $ 88))
                                  (QREFELT $ 68))
                        (|spadConstant| $ 36)
                        (SPADCALL |l| (QREFELT $ 14) (QREFELT $ 88))
                        (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 88))))))))
              (LETT |pat|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |cc|
                                (SPADCALL |t| (QREFELT $ 29) (QREFELT $ 93))
                                (QREFELT $ 64))
                      (SPADCALL (SPADCALL |t| (QREFELT $ 94)) (QREFELT $ 40)
                                (QREFELT $ 93))
                      (QREFELT $ 64))
                     (SPADCALL
                      (SPADCALL (SPADCALL |t| (QREFELT $ 32) (QREFELT $ 93))
                                (QREFELT $ 68))
                      (QREFELT $ 82))
                     (QREFELT $ 64))
                    . #1#)
              (COND
               ((NULL
                 (SPADCALL
                  (LETT |res|
                        (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 84)) |res0|
                                  (QREFELT $ 86))
                        . #1#)
                  (QREFELT $ 87)))
                (EXIT
                 (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                      (EXIT
                       (LIST (SPADCALL |l| (QREFELT $ 12) (QREFELT $ 88))
                             (SPADCALL |l| (QREFELT $ 13) (QREFELT $ 88))
                             (SPADCALL |l| (QREFELT $ 14) (QREFELT $ 88))
                             (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 88))))))))
              (LETT |pat|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |cc|
                                (SPADCALL |t| (QREFELT $ 29) (QREFELT $ 93))
                                (QREFELT $ 46))
                      (SPADCALL (SPADCALL |t| (QREFELT $ 94)) (QREFELT $ 40)
                                (QREFELT $ 93))
                      (QREFELT $ 64))
                     (SPADCALL
                      (SPADCALL (SPADCALL |t| (QREFELT $ 32) (QREFELT $ 93))
                                (QREFELT $ 68))
                      (QREFELT $ 82))
                     (QREFELT $ 64))
                    . #1#)
              (COND
               ((NULL
                 (SPADCALL
                  (LETT |res|
                        (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 84)) |res0|
                                  (QREFELT $ 86))
                        . #1#)
                  (QREFELT $ 87)))
                (EXIT
                 (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                      (EXIT
                       (LIST
                        (SPADCALL (SPADCALL |l| (QREFELT $ 12) (QREFELT $ 88))
                                  (QREFELT $ 68))
                        (SPADCALL |l| (QREFELT $ 13) (QREFELT $ 88))
                        (SPADCALL |l| (QREFELT $ 14) (QREFELT $ 88))
                        (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 88))))))))
              (EXIT NIL)))) 

(SDEFUN |INTPM;pmintegrate;FS2OcU;16|
        ((|f| F) (|x| |Symbol|) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) ($ |Union| F "failed"))
        (SPROG NIL
               (SEQ
                (COND
                 ((SPADCALL |a| (QREFELT $ 153))
                  (COND
                   ((EQL (SPADCALL |b| (QREFELT $ 155)) 1)
                    (EXIT
                     (|INTPM;formula1| |f| |x|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 156))
                      (SPADCALL (QREFELT $ 21)
                                (CONS #'|INTPM;pmintegrate;FS2OcU;16!0|
                                      (VECTOR $ |x|))
                                (QREFELT $ 28))
                      $))))))
                (EXIT (CONS 1 "failed"))))) 

(SDEFUN |INTPM;pmintegrate;FS2OcU;16!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTPM;pmintegrate;FS2OcU;16|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 157)))))) 

(DECLAIM (NOTINLINE |PatternMatchIntegration;|)) 

(DEFUN |PatternMatchIntegration| (&REST #1=#:G919)
  (SPROG NIL
         (PROG (#2=#:G920)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PatternMatchIntegration|)
                                               '|domainEqualList|)
                    . #3=(|PatternMatchIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PatternMatchIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PatternMatchIntegration|)))))))))) 

(DEFUN |PatternMatchIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (SEQ
          (PROGN
           (LETT DV$1 (|devaluate| |#1|) . #1=(|PatternMatchIntegration|))
           (LETT DV$2 (|devaluate| |#2|) . #1#)
           (LETT |dv$| (LIST '|PatternMatchIntegration| DV$1 DV$2) . #1#)
           (LETT $ (GETREFV 160) . #1#)
           (QSETREFV $ 0 |dv$|)
           (QSETREFV $ 3
                     (LETT |pv$|
                           (|buildPredVector| 0 0
                                              (LIST
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|ConvertibleTo|
                                                                 (|Pattern|
                                                                  (|Integer|))))
                                                (|HasCategory| |#1|
                                                               '(|PatternMatchable|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2|
                                                               '(|SpecialFunctionCategory|)))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|ConvertibleTo|
                                                                 (|Pattern|
                                                                  (|Integer|))))
                                                (|HasCategory| |#1|
                                                               '(|PatternMatchable|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2|
                                                               '(|LiouvillianFunctionCategory|)))))
                           . #1#))
           (|haddProp| |$ConstructorCache| '|PatternMatchIntegration|
                       (LIST DV$1 DV$2) (CONS 1 $))
           (|stuffDomainSlots| $)
           (QSETREFV $ 6 |#1|)
           (QSETREFV $ 7 |#2|)
           (SETF |pv$| (QREFELT $ 3))
           (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
           (QSETREFV $ 12 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
           (QSETREFV $ 13 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
           (QSETREFV $ 14 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
           (QSETREFV $ 15 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
           (QSETREFV $ 16 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
           (QSETREFV $ 17 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
           (QSETREFV $ 21
                     (SPADCALL (SPADCALL (QREFELT $ 15) (QREFELT $ 18))
                               (QREFELT $ 20)))
           (QSETREFV $ 29
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 18))
                                (QREFELT $ 20))
                      (CONS #'|PatternMatchIntegration!0| $) (QREFELT $ 28)))
           (QSETREFV $ 32
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT $ 14) (QREFELT $ 18))
                                (QREFELT $ 20))
                      (CONS #'|PatternMatchIntegration!1| $) (QREFELT $ 28)))
           (QSETREFV $ 40
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT $ 13) (QREFELT $ 18))
                                (QREFELT $ 20))
                      (CONS #'|PatternMatchIntegration!2| $) (QREFELT $ 28)))
           (QSETREFV $ 43 (SPADCALL (SPADCALL (QREFELT $ 41)) (QREFELT $ 42)))
           (QSETREFV $ 47
                     (SPADCALL (|spadConstant| $ 44)
                               (SPADCALL 2 (QREFELT $ 45)) (QREFELT $ 46)))
           (QSETREFV $ 48
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT $ 41))
                                (SPADCALL 2 (QREFELT $ 45)) (QREFELT $ 46))
                      (QREFELT $ 42)))
           (QSETREFV $ 49
                     (SPADCALL
                      (SPADCALL (SPADCALL 2 (QREFELT $ 45))
                                (SPADCALL (QREFELT $ 41)) (QREFELT $ 46))
                      (QREFELT $ 42)))
           (COND
            ((|HasCategory| |#1| '(|ConvertibleTo| (|Pattern| (|Integer|))))
             (COND
              ((|HasCategory| |#1| '(|PatternMatchable| (|Integer|)))
               (PROGN
                (COND
                 ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
                  (PROGN
                   (QSETREFV $ 123 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
                   (QSETREFV $ 124 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
                   (QSETREFV $ 125 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
                   (QSETREFV $ 126
                             (SPADCALL
                              (SPADCALL (QREFELT $ 123) (QREFELT $ 18))
                              (QREFELT $ 20)))
                   (QSETREFV $ 127
                             (SPADCALL
                              (SPADCALL (QREFELT $ 124) (QREFELT $ 18))
                              (QREFELT $ 20)))
                   (QSETREFV $ 135
                             (CONS
                              (|dispatchFunction| |INTPM;pmintegrate;FSU;12|)
                              $))
                   (QSETREFV $ 142
                             (CONS
                              (|dispatchFunction|
                               |INTPM;pmComplexintegrate;FSU;13|)
                              $)))))
                (COND
                 ((|HasCategory| |#2| '(|SpecialFunctionCategory|))
                  (PROGN
                   (QSETREFV $ 159
                             (CONS
                              (|dispatchFunction|
                               |INTPM;pmintegrate;FS2OcU;16|)
                              $))))))))))
           $)))) 

(DEFUN |PatternMatchIntegration!2| (|x1| $)
  (SPROG ((|zz| NIL))
         (SEQ (LETT |zz| (SPADCALL |x1| (QREFELT $ 34)) NIL)
              (EXIT
               (COND
                ((QEQCAR |zz| 0)
                 (SPADCALL (QCDR |zz|) (|spadConstant| $ 38)
                           (QREFELT $ 39)))))))) 

(DEFUN |PatternMatchIntegration!1| (|x1| $)
  (COND
   ((SPADCALL (SPADCALL |x1| (QREFELT $ 23)) (QREFELT $ 25))
    (SPADCALL |x1| (QREFELT $ 31))))) 

(DEFUN |PatternMatchIntegration!0| (|x1| $)
  (SPADCALL (SPADCALL |x1| (QREFELT $ 23)) (QREFELT $ 25))) 

(MAKEPROP '|PatternMatchIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) '|pm| (4 . |new|) '|pmw| '|pmm| '|pms| '|pmc| '|pma|
              '|pmb| (9 . |coerce|) (|FunctionSpaceAssertions| 6 7)
              (14 . |optional|) '|c| (|List| 8) (19 . |variables|) (|Boolean|)
              (24 . |empty?|) (|Mapping| 24 7)
              (|FunctionSpaceAttachPredicates| 6 7 7) (29 . |suchThat|) '|w|
              (|TrigonometricManipulations| 6 7) (35 . |real?|) '|s|
              (|Union| 37 '#1="failed") (40 . |retractIfCan|) (45 . |Zero|)
              (49 . |Zero|) (|Integer|) (53 . |Zero|) (57 . >=) '|m|
              (63 . |pi|) (67 . |sqrt|) '|spi| (72 . |One|) (76 . |coerce|)
              (81 . /) '|half| '|spio2| '|s2opi|
              (|Record| (|:| |key| 8) (|:| |entry| 7)) (|List| 50)
              (|PatternMatchResult| 37 7) (87 . |destruct|)
              (|AssociationList| 8 7) (92 . |construct|) (97 . |member?|)
              (103 . |One|) (|Union| 111 '#1#) (107 . |retractIfCan|)
              (|Union| 150 '#2="failed") (112 . |isTimes|)
              (|Record| (|:| |const| 7) (|:| |nconst| 7))
              |INTPM;splitConstant;FSR;2| (117 . *) (123 . |isPlus|) (128 . =)
              (134 . +) (140 . -) (145 . -)
              (|Record| (|:| |val| $) (|:| |exponent| 37)) (|Union| 70 '#2#)
              (151 . |isPower|) (156 . ~=) (162 . ^) (|Kernel| 7) (168 . |is?|)
              (|NonNegativeInteger|) (|SparseMultivariatePolynomial| 6 75)
              (174 . |minimumDegree|) (180 . |degree|) (186 . |new|)
              (190 . |exp|) (|Pattern| 37) (195 . |convert|)
              (|PatternMatchResult| 37 $) (200 . |patternMatch|)
              (207 . |failed?|) (212 . |elt|) (218 . |differentiate|)
              (224 . |zero?|) (|ElementaryFunctionSign| 6 7) (229 . |sign|)
              (234 . ^) (240 . |log|) (|Fraction| 37) (245 . |One|)
              (|SparseMultivariatePolynomial| 6 111) (249 . |numer|)
              (254 . |denom|) (259 . |coerce|) (|List| 75) (264 . |variables|)
              (|Mapping| 24 75) (269 . |select!|) (|List| 7) (275 . |argument|)
              (|SparseUnivariatePolynomial| $) (280 . |univariate|)
              (|SparseUnivariatePolynomial| 78) (286 . |coefficient|)
              (|Kernel| $) (292 . |coerce|) (|Fraction| 107)
              (297 . |univariate|) (|Union| 118 '"failed") (|Fraction| 118)
              (303 . |retractIfCan|) (|SparseUnivariatePolynomial| 7)
              (308 . |degree|) (313 . >) (319 . |coefficient|)
              (325 . |leadingCoefficient|) '|pmd| '|pme| '|pmf| '|opt_d|
              '|opt_e|
              (|Record| (|:| |exponent| 77) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 75) 75 6 78 7)
              (330 . |froot|) (336 . ~=) (342 . ~=)
              (|Record| (|:| |special| 7) (|:| |integrand| 7))
              (|Union| 133 '"failed") (348 . |pmintegrate|) (354 . |second|)
              (359 . |li|) (364 . |third|) (369 . |dilog|) (374 . |Ei|)
              (379 . |erf|) (384 . |pmComplexintegrate|) (390 . |retract|)
              (395 . |last|) (400 . *) (406 . |Gamma|) (411 . |differentiate|)
              (418 . |kernel|) (|List| 111) (|List| $) (423 . |eval|)
              (|OrderedCompletion| 7) (430 . |zero?|) (|SingleInteger|)
              (435 . |whatInfinity|) (440 . |constant|) (445 . |freeOf?|)
              (|Union| 7 '"failed") (451 . |pmintegrate|))
           '#(|splitConstant| 459 |pmintegrate| 465 |pmComplexintegrate| 479)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 159
                                                 '(0 8 0 9 1 8 0 0 11 1 7 0 8
                                                   18 1 19 7 7 20 1 7 22 0 23 1
                                                   22 24 0 25 2 27 7 7 26 28 1
                                                   30 24 7 31 1 7 33 0 34 0 6 0
                                                   35 0 7 0 36 0 37 0 38 2 37
                                                   24 0 0 39 0 7 0 41 1 7 0 0
                                                   42 0 7 0 44 1 7 0 37 45 2 7
                                                   0 0 0 46 1 52 51 0 53 1 54 0
                                                   51 55 2 22 24 8 0 56 0 6 0
                                                   57 1 7 58 0 59 1 7 60 0 61 2
                                                   7 0 0 0 64 1 7 60 0 65 2 7
                                                   24 0 0 66 2 7 0 0 0 67 1 7 0
                                                   0 68 2 7 0 0 0 69 1 7 71 0
                                                   72 2 37 24 0 0 73 2 7 0 0 37
                                                   74 2 75 24 0 8 76 2 78 77 0
                                                   75 79 2 78 77 0 75 80 0 52 0
                                                   81 1 7 0 0 82 1 7 83 0 84 3
                                                   7 85 0 83 85 86 1 52 24 0 87
                                                   2 54 7 0 8 88 2 7 0 0 8 89 1
                                                   7 24 0 90 1 91 33 7 92 2 7 0
                                                   0 0 93 1 7 0 0 94 0 95 0 96
                                                   1 7 97 0 98 1 7 97 0 99 1 7
                                                   0 97 100 1 78 101 0 102 2
                                                   101 0 103 0 104 1 75 105 0
                                                   106 2 78 107 0 75 108 2 109
                                                   78 0 77 110 1 7 0 111 112 2
                                                   7 113 0 111 114 1 116 115 0
                                                   117 1 118 77 0 119 2 77 24 0
                                                   0 120 2 118 7 0 77 121 1 118
                                                   7 0 122 2 129 128 7 77 130 2
                                                   77 24 0 0 131 2 7 24 0 0 132
                                                   2 0 134 7 8 135 1 105 7 0
                                                   136 1 7 0 0 137 1 105 7 0
                                                   138 1 7 0 0 139 1 7 0 0 140
                                                   1 7 0 0 141 2 0 134 7 8 142
                                                   1 7 37 0 143 1 105 7 0 144 2
                                                   7 0 37 0 145 1 7 0 0 146 3 7
                                                   0 0 8 77 147 1 75 0 8 148 3
                                                   7 0 0 149 150 151 1 152 24 0
                                                   153 1 152 154 0 155 1 19 7 7
                                                   156 2 7 24 0 8 157 4 0 158 7
                                                   8 152 152 159 2 0 62 7 8 63
                                                   2 2 134 7 8 135 4 1 158 7 8
                                                   152 152 159 2 2 134 7 8
                                                   142)))))
           '|lookupComplete|)) 
