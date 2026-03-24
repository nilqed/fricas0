
(SDEFUN |SOLVERAD;New| ((|s| (|Expression| R)) (% (|Expression| R)))
        (SPROG ((S (|Expression| R)))
               (SEQ
                (COND
                 ((SPADCALL |s| (|spadConstant| % 13) (QREFELT % 15))
                  (|spadConstant| % 13))
                 ('T
                  (SEQ
                   (LETT S
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL (QREFELT % 17)) (QREFELT % 19))
                           (QREFELT % 21))
                          (QREFELT % 22)))
                   (SETELT % 7
                           (SPADCALL (LIST (SPADCALL S |s| (QREFELT % 23)))
                                     (QREFELT % 7) (QREFELT % 25)))
                   (EXIT S))))))) 

(SDEFUN |SOLVERAD;linear|
        ((|u| (|SparseUnivariatePolynomial| (|Polynomial| R)))
         (% (|List| (|Expression| R))))
        (LIST
         (SPADCALL
          (SPADCALL (SPADCALL (SPADCALL |u| 0 (QREFELT % 28)) (QREFELT % 29))
                    (QREFELT % 30))
          (SPADCALL (SPADCALL |u| 1 (QREFELT % 28)) (QREFELT % 30))
          (QREFELT % 33)))) 

(SDEFUN |SOLVERAD;quadratic|
        ((|u| (|SparseUnivariatePolynomial| (|Polynomial| R)))
         (% (|List| (|Expression| R))))
        (SPADCALL (SPADCALL (ELT % 30) |u| (QREFELT % 37)) (QREFELT % 40))) 

(SDEFUN |SOLVERAD;cubic|
        ((|u| (|SparseUnivariatePolynomial| (|Polynomial| R)))
         (% (|List| (|Expression| R))))
        (SPADCALL (SPADCALL (ELT % 30) |u| (QREFELT % 37)) (QREFELT % 41))) 

(SDEFUN |SOLVERAD;quartic|
        ((|u| (|SparseUnivariatePolynomial| (|Polynomial| R)))
         (% (|List| (|Expression| R))))
        (SPADCALL (SPADCALL (ELT % 30) |u| (QREFELT % 37)) (QREFELT % 42))) 

(SDEFUN |SOLVERAD;rad| ((|n| (|PositiveInteger|)) (% (|Expression| R)))
        (SPADCALL |n| (QREFELT % 44))) 

(SDEFUN |SOLVERAD;wrap| ((|s| (|Expression| R)) (% (|Expression| R)))
        (COND ((QREFELT % 8) (|SOLVERAD;New| |s| %)) ('T |s|))) 

(SDEFUN |SOLVERAD;sol_lin1|
        ((|p| (|Polynomial| R)) (|vv| (|Symbol|)) (% (|Expression| R)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |p| |vv| (QREFELT % 46)) 0 (QREFELT % 28))
           (QREFELT % 30))
          (QREFELT % 47))
         (SPADCALL (SPADCALL (SPADCALL |p| |vv| (QREFELT % 46)) (QREFELT % 48))
                   (QREFELT % 30))
         (QREFELT % 33))) 

(SDEFUN |SOLVERAD;find_gen_zeros|
        ((|rlp| (|List| (|Polynomial| R))) (|rlv| (|List| (|Symbol|)))
         (|res| (|List| (|List| (|Expression| R))))
         (% (|List| (|List| (|Expression| R)))))
        (SPROG
         ((|res1| (|List| (|Expression| R))) (#1=#:G34 NIL) (|vv| NIL)
          (#2=#:G35 NIL) (|p| NIL) (#3=#:G33 NIL) (#4=#:G32 NIL) (|r| NIL)
          (|v| (|Symbol|)) (|pp| (|Polynomial| R)))
         (SEQ (LETT |pp| (|SPADfirst| |rlp|)) (LETT |rlp| (CDR |rlp|))
              (LETT |v| (|SPADfirst| |rlv|)) (LETT |rlv| (CDR |rlv|))
              (SEQ (LETT |r| NIL)
                   (LETT #4#
                         (REVERSE
                          (SPADCALL (SPADCALL |pp| (QREFELT % 21)) |v|
                                    (QREFELT % 49))))
                   G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |r| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |res1|
                          (PROGN
                           (LETT #3# NIL)
                           (SEQ (LETT |p| NIL) (LETT #2# |rlp|) (LETT |vv| NIL)
                                (LETT #1# |rlv|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |vv| (CAR #1#)) NIL)
                                      (ATOM #2#)
                                      (PROGN (LETT |p| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3#
                                        (CONS
                                         (SPADCALL
                                          (|SOLVERAD;sol_lin1| |p| |vv| %)
                                          (SPADCALL |v| (QREFELT % 51)) |r|
                                          (QREFELT % 53))
                                         #3#))))
                                (LETT #1#
                                      (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                                (GO G190) G191 (EXIT (NREVERSE #3#)))))
                    (EXIT
                     (LETT |res| (CONS (REVERSE (CONS |r| |res1|)) |res|))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |SOLVERAD;find_ngen_zeros|
        ((|rlp| (|List| (|Polynomial| R))) (|rlv| (|List| (|Symbol|)))
         (|res| (|List| (|List| (|Expression| R))))
         (% (|List| (|List| (|Expression| R)))))
        (SPROG ((#1=#:G40 NIL) (|res1| NIL))
               (SEQ
                (SEQ (LETT |res1| NIL)
                     (LETT #1# (|SOLVERAD;findZeros| |rlp| |rlv| %)) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |res1| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (EXIT (LETT |res| (CONS |res1| |res|))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))) 

(SDEFUN |SOLVERAD;findZeros|
        ((|rlp| (|List| (|Polynomial| R))) (|rlv| (|List| (|Symbol|)))
         (% (|List| (|List| (|Expression| R)))))
        (SPROG
         ((|res| (|List| (|List| (|Expression| R))))
          (|rlv1| (|List| (|Symbol|)))
          (|lv1| (|List| (|Kernel| (|Expression| R))))
          (|p1| (|List| (|Expression| R))) (|res1| (|List| (|Expression| R)))
          (#1=#:G54 NIL) (|par| NIL)
          (|parRes| (|List| (|List| (|Expression| R)))) (#2=#:G52 NIL)
          (|p| NIL) (#3=#:G53 NIL) (|v| NIL) (#4=#:G51 NIL))
         (SEQ
          (LETT |parRes|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |v| NIL) (LETT #3# |rlv|) (LETT |p| NIL)
                      (LETT #2# |rlp|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL)
                            (ATOM #3#) (PROGN (LETT |v| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL (SPADCALL |p| (QREFELT % 21)) |v|
                                         (QREFELT % 49))
                               #4#))))
                      (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#))))
                      (GO G190) G191 (EXIT (NREVERSE #4#)))))
          (LETT |parRes| (|SOLVERAD;select| |parRes| %)) (LETT |res| NIL)
          (SEQ (LETT |par| NIL) (LETT #1# |parRes|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |par| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (LETT |res1| (LIST (|SPADfirst| |par|)))
                    (LETT |lv1|
                          (LIST (SPADCALL (|SPADfirst| |rlv|) (QREFELT % 51))))
                    (LETT |rlv1| (CDR |rlv|)) (LETT |p1| (CDR |par|))
                    (SEQ G190
                         (COND
                          ((NULL (SPADCALL |p1| NIL (QREFELT % 54)))
                           (GO G191)))
                         (SEQ
                          (LETT |res1|
                                (CONS
                                 (SPADCALL (|SPADfirst| |p1|) |lv1| |res1|
                                           (QREFELT % 57))
                                 |res1|))
                          (LETT |p1| (CDR |p1|))
                          (LETT |lv1|
                                (CONS
                                 (SPADCALL (|SPADfirst| |rlv1|) (QREFELT % 51))
                                 |lv1|))
                          (EXIT (LETT |rlv1| (CDR |rlv1|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |res| (CONS |res1| |res|))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |SOLVERAD;radicalSolve;FSL;12|
        ((|pol| (|Fraction| (|Polynomial| R))) (|v| (|Symbol|))
         (% (|List| (|Equation| (|Expression| R)))))
        (SPROG ((#1=#:G59 NIL) (|r| NIL) (#2=#:G58 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |r| NIL)
                      (LETT #1# (SPADCALL |pol| |v| (QREFELT % 49))) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |v| (QREFELT % 58)) |r|
                                         (QREFELT % 59))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SOLVERAD;radicalSolve;FL;13|
        ((|p| (|Fraction| (|Polynomial| R)))
         (% (|List| (|Equation| (|Expression| R)))))
        (SPROG ((|lv| (|List| (|Symbol|))))
               (SEQ
                (COND
                 ((SPADCALL |p| (QREFELT % 61))
                  (|error| "equation is always satisfied"))
                 (#1='T
                  (SEQ
                   (LETT |lv|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |p| (QREFELT % 62))
                                     (QREFELT % 64))
                           (SPADCALL (SPADCALL |p| (QREFELT % 65))
                                     (QREFELT % 64))
                           (QREFELT % 66))
                          (QREFELT % 67)))
                   (EXIT
                    (COND ((NULL |lv|) (|error| "inconsistent equation"))
                          ((> (LENGTH |lv|) 1) (|error| "too many variables"))
                          (#1#
                           (SPADCALL |p| (|SPADfirst| |lv|)
                                     (QREFELT % 60))))))))))) 

(SDEFUN |SOLVERAD;radicalSolve;EL;14|
        ((|eq| (|Equation| (|Fraction| (|Polynomial| R))))
         (% (|List| (|Equation| (|Expression| R)))))
        (SPADCALL
         (SPADCALL (SPADCALL |eq| (QREFELT % 70))
                   (SPADCALL |eq| (QREFELT % 71)) (QREFELT % 72))
         (QREFELT % 68))) 

(SDEFUN |SOLVERAD;radicalSolve;ESL;15|
        ((|eq| (|Equation| (|Fraction| (|Polynomial| R)))) (|v| (|Symbol|))
         (% (|List| (|Equation| (|Expression| R)))))
        (SPADCALL
         (SPADCALL (SPADCALL |eq| (QREFELT % 70))
                   (SPADCALL |eq| (QREFELT % 71)) (QREFELT % 72))
         |v| (QREFELT % 60))) 

(SDEFUN |SOLVERAD;radicalRoots;LLL;16|
        ((|lp| (|List| (|Fraction| (|Polynomial| R))))
         (|lv| (|List| (|Symbol|))) (% (|List| (|List| (|Expression| R)))))
        (SPROG
         ((|ngen_res| (|List| (|List| (|Expression| R))))
          (|gen_res| (|List| (|List| (|Expression| R)))) (#1=#:G77 NIL)
          (|pres| NIL) (|rpRes| (|List| (|List| (|Polynomial| R))))
          (#2=#:G76 NIL) (|res| NIL) (#3=#:G75 NIL) (|rlv| (|List| (|Symbol|)))
          (|parRes| (|List| (|List| (|Polynomial| R)))))
         (SEQ
          (COND
           ((EQL (LENGTH |lp|) 1)
            (COND
             ((> (LENGTH |lv|) 1)
              (EXIT
               (|error|
                "system does not have a finite number of solutions"))))))
          (LETT |parRes| (SPADCALL |lp| |lv| (QREFELT % 78)))
          (LETT |rlv| (REVERSE |lv|)) (LETT |gen_res| NIL)
          (LETT |ngen_res| NIL)
          (LETT |rpRes|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |res| NIL) (LETT #2# |parRes|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |res| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #3# (CONS (REVERSE |res|) #3#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (SEQ (LETT |pres| NIL) (LETT #1# |rpRes|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |pres| (CAR #1#)) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((|SOLVERAD;isGeneric?| |pres| |rlv| %)
                   (LETT |gen_res|
                         (|SOLVERAD;find_gen_zeros| |pres| |rlv| |gen_res| %)))
                  ('T
                   (LETT |ngen_res|
                         (|SOLVERAD;find_ngen_zeros| |pres| |rlv| |ngen_res|
                          %))))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (REVERSE |ngen_res|) (REVERSE |gen_res|)
                     (QREFELT % 80)))))) 

(SDEFUN |SOLVERAD;radicalSolve;LLL;17|
        ((|lp| (|List| (|Fraction| (|Polynomial| R))))
         (|lv| (|List| (|Symbol|)))
         (% (|List| (|List| (|Equation| (|Expression| R))))))
        (SPROG ((#1=#:G82 NIL) (|lres| NIL) (#2=#:G81 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |lres| NIL)
                      (LETT #1# (SPADCALL |lp| |lv| (QREFELT % 81))) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |lres| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (|SOLVERAD;makeEq| |lres| |lv| %) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SOLVERAD;radicalSolve;LL;18|
        ((|lp| (|List| (|Fraction| (|Polynomial| R))))
         (% (|List| (|List| (|Equation| (|Expression| R))))))
        (SPROG
         ((#1=#:G92 NIL) (|lres| NIL) (#2=#:G91 NIL)
          (|lv| #3=(|List| (|Symbol|))) (#4=#:G84 NIL) (#5=#:G83 #3#)
          (#6=#:G85 #3#) (#7=#:G90 NIL) (|p| NIL))
         (SEQ
          (LETT |lv|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |p| NIL) (LETT #7# |lp|) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |p| (CAR #7#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #6#
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| (QREFELT % 62))
                                          (QREFELT % 64))
                                (SPADCALL (SPADCALL |p| (QREFELT % 65))
                                          (QREFELT % 64))
                                (QREFELT % 84)))
                         (COND
                          (#4# (LETT #5# (SPADCALL #5# #6# (QREFELT % 84))))
                          ('T (PROGN (LETT #5# #6#) (LETT #4# 'T)))))))
                      (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                 (COND (#4# #5#) ('T (|IdentityError| '|setUnion|)))))
          (EXIT
           (PROGN
            (LETT #2# NIL)
            (SEQ (LETT |lres| NIL)
                 (LETT #1# (SPADCALL |lp| |lv| (QREFELT % 81))) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |lres| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (|SOLVERAD;makeEq| |lres| |lv| %) #2#))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SOLVERAD;radicalSolve;LLL;19|
        ((|le| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))
         (|lv| (|List| (|Symbol|)))
         (% (|List| (|List| (|Equation| (|Expression| R))))))
        (SPROG
         ((#1=#:G102 NIL) (|lres| NIL) (#2=#:G101 NIL)
          (|lp| (|List| (|Fraction| (|Polynomial| R)))) (#3=#:G100 NIL)
          (|p| NIL) (#4=#:G99 NIL))
         (SEQ
          (LETT |lp|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |p| NIL) (LETT #3# |le|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL (SPADCALL |p| (QREFELT % 71))
                                         (SPADCALL |p| (QREFELT % 70))
                                         (QREFELT % 72))
                               #4#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (EXIT
           (PROGN
            (LETT #2# NIL)
            (SEQ (LETT |lres| NIL)
                 (LETT #1# (SPADCALL |lp| |lv| (QREFELT % 81))) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |lres| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (|SOLVERAD;makeEq| |lres| |lv| %) #2#))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SOLVERAD;radicalSolve;LL;20|
        ((|le| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))
         (% (|List| (|List| (|Equation| (|Expression| R))))))
        (SPROG
         ((#1=#:G116 NIL) (|lres| NIL) (#2=#:G115 NIL)
          (|lv| #3=(|List| (|Symbol|))) (#4=#:G106 NIL) (#5=#:G105 #3#)
          (#6=#:G107 #3#) (#7=#:G114 NIL) (|p| NIL)
          (|lp| (|List| (|Fraction| (|Polynomial| R)))) (#8=#:G113 NIL)
          (#9=#:G112 NIL))
         (SEQ
          (LETT |lp|
                (PROGN
                 (LETT #9# NIL)
                 (SEQ (LETT |p| NIL) (LETT #8# |le|) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |p| (CAR #8#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #9#
                              (CONS
                               (SPADCALL (SPADCALL |p| (QREFELT % 71))
                                         (SPADCALL |p| (QREFELT % 70))
                                         (QREFELT % 72))
                               #9#))))
                      (LETT #8# (CDR #8#)) (GO G190) G191
                      (EXIT (NREVERSE #9#)))))
          (LETT |lv|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |p| NIL) (LETT #7# |lp|) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |p| (CAR #7#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #6#
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| (QREFELT % 62))
                                          (QREFELT % 64))
                                (SPADCALL (SPADCALL |p| (QREFELT % 65))
                                          (QREFELT % 64))
                                (QREFELT % 84)))
                         (COND
                          (#4# (LETT #5# (SPADCALL #5# #6# (QREFELT % 84))))
                          ('T (PROGN (LETT #5# #6#) (LETT #4# 'T)))))))
                      (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                 (COND (#4# #5#) ('T (|IdentityError| '|setUnion|)))))
          (EXIT
           (PROGN
            (LETT #2# NIL)
            (SEQ (LETT |lres| NIL)
                 (LETT #1# (SPADCALL |lp| |lv| (QREFELT % 81))) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |lres| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (|SOLVERAD;makeEq| |lres| |lv| %) #2#))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SOLVERAD;contractSolve;ESSt;21|
        ((|eq| (|Equation| (|Fraction| (|Polynomial| R)))) (|v| (|Symbol|))
         (%
          (|SuchThat| (|List| (|Expression| R))
                      (|List| (|Equation| (|Expression| R))))))
        (|SOLVERAD;solveInner|
         (SPADCALL
          (SPADCALL (SPADCALL |eq| (QREFELT % 70))
                    (SPADCALL |eq| (QREFELT % 71)) (QREFELT % 72))
          (QREFELT % 62))
         |v| 'T %)) 

(SDEFUN |SOLVERAD;contractSolve;FSSt;22|
        ((|pq| (|Fraction| (|Polynomial| R))) (|v| (|Symbol|))
         (%
          (|SuchThat| (|List| (|Expression| R))
                      (|List| (|Equation| (|Expression| R))))))
        (|SOLVERAD;solveInner| (SPADCALL |pq| (QREFELT % 62)) |v| 'T %)) 

(SDEFUN |SOLVERAD;radicalRoots;FSL;23|
        ((|pq| (|Fraction| (|Polynomial| R))) (|v| (|Symbol|))
         (% (|List| (|Expression| R))))
        (SPADCALL
         (|SOLVERAD;solveInner| (SPADCALL |pq| (QREFELT % 62)) |v| NIL %)
         (QREFELT % 92))) 

(SDEFUN |SOLVERAD;isGeneric?|
        ((|rlp| (|List| (|Polynomial| R))) (|rlv| (|List| (|Symbol|)))
         (% (|Boolean|)))
        (SPROG
         ((#1=#:G121 NIL) (#2=#:G120 #3=(|Boolean|)) (#4=#:G122 #3#)
          (#5=#:G124 NIL) (|f| NIL) (#6=#:G125 NIL) (|x| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |x| NIL) (LETT #6# (CDR |rlv|)) (LETT |f| NIL)
                (LETT #5# (CDR |rlp|)) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#)) NIL) (ATOM #6#)
                      (PROGN (LETT |x| (CAR #6#)) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (EQL (SPADCALL |f| |x| (QREFELT % 93)) 1))
                   (COND (#1# (LETT #2# (COND (#2# #4#) ('T NIL))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#)))) (GO G190)
                G191 (EXIT NIL))
           (COND (#1# #2#) ('T 'T)))))) 

(SDEFUN |SOLVERAD;select|
        ((|lp| (|List| (|List| (|Expression| R))))
         (% #1=(|List| (|List| (|Expression| R)))))
        (SPROG
         ((#2=#:G127 NIL) (#3=#:G126 #1#) (#4=#:G128 #1#) (#5=#:G134 NIL)
          (|lsel| NIL) (#6=#:G133 NIL) (#7=#:G132 NIL) (|f| NIL))
         (SEQ
          (COND
           ((SPADCALL |lp| NIL (QREFELT % 94)) (SPADCALL NIL (QREFELT % 95)))
           (#8='T
            (PROGN
             (LETT #2# NIL)
             (SEQ (LETT |f| NIL) (LETT #7# (|SPADfirst| |lp|)) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (PROGN
                            (LETT #6# NIL)
                            (SEQ (LETT |lsel| NIL)
                                 (LETT #5# (|SOLVERAD;select| (CDR |lp|) %))
                                 G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |lsel| (CAR #5#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #6# (CONS (CONS |f| |lsel|) #6#))))
                                 (LETT #5# (CDR #5#)) (GO G190) G191
                                 (EXIT (NREVERSE #6#)))))
                     (COND (#2# (LETT #3# (SPADCALL #3# #4# (QREFELT % 80))))
                           ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                  (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
             (COND (#2# #3#) (#8# NIL)))))))) 

(SDEFUN |SOLVERAD;makeEq|
        ((|nres| (|List| (|Expression| R))) (|lv| (|List| (|Symbol|)))
         (% (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((#1=#:G139 NIL) (|x| NIL) (#2=#:G140 NIL) (|r| NIL) (#3=#:G138 NIL))
         (SEQ
          (PROGN
           (LETT #3# NIL)
           (SEQ (LETT |r| NIL) (LETT #2# |nres|) (LETT |x| NIL) (LETT #1# |lv|)
                G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL) (ATOM #2#)
                      (PROGN (LETT |r| (CAR #2#)) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #3#
                        (CONS
                         (SPADCALL (SPADCALL |x| (QREFELT % 58)) |r|
                                   (QREFELT % 59))
                         #3#))))
                (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#)))) (GO G190)
                G191 (EXIT (NREVERSE #3#))))))) 

(SDEFUN |SOLVERAD;cyclotomic_case?;SupU;27|
        ((|u| (|SparseUnivariatePolynomial| (|Polynomial| R)))
         (% (|Union| (|Integer|) "failed")))
        (SPROG
         ((|iu| (|SparseUnivariatePolynomial| (|Integer|))) (#1=#:G151 NIL)
          (|icu| (|Union| (|Integer|) "failed")) (|c| (R))
          (|cp| (|Polynomial| R)))
         (SEQ
          (EXIT
           (SEQ (LETT |iu| (|spadConstant| % 97))
                (SEQ G190
                     (COND
                      ((NULL
                        (NULL
                         (SPADCALL |u| (|spadConstant| % 98) (QREFELT % 99))))
                       (GO G191)))
                     (SEQ (LETT |cp| (SPADCALL |u| (QREFELT % 48)))
                          (COND
                           ((NULL (SPADCALL |cp| (QREFELT % 100)))
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 1 "failed"))
                              (GO #2=#:G150)))))
                          (LETT |c| (SPADCALL |cp| (QREFELT % 101)))
                          (LETT |icu| (SPADCALL |c| (QREFELT % 103)))
                          (EXIT
                           (COND
                            ((QEQCAR |icu| 1)
                             (PROGN (LETT #1# (CONS 1 "failed")) (GO #2#)))
                            ('T
                             (SEQ
                              (LETT |iu|
                                    (SPADCALL |iu|
                                              (SPADCALL (QCDR |icu|)
                                                        (SPADCALL |u|
                                                                  (QREFELT %
                                                                           104))
                                                        (QREFELT % 105))
                                              (QREFELT % 106)))
                              (EXIT
                               (LETT |u| (SPADCALL |u| (QREFELT % 107)))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |iu| (QREFELT % 109)))))
          #2# (EXIT #1#)))) 

(PUT '|SOLVERAD;cyclotomic_case?;SupU;28| '|SPADreplace|
     '(XLAM (|u|) (CONS 1 "failed"))) 

(SDEFUN |SOLVERAD;cyclotomic_case?;SupU;28|
        ((|u| (|SparseUnivariatePolynomial| (|Polynomial| R)))
         (% (|Union| (|Integer|) "failed")))
        (CONS 1 "failed")) 

(SDEFUN |SOLVERAD;radical_solve;SupU;29|
        ((|p| (|SparseUnivariatePolynomial| (|Polynomial| R)))
         (% (|Union| (|List| (|Expression| R)) "failed")))
        (SPADCALL (SPADCALL (ELT % 30) |p| (QREFELT % 37)) (QREFELT % 113))) 

(PUT '|SOLVERAD;radical_solve;SupU;30| '|SPADreplace|
     '(XLAM (|p|) (CONS 1 "failed"))) 

(SDEFUN |SOLVERAD;radical_solve;SupU;30|
        ((|p| (|SparseUnivariatePolynomial| (|Polynomial| R)))
         (% (|Union| (|List| (|Expression| R)) "failed")))
        (CONS 1 "failed")) 

(PUT '|SOLVERAD;radical_solve;SupU;31| '|SPADreplace|
     '(XLAM (|p|) (CONS 1 "failed"))) 

(SDEFUN |SOLVERAD;radical_solve;SupU;31|
        ((|p| (|SparseUnivariatePolynomial| (|Polynomial| R)))
         (% (|Union| (|List| (|Expression| R)) "failed")))
        (CONS 1 "failed")) 

(PUT '|SOLVERAD;radical_solve;SupU;32| '|SPADreplace|
     '(XLAM (|p|) (CONS 1 "failed"))) 

(SDEFUN |SOLVERAD;radical_solve;SupU;32|
        ((|p| (|SparseUnivariatePolynomial| (|Polynomial| R)))
         (% (|Union| (|List| (|Expression| R)) "failed")))
        (CONS 1 "failed")) 

(SDEFUN |SOLVERAD;solveInner|
        ((|pq| (|Polynomial| R)) (|v| (|Symbol|)) (|contractFlag| (|Boolean|))
         (%
          (|SuchThat| (|List| (|Expression| R))
                      (|List| (|Equation| (|Expression| R))))))
        (SPROG
         ((|re| (|List| (|Equation| (|Expression| R))))
          (|solutions| (|List| (|Expression| R))) (#1=#:G207 NIL) (|i| NIL)
          (T0 (|List| (|Expression| R))) (|s| (|Expression| R)) (#2=#:G206 NIL)
          (|l| (|List| (|Expression| R)))
          (|unsolved| (|List| (|Polynomial| R)))
          (|lu| (|Union| (|List| (|Expression| R)) "failed")) (#3=#:G205 NIL)
          (#4=#:G184 NIL) (|iu| (|Union| (|Integer|) "failed"))
          (|n| (|NonNegativeInteger|))
          (|u| #5=(|SparseUnivariatePolynomial| (|Polynomial| R)))
          (|t| (|Record| (|:| |pol| #5#) (|:| |deg| (|PositiveInteger|))))
          (|constants| (|List| (|Polynomial| R))) (|ff| #6=(|Polynomial| R))
          (#7=#:G204 NIL) (|f| NIL)
          (|lfactors|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #6#)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ (SETELT % 7 NIL) (SETELT % 8 |contractFlag|)
              (LETT |t|
                    (SPADCALL (SPADCALL |pq| |v| (QREFELT % 46))
                              (QREFELT % 117)))
              (LETT |u| (QCAR |t|))
              (COND
               ((EQL (SPADCALL |u| (QREFELT % 104)) 1)
                (COND
                 ((SPADCALL (SPADCALL |u| (QREFELT % 48))
                            (SPADCALL (SPADCALL |u| 0 (QREFELT % 28))
                                      (QREFELT % 29))
                            (QREFELT % 118))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (|spadConstant| % 119) (QCDR |t|)
                              (QREFELT % 121))
                    NIL (QREFELT % 122)))))))
              (COND
               ((EQL (SPADCALL |u| (QREFELT % 104)) 1)
                (COND
                 ((SPADCALL (SPADCALL |u| (QREFELT % 48))
                            (SPADCALL |u| 0 (QREFELT % 28)) (QREFELT % 118))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL (|spadConstant| % 119) (QREFELT % 47))
                              (QCDR |t|) (QREFELT % 121))
                    NIL (QREFELT % 122)))))))
              (LETT |lfactors|
                    (SPADCALL (SPADCALL |pq| (QREFELT % 125)) (QREFELT % 129)))
              (LETT |constants| NIL) (LETT |unsolved| NIL)
              (LETT |solutions| NIL)
              (SEQ (LETT |f| NIL) (LETT #7# |lfactors|) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ff| (QVELT |f| 1))
                        (COND
                         ((NULL
                           (SPADCALL |v| (SPADCALL |ff| (QREFELT % 64))
                                     (QREFELT % 130)))
                          (EXIT (LETT |constants| (CONS |ff| |constants|)))))
                        (LETT |u| (SPADCALL |ff| |v| (QREFELT % 46)))
                        (LETT |t| (SPADCALL |u| (QREFELT % 117)))
                        (LETT |u| (QCAR |t|))
                        (LETT |n| (SPADCALL |u| (QREFELT % 104)))
                        (LETT |l|
                              (COND ((EQL |n| 1) (|SOLVERAD;linear| |u| %))
                                    ((EQL |n| 2) (|SOLVERAD;quadratic| |u| %))
                                    ('T
                                     (SEQ
                                      (LETT |iu|
                                            (SPADCALL |u| (QREFELT % 110)))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |iu| 0)
                                         (SEQ
                                          (LETT T0
                                                (SPADCALL
                                                 (* (QCDR |t|)
                                                    (PROG1
                                                        (LETT #4# (QCDR |iu|))
                                                      (|check_subtype2|
                                                       (> #4# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #4#)))
                                                 (QREFELT % 131)))
                                          (SEQ (LETT |i| 1)
                                               (LETT #3# (QVELT |f| 2)) G190
                                               (COND
                                                ((|greater_SI| |i| #3#)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT |solutions|
                                                       (SPADCALL T0 |solutions|
                                                                 (QREFELT %
                                                                          132)))))
                                               (LETT |i| (|inc_SI| |i|))
                                               (GO G190) G191 (EXIT NIL))
                                          (EXIT NIL)))
                                        ('T
                                         (SEQ
                                          (LETT |lu|
                                                (SPADCALL |u| (QREFELT % 114)))
                                          (EXIT
                                           (COND ((QEQCAR |lu| 0) (QCDR |lu|))
                                                 ((EQL |n| 3)
                                                  (|SOLVERAD;cubic| |u| %))
                                                 ((EQL |n| 4)
                                                  (|SOLVERAD;quartic| |u| %))
                                                 ('T
                                                  (SEQ
                                                   (LETT |unsolved|
                                                         (CONS |ff|
                                                               |unsolved|))
                                                   (EXIT NIL)))))))))))))
                        (EXIT
                         (SEQ (LETT #2# |l|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |s| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (COND
                                ((> (QCDR |t|) 1)
                                 (LETT |s| (|SOLVERAD;wrap| |s| %))))
                               (LETT T0
                                     (SPADCALL |s| (QCDR |t|) (QREFELT % 121)))
                               (SEQ (LETT |i| 1) (LETT #1# (QVELT |f| 2)) G190
                                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |solutions|
                                            (SPADCALL T0 |solutions|
                                                      (QREFELT % 132)))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |re| (QREFELT % 7))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |solutions| (QREFELT % 7) (QREFELT % 122)))))) 

(DECLAIM (NOTINLINE |RadicalSolvePackage;|)) 

(DEFUN |RadicalSolvePackage;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|RadicalSolvePackage| DV$1))
          (LETT % (GETREFV 133))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|RadicalSolvePackage| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 NIL)
          (QSETREFV % 8 NIL)
          (COND
           ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
            (QSETREFV % 110
                      (CONS
                       (|dispatchFunction| |SOLVERAD;cyclotomic_case?;SupU;27|)
                       %)))
           ('T
            (QSETREFV % 110
                      (CONS
                       (|dispatchFunction| |SOLVERAD;cyclotomic_case?;SupU;28|)
                       %))))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (COND
             ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
              (COND
               ((|HasCategory| |#1| '(|LinearlyExplicitOver| (|Integer|)))
                (QSETREFV % 114
                          (CONS
                           (|dispatchFunction|
                            |SOLVERAD;radical_solve;SupU;29|)
                           %)))
               ('T
                (QSETREFV % 114
                          (CONS
                           (|dispatchFunction|
                            |SOLVERAD;radical_solve;SupU;30|)
                           %)))))
             ('T
              (QSETREFV % 114
                        (CONS
                         (|dispatchFunction| |SOLVERAD;radical_solve;SupU;31|)
                         %)))))
           ('T
            (QSETREFV % 114
                      (CONS
                       (|dispatchFunction| |SOLVERAD;radical_solve;SupU;32|)
                       %))))
          %))) 

(DEFUN |RadicalSolvePackage| (#1=#:G208)
  (SPROG NIL
         (PROG (#2=#:G209)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RadicalSolvePackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|RadicalSolvePackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RadicalSolvePackage|)))))))))) 

(MAKEPROP '|RadicalSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|SideEquations|
              '|ContractSoln| (0 . |Zero|) (|Equation| 12) (4 . |Zero|)
              (|Expression| 6) (8 . |Zero|) (|Boolean|) (12 . =) (|Symbol|)
              (18 . |new|) (|Polynomial| 6) (22 . |coerce|) (|Fraction| 18)
              (27 . |coerce|) (32 . |coerce|) (37 . =) (|List| 10)
              (43 . |append|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 18) (49 . |coefficient|) (55 . -)
              (60 . |coerce|) (65 . |One|) (69 . |One|) (73 . /)
              (|SparseUnivariatePolynomial| 12) (|Mapping| 12 18)
              (|SparseUnivariatePolynomialFunctions2| 18 12) (79 . |map|)
              (|List| 12) (|PolynomialSolveByFormulas| 34 12 6)
              (85 . |quadratic|) (90 . |cubic|) (95 . |quartic|) (|Integer|)
              (100 . |coerce|) (|SparseUnivariatePolynomial| %)
              (105 . |univariate|) (111 . -) (116 . |leadingCoefficient|)
              |SOLVERAD;radicalRoots;FSL;23| (|Kernel| 12) (121 . |kernel|)
              (|Kernel| %) (126 . |eval|) (133 . ~=) (|List| 52) (|List| %)
              (139 . |eval|) (146 . |coerce|) (151 . |equation|)
              |SOLVERAD;radicalSolve;FSL;12| (157 . |zero?|) (162 . |numer|)
              (|List| 16) (167 . |variables|) (172 . |denom|) (177 . |concat|)
              (183 . |removeDuplicates|) |SOLVERAD;radicalSolve;FL;13|
              (|Equation| 20) (188 . |lhs|) (193 . |rhs|) (198 . -)
              |SOLVERAD;radicalSolve;EL;14| |SOLVERAD;radicalSolve;ESL;15|
              (|List| (|List| 18)) (|List| 20) (|SystemSolvePackage| 6)
              (204 . |triangularSystems|) (|List| 38) (210 . |append|)
              |SOLVERAD;radicalRoots;LLL;16| (|List| 24)
              |SOLVERAD;radicalSolve;LLL;17| (216 . |setUnion|)
              |SOLVERAD;radicalSolve;LL;18| (|List| 69)
              |SOLVERAD;radicalSolve;LLL;19| |SOLVERAD;radicalSolve;LL;20|
              (|SuchThat| 38 24) |SOLVERAD;contractSolve;ESSt;21|
              |SOLVERAD;contractSolve;FSSt;22| (222 . |lhs|) (227 . |degree|)
              (233 . =) (239 . |list|) (|SparseUnivariatePolynomial| 43)
              (244 . |Zero|) (248 . |Zero|) (252 . =) (258 . |ground?|)
              (263 . |ground|) (|Union| 43 '"failed") (268 . |retractIfCan|)
              (273 . |degree|) (278 . |monomial|) (284 . +) (290 . |reductum|)
              (|CyclotomicUtilities|) (295 . |cyclotomic?|)
              (300 . |cyclotomic_case?|) (|Union| 38 '"failed")
              (|RootUtilities| 6 12) (305 . |radical_solve|)
              (310 . |radical_solve|) (|Record| (|:| |pol| 27) (|:| |deg| 120))
              (|DegreeReductionPackage| 18 6) (315 . |reduce|) (320 . =)
              (326 . |One|) (|PositiveInteger|) (330 . |expand|)
              (336 . |construct|) (|Factored| 18)
              (|MultivariateFactorize| 16 (|IndexedExponents| 16) 6 18)
              (342 . |factor|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 126) (|:| |factor| 18) (|:| |exponent| 26))
              (|List| 127) (347 . |factorList|) (352 . |member?|)
              (358 . |cyclotomic_roots|) (363 . |append|))
           '#(|radical_solve| 369 |radicalSolve| 374 |radicalRoots| 418
              |cyclotomic_case?| 430 |contractSolve| 435)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|radicalSolve|
                                 ((|List| (|Equation| (|Expression| |#1|)))
                                  (|Fraction| (|Polynomial| |#1|)) (|Symbol|)))
                                T)
                              '((|radicalSolve|
                                 ((|List| (|Equation| (|Expression| |#1|)))
                                  (|Fraction| (|Polynomial| |#1|))))
                                T)
                              '((|radicalSolve|
                                 ((|List| (|Equation| (|Expression| |#1|)))
                                  (|Equation| (|Fraction| (|Polynomial| |#1|)))
                                  (|Symbol|)))
                                T)
                              '((|radicalSolve|
                                 ((|List| (|Equation| (|Expression| |#1|)))
                                  (|Equation|
                                   (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|radicalSolve|
                                 ((|List|
                                   (|List| (|Equation| (|Expression| |#1|))))
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|Symbol|))))
                                T)
                              '((|radicalSolve|
                                 ((|List|
                                   (|List| (|Equation| (|Expression| |#1|))))
                                  (|List| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|radicalSolve|
                                 ((|List|
                                   (|List| (|Equation| (|Expression| |#1|))))
                                  (|List|
                                   (|Equation|
                                    (|Fraction| (|Polynomial| |#1|))))
                                  (|List| (|Symbol|))))
                                T)
                              '((|radicalSolve|
                                 ((|List|
                                   (|List| (|Equation| (|Expression| |#1|))))
                                  (|List|
                                   (|Equation|
                                    (|Fraction| (|Polynomial| |#1|))))))
                                T)
                              '((|radicalRoots|
                                 ((|List| (|Expression| |#1|))
                                  (|Fraction| (|Polynomial| |#1|)) (|Symbol|)))
                                T)
                              '((|radicalRoots|
                                 ((|List| (|List| (|Expression| |#1|)))
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|Symbol|))))
                                T)
                              '((|contractSolve|
                                 ((|SuchThat| (|List| (|Expression| |#1|))
                                              (|List|
                                               (|Equation|
                                                (|Expression| |#1|))))
                                  (|Equation| (|Fraction| (|Polynomial| |#1|)))
                                  (|Symbol|)))
                                T)
                              '((|contractSolve|
                                 ((|SuchThat| (|List| (|Expression| |#1|))
                                              (|List|
                                               (|Equation|
                                                (|Expression| |#1|))))
                                  (|Fraction| (|Polynomial| |#1|)) (|Symbol|)))
                                T)
                              '((|cyclotomic_case?|
                                 ((|Union| (|Integer|) "failed")
                                  (|SparseUnivariatePolynomial|
                                   (|Polynomial| |#1|))))
                                T)
                              '((|radical_solve|
                                 ((|Union| (|List| (|Expression| |#1|))
                                           "failed")
                                  (|SparseUnivariatePolynomial|
                                   (|Polynomial| |#1|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 132
                                            '(0 6 0 9 0 10 0 11 0 12 0 13 2 12
                                              14 0 0 15 0 16 0 17 1 18 0 16 19
                                              1 20 0 18 21 1 12 0 20 22 2 10 0
                                              12 12 23 2 24 0 0 0 25 2 27 18 0
                                              26 28 1 18 0 0 29 1 12 0 18 30 0
                                              6 0 31 0 10 0 32 2 12 0 0 0 33 2
                                              36 34 35 27 37 1 39 38 34 40 1 39
                                              38 34 41 1 39 38 34 42 1 12 0 43
                                              44 2 18 45 0 16 46 1 12 0 0 47 1
                                              27 18 0 48 1 50 0 16 51 3 12 0 0
                                              52 0 53 2 38 14 0 0 54 3 12 0 0
                                              55 56 57 1 12 0 16 58 2 10 0 12
                                              12 59 1 20 14 0 61 1 20 18 0 62 1
                                              18 63 0 64 1 20 18 0 65 2 63 0 0
                                              0 66 1 63 0 0 67 1 69 20 0 70 1
                                              69 20 0 71 2 20 0 0 0 72 2 77 75
                                              76 63 78 2 79 0 0 0 80 2 63 0 0 0
                                              84 1 89 38 0 92 2 18 26 0 16 93 2
                                              79 14 0 0 94 1 79 0 38 95 0 96 0
                                              97 0 27 0 98 2 27 14 0 0 99 1 18
                                              14 0 100 1 18 6 0 101 1 6 102 0
                                              103 1 27 26 0 104 2 96 0 43 26
                                              105 2 96 0 0 0 106 1 27 0 0 107 1
                                              108 102 96 109 1 0 102 27 110 1
                                              112 111 34 113 1 0 111 27 114 1
                                              116 115 27 117 2 18 14 0 0 118 0
                                              12 0 119 2 116 38 12 120 121 2 89
                                              0 38 24 122 1 124 123 18 125 1
                                              123 128 0 129 2 63 14 16 0 130 1
                                              116 38 120 131 2 38 0 0 0 132 1 0
                                              111 27 114 1 0 82 86 88 1 0 82 76
                                              85 2 0 82 86 63 87 1 0 24 69 73 2
                                              0 82 76 63 83 1 0 24 20 68 2 0 24
                                              69 16 74 2 0 24 20 16 60 2 0 38
                                              20 16 49 2 0 79 76 63 81 1 0 102
                                              27 110 2 0 89 69 16 90 2 0 89 20
                                              16 91)))))
           '|lookupComplete|)) 
