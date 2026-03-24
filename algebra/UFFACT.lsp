
(SDEFUN |UFFACT;get_deg_GF| ((% (|PositiveInteger|)))
        (SPROG
         ((#1=#:G15 NIL) (|n| (|PositiveInteger|))
          (|ss| (|NonNegativeInteger|)) (#2=#:G10 NIL))
         (SEQ
          (COND
           ((EQL (QREFELT % 12) 0)
            (SEQ (LETT |n| 1) (LETT |ss| (SPADCALL (QREFELT % 15)))
                 (SEQ G190 (COND ((NULL (> |ss| (QREFELT % 10))) (GO G191)))
                      (SEQ
                       (LETT |ss|
                             (PROG2
                                 (LETT #2#
                                       (SPADCALL |ss| (QREFELT % 10)
                                                 (QREFELT % 17)))
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|NonNegativeInteger|)
                                               (|Union| (|NonNegativeInteger|)
                                                        "failed")
                                               #2#)))
                       (EXIT (LETT |n| (+ |n| 1))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT (SETELT % 12 |n|)))))
          (EXIT
           (PROG1 (LETT #1# (QREFELT % 12))
             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                               '(|NonNegativeInteger|) #1#)))))) 

(SDEFUN |UFFACT;sufactor2|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|res| (|List| (|SparseUnivariatePolynomial| F)))
          (|mf1| (|SparseUnivariatePolynomial| F)) (#1=#:G24 NIL) (|f1| NIL)
          (|lfp| (|List| (|PrimitiveArray| F))) (|pa| (|PrimitiveArray| F)))
         (SEQ (LETT |pa| (SPADCALL |m| (QREFELT % 23)))
              (LETT |lfp| (SPADCALL |pa| (QREFELT % 20) (QREFELT % 27)))
              (LETT |res| NIL)
              (SEQ (LETT |f1| NIL) (LETT #1# |lfp|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |mf1| (SPADCALL |f1| (QREFELT % 28)))
                        (EXIT (LETT |res| (CONS |mf1| |res|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |UFFACT;irreducible2?|
        ((|m| (|SparseUnivariatePolynomial| F)) (% (|Boolean|)))
        (SPROG ((|pa| (|PrimitiveArray| F)))
               (SEQ (LETT |pa| (SPADCALL |m| (QREFELT % 23)))
                    (EXIT (SPADCALL |pa| (QREFELT % 20) (QREFELT % 30)))))) 

(SDEFUN |UFFACT;sufact_gen|
        ((|m| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |cont| F)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| F))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (SPROG
         ((|facs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G40 NIL) (|f1| NIL) (|e1| #2=(|NonNegativeInteger|))
          (|lf1| (|List| (|SparseUnivariatePolynomial| F)))
          (|m1| #3=(|SparseUnivariatePolynomial| F)) (|lc1| (F)) (#4=#:G39 NIL)
          (|sf| NIL)
          (|lsf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #3#) (|:| |exponent| #2#))))
          (|lc| (F)))
         (SEQ
          (COND
           ((SPADCALL (LETT |lc| (SPADCALL |m| (QREFELT % 31)))
                      (|spadConstant| % 18) (QREFELT % 32))
            (LETT |m|
                  (SPADCALL (SPADCALL |lc| (QREFELT % 33)) |m|
                            (QREFELT % 34)))))
          (LETT |facs| NIL)
          (LETT |lsf| (SPADCALL (SPADCALL |m| (QREFELT % 36)) (QREFELT % 41)))
          (SEQ (LETT |sf| NIL) (LETT #4# |lsf|) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |sf| (CAR #4#)) NIL)) (GO G191)))
               (SEQ (LETT |m1| (QVELT |sf| 1))
                    (COND
                     ((SPADCALL (LETT |lc1| (SPADCALL |m1| (QREFELT % 31)))
                                (|spadConstant| % 18) (QREFELT % 32))
                      (LETT |m1|
                            (SPADCALL (SPADCALL |lc1| (QREFELT % 33)) |m1|
                                      (QREFELT % 34)))))
                    (LETT |lf1| (|UFFACT;sufactor2| |m1| %))
                    (LETT |e1| (QVELT |sf| 2))
                    (EXIT
                     (SEQ (LETT |f1| NIL) (LETT #1# |lf1|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT |facs| (CONS (CONS |f1| |e1|) |facs|))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |lc| |facs|))))) 

(SDEFUN |UFFACT;sufactor1|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|res| (|List| (|SparseUnivariatePolynomial| F)))
          (|mf1| (|SparseUnivariatePolynomial| F))
          (|if1| (|SparseUnivariatePolynomial| (|Integer|))) (#1=#:G46 NIL)
          (|f1| NIL) (|lfp| (|List| (|U32Vector|))) (|pa| (|U32Vector|))
          (|mi| (|SparseUnivariatePolynomial| (|Integer|))))
         (SEQ (LETT |mi| (SPADCALL (ELT % 43) |m| (QREFELT % 47)))
              (LETT |pa| (SPADCALL |mi| (QREFELT % 10) (QREFELT % 50)))
              (LETT |lfp| (SPADCALL |pa| (QREFELT % 10) (QREFELT % 53)))
              (LETT |res| NIL)
              (SEQ (LETT |f1| NIL) (LETT #1# |lfp|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |if1| (SPADCALL |f1| (QREFELT % 54)))
                        (LETT |mf1| (SPADCALL (ELT % 55) |if1| (QREFELT % 58)))
                        (EXIT (LETT |res| (CONS |mf1| |res|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |UFFACT;irreducible1?|
        ((|m| (|SparseUnivariatePolynomial| F)) (% (|Boolean|)))
        (SPROG
         ((|pa| (|U32Vector|))
          (|mi| (|SparseUnivariatePolynomial| (|Integer|))))
         (SEQ (LETT |mi| (SPADCALL (ELT % 43) |m| (QREFELT % 47)))
              (LETT |pa| (SPADCALL |mi| (QREFELT % 10) (QREFELT % 50)))
              (EXIT (SPADCALL |pa| (QREFELT % 10) (QREFELT % 59)))))) 

(SDEFUN |UFFACT;sufact_small|
        ((|m| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |cont| F)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| F))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (SPROG
         ((|facs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G61 NIL) (|f1| NIL) (|e1| #2=(|NonNegativeInteger|))
          (|lf1| (|List| (|SparseUnivariatePolynomial| F)))
          (|m1| #3=(|SparseUnivariatePolynomial| F)) (|lc1| (F)) (#4=#:G60 NIL)
          (|sf| NIL)
          (|lsf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #3#) (|:| |exponent| #2#))))
          (|lc| (F)))
         (SEQ
          (COND
           ((SPADCALL (LETT |lc| (SPADCALL |m| (QREFELT % 31)))
                      (|spadConstant| % 18) (QREFELT % 32))
            (LETT |m|
                  (SPADCALL (SPADCALL |lc| (QREFELT % 33)) |m|
                            (QREFELT % 34)))))
          (LETT |facs| NIL)
          (LETT |lsf| (SPADCALL (SPADCALL |m| (QREFELT % 36)) (QREFELT % 41)))
          (SEQ (LETT |sf| NIL) (LETT #4# |lsf|) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |sf| (CAR #4#)) NIL)) (GO G191)))
               (SEQ (LETT |m1| (QVELT |sf| 1))
                    (COND
                     ((SPADCALL (LETT |lc1| (SPADCALL |m1| (QREFELT % 31)))
                                (|spadConstant| % 18) (QREFELT % 32))
                      (LETT |m1|
                            (SPADCALL (SPADCALL |lc1| (QREFELT % 33)) |m1|
                                      (QREFELT % 34)))))
                    (LETT |lf1| (|UFFACT;sufactor1| |m1| %))
                    (LETT |e1| (QVELT |sf| 2))
                    (EXIT
                     (SEQ (LETT |f1| NIL) (LETT #1# |lf1|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT |facs| (CONS (CONS |f1| |e1|) |facs|))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |lc| |facs|))))) 

(SDEFUN |UFFACT;sufactor;SupR;8|
        ((|m| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |cont| F)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| F))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (COND
         ((< (* (SPADCALL |m| (QREFELT % 60)) (EXPT (QREFELT % 10) 2))
             MOST-POSITIVE-FIXNUM)
          (|UFFACT;sufact_small| |m| %))
         ('T (|UFFACT;sufact_gen| |m| %)))) 

(SDEFUN |UFFACT;sufactor_square_free;SupL;9|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (COND
         ((< (* (SPADCALL |m| (QREFELT % 60)) (EXPT (QREFELT % 10) 2))
             MOST-POSITIVE-FIXNUM)
          (|UFFACT;sufactor1| |m| %))
         ('T (|UFFACT;sufactor2| |m| %)))) 

(SDEFUN |UFFACT;su_irreducible?;SupB;10|
        ((|m| (|SparseUnivariatePolynomial| F)) (% (|Boolean|)))
        (COND
         ((< (* (SPADCALL |m| (QREFELT % 60)) (EXPT (QREFELT % 10) 2))
             MOST-POSITIVE-FIXNUM)
          (|UFFACT;irreducible1?| |m| %))
         ('T (|UFFACT;irreducible2?| |m| %)))) 

(SDEFUN |UFFACT;sufactor;SupR;11|
        ((|m| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |cont| F)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| F))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (|UFFACT;sufact_gen| |m| %)) 

(SDEFUN |UFFACT;sufactor_square_free;SupL;12|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (|UFFACT;sufactor2| |m| %)) 

(SDEFUN |UFFACT;su_irreducible?;SupB;13|
        ((|m| (|SparseUnivariatePolynomial| F)) (% (|Boolean|)))
        (|UFFACT;irreducible2?| |m| %)) 

(SDEFUN |UFFACT;sufactor;SupR;14|
        ((|m| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |cont| F)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| F))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (|UFFACT;sufact_gen| |m| %)) 

(SDEFUN |UFFACT;sufactor_square_free;SupL;15|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (|UFFACT;sufactor2| |m| %)) 

(SDEFUN |UFFACT;su_irreducible?;SupB;16|
        ((|m| (|SparseUnivariatePolynomial| F)) (% (|Boolean|)))
        (|UFFACT;irreducible2?| |m| %)) 

(SDEFUN |UFFACT;factor;UPF;17| ((|pol| (UP)) (% (|Factored| UP)))
        (SPROG
         ((|rl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G87 NIL) (|f1| NIL)
          (|ru|
           (|Record| (|:| |cont| F)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |factor| (|SparseUnivariatePolynomial| F))
                            (|:| |exponent| (|NonNegativeInteger|)))))))
          (|upol| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (COND
           ((SPADCALL |pol| (|spadConstant| % 14) (QREFELT % 67))
            (|spadConstant| % 69))
           ('T
            (SEQ (LETT |upol| (SPADCALL |pol| (QREFELT % 70)))
                 (LETT |ru| (SPADCALL |upol| (QREFELT % 63))) (LETT |rl| NIL)
                 (SEQ (LETT |f1| NIL) (LETT #1# (QCDR |ru|)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |rl|
                              (CONS
                               (VECTOR (CONS 3 "prime")
                                       (SPADCALL (QCAR |f1|) (QREFELT % 71))
                                       (QCDR |f1|))
                               |rl|))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (SPADCALL (SPADCALL (QCAR |ru|) (QREFELT % 72)) |rl|
                            (QREFELT % 75))))))))) 

(SDEFUN |UFFACT;factorSquareFree;UPF;18| ((|pol| (UP)) (% (|Factored| UP)))
        (SPROG
         ((|rl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|f1| (|SparseUnivariatePolynomial| F)) (|lc1| (F)) (#1=#:G99 NIL)
          (|rlu| (|List| (|SparseUnivariatePolynomial| F)))
          (|upol| (|SparseUnivariatePolynomial| F)) (|lc| (F)))
         (SEQ
          (COND
           ((SPADCALL |pol| (|spadConstant| % 14) (QREFELT % 67))
            (|spadConstant| % 69))
           ('T
            (SEQ (LETT |upol| (SPADCALL |pol| (QREFELT % 70)))
                 (LETT |lc| (SPADCALL |upol| (QREFELT % 31)))
                 (LETT |upol|
                       (SPADCALL (SPADCALL |lc| (QREFELT % 33)) |upol|
                                 (QREFELT % 34)))
                 (LETT |rlu| (SPADCALL |upol| (QREFELT % 65))) (LETT |rl| NIL)
                 (SEQ (LETT #1# |rlu|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |lc1| (SPADCALL |f1| (QREFELT % 31)))
                           (LETT |f1|
                                 (SPADCALL (SPADCALL |lc1| (QREFELT % 33)) |f1|
                                           (QREFELT % 34)))
                           (EXIT
                            (LETT |rl|
                                  (CONS
                                   (VECTOR (CONS 1 "sqfr")
                                           (SPADCALL |f1| (QREFELT % 71)) 1)
                                   |rl|))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (SPADCALL (SPADCALL |lc| (QREFELT % 72)) |rl|
                            (QREFELT % 75))))))))) 

(SDEFUN |UFFACT;irreducible?;UPB;19| ((|pol| (UP)) (% (|Boolean|)))
        (SPROG ((|upol| (|SparseUnivariatePolynomial| F)) (|lc| (F)))
               (SEQ
                (COND
                 ((SPADCALL |pol| (|spadConstant| % 14) (QREFELT % 67)) NIL)
                 (#1='T
                  (SEQ (LETT |upol| (SPADCALL |pol| (QREFELT % 70)))
                       (EXIT
                        (COND
                         ((>
                           (SPADCALL
                            (SPADCALL |upol| (SPADCALL |upol| (QREFELT % 78))
                                      (QREFELT % 79))
                            (QREFELT % 60))
                           0)
                          NIL)
                         (#1#
                          (SEQ (LETT |lc| (SPADCALL |upol| (QREFELT % 31)))
                               (LETT |upol|
                                     (SPADCALL (SPADCALL |lc| (QREFELT % 33))
                                               |upol| (QREFELT % 34)))
                               (EXIT (SPADCALL |upol| (QREFELT % 66))))))))))))) 

(DECLAIM (NOTINLINE |UnivariateFiniteFieldFactorize;|)) 

(DEFUN |UnivariateFiniteFieldFactorize;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|UnivariateFiniteFieldFactorize| DV$1 DV$2))
          (LETT % (GETREFV 81))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|UnivariateFiniteFieldFactorize|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 10 (SPADCALL (QREFELT % 9)))
          (QSETREFV % 11 (|VectorPolynomialOperationsF| |#1|))
          (QSETREFV % 12 0)
          (QSETREFV % 20 (CONS (QREFELT % 10) (|UFFACT;get_deg_GF| %)))
          (COND
           ((|domainEqual| |#1| (|PrimeField| (QREFELT % 10)))
            (COND
             ((|HasSignature| |#1|
                              (LIST '|convert|
                                    (LIST '(|Integer|) (|devaluate| |#1|))))
              (PROGN
               (QSETREFV % 63
                         (CONS (|dispatchFunction| |UFFACT;sufactor;SupR;8|)
                               %))
               (QSETREFV % 65
                         (CONS
                          (|dispatchFunction|
                           |UFFACT;sufactor_square_free;SupL;9|)
                          %))
               (QSETREFV % 66
                         (CONS
                          (|dispatchFunction| |UFFACT;su_irreducible?;SupB;10|)
                          %))))
             ('T
              (PROGN
               (QSETREFV % 63
                         (CONS (|dispatchFunction| |UFFACT;sufactor;SupR;11|)
                               %))
               (QSETREFV % 65
                         (CONS
                          (|dispatchFunction|
                           |UFFACT;sufactor_square_free;SupL;12|)
                          %))
               (QSETREFV % 66
                         (CONS
                          (|dispatchFunction| |UFFACT;su_irreducible?;SupB;13|)
                          %))))))
           ('T
            (PROGN
             (QSETREFV % 63
                       (CONS (|dispatchFunction| |UFFACT;sufactor;SupR;14|) %))
             (QSETREFV % 65
                       (CONS
                        (|dispatchFunction|
                         |UFFACT;sufactor_square_free;SupL;15|)
                        %))
             (QSETREFV % 66
                       (CONS
                        (|dispatchFunction| |UFFACT;su_irreducible?;SupB;16|)
                        %)))))
          %))) 

(DEFUN |UnivariateFiniteFieldFactorize| (&REST #1=#:G103)
  (SPROG NIL
         (PROG (#2=#:G104)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariateFiniteFieldFactorize|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |UnivariateFiniteFieldFactorize;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariateFiniteFieldFactorize|)))))))))) 

(MAKEPROP '|UnivariateFiniteFieldFactorize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |characteristic|) '|ch_prime| '|pV|
              '|deg_GF| (4 . |Zero|) (8 . |Zero|) (12 . |size|)
              (|Union| % '"failed") (16 . |exquo|) (22 . |One|) (26 . |One|)
              '|mD| (|PrimitiveArray| 6) (|SparseUnivariatePolynomial| 6)
              (30 . |to_mod_pa|) (|List| 21)
              (|Record| (|:| |i_mod| 42) (|:| |deg| 42))
              (|ModularFactorizationK| 6) (35 . |mfactor|) (41 . |pa_to_sup|)
              (|Boolean|) (46 . |irreducible?|) (52 . |leadingCoefficient|)
              (57 . ~=) (63 . |inv|) (68 . *) (|Factored| %)
              (74 . |squareFree|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 37) (|:| |factor| 22) (|:| |exponent| 8))
              (|List| 38) (|Factored| 22) (79 . |factorList|) (|Integer|)
              (84 . |convert|) (|SparseUnivariatePolynomial| 42)
              (|Mapping| 42 6) (|SparseUnivariatePolynomialFunctions2| 6 42)
              (89 . |map|) (|U32Vector|) (|U32VectorPolynomialOperations|)
              (95 . |to_mod_pa|) (|List| 48) (|ModularFactorization|)
              (101 . |mfactor|) (107 . |pa_to_sup|) (112 . |coerce|)
              (|Mapping| 6 42) (|SparseUnivariatePolynomialFunctions2| 42 6)
              (117 . |map|) (123 . |irreducible?|) (129 . |degree|)
              (|Record| (|:| |factor| 22) (|:| |exponent| 8))
              (|Record| (|:| |cont| 6) (|:| |factors| (|List| 61)))
              (134 . |sufactor|) (|List| 22) (139 . |sufactor_square_free|)
              (144 . |su_irreducible?|) (149 . =) (|Factored| 7) (155 . |Zero|)
              (159 . |makeSUP|) (164 . |unmakeSUP|) (169 . |coerce|)
              (|Record| (|:| |flag| 37) (|:| |factor| 7) (|:| |exponent| 8))
              (|List| 73) (174 . |makeFR|) |UFFACT;factor;UPF;17|
              |UFFACT;factorSquareFree;UPF;18| (180 . |differentiate|)
              (185 . |gcd|) |UFFACT;irreducible?;UPB;19|)
           '#(|sufactor_square_free| 191 |sufactor| 196 |su_irreducible?| 201
              |irreducible?| 206 |factorSquareFree| 211 |factor| 216)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|factor| ((|Factored| |#2|) |#2|)) T)
                                   '((|factorSquareFree|
                                      ((|Factored| |#2|) |#2|))
                                     T)
                                   '((|sufactor|
                                      ((|Record| (|:| |cont| |#1|)
                                                 (|:| |factors|
                                                      (|List|
                                                       (|Record|
                                                        (|:| |factor|
                                                             (|SparseUnivariatePolynomial|
                                                              |#1|))
                                                        (|:| |exponent|
                                                             (|NonNegativeInteger|))))))
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T)
                                   '((|sufactor_square_free|
                                      ((|List|
                                        (|SparseUnivariatePolynomial| |#1|))
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T)
                                   '((|su_irreducible?|
                                      ((|Boolean|)
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T)
                                   '((|irreducible?| ((|Boolean|) |#2|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 80
                                            '(0 6 8 9 0 6 0 13 0 7 0 14 0 6 8
                                              15 2 8 16 0 0 17 0 6 0 18 0 7 0
                                              19 1 11 21 22 23 2 26 24 21 25 27
                                              1 11 22 21 28 2 26 29 21 25 30 1
                                              22 6 0 31 2 6 29 0 0 32 1 6 0 0
                                              33 2 22 0 6 0 34 1 22 35 0 36 1
                                              40 39 0 41 1 6 42 0 43 2 46 44 45
                                              22 47 2 49 48 44 42 50 2 52 51 48
                                              42 53 1 49 44 48 54 1 6 0 42 55 2
                                              57 22 56 44 58 2 52 29 48 42 59 1
                                              22 8 0 60 1 0 62 22 63 1 0 64 22
                                              65 1 0 29 22 66 2 7 29 0 0 67 0
                                              68 0 69 1 7 22 0 70 1 7 0 22 71 1
                                              7 0 6 72 2 68 0 7 74 75 1 22 0 0
                                              78 2 22 0 0 0 79 1 0 64 22 65 1 0
                                              62 22 63 1 0 29 22 66 1 0 29 7 80
                                              1 0 68 7 77 1 0 68 7 76)))))
           '|lookupComplete|)) 
