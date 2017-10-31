
(SDEFUN |INTALG;F2UPR| ((|f| F) ($ |SparseUnivariatePolynomial| R))
        (SPADCALL (|INTALG;F2R| |f| $) (QREFELT $ 20))) 

(SDEFUN |INTALG;F2R| ((|f| F) ($ R))
        (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 21)) (QREFELT $ 23))
                  (QREFELT $ 24))) 

(SDEFUN |INTALG;algintexp|
        ((|f| R) (|derivation| |Mapping| UP UP) ($ |IntegrationResult| R))
        (SPROG
         ((|u|
           (|Union|
            (|List|
             (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                       (|:| |coeff| (|SparseUnivariatePolynomial| R))
                       (|:| |logand| (|SparseUnivariatePolynomial| R))))
            "failed"))
          (|p| (R)) (|h| (|Record| (|:| |answer| R) (|:| |logpart| R)))
          (|ff| (R)) (|w| (|Vector| R))
          (|r|
           (|Record| (|:| |polyPart| (|LaurentPolynomial| F UP))
                     (|:| |fracPart| (|Fraction| UP))))
          (#1=#:G794 NIL) (|i| NIL) (|vf| (|Vector| (|Fraction| UP)))
          (|vp| (|Vector| (|LaurentPolynomial| F UP)))
          (|n| (|NonNegativeInteger|)) (|v| #2=(|Vector| UP)) (|d| (UP))
          (|c| (|Record| (|:| |num| #2#) (|:| |den| UP))))
         (SEQ
          (LETT |d|
                (QCDR
                 (LETT |c| (SPADCALL |f| (QREFELT $ 26))
                       . #3=(|INTALG;algintexp|)))
                . #3#)
          (LETT |v| (QCAR |c|) . #3#)
          (LETT |vp|
                (MAKEARR1 (LETT |n| (QVSIZE |v|) . #3#) (|spadConstant| $ 28))
                . #3#)
          (LETT |vf| (MAKEARR1 |n| (|spadConstant| $ 31)) . #3#)
          (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 34)) . #3#)
               (LETT #1# (QVSIZE |v|) . #3#) G190
               (COND ((> |i| #1#) (GO G191)))
               (SEQ
                (LETT |r|
                      (SPADCALL
                       (SPADCALL (QAREF1O |v| |i| 1) |d| (QREFELT $ 35))
                       (QREFELT $ 37))
                      . #3#)
                (QSETAREF1O |vf| |i| (QCDR |r|) 1)
                (EXIT (QSETAREF1O |vp| |i| (QCAR |r|) 1)))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |ff|
                (SPADCALL |vf| (LETT |w| (SPADCALL (QREFELT $ 39)) . #3#)
                          (QREFELT $ 41))
                . #3#)
          (LETT |h| (SPADCALL |ff| |derivation| (QREFELT $ 45)) . #3#)
          (LETT |p|
                (SPADCALL (SPADCALL (ELT $ 46) |vp| (QREFELT $ 50)) |w|
                          (QREFELT $ 41))
                . #3#)
          (COND
           ((SPADCALL (QCDR |h|) (QREFELT $ 52))
            (COND
             ((SPADCALL |p| (QREFELT $ 52))
              (EXIT (SPADCALL (QCAR |h|) (QREFELT $ 54)))))))
          (LETT |u| (|INTALG;alglogint| (QCDR |h|) |derivation| $) . #3#)
          (EXIT
           (COND
            ((QEQCAR |u| 1)
             (SPADCALL (QCAR |h|) NIL
                       (LIST
                        (CONS (SPADCALL |p| (QCDR |h|) (QREFELT $ 55))
                              (QREFELT $ 12)))
                       (QREFELT $ 60)))
            ((SPADCALL |p| (QREFELT $ 52))
             (SPADCALL (QCAR |h|) (QCDR |u|) NIL (QREFELT $ 60)))
            ('T
             (|error|
              "integrate: implementation incomplete (has polynomial part)"))))))) 

(SDEFUN |INTALG;algintprim|
        ((|f| R) (|derivation| |Mapping| UP UP) ($ |IntegrationResult| R))
        (SPROG
         ((|u|
           (|Union|
            (|List|
             (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                       (|:| |coeff| (|SparseUnivariatePolynomial| R))
                       (|:| |logand| (|SparseUnivariatePolynomial| R))))
            "failed"))
          (|h| (|Record| (|:| |answer| R) (|:| |logpart| R))))
         (SEQ
          (LETT |h| (SPADCALL |f| |derivation| (QREFELT $ 45))
                . #1=(|INTALG;algintprim|))
          (EXIT
           (COND
            ((SPADCALL (QCDR |h|) (QREFELT $ 52))
             (SPADCALL (QCAR |h|) (QREFELT $ 54)))
            (#2='T
             (SEQ
              (LETT |u| (|INTALG;alglogint| (QCDR |h|) |derivation| $) . #1#)
              (EXIT
               (COND
                ((QEQCAR |u| 1)
                 (SPADCALL (QCAR |h|) NIL
                           (LIST (CONS (QCDR |h|) (QREFELT $ 12)))
                           (QREFELT $ 60)))
                (#2#
                 (SPADCALL (QCAR |h|) (QCDR |u|) NIL (QREFELT $ 60)))))))))))) 

(SDEFUN |INTALG;find_multiples|
        ((|f1| |Record| (|:| |factor| UP) (|:| |exponent| (|Integer|)))
         (|lp| |List|
          (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))))
         ($ |Record|
          (|:| |result1|
               (|List|
                (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                          (|:| |coeff| (|Fraction| (|Integer|))))))
          (|:| |result2|
               (|List|
                (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|)))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                      (|:| |coeff| (|Fraction| (|Integer|))))))
          (|rr|
           (|List| (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|)))))
          (|nfac| (|Fraction| (|Integer|))) (#1=#:G816 NIL)
          (|nfac_ok| (|Boolean|)) (|ndu| #2=(|Union| (|Integer|) #3="failed"))
          (|nnu| #2#) (|facu| (|Union| (|Fraction| (|Integer|)) "failed"))
          (|fac| (F)) (|cp| (F)) (|p| (UP)) (#4=#:G832 NIL) (|f| NIL)
          (|n| #5=(|NonNegativeInteger|)) (|rp1| (UP)) (#6=#:G831 NIL)
          (|l| #5#) (|cp1| (F)) (|k| (|NonNegativeInteger|)) (|p1| (UP)))
         (SEQ (LETT |p1| (QCAR |f1|) . #7=(|INTALG;find_multiples|))
              (LETT |res|
                    (LIST (VECTOR |p1| (QCDR |f1|) (|spadConstant| $ 62)))
                    . #7#)
              (LETT |rr| NIL . #7#)
              (LETT |k| (SPADCALL |p1| (QREFELT $ 64)) . #7#)
              (LETT |rp1| (SPADCALL |p1| (QREFELT $ 65)) . #7#)
              (SEQ
               (EXIT
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |rp1| (|spadConstant| $ 66) (QREFELT $ 67)))
                       (GO G191)))
                     (SEQ (LETT |cp1| (SPADCALL |rp1| (QREFELT $ 68)) . #7#)
                          (LETT |l| (SPADCALL |rp1| (QREFELT $ 64)) . #7#)
                          (COND
                           ((ODDP (- |k| |l|))
                            (PROGN
                             (LETT #6# |$NoValue| . #7#)
                             (GO #8=#:G811))))
                          (EXIT
                           (LETT |rp1| (SPADCALL |rp1| (QREFELT $ 65)) . #7#)))
                     NIL (GO G190) G191 (EXIT NIL)))
               #8# (EXIT #6#))
              (LETT |n| (- |k| |l|) . #7#)
              (SEQ (LETT |f| NIL . #7#) (LETT #4# |lp| . #7#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #7#) NIL))
                     (GO G191)))
                   (SEQ (LETT |rr| (CONS |f| |rr|) . #7#)
                        (LETT |p| (QCAR |f|) . #7#)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |p| (QREFELT $ 64)) |k|
                                     (QREFELT $ 69))
                           "iterate")
                          ('T
                           (SEQ
                            (LETT |cp| (SPADCALL |p| |l| (QREFELT $ 70)) . #7#)
                            (EXIT
                             (COND
                              ((SPADCALL |cp| (|spadConstant| $ 30)
                                         (QREFELT $ 71))
                               "iterate")
                              ('T
                               (SEQ
                                (LETT |fac|
                                      (SPADCALL |cp| |cp1| (QREFELT $ 72))
                                      . #7#)
                                (LETT |facu| (SPADCALL |fac| (QREFELT $ 74))
                                      . #7#)
                                (EXIT
                                 (COND ((QEQCAR |facu| 1) "iterate")
                                       ('T
                                        (SEQ (LETT |nfac| (QCDR |facu|) . #7#)
                                             (LETT |nfac_ok| 'T . #7#)
                                             (COND
                                              ((SPADCALL |n| 1 (QREFELT $ 77))
                                               (SEQ
                                                (LETT |nnu|
                                                      (SPADCALL
                                                       (SPADCALL |nfac|
                                                                 (QREFELT $
                                                                          78))
                                                       |n| (QREFELT $ 81))
                                                      . #7#)
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |nnu| 1)
                                                   (LETT |nfac_ok| NIL . #7#))
                                                  ('T
                                                   (SEQ
                                                    (LETT |ndu|
                                                          (SPADCALL
                                                           (SPADCALL |nfac|
                                                                     (QREFELT $
                                                                              82))
                                                           |n| (QREFELT $ 81))
                                                          . #7#)
                                                    (EXIT
                                                     (COND
                                                      ((QEQCAR |nnu| 1)
                                                       (LETT |nfac_ok| NIL
                                                             . #7#))
                                                      ('T
                                                       (LETT |nfac|
                                                             (SPADCALL
                                                              (QCDR |nnu|)
                                                              (PROG2
                                                                  (LETT #1#
                                                                        |ndu|
                                                                        . #7#)
                                                                  (QCDR #1#)
                                                                (|check_union2|
                                                                 (QEQCAR #1# 0)
                                                                 (|Integer|)
                                                                 (|Union|
                                                                  (|Integer|)
                                                                  #3#)
                                                                 #1#))
                                                              (QREFELT $ 83))
                                                             . #7#)))))))))))
                                             (EXIT
                                              (COND
                                               (|nfac_ok|
                                                (COND
                                                 ((SPADCALL |p1|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |nfac|
                                                                        (QREFELT
                                                                         $ 84))
                                                              (- |k|)
                                                              (QREFELT $ 85))
                                                             (SPADCALL |p|
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         |nfac|
                                                                         (QREFELT
                                                                          $
                                                                          84))
                                                                        1
                                                                        (QREFELT
                                                                         $ 86))
                                                                       (QREFELT
                                                                        $ 87))
                                                             (QREFELT $ 88))
                                                            (QREFELT $ 67))
                                                  "iterate")
                                                 ('T
                                                  (SEQ
                                                   (LETT |res|
                                                         (CONS
                                                          (VECTOR |p|
                                                                  (QCDR |f|)
                                                                  |nfac|)
                                                          |res|)
                                                         . #7#)
                                                   (EXIT
                                                    (LETT |rr| (CDR |rr|)
                                                          . #7#))))))
                                               ('T "iterate"))))))))))))))))
                   (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
              (LETT |res| (NREVERSE |res|) . #7#) (EXIT (CONS |res| |rr|))))) 

(SDEFUN |INTALG;handle_multiples1|
        ((|rec| |Record| (|:| |num| R) (|:| |den| UP) (|:| |derivden| UP)
          (|:| |gd| UP))
         (|lp| |List|
          (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                    (|:| |coeff| #1=(|Fraction| (|Integer|)))))
         (|cc| |Integer|)
         ($ |Record|
          (|:| |result1|
               (|List|
                (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                          (|:| |coeff| (|SparseUnivariatePolynomial| R))
                          (|:| |logand| (|SparseUnivariatePolynomial| R)))))
          (|:| |result2|
               (|List|
                (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                          (|:| |coeff| (|Fraction| (|Integer|)))
                          (|:| |scalar| F)
                          (|:| |divisor| (|FiniteDivisor| F UP UPUP R)))))
          (|:| |result3|
               (|List|
                (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                          (|:| |coeff| (|Fraction| (|Integer|))))))))
        (SPROG
         ((|llg|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff| (|SparseUnivariatePolynomial| R))
                      (|:| |logand| (|SparseUnivariatePolynomial| R)))))
          (|nlog|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff| (|SparseUnivariatePolynomial| R))
                      (|:| |logand| (|SparseUnivariatePolynomial| R)))))
          (|nlp|
           (|List|
            #2=(|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                         (|:| |coeff| (|Fraction| (|Integer|)))
                         (|:| |scalar| F)
                         (|:| |divisor| (|FiniteDivisor| F UP UPUP R)))))
          (|pc2| #2#)
          (|rc|
           (|Union|
            (|Record| (|:| |order| (|NonNegativeInteger|)) (|:| |function| R))
            "failed"))
          (|di| (|FiniteDivisor| F UP UPUP R))
          (|di2| #3=(|FiniteDivisor| F UP UPUP R)) (|di1| #3#) (|na| (F))
          (|nfac| #1#) (#4=#:G859 NIL) (|peq| NIL) (|alpha| (F)) (|p| (UP))
          (|pc1|
           (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                     (|:| |coeff| (|Fraction| (|Integer|))))))
         (SEQ (LETT |nlp| NIL . #5=(|INTALG;handle_multiples1|))
              (LETT |llg| NIL . #5#) (LETT |pc1| (|SPADfirst| |lp|) . #5#)
              (LETT |p| (QVELT |pc1| 0) . #5#)
              (LETT |alpha| (SPADCALL (|INTALG;UP2SUP| |p| $) (QREFELT $ 90))
                    . #5#)
              (SEQ (LETT |peq| NIL . #5#) (LETT #4# |lp| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |peq| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |nfac| (QVELT |peq| 2) . #5#)
                        (LETT |na|
                              (SPADCALL (SPADCALL |nfac| (QREFELT $ 84))
                                        |alpha| (QREFELT $ 91))
                              . #5#)
                        (LETT |di1|
                              (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1)
                                        (QVELT |rec| 2) (QVELT |rec| 3) |na|
                                        (QREFELT $ 93))
                              . #5#)
                        (LETT |di2|
                              (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1)
                                        (QVELT |rec| 2) (QVELT |rec| 3)
                                        (SPADCALL |na| (QREFELT $ 94))
                                        (QREFELT $ 93))
                              . #5#)
                        (LETT |di| (SPADCALL |di1| |di2| (QREFELT $ 95)) . #5#)
                        (LETT |rc| (SPADCALL |di| (QREFELT $ 99)) . #5#)
                        (EXIT
                         (COND
                          ((QEQCAR |rc| 1)
                           (SEQ
                            (LETT |pc2|
                                  (VECTOR (QVELT |peq| 0) (QVELT |peq| 1)
                                          (QVELT |peq| 2)
                                          (SPADCALL |na|
                                                    (SPADCALL |cc|
                                                              (QREFELT $ 100))
                                                    (QREFELT $ 72))
                                          |di|)
                                  . #5#)
                            (EXIT (LETT |nlp| (CONS |pc2| |nlp|) . #5#))))
                          ('T
                           (SEQ
                            (LETT |nlog|
                                  (|INTALG;mkLog| |p|
                                   (SPADCALL
                                    (SPADCALL |cc|
                                              (SPADCALL (QCAR (QCDR |rc|))
                                                        (QREFELT $ 101))
                                              (QREFELT $ 102))
                                    (QREFELT $ 103))
                                   (QCDR (QCDR |rc|)) |na| $)
                                  . #5#)
                            (EXIT
                             (LETT |llg|
                                   (SPADCALL |nlog| |llg| (QREFELT $ 104))
                                   . #5#)))))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |llg| |nlp| NIL))))) 

(SDEFUN |INTALG;handle_multiples|
        ((|rec| |Record| (|:| |num| R) (|:| |den| UP) (|:| |derivden| UP)
          (|:| |gd| UP))
         (|lp| |List|
          #1=(|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                       (|:| |coeff| #2=(|Fraction| (|Integer|)))))
         ($ |Record|
          (|:| |result1|
               (|List|
                (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                          (|:| |coeff| (|SparseUnivariatePolynomial| R))
                          (|:| |logand| (|SparseUnivariatePolynomial| R)))))
          (|:| |result2|
               (|List|
                (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                          (|:| |coeff| (|Fraction| (|Integer|)))
                          (|:| |scalar| F)
                          (|:| |divisor| (|FiniteDivisor| F UP UPUP R)))))
          (|:| |result3|
               (|List|
                (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                          (|:| |coeff| (|Fraction| (|Integer|))))))))
        (SPROG
         ((#3=#:G879 NIL)
          (|ff|
           (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                     (|:| |coeff| (|Fraction| (|Integer|)))))
          (|fu|
           (|Union|
            (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                      (|:| |coeff| (|Fraction| (|Integer|))))
            "failed"))
          (|nfac| #2#) (#4=#:G882 NIL) (|peq| NIL) (|lp1| (|List| #1#))
          (#5=#:G881 NIL) (#6=#:G880 NIL)
          (|llg|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff| (|SparseUnivariatePolynomial| R))
                      (|:| |logand| (|SparseUnivariatePolynomial| R)))))
          (|nlp|
           (|List|
            (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                      (|:| |coeff| (|Fraction| (|Integer|))) (|:| |scalar| F)
                      (|:| |divisor| (|FiniteDivisor| F UP UPUP R)))))
          (|p| (UP))
          (|pc1|
           (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                     (|:| |coeff| (|Fraction| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |pc1| (|SPADfirst| |lp|) . #7=(|INTALG;handle_multiples|))
            (LETT |p| (QVELT |pc1| 0) . #7#) (LETT |nlp| NIL . #7#)
            (LETT |llg| NIL . #7#)
            (EXIT
             (COND
              ((SPADCALL |p|
                         (SPADCALL |p|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 76)
                                              (QREFELT $ 94))
                                    1 (QREFELT $ 86))
                                   (QREFELT $ 87))
                         (QREFELT $ 105))
               (|INTALG;handle_multiples1| |rec| |lp| 2 $))
              (#8='T
               (SEQ
                (LETT |lp1|
                      (PROGN
                       (LETT #6# NIL . #7#)
                       (SEQ (LETT |peq| NIL . #7#) (LETT #5# |lp| . #7#) G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |peq| (CAR #5#) . #7#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL (QVELT |peq| 2)
                                          (|spadConstant| $ 106)
                                          (QREFELT $ 107))
                                (LETT #6# (CONS |peq| #6#) . #7#)))))
                            (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                            (EXIT (NREVERSE #6#))))
                      . #7#)
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |lp|)
                             (SPADCALL 2 (LENGTH |lp1|) (QREFELT $ 109))
                             (QREFELT $ 69))
                   (VECTOR NIL NIL |lp|))
                  (#8#
                   (SEQ
                    (SEQ (LETT |peq| NIL . #7#) (LETT #4# |lp1| . #7#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |peq| (CAR #4#) . #7#) NIL))
                           (GO G191)))
                         (SEQ (LETT |nfac| (QVELT |peq| 2) . #7#)
                              (LETT |fu|
                                    (SPADCALL
                                     (CONS #'|INTALG;handle_multiples!0|
                                           (VECTOR $ |nfac|))
                                     |lp| (QREFELT $ 116))
                                    . #7#)
                              (EXIT
                               (COND
                                ((QEQCAR |fu| 1)
                                 (PROGN
                                  (LETT #3# (VECTOR NIL NIL |lp|) . #7#)
                                  (GO #9=#:G878)))
                                ('T
                                 (SEQ (LETT |ff| (QCDR |fu|) . #7#)
                                      (EXIT
                                       (COND
                                        ((SPADCALL (QVELT |ff| 1)
                                                   (QVELT |peq| 1)
                                                   (QREFELT $ 117))
                                         (PROGN
                                          (LETT #3# (VECTOR NIL NIL |lp|)
                                                . #7#)
                                          (GO #9#))))))))))
                         (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (|INTALG;handle_multiples1| |rec| |lp1| 1 $))))))))))))
          #9# (EXIT #3#)))) 

(SDEFUN |INTALG;handle_multiples!0| ((|x| NIL) ($$ NIL))
        (PROG (|nfac| $)
          (LETT |nfac| (QREFELT $$ 1) . #1=(|INTALG;handle_multiples|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (QVELT |x| 2) (SPADCALL |nfac| (QREFELT $ 110))
                      (QREFELT $ 111)))))) 

(SDEFUN |INTALG;get_coeffs0| ((|lp| |List| UP) ($ |List| F))
        (SPROG ((|res| (|List| F)) (#1=#:G886 NIL) (|p| NIL))
               (SEQ (LETT |res| NIL . #2=(|INTALG;get_coeffs0|))
                    (SEQ (LETT |p| NIL . #2#) (LETT #1# |lp| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL (SPADCALL |p| (QREFELT $ 119)) |res|
                                           (QREFELT $ 120))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |INTALG;get_coeffs1| ((|pp| UPUP) ($ |List| UP))
        (SPROG
         ((|dlp| #1=(|List| UP)) (|nlp| #1#) (|lp| (|List| (|Fraction| UP))))
         (SEQ
          (LETT |lp| (SPADCALL |pp| (QREFELT $ 122))
                . #2=(|INTALG;get_coeffs1|))
          (LETT |nlp| (SPADCALL (ELT $ 123) |lp| (QREFELT $ 127)) . #2#)
          (LETT |dlp| (SPADCALL (ELT $ 128) |lp| (QREFELT $ 127)) . #2#)
          (EXIT (SPADCALL |nlp| |dlp| (QREFELT $ 129)))))) 

(SDEFUN |INTALG;get_coeffs|
        ((|rec| |Record| (|:| |num| R) (|:| |den| UP) (|:| |derivden| UP)
          (|:| |gd| UP))
         ($ |List| F))
        (SPROG ((|dlp| #1=(|List| UP)) (|nlp| #1#) (|clp| (|List| UP)))
               (SEQ
                (LETT |clp|
                      (LIST (QVELT |rec| 1) (QVELT |rec| 2) (QVELT |rec| 3))
                      . #2=(|INTALG;get_coeffs|))
                (LETT |nlp|
                      (|INTALG;get_coeffs1|
                       (SPADCALL (QVELT |rec| 0) (QREFELT $ 130)) $)
                      . #2#)
                (LETT |dlp| (|INTALG;get_coeffs1| (SPADCALL (QREFELT $ 131)) $)
                      . #2#)
                (EXIT
                 (|INTALG;get_coeffs0|
                  (SPADCALL |clp| (SPADCALL |nlp| |dlp| (QREFELT $ 129))
                            (QREFELT $ 129))
                  $))))) 

(SDEFUN |INTALG;classify_divisors|
        ((|rec| |Record| (|:| |num| R) (|:| |den| UP) (|:| |derivden| UP)
          (|:| |gd| UP))
         (|r| UP)
         ($ |Record|
          (|:| |result1|
               (|List|
                (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                          (|:| |coeff| (|SparseUnivariatePolynomial| R))
                          (|:| |logand| (|SparseUnivariatePolynomial| R)))))
          (|:| |result2|
               (|List|
                (|List|
                 (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                           (|:| |coeff| (|Fraction| (|Integer|)))
                           (|:| |scalar| F)
                           (|:| |divisor| (|FiniteDivisor| F UP UPUP R))))))
          (|:| |result3|
               (|List|
                (|List|
                 (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                           (|:| |coeff| (|Fraction| (|Integer|)))))))))
        (SPROG
         ((|nlm2|
           (|List|
            (|List|
             (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                       (|:| |coeff| (|Fraction| (|Integer|)))))))
          (|nlp2|
           (|List|
            (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                      (|:| |coeff| (|Fraction| (|Integer|))))))
          (|nlm1|
           (|List|
            (|List|
             (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                       (|:| |coeff| (|Fraction| (|Integer|))) (|:| |scalar| F)
                       (|:| |divisor| (|FiniteDivisor| F UP UPUP R))))))
          (|nlp1|
           (|List|
            (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                      (|:| |coeff| (|Fraction| (|Integer|))) (|:| |scalar| F)
                      (|:| |divisor| (|FiniteDivisor| F UP UPUP R)))))
          (|llg|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff| (|SparseUnivariatePolynomial| R))
                      (|:| |logand| (|SparseUnivariatePolynomial| R)))))
          (|rr2|
           (|Record|
            (|:| |result1|
                 (|List|
                  (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                            (|:| |coeff| (|SparseUnivariatePolynomial| R))
                            (|:| |logand| (|SparseUnivariatePolynomial| R)))))
            (|:| |result2|
                 (|List|
                  (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                            (|:| |coeff| (|Fraction| (|Integer|)))
                            (|:| |scalar| F)
                            (|:| |divisor| (|FiniteDivisor| F UP UPUP R)))))
            (|:| |result3|
                 (|List|
                  (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                            (|:| |coeff| (|Fraction| (|Integer|))))))))
          (#1=#:G918 NIL) (|lp| NIL)
          (|lm|
           (|List|
            (|List|
             (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                       (|:| |coeff| (|Fraction| (|Integer|)))))))
          (|lf|
           (|List| (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|)))))
          (|rp|
           (|Record|
            (|:| |result1|
                 (|List|
                  (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                            (|:| |coeff| (|Fraction| (|Integer|))))))
            (|:| |result2|
                 (|List|
                  (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|)))))))
          (|u| (|Factored| UP))
          (|u0| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|cl| (|List| F)))
         (SEQ
          (LETT |cl| (|INTALG;get_coeffs| |rec| $)
                . #2=(|INTALG;classify_divisors|))
          (LETT |u0|
                (SPADCALL
                 (SPADCALL (SPADCALL |r| (QREFELT $ 132)) (QREFELT $ 134)) |cl|
                 (QREFELT $ 137))
                . #2#)
          (LETT |u|
                (SPADCALL (CONS (|function| |INTALG;SUP2UP|) $) |u0|
                          (QREFELT $ 141))
                . #2#)
          (LETT |lf| (SPADCALL |u| (QREFELT $ 144)) . #2#)
          (LETT |lm| NIL . #2#)
          (SEQ G190 (COND ((NULL (NULL (NULL |lf|))) (GO G191)))
               (SEQ
                (LETT |rp|
                      (|INTALG;find_multiples| (|SPADfirst| |lf|) (CDR |lf|) $)
                      . #2#)
                (LETT |lf| (QCDR |rp|) . #2#)
                (EXIT (LETT |lm| (CONS (QCAR |rp|) |lm|) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |llg| NIL . #2#) (LETT |nlm1| NIL . #2#)
          (LETT |nlm2| NIL . #2#)
          (SEQ (LETT |lp| NIL . #2#) (LETT #1# |lm| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |lp| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |rr2| (|INTALG;handle_multiples| |rec| |lp| $) . #2#)
                    (LETT |llg|
                          (SPADCALL (QVELT |rr2| 0) |llg| (QREFELT $ 104))
                          . #2#)
                    (COND
                     ((NULL (NULL (LETT |nlp1| (QVELT |rr2| 1) . #2#)))
                      (LETT |nlm1| (CONS |nlp1| |nlm1|) . #2#)))
                    (EXIT
                     (COND
                      ((NULL (NULL (LETT |nlp2| (QVELT |rr2| 2) . #2#)))
                       (LETT |nlm2| (CONS |nlp2| |nlm2|) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |llg| |nlm1| |nlm2|))))) 

(SDEFUN |INTALG;get_lf|
        ((|ll1| |List|
          (|List|
           (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                     (|:| |coeff| (|Fraction| (|Integer|))) (|:| |scalar| F)
                     (|:| |divisor| (|FiniteDivisor| F UP UPUP R)))))
         (|ll2| |List|
          (|List|
           (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                     (|:| |coeff| (|Fraction| (|Integer|))))))
         ($ |List| UP))
        (SPROG
         ((#1=#:G933 NIL) (|peq| NIL) (#2=#:G932 NIL) (#3=#:G931 NIL)
          (#4=#:G930 NIL))
         (SEQ (COND ((NULL |ll1|) (COND ((NULL |ll2|) (EXIT NIL)))))
              (EXIT
               (COND
                ((SPADCALL (+ (LENGTH |ll1|) (LENGTH |ll2|)) 1 (QREFELT $ 145))
                 (|error|
                  "integrate: implementation incomplete (irrational residues)"))
                ((NULL |ll1|)
                 (PROGN
                  (LETT #4# NIL . #5=(|INTALG;get_lf|))
                  (SEQ (LETT |peq| NIL . #5#)
                       (LETT #3# (|SPADfirst| |ll2|) . #5#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |peq| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #4# (CONS (QVELT |peq| 0) #4#) . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #4#)))))
                ('T
                 (PROGN
                  (LETT #2# NIL . #5#)
                  (SEQ (LETT |peq| NIL . #5#)
                       (LETT #1# (|SPADfirst| |ll1|) . #5#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |peq| (CAR #1#) . #5#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS (QVELT |peq| 0) #2#) . #5#)))
                       (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |INTALG;get_la|
        ((|ll1| |List|
          (|List|
           (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                     (|:| |coeff| (|Fraction| (|Integer|))) (|:| |scalar| F)
                     (|:| |divisor| (|FiniteDivisor| F UP UPUP R)))))
         (|ll2| |List|
          (|List|
           (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                     (|:| |coeff| (|Fraction| (|Integer|))))))
         ($ |List| F))
        (SPROG ((#1=#:G939 NIL) (|lfac| NIL) (#2=#:G938 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|INTALG;get_la|))
                 (SEQ (LETT |lfac| NIL . #3#)
                      (LETT #1# (|INTALG;get_lf| |ll1| |ll2| $) . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |lfac| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |lfac| 0 (QREFELT $ 70))
                                         (QREFELT $ 94))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |INTALG;get_ld|
        ((|rec| |Record| (|:| |num| R) (|:| |den| UP) (|:| |derivden| UP)
          (|:| |gd| UP))
         (|ll1| |List|
          (|List|
           (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                     (|:| |coeff| (|Fraction| (|Integer|))) (|:| |scalar| F)
                     (|:| |divisor| (|FiniteDivisor| F UP UPUP R)))))
         (|ll2| |List|
          (|List|
           (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                     (|:| |coeff| (|Fraction| (|Integer|))))))
         ($ |List| (|FiniteDivisor| F UP UPUP R)))
        (SPROG
         ((#1=#:G955 NIL) (|peq| NIL) (#2=#:G954 NIL) (#3=#:G953 NIL) (|a| NIL)
          (#4=#:G952 NIL))
         (SEQ (COND ((NULL |ll1|) (COND ((NULL |ll2|) (EXIT NIL)))))
              (EXIT
               (COND
                ((SPADCALL (+ (LENGTH |ll1|) (LENGTH |ll2|)) 1 (QREFELT $ 145))
                 (|error|
                  "integrate: implementation incomplete (irrational residues)"))
                ((NULL |ll1|)
                 (PROGN
                  (LETT #4# NIL . #5=(|INTALG;get_ld|))
                  (SEQ (LETT |a| NIL . #5#)
                       (LETT #3# (|INTALG;get_la| |ll1| |ll2| $) . #5#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4#
                               (CONS
                                (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1)
                                          (QVELT |rec| 2) (QVELT |rec| 3) |a|
                                          (QREFELT $ 93))
                                #4#)
                               . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #4#)))))
                ('T
                 (PROGN
                  (LETT #2# NIL . #5#)
                  (SEQ (LETT |peq| NIL . #5#)
                       (LETT #1# (|SPADfirst| |ll1|) . #5#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |peq| (CAR #1#) . #5#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS (QVELT |peq| 4) #2#) . #5#)))
                       (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |INTALG;palglogint|
        ((|f| R) (|derivation| |Mapping| UP UP)
         ($ |Union|
          (|List|
           (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                     (|:| |coeff| (|SparseUnivariatePolynomial| R))
                     (|:| |logand| (|SparseUnivariatePolynomial| R))))
          "failed"))
        (SPROG
         ((|tr1u|
           (|Union|
            (|List|
             (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                       (|:| |coeff| (|SparseUnivariatePolynomial| R))
                       (|:| |logand| (|SparseUnivariatePolynomial| R))))
            "failed"))
          (|v1| (|FiniteDivisor| F UP UPUP R)) (|alpha| (F))
          (|ld| (|List| (|FiniteDivisor| F UP UPUP R))) (|la| (|List| F))
          (|bb| (F)) (#1=#:G1028 NIL) (|fcf| (UP))
          (|lins2|
           (|List|
            #2=(|List|
                (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                          (|:| |coeff| (|Fraction| (|Integer|)))))))
          (|fc2|
           (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                     (|:| |coeff| (|Fraction| (|Integer|)))))
          (|nfl2|
           (|List|
            (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                      (|:| |coeff| (|Fraction| (|Integer|))))))
          (#3=#:G1005 NIL)
          (|lins1|
           (|List|
            #4=(|List|
                (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                          (|:| |coeff| (|Fraction| (|Integer|)))
                          (|:| |scalar| F)
                          (|:| |divisor| (|FiniteDivisor| F UP UPUP R))))))
          (|fc1|
           (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                     (|:| |coeff| (|Fraction| (|Integer|))) (|:| |scalar| F)
                     (|:| |divisor| (|FiniteDivisor| F UP UPUP R))))
          (|nfl1|
           (|List|
            (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                      (|:| |coeff| (|Fraction| (|Integer|))) (|:| |scalar| F)
                      (|:| |divisor| (|FiniteDivisor| F UP UPUP R)))))
          (#5=#:G1041 NIL) (|nfl| NIL) (#6=#:G1040 NIL) (#7=#:G1039 NIL)
          (#8=#:G1038 NIL)
          (|nlins2|
           (|List|
            (|List|
             (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                       (|:| |coeff| (|Fraction| (|Integer|)))))))
          (|root_fails| (|Integer|))
          (|pp|
           (|Union|
            (|List|
             (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                       (|:| |coeff| (|SparseUnivariatePolynomial| R))
                       (|:| |logand| (|SparseUnivariatePolynomial| R))))
            "failed"))
          (#9=#:G1037 NIL) (|nlins1| (|List| #4#)) (#10=#:G1036 NIL)
          (#11=#:G1035 NIL) (|nfacs2| (|List| #2#)) (|nfacs1| (|List| #4#))
          (|ppr|
           (|Record|
            (|:| |result1|
                 (|List|
                  (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                            (|:| |coeff| (|SparseUnivariatePolynomial| R))
                            (|:| |logand| (|SparseUnivariatePolynomial| R)))))
            (|:| |result2|
                 (|List|
                  (|List|
                   (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                             (|:| |coeff| (|Fraction| (|Integer|)))
                             (|:| |scalar| F)
                             (|:| |divisor| (|FiniteDivisor| F UP UPUP R))))))
            (|:| |result3|
                 (|List|
                  (|List|
                   (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))
                             (|:| |coeff| (|Fraction| (|Integer|)))))))))
          (|r| (UP))
          (|rec|
           (|Record| (|:| |num| R) (|:| |den| UP) (|:| |derivden| UP)
                     (|:| |gd| UP))))
         (SEQ
          (LETT |rec| (SPADCALL |f| |derivation| (QREFELT $ 147))
                . #12=(|INTALG;palglogint|))
          (EXIT
           (COND
            ((SPADCALL
              (LETT |r| (SPADCALL |f| |derivation| (QREFELT $ 149)) . #12#)
              (QREFELT $ 150))
             (CONS 1 "failed"))
            (#13='T
             (SEQ (LETT |ppr| (|INTALG;classify_divisors| |rec| |r| $) . #12#)
                  (LETT |nfacs1| (QVELT |ppr| 1) . #12#)
                  (LETT |nfacs2| (QVELT |ppr| 2) . #12#)
                  (COND
                   ((NULL |nfacs1|)
                    (COND ((NULL |nfacs2|) (EXIT (CONS 0 (QVELT |ppr| 0)))))))
                  (LETT |nlins1|
                        (PROGN
                         (LETT #11# NIL . #12#)
                         (SEQ (LETT |nfl| NIL . #12#)
                              (LETT #10# |nfacs1| . #12#) G190
                              (COND
                               ((OR (ATOM #10#)
                                    (PROGN (LETT |nfl| (CAR #10#) . #12#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL (QVELT (|SPADfirst| |nfl|) 0)
                                             (QREFELT $ 64))
                                   1 (QREFELT $ 145))
                                  (LETT #11# (CONS |nfl| #11#) . #12#)))))
                              (LETT #10# (CDR #10#) . #12#) (GO G190) G191
                              (EXIT (NREVERSE #11#))))
                        . #12#)
                  (LETT |nlins2| NIL . #12#) (LETT |root_fails| 0 . #12#)
                  (SEQ (LETT |nfl| NIL . #12#) (LETT #9# |nfacs2| . #12#) G190
                       (COND
                        ((OR (ATOM #9#)
                             (PROGN (LETT |nfl| (CAR #9#) . #12#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL (QVELT (|SPADfirst| |nfl|) 0)
                                      (QREFELT $ 64))
                            1 (QREFELT $ 145))
                           (SEQ
                            (LETT |fcf| (QVELT (|SPADfirst| |nfl|) 0) . #12#)
                            (COND
                             ((EQL (SPADCALL |fcf| (QREFELT $ 64)) 3)
                              (COND
                               ((EQL
                                 (SPADCALL (SPADCALL |fcf| (QREFELT $ 65))
                                           (QREFELT $ 64))
                                 0)
                                (EXIT
                                 (SEQ
                                  (LETT |pp| (|INTALG;do_root| |fcf| |rec| $)
                                        . #12#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |pp| 1)
                                     (SEQ
                                      (LETT |nlins2| (CONS |nfl| |nlins2|)
                                            . #12#)
                                      (EXIT
                                       (LETT |root_fails| (+ |root_fails| 1)
                                             . #12#))))
                                    ('T
                                     (QSETVELT |ppr| 0
                                               (SPADCALL (QCDR |pp|)
                                                         (QVELT |ppr| 0)
                                                         (QREFELT $
                                                                  104))))))))))))
                            (EXIT
                             (LETT |nlins2| (CONS |nfl| |nlins2|) . #12#)))))))
                       (LETT #9# (CDR #9#) . #12#) (GO G190) G191 (EXIT NIL))
                  (LETT |nlins2| (NREVERSE |nlins2|) . #12#)
                  (COND
                   ((EQL |root_fails| 1)
                    (COND
                     ((EQL (LENGTH |nlins2|) 1)
                      (COND
                       ((EQL (LENGTH |nlins1|) 0)
                        (EXIT (CONS 1 "failed"))))))))
                  (EXIT
                   (COND
                    ((SPADCALL (+ (LENGTH |nlins1|) (LENGTH |nlins2|)) 1
                               (QREFELT $ 145))
                     (|error|
                      #14="integrate: implementation incomplete (residue poly has multiple non-linear factors)"))
                    (#13#
                     (SEQ
                      (LETT |lins1|
                            (PROGN
                             (LETT #8# NIL . #12#)
                             (SEQ (LETT |nfl| NIL . #12#)
                                  (LETT #7# |nfacs1| . #12#) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN
                                         (LETT |nfl| (CAR #7#) . #12#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL
                                       (SPADCALL (QVELT (|SPADfirst| |nfl|) 0)
                                                 (QREFELT $ 64))
                                       1)
                                      (LETT #8# (CONS |nfl| #8#) . #12#)))))
                                  (LETT #7# (CDR #7#) . #12#) (GO G190) G191
                                  (EXIT (NREVERSE #8#))))
                            . #12#)
                      (LETT |lins2|
                            (PROGN
                             (LETT #6# NIL . #12#)
                             (SEQ (LETT |nfl| NIL . #12#)
                                  (LETT #5# |nfacs2| . #12#) G190
                                  (COND
                                   ((OR (ATOM #5#)
                                        (PROGN
                                         (LETT |nfl| (CAR #5#) . #12#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL
                                       (SPADCALL (QVELT (|SPADfirst| |nfl|) 0)
                                                 (QREFELT $ 64))
                                       1)
                                      (LETT #6# (CONS |nfl| #6#) . #12#)))))
                                  (LETT #5# (CDR #5#) . #12#) (GO G190) G191
                                  (EXIT (NREVERSE #6#))))
                            . #12#)
                      (COND
                       ((NULL |nlins2|)
                        (COND
                         ((NULL |lins2|)
                          (COND
                           ((NULL |nfacs1|)
                            (EXIT (CONS 0 (QVELT |ppr| 0)))))))))
                      (COND
                       ((NULL |nfacs2|)
                        (COND
                         ((NULL |nlins1|)
                          (COND
                           ((EQL (LENGTH |lins1|) 1)
                            (EXIT (CONS 1 "failed"))))))))
                      (COND
                       ((SPADCALL (LENGTH |nfacs1|) 0 (QREFELT $ 145))
                        (COND
                         ((EQL (LENGTH |nlins2|) 0)
                          (EXIT
                           (SEQ
                            (COND
                             ((EQL (LENGTH |nlins1|) 1)
                              (SEQ (LETT |nfl1| (|SPADfirst| |nlins1|) . #12#)
                                   (COND
                                    ((NULL (NULL (CDR |nfl1|)))
                                     (EXIT (|error| #14#))))
                                   (LETT |fc1| (|SPADfirst| |nfl1|) . #12#)
                                   (EXIT (LETT |fcf| (QVELT |fc1| 0) . #12#))))
                             ((SPADCALL (LENGTH |lins1|) 1 (QREFELT $ 145))
                              (|error|
                               #15="integrate: implementation incomplete (irrational residues)"))
                             (#13#
                              (SEQ (LETT |nfl1| (|SPADfirst| |lins1|) . #12#)
                                   (EXIT
                                    (COND ((NULL (CDR |nfl1|)) (|error| #15#))
                                          (#13#
                                           (SEQ
                                            (LETT |fc1| (|SPADfirst| |nfl1|)
                                                  . #12#)
                                            (LETT |fcf| (QVELT |fc1| 0) . #12#)
                                            (EXIT
                                             (LETT |lins1| (LIST (CDR |nfl1|))
                                                   . #12#)))))))))
                            (EXIT
                             (COND
                              ((SPADCALL
                                (LETT |bb|
                                      (SPADCALL |fcf|
                                                (PROG1
                                                    (LETT #3#
                                                          (-
                                                           (SPADCALL |fcf|
                                                                     (QREFELT $
                                                                              64))
                                                           1)
                                                          . #12#)
                                                  (|check_subtype2| (>= #3# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #3#))
                                                (QREFELT $ 70))
                                      . #12#)
                                (QREFELT $ 151))
                               (COND
                                ((SPADCALL |fcf|
                                           (SPADCALL |fcf|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (|spadConstant| $ 76)
                                                       (QREFELT $ 94))
                                                      1 (QREFELT $ 86))
                                                     (QREFELT $ 87))
                                           (QREFELT $ 105))
                                 (COND
                                  ((EQL (SPADCALL |fcf| (QREFELT $ 64)) 2)
                                   (CONS 1 "failed"))
                                  (#13#
                                   (SEQ
                                    (COND
                                     ((NULL |nfacs2|)
                                      (COND
                                       ((EQL (LENGTH |nfacs1|) 1)
                                        (COND
                                         ((EQL (SPADCALL |fcf| (QREFELT $ 64))
                                               4)
                                          (EXIT (CONS 1 "failed"))))))))
                                    (EXIT
                                     (|error|
                                      #16="Not integrable (provided residues have no relations)"))))))
                                (#13# (|error| #16#))))
                              (#13#
                               (SEQ
                                (LETT |la| (|INTALG;get_la| |lins1| |lins2| $)
                                      . #12#)
                                (LETT |ld|
                                      (|INTALG;get_ld| |rec| |lins1| |lins2| $)
                                      . #12#)
                                (LETT |tr1u|
                                      (|INTALG;trace1| |fcf| |la| |ld|
                                       (QVELT |fc1| 4) (QVELT |fc1| 3) |bb| $)
                                      . #12#)
                                (EXIT
                                 (COND ((QEQCAR |tr1u| 1) (CONS 1 "failed"))
                                       (#13#
                                        (CONS 0
                                              (SPADCALL (QVELT |ppr| 0)
                                                        (QCDR |tr1u|)
                                                        (QREFELT $
                                                                 104))))))))))))))))
                      (EXIT
                       (COND
                        ((SPADCALL (+ (LENGTH |lins1|) (LENGTH |lins2|)) 1
                                   (QREFELT $ 77))
                         (|error| #15#))
                        (#13#
                         (SEQ
                          (COND
                           ((EQL (LENGTH |nlins2|) 1)
                            (SEQ (LETT |nfl2| (|SPADfirst| |nlins2|) . #12#)
                                 (COND
                                  ((NULL (NULL (CDR |nfl2|)))
                                   (EXIT (|error| #14#))))
                                 (EXIT
                                  (LETT |fc2| (|SPADfirst| |nfl2|) . #12#))))
                           ((SPADCALL (LENGTH |lins2|) 1 (QREFELT $ 77))
                            (|error| #15#))
                           (#13#
                            (SEQ (LETT |nfl2| (|SPADfirst| |lins2|) . #12#)
                                 (LETT |fc2| (|SPADfirst| |nfl2|) . #12#)
                                 (EXIT
                                  (LETT |lins2| (LIST (CDR |nfl2|)) . #12#)))))
                          (LETT |fcf| (QVELT |fc2| 0) . #12#)
                          (EXIT
                           (COND
                            ((SPADCALL
                              (LETT |bb|
                                    (SPADCALL |fcf|
                                              (PROG1
                                                  (LETT #1#
                                                        (-
                                                         (SPADCALL |fcf|
                                                                   (QREFELT $
                                                                            64))
                                                         1)
                                                        . #12#)
                                                (|check_subtype2| (>= #1# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #1#))
                                              (QREFELT $ 70))
                                    . #12#)
                              (QREFELT $ 151))
                             (|error|
                              (|error|
                               "integrate: implementation incomplete (trace 0)")))
                            (#13#
                             (SEQ
                              (LETT |la| (|INTALG;get_la| |lins1| |lins2| $)
                                    . #12#)
                              (LETT |ld|
                                    (|INTALG;get_ld| |rec| |lins1| |lins2| $)
                                    . #12#)
                              (LETT |alpha|
                                    (SPADCALL (|INTALG;UP2SUP| |fcf| $)
                                              (QREFELT $ 90))
                                    . #12#)
                              (LETT |v1|
                                    (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1)
                                              (QVELT |rec| 2) (QVELT |rec| 3)
                                              |alpha| (QREFELT $ 93))
                                    . #12#)
                              (LETT |tr1u|
                                    (|INTALG;trace1| |fcf| |la| |ld| |v1|
                                     |alpha| |bb| $)
                                    . #12#)
                              (EXIT
                               (COND ((QEQCAR |tr1u| 1) (CONS 1 "failed"))
                                     (#13#
                                      (CONS 0
                                            (SPADCALL (QVELT |ppr| 0)
                                                      (QCDR |tr1u|)
                                                      (QREFELT $
                                                               104))))))))))))))))))))))))) 

(SDEFUN |INTALG;do_root|
        ((|q| UP)
         (|rec| |Record| (|:| |num| R) (|:| |den| UP) (|:| |derivden| UP)
          (|:| |gd| UP))
         ($ |Union|
          (|List|
           (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                     (|:| |coeff| (|SparseUnivariatePolynomial| R))
                     (|:| |logand| (|SparseUnivariatePolynomial| R))))
          "failed"))
        (SPROG
         ((|rc|
           (|Union|
            (|Record| (|:| |order| (|NonNegativeInteger|)) (|:| |function| R))
            "failed"))
          (|vp| (|FiniteDivisor| F UP UPUP R))
          (|vp2| (|FiniteDivisor| F UP UPUP R))
          (|vp1| (|FiniteDivisor| F UP UPUP R))
          (|v3| #1=(|FiniteDivisor| F UP UPUP R)) (|v2| #1#) (|v1| #1#)
          (|w1| (F)) (|beta| (F)) (|alpha| (F)))
         (SEQ
          (LETT |alpha| (SPADCALL (|INTALG;UP2SUP| |q| $) (QREFELT $ 90))
                . #2=(|INTALG;do_root|))
          (LETT |beta|
                (SPADCALL
                 (SPADCALL (SPADCALL 3 (QREFELT $ 100)) (QREFELT $ 94))
                 (QREFELT $ 152))
                . #2#)
          (LETT |w1|
                (SPADCALL
                 (SPADCALL |beta| (|spadConstant| $ 76) (QREFELT $ 153))
                 (SPADCALL 2 (QREFELT $ 100)) (QREFELT $ 72))
                . #2#)
          (LETT |v1|
                (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1) (QVELT |rec| 2)
                          (QVELT |rec| 3) |alpha| (QREFELT $ 93))
                . #2#)
          (LETT |v2|
                (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1) (QVELT |rec| 2)
                          (QVELT |rec| 3)
                          (SPADCALL |w1| |alpha| (QREFELT $ 91))
                          (QREFELT $ 93))
                . #2#)
          (LETT |v3|
                (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1) (QVELT |rec| 2)
                          (QVELT |rec| 3)
                          (SPADCALL (SPADCALL |w1| 2 (QREFELT $ 154)) |alpha|
                                    (QREFELT $ 91))
                          (QREFELT $ 93))
                . #2#)
          (LETT |vp1| (SPADCALL 2 |v1| (QREFELT $ 155)) . #2#)
          (LETT |vp2| (SPADCALL |v2| |v3| (QREFELT $ 156)) . #2#)
          (LETT |vp| (SPADCALL |vp1| |vp2| (QREFELT $ 95)) . #2#)
          (LETT |rc| (SPADCALL |vp| (QREFELT $ 99)) . #2#)
          (EXIT
           (COND ((QEQCAR |rc| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (|INTALG;mkLog| |q|
                         (SPADCALL
                          (SPADCALL (* (QCAR (QCDR |rc|)) 3) (QREFELT $ 101))
                          (QREFELT $ 103))
                         (QCDR (QCDR |rc|)) |alpha| $)))))))) 

(SDEFUN |INTALG;UP2SUP| ((|p| UP) ($ |SparseUnivariatePolynomial| F))
        (SPADCALL (LIST #'|INTALG;UP2SUP!0|) |p| (QREFELT $ 159))) 

(SDEFUN |INTALG;UP2SUP!0| ((|x| NIL) ($$ NIL)) |x|) 

(SDEFUN |INTALG;SUP2UP| ((|p| |SparseUnivariatePolynomial| F) ($ UP))
        (SPADCALL (LIST #'|INTALG;SUP2UP!0|) |p| (QREFELT $ 161))) 

(SDEFUN |INTALG;SUP2UP!0| ((|x| NIL) ($$ NIL)) |x|) 

(SDEFUN |INTALG;varRoot?| ((|p| UP) (|derivation| |Mapping| F F) ($ |Boolean|))
        (SPROG ((#1=#:G1064 NIL) (#2=#:G1065 NIL) (#3=#:G1066 NIL) (|c| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |c| NIL . #4=(|INTALG;varRoot?|))
                         (LETT #3# (SPADCALL |p| (QREFELT $ 119)) . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |c| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |c| |derivation|)
                                       (|spadConstant| $ 30) (QREFELT $ 162))
                             (PROGN
                              (LETT #1#
                                    (PROGN (LETT #2# 'T . #4#) (GO #5=#:G1063))
                                    . #4#)
                              (GO #6=#:G1061))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT NIL)))
                #5# (EXIT #2#)))) 

(SDEFUN |INTALG;pLogDeriv|
        ((|log| |Record| (|:| |scalar| (|Fraction| (|Integer|)))
          (|:| |coeff| (|SparseUnivariatePolynomial| R))
          (|:| |logand| (|SparseUnivariatePolynomial| R)))
         (|derivation| |Mapping| R R) ($ R))
        (SPROG
         ((|ans| (R)) (|algans| #1=(|SparseUnivariatePolynomial| R))
          (#2=#:G1092 NIL) (|i| NIL)
          (|diflog|
           (|Union|
            (|Record| (|:| |coef1| #1#)
                      (|:| |coef2| (|SparseUnivariatePolynomial| R)))
            "failed"))
          (|numlog| (|SparseUnivariatePolynomial| R)) (|c| (R))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |derivation| (QVELT |log| 1) (QREFELT $ 164))
                      (|spadConstant| $ 165) (QREFELT $ 166))
            (|error| "can only handle logs with constant coefficients"))
           (#3='T
            (SEQ
             (LETT |n| (SPADCALL (QVELT |log| 1) (QREFELT $ 167))
                   . #4=(|INTALG;pLogDeriv|))
             (EXIT
              (COND
               ((EQL |n| 1)
                (SEQ
                 (LETT |c|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL (QVELT |log| 1) (QREFELT $ 168))
                                   (QREFELT $ 169))
                         (SPADCALL (QVELT |log| 1) (QREFELT $ 169))
                         (QREFELT $ 170))
                        (QREFELT $ 171))
                       . #4#)
                 (LETT |ans| (SPADCALL (QVELT |log| 2) |c| (QREFELT $ 172))
                       . #4#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL (QVELT |log| 0) (QREFELT $ 173)) |c|
                              (QREFELT $ 174))
                    (SPADCALL |ans| |derivation|) (QREFELT $ 174))
                   |ans| (QREFELT $ 170)))))
               (#3#
                (SEQ
                 (LETT |numlog|
                       (SPADCALL |derivation| (QVELT |log| 2) (QREFELT $ 164))
                       . #4#)
                 (LETT |diflog|
                       (SPADCALL (QVELT |log| 2) (QVELT |log| 1) |numlog|
                                 (QREFELT $ 177))
                       . #4#)
                 (EXIT
                  (COND ((QEQCAR |diflog| 1) (|error| "this shouldn't happen"))
                        (#3#
                         (SEQ (LETT |algans| (QCAR (QCDR |diflog|)) . #4#)
                              (LETT |ans| (|spadConstant| $ 11) . #4#)
                              (SEQ (LETT |i| 0 . #4#)
                                   (LETT #2# (- |n| 1) . #4#) G190
                                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                                   (SEQ
                                    (LETT |algans|
                                          (SPADCALL
                                           (SPADCALL |algans|
                                                     (SPADCALL
                                                      (|spadConstant| $ 178) 1
                                                      (QREFELT $ 179))
                                                     (QREFELT $ 180))
                                           (QVELT |log| 1) (QREFELT $ 181))
                                          . #4#)
                                    (EXIT
                                     (LETT |ans|
                                           (SPADCALL |ans|
                                                     (SPADCALL |algans| |i|
                                                               (QREFELT $ 182))
                                                     (QREFELT $ 55))
                                           . #4#)))
                                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190)
                                   G191 (EXIT NIL))
                              (EXIT
                               (SPADCALL
                                (SPADCALL (QVELT |log| 0) (QREFELT $ 173))
                                |ans| (QREFELT $ 174))))))))))))))))) 

(SDEFUN |INTALG;R2UP|
        ((|f| R) (|k| |Kernel| F) ($ |SparseUnivariatePolynomial| R))
        (SPROG ((|g| (F)) (|y| (F)) (|x| (F)))
               (SEQ
                (LETT |x| (SPADCALL (QREFELT $ 17) (QREFELT $ 184))
                      . #1=(|INTALG;R2UP|))
                (LETT |g|
                      (SPADCALL
                       (SPADCALL (CONS #'|INTALG;R2UP!0| (VECTOR $ |x|))
                                 (SPADCALL |f| (QREFELT $ 130))
                                 (QREFELT $ 189))
                       (LETT |y| (SPADCALL (QREFELT $ 18) (QREFELT $ 184))
                             . #1#)
                       (QREFELT $ 190))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (CONS #'|INTALG;R2UP!1|
                        (VECTOR $ (QREFELT $ 18) (QREFELT $ 17)))
                  (SPADCALL |g| |k| (SPADCALL |k| (QREFELT $ 191))
                            (QREFELT $ 193))
                  (QREFELT $ 196)))))) 

(SDEFUN |INTALG;R2UP!1| ((|x1| NIL) ($$ NIL))
        (PROG (|dumx| |dumy| $)
          (LETT |dumx| (QREFELT $$ 2) . #1=(|INTALG;R2UP|))
          (LETT |dumy| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTALG;rlift| |x1| |dumx| |dumy| $))))) 

(SDEFUN |INTALG;R2UP!0| ((|f1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTALG;R2UP|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| |x| (QREFELT $ 186)))))) 

(SDEFUN |INTALG;univ| ((|f| F) (|k| |Kernel| F) ($ |Fraction| UP))
        (SPROG ((|g| (|Fraction| (|SparseUnivariatePolynomial| F))))
               (SEQ (LETT |g| (SPADCALL |f| |k| (QREFELT $ 198)) |INTALG;univ|)
                    (EXIT
                     (SPADCALL
                      (|INTALG;SUP2UP| (SPADCALL |g| (QREFELT $ 200)) $)
                      (|INTALG;SUP2UP| (SPADCALL |g| (QREFELT $ 201)) $)
                      (QREFELT $ 35)))))) 

(SDEFUN |INTALG;rlift| ((|f| F) (|kx| |Kernel| F) (|ky| |Kernel| F) ($ R))
        (SPROG ((|uf| (|Fraction| (|SparseUnivariatePolynomial| F))))
               (SEQ
                (LETT |uf| (SPADCALL |f| |ky| (QREFELT $ 198)) |INTALG;rlift|)
                (EXIT
                 (SPADCALL
                  (SPADCALL (CONS #'|INTALG;rlift!0| (VECTOR $ |kx|))
                            (SPADCALL |uf| (QREFELT $ 202)) (QREFELT $ 205))
                  (QREFELT $ 206)))))) 

(SDEFUN |INTALG;rlift!0| ((|x1| NIL) ($$ NIL))
        (PROG (|kx| $)
          (LETT |kx| (QREFELT $$ 1) . #1=(|INTALG;rlift|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTALG;univ| |x1| |kx| $))))) 

(SDEFUN |INTALG;trace1|
        ((|q| UP) (|la| |List| F) (|ld| |List| (|FiniteDivisor| F UP UPUP R))
         (|v1| |FiniteDivisor| F UP UPUP R) (|alpha| F) (|b| F)
         ($ |Union|
          (|List|
           (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                     (|:| |coeff| (|SparseUnivariatePolynomial| R))
                     (|:| |logand| (|SparseUnivariatePolynomial| R))))
          "failed"))
        (SPROG
         ((|rc|
           (|Union|
            (|Record| (|:| |order| (|NonNegativeInteger|)) (|:| |function| R))
            "failed"))
          (|v2| (|FiniteDivisor| F UP UPUP R))
          (|v0| #1=(|FiniteDivisor| F UP UPUP R)) (#2=#:G1106 NIL)
          (#3=#:G1105 #1#) (#4=#:G1107 #1#) (#5=#:G1117 NIL) (|a| NIL)
          (#6=#:G1118 NIL) (|dv| NIL)
          (|cd|
           (|Record| (|:| |num| (|List| (|Integer|))) (|:| |den| (|Integer|))))
          (#7=#:G1116 NIL) (#8=#:G1115 NIL))
         (SEQ
          (LETT |cd|
                (SPADCALL
                 (PROGN
                  (LETT #8# NIL . #9=(|INTALG;trace1|))
                  (SEQ (LETT |a| NIL . #9#) (LETT #7# |la| . #9#) G190
                       (COND
                        ((OR (ATOM #7#) (PROGN (LETT |a| (CAR #7#) . #9#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #8#
                               (CONS
                                (SPADCALL (SPADCALL |a| |b| (QREFELT $ 72))
                                          (QREFELT $ 207))
                                #8#)
                               . #9#)))
                       (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                       (EXIT (NREVERSE #8#))))
                 (QREFELT $ 211))
                . #9#)
          (LETT |v0|
                (PROGN
                 (LETT #2# NIL . #9#)
                 (SEQ (LETT |dv| NIL . #9#) (LETT #6# |ld| . #9#)
                      (LETT |a| NIL . #9#) (LETT #5# (QCAR |cd|) . #9#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#) . #9#) NIL)
                            (ATOM #6#) (PROGN (LETT |dv| (CAR #6#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# (SPADCALL |a| |dv| (QREFELT $ 212)) . #9#)
                         (COND
                          (#2#
                           (LETT #3# (SPADCALL #3# #4# (QREFELT $ 156)) . #9#))
                          ('T
                           (PROGN
                            (LETT #3# #4# . #9#)
                            (LETT #2# 'T . #9#)))))))
                      (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) (#10='T (|spadConstant| $ 213))))
                . #9#)
          (LETT |v2|
                (SPADCALL |v0| (SPADCALL (QCDR |cd|) |v1| (QREFELT $ 212))
                          (QREFELT $ 95))
                . #9#)
          (LETT |rc| (SPADCALL |v2| (QREFELT $ 99)) . #9#)
          (EXIT
           (COND
            ((QEQCAR |rc| 1)
             (COND
              ((SPADCALL (SPADCALL |q| (QREFELT $ 64)) 2 (QREFELT $ 214))
               (CONS 1 "failed"))
              (#10#
               (|error|
                "Not integrable (provided residues have no relations)"))))
            (#10#
             (CONS 0
                   (|INTALG;mkLog| |q|
                    (SPADCALL
                     (SPADCALL (- (* (QCAR (QCDR |rc|)) (QCDR |cd|)))
                               (QREFELT $ 101))
                     (QREFELT $ 103))
                    (QCDR (QCDR |rc|)) |alpha| $)))))))) 

(SDEFUN |INTALG;mkLog|
        ((|q| UP) (|scalr| |Fraction| (|Integer|)) (|lgd| R) (|alpha| F)
         ($ |List|
          (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                    (|:| |coeff| (|SparseUnivariatePolynomial| R))
                    (|:| |logand| (|SparseUnivariatePolynomial| R)))))
        (COND
         ((SPADCALL (SPADCALL |q| (QREFELT $ 64)) 1 (QREFELT $ 214))
          (LIST
           (VECTOR |scalr|
                   (SPADCALL
                    (SPADCALL (|spadConstant| $ 178) 1 (QREFELT $ 179))
                    (|INTALG;F2UPR| |alpha| $) (QREFELT $ 215))
                   (SPADCALL |lgd| (QREFELT $ 20)))))
         ('T
          (LIST
           (VECTOR |scalr|
                   (SPADCALL (CONS (|function| |INTALG;F2R|) $) |q|
                             (QREFELT $ 217))
                   (|INTALG;R2UP| |lgd| (SPADCALL |alpha| (QREFELT $ 218))
                    $)))))) 

(SDEFUN |INTALG;palgintegrate;RMIr;26|
        ((|f| R) (|derivation| |Mapping| UP UP) ($ |IntegrationResult| R))
        (SPROG
         ((|difFirstKind| (R)) (#1=#:G1179 NIL) (#2=#:G1178 (R))
          (#3=#:G1180 (R)) (#4=#:G1187 NIL) (|lg| NIL) (#5=#:G1186 NIL)
          (|u|
           (|Union|
            (|List|
             (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                       (|:| |coeff| (|SparseUnivariatePolynomial| R))
                       (|:| |logand| (|SparseUnivariatePolynomial| R))))
            "failed"))
          (|h| (|Record| (|:| |answer| R) (|:| |logpart| R))))
         (SEQ
          (LETT |h| (SPADCALL |f| |derivation| (QREFELT $ 45))
                . #6=(|INTALG;palgintegrate;RMIr;26|))
          (EXIT
           (COND
            ((SPADCALL (QCDR |h|) (QREFELT $ 52))
             (SPADCALL (QCAR |h|) (QREFELT $ 54)))
            (#7='T
             (SEQ
              (EXIT
               (SEQ
                (COND
                 ((SPADCALL (QCDR |h|) (QREFELT $ 219))
                  (SEQ
                   (LETT |u| (|INTALG;palglogint| (QCDR |h|) |derivation| $)
                         . #6#)
                   (EXIT
                    (COND
                     ((QEQCAR |u| 1)
                      (PROGN
                       (LETT #5#
                             (SPADCALL (QCAR |h|) NIL
                                       (LIST (CONS (QCDR |h|) (QREFELT $ 12)))
                                       (QREFELT $ 60))
                             . #6#)
                       (GO #8=#:G1183)))))))
                 (#7#
                  (EXIT
                   (SPADCALL (QCAR |h|) NIL
                             (LIST (CONS (QCDR |h|) (QREFELT $ 12)))
                             (QREFELT $ 60)))))
                (EXIT
                 (COND
                  ((SPADCALL
                    (LETT |difFirstKind|
                          (SPADCALL (QCDR |h|)
                                    (PROGN
                                     (LETT #1# NIL . #6#)
                                     (SEQ (LETT |lg| NIL . #6#)
                                          (LETT #4# (QCDR |u|) . #6#) G190
                                          (COND
                                           ((OR (ATOM #4#)
                                                (PROGN
                                                 (LETT |lg| (CAR #4#) . #6#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #3#
                                                   (|INTALG;pLogDeriv| |lg|
                                                    (CONS
                                                     #'|INTALG;palgintegrate;RMIr;26!0|
                                                     (VECTOR $ |derivation|))
                                                    $)
                                                   . #6#)
                                             (COND
                                              (#1#
                                               (LETT #2#
                                                     (SPADCALL #2# #3#
                                                               (QREFELT $ 55))
                                                     . #6#))
                                              ('T
                                               (PROGN
                                                (LETT #2# #3# . #6#)
                                                (LETT #1# 'T . #6#)))))))
                                          (LETT #4# (CDR #4#) . #6#) (GO G190)
                                          G191 (EXIT NIL))
                                     (COND (#1# #2#)
                                           (#7# (|spadConstant| $ 11))))
                                    (QREFELT $ 221))
                          . #6#)
                    (QREFELT $ 52))
                   (SPADCALL (QCAR |h|) (QCDR |u|) NIL (QREFELT $ 60)))
                  (#7#
                   (SPADCALL (QCAR |h|) (QCDR |u|)
                             (LIST (CONS |difFirstKind| (QREFELT $ 12)))
                             (QREFELT $ 60)))))))
              #8# (EXIT #5#)))))))) 

(SDEFUN |INTALG;palgintegrate;RMIr;26!0| ((|x1| NIL) ($$ NIL))
        (PROG (|derivation| $)
          (LETT |derivation| (QREFELT $$ 1)
                . #1=(|INTALG;palgintegrate;RMIr;26|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |derivation| (QREFELT $ 220)))))) 

(SDEFUN |INTALG;algintegrate;RMIr;27|
        ((|f| R) (|derivation| |Mapping| UP UP) ($ |IntegrationResult| R))
        (SPROG
         ((#1=#:G1201 NIL) (|xx| (|Union| UP "failed")) (|x'| (UP)) (|x| (UP)))
         (SEQ
          (LETT |x'|
                (SPADCALL
                 (LETT |x| (SPADCALL (|spadConstant| $ 76) 1 (QREFELT $ 86))
                       . #2=(|INTALG;algintegrate;RMIr;27|))
                 |derivation|)
                . #2#)
          (EXIT
           (COND
            ((ZEROP (SPADCALL |x'| (QREFELT $ 64)))
             (|INTALG;algintprim| |f| |derivation| $))
            ('T
             (SEQ
              (EXIT
               (SEQ
                (SEQ (LETT |xx| (SPADCALL |x'| |x| (QREFELT $ 224)) . #2#)
                     (EXIT
                      (COND
                       ((QEQCAR |xx| 0)
                        (COND
                         ((QEQCAR (SPADCALL (QCDR |xx|) (QREFELT $ 226)) 0)
                          (PROGN
                           (LETT #1# (|INTALG;algintexp| |f| |derivation| $)
                                 . #2#)
                           (GO #3=#:G1198))))))))
                (EXIT (|error| "should not happen"))))
              #3# (EXIT #1#)))))))) 

(SDEFUN |INTALG;alglogint|
        ((|f| R) (|derivation| |Mapping| UP UP)
         ($ |Union|
          (|List|
           (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                     (|:| |coeff| (|SparseUnivariatePolynomial| R))
                     (|:| |logand| (|SparseUnivariatePolynomial| R))))
          "failed"))
        (SPROG ((|r| (UP)))
               (SEQ
                (LETT |r|
                      (SPADCALL (SPADCALL |f| |derivation| (QREFELT $ 149))
                                (QREFELT $ 132))
                      |INTALG;alglogint|)
                (EXIT
                 (COND
                  ((|INTALG;varRoot?| |r|
                    (CONS #'|INTALG;alglogint!0| (VECTOR |derivation| $)) $)
                   (CONS 1 "failed"))
                  ('T
                   (|error|
                    "integrate: implementation incomplete (constant residues)"))))))) 

(SDEFUN |INTALG;alglogint!0| ((|x1| NIL) ($$ NIL))
        (PROG ($ |derivation|)
          (LETT $ (QREFELT $$ 1) . #1=(|INTALG;alglogint|))
          (LETT |derivation| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL (SPADCALL |x1| (QREFELT $ 21)) |derivation|)
                      (QREFELT $ 228)))))) 

(DECLAIM (NOTINLINE |AlgebraicIntegrate;|)) 

(DEFUN |AlgebraicIntegrate| (&REST #1=#:G1206)
  (SPROG NIL
         (PROG (#2=#:G1207)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraicIntegrate|)
                                               '|domainEqualList|)
                    . #3=(|AlgebraicIntegrate|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraicIntegrate;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraicIntegrate|)))))))))) 

(DEFUN |AlgebraicIntegrate;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgebraicIntegrate|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|AlgebraicIntegrate| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 229) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|AlgebraicIntegrate|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 12 (|spadConstant| $ 11))
    (QSETREFV $ 17 (SPADCALL (SPADCALL (QREFELT $ 14)) (QREFELT $ 16)))
    (QSETREFV $ 18 (SPADCALL (SPADCALL (QREFELT $ 14)) (QREFELT $ 16)))
    $))) 

(MAKEPROP '|AlgebraicIntegrate| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . |Zero|)
              '|dummy| (|Symbol|) (4 . |new|) (|Kernel| 7) (8 . |kernel|)
              '|dumx| '|dumy| (|SparseUnivariatePolynomial| 10) (13 . |coerce|)
              (18 . |coerce|) (|Fraction| 8) (23 . |coerce|) (28 . |coerce|)
              (|Record| (|:| |num| 33) (|:| |den| 8))
              (33 . |integralCoordinates|) (|LaurentPolynomial| 7 8)
              (38 . |Zero|) (42 . |Zero|) (46 . |Zero|) (50 . |Zero|)
              (|Integer|) (|Vector| 8) (54 . |minIndex|) (59 . /)
              (|Record| (|:| |polyPart| $) (|:| |fracPart| 22))
              (65 . |separate|) (|Vector| $) (70 . |integralBasis|)
              (|Vector| 22) (74 . |represents|)
              (|Record| (|:| |answer| 10) (|:| |logpart| 10)) (|Mapping| 8 8)
              (|AlgebraicHermiteIntegration| 7 8 9 10)
              (80 . |HermiteIntegrate|) (86 . |convert|) (|Mapping| 22 27)
              (|Vector| 27) (|VectorFunctions2| 27 22) (91 . |map|) (|Boolean|)
              (97 . |zero?|) (|IntegrationResult| 10) (102 . |coerce|)
              (107 . +)
              (|Record| (|:| |scalar| 61) (|:| |coeff| 19) (|:| |logand| 19))
              (|List| 56) (|Record| (|:| |integrand| 10) (|:| |intvar| 10))
              (|List| 58) (113 . |mkAnswer|) (|Fraction| 32) (120 . |One|)
              (|NonNegativeInteger|) (124 . |degree|) (129 . |reductum|)
              (134 . |Zero|) (138 . ~=) (144 . |leadingCoefficient|) (149 . ~=)
              (155 . |coefficient|) (161 . =) (167 . /)
              (|Union| 61 '#1="failed") (173 . |retractIfCan|) (178 . |One|)
              (182 . |One|) (186 . >) (192 . |numer|) (|Union| 32 '"failed")
              (|IntegerRoots| 32) (197 . |perfectNthRoot|) (203 . |denom|)
              (208 . /) (214 . |coerce|) (219 . ^) (225 . |monomial|)
              (231 . |elt|) (237 . *) (|SparseUnivariatePolynomial| $)
              (243 . |rootOf|) (248 . *) (|FiniteDivisor| 7 8 9 10)
              (254 . |divisor|) (263 . -) (268 . -)
              (|Record| (|:| |order| 63) (|:| |function| 10))
              (|Union| 96 '"failed") (|PointsOfFiniteOrder| 6 7 8 9 10)
              (274 . |torsionIfCan|) (279 . |coerce|) (284 . |coerce|)
              (289 . *) (295 . |inv|) (300 . |concat|) (306 . =) (312 . |Zero|)
              (316 . >) (|PositiveInteger|) (322 . *) (328 . -) (333 . =)
              (|Record| (|:| |factor| 8) (|:| |exponent| 32) (|:| |coeff| 61))
              (|Union| 112 '"failed") (|Mapping| 51 112) (|List| 112)
              (339 . |find|) (345 . ~=) (|List| 7) (351 . |coefficients|)
              (356 . |concat|) (|List| 22) (362 . |coefficients|)
              (367 . |numer|) (|List| 8) (|Mapping| 8 22)
              (|ListFunctions2| 22 8) (372 . |map|) (378 . |denom|)
              (383 . |concat|) (389 . |lift|) (394 . |definingPolynomial|)
              (398 . |primitivePart|) (|SparseUnivariatePolynomial| 7)
              (403 . |makeSUP|) (|Factored| 133)
              (|ExpressionFactorPolynomial| 6 7) (408 . |factor|)
              (|Factored| 8) (|Mapping| 8 133) (|FactoredFunctions2| 133 8)
              (414 . |map|) (|Record| (|:| |factor| 8) (|:| |exponent| 32))
              (|List| 142) (420 . |factors|) (425 . >)
              (|Record| (|:| |num| $) (|:| |den| 8) (|:| |derivden| 8)
                        (|:| |gd| 8))
              (431 . |algSplitSimple|) (|DoubleResultantPackage| 7 8 9 10)
              (437 . |doubleResultant|) (443 . |ground?|) (448 . |zero?|)
              (453 . |sqrt|) (458 . -) (464 . ^) (470 . *) (476 . +)
              (|Mapping| 7 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 8 7 133)
              (482 . |map|)
              (|UnivariatePolynomialCategoryFunctions2| 7 133 7 8)
              (488 . |map|) (494 . ~=) (|Mapping| 10 10) (500 . |map|)
              (506 . |Zero|) (510 . ~=) (516 . |degree|) (521 . |reductum|)
              (526 . |leadingCoefficient|) (531 . /) (537 . -) (542 . |elt|)
              (548 . |coerce|) (553 . *)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 175 '"failed") (559 . |extendedEuclidean|) (566 . |One|)
              (570 . |monomial|) (576 . *) (582 . |rem|) (588 . |coefficient|)
              (|Kernel| $) (594 . |coerce|) (|Fraction| $) (599 . |elt|)
              (|Mapping| 7 22)
              (|UnivariatePolynomialCategoryFunctions2| 22 9 7 8) (605 . |map|)
              (611 . |elt|) (617 . |minPoly|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 15) 15
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 15)
                                                     7)
              (622 . |univariate|) (|Mapping| 10 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 133 10 19)
              (629 . |map|) (|Fraction| 89) (635 . |univariate|)
              (|Fraction| 133) (641 . |numer|) (646 . |denom|)
              (651 . |retract|) (|Mapping| 22 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 133 22 9)
              (656 . |map|) (662 . |reduce|) (667 . |retract|)
              (|Record| (|:| |num| (|List| 32)) (|:| |den| 32)) (|List| 61)
              (|InnerCommonDenominator| 32 61 (|List| 32) 209)
              (672 . |splitDenominator|) (677 . *) (683 . |Zero|) (687 . <=)
              (693 . -) (|UnivariatePolynomialCategoryFunctions2| 7 8 10 19)
              (699 . |map|) (705 . |retract|) (710 . |integralAtInfinity?|)
              (715 . |differentiate|) (721 . -) |INTALG;palgintegrate;RMIr;26|
              (|Union| $ '"failed") (727 . |exquo|) (|Union| 7 '#1#)
              (733 . |retractIfCan|) |INTALG;algintegrate;RMIr;27|
              (738 . |retract|))
           '#(|palgintegrate| 743 |algintegrate| 749) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 228
                                                 '(0 10 0 11 0 13 0 14 1 15 0
                                                   13 16 1 19 0 10 20 1 8 0 7
                                                   21 1 22 0 8 23 1 10 0 22 24
                                                   1 10 25 0 26 0 27 0 28 0 6 0
                                                   29 0 7 0 30 0 22 0 31 1 33
                                                   32 0 34 2 22 0 8 8 35 1 27
                                                   36 22 37 0 10 38 39 2 10 0
                                                   40 38 41 2 44 42 10 43 45 1
                                                   27 22 0 46 2 49 40 47 48 50
                                                   1 10 51 0 52 1 53 0 10 54 2
                                                   10 0 0 0 55 3 53 0 10 57 59
                                                   60 0 61 0 62 1 8 63 0 64 1 8
                                                   0 0 65 0 8 0 66 2 8 51 0 0
                                                   67 1 8 7 0 68 2 63 51 0 0 69
                                                   2 8 7 0 63 70 2 7 51 0 0 71
                                                   2 7 0 0 0 72 1 7 73 0 74 0 6
                                                   0 75 0 7 0 76 2 63 51 0 0 77
                                                   1 61 32 0 78 2 80 79 32 63
                                                   81 1 61 32 0 82 2 61 0 32 32
                                                   83 1 7 0 61 84 2 7 0 0 32 85
                                                   2 8 0 7 63 86 2 8 0 0 0 87 2
                                                   8 0 7 0 88 1 7 0 89 90 2 7 0
                                                   0 0 91 5 92 0 10 8 8 8 7 93
                                                   1 7 0 0 94 2 92 0 0 0 95 1
                                                   98 97 92 99 1 7 0 32 100 1
                                                   61 0 32 101 2 61 0 32 0 102
                                                   1 61 0 0 103 2 57 0 0 0 104
                                                   2 8 51 0 0 105 0 61 0 106 2
                                                   61 51 0 0 107 2 63 0 108 0
                                                   109 1 61 0 0 110 2 61 51 0 0
                                                   111 2 115 113 114 0 116 2 32
                                                   51 0 0 117 1 8 118 0 119 2
                                                   118 0 0 0 120 1 9 121 0 122
                                                   1 22 8 0 123 2 126 124 125
                                                   121 127 1 22 8 0 128 2 124 0
                                                   0 0 129 1 10 9 0 130 0 10 9
                                                   131 1 8 0 0 132 1 8 133 0
                                                   134 2 136 135 133 118 137 2
                                                   140 138 139 135 141 1 138
                                                   143 0 144 2 32 51 0 0 145 2
                                                   10 146 0 43 147 2 148 8 10
                                                   43 149 1 8 51 0 150 1 7 51 0
                                                   151 1 7 0 0 152 2 7 0 0 0
                                                   153 2 7 0 0 108 154 2 92 0
                                                   108 0 155 2 92 0 0 0 156 2
                                                   158 133 157 8 159 2 160 8
                                                   157 133 161 2 7 51 0 0 162 2
                                                   19 0 163 0 164 0 19 0 165 2
                                                   19 51 0 0 166 1 19 63 0 167
                                                   1 19 0 0 168 1 19 10 0 169 2
                                                   10 0 0 0 170 1 10 0 0 171 2
                                                   19 10 0 10 172 1 10 0 61 173
                                                   2 10 0 0 0 174 3 19 176 0 0
                                                   0 177 0 10 0 178 2 19 0 10
                                                   63 179 2 19 0 0 0 180 2 19 0
                                                   0 0 181 2 19 10 0 63 182 1 7
                                                   0 183 184 2 8 7 185 7 186 2
                                                   188 8 187 9 189 2 8 7 0 7
                                                   190 1 7 89 183 191 3 192 133
                                                   7 15 133 193 2 195 19 194
                                                   133 196 2 7 197 0 183 198 1
                                                   199 133 0 200 1 199 133 0
                                                   201 1 199 133 0 202 2 204 9
                                                   203 133 205 1 10 0 9 206 1 7
                                                   61 0 207 1 210 208 209 211 2
                                                   92 0 32 0 212 0 92 0 213 2
                                                   32 51 0 0 214 2 19 0 0 0 215
                                                   2 216 19 194 8 217 1 7 183 0
                                                   218 1 10 51 0 219 2 10 0 0
                                                   43 220 2 10 0 0 0 221 2 8
                                                   223 0 0 224 1 8 225 0 226 1
                                                   8 7 0 228 2 0 53 10 43 222 2
                                                   0 53 10 43 227)))))
           '|lookupComplete|)) 
