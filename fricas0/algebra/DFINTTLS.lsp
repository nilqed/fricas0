
(SDEFUN |DFINTTLS;variation|
        ((|p| |SparseUnivariatePolynomial| F) (|a| F)
         ($ |Union| (|Integer|) "failed"))
        (|DFINTTLS;var|
         (SPADCALL |p|
                   (SPADCALL (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 12))
                             (SPADCALL |a| (QREFELT $ 13)) (QREFELT $ 14))
                   (QREFELT $ 15))
         $)) 

(SDEFUN |DFINTTLS;keeprec?|
        ((|a| |Fraction| (|Integer|))
         (|rec| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         ($ |Boolean|))
        (COND ((SPADCALL |a| (QCDR |rec|) (QREFELT $ 18)) 'T)
              ('T (SPADCALL |a| (QCAR |rec|) (QREFELT $ 19))))) 

(SDEFUN |DFINTTLS;checkHalfAx|
        ((|p| |SparseUnivariatePolynomial| F) (|a| F) (|d| |Integer|)
         (|incl?| |Boolean|) ($ |Union| (|Boolean|) "failed"))
        (|DFINTTLS;posRoot|
         (SPADCALL |p|
                   (SPADCALL |d|
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 12))
                              (SPADCALL |a| (QREFELT $ 13)) (QREFELT $ 14))
                             (QREFELT $ 21))
                   (QREFELT $ 15))
         |incl?| $)) 

(SDEFUN |DFINTTLS;ignore?;SB;4| ((|str| |String|) ($ |Boolean|))
        (COND ((EQUAL |str| "noPole") 'T)
              ('T (|error| "integrate: last argument must be 'noPole'")))) 

(SDEFUN |DFINTTLS;computeInt;KF2OcBU;5|
        ((|k| |Kernel| F) (|f| F) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) (|eval?| |Boolean|)
         ($ |Union| (|OrderedCompletion| F) "failed"))
        (SPROG
         ((#1=#:G750 NIL) (|ia| #2=(|Union| (|OrderedCompletion| F) "failed"))
          (|ib| #2#))
         (SEQ
          (COND ((SPADCALL |f| '|integral| (QREFELT $ 25)) (CONS 1 "failed"))
                (#3='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (COND
                     ((NULL |eval?|)
                      (LETT |f| (|DFINTTLS;mkLogPos| |f| $)
                            . #4=(|DFINTTLS;computeInt;KF2OcBU;5|))))
                    (SEQ
                     (LETT |ib|
                           (|DFINTTLS;findLimit| |f| |k| |b| "left" |eval?| $)
                           . #4#)
                     (EXIT
                      (COND
                       ((QEQCAR |ib| 1)
                        (PROGN
                         (LETT #1# (CONS 1 #5="failed") . #4#)
                         (GO #6=#:G744)))
                       (#3#
                        (SEQ
                         (LETT |ia|
                               (|DFINTTLS;findLimit| |f| |k| |a| "right"
                                |eval?| $)
                               . #4#)
                         (EXIT
                          (COND
                           ((QEQCAR |ia| 1)
                            (PROGN
                             (LETT #1# (CONS 1 #5#) . #4#)
                             (GO #6#))))))))))
                    (COND
                     ((SPADCALL (QCDR |ia|) (QREFELT $ 27))
                      (COND
                       ((SPADCALL (QCDR |ia|) (QCDR |ib|) (QREFELT $ 28))
                        (EXIT (CONS 1 "failed"))))))
                    (EXIT
                     (CONS 0
                           (SPADCALL (QCDR |ib|)
                                     (SPADCALL (QCDR |ia|) (QREFELT $ 29))
                                     (QREFELT $ 30))))))
                  #6# (EXIT #1#))))))) 

(SDEFUN |DFINTTLS;findLimit|
        ((|f| F) (|k| |Kernel| F) (|a| |OrderedCompletion| F) (|dir| |String|)
         (|eval?| |Boolean|) ($ |Union| (|OrderedCompletion| F) "failed"))
        (SPROG
         ((|u|
           (|Union| (|OrderedCompletion| F)
                    (|Record|
                     (|:| |leftHandLimit|
                          (|Union| (|OrderedCompletion| F) #1="failed"))
                     (|:| |rightHandLimit|
                          (|Union| (|OrderedCompletion| F) #1#)))
                    "failed"))
          (|r| (|Union| F "failed")))
         (SEQ
          (LETT |r| (SPADCALL |a| (QREFELT $ 35)) . #2=(|DFINTTLS;findLimit|))
          (EXIT
           (COND
            ((QEQCAR |r| 0)
             (COND
              (|eval?|
               (CONS 0
                     (SPADCALL
                      (|DFINTTLS;mkLogPos|
                       (SPADCALL |f| |k| (QCDR |r|) (QREFELT $ 37)) $)
                      (QREFELT $ 38))))
              (#3='T
               (SEQ
                (LETT |u|
                      (SPADCALL |f|
                                (SPADCALL (SPADCALL |k| (QREFELT $ 39))
                                          (QCDR |r|) (QREFELT $ 41))
                                |dir| (QREFELT $ 43))
                      . #2#)
                (EXIT
                 (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                       (#3# (CONS 1 "failed"))))))))
            (#3#
             (SEQ
              (LETT |u|
                    (SPADCALL |f|
                              (SPADCALL
                               (SPADCALL (SPADCALL |k| (QREFELT $ 39))
                                         (QREFELT $ 38))
                               |a| (QREFELT $ 45))
                              (QREFELT $ 48))
                    . #2#)
              (EXIT
               (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                     (#3# (CONS 1 "failed"))))))))))) 

(SDEFUN |DFINTTLS;mkLogPos| ((|f| F) ($ F))
        (SPROG
         ((|lv| (|List| F)) (|lk| (|List| (|Kernel| F)))
          (|v| (|Union| F "positive")) (#1=#:G782 NIL) (|k| NIL))
         (SEQ (LETT |lk| NIL . #2=(|DFINTTLS;mkLogPos|)) (LETT |lv| NIL . #2#)
              (SEQ (LETT |k| NIL . #2#)
                   (LETT #1# (SPADCALL |f| (QREFELT $ 50)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |k| '|log| (QREFELT $ 51))
                       (SEQ (LETT |v| (|DFINTTLS;mkKerPos| |k| $) . #2#)
                            (EXIT
                             (COND
                              ((QEQCAR |v| 0)
                               (SEQ (LETT |lk| (CONS |k| |lk|) . #2#)
                                    (EXIT
                                     (LETT |lv| (CONS (QCDR |v|) |lv|)
                                           . #2#)))))))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |f| |lk| |lv| (QREFELT $ 53)))))) 

(SDEFUN |DFINTTLS;mkKerPos| ((|k| |Kernel| F) ($ |Union| F "positive"))
        (SPROG ((|u| (|Union| (|Boolean|) "failed")) (|f| (F)))
               (SEQ
                (LETT |u|
                      (|DFINTTLS;negative|
                       (LETT |f| (|SPADfirst| (SPADCALL |k| (QREFELT $ 55)))
                             . #1=(|DFINTTLS;mkKerPos|))
                       $)
                      . #1#)
                (EXIT
                 (COND
                  ((QEQCAR |u| 1)
                   (CONS 0
                         (SPADCALL
                          (SPADCALL (SPADCALL |f| 2 (QREFELT $ 57))
                                    (QREFELT $ 58))
                          (SPADCALL 2 (QREFELT $ 59)) (QREFELT $ 60))))
                  ((QCDR |u|)
                   (CONS 0
                         (SPADCALL (SPADCALL |f| (QREFELT $ 61))
                                   (QREFELT $ 58))))
                  ('T (CONS 1 "positive"))))))) 

(SDEFUN |DFINTTLS;negative| ((|f| F) ($ |Union| (|Boolean|) "failed"))
        (SPROG ((|u| (|Union| (|Integer|) "failed")))
               (SEQ
                (LETT |u| (SPADCALL |f| (QREFELT $ 64)) |DFINTTLS;negative|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T (CONS 0 (< (QCDR |u|) 0)))))))) 

(SDEFUN |DFINTTLS;checkForZero;PS2OcBU;10|
        ((|p| |Polynomial| R) (|x| |Symbol|) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) (|incl?| |Boolean|)
         ($ |Union| (|Boolean|) "failed"))
        (SPADCALL
         (SPADCALL (ELT $ 68) (SPADCALL |p| |x| (QREFELT $ 70)) (QREFELT $ 74))
         |a| |b| |incl?| (QREFELT $ 76))) 

(SDEFUN |DFINTTLS;checkForZero;Sup2OcBU;11|
        ((|q| |SparseUnivariatePolynomial| F) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) (|incl?| |Boolean|)
         ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((|u| (|Union| (|Boolean|) "failed")) (#1=#:G828 NIL)
          (|i|
           (|Union|
            (|:| |fin|
                 (|Record| (|:| |left| (|Fraction| (|Integer|)))
                           (|:| |right| (|Fraction| (|Integer|)))))
            (|:| |halfinf|
                 (|Record| (|:| |endpoint| (|Fraction| (|Integer|)))
                           (|:| |dir| (|Integer|))))
            (|:| |all| "all") (|:| |failed| "failed")))
          (|d| (|Union| (|SparseUnivariatePolynomial| (|Integer|)) "failed")))
         (SEQ
          (COND ((SPADCALL |q| (QREFELT $ 78)) (CONS 0 NIL))
                (#2='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ
                     (LETT |d| (|DFINTTLS;maprat| |q| $)
                           . #3=(|DFINTTLS;checkForZero;Sup2OcBU;11|))
                     (EXIT
                      (COND
                       ((QEQCAR |d| 0)
                        (SEQ (LETT |i| (|DFINTTLS;intrat| |a| |b| $) . #3#)
                             (EXIT
                              (COND
                               ((NULL (QEQCAR |i| 3))
                                (PROGN
                                 (LETT #1#
                                       (COND
                                        ((NULL
                                          (|DFINTTLS;findRealZero| (QCDR |d|)
                                           |i| |incl?| $))
                                         (CONS 0 NIL))
                                        (#2# (CONS 0 'T)))
                                       . #3#)
                                 (GO #4=#:G825))))))))))
                    (LETT |u| (|DFINTTLS;checkBudan| |q| |a| |b| |incl?| $)
                          . #3#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 1)
                       (COND (|incl?| (|DFINTTLS;checkDeriv| |q| |a| |b| $))
                             (#2# (CONS 1 "failed"))))
                      (#2# (CONS 0 (QCDR |u|)))))))
                  #4# (EXIT #1#))))))) 

(SDEFUN |DFINTTLS;maprat|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |Union| (|SparseUnivariatePolynomial| (|Integer|)) "failed"))
        (SPROG
         ((|ans| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (#1=#:G842 NIL) (|r| (|Union| (|Fraction| (|Integer|)) "failed"))
          (|c| (F)))
         (SEQ
          (EXIT
           (SEQ (LETT |ans| (|spadConstant| $ 80) . #2=(|DFINTTLS;maprat|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |p| (|spadConstant| $ 81) (QREFELT $ 82)))
                       (GO G191)))
                     (SEQ
                      (LETT |r|
                            (SPADCALL
                             (LETT |c| (SPADCALL |p| (QREFELT $ 83)) . #2#)
                             (QREFELT $ 85))
                            . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |r| 1)
                         (PROGN
                          (LETT #1# (CONS 1 "failed") . #2#)
                          (GO #3=#:G841)))
                        ('T
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL (QCDR |r|)
                                                    (SPADCALL |p|
                                                              (QREFELT $ 86))
                                                    (QREFELT $ 87))
                                          (QREFELT $ 88))
                                . #2#)
                          (EXIT
                           (LETT |p| (SPADCALL |p| (QREFELT $ 89)) . #2#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (CONS 0
                       (SPADCALL (ELT $ 90)
                                 (QCAR (SPADCALL |ans| (QREFELT $ 93)))
                                 (QREFELT $ 97))))))
          #3# (EXIT #1#)))) 

(SDEFUN |DFINTTLS;intrat|
        ((|a| |OrderedCompletion| F) (|b| |OrderedCompletion| F)
         ($ |Union|
          (|:| |fin|
               (|Record| (|:| |left| (|Fraction| (|Integer|)))
                         (|:| |right| (|Fraction| (|Integer|)))))
          (|:| |halfinf|
               (|Record| (|:| |endpoint| (|Fraction| (|Integer|)))
                         (|:| |dir| (|Integer|))))
          (|:| |all| #1="all") (|:| |failed| #2="failed")))
        (SPROG
         ((|t| #3=(|Union| (|Fraction| (|Integer|)) "failed"))
          (|n| (|SingleInteger|)) (|q| #3#) (|r| (|Union| F "failed")))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |n| (SPADCALL |a| (QREFELT $ 99)) . #4=(|DFINTTLS;intrat|))
             0 (QREFELT $ 100))
            (SEQ (LETT |r| (SPADCALL |b| (QREFELT $ 35)) . #4#)
                 (EXIT
                  (COND ((QEQCAR |r| 1) (CONS 2 #1#))
                        (#5='T
                         (SEQ
                          (LETT |q| (SPADCALL (QCDR |r|) (QREFELT $ 85)) . #4#)
                          (EXIT
                           (COND ((QEQCAR |q| 1) (CONS 3 #2#))
                                 (#5# (CONS 1 (CONS (QCDR |q|) |n|)))))))))))
           (#5#
            (SEQ
             (LETT |q| (SPADCALL (SPADCALL |a| (QREFELT $ 101)) (QREFELT $ 85))
                   . #4#)
             (EXIT
              (COND ((QEQCAR |q| 1) (CONS 3 #2#))
                    ((SPADCALL (LETT |n| (SPADCALL |b| (QREFELT $ 99)) . #4#) 0
                               (QREFELT $ 100))
                     (CONS 1 (CONS (QCDR |q|) |n|)))
                    (#5#
                     (SEQ
                      (LETT |t|
                            (SPADCALL (SPADCALL |b| (QREFELT $ 101))
                                      (QREFELT $ 85))
                            . #4#)
                      (EXIT
                       (COND ((QEQCAR |t| 1) (CONS 3 #2#))
                             (#5#
                              (CONS 0 (CONS (QCDR |q|) (QCDR |t|)))))))))))))))) 

(SDEFUN |DFINTTLS;findRealZero|
        ((|p| |SparseUnivariatePolynomial| (|Integer|))
         (|i| |Union|
          (|:| |fin|
               #1=(|Record| (|:| |left| (|Fraction| (|Integer|)))
                            (|:| |right| (|Fraction| (|Integer|)))))
          (|:| |halfinf|
               (|Record| (|:| |endpoint| #2=(|Fraction| (|Integer|)))
                         (|:| |dir| (|Integer|))))
          (|:| |all| #3="all") (|:| |failed| #4="failed"))
         (|incl?| |Boolean|)
         ($ |List|
          (|Record| (|:| |left| #5=(|Fraction| (|Integer|)))
                    (|:| |right| #6=(|Fraction| (|Integer|))))))
        (SPROG
         ((|ep| #2#) (#7=#:G865 NIL)
          (|l|
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (#8=#:G879 NIL)
          (|u|
           (|Union|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))
            #9="failed"))
          (#10=#:G891 NIL) (|t| NIL) (#11=#:G890 NIL)
          (|bounds|
           (|Record| (|:| |left| (|Fraction| (|Integer|)))
                     (|:| |right| (|Fraction| (|Integer|)))))
          (#12=#:G875 NIL) (#13=#:G874 #5#) (#14=#:G876 #5#) (#15=#:G889 NIL)
          (#16=#:G872 NIL) (#17=#:G871 #6#) (#18=#:G873 #6#) (#19=#:G888 NIL)
          (|r| #1#))
         (SEQ
          (LETT |p| (SPADCALL |p| (QREFELT $ 102))
                . #20=(|DFINTTLS;findRealZero|))
          (EXIT
           (COND
            ((QEQCAR |i| 0)
             (SEQ
              (LETT |l|
                    (SPADCALL |p| (LETT |r| (CDR |i|) . #20#) (QREFELT $ 106))
                    . #20#)
              (EXIT
               (COND (|incl?| |l|)
                     (#21='T
                      (SPADCALL
                       (CONS #'|DFINTTLS;findRealZero!0| (VECTOR $ |r|)) |l|
                       (QREFELT $ 108)))))))
            ((QEQCAR |i| 2) (SPADCALL |p| (QREFELT $ 109)))
            ((QEQCAR |i| 1)
             (COND
              ((NULL (LETT |l| (SPADCALL |p| (QREFELT $ 109)) . #20#)) NIL)
              (#21#
               (SEQ
                (LETT |bounds|
                      (COND
                       ((SPADCALL
                         (QCDR
                          (PROG2 (LETT #7# |i| . #20#)
                              (QCDR #7#)
                            (|check_union2| (QEQCAR #7# 1)
                                            (|Record|
                                             (|:| |endpoint|
                                                  (|Fraction| (|Integer|)))
                                             (|:| |dir| (|Integer|)))
                                            (|Union|
                                             (|:| |fin|
                                                  (|Record|
                                                   (|:| |left|
                                                        (|Fraction|
                                                         (|Integer|)))
                                                   (|:| |right|
                                                        (|Fraction|
                                                         (|Integer|)))))
                                             (|:| |halfinf|
                                                  (|Record|
                                                   (|:| |endpoint|
                                                        (|Fraction|
                                                         (|Integer|)))
                                                   (|:| |dir| (|Integer|))))
                                             (|:| |all| #3#)
                                             (|:| |failed| #4#))
                                            #7#)))
                         0 (QREFELT $ 110))
                        (CONS
                         (QCAR
                          (PROG2 (LETT #7# |i| . #20#)
                              (QCDR #7#)
                            (|check_union2| (QEQCAR #7# 1)
                                            (|Record|
                                             (|:| |endpoint|
                                                  (|Fraction| (|Integer|)))
                                             (|:| |dir| (|Integer|)))
                                            (|Union|
                                             (|:| |fin|
                                                  (|Record|
                                                   (|:| |left|
                                                        (|Fraction|
                                                         (|Integer|)))
                                                   (|:| |right|
                                                        (|Fraction|
                                                         (|Integer|)))))
                                             (|:| |halfinf|
                                                  (|Record|
                                                   (|:| |endpoint|
                                                        (|Fraction|
                                                         (|Integer|)))
                                                   (|:| |dir| (|Integer|))))
                                             (|:| |all| #3#)
                                             (|:| |failed| #4#))
                                            #7#)))
                         (PROGN
                          (LETT #16# NIL . #20#)
                          (SEQ (LETT |t| NIL . #20#) (LETT #19# |l| . #20#)
                               G190
                               (COND
                                ((OR (ATOM #19#)
                                     (PROGN (LETT |t| (CAR #19#) . #20#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #18# (QCDR |t|) . #20#)
                                  (COND
                                   (#16#
                                    (LETT #17#
                                          (SPADCALL #17# #18# (QREFELT $ 111))
                                          . #20#))
                                   ('T
                                    (PROGN
                                     (LETT #17# #18# . #20#)
                                     (LETT #16# 'T . #20#)))))))
                               (LETT #19# (CDR #19#) . #20#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#16# #17#) (#21# (|IdentityError| '|max|))))))
                       (#21#
                        (CONS
                         (PROGN
                          (LETT #12# NIL . #20#)
                          (SEQ (LETT |t| NIL . #20#) (LETT #15# |l| . #20#)
                               G190
                               (COND
                                ((OR (ATOM #15#)
                                     (PROGN (LETT |t| (CAR #15#) . #20#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #14# (QCAR |t|) . #20#)
                                  (COND
                                   (#12#
                                    (LETT #13#
                                          (SPADCALL #13# #14# (QREFELT $ 112))
                                          . #20#))
                                   ('T
                                    (PROGN
                                     (LETT #13# #14# . #20#)
                                     (LETT #12# 'T . #20#)))))))
                               (LETT #15# (CDR #15#) . #20#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#12# #13#) (#21# (|IdentityError| '|min|))))
                         (QCAR
                          (PROG2 (LETT #7# |i| . #20#)
                              (QCDR #7#)
                            (|check_union2| (QEQCAR #7# 1)
                                            (|Record|
                                             (|:| |endpoint|
                                                  (|Fraction| (|Integer|)))
                                             (|:| |dir| (|Integer|)))
                                            (|Union|
                                             (|:| |fin|
                                                  (|Record|
                                                   (|:| |left|
                                                        (|Fraction|
                                                         (|Integer|)))
                                                   (|:| |right|
                                                        (|Fraction|
                                                         (|Integer|)))))
                                             (|:| |halfinf|
                                                  (|Record|
                                                   (|:| |endpoint|
                                                        (|Fraction|
                                                         (|Integer|)))
                                                   (|:| |dir| (|Integer|))))
                                             (|:| |all| #3#)
                                             (|:| |failed| #4#))
                                            #7#))))))
                      . #20#)
                (LETT |l|
                      (PROGN
                       (LETT #11# NIL . #20#)
                       (SEQ (LETT |t| NIL . #20#) (LETT #10# |l| . #20#) G190
                            (COND
                             ((OR (ATOM #10#)
                                  (PROGN (LETT |t| (CAR #10#) . #20#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((QEQCAR
                                 (LETT |u|
                                       (SPADCALL |p| |t| |bounds|
                                                 (QREFELT $ 114))
                                       . #20#)
                                 0)
                                (LETT #11#
                                      (CONS
                                       (PROG2 (LETT #8# |u| . #20#)
                                           (QCDR #8#)
                                         (|check_union2| (QEQCAR #8# 0)
                                                         (|Record|
                                                          (|:| |left|
                                                               (|Fraction|
                                                                (|Integer|)))
                                                          (|:| |right|
                                                               (|Fraction|
                                                                (|Integer|))))
                                                         (|Union|
                                                          (|Record|
                                                           (|:| |left|
                                                                (|Fraction|
                                                                 (|Integer|)))
                                                           (|:| |right|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                                          #9#)
                                                         #8#))
                                       #11#)
                                      . #20#)))))
                            (LETT #10# (CDR #10#) . #20#) (GO G190) G191
                            (EXIT (NREVERSE #11#))))
                      . #20#)
                (EXIT
                 (COND (|incl?| |l|)
                       (#21#
                        (SEQ
                         (LETT |ep|
                               (QCAR
                                (PROG2 (LETT #7# |i| . #20#)
                                    (QCDR #7#)
                                  (|check_union2| (QEQCAR #7# 1)
                                                  (|Record|
                                                   (|:| |endpoint|
                                                        (|Fraction|
                                                         (|Integer|)))
                                                   (|:| |dir| (|Integer|)))
                                                  (|Union|
                                                   (|:| |fin|
                                                        (|Record|
                                                         (|:| |left|
                                                              (|Fraction|
                                                               (|Integer|)))
                                                         (|:| |right|
                                                              (|Fraction|
                                                               (|Integer|)))))
                                                   (|:| |halfinf|
                                                        (|Record|
                                                         (|:| |endpoint|
                                                              (|Fraction|
                                                               (|Integer|)))
                                                         (|:| |dir|
                                                              (|Integer|))))
                                                   (|:| |all| #3#)
                                                   (|:| |failed| #4#))
                                                  #7#)))
                               . #20#)
                         (EXIT
                          (SPADCALL
                           (CONS #'|DFINTTLS;findRealZero!1| (VECTOR $ |ep|))
                           |l| (QREFELT $ 108)))))))))))
            (#21# (|error| "findRealZero: should not happpen"))))))) 

(SDEFUN |DFINTTLS;findRealZero!1| ((|s| NIL) ($$ NIL))
        (PROG (|ep| $)
          (LETT |ep| (QREFELT $$ 1) . #1=(|DFINTTLS;findRealZero|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|DFINTTLS;keeprec?| |ep| |s| $))))) 

(SDEFUN |DFINTTLS;findRealZero!0| ((|s| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|DFINTTLS;findRealZero|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((|DFINTTLS;keeprec?| (QCAR |r|) |s| $)
              (|DFINTTLS;keeprec?| (QCDR |r|) |s| $))
             ('T NIL)))))) 

(SDEFUN |DFINTTLS;checkBudan|
        ((|p| |SparseUnivariatePolynomial| F) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) (|incl?| |Boolean|)
         ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((|v| (|Integer|)) (|m| (|Integer|)) (#1=#:G912 NIL)
          (|vb| #2=(|Union| (|Integer|) "failed")) (|va| #2#)
          (|zb?| #3=(|Boolean|)) (|bb| (F)) (#4=#:G896 NIL)
          (|n| (|SingleInteger|)) (#5=#:G913 NIL) (|za?| #3#) (|aa| (F))
          (|r| (|Union| F "failed")))
         (SEQ
          (LETT |r| (SPADCALL |b| (QREFELT $ 35)) . #6=(|DFINTTLS;checkBudan|))
          (EXIT
           (COND
            ((SPADCALL (LETT |n| (SPADCALL |a| (QREFELT $ 99)) . #6#) 0
                       (QREFELT $ 100))
             (COND ((QEQCAR |r| 1) (|DFINTTLS;realRoot| |p| $))
                   (#7='T
                    (|DFINTTLS;checkHalfAx| |p| (QCDR |r|) |n| |incl?| $))))
            (#7#
             (SEQ
              (EXIT
               (SEQ
                (SEQ
                 (LETT |za?|
                       (SPADCALL
                        (SPADCALL |p|
                                  (LETT |aa| (SPADCALL |a| (QREFELT $ 101))
                                        . #6#)
                                  (QREFELT $ 115))
                        (QREFELT $ 116))
                       . #6#)
                 (EXIT
                  (COND
                   (|za?|
                    (COND
                     (|incl?|
                      (PROGN (LETT #5# (CONS 0 'T) . #6#) (GO #8=#:G909))))))))
                (EXIT
                 (COND
                  ((SPADCALL (LETT |n| (SPADCALL |b| (QREFELT $ 99)) . #6#) 0
                             (QREFELT $ 100))
                   (|DFINTTLS;checkHalfAx| |p| |aa| |n| |incl?| $))
                  (#7#
                   (SEQ
                    (EXIT
                     (SEQ
                      (SEQ
                       (LETT |zb?|
                             (SPADCALL
                              (SPADCALL |p|
                                        (LETT |bb|
                                              (PROG2 (LETT #4# |r| . #6#)
                                                  (QCDR #4#)
                                                (|check_union2| (QEQCAR #4# 0)
                                                                (QREFELT $ 7)
                                                                (|Union|
                                                                 (QREFELT $ 7)
                                                                 "failed")
                                                                #4#))
                                              . #6#)
                                        (QREFELT $ 115))
                              (QREFELT $ 116))
                             . #6#)
                       (EXIT
                        (COND
                         (|zb?|
                          (COND
                           (|incl?|
                            (PROGN
                             (LETT #1# (CONS 0 'T) . #6#)
                             (GO #9=#:G908))))))))
                      (SEQ (LETT |va| (|DFINTTLS;variation| |p| |aa| $) . #6#)
                           (EXIT
                            (COND
                             ((QEQCAR |va| 1)
                              (PROGN
                               (LETT #1# (CONS 1 #10="failed") . #6#)
                               (GO #9#)))
                             (#7#
                              (SEQ
                               (LETT |vb| (|DFINTTLS;variation| |p| |bb| $)
                                     . #6#)
                               (EXIT
                                (COND
                                 ((QEQCAR |vb| 1)
                                  (PROGN
                                   (LETT #1# (CONS 1 #10#) . #6#)
                                   (GO #9#))))))))))
                      (LETT |m| 0 . #6#)
                      (COND (|za?| (LETT |m| (+ |m| 1) . #6#)))
                      (COND (|zb?| (LETT |m| (+ |m| 1) . #6#)))
                      (EXIT
                       (COND
                        ((ODDP (LETT |v| (- (QCDR |va|) (QCDR |vb|)) . #6#))
                         (COND
                          ((OR |incl?| (SPADCALL |m| (QREFELT $ 117)))
                           (CONS 0 'T))
                          ((EQL |v| 1) (CONS 0 NIL)) (#7# (CONS 1 "failed"))))
                        ((ZEROP |v|) (CONS 0 NIL)) ((EQL |m| 1) (CONS 0 'T))
                        (#7# (CONS 1 "failed"))))))
                    #9# (EXIT #1#)))))))
              #8# (EXIT #5#)))))))) 

(SDEFUN |DFINTTLS;checkDeriv|
        ((|p| |SparseUnivariatePolynomial| F) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) ($ |Union| (|Boolean|) #1="failed"))
        (SPROG
         ((|u| (|Union| (|Boolean|) #1#)) (|s| (|Union| (|Boolean|) "failed"))
          (|r| (|Union| F "failed")))
         (SEQ
          (LETT |r| (SPADCALL |p| (QREFELT $ 118))
                . #2=(|DFINTTLS;checkDeriv|))
          (EXIT
           (COND
            ((QEQCAR |r| 0) (CONS 0 (SPADCALL (QCDR |r|) (QREFELT $ 116))))
            (#3='T
             (SEQ (LETT |s| (|DFINTTLS;sameSign| |p| |a| |b| $) . #2#)
                  (EXIT
                   (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                         ((QCDR |s|)
                          (SEQ
                           (LETT |u|
                                 (|DFINTTLS;checkDeriv|
                                  (SPADCALL |p| (QREFELT $ 119)) |a| |b| $)
                                 . #2#)
                           (EXIT
                            (COND
                             ((OR (QEQCAR |u| 1) (QCDR |u|)) (CONS 1 "failed"))
                             ('T (CONS 0 NIL))))))
                         (#3# (CONS 0 'T))))))))))) 

(SDEFUN |DFINTTLS;realRoot|
        ((|p| |SparseUnivariatePolynomial| F) ($ |Union| (|Boolean|) "failed"))
        (SPROG ((|b| (|Union| (|Boolean|) "failed")))
               (SEQ
                (LETT |b| (|DFINTTLS;posRoot| |p| 'T $) |DFINTTLS;realRoot|)
                (EXIT
                 (COND ((QEQCAR |b| 1) (CONS 1 "failed"))
                       ((QCDR |b|) (CONS 0 'T))
                       ('T
                        (|DFINTTLS;posRoot|
                         (SPADCALL |p|
                                   (SPADCALL |p|
                                             (SPADCALL (|spadConstant| $ 9) 1
                                                       (QREFELT $ 12))
                                             (QREFELT $ 14))
                                   (QREFELT $ 15))
                         'T $))))))) 

(SDEFUN |DFINTTLS;sameSign|
        ((|p| |SparseUnivariatePolynomial| F) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((|s| (|Union| (|Integer|) "failed")) (|eb| #1=(|Union| F "failed"))
          (|ea| #1#))
         (SEQ
          (LETT |ea| (|DFINTTLS;infeval| |p| |a| $) . #2=(|DFINTTLS;sameSign|))
          (EXIT
           (COND ((QEQCAR |ea| 1) (CONS 1 "failed"))
                 (#3='T
                  (SEQ (LETT |eb| (|DFINTTLS;infeval| |p| |b| $) . #2#)
                       (EXIT
                        (COND ((QEQCAR |eb| 1) (CONS 1 "failed"))
                              (#3#
                               (SEQ
                                (LETT |s|
                                      (SPADCALL
                                       (SPADCALL (QCDR |ea|) (QCDR |eb|)
                                                 (QREFELT $ 120))
                                       (QREFELT $ 64))
                                      . #2#)
                                (EXIT
                                 (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                                       (#3#
                                        (CONS 0
                                              (SPADCALL (QCDR |s|) 0
                                                        (QREFELT $
                                                                 110))))))))))))))))) 

(SDEFUN |DFINTTLS;posRoot|
        ((|p| |SparseUnivariatePolynomial| F) (|incl0?| |Boolean|)
         ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((|v| (|Union| (|Integer|) "failed")) (#1=#:G954 NIL)
          (|z0?| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |z0?|
                   (SPADCALL (SPADCALL |p| 0 (QREFELT $ 121)) (QREFELT $ 116))
                   . #2=(|DFINTTLS;posRoot|))
             (EXIT
              (COND
               (|z0?|
                (COND
                 (|incl0?|
                  (PROGN (LETT #1# (CONS 0 'T) . #2#) (GO #3=#:G952))))))))
            (LETT |v| (|DFINTTLS;var| |p| $) . #2#)
            (EXIT
             (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                   ((ODDP (QCDR |v|))
                    (COND ((OR |incl0?| (NULL |z0?|)) (CONS 0 'T))
                          ((EQL (QCDR |v|) 1) (CONS 0 NIL))
                          (#4='T (CONS 1 "failed"))))
                   ((ZEROP (QCDR |v|)) (CONS 0 NIL)) (|z0?| (CONS 0 'T))
                   (#4# (CONS 1 "failed"))))))
          #3# (EXIT #1#)))) 

(SDEFUN |DFINTTLS;infeval|
        ((|p| |SparseUnivariatePolynomial| F) (|a| |OrderedCompletion| F)
         ($ |Union| F "failed"))
        (SPROG ((|u| (|Union| (|Integer|) "failed")) (|n| (|SingleInteger|)))
               (SEQ
                (COND
                 ((|zero?_SI|
                   (LETT |n| (SPADCALL |a| (QREFELT $ 99))
                         . #1=(|DFINTTLS;infeval|)))
                  (CONS 0
                        (SPADCALL |p| (SPADCALL |a| (QREFELT $ 101))
                                  (QREFELT $ 115))))
                 (#2='T
                  (SEQ
                   (LETT |u| (SPADCALL |p| |n| (ELT $ 64) (QREFELT $ 124))
                         . #1#)
                   (EXIT
                    (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                          (#2#
                           (CONS 0
                                 (SPADCALL (QCDR |u|) (QREFELT $ 59)))))))))))) 

(SDEFUN |DFINTTLS;var|
        ((|q| |SparseUnivariatePolynomial| F) ($ |Union| (|Integer|) "failed"))
        (SPROG
         ((|lastCoef| #1=(|Union| (|Boolean|) "failed")) (|i| (|Integer|))
          (#2=#:G977 NIL) (|next| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |i| 0 . #3=(|DFINTTLS;var|))
                (LETT |lastCoef|
                      (|DFINTTLS;negative| (SPADCALL |q| (QREFELT $ 83)) $)
                      . #3#)
                (EXIT
                 (COND ((QEQCAR |lastCoef| 1) (CONS 1 "failed"))
                       ('T
                        (SEQ
                         (SEQ G190
                              (COND
                               ((NULL
                                 (SPADCALL
                                  (LETT |q| (SPADCALL |q| (QREFELT $ 89))
                                        . #3#)
                                  (|spadConstant| $ 81) (QREFELT $ 82)))
                                (GO G191)))
                              (SEQ
                               (LETT |next|
                                     (|DFINTTLS;negative|
                                      (SPADCALL |q| (QREFELT $ 83)) $)
                                     . #3#)
                               (EXIT
                                (COND
                                 ((QEQCAR |next| 1)
                                  (PROGN
                                   (LETT #2# (CONS 1 "failed") . #3#)
                                   (GO #4=#:G976)))
                                 ('T
                                  (SEQ
                                   (COND
                                    ((QCDR |lastCoef|)
                                     (COND
                                      ((NULL (QCDR |next|))
                                       (COND
                                        ((QCDR |lastCoef|)
                                         (LETT |i| (+ |i| 1) . #3#))))))
                                    ((OR (QCDR |next|) (QCDR |lastCoef|))
                                     (LETT |i| (+ |i| 1) . #3#)))
                                   (EXIT (LETT |lastCoef| |next| . #3#)))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT (CONS 0 |i|))))))))
          #4# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |DefiniteIntegrationTools;|)) 

(DEFUN |DefiniteIntegrationTools| (&REST #1=#:G978)
  (SPROG NIL
         (PROG (#2=#:G979)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|DefiniteIntegrationTools|)
                                               '|domainEqualList|)
                    . #3=(|DefiniteIntegrationTools|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DefiniteIntegrationTools;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|DefiniteIntegrationTools|)))))))))) 

(DEFUN |DefiniteIntegrationTools;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|DefiniteIntegrationTools|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|DefiniteIntegrationTools| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 125) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|DefiniteIntegrationTools|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|DefiniteIntegrationTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 7) (8 . |monomial|) (14 . |coerce|)
              (19 . -) (25 . |elt|) (|Boolean|) (|Fraction| 20) (31 . >)
              (37 . <) (|Integer|) (43 . *) (|String|) |DFINTTLS;ignore?;SB;4|
              (|Symbol|) (49 . |is?|) (|OrderedCompletion| 7)
              (55 . |infinite?|) (60 . =) (66 . -) (71 . +)
              (|Union| 26 '"failed") (|Kernel| 7)
              |DFINTTLS;computeInt;KF2OcBU;5| (|Union| 7 '"failed")
              (77 . |retractIfCan|) (|Kernel| $) (82 . |eval|) (89 . |coerce|)
              (94 . |coerce|) (|Equation| 7) (99 . |equation|)
              (|PowerSeriesLimitPackage| 6 7) (105 . |limit|) (|Equation| 26)
              (112 . |equation|)
              (|Record| (|:| |leftHandLimit| 31) (|:| |rightHandLimit| 31))
              (|Union| 26 46 '"failed") (118 . |limit|) (|List| 36)
              (124 . |kernels|) (129 . |is?|) (|List| $) (135 . |eval|)
              (|List| 7) (142 . |argument|) (|PositiveInteger|) (147 . ^)
              (153 . |log|) (158 . |coerce|) (163 . /) (169 . -)
              (|Union| 20 '"failed") (|ElementaryFunctionSign| 6 7)
              (174 . |sign|) (179 . |Zero|) (183 . |Zero|) (|Polynomial| 6)
              (187 . |coerce|) (|SparseUnivariatePolynomial| $)
              (192 . |univariate|) (|Mapping| 7 67)
              (|SparseUnivariatePolynomial| 67)
              (|SparseUnivariatePolynomialFunctions2| 67 7) (198 . |map|)
              (|Union| 16 '"failed") |DFINTTLS;checkForZero;Sup2OcBU;11|
              |DFINTTLS;checkForZero;PS2OcBU;10| (204 . |ground?|)
              (|SparseUnivariatePolynomial| 17) (209 . |Zero|) (213 . |Zero|)
              (217 . ~=) (223 . |leadingCoefficient|) (|Union| 17 '"failed")
              (228 . |retractIfCan|) (233 . |degree|) (238 . |monomial|)
              (244 . +) (250 . |reductum|) (255 . |numer|)
              (|Record| (|:| |num| 79) (|:| |den| 20))
              (|UnivariatePolynomialCommonDenominator| 20 17 79)
              (260 . |splitDenominator|) (|SparseUnivariatePolynomial| 20)
              (|Mapping| 20 17) (|SparseUnivariatePolynomialFunctions2| 17 20)
              (265 . |map|) (|SingleInteger|) (271 . |whatInfinity|) (276 . ~=)
              (282 . |retract|) (287 . |squareFreePart|)
              (|Record| (|:| |left| 17) (|:| |right| 17)) (|List| 103)
              (|RealZeroPackage| 94) (292 . |realZeros|) (|Mapping| 16 103)
              (298 . |select!|) (304 . |realZeros|) (309 . >) (315 . |max|)
              (321 . |min|) (|Union| 103 '"failed") (327 . |refine|)
              (334 . |elt|) (340 . |zero?|) (345 . |even?|)
              (350 . |retractIfCan|) (355 . |differentiate|) (360 . *)
              (366 . |coefficient|) (|Mapping| 62 7) (|InnerPolySign| 7 11)
              (372 . |signAround|))
           '#(|ignore?| 379 |computeInt| 384 |checkForZero| 393) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 124
                                                 '(0 6 0 8 0 7 0 9 2 11 0 7 10
                                                   12 1 11 0 7 13 2 11 0 0 0 14
                                                   2 11 0 0 0 15 2 17 16 0 0 18
                                                   2 17 16 0 0 19 2 11 0 20 0
                                                   21 2 7 16 0 24 25 1 26 16 0
                                                   27 2 26 16 0 0 28 1 26 0 0
                                                   29 2 26 0 0 0 30 1 26 34 0
                                                   35 3 7 0 0 36 0 37 1 26 0 7
                                                   38 1 7 0 36 39 2 40 0 7 7 41
                                                   3 42 31 7 40 22 43 2 44 0 26
                                                   26 45 2 42 47 7 44 48 1 7 49
                                                   0 50 2 32 16 0 24 51 3 7 0 0
                                                   49 52 53 1 32 54 0 55 2 7 0
                                                   0 56 57 1 7 0 0 58 1 7 0 20
                                                   59 2 7 0 0 0 60 1 7 0 0 61 1
                                                   63 62 7 64 0 6 0 65 0 7 0 66
                                                   1 7 0 67 68 2 67 69 0 24 70
                                                   2 73 11 71 72 74 1 11 16 0
                                                   78 0 79 0 80 0 11 0 81 2 11
                                                   16 0 0 82 1 11 7 0 83 1 7 84
                                                   0 85 1 11 10 0 86 2 79 0 17
                                                   10 87 2 79 0 0 0 88 1 11 0 0
                                                   89 1 17 20 0 90 1 92 91 79
                                                   93 2 96 94 95 79 97 1 26 98
                                                   0 99 2 98 16 0 0 100 1 26 7
                                                   0 101 1 94 0 0 102 2 105 104
                                                   94 103 106 2 104 0 107 0 108
                                                   1 105 104 94 109 2 20 16 0 0
                                                   110 2 17 0 0 0 111 2 17 0 0
                                                   0 112 3 105 113 94 103 103
                                                   114 2 11 7 0 7 115 1 7 16 0
                                                   116 1 20 16 0 117 1 11 34 0
                                                   118 1 11 0 0 119 2 7 0 0 0
                                                   120 2 11 7 0 10 121 3 123 62
                                                   11 20 122 124 1 0 16 22 23 5
                                                   0 31 32 7 26 26 16 33 4 0 75
                                                   11 26 26 16 76 5 0 75 67 24
                                                   26 26 16 77)))))
           '|lookupComplete|)) 
