
(SDEFUN |FAKEPOL;ground;$R;1|
        ((|p| $)
         ($ |Record| (|:| |numer| (|Polynomial| (|Integer|)))
          (|:| |denom| (|Polynomial| (|Integer|)))))
        (SPROG
         ((|r1|
           (|Record| (|:| |deg| (|NonNegativeInteger|))
                     (|:| |coef|
                          (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                                    (|:| |denom|
                                         (|Polynomial| (|Integer|)))))))
          (|pr|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|))
                      (|:| |coef|
                           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                                     (|:| |denom|
                                          (|Polynomial| (|Integer|))))))))
          (|pr1| (|Rep|)))
         (SEQ (LETT |pr1| |p| . #1=(|FAKEPOL;ground;$R;1|))
              (LETT |pr| (QCDR |pr1|) . #1#)
              (EXIT
               (COND
                ((NULL |pr|) (CONS (|spadConstant| $ 8) (|spadConstant| $ 9)))
                ('T
                 (SEQ (LETT |r1| (|SPADfirst| |pr|) . #1#)
                      (COND
                       ((NULL (EQL (QCAR |r1|) 0))
                        (EXIT (|error| "ground: not(r1.deg = 0)"))))
                      (EXIT (QCDR |r1|))))))))) 

(SDEFUN |FAKEPOL;map;M2$;2|
        ((|f| |Mapping| (|Polynomial| (|Integer|)) (|Polynomial| (|Integer|)))
         (|p| $) ($ $))
        (SPROG
         ((|res1|
           #1=(|List|
               #2=(|Record| (|:| |deg| (|NonNegativeInteger|))
                            (|:| |coef|
                                 #3=(|Record|
                                     (|:| |numer| (|Polynomial| (|Integer|)))
                                     (|:| |denom|
                                          (|Polynomial| (|Integer|))))))))
          (|n1| (|Polynomial| (|Integer|))) (|c1| #3#) (|pr| (|List| #2#))
          (|r1|
           (|Record| (|:| |deg| (|NonNegativeInteger|))
                     (|:| |coef|
                          (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                                    (|:| |denom|
                                         (|Polynomial| (|Integer|)))))))
          (#4=#:G732 NIL) (|res0| #1#) (|pr1| (|Rep|)))
         (SEQ
          (EXIT
           (SEQ (LETT |pr1| |p| . #5=(|FAKEPOL;map;M2$;2|))
                (LETT |pr| (QCDR |pr1|) . #5#)
                (LETT |res0|
                      (LIST
                       (CONS 0
                             (CONS (|spadConstant| $ 8) (|spadConstant| $ 8))))
                      . #5#)
                (LETT |res1| |res0| . #5#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL |pr|)
                          (PROGN
                           (LETT #4# (CONS (QCAR |pr1|) (CDR |res0|)) . #5#)
                           (GO #6=#:G731)))
                         ('T
                          (SEQ (LETT |r1| (|SPADfirst| |pr|) . #5#)
                               (LETT |pr| (CDR |pr|) . #5#)
                               (LETT |c1| (QCDR |r1|) . #5#)
                               (LETT |n1| (SPADCALL (QCAR |c1|) |f|) . #5#)
                               (EXIT
                                (COND
                                 ((SPADCALL |n1| (|spadConstant| $ 8)
                                            (QREFELT $ 13))
                                  "iterate")
                                 ('T
                                  (LETT |res1|
                                        (|qset_rest| |res1|
                                                     (LIST
                                                      (CONS (QCAR |r1|)
                                                            (CONS |n1|
                                                                  (SPADCALL
                                                                   (QCDR |c1|)
                                                                   |f|)))))
                                        . #5#)))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #4#)))) 

(SDEFUN |FAKEPOL;map;MR$;3|
        ((|f| |Mapping| (|Polynomial| (|Integer|)) (|Polynomial| (|Integer|)))
         (|p| |Record| (|:| |var| (|Symbol|))
          (|:| |coef|
               (|SparseUnivariatePolynomial|
                (|Fraction| (|Polynomial| (|Integer|))))))
         ($ $))
        (SPROG
         ((|res1|
           #1=(|List|
               (|Record| (|:| |deg| (|NonNegativeInteger|))
                         (|:| |coef|
                              (|Record|
                               (|:| |numer| (|Polynomial| (|Integer|)))
                               (|:| |denom| (|Polynomial| (|Integer|))))))))
          (|n1| (|Polynomial| (|Integer|)))
          (|pr|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|Polynomial| (|Integer|)))))
          (|c1| (|Fraction| (|Polynomial| (|Integer|))))
          (|d| (|NonNegativeInteger|)) (#2=#:G747 NIL) (|res0| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |pr| (QCDR |p|) . #3=(|FAKEPOL;map;MR$;3|))
                (LETT |res0|
                      (LIST
                       (CONS 0
                             (CONS (|spadConstant| $ 8) (|spadConstant| $ 8))))
                      . #3#)
                (LETT |res1| |res0| . #3#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |pr| (|spadConstant| $ 17) (QREFELT $ 18))
                          (PROGN
                           (LETT #2# (CONS (QCAR |p|) (CDR |res0|)) . #3#)
                           (GO #4=#:G746)))
                         ('T
                          (SEQ (LETT |d| (SPADCALL |pr| (QREFELT $ 20)) . #3#)
                               (LETT |c1| (SPADCALL |pr| (QREFELT $ 22)) . #3#)
                               (LETT |pr| (SPADCALL |pr| (QREFELT $ 23)) . #3#)
                               (LETT |n1|
                                     (SPADCALL (SPADCALL |c1| (QREFELT $ 24))
                                               |f|)
                                     . #3#)
                               (EXIT
                                (COND
                                 ((SPADCALL |n1| (|spadConstant| $ 8)
                                            (QREFELT $ 13))
                                  "iterate")
                                 ('T
                                  (LETT |res1|
                                        (|qset_rest| |res1|
                                                     (LIST
                                                      (CONS |d|
                                                            (CONS |n1|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |c1|
                                                                    (QREFELT $
                                                                             25))
                                                                   |f|)))))
                                        . #3#)))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #4# (EXIT #2#)))) 

(SDEFUN |FAKEPOL;map;M$U;4|
        ((|f| |Mapping| (|Union| (|Polynomial| (|Integer|)) "failed")
          (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                    (|:| |denom| (|Polynomial| (|Integer|)))))
         (|p| $)
         ($ |Union| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
          "failed"))
        (SPROG
         ((|res0| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|c1u| (|Union| (|Polynomial| (|Integer|)) "failed"))
          (|pr|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|))
                      (|:| |coef|
                           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                                     (|:| |denom|
                                          (|Polynomial| (|Integer|))))))))
          (|r1|
           (|Record| (|:| |deg| (|NonNegativeInteger|))
                     (|:| |coef|
                          (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                                    (|:| |denom|
                                         (|Polynomial| (|Integer|)))))))
          (|pr1| (|Rep|)))
         (SEQ (LETT |pr1| |p| . #1=(|FAKEPOL;map;M$U;4|))
              (LETT |pr| (QCDR |pr1|) . #1#)
              (LETT |res0| (|spadConstant| $ 29) . #1#)
              (SEQ G190 (COND ((NULL (NULL (NULL |pr|))) (GO G191)))
                   (SEQ (LETT |r1| (|SPADfirst| |pr|) . #1#)
                        (LETT |pr| (CDR |pr|) . #1#)
                        (LETT |c1u| (SPADCALL (QCDR |r1|) |f|) . #1#)
                        (EXIT
                         (COND ((QEQCAR |c1u| 1) "failed")
                               ('T
                                (LETT |res0|
                                      (SPADCALL |res0|
                                                (SPADCALL (QCDR |c1u|)
                                                          (QCAR |r1|)
                                                          (QREFELT $ 30))
                                                (QREFELT $ 31))
                                      . #1#)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 0 |res0|))))) 

(SDEFUN |FAKEPOL;degree;$SNni;5|
        ((|p| $) (|s| |Symbol|) ($ |NonNegativeInteger|))
        (SPROG
         ((|res| (|NonNegativeInteger|))
          (|c1|
           #1=(|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                        (|:| |denom| (|Polynomial| (|Integer|)))))
          (#2=#:G784 NIL) (|r1| NIL)
          (|pr|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |coef| #1#))))
          (|pr1| (|Rep|)))
         (SEQ (LETT |pr1| |p| . #3=(|FAKEPOL;degree;$SNni;5|))
              (LETT |pr| (QCDR |pr1|) . #3#)
              (EXIT
               (COND ((NULL |pr|) 0)
                     ((EQUAL (QCAR |pr1|) |s|) (QCAR (|SPADfirst| |pr|)))
                     ('T
                      (SEQ (LETT |res| 0 . #3#)
                           (SEQ (LETT |r1| NIL . #3#) (LETT #2# |pr| . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |r1| (CAR #2#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ (LETT |c1| (QCDR |r1|) . #3#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL (QCDR |c1|) |s|
                                                   (QREFELT $ 37))
                                         0 (QREFELT $ 38))
                                        (|error|
                                         "degree: not a polynomial in given variable"))
                                       ('T
                                        (LETT |res|
                                              (MAX |res|
                                                   (SPADCALL (QCAR |c1|) |s|
                                                             (QREFELT $ 37)))
                                              . #3#)))))
                                (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |FAKEPOL;to_UP;$Sup;6|
        ((|p| $)
         ($ |SparseUnivariatePolynomial|
          (|Fraction| (|Polynomial| (|Integer|)))))
        (SPROG
         ((|res0|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|Polynomial| (|Integer|)))))
          (|cr| (|Fraction| (|Polynomial| (|Integer|))))
          (|n1| #1=(|Polynomial| (|Integer|)))
          (|c1|
           #2=(|Record| (|:| |numer| #1#)
                        (|:| |denom| (|Polynomial| (|Integer|)))))
          (|pr|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |coef| #2#))))
          (|r1|
           (|Record| (|:| |deg| (|NonNegativeInteger|))
                     (|:| |coef|
                          (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                                    (|:| |denom|
                                         (|Polynomial| (|Integer|)))))))
          (|pr1| (|Rep|)))
         (SEQ (LETT |pr1| |p| . #3=(|FAKEPOL;to_UP;$Sup;6|))
              (LETT |pr| (QCDR |pr1|) . #3#)
              (LETT |res0| (|spadConstant| $ 17) . #3#)
              (SEQ G190 (COND ((NULL (NULL (NULL |pr|))) (GO G191)))
                   (SEQ (LETT |r1| (|SPADfirst| |pr|) . #3#)
                        (LETT |pr| (CDR |pr|) . #3#)
                        (LETT |c1| (QCDR |r1|) . #3#)
                        (LETT |n1| (QCAR |c1|) . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL |n1| (|spadConstant| $ 8) (QREFELT $ 13))
                           "iterate")
                          ('T
                           (SEQ
                            (LETT |cr|
                                  (SPADCALL |n1| (QCDR |c1|) (QREFELT $ 40))
                                  . #3#)
                            (EXIT
                             (LETT |res0|
                                   (SPADCALL |res0|
                                             (SPADCALL |cr| (QCAR |r1|)
                                                       (QREFELT $ 41))
                                             (QREFELT $ 42))
                                   . #3#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res0|)))) 

(SDEFUN |FAKEPOL;subst_var;$2L$;7|
        ((|p| $) (|ls1| |List| (|Symbol|)) (|ls2| |List| (|Symbol|)) ($ $))
        (SPROG
         ((#1=#:G797 NIL) (#2=#:G798 NIL) (|s1| NIL) (#3=#:G799 NIL) (|s2| NIL)
          (|v1| (|Symbol|)) (|pr1| (|Rep|)))
         (SEQ
          (EXIT
           (SEQ (LETT |pr1| |p| . #4=(|FAKEPOL;subst_var;$2L$;7|))
                (LETT |v1| (QCAR |pr1|) . #4#)
                (SEQ (LETT |s2| NIL . #4#) (LETT #3# |ls2| . #4#)
                     (LETT |s1| NIL . #4#) (LETT #2# |ls1| . #4#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |s1| (CAR #2#) . #4#) NIL)
                           (ATOM #3#) (PROGN (LETT |s2| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQUAL |v1| |s1|)
                         (PROGN
                          (LETT #1# (CONS |s2| (QCDR |pr1|)) . #4#)
                          (GO #5=#:G796))))))
                     (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#))
                           . #4#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))
          #5# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |FakePolynomial;|)) 

(DEFUN |FakePolynomial| ()
  (SPROG NIL
         (PROG (#1=#:G801)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FakePolynomial|)
                    . #2=(|FakePolynomial|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FakePolynomial|
                             (LIST (CONS NIL (CONS 1 (|FakePolynomial;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|FakePolynomial|)))))))))) 

(DEFUN |FakePolynomial;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FakePolynomial|) . #1=(|FakePolynomial|))
          (LETT $ (GETREFV 46) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FakePolynomial| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |var| (|Symbol|))
                              (|:| |coef|
                                   (|List|
                                    (|Record|
                                     (|:| |deg| (|NonNegativeInteger|))
                                     (|:| |coef|
                                          (|Record|
                                           (|:| |numer|
                                                (|Polynomial| (|Integer|)))
                                           (|:| |denom|
                                                (|Polynomial|
                                                 (|Integer|))))))))))
          $))) 

(MAKEPROP '|FakePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Polynomial| (|Integer|))
              (0 . |Zero|) (4 . |One|)
              (|Record| (|:| |numer| 7) (|:| |denom| 7)) |FAKEPOL;ground;$R;1|
              (|Boolean|) (8 . =) (|Mapping| 7 7) |FAKEPOL;map;M2$;2|
              (|SparseUnivariatePolynomial| 21) (14 . |Zero|) (18 . =)
              (|NonNegativeInteger|) (24 . |degree|) (|Fraction| 7)
              (29 . |leadingCoefficient|) (34 . |reductum|) (39 . |numer|)
              (44 . |denom|) (|Record| (|:| |var| 36) (|:| |coef| 16))
              |FAKEPOL;map;MR$;3| (|SparseUnivariatePolynomial| 7)
              (49 . |Zero|) (53 . |monomial|) (59 . +) (|Union| 28 '"failed")
              (|Union| 7 '"failed") (|Mapping| 33 10) |FAKEPOL;map;M$U;4|
              (|Symbol|) (65 . |degree|) (71 . >) |FAKEPOL;degree;$SNni;5|
              (77 . /) (83 . |monomial|) (89 . +) |FAKEPOL;to_UP;$Sup;6|
              (|List| 36) |FAKEPOL;subst_var;$2L$;7|)
           '#(|to_UP| 95 |subst_var| 100 |map| 107 |ground| 125 |degree| 130)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 45
                                                 '(0 7 0 8 0 7 0 9 2 7 12 0 0
                                                   13 0 16 0 17 2 16 12 0 0 18
                                                   1 16 19 0 20 1 16 21 0 22 1
                                                   16 0 0 23 1 21 7 0 24 1 21 7
                                                   0 25 0 28 0 29 2 28 0 7 19
                                                   30 2 28 0 0 0 31 2 7 19 0 36
                                                   37 2 19 12 0 0 38 2 21 0 7 7
                                                   40 2 16 0 21 19 41 2 16 0 0
                                                   0 42 1 0 16 0 43 3 0 0 0 44
                                                   44 45 2 0 0 14 0 15 2 0 32
                                                   34 0 35 2 0 0 14 26 27 1 0
                                                   10 0 11 2 0 19 0 36 39)))))
           '|lookupComplete|)) 

(MAKEPROP '|FakePolynomial| 'NILADIC T) 
