
(SDEFUN |LAPLACE;laplace;F2SF;1| ((|f| F) (|t| |Symbol|) (|s| |Symbol|) ($ F))
        (|LAPLACE;locallaplace| (SPADCALL |f| |t| (QREFELT $ 15)) |t|
         (SPADCALL |t| (QREFELT $ 16)) |s| (SPADCALL |s| (QREFELT $ 16)) $)) 

(SDEFUN |LAPLACE;algebraic?| ((|f| F) (|t| |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G748 NIL) (#2=#:G749 NIL) (#3=#:G752 NIL) (|k| NIL)
          (|m| (|NonNegativeInteger|)) (#4=#:G751 NIL) (#5=#:G750 NIL)
          (|l| (|List| (|Kernel| F))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |l|
                  (SPADCALL (SPADCALL |f| (QREFELT $ 19)) |t| (QREFELT $ 22))
                  . #6=(|LAPLACE;algebraic?|))
            (LETT |m|
                  (SPADCALL (ELT $ 23)
                            (PROGN
                             (LETT #5# NIL . #6#)
                             (SEQ (LETT |k| NIL . #6#) (LETT #4# |l| . #6#)
                                  G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN (LETT |k| (CAR #4#) . #6#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #5#
                                          (CONS (SPADCALL |k| (QREFELT $ 25))
                                                #5#)
                                          . #6#)))
                                  (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                                  (EXIT (NREVERSE #5#))))
                            0 (QREFELT $ 28))
                  . #6#)
            (SEQ
             (EXIT
              (SEQ (LETT |k| NIL . #6#) (LETT #3# |l| . #6#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |k| (QREFELT $ 25)) |m|)
                       (COND
                        ((SPADCALL (SPADCALL |k| (QREFELT $ 29)) (QREFELT $ 8)
                                   (QREFELT $ 31))
                         (PROGN
                          (LETT #1# (PROGN (LETT #2# 'T . #6#) (GO #7=#:G747))
                                . #6#)
                          (GO #8=#:G745))))))))
                   (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL)))
             #8# (EXIT #1#))
            (EXIT NIL)))
          #7# (EXIT #2#)))) 

(SDEFUN |LAPLACE;dvlap| ((|l| |List| F) (|x| |Symbol|) ($ F))
        (SPROG ((|e| (F)) (|v| (|Symbol|)) (|l3| (F)) (|l2| (F)) (|l1| (F)))
               (SEQ (LETT |l1| (|SPADfirst| |l|) . #1=(|LAPLACE;dvlap|))
                    (LETT |l2| (SPADCALL |l| (QREFELT $ 33)) . #1#)
                    (LETT |v|
                          (SPADCALL
                           (LETT |l3| (SPADCALL |l| (QREFELT $ 34)) . #1#)
                           (QREFELT $ 35))
                          . #1#)
                    (EXIT
                     (COND
                      ((EQUAL |x| |v|)
                       (SPADCALL
                        (SPADCALL (QREFELT $ 13)
                                  (SPADCALL |l2| |l1| (QREFELT $ 36)) |l2| |l3|
                                  (QREFELT $ 37))
                        (QREFELT $ 38)))
                      ('T
                       (SEQ
                        (LETT |e|
                              (SPADCALL
                               (SPADCALL (SPADCALL |l3| |l2| (QREFELT $ 36))
                                         (QREFELT $ 38))
                               (QREFELT $ 39))
                              . #1#)
                        (EXIT
                         (|LAPLACE;locallaplace|
                          (SPADCALL
                           (SPADCALL (SPADCALL |e| |l1| (QREFELT $ 36)) |x|
                                     (QREFELT $ 40))
                           |e| (QREFELT $ 41))
                          (SPADCALL |l2| (QREFELT $ 35)) |l2| |v| |l3|
                          $))))))))) 

(SDEFUN |LAPLACE;isLinear|
        ((|f| F) (|t| |Symbol|)
         ($ |Union| (|Record| (|:| |const| F) (|:| |nconst| F)) "failed"))
        (SPROG
         ((|c| (F)) (|b| (F)) (#1=#:G783 NIL) (|d| (|Union| F "failed"))
          (|ff| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ff|
                  (SPADCALL |f| (SPADCALL |t| (QREFELT $ 42)) (QREFELT $ 45))
                  . #2=(|LAPLACE;isLinear|))
            (SEQ
             (LETT |d| (SPADCALL (SPADCALL |ff| (QREFELT $ 48)) (QREFELT $ 50))
                   . #2#)
             (EXIT
              (COND
               ((OR (QEQCAR |d| 1)
                    (SPADCALL
                     (SPADCALL (SPADCALL |ff| (QREFELT $ 51)) (QREFELT $ 52)) 1
                     (QREFELT $ 53)))
                (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #3=#:G781))))))
            (COND
             ((SPADCALL
               (LETT |b|
                     (SPADCALL
                      (SPADCALL (SPADCALL |ff| (QREFELT $ 51)) 0
                                (QREFELT $ 54))
                      (QCDR |d|) (QREFELT $ 41))
                     . #2#)
               |t| (QREFELT $ 55))
              (COND
               ((SPADCALL
                 (LETT |c|
                       (SPADCALL
                        (SPADCALL (SPADCALL |ff| (QREFELT $ 51)) 1
                                  (QREFELT $ 54))
                        (QCDR |d|) (QREFELT $ 41))
                       . #2#)
                 |t| (QREFELT $ 55))
                (EXIT (CONS 0 (CONS |b| |c|)))))))
            (EXIT (CONS 1 "failed"))))
          #3# (EXIT #1#)))) 

(SDEFUN |LAPLACE;atn|
        ((|f| F) (|t| |Symbol|)
         ($ |Union| (|Record| (|:| |coef| F) (|:| |deg| (|PositiveInteger|)))
          #1="failed"))
        (SPROG
         ((#2=#:G807 NIL) (|c| (F)) (|d| (|NonNegativeInteger|))
          (|r| (|Record| (|:| |coef| F) (|:| |deg| (|PositiveInteger|))))
          (|rec|
           (|Union| (|Record| (|:| |coef| F) (|:| |deg| (|PositiveInteger|)))
                    #1#))
          (#3=#:G813 NIL) (|g| NIL) (|u| (|Union| (|List| F) #4="failed"))
          (#5=#:G811 NIL) (#6=#:G812 NIL) (#7=#:G796 NIL)
          (|vv| (|Union| (|Symbol|) "failed"))
          (|w|
           (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|))))
          (|v|
           (|Union|
            (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|)))
            #4#)))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |v| (SPADCALL |f| (QREFELT $ 58)) . #8=(|LAPLACE;atn|))
                 (EXIT
                  (COND
                   ((QEQCAR |v| 0)
                    (SEQ (LETT |w| (QCDR |v|) . #8#)
                         (EXIT
                          (COND
                           ((SPADCALL (QCDR |w|) 0 (QREFELT $ 60))
                            (SEQ
                             (EXIT
                              (SEQ
                               (LETT |vv| (SPADCALL (QCAR |w|) (QREFELT $ 62))
                                     . #8#)
                               (EXIT
                                (COND
                                 ((QEQCAR |vv| 0)
                                  (COND
                                   ((EQUAL (QCDR |vv|) |t|)
                                    (PROGN
                                     (LETT #5#
                                           (PROGN
                                            (LETT #6#
                                                  (CONS 0
                                                        (CONS
                                                         (|spadConstant| $ 64)
                                                         (PROG1
                                                             (LETT #7#
                                                                   (QCDR |w|)
                                                                   . #8#)
                                                           (|check_subtype2|
                                                            (> #7# 0)
                                                            '(|PositiveInteger|)
                                                            '(|Integer|)
                                                            #7#))))
                                                  . #8#)
                                            (GO #9=#:G810))
                                           . #8#)
                                     (GO #10=#:G797)))))))))
                             #10# (EXIT #5#))))))))))
            (LETT |u| (SPADCALL |f| (QREFELT $ 66)) . #8#)
            (EXIT
             (COND
              ((QEQCAR |u| 0)
               (SEQ (LETT |c| (|spadConstant| $ 64) . #8#) (LETT |d| 0 . #8#)
                    (SEQ (LETT |g| NIL . #8#) (LETT #3# (QCDR |u|) . #8#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |g| (CAR #3#) . #8#) NIL))
                           (GO G191)))
                         (SEQ (LETT |rec| (|LAPLACE;atn| |g| |t| $) . #8#)
                              (EXIT
                               (COND
                                ((QEQCAR |rec| 0)
                                 (SEQ (LETT |r| (QCDR |rec|) . #8#)
                                      (LETT |c|
                                            (SPADCALL |c| (QCAR |r|)
                                                      (QREFELT $ 36))
                                            . #8#)
                                      (EXIT
                                       (LETT |d| (+ |d| (QCDR |r|)) . #8#))))
                                ('T
                                 (LETT |c| (SPADCALL |c| |g| (QREFELT $ 36))
                                       . #8#)))))
                         (LETT #3# (CDR #3#) . #8#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND ((ZEROP |d|) (CONS 1 "failed"))
                           (#11='T
                            (CONS 0
                                  (CONS |c|
                                        (PROG1 (LETT #2# |d| . #8#)
                                          (|check_subtype2| (> #2# 0)
                                                            '(|PositiveInteger|)
                                                            '(|NonNegativeInteger|)
                                                            #2#)))))))))
              (#11# (CONS 1 "failed"))))))
          #9# (EXIT #6#)))) 

(SDEFUN |LAPLACE;is_root|
        ((|k| |Kernel| F) (|t| |Symbol|) ($ |Union| F "failed"))
        (SPROG ((|a| (F)) (|args| (|List| F)))
               (SEQ
                (COND
                 ((SPADCALL |k| '|nthRoot| (QREFELT $ 67))
                  (SEQ
                   (LETT |args| (SPADCALL |k| (QREFELT $ 68))
                         . #1=(|LAPLACE;is_root|))
                   (EXIT
                    (COND
                     ((OR
                       (SPADCALL (SPADCALL |args| 2 (QREFELT $ 69))
                                 (SPADCALL 2 (QREFELT $ 70)) (QREFELT $ 71))
                       (NULL
                        (SPADCALL
                         (LETT |a|
                               (SPADCALL (SPADCALL |args| 1 (QREFELT $ 69))
                                         (SPADCALL |t| (QREFELT $ 16))
                                         (QREFELT $ 41))
                               . #1#)
                         |t| (QREFELT $ 55))))
                      (CONS 1 "failed"))
                     ('T (CONS 0 |a|))))))
                 ('T (CONS 1 "failed")))))) 

(SDEFUN |LAPLACE;athalf|
        ((|f| F) (|t| |Symbol|)
         ($ |Union|
          (|Record| (|:| |coef| F) (|:| |deg| (|NonNegativeInteger|)))
          "failed"))
        (SPROG
         ((|vv| (|Record| (|:| |coef| F) (|:| |deg| (|PositiveInteger|))))
          (|v|
           (|Union| (|Record| (|:| |coef| F) (|:| |deg| (|PositiveInteger|)))
                    "failed"))
          (|nf| (F)) (|rru| (|Union| F "failed")) (|rk| (|Kernel| F))
          (|nk| (|NonNegativeInteger|)) (|vkl| (|List| (|Kernel| F)))
          (#1=#:G846 NIL) (|k| NIL) (#2=#:G845 NIL))
         (SEQ
          (LETT |vkl|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|LAPLACE;athalf|))
                  (SEQ (LETT |k| NIL . #3#)
                       (LETT #1# (SPADCALL |f| (QREFELT $ 19)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |t|
                                     (SPADCALL (SPADCALL |k| (QREFELT $ 72))
                                               (QREFELT $ 74))
                                     (QREFELT $ 75))
                           (LETT #2# (CONS |k| #2#) . #3#)))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 76))
                . #3#)
          (LETT |nk| (LENGTH |vkl|) . #3#)
          (EXIT
           (COND ((SPADCALL |nk| 2 (QREFELT $ 53)) (CONS 1 "failed"))
                 (#4='T
                  (SEQ
                   (LETT |rru|
                         (|LAPLACE;is_root|
                          (LETT |rk| (SPADCALL |vkl| |nk| (QREFELT $ 77))
                                . #3#)
                          |t| $)
                         . #3#)
                   (EXIT
                    (COND ((QEQCAR |rru| 1) (CONS 1 "failed"))
                          (#4#
                           (SEQ
                            (LETT |nf|
                                  (SPADCALL |f| (SPADCALL |rk| (QREFELT $ 72))
                                            (QREFELT $ 36))
                                  . #3#)
                            (COND
                             ((NULL
                               (SPADCALL |t| (SPADCALL |nf| (QREFELT $ 74))
                                         (QREFELT $ 75)))
                              (EXIT
                               (CONS 0
                                     (CONS
                                      (SPADCALL |nf| (QCDR |rru|)
                                                (QREFELT $ 41))
                                      0)))))
                            (LETT |v|
                                  (|LAPLACE;atn|
                                   (SPADCALL |f| (SPADCALL |rk| (QREFELT $ 72))
                                             (QREFELT $ 36))
                                   |t| $)
                                  . #3#)
                            (EXIT
                             (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                                   (#4#
                                    (SEQ (LETT |vv| (QCDR |v|) . #3#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL (QCAR |vv|) |t|
                                                      (QREFELT $ 55))
                                            (CONS 0
                                                  (CONS
                                                   (SPADCALL (QCAR |vv|)
                                                             (QCDR |rru|)
                                                             (QREFELT $ 41))
                                                   (QCDR |vv|))))
                                           (#4#
                                            (CONS 1 "failed"))))))))))))))))))) 

(SDEFUN |LAPLACE;aexp|
        ((|f| F) (|t| |Symbol|)
         ($ |Union| (|Record| (|:| |coef| F) (|:| |coef1| F) (|:| |coef0| F))
          #1="failed"))
        (SPROG
         ((#2=#:G877 NIL) (#3=#:G878 NIL)
          (|rec| (|Record| (|:| |coef| F) (|:| |coef1| F) (|:| |coef0| F)))
          (|r|
           (|Union| (|Record| (|:| |coef| F) (|:| |coef1| F) (|:| |coef0| F))
                    #1#))
          (|w| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|))))
          (|v|
           (|Union| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|)))
                    #4="failed"))
          (|c| (F)) (|c1| (F)) (|c0| (F)) (#5=#:G879 NIL) (|g| NIL)
          (|u| (|Union| (|List| F) #4#)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |f| '|exp| (QREFELT $ 78))
             (SEQ
              (LETT |v|
                    (|LAPLACE;isLinear|
                     (|SPADfirst|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 79)) (QREFELT $ 68)))
                     |t| $)
                    . #6=(|LAPLACE;aexp|))
              (EXIT
               (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                     (#7='T
                      (CONS 0
                            (VECTOR (|spadConstant| $ 64) (QCDR (QCDR |v|))
                                    (QCAR (QCDR |v|)))))))))
            (#7#
             (SEQ (LETT |u| (SPADCALL |f| (QREFELT $ 66)) . #6#)
                  (EXIT
                   (COND
                    ((QEQCAR |u| 0)
                     (SEQ (LETT |c| (|spadConstant| $ 64) . #6#)
                          (LETT |c1| (LETT |c0| (|spadConstant| $ 80) . #6#)
                                . #6#)
                          (SEQ (LETT |g| NIL . #6#) (LETT #5# (QCDR |u|) . #6#)
                               G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |g| (CAR #5#) . #6#) NIL))
                                 (GO G191)))
                               (SEQ (LETT |r| (|LAPLACE;aexp| |g| |t| $) . #6#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |r| 0)
                                       (SEQ (LETT |rec| (QCDR |r|) . #6#)
                                            (LETT |c|
                                                  (SPADCALL |c| (QVELT |rec| 0)
                                                            (QREFELT $ 36))
                                                  . #6#)
                                            (LETT |c0|
                                                  (SPADCALL |c0|
                                                            (QVELT |rec| 2)
                                                            (QREFELT $ 81))
                                                  . #6#)
                                            (EXIT
                                             (LETT |c1|
                                                   (SPADCALL |c1|
                                                             (QVELT |rec| 1)
                                                             (QREFELT $ 81))
                                                   . #6#))))
                                      ('T
                                       (LETT |c|
                                             (SPADCALL |c| |g| (QREFELT $ 36))
                                             . #6#)))))
                               (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                               (EXIT NIL))
                          (COND
                           ((SPADCALL |c0| (QREFELT $ 82))
                            (COND
                             ((SPADCALL |c1| (QREFELT $ 82))
                              (EXIT (CONS 1 "failed"))))))
                          (EXIT (CONS 0 (VECTOR |c| |c1| |c0|)))))
                    (#7#
                     (SEQ
                      (SEQ (LETT |v| (SPADCALL |f| (QREFELT $ 85)) . #6#)
                           (EXIT
                            (COND
                             ((QEQCAR |v| 0)
                              (SEQ (LETT |w| (QCDR |v|) . #6#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL (QCDR |w|) 1 (QREFELT $ 86))
                                      (SEQ
                                       (EXIT
                                        (SEQ
                                         (LETT |r|
                                               (|LAPLACE;aexp| (QCAR |w|) |t|
                                                $)
                                               . #6#)
                                         (EXIT
                                          (COND
                                           ((QEQCAR |r| 0)
                                            (PROGN
                                             (LETT #2#
                                                   (SEQ
                                                    (LETT |rec| (QCDR |r|)
                                                          . #6#)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #3#
                                                            (CONS 0
                                                                  (VECTOR
                                                                   (SPADCALL
                                                                    (QVELT
                                                                     |rec| 0)
                                                                    (QCDR |w|)
                                                                    (QREFELT $
                                                                             87))
                                                                   (SPADCALL
                                                                    (QCDR |w|)
                                                                    (QVELT
                                                                     |rec| 1)
                                                                    (QREFELT $
                                                                             88))
                                                                   (SPADCALL
                                                                    (QCDR |w|)
                                                                    (QVELT
                                                                     |rec| 2)
                                                                    (QREFELT $
                                                                             88))))
                                                            . #6#)
                                                      (GO #8=#:G876))))
                                                   . #6#)
                                             (GO #9=#:G870)))))))
                                       #9# (EXIT #2#))))))))))
                      (EXIT (CONS 1 "failed"))))))))))
          #8# (EXIT #3#)))) 

(SDEFUN |LAPLACE;mkPlus| ((|f| F) ($ |Union| (|List| F) "failed"))
        (SPROG
         ((#1=#:G894 NIL) (|p| NIL) (#2=#:G893 NIL)
          (|d| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F)))
                    "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |f| (QREFELT $ 90)) (QREFELT $ 92))
                . #3=(|LAPLACE;mkPlus|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 93)) . #3#)
                       (EXIT
                        (CONS 0
                              (PROGN
                               (LETT #2# NIL . #3#)
                               (SEQ (LETT |p| NIL . #3#)
                                    (LETT #1# (QCDR |u|) . #3#) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |p| (CAR #1#) . #3#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL |p| |d| (QREFELT $ 94))
                                             #2#)
                                            . #3#)))
                                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))))))))))) 

(SDEFUN |LAPLACE;tdenom| ((|f| F) (|t| F) ($ |Union| F "failed"))
        (COND
         ((QEQCAR
           (SPADCALL (SPADCALL |f| (QREFELT $ 93))
                     (SPADCALL |t| (QREFELT $ 90)) (QREFELT $ 96))
           1)
          (CONS 1 "failed"))
         ('T (CONS 0 (SPADCALL |t| |f| (QREFELT $ 36)))))) 

(SDEFUN |LAPLACE;intlaplace|
        ((|f| F) (|ss| F) (|g| F) (|v| |Symbol|) (|vv| F)
         ($ |Union| F "failed"))
        (SPROG
         ((|l1| #1=(|SingleInteger|)) (|u1| #1#) (|ll| (|OrderedCompletion| F))
          (|uu| (|OrderedCompletion| F))
          (|l|
           #2=(|Union| (|OrderedCompletion| F)
                       (|Record|
                        (|:| |leftHandLimit|
                             (|Union| (|OrderedCompletion| F) #3="failed"))
                        (|:| |rightHandLimit|
                             (|Union| (|OrderedCompletion| F) #3#)))
                       "failed"))
          (|u| #2#) (#4=#:G915 NIL) (|i| (|Union| F (|List| F))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |g| (QREFELT $ 13) (QREFELT $ 97))
              (EXIT (CONS 1 #5="failed")))
             (#6='T
              (SEQ
               (LETT |i| (SPADCALL |g| |v| (QREFELT $ 100))
                     . #7=(|LAPLACE;intlaplace|))
               (EXIT
                (COND
                 ((QEQCAR |i| 1)
                  (PROGN (LETT #4# (CONS 1 #5#) . #7#) (GO #8=#:G913))))))))
            (LETT |u|
                  (SPADCALL (QCDR |i|)
                            (SPADCALL (SPADCALL |vv| (QREFELT $ 102))
                                      (SPADCALL (QREFELT $ 103))
                                      (QREFELT $ 105))
                            (QREFELT $ 110))
                  . #7#)
            (EXIT
             (COND
              ((QEQCAR |u| 0)
               (SEQ
                (LETT |l|
                      (SPADCALL (QCDR |i|)
                                (SPADCALL (SPADCALL |vv| (QREFELT $ 102))
                                          (SPADCALL |ss| (QREFELT $ 102))
                                          (QREFELT $ 105))
                                (QREFELT $ 110))
                      . #7#)
                (EXIT
                 (COND
                  ((QEQCAR |l| 0)
                   (SEQ (LETT |uu| (QCDR |u|) . #7#)
                        (LETT |ll| (QCDR |l|) . #7#)
                        (LETT |u1| (SPADCALL |uu| (QREFELT $ 112)) . #7#)
                        (LETT |l1| (SPADCALL |ll| (QREFELT $ 112)) . #7#)
                        (COND
                         ((|eql_SI| |u1| 0)
                          (COND
                           ((|eql_SI| |l1| 0)
                            (EXIT
                             (CONS 0
                                   (SPADCALL (SPADCALL |uu| (QREFELT $ 114))
                                             (SPADCALL |ll| (QREFELT $ 114))
                                             (QREFELT $ 115))))))))
                        (EXIT (CONS 1 "failed"))))
                  (#6# (CONS 1 "failed"))))))
              (#6# (CONS 1 "failed"))))))
          #8# (EXIT #4#)))) 

(SDEFUN |LAPLACE;lapkernel|
        ((|f| F) (|t| |Symbol|) (|tt| F) (|ss| F) ($ |Union| F "failed"))
        (SPROG
         ((|op| (|BasicOperator|)) (|a| (F)) (|s| (|Symbol|)) (|fint| (F))
          (|arg| (|List| F)) (|k| (|Union| (|Kernel| F) "failed")))
         (SEQ
          (LETT |k| (SPADCALL |f| (QREFELT $ 117)) . #1=(|LAPLACE;lapkernel|))
          (EXIT
           (COND
            ((OR (QEQCAR |k| 1)
                 (NULL
                  (LETT |arg| (SPADCALL (QCDR |k|) (QREFELT $ 68)) . #1#)))
             (CONS 1 "failed"))
            ((SPADCALL (LETT |op| (SPADCALL (QCDR |k|) (QREFELT $ 29)) . #1#)
                       '|%diff| (QREFELT $ 118))
             (COND
              ((OR (NULL (EQL (LENGTH |arg|) 3))
                   (NULL
                    (SPADCALL (SPADCALL |arg| 3 (QREFELT $ 69)) |t|
                              (QREFELT $ 78))))
               (CONS 1 "failed"))
              ('T
               (SEQ
                (LETT |fint|
                      (SPADCALL (SPADCALL |arg| 1 (QREFELT $ 69))
                                (SPADCALL |arg| 2 (QREFELT $ 69)) |tt|
                                (QREFELT $ 119))
                      . #1#)
                (LETT |s|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |ss| (QREFELT $ 19)) 1
                                  (QREFELT $ 77))
                        (QREFELT $ 29))
                       (QREFELT $ 120))
                      . #1#)
                (EXIT
                 (CONS 0
                       (SPADCALL
                        (SPADCALL |ss|
                                  (|LAPLACE;locallaplace| |fint| |t| |tt| |s|
                                   |ss| $)
                                  (QREFELT $ 36))
                        (SPADCALL |fint|
                                  (SPADCALL |tt| (|spadConstant| $ 80)
                                            (QREFELT $ 123))
                                  (QREFELT $ 125))
                        (QREFELT $ 115))))))))
            ((NULL (NULL (CDR |arg|))) (CONS 1 "failed"))
            ((OR (SPADCALL |op| '|erf| (QREFELT $ 118))
                 (OR (SPADCALL |op| '|fresnelS| (QREFELT $ 118))
                     (SPADCALL |op| '|fresnelC| (QREFELT $ 118))))
             (COND
              ((SPADCALL |t|
                         (SPADCALL
                          (LETT |a|
                                (SPADCALL (|SPADfirst| |arg|)
                                          (SPADCALL |tt| (QREFELT $ 126))
                                          (QREFELT $ 41))
                                . #1#)
                          (QREFELT $ 74))
                         (QREFELT $ 75))
               (CONS 1 "failed"))
              (#2='T
               (SEQ
                (LETT |s|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |ss| (QREFELT $ 19)) 1
                                  (QREFELT $ 77))
                        (QREFELT $ 29))
                       (QREFELT $ 120))
                      . #1#)
                (EXIT
                 (CONS 0
                       (SPADCALL
                        (SPADCALL (SPADCALL |f| |t| (QREFELT $ 127)) |t| |s|
                                  (QREFELT $ 17))
                        |ss| (QREFELT $ 41))))))))
            ('T
             (COND
              ((SPADCALL |t|
                         (SPADCALL
                          (LETT |a|
                                (SPADCALL (|SPADfirst| |arg|) |tt|
                                          (QREFELT $ 41))
                                . #1#)
                          (QREFELT $ 74))
                         (QREFELT $ 75))
               (CONS 1 "failed"))
              ((SPADCALL (LETT |op| (SPADCALL (QCDR |k|) (QREFELT $ 29)) . #1#)
                         '|Si| (QREFELT $ 118))
               (CONS 0
                     (SPADCALL
                      (SPADCALL (SPADCALL |a| |ss| (QREFELT $ 41))
                                (QREFELT $ 128))
                      |ss| (QREFELT $ 41))))
              ((SPADCALL |op| '|Ci| (QREFELT $ 118))
               (CONS 0
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |ss| 2 (QREFELT $ 130))
                                  (SPADCALL |a| 2 (QREFELT $ 130))
                                  (QREFELT $ 81))
                        (SPADCALL |a| 2 (QREFELT $ 130)) (QREFELT $ 41))
                       (QREFELT $ 131))
                      (SPADCALL 2 |ss| (QREFELT $ 132)) (QREFELT $ 41))))
              ((SPADCALL |op| '|Ei| (QREFELT $ 118))
               (CONS 0
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |ss| |a| (QREFELT $ 81)) |a|
                                 (QREFELT $ 41))
                       (QREFELT $ 131))
                      |ss| (QREFELT $ 41))))
              (#2#
               (SEQ
                (COND
                 ((|HasCategory| (QREFELT $ 7) '(|SpecialFunctionCategory|))
                  (COND
                   ((SPADCALL |op| '|log| (QREFELT $ 118))
                    (EXIT
                     (CONS 0
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 64) (QREFELT $ 133))
                              (SPADCALL |a| (QREFELT $ 131)) (QREFELT $ 115))
                             (SPADCALL |ss| (QREFELT $ 131)) (QREFELT $ 115))
                            |ss| (QREFELT $ 41))))))))
                (EXIT (CONS 1 "failed"))))))))))) 

(SDEFUN |LAPLACE;locallaplace|
        ((|f| F) (|t| |Symbol|) (|tt| F) (|s| |Symbol|) (|ss| F) ($ F))
        (SPROG
         ((|x| (|Union| F "failed")) (|res1| (F))
          (|vv2| (|Record| (|:| |coef| F) (|:| |deg| (|NonNegativeInteger|))))
          (|v2|
           (|Union|
            (|Record| (|:| |coef| F) (|:| |deg| (|NonNegativeInteger|)))
            "failed"))
          (|ww| (|Record| (|:| |coef| F) (|:| |coef1| F) (|:| |coef0| F)))
          (|w|
           (|Union| (|Record| (|:| |coef| F) (|:| |coef1| F) (|:| |coef0| F))
                    "failed"))
          (|la| (F))
          (|vv| (|Record| (|:| |coef| F) (|:| |deg| (|PositiveInteger|))))
          (|v|
           (|Union| (|Record| (|:| |coef| F) (|:| |deg| (|PositiveInteger|)))
                    "failed"))
          (|rec| (|Record| (|:| |const| F) (|:| |nconst| F))) (#1=#:G947 NIL)
          (#2=#:G946 (F)) (#3=#:G948 (F)) (#4=#:G970 NIL) (|g| (F))
          (|u| (|Union| (|List| F) "failed")) (|vvv| (F)))
         (SEQ
          (COND ((SPADCALL |f| (QREFELT $ 82)) (|spadConstant| $ 80))
                ((SPADCALL |f| (|spadConstant| $ 64) (QREFELT $ 121))
                 (SPADCALL |ss| (QREFELT $ 134)))
                (#5='T
                 (SEQ
                  (LETT |x| (|LAPLACE;tdenom| |f| |tt| $)
                        . #6=(|LAPLACE;locallaplace|))
                  (EXIT
                   (COND
                    ((QEQCAR |x| 0)
                     (SEQ
                      (LETT |g|
                            (|LAPLACE;locallaplace| (QCDR |x|) |t| |tt|
                             (LETT |vv| (SPADCALL (QREFELT $ 135)) . #6#)
                             (LETT |vvv| (SPADCALL |vv| (QREFELT $ 16)) . #6#)
                             $)
                            . #6#)
                      (LETT |x|
                            (|LAPLACE;intlaplace| |f| |ss| |g| |vv| |vvv| $)
                            . #6#)
                      (EXIT
                       (COND ((QEQCAR |x| 0) (QCDR |x|))
                             (#5#
                              (SPADCALL (QREFELT $ 13) |f| |tt| |ss|
                                        (QREFELT $ 37)))))))
                    (#5#
                     (SEQ (LETT |u| (|LAPLACE;mkPlus| |f| $) . #6#)
                          (EXIT
                           (COND
                            ((QEQCAR |u| 0)
                             (PROGN
                              (LETT #1# NIL . #6#)
                              (SEQ (LETT |g| NIL . #6#)
                                   (LETT #4# (QCDR |u|) . #6#) G190
                                   (COND
                                    ((OR (ATOM #4#)
                                         (PROGN
                                          (LETT |g| (CAR #4#) . #6#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (PROGN
                                      (LETT #3#
                                            (|LAPLACE;locallaplace| |g| |t|
                                             |tt| |s| |ss| $)
                                            . #6#)
                                      (COND
                                       (#1#
                                        (LETT #2#
                                              (SPADCALL #2# #3# (QREFELT $ 81))
                                              . #6#))
                                       ('T
                                        (PROGN
                                         (LETT #2# #3# . #6#)
                                         (LETT #1# 'T . #6#)))))))
                                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                                   (EXIT NIL))
                              (COND (#1# #2#) (#5# (|spadConstant| $ 80)))))
                            ((SPADCALL
                              (QCAR
                               (LETT |rec| (SPADCALL |f| |t| (QREFELT $ 138))
                                     . #6#))
                              (|spadConstant| $ 64) (QREFELT $ 71))
                             (SPADCALL (QCAR |rec|)
                                       (|LAPLACE;locallaplace| (QCDR |rec|) |t|
                                        |tt| |s| |ss| $)
                                       (QREFELT $ 36)))
                            (#5#
                             (SEQ (LETT |v| (|LAPLACE;atn| |f| |t| $) . #6#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |v| 0)
                                     (SEQ (LETT |vv| (QCDR |v|) . #6#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL
                                              (LETT |la|
                                                    (|LAPLACE;locallaplace|
                                                     (QCAR |vv|) |t| |tt| |s|
                                                     |ss| $)
                                                    . #6#)
                                              (QREFELT $ 13) (QREFELT $ 97))
                                             (SPADCALL (QREFELT $ 13) |f| |tt|
                                                       |ss| (QREFELT $ 37)))
                                            (#5#
                                             (SPADCALL (EXPT -1 (QCDR |vv|))
                                                       (SPADCALL |la| |s|
                                                                 (QCDR |vv|)
                                                                 (QREFELT $
                                                                          139))
                                                       (QREFELT $ 88)))))))
                                    (#5#
                                     (SEQ
                                      (LETT |w| (|LAPLACE;aexp| |f| |t| $)
                                            . #6#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |w| 0)
                                         (SEQ (LETT |ww| (QCDR |w|) . #6#)
                                              (EXIT
                                               (SPADCALL
                                                (SPADCALL (QVELT |ww| 2)
                                                          (QREFELT $ 39))
                                                (|LAPLACE;locallaplace|
                                                 (QVELT |ww| 0) |t| |tt| |s|
                                                 (SPADCALL |ss| (QVELT |ww| 1)
                                                           (QREFELT $ 115))
                                                 $)
                                                (QREFELT $ 36)))))
                                        (#5#
                                         (SEQ
                                          (LETT |v2|
                                                (|LAPLACE;athalf| |f| |t| $)
                                                . #6#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |v2| 0)
                                             (SEQ
                                              (LETT |vv2| (QCDR |v2|) . #6#)
                                              (LETT |res1|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (QREFELT $ 140))
                                                      (QREFELT $ 126))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (|spadConstant| $ 64)
                                                       (SPADCALL |ss|
                                                                 (QREFELT $
                                                                          126))
                                                       (QREFELT $ 41))
                                                      |s| (QCDR |vv2|)
                                                      (QREFELT $ 139))
                                                     (QREFELT $ 36))
                                                    . #6#)
                                              (EXIT
                                               (SPADCALL
                                                (SPADCALL
                                                 (EXPT -1 (QCDR |vv2|))
                                                 (QCAR |vv2|) (QREFELT $ 88))
                                                |res1| (QREFELT $ 36)))))
                                            (#5#
                                             (SEQ
                                              (LETT |x|
                                                    (|LAPLACE;lapkernel| |f|
                                                     |t| |tt| |ss| $)
                                                    . #6#)
                                              (EXIT
                                               (COND
                                                ((QEQCAR |x| 0) (QCDR |x|))
                                                (#5#
                                                 (SPADCALL (QREFELT $ 13) |f|
                                                           |tt| |ss|
                                                           (QREFELT $
                                                                    37))))))))))))))))))))))))))))))) 

(DECLAIM (NOTINLINE |LaplaceTransform;|)) 

(DEFUN |LaplaceTransform| (&REST #1=#:G975)
  (SPROG NIL
         (PROG (#2=#:G976)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LaplaceTransform|)
                                               '|domainEqualList|)
                    . #3=(|LaplaceTransform|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LaplaceTransform;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|LaplaceTransform|)))))))))) 

(DEFUN |LaplaceTransform;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|LaplaceTransform|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|LaplaceTransform| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 143) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|LaplaceTransform| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|%alg|)
          (QSETREFV $ 13 (SPADCALL '|laplace| 3 (QREFELT $ 12)))
          (SPADCALL (QREFELT $ 13) '|%specialDiff|
                    (CONS (|function| |LAPLACE;dvlap|) $) (QREFELT $ 142))
          $))) 

(MAKEPROP '|LaplaceTransform| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              (|Symbol|) (|NonNegativeInteger|) (|BasicOperator|)
              (0 . |operator|) '|oplap| (|TrigonometricManipulations| 6 7)
              (6 . |complexElementary|) (12 . |coerce|)
              |LAPLACE;laplace;F2SF;1| (|List| 44) (17 . |kernels|) (|List| 24)
              (|IntegrationTools| 6 7) (22 . |varselect|) (28 . |max|)
              (|Kernel| 7) (34 . |height|) (|Mapping| 10 10 10) (|List| 10)
              (39 . |reduce|) (46 . |operator|) (|Boolean|) (51 . |has?|)
              (|List| 7) (57 . |second|) (62 . |third|) (67 . |retract|)
              (72 . *) (78 . |elt|) (86 . -) (91 . |exp|)
              (96 . |differentiate|) (102 . /) (108 . |kernel|)
              (|Fraction| (|SparseUnivariatePolynomial| $)) (|Kernel| $)
              (113 . |univariate|) (|SparseUnivariatePolynomial| 7)
              (|Fraction| 46) (119 . |denom|) (|Union| 7 '"failed")
              (124 . |retractIfCan|) (129 . |numer|) (134 . |degree|) (139 . >)
              (145 . |coefficient|) (151 . |freeOf?|)
              (|Record| (|:| |var| 44) (|:| |exponent| 59))
              (|Union| 56 '#1="failed") (157 . |isExpt|) (|Integer|) (162 . >)
              (|Union| 9 '"failed") (168 . |symbolIfCan|) (173 . |One|)
              (177 . |One|) (|Union| (|List| $) '#1#) (181 . |isTimes|)
              (186 . |is?|) (192 . |argument|) (197 . |elt|) (203 . |coerce|)
              (208 . ~=) (214 . |coerce|) (|List| 9) (219 . |variables|)
              (224 . |member?|) (230 . |sort|) (235 . |elt|) (241 . |is?|)
              (247 . |retract|) (252 . |Zero|) (256 . +) (262 . |zero?|)
              (|Record| (|:| |val| $) (|:| |exponent| 59)) (|Union| 83 '#1#)
              (267 . |isPower|) (272 . ~=) (278 . ^) (284 . *)
              (|SparseMultivariatePolynomial| 6 44) (290 . |numer|)
              (|SparseMultivariatePolynomial| 6 24) (295 . |isPlus|)
              (300 . |denom|) (305 . /) (|Union| $ '"failed") (311 . |exquo|)
              (317 . |is?|) (|Union| 7 32) (|FunctionSpaceIntegration| 6 7)
              (323 . |integrate|) (|OrderedCompletion| 7) (329 . |coerce|)
              (334 . |plusInfinity|) (|Equation| 101) (338 . |equation|)
              (|Union| 101 '"failed")
              (|Record| (|:| |leftHandLimit| 106) (|:| |rightHandLimit| 106))
              (|Union| 101 107 '"failed") (|PowerSeriesLimitPackage| 6 7)
              (344 . |limit|) (|SingleInteger|) (350 . |whatInfinity|)
              (355 . |Zero|) (359 . |retract|) (364 . -) (|Union| 44 '"failed")
              (370 . |retractIfCan|) (375 . |is?|) (381 . |eval|)
              (388 . |name|) (393 . =) (|Equation| 7) (399 . =) (|Equation| $)
              (405 . |eval|) (411 . |sqrt|) (416 . D) (422 . |atan|)
              (|PositiveInteger|) (427 . ^) (433 . |log|) (438 . *)
              (444 . |digamma|) (449 . |inv|) (454 . |new|)
              (|Record| (|:| |const| 7) (|:| |nconst| 7))
              (|PatternMatchIntegration| 6 7) (458 . |splitConstant|)
              (464 . |differentiate|) (471 . |pi|) (|None|)
              (475 . |setProperty|))
           '#(|laplace| 482) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 142
                                                 '(2 11 0 9 10 12 2 14 7 7 9 15
                                                   1 7 0 9 16 1 7 18 0 19 2 21
                                                   20 20 9 22 2 10 0 0 0 23 1
                                                   24 10 0 25 3 27 10 26 0 10
                                                   28 1 24 11 0 29 2 11 30 0 9
                                                   31 1 32 7 0 33 1 32 7 0 34 1
                                                   7 9 0 35 2 7 0 0 0 36 4 7 0
                                                   11 0 0 0 37 1 7 0 0 38 1 7 0
                                                   0 39 2 7 0 0 9 40 2 7 0 0 0
                                                   41 1 24 0 9 42 2 7 43 0 44
                                                   45 1 47 46 0 48 1 46 49 0 50
                                                   1 47 46 0 51 1 46 10 0 52 2
                                                   10 30 0 0 53 2 46 7 0 10 54
                                                   2 7 30 0 9 55 1 7 57 0 58 2
                                                   59 30 0 0 60 1 24 61 0 62 0
                                                   6 0 63 0 7 0 64 1 7 65 0 66
                                                   2 24 30 0 9 67 1 24 32 0 68
                                                   2 32 7 0 59 69 1 7 0 59 70 2
                                                   7 30 0 0 71 1 7 0 44 72 1 7
                                                   73 0 74 2 73 30 9 0 75 1 20
                                                   0 0 76 2 20 24 0 59 77 2 7
                                                   30 0 9 78 1 7 44 0 79 0 7 0
                                                   80 2 7 0 0 0 81 1 7 30 0 82
                                                   1 7 84 0 85 2 59 30 0 0 86 2
                                                   7 0 0 59 87 2 7 0 59 0 88 1
                                                   7 89 0 90 1 91 65 0 92 1 7
                                                   89 0 93 2 7 0 89 89 94 2 91
                                                   95 0 0 96 2 7 30 0 11 97 2
                                                   99 98 7 9 100 1 101 0 7 102
                                                   0 101 0 103 2 104 0 101 101
                                                   105 2 109 108 7 104 110 1
                                                   101 111 0 112 0 6 0 113 1
                                                   101 7 0 114 2 7 0 0 0 115 1
                                                   7 116 0 117 2 11 30 0 9 118
                                                   3 7 0 0 0 0 119 1 11 9 0 120
                                                   2 7 30 0 0 121 2 122 0 7 7
                                                   123 2 7 0 0 124 125 1 7 0 0
                                                   126 2 7 0 0 9 127 1 7 0 0
                                                   128 2 7 0 0 129 130 1 7 0 0
                                                   131 2 7 0 129 0 132 1 7 0 0
                                                   133 1 7 0 0 134 0 9 0 135 2
                                                   137 136 7 9 138 3 7 0 0 9 10
                                                   139 0 7 0 140 3 11 0 0 9 141
                                                   142 3 0 7 7 9 9 17)))))
           '|lookupComplete|)) 
