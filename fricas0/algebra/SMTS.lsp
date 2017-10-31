
(PUT '|SMTS;coefficients;$S;1| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |SMTS;coefficients;$S;1| ((|s| $) ($ |Stream| SMP)) |s|) 

(PUT '|SMTS;series;S$;2| '|SPADreplace| '(XLAM (|st|) |st|)) 

(SDEFUN |SMTS;series;S$;2| ((|st| |Stream| SMP) ($ $)) |st|) 

(SDEFUN |SMTS;extend;$Nni$;3| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |x| (+ |n| 1) (QREFELT $ 16))) 

(SDEFUN |SMTS;complete;2$;4| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 19))) 

(SDEFUN |SMTS;evalstream|
        ((|s| $) (|lv| |List| |Var|) (|lsmp| |List| SMP) ($ |Stream| SMP))
        (SPROG NIL
               (SPADCALL (|spadConstant| $ 23) (ELT $ 24)
                         (SPADCALL
                          (CONS #'|SMTS;evalstream!0| (VECTOR $ |lsmp| |lv|))
                          |s| (QREFELT $ 29))
                         (QREFELT $ 32)))) 

(SDEFUN |SMTS;evalstream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|lv| |lsmp| $)
          (LETT |lv| (QREFELT $$ 2) . #1=(|SMTS;evalstream|))
          (LETT |lsmp| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |lv| |lsmp| (QREFELT $ 27)))))) 

(SDEFUN |SMTS;addvariable| ((|v| |Var|) (|s| |InnerTaylorSeries| |Coef|) ($ $))
        (SPROG ((|ints| (|Stream| (|NonNegativeInteger|))))
               (SEQ
                (LETT |ints| (SPADCALL 0 (QREFELT $ 35)) |SMTS;addvariable|)
                (EXIT
                 (SPADCALL (CONS #'|SMTS;addvariable!0| (VECTOR |v| $)) |ints|
                           |s| (QREFELT $ 42)))))) 

(SDEFUN |SMTS;addvariable!0| ((|n1| NIL) (|c2| NIL) ($$ NIL))
        (PROG ($ |v|)
          (LETT $ (QREFELT $$ 1) . #1=(|SMTS;addvariable|))
          (LETT |v| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c2| (QREFELT $ 36)) |v| |n1|
                      (QREFELT $ 37)))))) 

(SDEFUN |SMTS;coefficient;$NniSMP;7|
        ((|x| $) (|n| |NonNegativeInteger|) ($ SMP))
        (SPROG ((#1=#:G738 NIL) (|u| (|Rep|)))
               (SEQ (LETT |u| |x| . #2=(|SMTS;coefficient;$NniSMP;7|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((SPADCALL |u| (QREFELT $ 44)) NIL)
                                  ('T (SPADCALL |n| 0 (QREFELT $ 45)))))
                           (GO G191)))
                         (SEQ (LETT |u| (SPADCALL |u| (QREFELT $ 46)) . #2#)
                              (EXIT
                               (LETT |n|
                                     (PROG1 (LETT #1# (- |n| 1) . #2#)
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     . #2#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (COND
                     ((OR (SPADCALL |u| (QREFELT $ 44))
                          (SPADCALL |n| 0 (QREFELT $ 47)))
                      (EXIT (|spadConstant| $ 23))))
                    (EXIT (SPADCALL |u| (QREFELT $ 48)))))) 

(SDEFUN |SMTS;coefficient;$LL$;8|
        ((|s| $) (|lv| |List| |Var|) (|ln| |List| (|NonNegativeInteger|))
         ($ $))
        (SPROG NIL
               (SPADCALL
                (CONS #'|SMTS;coefficient;$LL$;8!0| (VECTOR $ |ln| |lv|))
                (SPADCALL |s| (SPADCALL (ELT $ 52) |ln| (QREFELT $ 54))
                          (QREFELT $ 55))
                (QREFELT $ 56)))) 

(SDEFUN |SMTS;coefficient;$LL$;8!0| ((|z1| NIL) ($$ NIL))
        (PROG (|lv| |ln| $)
          (LETT |lv| (QREFELT $$ 2) . #1=(|SMTS;coefficient;$LL$;8|))
          (LETT |ln| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |lv| |ln| (QREFELT $ 51)))))) 

(SDEFUN |SMTS;coefficient;$IeCoef;9|
        ((|s| $) (|m| |IndexedExponents| |Var|) ($ |Coef|))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|mon| (|IndexedExponents| |Var|)))
         (SEQ
          (LETT |n|
                (SPADCALL (LETT |mon| |m| . #1=(|SMTS;coefficient;$IeCoef;9|))
                          (QREFELT $ 59))
                . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (NULL
                   (SPADCALL (LETT |mon| (SPADCALL |mon| (QREFELT $ 60)) . #1#)
                             (QREFELT $ 61))))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |n| (+ |n| (SPADCALL |mon| (QREFELT $ 59))) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL |s| |n| (QREFELT $ 49)) |m| (QREFELT $ 62)))))) 

(SDEFUN |SMTS;coerce;Coef$;10| ((|r| |Coef|) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 36)) 0 (QREFELT $ 64))) 

(SDEFUN |SMTS;*;SMP2$;11| ((|smp| SMP) (|p| $) ($ $))
        (SPADCALL |smp| |p| (QREFELT $ 66))) 

(SDEFUN |SMTS;*;Coef2$;12| ((|r| |Coef|) (|p| $) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 36)) |p| (QREFELT $ 66))) 

(SDEFUN |SMTS;*;$Coef$;13| ((|p| $) (|r| |Coef|) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 36)) |p| (QREFELT $ 66))) 

(SDEFUN |SMTS;mts| ((|p| SMP) ($ $))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| SMP)) (|s| ($)) (|v| (|Var|))
          (|uv| (|Union| |Var| "failed")))
         (SEQ (LETT |uv| (SPADCALL |p| (QREFELT $ 71)) . #1=(|SMTS;mts|))
              (EXIT
               (COND ((QEQCAR |uv| 1) (SPADCALL |p| 0 (QREFELT $ 64)))
                     ('T
                      (SEQ (LETT |v| (QCDR |uv|) . #1#)
                           (LETT |s| (|spadConstant| $ 21) . #1#)
                           (LETT |up| (SPADCALL |p| |v| (QREFELT $ 73)) . #1#)
                           (SEQ G190
                                (COND
                                 ((NULL (NULL (SPADCALL |up| (QREFELT $ 75))))
                                  (GO G191)))
                                (SEQ
                                 (LETT |s|
                                       (SPADCALL |s|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (|spadConstant| $ 13) |v|
                                                   (SPADCALL |up|
                                                             (QREFELT $ 76))
                                                   (QREFELT $ 77))
                                                  (|SMTS;mts|
                                                   (SPADCALL |up|
                                                             (QREFELT $ 78))
                                                   $)
                                                  (QREFELT $ 79))
                                                 (QREFELT $ 80))
                                       . #1#)
                                 (EXIT
                                  (LETT |up| (SPADCALL |up| (QREFELT $ 81))
                                        . #1#)))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT |s|)))))))) 

(SDEFUN |SMTS;coerce;SMP$;15| ((|p| SMP) ($ $)) (|SMTS;mts| |p| $)) 

(SDEFUN |SMTS;coerce;Var$;16| ((|v| |Var|) ($ $))
        (SPADCALL (SPADCALL |v| (QREFELT $ 83)) (QREFELT $ 82))) 

(SDEFUN |SMTS;monomial;$VarNni$;17|
        ((|r| $) (|v| |Var|) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |r|
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 85) |v| |n| (QREFELT $ 37)) |n|
                   (QREFELT $ 64))
                  (QREFELT $ 79))) 

(SDEFUN |SMTS;substvar| ((|p| SMP) (|vl| |List| |Var|) (|q| |List| $) ($ $))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| SMP)) (|s| ($)) (|c| (SMP))
          (|v| (|Var|)) (|uv| (|Union| |Var| "failed")))
         (SEQ
          (COND ((NULL |vl|) (SPADCALL |p| 0 (QREFELT $ 64)))
                (#1='T
                 (SEQ
                  (LETT |uv| (SPADCALL |p| (QREFELT $ 71))
                        . #2=(|SMTS;substvar|))
                  (EXIT
                   (COND ((QEQCAR |uv| 1) (SPADCALL |p| 0 (QREFELT $ 64)))
                         (#1#
                          (SEQ (LETT |v| (QCDR |uv|) . #2#)
                               (EXIT
                                (COND
                                 ((SPADCALL |v| (|SPADfirst| |vl|)
                                            (QREFELT $ 86))
                                  (SEQ (LETT |s| (|spadConstant| $ 21) . #2#)
                                       (LETT |up|
                                             (SPADCALL |p| |v| (QREFELT $ 73))
                                             . #2#)
                                       (SEQ G190
                                            (COND
                                             ((NULL
                                               (NULL
                                                (SPADCALL |up|
                                                          (QREFELT $ 75))))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |c|
                                                   (SPADCALL |up|
                                                             (QREFELT $ 78))
                                                   . #2#)
                                             (LETT |s|
                                                   (SPADCALL |s|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL |q|
                                                                         (QREFELT
                                                                          $
                                                                          88))
                                                               (SPADCALL |up|
                                                                         (QREFELT
                                                                          $
                                                                          76))
                                                               (QREFELT $ 89))
                                                              (|SMTS;substvar|
                                                               |c| (CDR |vl|)
                                                               (SPADCALL |q|
                                                                         (QREFELT
                                                                          $
                                                                          90))
                                                               $)
                                                              (QREFELT $ 79))
                                                             (QREFELT $ 80))
                                                   . #2#)
                                             (EXIT
                                              (LETT |up|
                                                    (SPADCALL |up|
                                                              (QREFELT $ 81))
                                                    . #2#)))
                                            NIL (GO G190) G191 (EXIT NIL))
                                       (EXIT |s|)))
                                 (#1#
                                  (|SMTS;substvar| |p| (CDR |vl|)
                                   (SPADCALL |q| (QREFELT $ 90)) $)))))))))))))) 

(SDEFUN |SMTS;sortmfirst| ((|p| SMP) (|vl| |List| |Var|) (|q| |List| $) ($ $))
        (SPROG
         ((|nq| (|List| $)) (#1=#:G803 NIL) (|i| NIL) (#2=#:G802 NIL)
          (|nlv| (|List| |Var|)))
         (SEQ
          (LETT |nlv| (SPADCALL (ELT $ 91) |vl| (QREFELT $ 93))
                . #3=(|SMTS;sortmfirst|))
          (LETT |nq|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |i| NIL . #3#) (LETT #1# |nlv| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |q| (SPADCALL |i| |vl| (QREFELT $ 94))
                                         (QREFELT $ 95))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (|SMTS;substvar| |p| |nlv| |nq| $))))) 

(SDEFUN |SMTS;csubst;LLM;20|
        ((|vl| |List| |Var|) (|q| |List| (|Stream| SMP))
         ($ |Mapping| (|Stream| SMP) SMP))
        (SPROG NIL (CONS #'|SMTS;csubst;LLM;20!0| (VECTOR $ |q| |vl|)))) 

(SDEFUN |SMTS;csubst;LLM;20!0| ((|p1| NIL) ($$ NIL))
        (PROG (|vl| |q| $)
          (LETT |vl| (QREFELT $$ 2) . #1=(|SMTS;csubst;LLM;20|))
          (LETT |q| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|SMTS;sortmfirst| |p1| |vl| |q| $))))) 

(SDEFUN |SMTS;restCheck| ((|s| |Stream| SMP) ($ |Stream| SMP))
        (COND ((SPADCALL |s| (QREFELT $ 44)) |s|)
              ((NULL (SPADCALL (SPADCALL |s| (QREFELT $ 48)) (QREFELT $ 99)))
               (|error| "eval: constant coefficient should be 0"))
              ('T (SPADCALL |s| (QREFELT $ 100))))) 

(SDEFUN |SMTS;eval;$LL$;22| ((|s| $) (|v| |List| |Var|) (|q| |List| $) ($ $))
        (SPROG
         ((|nq| (|List| (|Stream| SMP))) (#1=#:G818 NIL) (|i| NIL)
          (#2=#:G817 NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |v|) (SPADCALL |q| (QREFELT $ 101))
                      (QREFELT $ 47))
            (|error|
             "eval: number of variables should equal number of values"))
           ('T
            (SEQ
             (LETT |nq|
                   (PROGN
                    (LETT #2# NIL . #3=(|SMTS;eval;$LL$;22|))
                    (SEQ (LETT |i| NIL . #3#) (LETT #1# |q| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2# (CONS (|SMTS;restCheck| |i| $) #2#)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   . #3#)
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |v| |nq| (QREFELT $ 98)) |s|
                         (QREFELT $ 104))
               (QREFELT $ 105))))))))) 

(SDEFUN |SMTS;substmts| ((|v| |Var|) (|p| SMP) (|q| $) ($ $))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| SMP)) (|ss| ($)) (|c| (SMP))
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |up| (SPADCALL |p| |v| (QREFELT $ 73)) . #1=(|SMTS;substmts|))
          (LETT |ss| (|spadConstant| $ 21) . #1#)
          (SEQ G190
               (COND ((NULL (NULL (SPADCALL |up| (QREFELT $ 75)))) (GO G191)))
               (SEQ (LETT |d| (SPADCALL |up| (QREFELT $ 76)) . #1#)
                    (LETT |c| (SPADCALL |up| (QREFELT $ 78)) . #1#)
                    (LETT |ss|
                          (SPADCALL |ss|
                                    (SPADCALL |c|
                                              (SPADCALL |q| |d| (QREFELT $ 89))
                                              (QREFELT $ 67))
                                    (QREFELT $ 80))
                          . #1#)
                    (EXIT (LETT |up| (SPADCALL |up| (QREFELT $ 81)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ss|)))) 

(SDEFUN |SMTS;subststream|
        ((|v| |Var|) (|p| SMP) (|q| |Stream| SMP) ($ |Stream| SMP))
        (|SMTS;substmts| |v| |p| |q| $)) 

(SDEFUN |SMTS;comp1|
        ((|v| |Var|) (|r| |Stream| SMP) (|t| |Stream| SMP) ($ |Stream| SMP))
        (SPROG NIL
               (SPADCALL
                (SPADCALL (CONS #'|SMTS;comp1!0| (VECTOR $ |t| |v|)) |r|
                          (QREFELT $ 104))
                (QREFELT $ 105)))) 

(SDEFUN |SMTS;comp1!0| ((|p1| NIL) ($$ NIL))
        (PROG (|v| |t| $)
          (LETT |v| (QREFELT $$ 2) . #1=(|SMTS;comp1|))
          (LETT |t| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|SMTS;subststream| |v| |p1| |t| $))))) 

(SDEFUN |SMTS;comp|
        ((|v| |Var|) (|s| |Stream| SMP) (|t| |Stream| SMP) ($ |Stream| SMP))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|SMTS;comp!0| (VECTOR |v| |t| $ |s|))
                          (QREFELT $ 111))))) 

(SDEFUN |SMTS;comp!0| (($$ NIL))
        (PROG (|s| $ |t| |v|)
          (LETT |s| (QREFELT $$ 3) . #1=(|SMTS;comp|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |t| (QREFELT $$ 1) . #1#)
          (LETT |v| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|f| NIL) (|r| NIL))
                   (SEQ
                    (COND ((SPADCALL |s| (QREFELT $ 44)) |s|)
                          ('T
                           (SEQ (LETT |f| (SPADCALL |s| (QREFELT $ 48)) NIL)
                                (LETT |r| (SPADCALL |s| (QREFELT $ 100)) NIL)
                                (EXIT
                                 (COND ((SPADCALL |r| (QREFELT $ 44)) |s|)
                                       ((SPADCALL |t| (QREFELT $ 44))
                                        (SPADCALL |f|
                                                  (|SMTS;comp1| |v| |r|
                                                   (SPADCALL (QREFELT $ 107))
                                                   $)
                                                  (QREFELT $ 109)))
                                       ((NULL
                                         (SPADCALL
                                          (SPADCALL |t| (QREFELT $ 48))
                                          (QREFELT $ 99)))
                                        (|error|
                                         "eval: constant coefficient should be zero"))
                                       ('T
                                        (SPADCALL |f|
                                                  (|SMTS;comp1| |v| |r|
                                                   (SPADCALL |t|
                                                             (QREFELT $ 100))
                                                   $)
                                                  (QREFELT $ 109)))))))))))))) 

(SDEFUN |SMTS;eval;$Var2$;27| ((|s| $) (|v| |Var|) (|t| $) ($ $))
        (|SMTS;comp| |v| |s| |t| $)) 

(SDEFUN |SMTS;differentiate;$Var$;28| ((|s| $) (|v| |Var|) ($ $))
        (SPROG NIL
               (COND ((SPADCALL |s| (QREFELT $ 44)) (|spadConstant| $ 21))
                     ('T
                      (SPADCALL
                       (CONS #'|SMTS;differentiate;$Var$;28!0| (VECTOR $ |v|))
                       (SPADCALL |s| (QREFELT $ 46)) (QREFELT $ 56)))))) 

(SDEFUN |SMTS;differentiate;$Var$;28!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) . #1=(|SMTS;differentiate;$Var$;28|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 113)))))) 

(PUT '|SMTS;stream| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SMTS;stream| ((|x| $) ($ |Rep|)) |x|) 

(SDEFUN |SMTS;^;$F$;30| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL |r| (|SMTS;stream| |x| $) (QREFELT $ 116))) 

(SDEFUN |SMTS;*;F2$;31| ((|r| |Fraction| (|Integer|)) (|x| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|SMTS;*;F2$;31!0| (VECTOR $ |r|))
                         (|SMTS;stream| |x| $) (QREFELT $ 119)))) 

(SDEFUN |SMTS;*;F2$;31!0| ((|z1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|SMTS;*;F2$;31|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |r| |z1| (QREFELT $ 118)))))) 

(SDEFUN |SMTS;*;$F$;32| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|SMTS;*;$F$;32!0| (VECTOR $ |r|))
                         (|SMTS;stream| |x| $) (QREFELT $ 119)))) 

(SDEFUN |SMTS;*;$F$;32!0| ((|z1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|SMTS;*;$F$;32|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |r| (QREFELT $ 121)))))) 

(SDEFUN |SMTS;exp;2$;33| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 124))) 

(SDEFUN |SMTS;log;2$;34| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 126))) 

(SDEFUN |SMTS;sin;2$;35| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 128))) 

(SDEFUN |SMTS;cos;2$;36| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 130))) 

(SDEFUN |SMTS;tan;2$;37| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 132))) 

(SDEFUN |SMTS;cot;2$;38| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 134))) 

(SDEFUN |SMTS;sec;2$;39| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 136))) 

(SDEFUN |SMTS;csc;2$;40| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 138))) 

(SDEFUN |SMTS;asin;2$;41| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 140))) 

(SDEFUN |SMTS;acos;2$;42| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 142))) 

(SDEFUN |SMTS;atan;2$;43| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 144))) 

(SDEFUN |SMTS;acot;2$;44| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 146))) 

(SDEFUN |SMTS;asec;2$;45| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 148))) 

(SDEFUN |SMTS;acsc;2$;46| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 150))) 

(SDEFUN |SMTS;sinh;2$;47| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 152))) 

(SDEFUN |SMTS;cosh;2$;48| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 154))) 

(SDEFUN |SMTS;tanh;2$;49| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 156))) 

(SDEFUN |SMTS;coth;2$;50| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 158))) 

(SDEFUN |SMTS;sech;2$;51| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 160))) 

(SDEFUN |SMTS;csch;2$;52| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 162))) 

(SDEFUN |SMTS;asinh;2$;53| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 164))) 

(SDEFUN |SMTS;acosh;2$;54| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 166))) 

(SDEFUN |SMTS;atanh;2$;55| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 168))) 

(SDEFUN |SMTS;acoth;2$;56| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 170))) 

(SDEFUN |SMTS;asech;2$;57| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 172))) 

(SDEFUN |SMTS;acsch;2$;58| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 174))) 

(SDEFUN |SMTS;intsmp| ((|v| |Var|) (|p| SMP) ($ SMP))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| SMP)) (|ss| (SMP)) (|c| (SMP))
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |up| (SPADCALL |p| |v| (QREFELT $ 73)) . #1=(|SMTS;intsmp|))
          (LETT |ss| (|spadConstant| $ 23) . #1#)
          (SEQ G190
               (COND ((NULL (NULL (SPADCALL |up| (QREFELT $ 75)))) (GO G191)))
               (SEQ (LETT |d| (SPADCALL |up| (QREFELT $ 76)) . #1#)
                    (LETT |c| (SPADCALL |up| (QREFELT $ 78)) . #1#)
                    (LETT |ss|
                          (SPADCALL |ss|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (+ |d| 1) (QREFELT $ 176))
                                      (QREFELT $ 177))
                                     (SPADCALL |c| |v| (+ |d| 1)
                                               (QREFELT $ 37))
                                     (QREFELT $ 118))
                                    (QREFELT $ 24))
                          . #1#)
                    (EXIT (LETT |up| (SPADCALL |up| (QREFELT $ 81)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ss|)))) 

(SDEFUN |SMTS;fintegrate;MVarCoef$;60|
        ((|f| |Mapping| $) (|v| |Var|) (|r| |Coef|) ($ $))
        (SPROG NIL
               (SPADCALL (SPADCALL |r| (QREFELT $ 36))
                         (SPADCALL
                          (CONS #'|SMTS;fintegrate;MVarCoef$;60!1|
                                (VECTOR |f| |v| $))
                          (QREFELT $ 178))
                         (QREFELT $ 108)))) 

(SDEFUN |SMTS;fintegrate;MVarCoef$;60!1| (($$ NIL))
        (PROG ($ |v| |f|)
          (LETT $ (QREFELT $$ 2) . #1=(|SMTS;fintegrate;MVarCoef$;60|))
          (LETT |v| (QREFELT $$ 1) . #1#)
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (CONS #'|SMTS;fintegrate;MVarCoef$;60!0| (VECTOR $ |v|))
                    (SPADCALL |f|) (QREFELT $ 56))))))) 

(SDEFUN |SMTS;fintegrate;MVarCoef$;60!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|SMTS;intsmp| |v| |z1| $))))) 

(SDEFUN |SMTS;integrate;$VarCoef$;61| ((|s| $) (|v| |Var|) (|r| |Coef|) ($ $))
        (SPROG NIL
               (SPADCALL (SPADCALL |r| (QREFELT $ 36))
                         (SPADCALL
                          (CONS #'|SMTS;integrate;$VarCoef$;61!0|
                                (VECTOR $ |v|))
                          |s| (QREFELT $ 56))
                         (QREFELT $ 108)))) 

(SDEFUN |SMTS;integrate;$VarCoef$;61!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) . #1=(|SMTS;integrate;$VarCoef$;61|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|SMTS;intsmp| |v| |z1| $))))) 

(SDEFUN |SMTS;tout| ((|p| SMP) ($ |OutputForm|))
        (SPROG ((|pe| (|OutputForm|)))
               (SEQ (LETT |pe| (SPADCALL |p| (QREFELT $ 182)) |SMTS;tout|)
                    (EXIT
                     (COND ((SPADCALL |p| (QREFELT $ 183)) |pe|)
                           ('T (SPADCALL |pe| (QREFELT $ 184)))))))) 

(PUT '|SMTS;showAll?| '|SPADreplace| '(XLAM NIL |$streamsShowAll|)) 

(SDEFUN |SMTS;showAll?| (($ |Boolean|)) |$streamsShowAll|) 

(SDEFUN |SMTS;coerce;$Of;64| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|uu| ($)) (|uu1| ($)) (|n| NIL)
          (#1=#:G969 NIL) (|count| (|NonNegativeInteger|)))
         (SEQ (LETT |uu| |s| . #2=(|SMTS;coerce;$Of;64|))
              (EXIT
               (COND
                ((SPADCALL |uu| (QREFELT $ 44))
                 (SPADCALL (|spadConstant| $ 23) (QREFELT $ 182)))
                (#3='T
                 (SEQ (LETT |count| |$streamCount| . #2#) (LETT |l| NIL . #2#)
                      (SEQ (LETT |n| 0 . #2#) (LETT #1# |count| . #2#) G190
                           (COND
                            ((OR (|greater_SI| |n| #1#)
                                 (NULL (NULL (SPADCALL |uu| (QREFELT $ 44)))))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL (SPADCALL |uu| (QREFELT $ 48))
                                        (|spadConstant| $ 23) (QREFELT $ 185))
                              (LETT |l|
                                    (CONS
                                     (|SMTS;tout|
                                      (SPADCALL |uu| (QREFELT $ 48)) $)
                                     |l|)
                                    . #2#)))
                            (EXIT
                             (LETT |uu| (SPADCALL |uu| (QREFELT $ 46)) . #2#)))
                           (LETT |n| (|inc_SI| |n|) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (COND
                       ((|SMTS;showAll?| $)
                        (SEQ (LETT |uu1| |uu| . #2#)
                             (EXIT
                              (SEQ (LETT |n| |n| . #2#) G190
                                   (COND
                                    ((NULL
                                      (COND
                                       ((SPADCALL |uu| (QREFELT $ 186))
                                        (NULL
                                         (SPADCALL |uu1|
                                                   (SPADCALL |uu|
                                                             (QREFELT $ 46))
                                                   (QREFELT $ 187))))
                                       ('T NIL)))
                                     (GO G191)))
                                   (SEQ
                                    (COND
                                     ((SPADCALL (SPADCALL |uu| (QREFELT $ 48))
                                                (|spadConstant| $ 23)
                                                (QREFELT $ 185))
                                      (LETT |l|
                                            (CONS
                                             (|SMTS;tout|
                                              (SPADCALL |uu| (QREFELT $ 48)) $)
                                             |l|)
                                            . #2#)))
                                    (COND
                                     ((ODDP |n|)
                                      (LETT |uu1|
                                            (SPADCALL |uu1| (QREFELT $ 46))
                                            . #2#)))
                                    (EXIT
                                     (LETT |uu| (SPADCALL |uu| (QREFELT $ 46))
                                           . #2#)))
                                   (LETT |n| (+ |n| 1) . #2#) (GO G190) G191
                                   (EXIT NIL))))))
                      (LETT |l|
                            (COND ((SPADCALL |uu| (QREFELT $ 188)) |l|)
                                  (#3#
                                   (SEQ
                                    (COND
                                     ((SPADCALL |uu|
                                                (SPADCALL |uu| (QREFELT $ 46))
                                                (QREFELT $ 187))
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |uu| (QREFELT $ 48))
                                         (|spadConstant| $ 23) (QREFELT $ 189))
                                        (EXIT |l|)))))
                                    (EXIT
                                     (CONS
                                      (SPADCALL (SPADCALL 'O (QREFELT $ 191))
                                                (LIST
                                                 (SPADCALL |n|
                                                           (QREFELT $ 192)))
                                                (QREFELT $ 193))
                                      |l|)))))
                            . #2#)
                      (EXIT
                       (COND
                        ((NULL |l|)
                         (SPADCALL (|spadConstant| $ 23) (QREFELT $ 182)))
                        (#3#
                         (SPADCALL (ELT $ 194) (NREVERSE |l|)
                                   (QREFELT $ 197)))))))))))) 

(SDEFUN |SMTS;/;$Coef$;65| ((|p| $) (|r| |Coef|) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|SMTS;/;$Coef$;65!0| (VECTOR $ |r|))
                         (|SMTS;stream| |p| $) (QREFELT $ 119)))) 

(SDEFUN |SMTS;/;$Coef$;65!0| ((|z1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|SMTS;/;$Coef$;65|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |r| (QREFELT $ 199)))))) 

(DECLAIM (NOTINLINE |SparseMultivariateTaylorSeries;|)) 

(DEFUN |SparseMultivariateTaylorSeries| (&REST #1=#:G982)
  (SPROG NIL
         (PROG (#2=#:G983)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseMultivariateTaylorSeries|)
                                               '|domainEqualList|)
                    . #3=(|SparseMultivariateTaylorSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseMultivariateTaylorSeries;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseMultivariateTaylorSeries|)))))))))) 

(DEFUN |SparseMultivariateTaylorSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G981 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|SparseMultivariateTaylorSeries|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT DV$3 (|devaluate| |#3|) . #2#)
    (LETT |dv$| (LIST '|SparseMultivariateTaylorSeries| DV$1 DV$2 DV$3) . #2#)
    (LETT $ (GETREFV 212) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #2#)
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasCategory| |#1| '(|Field|))))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|SparseMultivariateTaylorSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND #1# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 128))
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 256))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (|Stream| |#3|))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 117 (CONS (|dispatchFunction| |SMTS;^;$F$;30|) $))
       (QSETREFV $ 120 (CONS (|dispatchFunction| |SMTS;*;F2$;31|) $))
       (QSETREFV $ 122 (CONS (|dispatchFunction| |SMTS;*;$F$;32|) $))
       (QSETREFV $ 125 (CONS (|dispatchFunction| |SMTS;exp;2$;33|) $))
       (QSETREFV $ 127 (CONS (|dispatchFunction| |SMTS;log;2$;34|) $))
       (QSETREFV $ 129 (CONS (|dispatchFunction| |SMTS;sin;2$;35|) $))
       (QSETREFV $ 131 (CONS (|dispatchFunction| |SMTS;cos;2$;36|) $))
       (QSETREFV $ 133 (CONS (|dispatchFunction| |SMTS;tan;2$;37|) $))
       (QSETREFV $ 135 (CONS (|dispatchFunction| |SMTS;cot;2$;38|) $))
       (QSETREFV $ 137 (CONS (|dispatchFunction| |SMTS;sec;2$;39|) $))
       (QSETREFV $ 139 (CONS (|dispatchFunction| |SMTS;csc;2$;40|) $))
       (QSETREFV $ 141 (CONS (|dispatchFunction| |SMTS;asin;2$;41|) $))
       (QSETREFV $ 143 (CONS (|dispatchFunction| |SMTS;acos;2$;42|) $))
       (QSETREFV $ 145 (CONS (|dispatchFunction| |SMTS;atan;2$;43|) $))
       (QSETREFV $ 147 (CONS (|dispatchFunction| |SMTS;acot;2$;44|) $))
       (QSETREFV $ 149 (CONS (|dispatchFunction| |SMTS;asec;2$;45|) $))
       (QSETREFV $ 151 (CONS (|dispatchFunction| |SMTS;acsc;2$;46|) $))
       (QSETREFV $ 153 (CONS (|dispatchFunction| |SMTS;sinh;2$;47|) $))
       (QSETREFV $ 155 (CONS (|dispatchFunction| |SMTS;cosh;2$;48|) $))
       (QSETREFV $ 157 (CONS (|dispatchFunction| |SMTS;tanh;2$;49|) $))
       (QSETREFV $ 159 (CONS (|dispatchFunction| |SMTS;coth;2$;50|) $))
       (QSETREFV $ 161 (CONS (|dispatchFunction| |SMTS;sech;2$;51|) $))
       (QSETREFV $ 163 (CONS (|dispatchFunction| |SMTS;csch;2$;52|) $))
       (QSETREFV $ 165 (CONS (|dispatchFunction| |SMTS;asinh;2$;53|) $))
       (QSETREFV $ 167 (CONS (|dispatchFunction| |SMTS;acosh;2$;54|) $))
       (QSETREFV $ 169 (CONS (|dispatchFunction| |SMTS;atanh;2$;55|) $))
       (QSETREFV $ 171 (CONS (|dispatchFunction| |SMTS;acoth;2$;56|) $))
       (QSETREFV $ 173 (CONS (|dispatchFunction| |SMTS;asech;2$;57|) $))
       (QSETREFV $ 175 (CONS (|dispatchFunction| |SMTS;acsch;2$;58|) $))
       (QSETREFV $ 179
                 (CONS (|dispatchFunction| |SMTS;fintegrate;MVarCoef$;60|) $))
       (QSETREFV $ 180
                 (CONS (|dispatchFunction| |SMTS;integrate;$VarCoef$;61|)
                       $)))))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV $ 200 (CONS (|dispatchFunction| |SMTS;/;$Coef$;65|) $)))))
    $))) 

(MAKEPROP '|SparseMultivariateTaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerTaylorSeries| 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (|Stream| 8)
              |SMTS;coefficients;$S;1| |SMTS;series;S$;2| (0 . |One|)
              (4 . |One|) (|Integer|) (8 . |extend|) (|NonNegativeInteger|)
              |SMTS;extend;$Nni$;3| (14 . |complete|) |SMTS;complete;2$;4|
              (19 . |Zero|) (23 . |Zero|) (27 . |Zero|) (31 . +) (|List| 7)
              (|List| $) (37 . |eval|) (|Mapping| 8 8) (44 . |map|)
              (|Mapping| 8 8 8) (|StreamFunctions2| 8 8) (50 . |scan|)
              (|Stream| 15) (|StreamTaylorSeriesOperations| 8)
              (57 . |integers|) (62 . |coerce|) (67 . |monomial|)
              (|Mapping| 8 17 6) (|Stream| 17) (|Stream| 6)
              (|StreamFunctions3| 17 6 8) (74 . |map|) (|Boolean|)
              (81 . |empty?|) (86 . >) (92 . |rst|) (97 . ~=) (103 . |frst|)
              |SMTS;coefficient;$NniSMP;7| (|List| 17) (108 . |coefficient|)
              (115 . +) (|Mapping| 17 17 17) (121 . |reduce|) (127 . |rest|)
              (133 . |map|) |SMTS;coefficient;$LL$;8| (|IndexedExponents| 7)
              (139 . |leadingCoefficient|) (144 . |reductum|) (149 . |zero?|)
              (154 . |coefficient|) |SMTS;coefficient;$IeCoef;9|
              (160 . |monom|) |SMTS;coerce;Coef$;10| (166 . *)
              |SMTS;*;SMP2$;11| |SMTS;*;Coef2$;12| |SMTS;*;$Coef$;13|
              (|Union| 7 '"failed") (172 . |mainVariable|)
              (|SparseUnivariatePolynomial| $) (177 . |univariate|)
              (|SparseUnivariatePolynomial| 8) (183 . |zero?|) (188 . |degree|)
              |SMTS;monomial;$VarNni$;17| (193 . |leadingCoefficient|)
              (198 . *) (204 . +) (210 . |reductum|) |SMTS;coerce;SMP$;15|
              (215 . |coerce|) |SMTS;coerce;Var$;16| (220 . |One|) (224 . =)
              (|List| $$) (230 . |first|) (235 . ^) (241 . |rest|) (246 . >)
              (|Mapping| 43 7 7) (252 . |sort|) (258 . |position|)
              (264 . |elt|) (|Mapping| 10 8) (|List| 10) |SMTS;csubst;LLM;20|
              (270 . |zero?|) (275 . |rst|) (280 . |#|) (|Stream| 10)
              (|StreamFunctions2| 8 10) (285 . |map|) (291 . |addiag|)
              |SMTS;eval;$LL$;22| (296 . |empty|) (300 . |concat|)
              (306 . |concat|) (|Mapping| $) (312 . |delay|)
              |SMTS;eval;$Var2$;27| (317 . |differentiate|)
              |SMTS;differentiate;$Var$;28| (|Fraction| 15) (323 . |powern|)
              (329 . ^) (335 . *) (341 . |map|) (347 . *) (353 . *) (359 . *)
              (|StreamTranscendentalFunctions| 8) (365 . |exp|) (370 . |exp|)
              (375 . |log|) (380 . |log|) (385 . |sin|) (390 . |sin|)
              (395 . |cos|) (400 . |cos|) (405 . |tan|) (410 . |tan|)
              (415 . |cot|) (420 . |cot|) (425 . |sec|) (430 . |sec|)
              (435 . |csc|) (440 . |csc|) (445 . |asin|) (450 . |asin|)
              (455 . |acos|) (460 . |acos|) (465 . |atan|) (470 . |atan|)
              (475 . |acot|) (480 . |acot|) (485 . |asec|) (490 . |asec|)
              (495 . |acsc|) (500 . |acsc|) (505 . |sinh|) (510 . |sinh|)
              (515 . |cosh|) (520 . |cosh|) (525 . |tanh|) (530 . |tanh|)
              (535 . |coth|) (540 . |coth|) (545 . |sech|) (550 . |sech|)
              (555 . |csch|) (560 . |csch|) (565 . |asinh|) (570 . |asinh|)
              (575 . |acosh|) (580 . |acosh|) (585 . |atanh|) (590 . |atanh|)
              (595 . |acoth|) (600 . |acoth|) (605 . |asech|) (610 . |asech|)
              (615 . |acsch|) (620 . |acsch|) (625 . |coerce|) (630 . |inv|)
              (635 . |delay|) (640 . |fintegrate|) (647 . |integrate|)
              (|OutputForm|) (654 . |coerce|) (659 . |monomial?|)
              (664 . |paren|) (669 . ~=) (675 . |explicitEntries?|)
              (680 . |eq?|) (686 . |explicitlyEmpty?|) (691 . =) (|Symbol|)
              (697 . |coerce|) (702 . |coerce|) (707 . |prefix|) (713 . +)
              (|Mapping| 181 181 181) (|List| 181) (719 . |reduce|)
              |SMTS;coerce;$Of;64| (725 . /) (731 . /)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Union| $ '"failed") (|Polynomial| 6) (|List| 205)
              (|Equation| $) (|Mapping| 6 6) (|List| 58) (|PositiveInteger|)
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 737 |zero?| 743 |variables| 748 |unitNormal| 753
              |unitCanonical| 758 |unit?| 763 |tanh| 768 |tan| 773
              |subtractIfCan| 778 |sqrt| 784 |sinh| 789 |sin| 794 |series| 799
              |sech| 804 |sec| 809 |sample| 814 |reductum| 818 |recip| 823
              |polynomial| 828 |pole?| 841 |pi| 846 |order| 850 |opposite?| 863
              |one?| 869 |nthRoot| 874 |monomial?| 880 |monomial| 885 |map| 919
              |log| 925 |leadingMonomial| 930 |leadingCoefficient| 935 |latex|
              940 |integrate| 945 |hashUpdate!| 958 |hash| 964 |fintegrate| 969
              |extend| 976 |exquo| 982 |exp| 988 |eval| 993 |differentiate|
              1033 |degree| 1059 |csubst| 1064 |csch| 1070 |csc| 1075 |coth|
              1080 |cot| 1085 |cosh| 1090 |cos| 1095 |complete| 1100 |coerce|
              1105 |coefficients| 1140 |coefficient| 1145 |charthRoot| 1171
              |characteristic| 1176 |atanh| 1180 |atan| 1185 |associates?| 1190
              |asinh| 1196 |asin| 1201 |asech| 1206 |asec| 1211 |annihilate?|
              1216 |acsch| 1222 |acsc| 1227 |acoth| 1232 |acot| 1237 |acosh|
              1242 |acos| 1247 ^ 1252 |Zero| 1276 |One| 1280 D 1284 = 1310 /
              1316 - 1322 + 1333 * 1339)
           'NIL
           (CONS
            (|makeByteWordVec2| 6
                                '(0 0 0 2 1 2 5 0 1 6 2 2 3 4 5 0 0 1 6 0 0 0 0
                                  1 1 6 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 1 1
                                  1 1 1 6 2))
            (CONS
             '#(|MultivariateTaylorSeriesCategory&| |PowerSeriesCategory&|
                |AbelianMonoidRing&| NIL |Algebra&| |Algebra&| |Algebra&|
                |PartialDifferentialRing&| |Module&| NIL |Module&|
                |EntireRing&| NIL NIL |Module&| |Ring&| NIL NIL NIL |Rng&| NIL
                NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&| |Evalable&|
                |SetCategory&| |TranscendentalFunctionCategory&|
                |InnerEvalable&| |InnerEvalable&| NIL NIL |BasicType&| NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&| NIL NIL)
             (CONS
              '#((|MultivariateTaylorSeriesCategory| 6 7)
                 (|PowerSeriesCategory| 6 (|IndexedExponents| 7) 7)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|IntegralDomain|) (|Algebra| 115) (|Algebra| $$)
                 (|Algebra| 6) (|PartialDifferentialRing| 7) (|Module| 115)
                 (|CommutativeRing|) (|Module| $$) (|EntireRing|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|Ring|) (|BiModule| 6 6) (|BiModule| 115 115)
                 (|BiModule| $$ $$) (|Rng|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| $$) (|LeftModule| 115) (|RightModule| 115)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Evalable| $$) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| 7 $$) (|VariablesCommuteWithCoefficients|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 181)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|CommutativeStar|) (|noZeroDivisors|))
              (|makeByteWordVec2| 211
                                  '(0 0 0 13 0 6 0 14 2 9 0 0 15 16 1 9 0 0 19
                                    0 0 0 21 0 6 0 22 0 8 0 23 2 8 0 0 0 24 3 8
                                    0 0 25 26 27 2 10 0 28 0 29 3 31 10 8 30 10
                                    32 1 34 33 15 35 1 8 0 6 36 3 8 0 0 7 17 37
                                    3 41 10 38 39 40 42 1 9 43 0 44 2 17 43 0 0
                                    45 1 9 0 0 46 2 17 43 0 0 47 1 9 8 0 48 3 8
                                    0 0 25 50 51 2 17 0 0 0 52 2 50 17 53 0 54
                                    2 9 0 0 17 55 2 9 0 28 0 56 1 58 17 0 59 1
                                    58 0 0 60 1 58 43 0 61 2 8 6 0 58 62 2 34
                                    10 8 15 64 2 34 10 8 10 66 1 8 70 0 71 2 8
                                    72 0 7 73 1 74 43 0 75 1 74 17 0 76 1 74 8
                                    0 78 2 0 0 0 0 79 2 0 0 0 0 80 1 74 0 0 81
                                    1 8 0 7 83 0 8 0 85 2 7 43 0 0 86 1 87 2 0
                                    88 2 0 0 0 17 89 1 87 0 0 90 2 7 43 0 0 91
                                    2 25 0 92 0 93 2 25 15 7 0 94 2 87 2 0 15
                                    95 1 8 43 0 99 1 10 0 0 100 1 87 17 0 101 2
                                    103 102 96 10 104 1 34 10 102 105 0 10 0
                                    107 2 9 0 8 0 108 2 10 0 8 0 109 1 10 0 110
                                    111 2 8 0 0 7 113 2 34 10 115 10 116 2 0 0
                                    0 115 117 2 8 0 115 0 118 2 31 10 28 10 119
                                    2 0 0 115 0 120 2 8 0 0 115 121 2 0 0 0 115
                                    122 1 123 10 10 124 1 0 0 0 125 1 123 10 10
                                    126 1 0 0 0 127 1 123 10 10 128 1 0 0 0 129
                                    1 123 10 10 130 1 0 0 0 131 1 123 10 10 132
                                    1 0 0 0 133 1 123 10 10 134 1 0 0 0 135 1
                                    123 10 10 136 1 0 0 0 137 1 123 10 10 138 1
                                    0 0 0 139 1 123 10 10 140 1 0 0 0 141 1 123
                                    10 10 142 1 0 0 0 143 1 123 10 10 144 1 0 0
                                    0 145 1 123 10 10 146 1 0 0 0 147 1 123 10
                                    10 148 1 0 0 0 149 1 123 10 10 150 1 0 0 0
                                    151 1 123 10 10 152 1 0 0 0 153 1 123 10 10
                                    154 1 0 0 0 155 1 123 10 10 156 1 0 0 0 157
                                    1 123 10 10 158 1 0 0 0 159 1 123 10 10 160
                                    1 0 0 0 161 1 123 10 10 162 1 0 0 0 163 1
                                    123 10 10 164 1 0 0 0 165 1 123 10 10 166 1
                                    0 0 0 167 1 123 10 10 168 1 0 0 0 169 1 123
                                    10 10 170 1 0 0 0 171 1 123 10 10 172 1 0 0
                                    0 173 1 123 10 10 174 1 0 0 0 175 1 115 0
                                    15 176 1 115 0 0 177 1 9 0 110 178 3 0 0
                                    110 7 6 179 3 0 0 0 7 6 180 1 8 181 0 182 1
                                    8 43 0 183 1 181 0 0 184 2 8 43 0 0 185 1 9
                                    43 0 186 2 9 43 0 0 187 1 9 43 0 188 2 8 43
                                    0 0 189 1 190 181 0 191 1 17 181 0 192 2
                                    181 0 0 26 193 2 181 0 0 0 194 2 196 181
                                    195 0 197 2 8 0 0 6 199 2 0 0 0 6 200 2 0
                                    43 0 0 1 1 0 43 0 1 1 0 25 0 1 1 9 201 0 1
                                    1 9 0 0 1 1 9 43 0 1 1 1 0 0 157 1 1 0 0
                                    133 2 0 202 0 0 1 1 1 0 0 1 1 1 0 0 153 1 1
                                    0 0 129 1 0 0 10 12 1 1 0 0 161 1 1 0 0 137
                                    0 0 0 1 1 0 0 0 1 1 0 202 0 1 2 0 203 0 17
                                    1 3 0 203 0 17 17 1 1 0 43 0 1 0 1 0 1 3 0
                                    17 0 7 17 1 2 0 17 0 7 1 2 0 43 0 0 1 1 0
                                    43 0 1 2 1 0 0 15 1 1 0 43 0 1 3 0 0 0 25
                                    50 1 3 0 0 0 7 17 77 2 0 0 6 58 1 3 0 0 0 7
                                    58 1 3 0 0 0 25 207 1 2 0 0 206 0 1 1 1 0 0
                                    127 1 0 0 0 1 1 0 6 0 1 1 0 210 0 1 3 1 0 0
                                    7 6 180 2 1 0 0 7 1 2 0 209 209 0 1 1 0 211
                                    0 1 3 1 0 110 7 6 179 2 0 0 0 17 18 2 9 202
                                    0 0 1 1 1 0 0 125 3 0 0 0 0 0 1 3 0 0 0 26
                                    26 1 2 0 0 0 204 1 2 0 0 0 205 1 3 0 0 0 7
                                    0 112 3 0 0 0 25 26 106 3 0 0 0 25 50 1 2 0
                                    0 0 25 1 3 0 0 0 7 17 1 2 0 0 0 7 114 1 0
                                    58 0 1 2 0 96 25 97 98 1 1 0 0 163 1 1 0 0
                                    139 1 1 0 0 159 1 1 0 0 135 1 1 0 0 155 1 1
                                    0 0 131 1 0 0 0 20 1 8 0 6 65 1 9 0 0 1 1 1
                                    0 115 1 1 0 0 8 82 1 0 0 7 84 1 0 0 15 1 1
                                    0 181 0 198 1 0 10 0 11 2 0 8 0 17 49 3 0 0
                                    0 7 17 1 3 0 0 0 25 50 57 2 0 6 0 58 63 1 3
                                    202 0 1 0 0 17 1 1 1 0 0 169 1 1 0 0 145 2
                                    9 43 0 0 1 1 1 0 0 165 1 1 0 0 141 1 1 0 0
                                    173 1 1 0 0 149 2 0 43 0 0 1 1 1 0 0 175 1
                                    1 0 0 151 1 1 0 0 171 1 1 0 0 147 1 1 0 0
                                    167 1 1 0 0 143 2 1 0 0 115 117 2 1 0 0 0 1
                                    2 0 0 0 17 89 2 0 0 0 208 1 0 0 0 21 0 0 0
                                    13 3 0 0 0 7 17 1 3 0 0 0 25 50 1 2 0 0 0 7
                                    1 2 0 0 0 25 1 2 0 43 0 0 1 2 7 0 0 6 200 2
                                    0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 80 2 1 0 0
                                    115 122 2 1 0 115 0 120 2 0 0 8 0 67 2 0 0
                                    6 0 68 2 0 0 0 6 69 2 0 0 0 0 79 2 0 0 15 0
                                    1 2 0 0 17 0 1 2 0 0 208 0 1)))))
           '|lookupComplete|)) 
