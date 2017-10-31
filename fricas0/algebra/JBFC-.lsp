
(SDEFUN |JBFC-;X;PiS;1| ((|i| |PositiveInteger|) ($ S))
        (SPADCALL (SPADCALL |i| (QREFELT $ 11)) (QREFELT $ 12))) 

(SDEFUN |JBFC-;U;PiS;2| ((|i| |PositiveInteger|) ($ S))
        (SPADCALL (SPADCALL |i| (QREFELT $ 14)) (QREFELT $ 12))) 

(SDEFUN |JBFC-;P;PiLS;3|
        ((|i| |PositiveInteger|) (|l| |List| (|NonNegativeInteger|)) ($ S))
        (SPADCALL (SPADCALL |i| |l| (QREFELT $ 17)) (QREFELT $ 12))) 

(SDEFUN |JBFC-;X;S;4| (($ S))
        (SPADCALL (SPADCALL (QREFELT $ 19)) (QREFELT $ 12))) 

(SDEFUN |JBFC-;U;S;5| (($ S))
        (SPADCALL (SPADCALL (QREFELT $ 21)) (QREFELT $ 12))) 

(SDEFUN |JBFC-;P;LS;6| ((|l| |List| (|NonNegativeInteger|)) ($ S))
        (SPADCALL (SPADCALL |l| (QREFELT $ 23)) (QREFELT $ 12))) 

(SDEFUN |JBFC-;P;PiNniS;7|
        ((|i| |PositiveInteger|) (|l| |NonNegativeInteger|) ($ S))
        (SPADCALL (SPADCALL |i| |l| (QREFELT $ 26)) (QREFELT $ 12))) 

(SDEFUN |JBFC-;P;NniS;8| ((|i| |NonNegativeInteger|) ($ S))
        (SPADCALL (SPADCALL |i| (QREFELT $ 28)) (QREFELT $ 12))) 

(SDEFUN |JBFC-;setNotation;SV;9| ((|s| |Symbol|) ($ |Void|))
        (SPADCALL |s| (QREFELT $ 31))) 

(SDEFUN |JBFC-;getNotation;S;10| (($ |Symbol|)) (SPADCALL (QREFELT $ 34))) 

(SDEFUN |JBFC-;numIndVar;Pi;11| (($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 9))) 

(SDEFUN |JBFC-;numDepVar;Pi;12| (($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 37))) 

(SDEFUN |JBFC-;gcd;3S;13| ((|f1| S) (|f2| S) ($ S)) (|spadConstant| $ 39)) 

(SDEFUN |JBFC-;retractIfCan;SU;14| ((|f| S) ($ |Union| JB "failed"))
        (SPROG ((|jv| (JB)) (JV (|List| JB)))
               (SEQ
                (LETT JV (SPADCALL |f| (QREFELT $ 42))
                      . #1=(|JBFC-;retractIfCan;SU;14|))
                (EXIT
                 (COND
                  ((EQL (LENGTH JV) 1)
                   (SEQ (LETT |jv| (|SPADfirst| JV) . #1#)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |f| |jv| (QREFELT $ 43))
                                     (QREFELT $ 45))
                           (CONS 0 |jv|))
                          (#2='T (CONS 1 "failed"))))))
                  (#2# (CONS 1 "failed"))))))) 

(SDEFUN |JBFC-;const?;SB;15| ((|Phi| S) ($ |Boolean|))
        (SPROG ((JV (|List| JB)))
               (SEQ
                (LETT JV (SPADCALL |Phi| (QREFELT $ 42)) |JBFC-;const?;SB;15|)
                (EXIT
                 (COND ((NULL JV) 'T)
                       ((SPADCALL (LENGTH JV) 1 (QREFELT $ 48)) NIL)
                       ('T
                        (SPADCALL (|SPADfirst| JV) (|spadConstant| $ 49)
                                  (QREFELT $ 50)))))))) 

(SDEFUN |JBFC-;order;SNni;16| ((|Phi| S) ($ |NonNegativeInteger|))
        (SPADCALL (SPADCALL |Phi| (QREFELT $ 52)) (QREFELT $ 53))) 

(SDEFUN |JBFC-;class;SNni;17| ((|Phi| S) ($ |NonNegativeInteger|))
        (SPADCALL (SPADCALL |Phi| (QREFELT $ 52)) (QREFELT $ 55))) 

(SDEFUN |JBFC-;leadingDer;SJB;18| ((|fun| S) ($ JB))
        (SPROG ((JV (|List| JB)))
               (SEQ
                (LETT JV (SPADCALL |fun| (QREFELT $ 42))
                      |JBFC-;leadingDer;SJB;18|)
                (EXIT
                 (COND ((NULL JV) (|spadConstant| $ 49))
                       ('T (|SPADfirst| JV))))))) 

(SDEFUN |JBFC-;freeOf?;SJBB;19| ((|fun| S) (|jv| JB) ($ |Boolean|))
        (NULL (SPADCALL |jv| (SPADCALL |fun| (QREFELT $ 42)) (QREFELT $ 58)))) 

(PUT '|JBFC-;characteristic;Nni;20| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |JBFC-;characteristic;Nni;20| (($ |NonNegativeInteger|)) 0) 

(SDEFUN |JBFC-;dSubst;SJB2S;21| ((|f| S) (|jv| JB) (|exp| S) ($ S))
        (SPROG
         ((|nf| (S)) (|dexp| (S)) (|d| (|List| (|NonNegativeInteger|)))
          (#1=#:G805 NIL) (|jvar| NIL) (#2=#:G806 NIL) (|JVar| (|List| JB))
          (|of| (S)))
         (SEQ (LETT |of| (|spadConstant| $ 61) . #3=(|JBFC-;dSubst;SJB2S;21|))
              (LETT |nf| |f| . #3#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |nf| |of| (QREFELT $ 62))) (GO G191)))
                   (SEQ (LETT |of| |nf| . #3#)
                        (LETT |JVar| (SPADCALL |of| (QREFELT $ 42)) . #3#)
                        (EXIT
                         (SEQ (LETT #2# NIL . #3#) (LETT |jvar| NIL . #3#)
                              (LETT #1# |JVar| . #3#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |jvar| (CAR #1#) . #3#) NIL)
                                    #2#)
                                (GO G191)))
                              (SEQ
                               (LETT |d| (SPADCALL |jvar| |jv| (QREFELT $ 63))
                                     . #3#)
                               (EXIT
                                (COND
                                 ((NULL (NULL |d|))
                                  (SEQ
                                   (LETT |dexp|
                                         (SPADCALL |exp| |d| (QREFELT $ 64))
                                         . #3#)
                                   (EXIT
                                    (LETT |nf|
                                          (SPADCALL |nf| |jvar| |dexp|
                                                    (QREFELT $ 65))
                                          . #3#)))))))
                              (LETT #1#
                                    (PROG1 (CDR #1#)
                                      (LETT #2#
                                            (SPADCALL |jvar| |jv|
                                                      (QREFELT $ 66))
                                            . #3#))
                                    . #3#)
                              (GO G190) G191 (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |nf|)))) 

(SDEFUN |JBFC-;dimension;LSem2Nni;22|
        ((|sys| |List| S) (|jm| |SparseEchelonMatrix| JB S)
         (|q| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G807 NIL))
               (PROG1
                   (LETT #1# (- (SPADCALL |q| (QREFELT $ 68)) (LENGTH |sys|))
                         |JBFC-;dimension;LSem2Nni;22|)
                 (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #1#)))) 

(SDEFUN |JBFC-;orderDim;LSem2Nni;23|
        ((|sys| |List| S) (|jm| |SparseEchelonMatrix| JB S)
         (|q| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G809 NIL))
               (PROG1
                   (LETT #1# (- (SPADCALL |q| (QREFELT $ 72)) (LENGTH |sys|))
                         |JBFC-;orderDim;LSem2Nni;23|)
                 (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #1#)))) 

(SDEFUN |JBFC-;jacobiMatrix;LSem;24|
        ((|funs| |List| S) ($ |SparseEchelonMatrix| JB S))
        (SPROG ((#1=#:G814 NIL) (|fun| NIL) (#2=#:G813 NIL))
               (SEQ
                (SPADCALL |funs|
                          (PROGN
                           (LETT #2# NIL . #3=(|JBFC-;jacobiMatrix;LSem;24|))
                           (SEQ (LETT |fun| NIL . #3#) (LETT #1# |funs| . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |fun| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |fun| (QREFELT $ 42))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 76))))) 

(SDEFUN |JBFC-;jacobiMatrix;LLSem;25|
        ((|funs| |List| S) (|varlist| |List| (|List| JB))
         ($ |SparseEchelonMatrix| JB S))
        (SPROG
         ((|inds| (|List| JB)) (|ents| (|List| S)) (|df| (S)) (#1=#:G831 NIL)
          (|jv| NIL) (#2=#:G829 NIL) (|f| NIL) (#3=#:G830 NIL) (|vars| NIL)
          (|i| NIL) (JM (|SparseEchelonMatrix| JB S)) (|JvList| (|List| JB))
          (#4=#:G828 NIL))
         (SEQ
          (LETT |JvList| (|SPADfirst| |varlist|)
                . #5=(|JBFC-;jacobiMatrix;LLSem;25|))
          (SEQ (LETT |vars| NIL . #5#) (LETT #4# (CDR |varlist|) . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |vars| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |JvList|
                       (SPADCALL
                        (SPADCALL (ELT $ 78) |JvList| |vars| (QREFELT $ 80))
                        (QREFELT $ 81))
                       . #5#)))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT JM (SPADCALL |JvList| (LENGTH |funs|) (QREFELT $ 84)) . #5#)
          (SEQ (LETT |i| 1 . #5#) (LETT |vars| NIL . #5#)
               (LETT #3# |varlist| . #5#) (LETT |f| NIL . #5#)
               (LETT #2# |funs| . #5#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #5#) NIL)
                     (ATOM #3#) (PROGN (LETT |vars| (CAR #3#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |ents| NIL . #5#) (LETT |inds| NIL . #5#)
                    (SEQ (LETT |jv| NIL . #5#) (LETT #1# |vars| . #5#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |jv| (CAR #1#) . #5#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |df| (SPADCALL |f| |jv| (QREFELT $ 43)) . #5#)
                          (EXIT
                           (COND
                            ((OR (QREFELT $ 74)
                                 (NULL (SPADCALL |df| (QREFELT $ 85))))
                             (SEQ (LETT |ents| (CONS |df| |ents|) . #5#)
                                  (EXIT
                                   (LETT |inds| (CONS |jv| |inds|) . #5#)))))))
                         (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL JM |i| (NREVERSE |inds|) (NREVERSE |ents|)
                               (QREFELT $ 87))))
               (LETT #2#
                     (PROG1 (CDR #2#)
                       (LETT #3#
                             (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|) . #5#))
                             . #5#))
                     . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT JM)))) 

(SDEFUN |JBFC-;symbol;LSem;26|
        ((|funs| |List| S) ($ |SparseEchelonMatrix| JB S))
        (SPROG
         ((|inds| #1=(|List| JB)) (|ents| (|List| S)) (|df| (S))
          (#2=#:G866 NIL) (|jv| NIL) (#3=#:G864 NIL) (|f| NIL) (#4=#:G865 NIL)
          (|ojl| #1#) (|i| NIL) (|symb| (|SparseEchelonMatrix| JB S))
          (|oJV| (|List| (|List| JB))) (|allJV| #1#) (|jl| (|List| JB))
          (#5=#:G863 NIL) (|ord| (|NonNegativeInteger|))
          (|ol| (|List| (|NonNegativeInteger|))) (#6=#:G862 NIL)
          (#7=#:G861 NIL) (JVL (|List| (|List| JB))) (#8=#:G860 NIL)
          (|fun| NIL) (#9=#:G859 NIL))
         (SEQ
          (LETT JVL
                (PROGN
                 (LETT #9# NIL . #10=(|JBFC-;symbol;LSem;26|))
                 (SEQ (LETT |fun| NIL . #10#) (LETT #8# |funs| . #10#) G190
                      (COND
                       ((OR (ATOM #8#)
                            (PROGN (LETT |fun| (CAR #8#) . #10#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #9# (CONS (SPADCALL |fun| (QREFELT $ 42)) #9#)
                              . #10#)))
                      (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                      (EXIT (NREVERSE #9#))))
                . #10#)
          (LETT |ol|
                (PROGN
                 (LETT #7# NIL . #10#)
                 (SEQ (LETT |jl| NIL . #10#) (LETT #6# JVL . #10#) G190
                      (COND
                       ((OR (ATOM #6#)
                            (PROGN (LETT |jl| (CAR #6#) . #10#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS
                               (SPADCALL (|SPADfirst| |jl|) (QREFELT $ 53))
                               #7#)
                              . #10#)))
                      (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #10#)
          (LETT |ord| (SPADCALL (ELT $ 91) |ol| 0 (QREFELT $ 93)) . #10#)
          (LETT |oJV| NIL . #10#) (LETT |allJV| NIL . #10#)
          (SEQ (LETT |jl| NIL . #10#) (LETT #5# JVL . #10#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |jl| (CAR #5#) . #10#) NIL))
                 (GO G191)))
               (SEQ (LETT |ojl| NIL . #10#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |jl|) NIL)
                                  ('T
                                   (NULL
                                    (<
                                     (SPADCALL (|SPADfirst| |jl|)
                                               (QREFELT $ 53))
                                     |ord|)))))
                           (GO G191)))
                         (SEQ
                          (LETT |ojl| (CONS (|SPADfirst| |jl|) |ojl|) . #10#)
                          (EXIT (LETT |jl| (CDR |jl|) . #10#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |ojl| (NREVERSE |ojl|) . #10#)
                    (LETT |oJV| (CONS |ojl| |oJV|) . #10#)
                    (EXIT
                     (LETT |allJV|
                           (SPADCALL
                            (SPADCALL (ELT $ 78) |allJV| |ojl| (QREFELT $ 80))
                            (QREFELT $ 81))
                           . #10#)))
               (LETT #5# (CDR #5#) . #10#) (GO G190) G191 (EXIT NIL))
          (LETT |oJV| (NREVERSE |oJV|) . #10#)
          (LETT |symb| (SPADCALL |allJV| (LENGTH |funs|) (QREFELT $ 84))
                . #10#)
          (SEQ (LETT |i| 1 . #10#) (LETT |ojl| NIL . #10#)
               (LETT #4# |oJV| . #10#) (LETT |f| NIL . #10#)
               (LETT #3# |funs| . #10#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #10#) NIL)
                     (ATOM #4#) (PROGN (LETT |ojl| (CAR #4#) . #10#) NIL))
                 (GO G191)))
               (SEQ (LETT |ents| NIL . #10#) (LETT |inds| NIL . #10#)
                    (SEQ (LETT |jv| NIL . #10#) (LETT #2# |ojl| . #10#) G190
                         (COND
                          ((OR (ATOM #2#)
                               (PROGN (LETT |jv| (CAR #2#) . #10#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |df| (SPADCALL |f| |jv| (QREFELT $ 43)) . #10#)
                          (EXIT
                           (COND
                            ((OR (QREFELT $ 74)
                                 (NULL (SPADCALL |df| (QREFELT $ 85))))
                             (SEQ (LETT |ents| (CONS |df| |ents|) . #10#)
                                  (EXIT
                                   (LETT |inds| (CONS |jv| |inds|)
                                         . #10#)))))))
                         (LETT #2# (CDR #2#) . #10#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL |symb| |i| (NREVERSE |inds|) (NREVERSE |ents|)
                               (QREFELT $ 87))))
               (LETT #3#
                     (PROG1 (CDR #3#)
                       (LETT #4#
                             (PROG1 (CDR #4#) (LETT |i| (|inc_SI| |i|) . #10#))
                             . #10#))
                     . #10#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |symb|)))) 

(SDEFUN |JBFC-;extractSymbol;2Sem;27|
        ((|jm| |SparseEchelonMatrix| JB S) ($ |SparseEchelonMatrix| JB S))
        (SPROG ((|inds| (|List| JB)) (|o| (|NonNegativeInteger|)))
               (SEQ
                (LETT |inds| (SPADCALL |jm| (QREFELT $ 95))
                      . #1=(|JBFC-;extractSymbol;2Sem;27|))
                (LETT |o| (SPADCALL (|SPADfirst| |inds|) (QREFELT $ 53)) . #1#)
                (LETT |inds| (CDR |inds|) . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |inds|) NIL)
                              ('T
                               (EQL
                                (SPADCALL (|SPADfirst| |inds|) (QREFELT $ 53))
                                |o|))))
                       (GO G191)))
                     (SEQ (EXIT (LETT |inds| (CDR |inds|) . #1#))) NIL
                     (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND ((NULL |inds|) |jm|)
                       ('T
                        (QCAR
                         (SPADCALL |jm| (|SPADfirst| |inds|)
                                   (QREFELT $ 97))))))))) 

(SDEFUN |JBFC-;formalDiff;LPiL;28|
        ((|Sys| |List| S) (|i| |PositiveInteger|) ($ |List| S))
        (SPROG ((JM (|SparseEchelonMatrix| JB S)))
               (SEQ
                (LETT JM (SPADCALL |Sys| (QREFELT $ 99))
                      |JBFC-;formalDiff;LPiL;28|)
                (EXIT (QCAR (SPADCALL |Sys| |i| JM (QREFELT $ 101))))))) 

(SDEFUN |JBFC-;formalDiff;SPiS;29| ((|Eq| S) (|i| |PositiveInteger|) ($ S))
        (|SPADfirst| (SPADCALL (LIST |Eq|) |i| (QREFELT $ 103)))) 

(SDEFUN |JBFC-;formalDiff;SLS;30|
        ((|f| S) (|mu| |List| (|NonNegativeInteger|)) ($ S))
        (SPROG
         ((JV (|List| JB)) (|df| (S))
          (|tmp| (|Record| (|:| |DPhi| S) (|:| |JVars| (|List| JB))))
          (#1=#:G877 NIL) (|jm| (|SparseEchelonMatrix| JB S)) (#2=#:G886 NIL)
          (|k| NIL) (#3=#:G884 NIL) (|i| NIL) (#4=#:G885 NIL) (|j| NIL))
         (SEQ
          (LETT JV (SPADCALL |f| (QREFELT $ 42))
                . #5=(|JBFC-;formalDiff;SLS;30|))
          (LETT |df| |f| . #5#)
          (SEQ (LETT |j| NIL . #5#) (LETT #4# |mu| . #5#) (LETT |i| 1 . #5#)
               (LETT #3# (QREFELT $ 10) . #5#) G190
               (COND
                ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                     (PROGN (LETT |j| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |k| 1 . #5#) (LETT #2# |j| . #5#) G190
                      (COND ((|greater_SI| |k| #2#) (GO G191)))
                      (SEQ
                       (LETT |jm|
                             (SPADCALL (LIST |df|) (LIST JV) (QREFELT $ 76))
                             . #5#)
                       (LETT |tmp|
                             (SPADCALL |df|
                                       (PROG1 (LETT #1# |i| . #5#)
                                         (|check_subtype2| (> #1# 0)
                                                           '(|PositiveInteger|)
                                                           '(|NonNegativeInteger|)
                                                           #1#))
                                       |jm| (QREFELT $ 106))
                             . #5#)
                       (LETT |df| (QCAR |tmp|) . #5#)
                       (EXIT (LETT JV (QCDR |tmp|) . #5#)))
                      (LETT |k| (|inc_SI| |k|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#) . #5#))
                     . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |df|)))) 

(SDEFUN |JBFC-;formalDiff2;LPiSemR;31|
        ((|Sys| |List| S) (|i| |PositiveInteger|)
         (JM |SparseEchelonMatrix| JB S)
         ($ |Record| (|:| |DSys| (|List| S))
          (|:| |JVars| (|List| (|List| JB)))))
        (SPROG
         ((LJV (|List| (|List| JB))) (JV (|List| JB)) (|LRes| (|List| S))
          (|res| (S)) (|djv| (|Union| JB "0")) (#1=#:G917 NIL) (|df| NIL)
          (#2=#:G918 NIL) (|jv| NIL)
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| S))))
          (#3=#:G916 NIL) (|l| NIL) (#4=#:G915 NIL) (|eq| NIL) (#5=#:G914 NIL)
          (#6=#:G913 NIL) (#7=#:G912 NIL) (|inds| (|List| JB)))
         (SEQ
          (LETT |inds| (SPADCALL JM (QREFELT $ 95))
                . #8=(|JBFC-;formalDiff2;LPiSemR;31|))
          (EXIT
           (COND
            ((NULL |inds|)
             (CONS
              (PROGN
               (LETT #7# NIL . #8#)
               (SEQ (LETT |eq| NIL . #8#) (LETT #6# |Sys| . #8#) G190
                    (COND
                     ((OR (ATOM #6#) (PROGN (LETT |eq| (CAR #6#) . #8#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT (LETT #7# (CONS (|spadConstant| $ 61) #7#) . #8#)))
                    (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                    (EXIT (NREVERSE #7#))))
              (PROGN
               (LETT #5# NIL . #8#)
               (SEQ (LETT |eq| NIL . #8#) (LETT #4# |Sys| . #8#) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |eq| (CAR #4#) . #8#) NIL))
                      (GO G191)))
                    (SEQ (EXIT (LETT #5# (CONS NIL #5#) . #8#)))
                    (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                    (EXIT (NREVERSE #5#))))))
            ('T
             (SEQ (LETT |LRes| NIL . #8#) (LETT LJV NIL . #8#)
                  (SEQ (LETT |l| 1 . #8#)
                       (LETT #3# (SPADCALL JM (QREFELT $ 108)) . #8#) G190
                       (COND ((|greater_SI| |l| #3#) (GO G191)))
                       (SEQ (LETT |r| (SPADCALL JM |l| (QREFELT $ 110)) . #8#)
                            (LETT |res| (|spadConstant| $ 61) . #8#)
                            (LETT JV NIL . #8#)
                            (SEQ (LETT |jv| NIL . #8#)
                                 (LETT #2# (REVERSE (QCAR |r|)) . #8#)
                                 (LETT |df| NIL . #8#)
                                 (LETT #1# (REVERSE (QCDR |r|)) . #8#) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |df| (CAR #1#) . #8#) NIL)
                                       (ATOM #2#)
                                       (PROGN (LETT |jv| (CAR #2#) . #8#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((OR (QREFELT $ 74)
                                         (NULL (SPADCALL |df| (QREFELT $ 85))))
                                     (SEQ
                                      (LETT |djv|
                                            (SPADCALL |jv| |i| (QREFELT $ 112))
                                            . #8#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |djv| 1)
                                         (LETT JV (CONS |jv| JV) . #8#))
                                        ((SPADCALL |djv|
                                                   (CONS 0
                                                         (|spadConstant| $ 49))
                                                   (QREFELT $ 114))
                                         (SEQ
                                          (LETT |res|
                                                (SPADCALL |res| |df|
                                                          (QREFELT $ 115))
                                                . #8#)
                                          (EXIT
                                           (LETT JV (CONS |jv| JV) . #8#))))
                                        ('T
                                         (SEQ
                                          (LETT |res|
                                                (SPADCALL |res|
                                                          (SPADCALL |df|
                                                                    (SPADCALL
                                                                     (QCDR
                                                                      |djv|)
                                                                     (QREFELT $
                                                                              12))
                                                                    (QREFELT $
                                                                             116))
                                                          (QREFELT $ 115))
                                                . #8#)
                                          (EXIT
                                           (LETT JV
                                                 (CONS (QCDR |djv|)
                                                       (CONS |jv| JV))
                                                 . #8#)))))))))))
                                 (LETT #1#
                                       (PROG1 (CDR #1#)
                                         (LETT #2# (CDR #2#) . #8#))
                                       . #8#)
                                 (GO G190) G191 (EXIT NIL))
                            (LETT |LRes| (CONS |res| |LRes|) . #8#)
                            (LETT JV
                                  (SPADCALL (ELT $ 78)
                                            (SPADCALL JV (QREFELT $ 81))
                                            (QREFELT $ 117))
                                  . #8#)
                            (EXIT (LETT LJV (CONS JV LJV) . #8#)))
                       (LETT |l| (|inc_SI| |l|) . #8#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (CONS (NREVERSE |LRes|) (NREVERSE LJV)))))))))) 

(SDEFUN |JBFC-;formalDiff2;SPiSemR;32|
        ((|Eq| S) (|i| |PositiveInteger|) (JM |SparseEchelonMatrix| JB S)
         ($ |Record| (|:| |DPhi| S) (|:| |JVars| (|List| JB))))
        (SPROG
         ((|tmp|
           (|Record| (|:| |DSys| (|List| S))
                     (|:| |JVars| (|List| (|List| JB))))))
         (SEQ
          (LETT |tmp| (SPADCALL (LIST |Eq|) |i| JM (QREFELT $ 101))
                |JBFC-;formalDiff2;SPiSemR;32|)
          (EXIT (CONS (|SPADfirst| (QCAR |tmp|)) (|SPADfirst| (QCDR |tmp|))))))) 

(SDEFUN |JBFC-;greater|
        ((|r1| |Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
          (|:| |Dep| (|List| (|NonNegativeInteger|))) (|:| |Fun| S))
         (|r2| |Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
          (|:| |Dep| (|List| (|NonNegativeInteger|))) (|:| |Fun| S))
         ($ |Boolean|))
        (SPADCALL (QVELT |r1| 0) (QVELT |r2| 0) (QREFELT $ 78))) 

(SDEFUN |JBFC-;sortLD;2L;34| ((|sys| |List| S) ($ |List| S))
        (SPROG
         ((#1=#:G938 NIL) (|l| NIL) (#2=#:G937 NIL)
          (|sl|
           (|List|
            (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                      (|:| |Dep| (|List| (|NonNegativeInteger|)))
                      (|:| |Fun| S))))
          (#3=#:G936 NIL) (|f| NIL) (#4=#:G935 NIL))
         (SEQ
          (LETT |sl|
                (PROGN
                 (LETT #4# NIL . #5=(|JBFC-;sortLD;2L;34|))
                 (SEQ (LETT |f| NIL . #5#) (LETT #3# |sys| . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (VECTOR (SPADCALL |f| (QREFELT $ 52)) NIL
                                       (LIST 1) |f|)
                               #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |sl|
                (SPADCALL (CONS (|function| |JBFC-;greater|) $) |sl|
                          (QREFELT $ 123))
                . #5#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #5#)
            (SEQ (LETT |l| NIL . #5#) (LETT #1# |sl| . #5#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |l| (CAR #1#) . #5#) NIL))
                   (GO G191)))
                 (SEQ (EXIT (LETT #2# (CONS (QVELT |l| 3) #2#) . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |JBFC-;simpLD|
        ((|l| |List|
          (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                    (|:| |Dep| (|List| (|NonNegativeInteger|))) (|:| |Fun| S)))
         ($ |List|
          (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                    (|:| |Dep| (|List| (|NonNegativeInteger|)))
                    (|:| |Fun| S))))
        (SPROG
         ((|newL|
           (|List|
            (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                      (|:| |Dep| (|List| (|NonNegativeInteger|)))
                      (|:| |Fun| S))))
          (|newld| (JB)) (#1=#:G986 NIL) (|eq| NIL) (#2=#:G987 NIL)
          (JV #3=(|List| JB)) (|sjv| (JB)) (#4=#:G984 NIL) (#5=#:G985 NIL)
          (|lJV| (|List| #3#)) (|minlen| #6=(|NonNegativeInteger|)) (|sj| #3#)
          (|seq|
           (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                     (|:| |Dep| (|List| (|NonNegativeInteger|)))
                     (|:| |Fun| S)))
          (|len| #6#) (#7=#:G983 NIL) (|neweq| (S)) (#8=#:G946 NIL)
          (#9=#:G982 NIL) (|solvable?| (|Boolean|))
          (|s| (|Union| S #10="failed")) (#11=#:G980 NIL) (#12=#:G981 NIL)
          (|eqLD|
           (|List|
            #13=(|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                          (|:| |Dep| (|List| (|NonNegativeInteger|)))
                          (|:| |Fun| S))))
          (|fl| #13#) (|cur| #13#))
         (SEQ
          (COND ((< (LENGTH |l|) 2) |l|)
                (#14='T
                 (SEQ (LETT |cur| (|SPADfirst| |l|) . #15=(|JBFC-;simpLD|))
                      (LETT |l| (CDR |l|) . #15#)
                      (EXIT
                       (COND
                        ((SPADCALL (QVELT |cur| 0) (QVELT (|SPADfirst| |l|) 0)
                                   (QREFELT $ 125))
                         (CONS |cur| (|JBFC-;simpLD| |l| $)))
                        (#14#
                         (SEQ (LETT |eqLD| (LIST |cur|) . #15#)
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND ((NULL |l|) NIL)
                                            ('T
                                             (SPADCALL (QVELT |cur| 0)
                                                       (QVELT
                                                        (LETT |fl|
                                                              (|SPADfirst| |l|)
                                                              . #15#)
                                                        0)
                                                       (QREFELT $ 50)))))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((QVELT |fl| 1)
                                       (|error| #16="cannot simplify"))
                                      ('T
                                       (SEQ
                                        (LETT |eqLD| (CONS |fl| |eqLD|) . #15#)
                                        (EXIT (LETT |l| (CDR |l|) . #15#)))))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |solvable?| NIL . #15#)
                              (SEQ (LETT #12# NIL . #15#)
                                   (LETT |eq| NIL . #15#)
                                   (LETT #11# |eqLD| . #15#) G190
                                   (COND
                                    ((OR (ATOM #11#)
                                         (PROGN
                                          (LETT |eq| (CAR #11#) . #15#)
                                          NIL)
                                         #12#)
                                     (GO G191)))
                                   (SEQ
                                    (LETT |s|
                                          (SPADCALL (QVELT |eq| 3)
                                                    (QVELT |cur| 0)
                                                    (QREFELT $ 127))
                                          . #15#)
                                    (LETT |solvable?| (QEQCAR |s| 0) . #15#)
                                    (EXIT (LETT |seq| |eq| . #15#)))
                                   (LETT #11#
                                         (PROG1 (CDR #11#)
                                           (LETT #12# |solvable?| . #15#))
                                         . #15#)
                                   (GO G190) G191 (EXIT NIL))
                              (LETT |newL| NIL . #15#)
                              (COND
                               (|solvable?|
                                (SEQ (LETT |eq| NIL . #15#)
                                     (LETT #9# |eqLD| . #15#) G190
                                     (COND
                                      ((OR (ATOM #9#)
                                           (PROGN
                                            (LETT |eq| (CAR #9#) . #15#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((SPADCALL |eq| |seq| (QREFELT $ 128))
                                         (SEQ
                                          (LETT |neweq|
                                                (SPADCALL
                                                 (SPADCALL (QVELT |eq| 3)
                                                           (QVELT |cur| 0)
                                                           (PROG2
                                                               (LETT #8# |s|
                                                                     . #15#)
                                                               (QCDR #8#)
                                                             (|check_union2|
                                                              (QEQCAR #8# 0)
                                                              (QREFELT $ 6)
                                                              (|Union|
                                                               (QREFELT $ 6)
                                                               #10#)
                                                              #8#))
                                                           (QREFELT $ 65))
                                                 (QREFELT $ 129))
                                                . #15#)
                                          (EXIT
                                           (COND
                                            ((NULL
                                              (SPADCALL |neweq|
                                                        (QREFELT $ 85)))
                                             (SEQ
                                              (LETT |newld|
                                                    (SPADCALL |neweq|
                                                              (QREFELT $ 52))
                                                    . #15#)
                                              (EXIT
                                               (LETT |newL|
                                                     (SPADCALL
                                                      (CONS
                                                       (|function|
                                                        |JBFC-;greater|)
                                                       $)
                                                      |newL|
                                                      (LIST
                                                       (VECTOR |newld| NIL
                                                               (SPADCALL
                                                                (QVELT |eq| 2)
                                                                (QVELT |seq| 2)
                                                                (QREFELT $
                                                                         130))
                                                               |neweq|))
                                                      (QREFELT $ 131))
                                                     . #15#)))))))))))
                                     (LETT #9# (CDR #9#) . #15#) (GO G190) G191
                                     (EXIT NIL)))
                               (#14#
                                (SEQ (LETT |seq| (|SPADfirst| |eqLD|) . #15#)
                                     (LETT |sj|
                                           (SPADCALL (QVELT |seq| 3)
                                                     (QREFELT $ 42))
                                           . #15#)
                                     (LETT |minlen| (LENGTH |sj|) . #15#)
                                     (LETT |lJV| (LIST |sj|) . #15#)
                                     (SEQ (LETT |eq| NIL . #15#)
                                          (LETT #7# (CDR |eqLD|) . #15#) G190
                                          (COND
                                           ((OR (ATOM #7#)
                                                (PROGN
                                                 (LETT |eq| (CAR #7#) . #15#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (LETT JV
                                                 (SPADCALL (QVELT |eq| 3)
                                                           (QREFELT $ 42))
                                                 . #15#)
                                           (LETT |len| (LENGTH JV) . #15#)
                                           (LETT |lJV| (CONS JV |lJV|) . #15#)
                                           (EXIT
                                            (COND
                                             ((< |len| |minlen|)
                                              (SEQ (LETT |seq| |eq| . #15#)
                                                   (LETT |sj| JV . #15#)
                                                   (EXIT
                                                    (LETT |minlen| |len|
                                                          . #15#)))))))
                                          (LETT #7# (CDR #7#) . #15#) (GO G190)
                                          G191 (EXIT NIL))
                                     (LETT |lJV| (NREVERSE |lJV|) . #15#)
                                     (EXIT
                                      (COND
                                       ((EQL |minlen| 1)
                                        (SEQ (LETT JV NIL . #15#)
                                             (LETT #5# |lJV| . #15#)
                                             (LETT |eq| NIL . #15#)
                                             (LETT #4# |eqLD| . #15#) G190
                                             (COND
                                              ((OR (ATOM #4#)
                                                   (PROGN
                                                    (LETT |eq| (CAR #4#)
                                                          . #15#)
                                                    NIL)
                                                   (ATOM #5#)
                                                   (PROGN
                                                    (LETT JV (CAR #5#) . #15#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((SPADCALL |eq| |seq|
                                                           (QREFELT $ 128))
                                                 (COND
                                                  ((EQL (LENGTH JV) 1)
                                                   (|error| #16#))
                                                  ('T
                                                   (LETT |newL|
                                                         (SPADCALL
                                                          (CONS
                                                           (|function|
                                                            |JBFC-;greater|)
                                                           $)
                                                          |newL|
                                                          (LIST
                                                           (VECTOR
                                                            (SPADCALL JV
                                                                      (QREFELT
                                                                       $ 132))
                                                            'T (QVELT |eq| 2)
                                                            (QVELT |eq| 3)))
                                                          (QREFELT $ 131))
                                                         . #15#)))))))
                                             (LETT #4#
                                                   (PROG1 (CDR #4#)
                                                     (LETT #5# (CDR #5#)
                                                           . #15#))
                                                   . #15#)
                                             (GO G190) G191 (EXIT NIL)))
                                       (#14#
                                        (SEQ
                                         (LETT |sjv|
                                               (SPADCALL |sj| (QREFELT $ 132))
                                               . #15#)
                                         (EXIT
                                          (SEQ (LETT JV NIL . #15#)
                                               (LETT #2# |lJV| . #15#)
                                               (LETT |eq| NIL . #15#)
                                               (LETT #1# |eqLD| . #15#) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |eq| (CAR #1#)
                                                            . #15#)
                                                      NIL)
                                                     (ATOM #2#)
                                                     (PROGN
                                                      (LETT JV (CAR #2#)
                                                            . #15#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL |eq| |seq|
                                                             (QREFELT $ 128))
                                                   (SEQ
                                                    (LETT |newld|
                                                          (SPADCALL
                                                           (SPADCALL JV
                                                                     (QREFELT $
                                                                              132))
                                                           |sjv|
                                                           (QREFELT $ 89))
                                                          . #15#)
                                                    (EXIT
                                                     (LETT |newL|
                                                           (SPADCALL
                                                            (CONS
                                                             (|function|
                                                              |JBFC-;greater|)
                                                             $)
                                                            |newL|
                                                            (LIST
                                                             (VECTOR |newld| 'T
                                                                     (QVELT
                                                                      |eq| 2)
                                                                     (QVELT
                                                                      |eq| 3)))
                                                            (QREFELT $ 131))
                                                           . #15#)))))))
                                               (LETT #1#
                                                     (PROG1 (CDR #1#)
                                                       (LETT #2# (CDR #2#)
                                                             . #15#))
                                                     . #15#)
                                               (GO G190) G191
                                               (EXIT NIL))))))))))
                              (EXIT
                               (CONS |seq|
                                     (|JBFC-;simpLD|
                                      (SPADCALL
                                       (CONS (|function| |JBFC-;greater|) $)
                                       |l| |newL| (QREFELT $ 131))
                                      $))))))))))))) 

(SDEFUN |JBFC-;simplify;LSemR;36|
        ((|sys| |List| S) (|jm| |SparseEchelonMatrix| JB S)
         ($ |Record| (|:| |Sys| (|List| S))
          (|:| JM (|SparseEchelonMatrix| JB S))
          (|:| |Depend|
               (|Union| "failed" (|List| (|List| (|NonNegativeInteger|)))))))
        (SPROG
         ((|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| S))))
          (|tmp| (|SparseEchelonMatrix| JB S)) (#1=#:G1023 NIL) (|eq| NIL)
          (#2=#:G1024 NIL) (|dep| NIL) (|i| NIL)
          (|resJM| (|SparseEchelonMatrix| JB S)) (|inds| (|List| JB))
          (|resDep| (|List| #3=(|List| (|NonNegativeInteger|))))
          (#4=#:G1022 NIL) (|l| NIL) (#5=#:G1021 NIL) (|resSys| (|List| S))
          (#6=#:G1020 NIL) (#7=#:G1019 NIL)
          (|sl|
           (|List|
            (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|)) (|:| |Dep| #3#)
                      (|:| |Fun| S))))
          (#8=#:G1018 NIL) (|f| NIL) (#9=#:G1017 NIL) (|newSys| (|List| S))
          (|jmi| (|SparseEchelonMatrix| JB S)) (|neq| (S)) (#10=#:G1016 NIL))
         (SEQ (LETT |newSys| NIL . #11=(|JBFC-;simplify;LSemR;36|))
              (SEQ (LETT |i| 1 . #11#) (LETT |eq| NIL . #11#)
                   (LETT #10# |sys| . #11#) G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |eq| (CAR #10#) . #11#) NIL))
                     (GO G191)))
                   (SEQ (LETT |neq| (SPADCALL |eq| (QREFELT $ 129)) . #11#)
                        (COND
                         ((SPADCALL |neq| |eq| (QREFELT $ 62))
                          (SEQ
                           (LETT |jmi| (SPADCALL (LIST |neq|) (QREFELT $ 99))
                                 . #11#)
                           (EXIT
                            (SPADCALL |jm| |i|
                                      (SPADCALL |jmi| 1 (QREFELT $ 110))
                                      (QREFELT $ 133))))))
                        (EXIT (LETT |newSys| (CONS |neq| |newSys|) . #11#)))
                   (LETT #10#
                         (PROG1 (CDR #10#) (LETT |i| (|inc_SI| |i|) . #11#))
                         . #11#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |newSys| (NREVERSE |newSys|) . #11#)
              (LETT |sl|
                    (PROGN
                     (LETT #9# NIL . #11#)
                     (SEQ (LETT |i| 1 . #11#) (LETT |f| NIL . #11#)
                          (LETT #8# |newSys| . #11#) G190
                          (COND
                           ((OR (ATOM #8#)
                                (PROGN (LETT |f| (CAR #8#) . #11#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #9#
                                  (CONS
                                   (VECTOR
                                    (|SPADfirst|
                                     (QCAR
                                      (SPADCALL |jm| |i| (QREFELT $ 110))))
                                    NIL (LIST |i|) |f|)
                                   #9#)
                                  . #11#)))
                          (LETT #8#
                                (PROG1 (CDR #8#)
                                  (LETT |i| (|inc_SI| |i|) . #11#))
                                . #11#)
                          (GO G190) G191 (EXIT (NREVERSE #9#))))
                    . #11#)
              (LETT |sl|
                    (|JBFC-;simpLD|
                     (SPADCALL (CONS (|function| |JBFC-;greater|) $) |sl|
                               (QREFELT $ 123))
                     $)
                    . #11#)
              (LETT |resSys|
                    (PROGN
                     (LETT #7# NIL . #11#)
                     (SEQ (LETT |l| NIL . #11#) (LETT #6# |sl| . #11#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |l| (CAR #6#) . #11#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #7# (CONS (QVELT |l| 3) #7#) . #11#)))
                          (LETT #6# (CDR #6#) . #11#) (GO G190) G191
                          (EXIT (NREVERSE #7#))))
                    . #11#)
              (LETT |resDep|
                    (PROGN
                     (LETT #5# NIL . #11#)
                     (SEQ (LETT |l| NIL . #11#) (LETT #4# |sl| . #11#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |l| (CAR #4#) . #11#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #5# (CONS (QVELT |l| 2) #5#) . #11#)))
                          (LETT #4# (CDR #4#) . #11#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #11#)
              (LETT |inds| (SPADCALL |jm| (QREFELT $ 95)) . #11#)
              (LETT |resJM| (SPADCALL |inds| (LENGTH |sl|) (QREFELT $ 84))
                    . #11#)
              (SEQ (LETT |i| 1 . #11#) (LETT |dep| NIL . #11#)
                   (LETT #2# |resDep| . #11#) (LETT |eq| NIL . #11#)
                   (LETT #1# |resSys| . #11#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #11#) NIL)
                         (ATOM #2#) (PROGN (LETT |dep| (CAR #2#) . #11#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((EQL (SPADCALL |dep| (QREFELT $ 134)) 1)
                      (LETT |r|
                            (SPADCALL |jm| (|SPADfirst| |dep|) (QREFELT $ 110))
                            . #11#))
                     ('T
                      (SEQ
                       (LETT |tmp|
                             (SPADCALL (LIST |eq|) (LIST |inds|)
                                       (QREFELT $ 76))
                             . #11#)
                       (EXIT
                        (LETT |r| (SPADCALL |tmp| 1 (QREFELT $ 110))
                              . #11#)))))
                    (EXIT (SPADCALL |resJM| |i| |r| (QREFELT $ 133))))
                   (LETT #1#
                         (PROG1 (CDR #1#)
                           (LETT #2#
                                 (PROG1 (CDR #2#)
                                   (LETT |i| (|inc_SI| |i|) . #11#))
                                 . #11#))
                         . #11#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |resSys| |resJM| (CONS 1 |resDep|)))))) 

(SDEFUN |JBFC-;simpOne;2S;37| ((|f| S) ($ S)) (SPADCALL |f| (QREFELT $ 138))) 

(SDEFUN |JBFC-;simpMod;3L;38|
        ((|sys1| |List| S) (|sys2| |List| S) ($ |List| S))
        (SPROG
         ((|res| #1=(|List| S)) (|neq| (S)) (LS1 (|List| S)) (LD1 (|List| JB))
          (|ld| (JB)) (#2=#:G1052 NIL) (#3=#:G1051 NIL) (|eq1| NIL)
          (|newSys| (|List| S)) (LS #1#) (LD (|List| JB))
          (|i| (|NonNegativeInteger|)) (#4=#:G1050 NIL) (|jv| NIL)
          (|ls| (|Union| S "failed")) (#5=#:G1049 NIL) (|eq2| NIL))
         (SEQ
          (COND ((OR (NULL |sys1|) (NULL |sys2|)) |sys1|)
                ('T
                 (SEQ (LETT LD NIL . #6=(|JBFC-;simpMod;3L;38|))
                      (LETT LS NIL . #6#)
                      (SEQ (LETT |eq2| NIL . #6#) (LETT #5# |sys2| . #6#) G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |eq2| (CAR #5#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |ld| (SPADCALL |eq2| (QREFELT $ 52)) . #6#)
                            (LETT |ls| (SPADCALL |eq2| |ld| (QREFELT $ 127))
                                  . #6#)
                            (EXIT
                             (COND
                              ((QEQCAR |ls| 0)
                               (SEQ (LETT |i| 1 . #6#)
                                    (SEQ (LETT |jv| NIL . #6#)
                                         (LETT #4# LD . #6#) G190
                                         (COND
                                          ((OR (ATOM #4#)
                                               (PROGN
                                                (LETT |jv| (CAR #4#) . #6#)
                                                NIL)
                                               (NULL
                                                (SPADCALL |jv| |ld|
                                                          (QREFELT $ 78))))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT (LETT |i| (+ |i| 1) . #6#)))
                                         (LETT #4# (CDR #4#) . #6#) (GO G190)
                                         G191 (EXIT NIL))
                                    (LETT LD
                                          (SPADCALL |ld| LD |i|
                                                    (QREFELT $ 140))
                                          . #6#)
                                    (EXIT
                                     (LETT LS
                                           (SPADCALL (QCDR |ls|) LS |i|
                                                     (QREFELT $ 141))
                                           . #6#)))))))
                           (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |newSys|
                            (SPADCALL (ELT $ 129) |sys1| (QREFELT $ 143))
                            . #6#)
                      (EXIT
                       (COND ((NULL LD) |newSys|)
                             ('T
                              (SEQ (LETT |res| NIL . #6#)
                                   (SEQ (LETT |eq1| NIL . #6#)
                                        (LETT #3# |newSys| . #6#) G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |eq1| (CAR #3#) . #6#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ (LETT |neq| |eq1| . #6#)
                                             (LETT LD1 LD . #6#)
                                             (LETT LS1 LS . #6#)
                                             (SEQ (LETT #2# NIL . #6#) G190
                                                  (COND (#2# (GO G191)))
                                                  (SEQ
                                                   (LETT |ld|
                                                         (SPADCALL |neq|
                                                                   (QREFELT $
                                                                            52))
                                                         . #6#)
                                                   (SEQ G190
                                                        (COND
                                                         ((NULL
                                                           (COND
                                                            ((NULL LD1) NIL)
                                                            ('T
                                                             (SPADCALL
                                                              (|SPADfirst| LD1)
                                                              |ld|
                                                              (QREFELT $
                                                                       78)))))
                                                          (GO G191)))
                                                        (SEQ
                                                         (LETT LD1 (CDR LD1)
                                                               . #6#)
                                                         (EXIT
                                                          (LETT LS1 (CDR LS1)
                                                                . #6#)))
                                                        NIL (GO G190) G191
                                                        (EXIT NIL))
                                                   (EXIT
                                                    (COND
                                                     ((NULL (NULL LD1))
                                                      (SEQ
                                                       (LETT |neq|
                                                             (SPADCALL |neq|
                                                                       (|SPADfirst|
                                                                        LD1)
                                                                       (|SPADfirst|
                                                                        LS1)
                                                                       (QREFELT
                                                                        $ 65))
                                                             . #6#)
                                                       (LETT LD1 (CDR LD1)
                                                             . #6#)
                                                       (EXIT
                                                        (LETT LS1 (CDR LS1)
                                                              . #6#)))))))
                                                  (LETT #2# (NULL LD1) . #6#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (COND
                                              ((SPADCALL |neq| |eq1|
                                                         (QREFELT $ 62))
                                               (LETT |neq|
                                                     (SPADCALL |neq|
                                                               (QREFELT $ 129))
                                                     . #6#)))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |neq|
                                                           (QREFELT $ 85)))
                                                (LETT |res| (CONS |neq| |res|)
                                                      . #6#)))))
                                        (LETT #3# (CDR #3#) . #6#) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT
                                    (SPADCALL (NREVERSE |res|)
                                              (QREFELT $ 144))))))))))))) 

(SDEFUN |JBFC-;simpMod;LSemLR;39|
        ((|sys1| |List| S) (|jm| |SparseEchelonMatrix| JB S) (|sys2| |List| S)
         ($ |Record| (|:| |Sys| (|List| S))
          (|:| JM (|SparseEchelonMatrix| JB S))
          (|:| |Depend|
               (|Union| "failed" (|List| (|List| (|NonNegativeInteger|)))))))
        (SPROG
         ((#1=#:G1095 NIL) (|i| (|NonNegativeInteger|)) (#2=#:G1094 NIL)
          (|resSys| #3=(|List| S)) (|njm| (|SparseEchelonMatrix| JB S))
          (#4=#:G1092 NIL) (|neq| (S)) (#5=#:G1093 NIL) (|oeq| NIL)
          (|resJM| (|SparseEchelonMatrix| JB S)) (|res| #3#) (LS1 (|List| S))
          (LD1 (|List| JB)) (|ld| (JB)) (#6=#:G1091 NIL) (#7=#:G1090 NIL)
          (|eq1| NIL) (|newSys| (|List| S)) (LS #3#) (LD (|List| JB))
          (#8=#:G1089 NIL) (|jv| NIL) (|ls| (|Union| S "failed"))
          (#9=#:G1088 NIL) (|eq2| NIL) (|osys| (|List| S)) (#10=#:G1087 NIL)
          (#11=#:G1086 NIL))
         (SEQ
          (COND
           ((OR (NULL |sys1|) (NULL |sys2|))
            (VECTOR |sys1| |jm|
                    (CONS 1
                          (PROGN
                           (LETT #11# NIL . #12=(|JBFC-;simpMod;LSemLR;39|))
                           (SEQ (LETT |i| 1 . #12#)
                                (LETT #10# (LENGTH |sys1|) . #12#) G190
                                (COND ((|greater_SI| |i| #10#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #11# (CONS (LIST |i|) #11#) . #12#)))
                                (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                                (EXIT (NREVERSE #11#)))))))
           ('T
            (SEQ (LETT |osys| |sys1| . #12#) (LETT LD NIL . #12#)
                 (LETT LS NIL . #12#)
                 (SEQ (LETT |eq2| NIL . #12#) (LETT #9# |sys2| . #12#) G190
                      (COND
                       ((OR (ATOM #9#)
                            (PROGN (LETT |eq2| (CAR #9#) . #12#) NIL))
                        (GO G191)))
                      (SEQ (LETT |ld| (SPADCALL |eq2| (QREFELT $ 52)) . #12#)
                           (LETT |ls| (SPADCALL |eq2| |ld| (QREFELT $ 127))
                                 . #12#)
                           (EXIT
                            (COND
                             ((QEQCAR |ls| 0)
                              (SEQ (LETT |i| 1 . #12#)
                                   (SEQ (LETT |jv| NIL . #12#)
                                        (LETT #8# LD . #12#) G190
                                        (COND
                                         ((OR (ATOM #8#)
                                              (PROGN
                                               (LETT |jv| (CAR #8#) . #12#)
                                               NIL)
                                              (NULL
                                               (SPADCALL |jv| |ld|
                                                         (QREFELT $ 78))))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT (LETT |i| (+ |i| 1) . #12#)))
                                        (LETT #8# (CDR #8#) . #12#) (GO G190)
                                        G191 (EXIT NIL))
                                   (LETT LD
                                         (SPADCALL |ld| LD |i| (QREFELT $ 140))
                                         . #12#)
                                   (EXIT
                                    (LETT LS
                                          (SPADCALL (QCDR |ls|) LS |i|
                                                    (QREFELT $ 141))
                                          . #12#)))))))
                      (LETT #9# (CDR #9#) . #12#) (GO G190) G191 (EXIT NIL))
                 (LETT |newSys| (SPADCALL (ELT $ 129) |sys1| (QREFELT $ 143))
                       . #12#)
                 (LETT |res| NIL . #12#)
                 (SEQ (LETT |eq1| NIL . #12#) (LETT #7# |newSys| . #12#) G190
                      (COND
                       ((OR (ATOM #7#)
                            (PROGN (LETT |eq1| (CAR #7#) . #12#) NIL))
                        (GO G191)))
                      (SEQ (LETT |neq| |eq1| . #12#) (LETT LD1 LD . #12#)
                           (LETT LS1 LS . #12#)
                           (SEQ (LETT #6# NIL . #12#) G190
                                (COND (#6# (GO G191)))
                                (SEQ
                                 (LETT |ld| (SPADCALL |neq| (QREFELT $ 52))
                                       . #12#)
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND ((NULL LD1) NIL)
                                               ('T
                                                (SPADCALL (|SPADfirst| LD1)
                                                          |ld|
                                                          (QREFELT $ 78)))))
                                        (GO G191)))
                                      (SEQ (LETT LD1 (CDR LD1) . #12#)
                                           (EXIT (LETT LS1 (CDR LS1) . #12#)))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (EXIT
                                  (COND
                                   ((NULL (NULL LD1))
                                    (SEQ
                                     (LETT |neq|
                                           (SPADCALL |neq| (|SPADfirst| LD1)
                                                     (|SPADfirst| LS1)
                                                     (QREFELT $ 65))
                                           . #12#)
                                     (LETT LD1 (CDR LD1) . #12#)
                                     (EXIT (LETT LS1 (CDR LS1) . #12#)))))))
                                (LETT #6# (NULL LD1) . #12#) (GO G190) G191
                                (EXIT NIL))
                           (COND
                            ((SPADCALL |neq| |eq1| (QREFELT $ 62))
                             (LETT |neq| (SPADCALL |neq| (QREFELT $ 129))
                                   . #12#)))
                           (EXIT (LETT |res| (CONS |neq| |res|) . #12#)))
                      (LETT #7# (CDR #7#) . #12#) (GO G190) G191 (EXIT NIL))
                 (LETT |resSys| NIL . #12#) (LETT |resJM| |jm| . #12#)
                 (SEQ (LETT |i| (LENGTH |res|) . #12#) (LETT |oeq| NIL . #12#)
                      (LETT #5# (NREVERSE |osys|) . #12#)
                      (LETT |neq| NIL . #12#) (LETT #4# |res| . #12#) G190
                      (COND
                       ((OR (ATOM #4#)
                            (PROGN (LETT |neq| (CAR #4#) . #12#) NIL)
                            (ATOM #5#)
                            (PROGN (LETT |oeq| (CAR #5#) . #12#) NIL)
                            (< |i| 1))
                        (GO G191)))
                      (SEQ
                       (COND
                        ((SPADCALL |neq| |oeq| (QREFELT $ 62))
                         (SEQ
                          (LETT |njm| (SPADCALL (LIST |neq|) (QREFELT $ 99))
                                . #12#)
                          (EXIT
                           (SPADCALL |resJM| |i|
                                     (SPADCALL |njm| 1 (QREFELT $ 110))
                                     (QREFELT $ 133))))))
                       (EXIT (LETT |resSys| (CONS |neq| |resSys|) . #12#)))
                      (LETT #4#
                            (PROG1 (CDR #4#)
                              (LETT #5#
                                    (PROG1 (CDR #5#)
                                      (LETT |i| (+ |i| -1) . #12#))
                                    . #12#))
                            . #12#)
                      (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (VECTOR |resSys| |resJM|
                          (CONS 1
                                (PROGN
                                 (LETT #2# NIL . #12#)
                                 (SEQ (LETT |i| 1 . #12#)
                                      (LETT #1# (LENGTH |resSys|) . #12#) G190
                                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2# (CONS (LIST |i|) #2#)
                                              . #12#)))
                                      (LETT |i| (|inc_SI| |i|) . #12#)
                                      (GO G190) G191
                                      (EXIT (NREVERSE #2#))))))))))))) 

(SDEFUN |JBFC-;reduceMod;3L;40|
        ((|sys1| |List| S) (|sys2| |List| S) ($ |List| S))
        (SPROG
         ((|res| #1=(|List| S)) (LS1 (|List| S)) (LD1 (|List| JB)) (|neq| (S))
          (|ld| (JB)) (#2=#:G1122 NIL) (|oeq| (S)) (|eq| (S)) (#3=#:G1121 NIL)
          (|eq1| NIL) (|newSys| (|List| S)) (LS #1#) (LD (|List| JB))
          (|i| (|NonNegativeInteger|)) (#4=#:G1120 NIL) (|jv| NIL)
          (|ls| (|Union| S "failed")) (#5=#:G1119 NIL) (|eq2| NIL))
         (SEQ
          (COND ((OR (NULL |sys1|) (NULL |sys2|)) |sys1|)
                ('T
                 (SEQ (LETT LD NIL . #6=(|JBFC-;reduceMod;3L;40|))
                      (LETT LS NIL . #6#)
                      (SEQ (LETT |eq2| NIL . #6#) (LETT #5# |sys2| . #6#) G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |eq2| (CAR #5#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |ld| (SPADCALL |eq2| (QREFELT $ 52)) . #6#)
                            (LETT |ls| (SPADCALL |eq2| |ld| (QREFELT $ 127))
                                  . #6#)
                            (EXIT
                             (COND
                              ((QEQCAR |ls| 0)
                               (SEQ (LETT |i| 1 . #6#)
                                    (SEQ (LETT |jv| NIL . #6#)
                                         (LETT #4# LD . #6#) G190
                                         (COND
                                          ((OR (ATOM #4#)
                                               (PROGN
                                                (LETT |jv| (CAR #4#) . #6#)
                                                NIL)
                                               (NULL
                                                (SPADCALL |jv| |ld|
                                                          (QREFELT $ 78))))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT (LETT |i| (+ |i| 1) . #6#)))
                                         (LETT #4# (CDR #4#) . #6#) (GO G190)
                                         G191 (EXIT NIL))
                                    (LETT LD
                                          (SPADCALL |ld| LD |i|
                                                    (QREFELT $ 140))
                                          . #6#)
                                    (EXIT
                                     (LETT LS
                                           (SPADCALL (QCDR |ls|) LS |i|
                                                     (QREFELT $ 141))
                                           . #6#)))))))
                           (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |newSys|
                            (SPADCALL (ELT $ 129) |sys1| (QREFELT $ 143))
                            . #6#)
                      (EXIT
                       (COND ((NULL LD) |newSys|)
                             ('T
                              (SEQ (LETT |res| NIL . #6#)
                                   (SEQ (LETT |eq1| NIL . #6#)
                                        (LETT #3# |newSys| . #6#) G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |eq1| (CAR #3#) . #6#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ (LETT |eq| |eq1| . #6#)
                                             (LETT |oeq| (|spadConstant| $ 61)
                                                   . #6#)
                                             (LETT |neq| |eq1| . #6#)
                                             (SEQ G190
                                                  (COND
                                                   ((NULL
                                                     (SPADCALL |neq| |oeq|
                                                               (QREFELT $ 62)))
                                                    (GO G191)))
                                                  (SEQ (LETT |oeq| |neq| . #6#)
                                                       (LETT LD1 LD . #6#)
                                                       (LETT LS1 LS . #6#)
                                                       (EXIT
                                                        (SEQ
                                                         (LETT #2# NIL . #6#)
                                                         G190
                                                         (COND (#2# (GO G191)))
                                                         (SEQ
                                                          (LETT |ld|
                                                                (SPADCALL |neq|
                                                                          (QREFELT
                                                                           $
                                                                           52))
                                                                . #6#)
                                                          (SEQ G190
                                                               (COND
                                                                ((NULL
                                                                  (COND
                                                                   ((NULL LD1)
                                                                    NIL)
                                                                   ('T
                                                                    (SPADCALL
                                                                     (|SPADfirst|
                                                                      LD1)
                                                                     |ld|
                                                                     (QREFELT $
                                                                              78)))))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (LETT LD1
                                                                      (CDR LD1)
                                                                      . #6#)
                                                                (EXIT
                                                                 (LETT LS1
                                                                       (CDR
                                                                        LS1)
                                                                       . #6#)))
                                                               NIL (GO G190)
                                                               G191 (EXIT NIL))
                                                          (EXIT
                                                           (COND
                                                            ((NULL (NULL LD1))
                                                             (SEQ
                                                              (LETT |neq|
                                                                    (SPADCALL
                                                                     |neq|
                                                                     (|SPADfirst|
                                                                      LD1)
                                                                     (|SPADfirst|
                                                                      LS1)
                                                                     (QREFELT $
                                                                              147))
                                                                    . #6#)
                                                              (LETT LD1
                                                                    (CDR LD1)
                                                                    . #6#)
                                                              (EXIT
                                                               (LETT LS1
                                                                     (CDR LS1)
                                                                     . #6#)))))))
                                                         (LETT #2# (NULL LD1)
                                                               . #6#)
                                                         (GO G190) G191
                                                         (EXIT NIL))))
                                                  NIL (GO G190) G191
                                                  (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |neq|
                                                           (QREFELT $ 85)))
                                                (COND
                                                 ((SPADCALL |neq| |eq|
                                                            (QREFELT $ 148))
                                                  (LETT |res|
                                                        (CONS |neq| |res|)
                                                        . #6#))
                                                 ('T
                                                  (LETT |res|
                                                        (CONS
                                                         (SPADCALL |neq|
                                                                   (QREFELT $
                                                                            129))
                                                         |res|)
                                                        . #6#)))))))
                                        (LETT #3# (CDR #3#) . #6#) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT
                                    (SPADCALL (NREVERSE |res|)
                                              (QREFELT $ 144))))))))))))) 

(SDEFUN |JBFC-;autoReduce;2L;41| ((|sys| |List| S) ($ |List| S))
        (SPROG
         ((#1=#:G1180 NIL)
          (|rec|
           #2=(|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                        (|:| |Dep| (|List| (|NonNegativeInteger|)))
                        (|:| |Fun| S)))
          (#3=#:G1179 NIL)
          (|tmp1|
           (|List|
            #4=(|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                         (|:| |Dep| (|List| (|NonNegativeInteger|)))
                         (|:| |Fun| S))))
          (|tmp2| (|List| #4#)) (#5=#:G1178 NIL) (#6=#:G1177 NIL)
          (#7=#:G1176 NIL) (|eq| NIL) (#8=#:G1175 NIL) (|nl| (|List| S))
          (|ol| #9=(|List| S)) (|seq| (S)) (#10=#:G1174 NIL) (|sub| #2#)
          (#11=#:G1173 NIL) (|nsl| #9#) (#12=#:G1172 NIL) (#13=#:G1171 NIL)
          (|sl|
           #14=(|List|
                (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                          (|:| |Dep| (|List| (|NonNegativeInteger|)))
                          (|:| |Fun| S))))
          (|ic| (S)) (|tmp| #14#) (|d| (|List| (|NonNegativeInteger|)))
          (#15=#:G1170 NIL) (#16=#:G1168 NIL) (|osl| #14#)
          (|su| (|Union| S "failed")) (|ld| (JB)) (#17=#:G1169 NIL))
         (SEQ
          (COND ((NULL |sys|) NIL) ((EQL (LENGTH |sys|) 1) |sys|)
                ('T
                 (SEQ
                  (LETT |nl| (SPADCALL (ELT $ 129) |sys| (QREFELT $ 143))
                        . #18=(|JBFC-;autoReduce;2L;41|))
                  (LETT |nsl| NIL . #18#) (LETT |sl| NIL . #18#)
                  (LETT |osl| |sl| . #18#)
                  (SEQ G190 (COND ((NULL (NULL (NULL |nl|))) (GO G191)))
                       (SEQ
                        (SEQ (LETT |eq| NIL . #18#) (LETT #17# |nl| . #18#)
                             G190
                             (COND
                              ((OR (ATOM #17#)
                                   (PROGN (LETT |eq| (CAR #17#) . #18#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |ld| (SPADCALL |eq| (QREFELT $ 52)) . #18#)
                              (LETT |su| (SPADCALL |eq| |ld| (QREFELT $ 127))
                                    . #18#)
                              (EXIT
                               (COND
                                ((QEQCAR |su| 1)
                                 (LETT |nsl| (CONS |eq| |nsl|) . #18#))
                                ('T
                                 (LETT |sl|
                                       (SPADCALL
                                        (CONS (|function| |JBFC-;greater|) $)
                                        |sl|
                                        (LIST (VECTOR |ld| 'T NIL (QCDR |su|)))
                                        (QREFELT $ 150))
                                       . #18#)))))
                             (LETT #17# (CDR #17#) . #18#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |nl| NIL . #18#) (LETT |osl| NIL . #18#)
                        (LETT |sl| (NREVERSE |sl|) . #18#)
                        (SEQ G190 (COND ((NULL (NULL (NULL |sl|))) (GO G191)))
                             (SEQ (LETT |sub| (|SPADfirst| |sl|) . #18#)
                                  (LETT |osl| (CONS |sub| |osl|) . #18#)
                                  (LETT |sl| (CDR |sl|) . #18#)
                                  (SEQ
                                   (EXIT
                                    (SEQ G190
                                         (COND
                                          ((NULL (NULL (NULL |sl|)))
                                           (GO G191)))
                                         (SEQ
                                          (LETT |rec| (|SPADfirst| |sl|)
                                                . #18#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL (QVELT |rec| 0)
                                                       (QVELT |sub| 0)
                                                       (QREFELT $ 78))
                                             (PROGN
                                              (LETT #16# |$NoValue| . #18#)
                                              (GO #19=#:G1139)))
                                            ('T
                                             (SEQ (LETT |sl| (CDR |sl|) . #18#)
                                                  (LETT |ic|
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QVELT |rec| 3)
                                                          (QVELT |sub| 3)
                                                          (QREFELT $ 151))
                                                         (QREFELT $ 129))
                                                        . #18#)
                                                  (EXIT
                                                   (COND
                                                    ((NULL
                                                      (SPADCALL |ic|
                                                                (QREFELT $
                                                                         85)))
                                                     (LETT |nl|
                                                           (CONS |ic| |nl|)
                                                           . #18#)))))))))
                                         NIL (GO G190) G191 (EXIT NIL)))
                                   #19# (EXIT #16#))
                                  (LETT |tmp| NIL . #18#)
                                  (SEQ (LETT |rec| NIL . #18#)
                                       (LETT #15# |sl| . #18#) G190
                                       (COND
                                        ((OR (ATOM #15#)
                                             (PROGN
                                              (LETT |rec| (CAR #15#) . #18#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |d|
                                              (SPADCALL (QVELT |rec| 0)
                                                        (QVELT |sub| 0)
                                                        (QREFELT $ 63))
                                              . #18#)
                                        (EXIT
                                         (COND
                                          ((NULL |d|)
                                           (SEQ
                                            (LETT |seq|
                                                  (SPADCALL (QVELT |rec| 3)
                                                            (QVELT |sub| 0)
                                                            (QVELT |sub| 3)
                                                            (QREFELT $ 147))
                                                  . #18#)
                                            (EXIT
                                             (LETT |tmp|
                                                   (CONS
                                                    (VECTOR (QVELT |rec| 0) 'T
                                                            NIL |seq|)
                                                    |tmp|)
                                                   . #18#))))
                                          ('T
                                           (SEQ
                                            (LETT |ic|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL (QVELT |sub| 3)
                                                              |d|
                                                              (QREFELT $ 64))
                                                    (QVELT |rec| 3)
                                                    (QREFELT $ 151))
                                                   (QVELT |sub| 0)
                                                   (QVELT |sub| 3)
                                                   (QREFELT $ 147))
                                                  . #18#)
                                            (LETT |ic|
                                                  (SPADCALL |ic|
                                                            (QREFELT $ 129))
                                                  . #18#)
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (SPADCALL |ic| (QREFELT $ 85)))
                                               (LETT |nl| (CONS |ic| |nl|)
                                                     . #18#)))))))))
                                       (LETT #15# (CDR #15#) . #18#) (GO G190)
                                       G191 (EXIT NIL))
                                  (EXIT (LETT |sl| (NREVERSE |tmp|) . #18#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (LETT |sl| |osl| . #18#) (LETT |ol| NIL . #18#)
                        (SEQ (LETT |eq| NIL . #18#) (LETT #13# |nsl| . #18#)
                             G190
                             (COND
                              ((OR (ATOM #13#)
                                   (PROGN (LETT |eq| (CAR #13#) . #18#) NIL))
                               (GO G191)))
                             (SEQ (LETT |seq| |eq| . #18#)
                                  (SEQ (LETT |sub| NIL . #18#)
                                       (LETT #12# |sl| . #18#) G190
                                       (COND
                                        ((OR (ATOM #12#)
                                             (PROGN
                                              (LETT |sub| (CAR #12#) . #18#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT |seq|
                                               (SPADCALL |seq| (QVELT |sub| 0)
                                                         (QVELT |sub| 3)
                                                         (QREFELT $ 147))
                                               . #18#)))
                                       (LETT #12# (CDR #12#) . #18#) (GO G190)
                                       G191 (EXIT NIL))
                                  (EXIT
                                   (COND
                                    ((SPADCALL |seq| |eq| (QREFELT $ 148))
                                     (LETT |ol| (CONS |eq| |ol|) . #18#))
                                    ((NULL (SPADCALL |seq| (QREFELT $ 85)))
                                     (LETT |nl|
                                           (CONS
                                            (SPADCALL |seq| (QREFELT $ 129))
                                            |nl|)
                                           . #18#)))))
                             (LETT #13# (CDR #13#) . #18#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |nsl| |ol| . #18#) (LETT |ol| NIL . #18#)
                        (SEQ (LETT |eq| NIL . #18#) (LETT #11# |nl| . #18#)
                             G190
                             (COND
                              ((OR (ATOM #11#)
                                   (PROGN (LETT |eq| (CAR #11#) . #18#) NIL))
                               (GO G191)))
                             (SEQ (LETT |seq| |eq| . #18#)
                                  (SEQ (LETT |sub| NIL . #18#)
                                       (LETT #10# |sl| . #18#) G190
                                       (COND
                                        ((OR (ATOM #10#)
                                             (PROGN
                                              (LETT |sub| (CAR #10#) . #18#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT |seq|
                                               (SPADCALL |seq| (QVELT |sub| 0)
                                                         (QVELT |sub| 3)
                                                         (QREFELT $ 147))
                                               . #18#)))
                                       (LETT #10# (CDR #10#) . #18#) (GO G190)
                                       G191 (EXIT NIL))
                                  (EXIT
                                   (COND
                                    ((NULL (SPADCALL |seq| (QREFELT $ 85)))
                                     (LETT |ol|
                                           (CONS
                                            (SPADCALL |seq| (QREFELT $ 129))
                                            |ol|)
                                           . #18#)))))
                             (LETT #11# (CDR #11#) . #18#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |nl| |ol| . #18#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |tmp1|
                        (PROGN
                         (LETT #8# NIL . #18#)
                         (SEQ (LETT |eq| NIL . #18#) (LETT #7# |nsl| . #18#)
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |eq| (CAR #7#) . #18#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #8#
                                      (CONS
                                       (VECTOR (SPADCALL |eq| (QREFELT $ 52))
                                               'T NIL |eq|)
                                       #8#)
                                      . #18#)))
                              (LETT #7# (CDR #7#) . #18#) (GO G190) G191
                              (EXIT (NREVERSE #8#))))
                        . #18#)
                  (LETT |tmp2|
                        (PROGN
                         (LETT #6# NIL . #18#)
                         (SEQ (LETT |rec| NIL . #18#) (LETT #5# |sl| . #18#)
                              G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |rec| (CAR #5#) . #18#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #6#
                                      (CONS
                                       (VECTOR (QVELT |rec| 0) 'T NIL
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL (QVELT |rec| 0)
                                                           (QREFELT $ 12))
                                                 (QVELT |rec| 3)
                                                 (QREFELT $ 151))
                                                (QREFELT $ 129)))
                                       #6#)
                                      . #18#)))
                              (LETT #5# (CDR #5#) . #18#) (GO G190) G191
                              (EXIT (NREVERSE #6#))))
                        . #18#)
                  (LETT |tmp1|
                        (SPADCALL (CONS (|function| |JBFC-;greater|) $)
                                  (SPADCALL |tmp1| |tmp2| (QREFELT $ 152))
                                  (QREFELT $ 123))
                        . #18#)
                  (EXIT
                   (PROGN
                    (LETT #3# NIL . #18#)
                    (SEQ (LETT |rec| NIL . #18#) (LETT #1# |tmp1| . #18#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |rec| (CAR #1#) . #18#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT (LETT #3# (CONS (QVELT |rec| 3) #3#) . #18#)))
                         (LETT #1# (CDR #1#) . #18#) (GO G190) G191
                         (EXIT (NREVERSE #3#))))))))))) 

(DECLAIM (NOTINLINE |JetBundleFunctionCategory&;|)) 

(DEFUN |JetBundleFunctionCategory&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|JetBundleFunctionCategory&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|JetBundleFunctionCategory&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 154) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
          (QSETREFV $ 74 (|HasCategory| |#1| '(|lazyRepresentation|)))
          $))) 

(MAKEPROP '|JetBundleFunctionCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |numIndVar|) '|nn| (4 . X)
              (9 . |coerce|) |JBFC-;X;PiS;1| (14 . U) |JBFC-;U;PiS;2|
              (|List| 25) (19 . P) |JBFC-;P;PiLS;3| (25 . X) |JBFC-;X;S;4|
              (29 . U) |JBFC-;U;S;5| (33 . P) |JBFC-;P;LS;6|
              (|NonNegativeInteger|) (38 . P) |JBFC-;P;PiNniS;7| (44 . P)
              |JBFC-;P;NniS;8| (|Symbol|) (49 . |setNotation|) (|Void|)
              |JBFC-;setNotation;SV;9| (54 . |getNotation|)
              |JBFC-;getNotation;S;10| |JBFC-;numIndVar;Pi;11|
              (58 . |numDepVar|) |JBFC-;numDepVar;Pi;12| (62 . |One|)
              |JBFC-;gcd;3S;13| (|List| 7) (66 . |jetVariables|)
              (71 . |differentiate|) (|Boolean|) (77 . |one?|)
              (|Union| 7 '"failed") |JBFC-;retractIfCan;SU;14| (82 . >)
              (88 . |One|) (92 . =) |JBFC-;const?;SB;15| (98 . |leadingDer|)
              (103 . |order|) |JBFC-;order;SNni;16| (108 . |class|)
              |JBFC-;class;SNni;17| |JBFC-;leadingDer;SJB;18| (113 . |member?|)
              |JBFC-;freeOf?;SJBB;19| |JBFC-;characteristic;Nni;20|
              (119 . |Zero|) (123 . ~=) (129 . |derivativeOf?|)
              (135 . |formalDiff|) (141 . |subst|) (148 . <)
              |JBFC-;dSubst;SJB2S;21| (154 . |dimJ|) (|List| $)
              (|SparseEchelonMatrix| 7 $) |JBFC-;dimension;LSem2Nni;22|
              (159 . |dimS|) |JBFC-;orderDim;LSem2Nni;23| '|noChecks?|
              (|List| 41) (164 . |jacobiMatrix|) |JBFC-;jacobiMatrix;LSem;24|
              (170 . >) (|Mapping| 44 7 7) (176 . |merge|)
              (183 . |removeDuplicates!|) (|Integer|)
              (|SparseEchelonMatrix| 7 6) (188 . |new|) (194 . |zero?|)
              (|List| 6) (199 . |setRow!|) |JBFC-;jacobiMatrix;LLSem;25|
              (207 . |max|) (213 . |max|) (219 . |max|) (|Mapping| 25 25 25)
              (225 . |reduce|) |JBFC-;symbol;LSem;26| (232 . |allIndices|)
              (|Record| (|:| |Left| $) (|:| |Right| $)) (237 . |horizSplit|)
              |JBFC-;extractSymbol;2Sem;27| (243 . |jacobiMatrix|)
              (|Record| (|:| |DSys| 69) (|:| |JVars| 75)) (248 . |formalDiff2|)
              |JBFC-;formalDiff;LPiL;28| (255 . |formalDiff|)
              |JBFC-;formalDiff;SPiS;29|
              (|Record| (|:| |DPhi| $) (|:| |JVars| 41)) (261 . |formalDiff2|)
              |JBFC-;formalDiff;SLS;30| (268 . |nrows|)
              (|Record| (|:| |Indices| 41) (|:| |Entries| 86)) (273 . |row|)
              (|Union| $ '#1="0") (279 . |differentiate|) (|Union| 7 '#1#)
              (285 . =) (291 . +) (297 . *) (303 . |sort!|)
              |JBFC-;formalDiff2;LPiSemR;31| |JBFC-;formalDiff2;SPiSemR;32|
              (|Record| (|:| LD 7) (|:| |Fake?| 44) (|:| |Dep| 16)
                        (|:| |Fun| 6))
              (|Mapping| 44 120 120) (|List| 120) (309 . |sort!|)
              |JBFC-;sortLD;2L;34| (315 . ~=) (|Union| $ '"failed")
              (321 . |solveFor|) (327 . ~=) (333 . |simpOne|) (338 . |append|)
              (344 . |merge|) (351 . |second|) (356 . |setRow!|) (363 . |#|)
              (|Union| '"failed" (|List| 16))
              (|Record| (|:| |Sys| 69) (|:| JM 70) (|:| |Depend| 135))
              |JBFC-;simplify;LSemR;36| (368 . |numerator|)
              |JBFC-;simpOne;2S;37| (373 . |insert|) (380 . |insert|)
              (|Mapping| 6 6) (387 . |map|) (393 . |sortLD|)
              |JBFC-;simpMod;3L;38| |JBFC-;simpMod;LSemLR;39| (398 . |dSubst|)
              (405 . =) |JBFC-;reduceMod;3L;40| (411 . |merge!|) (418 . -)
              (424 . |concat!|) |JBFC-;autoReduce;2L;41|)
           '#(|symbol| 430 |sortLD| 435 |simplify| 440 |simpOne| 446 |simpMod|
              451 |setNotation| 464 |retractIfCan| 469 |reduceMod| 474
              |orderDim| 480 |order| 487 |numIndVar| 492 |numDepVar| 496
              |leadingDer| 500 |jacobiMatrix| 505 |getNotation| 516 |gcd| 520
              |freeOf?| 526 |formalDiff2| 532 |formalDiff| 546 |extractSymbol|
              564 |dimension| 569 |dSubst| 576 |const?| 583 |class| 588
              |characteristic| 593 |autoReduce| 597 X 602 U 611 P 620)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 153
                                                 '(0 7 8 9 1 7 0 8 11 1 6 0 7
                                                   12 1 7 0 8 14 2 7 0 8 16 17
                                                   0 7 0 19 0 7 0 21 1 7 0 16
                                                   23 2 7 0 8 25 26 1 7 0 25 28
                                                   1 7 30 30 31 0 7 30 34 0 7 8
                                                   37 0 6 0 39 1 6 41 0 42 2 6
                                                   0 0 7 43 1 6 44 0 45 2 25 44
                                                   0 0 48 0 7 0 49 2 7 44 0 0
                                                   50 1 6 7 0 52 1 7 25 0 53 1
                                                   7 25 0 55 2 41 44 7 0 58 0 6
                                                   0 61 2 6 44 0 0 62 2 7 16 0
                                                   0 63 2 6 0 0 16 64 3 6 0 0 7
                                                   0 65 2 7 44 0 0 66 1 7 25 25
                                                   68 1 7 25 25 72 2 6 70 69 75
                                                   76 2 7 44 0 0 78 3 41 0 79 0
                                                   0 80 1 41 0 0 81 2 83 0 41
                                                   82 84 1 6 44 0 85 4 83 32 0
                                                   82 41 86 87 2 7 0 0 0 89 2
                                                   41 0 0 0 90 2 25 0 0 0 91 3
                                                   16 25 92 0 25 93 1 83 41 0
                                                   95 2 83 96 0 7 97 1 6 70 69
                                                   99 3 6 100 69 8 70 101 2 6
                                                   69 69 8 103 3 6 105 0 8 70
                                                   106 1 83 25 0 108 2 83 109 0
                                                   82 110 2 7 111 0 8 112 2 113
                                                   44 0 0 114 2 6 0 0 0 115 2 6
                                                   0 0 0 116 2 41 0 79 0 117 2
                                                   122 0 121 0 123 2 7 44 0 0
                                                   125 2 6 126 0 7 127 2 120 44
                                                   0 0 128 1 6 0 0 129 2 16 0 0
                                                   0 130 3 122 0 121 0 0 131 1
                                                   41 7 0 132 3 83 32 0 82 109
                                                   133 1 16 25 0 134 1 6 0 0
                                                   138 3 41 0 7 0 82 140 3 86 0
                                                   6 0 82 141 2 86 0 142 0 143
                                                   1 6 69 69 144 3 6 0 0 7 0
                                                   147 2 6 44 0 0 148 3 122 0
                                                   121 0 0 150 2 6 0 0 0 151 2
                                                   122 0 0 0 152 1 0 70 69 94 1
                                                   0 69 69 124 2 0 136 69 70
                                                   137 1 0 0 0 139 3 0 136 69
                                                   70 69 146 2 0 69 69 69 145 1
                                                   0 32 30 33 1 0 46 0 47 2 0
                                                   69 69 69 149 3 0 25 69 70 25
                                                   73 1 0 25 0 54 0 0 8 36 0 0
                                                   8 38 1 0 7 0 57 2 0 70 69 75
                                                   88 1 0 70 69 77 0 0 30 35 2
                                                   0 0 0 0 40 2 0 44 0 7 59 3 0
                                                   100 69 8 70 118 3 0 105 0 8
                                                   70 119 2 0 69 69 8 102 2 0 0
                                                   0 8 104 2 0 0 0 16 107 1 0
                                                   70 70 98 3 0 25 69 70 25 71
                                                   3 0 0 0 7 0 67 1 0 44 0 51 1
                                                   0 25 0 56 0 0 25 60 1 0 69
                                                   69 153 0 0 0 20 1 0 0 8 13 0
                                                   0 0 22 1 0 0 8 15 2 0 0 8 25
                                                   27 1 0 0 25 29 1 0 0 16 24 2
                                                   0 0 8 16 18)))))
           '|lookupComplete|)) 
