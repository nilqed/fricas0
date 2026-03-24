
(SDEFUN |SIGNEF;sign;FSOcU;1|
        ((|f| (F)) (|x| (|Symbol|)) (|a| (|OrderedCompletion| F))
         (% (|Union| (|Integer|) "failed")))
        (COND ((NULL (SPADCALL |f| (QREFELT % 10))) (CONS 1 "failed"))
              ('T (|SIGNEF;insign| |f| |x| |a| 0 %)))) 

(SDEFUN |SIGNEF;sign;FSFSU;2|
        ((|f| (F)) (|x| (|Symbol|)) (|a| (F)) (|st| (|String|))
         (% (|Union| (|Integer|) "failed")))
        (COND ((NULL (SPADCALL |f| (QREFELT % 10))) (CONS 1 "failed"))
              ('T (|SIGNEF;psign| |f| |x| |a| |st| 0 %)))) 

(SDEFUN |SIGNEF;sign;FU;3| ((|f| (F)) (% (|Union| (|Integer|) #1="failed")))
        (SPROG
         ((#2=#:G89 NIL) (|r| (|Union| (|Interval| (|Float|)) "failed"))
          (|f2| (|Expression| (|Interval| (|Float|))))
          (|f2u| (|Union| (|Expression| (|Interval| (|Float|))) "failed"))
          (|mapfun| (|Mapping| (|Interval| (|Float|)) R)) (#3=#:G88 NIL)
          (|ud| #4=(|Union| (|Integer|) #1#)) (|un| #4#))
         (SEQ
          (EXIT
           (SEQ
            (EXIT
             (COND ((NULL (SPADCALL |f| (QREFELT % 10))) (CONS 1 "failed"))
                   ('T
                    (SEQ
                     (SEQ
                      (LETT |un|
                            (|SIGNEF;smpsign| (SPADCALL |f| (QREFELT % 18)) %))
                      (EXIT
                       (COND
                        ((QEQCAR |un| 0)
                         (SEQ
                          (LETT |ud|
                                (|SIGNEF;smpsign| (SPADCALL |f| (QREFELT % 19))
                                 %))
                          (EXIT
                           (COND
                            ((QEQCAR |ud| 0)
                             (PROGN
                              (LETT #3# (CONS 0 (* (QCDR |un|) (QCDR |ud|))))
                              (GO #5=#:G86))))))))))
                     (COND
                      ((NULL (NULL (SPADCALL |f| (QREFELT % 21))))
                       (EXIT (CONS 1 "failed"))))
                     (EXIT
                      (COND
                       ((SPADCALL (CONS #'|SIGNEF;sign;FU;3!0| %)
                                  (SPADCALL |f| (QREFELT % 25)) (QREFELT % 27))
                        (CONS 1 "failed"))
                       (#6='T
                        (SEQ
                         (COND
                          ((|HasCategory| (QREFELT % 6)
                                          (LIST '|ConvertibleTo| '(|Float|)))
                           (SEQ (LETT |mapfun| (CONS #'|SIGNEF;sign;FU;3!1| %))
                                (LETT |f2u|
                                      (|trappedSpadEval|
                                       (SPADCALL |mapfun| |f| (QREFELT % 35))))
                                (EXIT
                                 (COND ((QEQCAR |f2u| 1) "failed")
                                       (#6#
                                        (SEQ (LETT |f2| (QCDR |f2u|))
                                             (LETT |r|
                                                   (SPADCALL |f2|
                                                             (QREFELT % 37)))
                                             (COND
                                              ((QEQCAR |r| 1)
                                               (PROGN
                                                (LETT #2# (CONS 1 "failed"))
                                                (GO #7=#:G87))))
                                             (EXIT
                                              (COND
                                               ((SPADCALL (QCDR |r|)
                                                          (QREFELT % 38))
                                                (PROGN
                                                 (LETT #2# (CONS 0 -1))
                                                 (GO #7#)))
                                               ((SPADCALL (QCDR |r|)
                                                          (QREFELT % 41))
                                                (PROGN
                                                 (LETT #2# (CONS 0 1))
                                                 (GO #7#)))
                                               ((SPADCALL (QCDR |r|)
                                                          (QREFELT % 42))
                                                (PROGN
                                                 (LETT #2# (CONS 0 0))
                                                 (GO #7#)))
                                               (#6# "failed"))))))))))
                         (EXIT (CONS 1 "failed"))))))))))
            #5# (EXIT #3#)))
          #7# (EXIT #2#)))) 

(SDEFUN |SIGNEF;sign;FU;3!1| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 29)) (QREFELT % 31))) 

(SDEFUN |SIGNEF;sign;FU;3!0| ((|x| NIL) (% NIL))
        (SPADCALL |x| '|rootOf| (QREFELT % 23))) 

(SDEFUN |SIGNEF;overRF|
        ((|a| (|OrderedCompletion| F))
         (%
          (|Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
                   "failed")))
        (SPROG
         ((|u| (|Union| (|Fraction| (|Polynomial| R)) "failed"))
          (|n| (|SingleInteger|)))
         (SEQ (LETT |n| (SPADCALL |a| (QREFELT % 45)))
              (EXIT
               (COND
                ((|eql_SI| |n| 0)
                 (SEQ
                  (LETT |u|
                        (SPADCALL (SPADCALL |a| (QREFELT % 47))
                                  (QREFELT % 49)))
                  (EXIT
                   (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                         (#1='T
                          (CONS 0 (SPADCALL (QCDR |u|) (QREFELT % 52))))))))
                ((SPADCALL |n| 0 (QREFELT % 53))
                 (CONS 0 (SPADCALL (QREFELT % 54))))
                (#1# (CONS 0 (SPADCALL (QREFELT % 55))))))))) 

(SDEFUN |SIGNEF;ofesign|
        ((|a| (|OrderedCompletion| F)) (% (|Union| (|Integer|) "failed")))
        (SPROG ((|n| (|Integer|)))
               (COND
                ((SPADCALL (LETT |n| (SPADCALL |a| (QREFELT % 45))) 0
                           (QREFELT % 57))
                 (CONS 0 |n|))
                ('T (SPADCALL (SPADCALL |a| (QREFELT % 47)) (QREFELT % 43)))))) 

(SDEFUN |SIGNEF;insign|
        ((|f| (F)) (|x| (|Symbol|)) (|a| (|OrderedCompletion| F))
         (|m| (|NonNegativeInteger|)) (% (|Union| (|Integer|) #1="failed")))
        (SPROG
         ((|ur| #2=(|Union| (|Integer|) #1#)) (#3=#:G124 NIL) (|ul| #2#)
          (|s| (|Union| (|Integer|) #1#)) (|v| (F)) (|n| (|Integer|))
          (|u|
           (|Union| (|OrderedCompletion| F)
                    (|Record|
                     (|:| |leftHandLimit|
                          (|Union| (|OrderedCompletion| F) #4="failed"))
                     (|:| |rightHandLimit|
                          (|Union| (|OrderedCompletion| F) #4#)))
                    "failed"))
          (|eq| (|Equation| (|OrderedCompletion| F))) (#5=#:G133 NIL)
          (|ua|
           (|Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
                    "failed"))
          (|uf| (|Union| (|Fraction| (|Polynomial| R)) "failed")))
         (SEQ
          (COND ((> |m| 10) (CONS 1 "failed"))
                (#6='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ (LETT |uf| (SPADCALL |f| (QREFELT % 49)))
                         (EXIT
                          (COND
                           ((QEQCAR |uf| 0)
                            (SEQ (LETT |ua| (|SIGNEF;overRF| |a| %))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ua| 0)
                                    (PROGN
                                     (LETT #5#
                                           (SPADCALL (QCDR |uf|) |x|
                                                     (QCDR |ua|)
                                                     (QREFELT % 59)))
                                     (GO #7=#:G131))))))))))
                    (LETT |eq|
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| (QREFELT % 60))
                                     (QREFELT % 61))
                           |a| (QREFELT % 63)))
                    (LETT |u| (SPADCALL |f| |eq| (QREFELT % 68)))
                    (EXIT
                     (COND ((QEQCAR |u| 2) (CONS 1 "failed"))
                           ((QEQCAR |u| 0)
                            (COND
                             ((SPADCALL
                               (LETT |n| (SPADCALL (QCDR |u|) (QREFELT % 45)))
                               0 (QREFELT % 57))
                              (CONS 0 |n|))
                             (#6#
                              (SEQ
                               (LETT |v| (SPADCALL (QCDR |u|) (QREFELT % 47)))
                               (EXIT
                                (COND
                                 ((SPADCALL |v| (|spadConstant| % 69)
                                            (QREFELT % 70))
                                  (SEQ
                                   (LETT |s|
                                         (|SIGNEF;insign|
                                          (SPADCALL |f| |x| (QREFELT % 71)) |x|
                                          |a| (+ |m| 1) %))
                                   (EXIT
                                    (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                                          (#6#
                                           (CONS 0 (- (* (QCDR |s|) |n|))))))))
                                 (#6# (SPADCALL |v| (QREFELT % 43)))))))))
                           (#6#
                            (COND
                             ((OR (QEQCAR (QCAR (QCDR |u|)) 1)
                                  (QEQCAR (QCDR (QCDR |u|)) 1))
                              (CONS 1 "failed"))
                             ('T
                              (SEQ
                               (LETT |ul|
                                     (|SIGNEF;ofesign|
                                      (PROG2 (LETT #3# (QCAR (QCDR |u|)))
                                          (QCDR #3#)
                                        (|check_union2| (QEQCAR #3# 0)
                                                        (|OrderedCompletion|
                                                         (QREFELT % 7))
                                                        (|Union|
                                                         (|OrderedCompletion|
                                                          (QREFELT % 7))
                                                         #4#)
                                                        #3#))
                                      %))
                               (EXIT
                                (COND ((QEQCAR |ul| 1) (CONS 1 "failed"))
                                      (#6#
                                       (SEQ
                                        (LETT |ur|
                                              (|SIGNEF;ofesign|
                                               (PROG2
                                                   (LETT #3# (QCDR (QCDR |u|)))
                                                   (QCDR #3#)
                                                 (|check_union2| (QEQCAR #3# 0)
                                                                 (|OrderedCompletion|
                                                                  (QREFELT %
                                                                           7))
                                                                 (|Union|
                                                                  (|OrderedCompletion|
                                                                   (QREFELT %
                                                                            7))
                                                                  #4#)
                                                                 #3#))
                                               %))
                                        (EXIT
                                         (COND
                                          ((OR (QEQCAR |ur| 1)
                                               (NULL
                                                (EQL (QCDR |ul|) (QCDR |ur|))))
                                           (CONS 1 "failed"))
                                          ('T |ul|)))))))))))))))
                  #7# (EXIT #5#))))))) 

(SDEFUN |SIGNEF;psign|
        ((|f| (F)) (|x| (|Symbol|)) (|a| (F)) (|st| (|String|))
         (|m| (|NonNegativeInteger|)) (% (|Union| (|Integer|) #1="failed")))
        (SPROG
         ((|s| (|Union| (|Integer|) #1#)) (|v| (F)) (|n| (|Integer|))
          (|u| (|Union| (|OrderedCompletion| F) "failed"))
          (|eq| (|Equation| F)) (#2=#:G150 NIL)
          (|ua| #3=(|Union| (|Fraction| (|Polynomial| R)) "failed"))
          (|uf| #3#))
         (SEQ
          (COND ((> |m| 10) (CONS 1 "failed"))
                ((SPADCALL |f| (|spadConstant| % 69) (QREFELT % 70))
                 (CONS 0 0))
                (#4='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ (LETT |uf| (SPADCALL |f| (QREFELT % 49)))
                         (EXIT
                          (COND
                           ((QEQCAR |uf| 0)
                            (SEQ (LETT |ua| (SPADCALL |a| (QREFELT % 49)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ua| 0)
                                    (PROGN
                                     (LETT #2#
                                           (SPADCALL (QCDR |uf|) |x|
                                                     (QCDR |ua|) |st|
                                                     (QREFELT % 72)))
                                     (GO #5=#:G148))))))))))
                    (LETT |eq|
                          (SPADCALL (SPADCALL |x| (QREFELT % 60)) |a|
                                    (QREFELT % 74)))
                    (LETT |u| (SPADCALL |f| |eq| |st| (QREFELT % 75)))
                    (EXIT
                     (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                           ((QEQCAR |u| 0)
                            (COND
                             ((SPADCALL
                               (LETT |n| (SPADCALL (QCDR |u|) (QREFELT % 45)))
                               0 (QREFELT % 57))
                              (CONS 0 |n|))
                             (#4#
                              (SEQ
                               (LETT |v| (SPADCALL (QCDR |u|) (QREFELT % 47)))
                               (EXIT
                                (COND
                                 ((SPADCALL |v| (|spadConstant| % 69)
                                            (QREFELT % 70))
                                  (SEQ
                                   (LETT |s|
                                         (|SIGNEF;psign|
                                          (SPADCALL |f| |x| (QREFELT % 71)) |x|
                                          |a| |st| (+ |m| 1) %))
                                   (EXIT
                                    (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                                          (#4#
                                           (CONS 0
                                                 (*
                                                  (SPADCALL |st|
                                                            (QREFELT % 77))
                                                  (QCDR |s|))))))))
                                 (#4# (SPADCALL |v| (QREFELT % 43)))))))))))))
                  #5# (EXIT #2#))))))) 

(SDEFUN |SIGNEF;smpsign2|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (% (|Union| (|Integer|) "failed")))
        (SPROG
         ((|ans| (|Integer|)) (#1=#:G165 NIL)
          (|u| (|Union| (|Integer|) "failed")) (#2=#:G166 NIL) (|term| NIL)
          (|s| (|Factored| (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|r| (|Union| R "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |r| (SPADCALL |p| (QREFELT % 80)))
                (EXIT
                 (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT % 81)))
                       (#3='T
                        (SEQ
                         (LETT |u|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (LETT |s| (SPADCALL |p| (QREFELT % 83)))
                                  (QREFELT % 85))
                                 (QREFELT % 86))
                                (QREFELT % 81)))
                         (EXIT
                          (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                                (#3#
                                 (SEQ (LETT |ans| (QCDR |u|))
                                      (SEQ (LETT |term| NIL)
                                           (LETT #2#
                                                 (SPADCALL |s| (QREFELT % 90)))
                                           G190
                                           (COND
                                            ((OR (ATOM #2#)
                                                 (PROGN
                                                  (LETT |term| (CAR #2#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((ODDP (QVELT |term| 2))
                                               (SEQ
                                                (LETT |u|
                                                      (|SIGNEF;sqfrSign|
                                                       (QVELT |term| 1) %))
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |u| 1)
                                                   (PROGN
                                                    (LETT #1#
                                                          (CONS 1 "failed"))
                                                    (GO #4=#:G164)))
                                                  ('T
                                                   (LETT |ans|
                                                         (* |ans|
                                                            (QCDR
                                                             |u|)))))))))))
                                           (LETT #2# (CDR #2#)) (GO G190) G191
                                           (EXIT NIL))
                                      (EXIT (CONS 0 |ans|))))))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |SIGNEF;smpsign|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (% (|Union| (|Integer|) #1="failed")))
        (SPROG
         ((|zu| (|Union| (|Boolean|) "failed"))
          (|up| (|SparseUnivariatePolynomial| F)) (|b| (|OrderedCompletion| F))
          (|a| (|OrderedCompletion| F)) (|x0| (F))
          (|s0| (|Union| (|Integer|) #1#)) (|k| (|Kernel| F))
          (|vl| (|List| (|Kernel| F))) (|resu| (|Union| (|Integer|) #1#)))
         (SEQ (LETT |resu| (|SIGNEF;smpsign2| |p| %))
              (EXIT
               (COND ((QEQCAR |resu| 0) |resu|)
                     (#2='T
                      (SEQ (LETT |vl| (SPADCALL |p| (QREFELT % 95)))
                           (EXIT
                            (COND
                             ((EQL (LENGTH |vl|) 1)
                              (SEQ (LETT |k| (|SPADfirst| |vl|))
                                   (LETT |s0| (|SIGNEF;kerSign| |k| %))
                                   (LETT |a| (SPADCALL (QREFELT % 96)))
                                   (LETT |b| (SPADCALL (QREFELT % 97)))
                                   (LETT |x0| (|spadConstant| % 69))
                                   (COND
                                    ((QEQCAR |s0| 0)
                                     (SEQ
                                      (COND
                                       ((SPADCALL |s0| (CONS 0 1)
                                                  (QREFELT % 98))
                                        (LETT |a|
                                              (SPADCALL (|spadConstant| % 69)
                                                        (QREFELT % 61)))))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |s0| (CONS 0 -1)
                                                   (QREFELT % 98))
                                         (LETT |b|
                                               (SPADCALL (|spadConstant| % 69)
                                                         (QREFELT % 61)))))))))
                                   (COND
                                    ((SPADCALL |k| '|atan| (QREFELT % 100))
                                     (SEQ
                                      (LETT |a|
                                            (COND
                                             ((SPADCALL |a|
                                                        (SPADCALL
                                                         (|spadConstant| % 69)
                                                         (QREFELT % 61))
                                                        (QREFELT % 101))
                                              |a|)
                                             (#2#
                                              (SPADCALL
                                               (SPADCALL (|spadConstant| % 40)
                                                         (QREFELT % 102))
                                               (QREFELT % 61)))))
                                      (EXIT
                                       (LETT |b|
                                             (COND
                                              ((SPADCALL |b|
                                                         (SPADCALL
                                                          (|spadConstant| % 69)
                                                          (QREFELT % 61))
                                                         (QREFELT % 101))
                                               |b|)
                                              (#2#
                                               (SPADCALL (|spadConstant| % 40)
                                                         (QREFELT % 61)))))))))
                                   (LETT |up|
                                         (SPADCALL (ELT % 103)
                                                   (SPADCALL |p|
                                                             (QREFELT % 105))
                                                   (QREFELT % 109)))
                                   (LETT |zu|
                                         (SPADCALL |up| |a| |b| 'T
                                                   (QREFELT % 112)))
                                   (EXIT
                                    (COND
                                     ((OR (QEQCAR |zu| 1) (QCDR |zu|))
                                      (CONS 1 "failed"))
                                     ('T
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |up| (QREFELT % 93) |x0|
                                                  (QREFELT % 113))
                                        (QREFELT % 114))
                                       (QREFELT % 43)))))))
                             (#2# (CONS 1 "failed"))))))))))) 

(SDEFUN |SIGNEF;sqfrSign|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (% (|Union| (|Integer|) #1="failed")))
        (SPROG
         ((|u| (|Union| (|Integer|) #1#))
          (|l| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F)))))
         (SEQ
          (LETT |u|
                (|SIGNEF;termSign|
                 (|SPADfirst| (LETT |l| (SPADCALL |p| (QREFELT % 116)))) %))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T (|SIGNEF;listSign| (CDR |l|) (QCDR |u|) %))))))) 

(SDEFUN |SIGNEF;listSign|
        ((|l| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (|s| (|Integer|)) (% (|Union| (|Integer|) #1="failed")))
        (SPROG
         ((#2=#:G190 NIL) (#3=#:G191 NIL) (|u| (|Union| (|Integer|) #1#))
          (#4=#:G192 NIL) (|term| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |term| NIL) (LETT #4# |l|) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |term| (CAR #4#)) NIL))
                   (GO G191)))
                 (SEQ (LETT |u| (|SIGNEF;termSign| |term| %))
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (PROGN (LETT #3# (CONS 1 "failed")) (GO #5=#:G189)))
                        ('T
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL |s| (QCDR |u|)))
                             (PROGN
                              (LETT #2#
                                    (PROGN
                                     (LETT #3# (CONS 1 "failed"))
                                     (GO #5#)))
                              (GO #6=#:G185)))))
                          #6# (EXIT #2#))))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |s|))))
          #5# (EXIT #3#)))) 

(SDEFUN |SIGNEF;termSign|
        ((|term| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (% (|Union| (|Integer|) #1="failed")))
        (SPROG
         ((#2=#:G203 NIL) (#3=#:G204 NIL) (#4=#:G202 NIL)
          (|vs| (|Union| (|Integer|) #1#)) (#5=#:G205 NIL)
          (|lv| (|List| (|Kernel| F))) (|var| NIL)
          (|us| (|Union| (|Integer|) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |us|
                  (SPADCALL (SPADCALL |term| (QREFELT % 117)) (QREFELT % 81)))
            (EXIT
             (COND ((QEQCAR |us| 1) (CONS 1 "failed"))
                   ('T
                    (SEQ
                     (SEQ
                      (EXIT
                       (SEQ (LETT |var| NIL)
                            (LETT #5#
                                  (LETT |lv| (SPADCALL |term| (QREFELT % 95))))
                            G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |var| (CAR #5#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((ODDP (SPADCALL |term| |var| (QREFELT % 119)))
                                (PROGN
                                 (LETT #2#
                                       (SEQ
                                        (EXIT
                                         (SEQ
                                          (COND
                                           ((NULL (CDR |lv|))
                                            (SEQ
                                             (LETT |vs|
                                                   (|SIGNEF;kerSign|
                                                    (|SPADfirst| |lv|) %))
                                             (EXIT
                                              (COND
                                               ((QEQCAR |vs| 0)
                                                (PROGN
                                                 (LETT #4#
                                                       (PROGN
                                                        (LETT #3#
                                                              (CONS 0
                                                                    (*
                                                                     (QCDR
                                                                      |us|)
                                                                     (QCDR
                                                                      |vs|))))
                                                        (GO #6=#:G201)))
                                                 (GO #7=#:G196))))))))
                                          (EXIT
                                           (PROGN
                                            (LETT #3# (CONS 1 "failed"))
                                            (GO #6#)))))
                                        #7# (EXIT #4#)))
                                 (GO #8=#:G198))))))
                            (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL)))
                      #8# (EXIT #2#))
                     (EXIT (CONS 0 (QCDR |us|)))))))))
          #6# (EXIT #3#)))) 

(SDEFUN |SIGNEF;kerSign|
        ((|k| (|Kernel| F)) (% (|Union| (|Integer|) #1="failed")))
        (SPROG
         ((|s| (|Union| (|Integer|) #1#)) (|arg| (|List| F))
          (|op| (|BasicOperator|)))
         (SEQ (LETT |op| (SPADCALL |k| (QREFELT % 120)))
              (COND
               ((OR (SPADCALL |op| '|pi| (QREFELT % 23))
                    (OR (SPADCALL |op| '|exp| (QREFELT % 23))
                        (OR (SPADCALL |op| '|cosh| (QREFELT % 23))
                            (SPADCALL |op| '|sech| (QREFELT % 23)))))
                (EXIT (CONS 0 1))))
              (EXIT
               (COND
                ((NULL (LETT |arg| (SPADCALL |k| (QREFELT % 122))))
                 (CONS 1 "failed"))
                (#2='T
                 (SEQ (LETT |s| (SPADCALL (|SPADfirst| |arg|) (QREFELT % 43)))
                      (EXIT
                       (COND
                        ((QEQCAR |s| 1)
                         (COND
                          ((SPADCALL |op| '|nthRoot| (QREFELT % 23))
                           (COND
                            ((EVENP
                              (SPADCALL (SPADCALL |arg| (QREFELT % 123))
                                        (QREFELT % 124)))
                             (CONS 0 1))
                            (#2# (CONS 1 "failed"))))
                          (#2# (CONS 1 "failed"))))
                        ((SPADCALL |op| '|log| (QREFELT % 23))
                         (COND ((< (QCDR |s|) 0) (CONS 1 "failed"))
                               (#2#
                                (SPADCALL
                                 (SPADCALL (|SPADfirst| |arg|)
                                           (|spadConstant| % 40)
                                           (QREFELT % 125))
                                 (QREFELT % 43)))))
                        ((OR
                          (OR (SPADCALL |op| '|tanh| (QREFELT % 23))
                              (OR (SPADCALL |op| '|sinh| (QREFELT % 23))
                                  (OR (SPADCALL |op| '|csch| (QREFELT % 23))
                                      (SPADCALL |op| '|coth| (QREFELT % 23)))))
                          (OR (SPADCALL |op| '|atan| (QREFELT % 23))
                              (OR (SPADCALL |op| '|Si| (QREFELT % 23))
                                  (OR
                                   (SPADCALL |op| '|fresnelS| (QREFELT % 23))
                                   (SPADCALL |op| '|fresnelC|
                                             (QREFELT % 23))))))
                         |s|)
                        ('T
                         (COND
                          ((SPADCALL |op| '|nthRoot| (QREFELT % 23))
                           (COND
                            ((EVENP
                              (SPADCALL (SPADCALL |arg| (QREFELT % 123))
                                        (QREFELT % 124)))
                             (COND ((< (QCDR |s|) 0) (CONS 1 "failed"))
                                   (#2# |s|)))
                            (#2# |s|)))
                          ((SPADCALL |op| '|%power| (QREFELT % 23))
                           (COND ((< (QCDR |s|) 0) (CONS 1 "failed"))
                                 (#2# |s|)))
                          (#2# (CONS 1 "failed"))))))))))))) 

(DECLAIM (NOTINLINE |ElementaryFunctionSign;|)) 

(DEFUN |ElementaryFunctionSign;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ElementaryFunctionSign| DV$1 DV$2))
          (LETT % (GETREFV 126))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ElementaryFunctionSign|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 93 (SPADCALL (QREFELT % 92)))
          %))) 

(DEFUN |ElementaryFunctionSign| (&REST #1=#:G230)
  (SPROG NIL
         (PROG (#2=#:G231)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryFunctionSign|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ElementaryFunctionSign;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ElementaryFunctionSign|)))))))))) 

(MAKEPROP '|ElementaryFunctionSign| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (|TrigonometricManipulations| 6 7) (0 . |real?|)
              (|Union| 56 '#1="failed") (|Symbol|) (|OrderedCompletion| 7)
              |SIGNEF;sign;FSOcU;1| (|String|) |SIGNEF;sign;FSFSU;2|
              (|SparseMultivariatePolynomial| 6 (|Kernel| %)) (5 . |numer|)
              (10 . |denom|) (|List| 12) (15 . |variables|) (|BasicOperator|)
              (20 . |is?|) (|List| 22) (26 . |operators|) (|Mapping| 8 22)
              (31 . |any?|) (|Float|) (37 . |convert|) (|Interval| 28)
              (42 . |interval|) (|Expression| 30) (|Mapping| 30 6)
              (|FunctionSpaceFunctions2| 6 7 30 32) (47 . |map|)
              (|Union| 30 '"failed") (53 . |retractIfCan|) (58 . |negative?|)
              (63 . |One|) (67 . |One|) (71 . |positive?|) (76 . |zero?|)
              |SIGNEF;sign;FU;3| (|SingleInteger|) (81 . |whatInfinity|)
              (86 . |Zero|) (90 . |retract|) (|Union| 50 '"failed")
              (95 . |retractIfCan|) (|Fraction| (|Polynomial| 6))
              (|OrderedCompletion| 50) (100 . |coerce|) (105 . >)
              (111 . |plusInfinity|) (115 . |minusInfinity|) (|Integer|)
              (119 . ~=) (|RationalFunctionSign| 6) (125 . |sign|)
              (132 . |coerce|) (137 . |coerce|) (|Equation| 13)
              (142 . |equation|) (|Union| 13 '"failed")
              (|Record| (|:| |leftHandLimit| 64) (|:| |rightHandLimit| 64))
              (|Union| 13 65 '"failed") (|PowerSeriesLimitPackage| 6 7)
              (148 . |limit|) (154 . |Zero|) (158 . =) (164 . |differentiate|)
              (170 . |sign|) (|Equation| 7) (178 . |equation|) (184 . |limit|)
              (|ToolsForSign| 6) (191 . |direction|) (|Union| 6 '"failed")
              (|SparseMultivariatePolynomial| 6 99) (196 . |retractIfCan|)
              (201 . |sign|) (|Factored| %) (206 . |squareFree|)
              (|Factored| 79) (211 . |unit|) (216 . |retract|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 87) (|:| |factor| 79) (|:| |exponent| 118))
              (|List| 88) (221 . |factorList|) (|SingletonAsOrderedSet|)
              (226 . |create|) '|sas| (|List| 99) (230 . |variables|)
              (235 . |minusInfinity|) (239 . |plusInfinity|) (243 . =)
              (|Kernel| 7) (249 . |is?|) (255 . =) (261 . -) (266 . |coerce|)
              (|SparseUnivariatePolynomial| 6) (271 . |univariate|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 6)
              (|SparseUnivariatePolynomialFunctions2| 6 7) (276 . |map|)
              (|Union| 8 '"failed") (|DefiniteIntegrationTools| 6 7)
              (282 . |checkForZero|) (290 . |eval|) (297 . |retract|)
              (|List| %) (302 . |monomials|) (307 . |leadingCoefficient|)
              (|NonNegativeInteger|) (312 . |degree|) (318 . |operator|)
              (|List| 7) (323 . |argument|) (328 . |second|) (333 . |retract|)
              (338 . -))
           '#(|sign| 344) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|sign| ((|Union| (|Integer|) #1#) |#2|)) T)
                              '((|sign|
                                 ((|Union| (|Integer|) #1#) |#2| (|Symbol|)
                                  (|OrderedCompletion| |#2|)))
                                T)
                              '((|sign|
                                 ((|Union| (|Integer|) #1#) |#2| (|Symbol|)
                                  |#2| (|String|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 125
                                            '(1 9 8 7 10 1 7 17 0 18 1 7 17 0
                                              19 1 7 20 0 21 2 22 8 0 12 23 1 7
                                              24 0 25 2 24 8 26 0 27 1 6 28 0
                                              29 1 30 0 28 31 2 34 32 33 7 35 1
                                              32 36 0 37 1 30 8 0 38 0 6 0 39 0
                                              7 0 40 1 30 8 0 41 1 30 8 0 42 1
                                              13 44 0 45 0 6 0 46 1 13 7 0 47 1
                                              7 48 0 49 1 51 0 50 52 2 44 8 0 0
                                              53 0 51 0 54 0 51 0 55 2 56 8 0 0
                                              57 3 58 11 50 12 51 59 1 7 0 12
                                              60 1 13 0 7 61 2 62 0 13 13 63 2
                                              67 66 7 62 68 0 7 0 69 2 7 8 0 0
                                              70 2 7 0 0 12 71 4 58 11 50 12 50
                                              15 72 2 73 0 7 7 74 3 67 64 7 73
                                              15 75 1 76 56 15 77 1 79 78 0 80
                                              1 76 11 6 81 1 79 82 0 83 1 84 79
                                              0 85 1 79 6 0 86 1 84 89 0 90 0
                                              91 0 92 1 79 94 0 95 0 13 0 96 0
                                              13 0 97 2 11 8 0 0 98 2 99 8 0 12
                                              100 2 13 8 0 0 101 1 7 0 0 102 1
                                              7 0 6 103 1 79 104 0 105 2 108
                                              106 107 104 109 4 111 110 106 13
                                              13 8 112 3 106 0 0 91 7 113 1 106
                                              7 0 114 1 79 115 0 116 1 79 6 0
                                              117 2 79 118 0 99 119 1 99 22 0
                                              120 1 99 121 0 122 1 121 7 0 123
                                              1 7 56 0 124 2 7 0 0 0 125 3 0 11
                                              7 12 13 14 4 0 11 7 12 7 15 16 1
                                              0 11 7 43)))))
           '|lookupComplete|)) 
