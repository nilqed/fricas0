
(PUT '|GDMP;zero?;$B;1| '|SPADreplace| 'NULL) 

(SDEFUN |GDMP;zero?;$B;1| ((|p| $) ($ |Boolean|)) (NULL |p|)) 

(SDEFUN |GDMP;totalDegree;$Nni;2| ((|p| $) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G731 NIL) (#2=#:G730 #3=(|NonNegativeInteger|)) (#4=#:G732 #3#)
          (#5=#:G737 NIL) (|t| NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 13)) 0)
                (#6='T
                 (PROGN
                  (LETT #1# NIL . #7=(|GDMP;totalDegree;$Nni;2|))
                  (SEQ (LETT |t| NIL . #7#) (LETT #5# |p| . #7#) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SPADCALL (ELT $ 18)
                                          (SPADCALL (QCAR |t|) (QREFELT $ 15))
                                          0 (QREFELT $ 20))
                                . #7#)
                          (COND (#1# (LETT #2# (MAX #2# #4#) . #7#))
                                ('T
                                 (PROGN
                                  (LETT #2# #4# . #7#)
                                  (LETT #1# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# (|IdentityError| '|max|))))))))) 

(SDEFUN |GDMP;monomial;$OvlNni$;3|
        ((|p| $) (|v| |OrderedVariableList| |vl|) (|e| |NonNegativeInteger|)
         ($ $))
        (SPROG
         ((#1=#:G745 NIL) (#2=#:G747 NIL) (|z| NIL) (#3=#:G746 NIL)
          (|locv| (|PositiveInteger|)))
         (SEQ
          (LETT |locv| (SPADCALL |v| (QREFELT $ 24))
                . #4=(|GDMP;monomial;$OvlNni$;3|))
          (EXIT
           (SPADCALL |p|
                     (SPADCALL (|spadConstant| $ 26)
                               (SPADCALL
                                (PROGN
                                 (LETT #3# (GETREFV #5=(QREFELT $ 11)) . #4#)
                                 (SEQ (LETT |z| 1 . #4#) (LETT #2# #5# . #4#)
                                      (LETT #1# 0 . #4#) G190
                                      (COND ((|greater_SI| |z| #2#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SETELT #3# #1#
                                                (COND ((EQL |z| |locv|) |e|)
                                                      ('T 0)))))
                                      (LETT #1#
                                            (PROG1 (|inc_SI| #1#)
                                              (LETT |z| (|inc_SI| |z|) . #4#))
                                            . #4#)
                                      (GO G190) G191 (EXIT NIL))
                                 #3#)
                                (QREFELT $ 27))
                               (QREFELT $ 28))
                     (QREFELT $ 29)))))) 

(SDEFUN |GDMP;coerce;Ovl$;4| ((|v| |OrderedVariableList| |vl|) ($ $))
        (SPADCALL (|spadConstant| $ 25) |v| 1 (QREFELT $ 30))) 

(SDEFUN |GDMP;listCoef| ((|p| $) ($ |List| R))
        (SPROG ((#1=#:G753 NIL) (|rec| NIL) (#2=#:G752 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|GDMP;listCoef|))
                 (SEQ (LETT |rec| NIL . #3#) (LETT #1# |p| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |rec| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCDR |rec|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GDMP;mainVariable;$U;6|
        ((|p| $) ($ |Union| (|OrderedVariableList| |vl|) #1="failed"))
        (SPROG
         ((#2=#:G765 NIL) (|vv| (|OrderedVariableList| |vl|)) (#3=#:G755 NIL)
          (#4=#:G766 NIL) (|v| NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |p| (QREFELT $ 13)) (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (SEQ (LETT |v| NIL . #5=(|GDMP;mainVariable;$U;6|))
                        (LETT #4# (QREFELT $ 6) . #5#) G190
                        (COND
                         ((OR (ATOM #4#)
                              (PROGN (LETT |v| (CAR #4#) . #5#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |vv|
                               (PROG2
                                   (LETT #3# (SPADCALL |v| (QREFELT $ 34))
                                         . #5#)
                                   (QCDR #3#)
                                 (|check_union2| (QEQCAR #3# 0)
                                                 (|OrderedVariableList|
                                                  (QREFELT $ 6))
                                                 (|Union|
                                                  (|OrderedVariableList|
                                                   (QREFELT $ 6))
                                                  #1#)
                                                 #3#))
                               . #5#)
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |p| |vv| (QREFELT $ 35)) 0
                                      (QREFELT $ 36))
                            (PROGN
                             (LETT #2# (CONS 0 |vv|) . #5#)
                             (GO #6=#:G764))))))
                        (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                   (EXIT (CONS 1 "failed"))))))
          #6# (EXIT #2#)))) 

(SDEFUN |GDMP;ground?;$B;7| ((|p| $) ($ |Boolean|))
        (QEQCAR (SPADCALL |p| (QREFELT $ 38)) 1)) 

(SDEFUN |GDMP;retract;$R;8| ((|p| $) ($ R))
        (COND ((NULL (SPADCALL |p| (QREFELT $ 39))) (|error| "not a constant"))
              ('T (SPADCALL |p| (QREFELT $ 40))))) 

(SDEFUN |GDMP;retractIfCan;$U;9| ((|p| $) ($ |Union| R "failed"))
        (COND
         ((SPADCALL |p| (QREFELT $ 39)) (CONS 0 (SPADCALL |p| (QREFELT $ 40))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |GDMP;degree;$OvlNni;10|
        ((|p| $) (|v| |OrderedVariableList| |vl|) ($ |NonNegativeInteger|))
        (SPROG
         ((|res| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
          (|t| (|Term|)) (|locv| (|PositiveInteger|)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 13)) 0)
                ('T
                 (SEQ (LETT |res| 0 . #1=(|GDMP;degree;$OvlNni;10|))
                      (LETT |locv| (SPADCALL |v| (QREFELT $ 24)) . #1#)
                      (SEQ G190 (COND ((NULL (NULL (NULL |p|))) (GO G191)))
                           (SEQ (LETT |t| (|SPADfirst| |p|) . #1#)
                                (LETT |j|
                                      (SPADCALL (QCAR |t|) |locv|
                                                (QREFELT $ 45))
                                      . #1#)
                                (COND
                                 ((SPADCALL |j| |res| (QREFELT $ 36))
                                  (LETT |res| |j| . #1#)))
                                (EXIT (LETT |p| (CDR |p|) . #1#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |res|))))))) 

(SDEFUN |GDMP;minimumDegree;$OvlNni;11|
        ((|p| $) (|v| |OrderedVariableList| |vl|) ($ |NonNegativeInteger|))
        (SPADCALL (SPADCALL |p| |v| (QREFELT $ 47)) (QREFELT $ 49))) 

(SDEFUN |GDMP;differentiate;$Ovl$;12|
        ((|p| $) (|v| |OrderedVariableList| |vl|) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |p| |v| (QREFELT $ 47)) (QREFELT $ 51))
                  |v| (QREFELT $ 52))) 

(SDEFUN |GDMP;degree;$LL;13|
        ((|p| $) (|lv| |List| (|OrderedVariableList| |vl|))
         ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G794 NIL) (|v| NIL) (#2=#:G793 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|GDMP;degree;$LL;13|))
                 (SEQ (LETT |v| NIL . #3#) (LETT #1# |lv| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |p| |v| (QREFELT $ 35)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GDMP;minimumDegree;$LL;14|
        ((|p| $) (|lv| |List| (|OrderedVariableList| |vl|))
         ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G798 NIL) (|v| NIL) (#2=#:G797 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|GDMP;minimumDegree;$LL;14|))
                 (SEQ (LETT |v| NIL . #3#) (LETT #1# |lv| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |p| |v| (QREFELT $ 50)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GDMP;numberOfMonomials;$Nni;15| ((|p| $) ($ |NonNegativeInteger|))
        (SPROG ((|l| (|Rep|)))
               (SEQ (LETT |l| |p| |GDMP;numberOfMonomials;$Nni;15|)
                    (EXIT (COND ((NULL |l|) 1) ('T (LENGTH |l|))))))) 

(SDEFUN |GDMP;monomial?;$B;16| ((|p| $) ($ |Boolean|))
        (SPROG ((|l| (|Rep|)))
               (SEQ (LETT |l| |p| |GDMP;monomial?;$B;16|)
                    (EXIT (COND ((NULL |l|) 'T) ('T (NULL (CDR |l|)))))))) 

(SDEFUN |GDMP;maxNorm| ((|p| $) ($ R))
        (SPROG ((|m| (R)) (#1=#:G807 NIL) (|r| NIL) (|l| (|List| R)))
               (SEQ (LETT |l| NIL . #2=(|GDMP;maxNorm|))
                    (LETT |m| (|spadConstant| $ 60) . #2#)
                    (SEQ (LETT |r| NIL . #2#)
                         (LETT #1# (|GDMP;listCoef| |p| $) . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |r| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |r| |m| (QREFELT $ 61))
                             (LETT |m| |r| . #2#))
                            ((SPADCALL (SPADCALL |r| (QREFELT $ 62)) |m|
                                       (QREFELT $ 61))
                             (LETT |m| (SPADCALL |r| (QREFELT $ 62)) . #2#)))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |m|)))) 

(SDEFUN |GDMP;/;$R$;18| ((|p| $) (|r| R) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 63)) |p| (QREFELT $ 64))) 

(SDEFUN |GDMP;variables;$L;19|
        ((|p| $) ($ |List| (|OrderedVariableList| |vl|)))
        (SPROG
         ((#1=#:G815 NIL) (#2=#:G821 NIL) (|i| NIL) (#3=#:G820 NIL)
          (#4=#:G819 NIL) (|tdeg| (E))
          (|maxdeg| (|Vector| (|NonNegativeInteger|))))
         (SEQ
          (LETT |maxdeg| (SPADCALL (QREFELT $ 11) 0 (QREFELT $ 66))
                . #5=(|GDMP;variables;$L;19|))
          (SEQ G190
               (COND ((NULL (NULL (SPADCALL |p| (QREFELT $ 13)))) (GO G191)))
               (SEQ (LETT |tdeg| (SPADCALL |p| (QREFELT $ 67)) . #5#)
                    (LETT |p| (SPADCALL |p| (QREFELT $ 68)) . #5#)
                    (EXIT
                     (SEQ (LETT |i| 1 . #5#) (LETT #4# (QREFELT $ 11) . #5#)
                          G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |maxdeg| |i|
                                      (MAX
                                       (SPADCALL |maxdeg| |i| (QREFELT $ 69))
                                       (SPADCALL |tdeg| |i| (QREFELT $ 45)))
                                      (QREFELT $ 70))))
                          (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                          (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #3# NIL . #5#)
            (SEQ (LETT |i| 1 . #5#) (LETT #2# (QREFELT $ 11) . #5#) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |maxdeg| |i| (QREFELT $ 69)) 0
                               (QREFELT $ 71))
                     (LETT #3#
                           (CONS
                            (SPADCALL
                             (PROG1 (LETT #1# |i| . #5#)
                               (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                                 '(|NonNegativeInteger|) #1#))
                             (QREFELT $ 72))
                            #3#)
                           . #5#)))))
                 (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |GDMP;reorder;$L$;20| ((|p| $) (|perm| |List| (|Integer|)) ($ $))
        (SPROG
         ((|q| ($)) (#1=#:G831 NIL) (#2=#:G833 NIL) (|j| NIL) (#3=#:G832 NIL)
          (#4=#:G830 NIL) (|term| NIL) (#5=#:G829 NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |perm|) (QREFELT $ 11) (QREFELT $ 71))
            (|error| "must be a complete permutation of all vars"))
           ('T
            (SEQ
             (LETT |q|
                   (PROGN
                    (LETT #5# NIL . #6=(|GDMP;reorder;$L$;20|))
                    (SEQ (LETT |term| NIL . #6#) (LETT #4# |p| . #6#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |term| (CAR #4#) . #6#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #5#
                                 (CONS
                                  (CONS
                                   (SPADCALL
                                    (PROGN
                                     (LETT #3# (GETREFV (SIZE |perm|)) . #6#)
                                     (SEQ (LETT |j| NIL . #6#)
                                          (LETT #2# |perm| . #6#)
                                          (LETT #1# 0 . #6#) G190
                                          (COND
                                           ((OR (ATOM #2#)
                                                (PROGN
                                                 (LETT |j| (CAR #2#) . #6#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SETELT #3# #1#
                                                    (SPADCALL (QCAR |term|) |j|
                                                              (QREFELT $
                                                                       45)))))
                                          (LETT #1#
                                                (PROG1 (|inc_SI| #1#)
                                                  (LETT #2# (CDR #2#) . #6#))
                                                . #6#)
                                          (GO G190) G191 (EXIT NIL))
                                     #3#)
                                    (QREFELT $ 27))
                                   (QCDR |term|))
                                  #5#)
                                 . #6#)))
                         (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                         (EXIT (NREVERSE #5#))))
                   . #6#)
             (EXIT
              (SPADCALL (CONS #'|GDMP;reorder;$L$;20!0| $) |q|
                        (QREFELT $ 76))))))))) 

(SDEFUN |GDMP;reorder;$L$;20!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (QCAR |z1|) (QCAR |z2|) (QREFELT $ 74))) 

(SDEFUN |GDMP;univariate;$OvlSup;21|
        ((|p| $) (|v| |OrderedVariableList| |vl|)
         ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|nexp| (E)) (|deg| (|NonNegativeInteger|)) (#1=#:G840 NIL)
          (#2=#:G842 NIL) (|i| NIL) (#3=#:G841 NIL)
          (|locv| (|PositiveInteger|)) (|exp| (E)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 13)) (|spadConstant| $ 79))
                ('T
                 (SEQ
                  (LETT |exp| (SPADCALL |p| (QREFELT $ 67))
                        . #4=(|GDMP;univariate;$OvlSup;21|))
                  (LETT |locv| (SPADCALL |v| (QREFELT $ 24)) . #4#)
                  (LETT |deg| 0 . #4#)
                  (LETT |nexp|
                        (SPADCALL
                         (PROGN
                          (LETT #3# (GETREFV #5=(QREFELT $ 11)) . #4#)
                          (SEQ (LETT |i| 1 . #4#) (LETT #2# #5# . #4#)
                               (LETT #1# 0 . #4#) G190
                               (COND ((|greater_SI| |i| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SETELT #3# #1#
                                         (COND
                                          ((EQL |i| |locv|)
                                           (SEQ
                                            (LETT |deg|
                                                  (SPADCALL |exp| |i|
                                                            (QREFELT $ 45))
                                                  . #4#)
                                            (EXIT 0)))
                                          ('T
                                           (SPADCALL |exp| |i|
                                                     (QREFELT $ 45)))))))
                               (LETT #1#
                                     (PROG1 (|inc_SI| #1#)
                                       (LETT |i| (|inc_SI| |i|) . #4#))
                                     . #4#)
                               (GO G190) G191 (EXIT NIL))
                          #3#)
                         (QREFELT $ 27))
                        . #4#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |p| (QREFELT $ 40)) |nexp|
                               (QREFELT $ 28))
                     |deg| (QREFELT $ 80))
                    (SPADCALL (SPADCALL |p| (QREFELT $ 68)) |v| (QREFELT $ 47))
                    (QREFELT $ 81))))))))) 

(SDEFUN |GDMP;eval;$Ovl2$;22|
        ((|p| $) (|v| |OrderedVariableList| |vl|) (|val| $) ($ $))
        (SPADCALL (SPADCALL |p| |v| (QREFELT $ 47)) |val| (QREFELT $ 82))) 

(SDEFUN |GDMP;eval;$OvlR$;23|
        ((|p| $) (|v| |OrderedVariableList| |vl|) (|val| R) ($ $))
        (SPADCALL |p| |v| (SPADCALL |val| (QREFELT $ 84)) (QREFELT $ 83))) 

(SDEFUN |GDMP;eval;$LL$;24|
        ((|p| $) (|lv| |List| (|OrderedVariableList| |vl|)) (|lval| |List| R)
         ($ $))
        (COND ((SPADCALL |lv| NIL (QREFELT $ 86)) |p|)
              ('T
               (SPADCALL
                (SPADCALL |p| (|SPADfirst| |lv|)
                          (SPADCALL (|SPADfirst| |lval|) (QREFELT $ 84))
                          (QREFELT $ 83))
                (CDR |lv|) (CDR |lval|) (QREFELT $ 88))))) 

(SDEFUN |GDMP;evalSortedVarlist|
        ((|p| $) (|Lvar| |List| (|OrderedVariableList| |vl|))
         (|Lpval| |List| $) ($ $))
        (SPROG
         ((|pts| (|SparseUnivariatePolynomial| $)) (|pval| ($))
          (|mvar| (|OrderedVariableList| |vl|))
          (|pv| (|OrderedVariableList| |vl|))
          (|v| (|Union| (|OrderedVariableList| |vl|) "failed")))
         (SEQ
          (LETT |v| (SPADCALL |p| (QREFELT $ 38))
                . #1=(|GDMP;evalSortedVarlist|))
          (EXIT
           (COND ((QEQCAR |v| 1) |p|)
                 (#2='T
                  (SEQ (LETT |pv| (QCDR |v|) . #1#)
                       (COND
                        ((OR (SPADCALL |Lvar| NIL (QREFELT $ 86))
                             (SPADCALL |Lpval| NIL (QREFELT $ 90)))
                         (EXIT |p|)))
                       (LETT |mvar| (|SPADfirst| |Lvar|) . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |mvar| |pv| (QREFELT $ 91))
                          (|GDMP;evalSortedVarlist| |p| (CDR |Lvar|)
                           (SPADCALL |Lpval| '|rest| (QREFELT $ 93)) $))
                         (#2#
                          (SEQ
                           (LETT |pval|
                                 (SPADCALL |Lpval| '|first| (QREFELT $ 95))
                                 . #1#)
                           (LETT |pts|
                                 (SPADCALL
                                  (CONS #'|GDMP;evalSortedVarlist!0|
                                        (VECTOR $ |Lpval| |Lvar|))
                                  (SPADCALL |p| |pv| (QREFELT $ 47))
                                  (QREFELT $ 97))
                                 . #1#)
                           (EXIT
                            (COND
                             ((SPADCALL |mvar| |pv| (QREFELT $ 98))
                              (SPADCALL |pts| |pval| (QREFELT $ 82)))
                             (#2#
                              (SPADCALL |pts| |pv| (QREFELT $ 52)))))))))))))))) 

(SDEFUN |GDMP;evalSortedVarlist!0| ((|x| NIL) ($$ NIL))
        (PROG (|Lvar| |Lpval| $)
          (LETT |Lvar| (QREFELT $$ 2) . #1=(|GDMP;evalSortedVarlist|))
          (LETT |Lpval| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GDMP;evalSortedVarlist| |x| |Lvar| |Lpval| $))))) 

(SDEFUN |GDMP;eval;$LL$;26|
        ((|p| $) (|Lvar| |List| (|OrderedVariableList| |vl|))
         (|Lpval| |List| $) ($ $))
        (SPROG
         ((|nlpval| (|List| $)) (#1=#:G872 NIL) (|mvar| NIL) (#2=#:G871 NIL)
          (|nlvar| (|List| (|OrderedVariableList| |vl|))))
         (SEQ
          (LETT |nlvar| (SPADCALL (ELT $ 91) |Lvar| (QREFELT $ 100))
                . #3=(|GDMP;eval;$LL$;26|))
          (LETT |nlpval|
                (COND ((SPADCALL |Lvar| |nlvar| (QREFELT $ 86)) |Lpval|)
                      ('T
                       (LETT |nlpval|
                             (PROGN
                              (LETT #2# NIL . #3#)
                              (SEQ (LETT |mvar| NIL . #3#)
                                   (LETT #1# |nlvar| . #3#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |mvar| (CAR #1#) . #3#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (SPADCALL |Lpval|
                                                      (SPADCALL |mvar| |Lvar|
                                                                (QREFELT $
                                                                         101))
                                                      (QREFELT $ 102))
                                            #2#)
                                           . #3#)))
                                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             . #3#)))
                . #3#)
          (EXIT (|GDMP;evalSortedVarlist| |p| |nlvar| |nlpval| $))))) 

(SDEFUN |GDMP;multivariate;SupOvl$;27|
        ((|p1| |SparseUnivariatePolynomial| $) (|v| |OrderedVariableList| |vl|)
         ($ $))
        (COND
         ((SPADCALL (|spadConstant| $ 79) |p1| (QREFELT $ 106))
          (|spadConstant| $ 16))
         ((EQL (SPADCALL |p1| (QREFELT $ 107)) 0)
          (SPADCALL |p1| (QREFELT $ 108)))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |p1| (QREFELT $ 108))
                     (SPADCALL (SPADCALL |v| (QREFELT $ 31))
                               (SPADCALL |p1| (QREFELT $ 107)) (QREFELT $ 109))
                     (QREFELT $ 29))
           (SPADCALL (SPADCALL |p1| (QREFELT $ 110)) |v| (QREFELT $ 52))
           (QREFELT $ 111))))) 

(SDEFUN |GDMP;univariate;$Sup;28| ((|p| $) ($ |SparseUnivariatePolynomial| R))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| $))
          (|ans| (|SparseUnivariatePolynomial| R))
          (|v| (|Union| (|OrderedVariableList| |vl|) "failed")))
         (SEQ
          (LETT |v| (SPADCALL |p| (QREFELT $ 38))
                . #1=(|GDMP;univariate;$Sup;28|))
          (EXIT
           (COND
            ((QEQCAR |v| 1)
             (SPADCALL (SPADCALL |p| (QREFELT $ 40)) 0 (QREFELT $ 113)))
            ('T
             (SEQ (LETT |q| (SPADCALL |p| (QCDR |v|) (QREFELT $ 47)) . #1#)
                  (LETT |ans| (|spadConstant| $ 114) . #1#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |q| (|spadConstant| $ 79) (QREFELT $ 115)))
                         (GO G191)))
                       (SEQ
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |q| (QREFELT $ 108))
                                          (QREFELT $ 116))
                                         (SPADCALL |q| (QREFELT $ 107))
                                         (QREFELT $ 113))
                                        (QREFELT $ 117))
                              . #1#)
                        (EXIT (LETT |q| (SPADCALL |q| (QREFELT $ 110)) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |ans|)))))))) 

(SDEFUN |GDMP;multivariate;SupOvl$;29|
        ((|p| |SparseUnivariatePolynomial| R) (|v| |OrderedVariableList| |vl|)
         ($ $))
        (COND
         ((SPADCALL (|spadConstant| $ 114) |p| (QREFELT $ 119))
          (|spadConstant| $ 16))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |p| (QREFELT $ 120))
                     (SPADCALL (|spadConstant| $ 25) |v|
                               (SPADCALL |p| (QREFELT $ 121)) (QREFELT $ 30))
                     (QREFELT $ 64))
           (SPADCALL (SPADCALL |p| (QREFELT $ 122)) |v| (QREFELT $ 123))
           (QREFELT $ 111))))) 

(SDEFUN |GDMP;content;$R;30| ((|p| $) ($ R))
        (SPROG
         ((#1=#:G887 NIL) (#2=#:G886 (R)) (#3=#:G888 (R)) (#4=#:G891 NIL)
          (|t| NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 13)) (|spadConstant| $ 60))
                (#5='T
                 (PROGN
                  (LETT #1# NIL . #6=(|GDMP;content;$R;30|))
                  (SEQ (LETT |t| NIL . #6#) (LETT #4# |p| . #6#) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3# (QCDR |t|) . #6#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #3# (QREFELT $ 124))
                                  . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #6#)
                             (LETT #1# 'T . #6#)))))))
                       (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#5# (|spadConstant| $ 60))))))))) 

(SDEFUN |GDMP;gcd;3$;31| ((|p| $) (|q| $) ($ $))
        (SPROG
         ((|r| (R)) (|qv| #1=(|Union| (|OrderedVariableList| |vl|) "failed"))
          (|pv| #1#))
         (SEQ (LETT |pv| (SPADCALL |p| (QREFELT $ 38)) . #2=(|GDMP;gcd;3$;31|))
              (EXIT
               (COND
                ((QEQCAR |pv| 1)
                 (COND
                  ((SPADCALL (LETT |r| (SPADCALL |p| (QREFELT $ 40)) . #2#)
                             (|spadConstant| $ 60) (QREFELT $ 126))
                   |q|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL |r| (SPADCALL |q| (QREFELT $ 125))
                              (QREFELT $ 124))
                    (QREFELT $ 84)))))
                (#3#
                 (SEQ (LETT |qv| (SPADCALL |q| (QREFELT $ 38)) . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |qv| 1)
                         (COND
                          ((SPADCALL
                            (LETT |r| (SPADCALL |q| (QREFELT $ 40)) . #2#)
                            (|spadConstant| $ 60) (QREFELT $ 126))
                           |p|)
                          (#3#
                           (SPADCALL
                            (SPADCALL |r| (SPADCALL |p| (QREFELT $ 125))
                                      (QREFELT $ 124))
                            (QREFELT $ 84)))))
                        ((SPADCALL (QCDR |pv|) (QCDR |qv|) (QREFELT $ 127))
                         (SPADCALL |p|
                                   (SPADCALL
                                    (SPADCALL |q| (QCDR |qv|) (QREFELT $ 47))
                                    (QREFELT $ 128))
                                   (QREFELT $ 129)))
                        ((SPADCALL (QCDR |qv|) (QCDR |pv|) (QREFELT $ 127))
                         (SPADCALL |q|
                                   (SPADCALL
                                    (SPADCALL |p| (QCDR |pv|) (QREFELT $ 47))
                                    (QREFELT $ 128))
                                   (QREFELT $ 129)))
                        (#3#
                         (SPADCALL
                          (SPADCALL (SPADCALL |p| (QCDR |pv|) (QREFELT $ 47))
                                    (SPADCALL |q| (QCDR |qv|) (QREFELT $ 47))
                                    (QREFELT $ 130))
                          (QCDR |pv|) (QREFELT $ 52)))))))))))) 

(SDEFUN |GDMP;gcd;3$;32| ((|p| $) (|q| $) ($ $))
        (SPADCALL |p| |q| (QREFELT $ 132))) 

(SDEFUN |GDMP;gcd;3$;33| ((|p| $) (|q| $) ($ $))
        (SPROG
         ((|r| (R)) (|qv| #1=(|Union| (|OrderedVariableList| |vl|) "failed"))
          (|pv| #1#))
         (SEQ (LETT |pv| (SPADCALL |p| (QREFELT $ 38)) . #2=(|GDMP;gcd;3$;33|))
              (EXIT
               (COND
                ((QEQCAR |pv| 1)
                 (COND
                  ((SPADCALL (LETT |r| (SPADCALL |p| (QREFELT $ 40)) . #2#)
                             (|spadConstant| $ 60) (QREFELT $ 126))
                   |q|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL |r| (SPADCALL |q| (QREFELT $ 125))
                              (QREFELT $ 124))
                    (QREFELT $ 84)))))
                (#3#
                 (SEQ (LETT |qv| (SPADCALL |q| (QREFELT $ 38)) . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |qv| 1)
                         (COND
                          ((SPADCALL
                            (LETT |r| (SPADCALL |q| (QREFELT $ 40)) . #2#)
                            (|spadConstant| $ 60) (QREFELT $ 126))
                           |p|)
                          (#3#
                           (SPADCALL
                            (SPADCALL |r| (SPADCALL |p| (QREFELT $ 125))
                                      (QREFELT $ 124))
                            (QREFELT $ 84)))))
                        ((SPADCALL (QCDR |pv|) (QCDR |qv|) (QREFELT $ 127))
                         (SPADCALL |p|
                                   (SPADCALL
                                    (SPADCALL |q| (QCDR |qv|) (QREFELT $ 47))
                                    (QREFELT $ 128))
                                   (QREFELT $ 129)))
                        ((SPADCALL (QCDR |qv|) (QCDR |pv|) (QREFELT $ 127))
                         (SPADCALL |q|
                                   (SPADCALL
                                    (SPADCALL |p| (QCDR |pv|) (QREFELT $ 47))
                                    (QREFELT $ 128))
                                   (QREFELT $ 129)))
                        (#3#
                         (SPADCALL
                          (SPADCALL (SPADCALL |p| (QCDR |pv|) (QREFELT $ 47))
                                    (SPADCALL |q| (QCDR |qv|) (QREFELT $ 47))
                                    (QREFELT $ 130))
                          (QCDR |pv|) (QREFELT $ 52)))))))))))) 

(SDEFUN |GDMP;coerce;$Of;34| ((|p| $) ($ |OutputForm|))
        (SPROG
         ((|lt| (|List| #1=(|OutputForm|))) (|l| (|List| #1#)) (#2=#:G933 NIL)
          (|i| NIL) (#3=#:G932 NIL) (|t| NIL) (|vl1| (|List| (|OutputForm|)))
          (#4=#:G931 NIL) (|v| NIL) (#5=#:G930 NIL))
         (SEQ
          (COND
           ((SPADCALL |p| (QREFELT $ 13))
            (SPADCALL (|spadConstant| $ 60) (QREFELT $ 134)))
           (#6='T
            (SEQ (LETT |lt| NIL . #7=(|GDMP;coerce;$Of;34|))
                 (LETT |vl1|
                       (PROGN
                        (LETT #5# NIL . #7#)
                        (SEQ (LETT |v| NIL . #7#)
                             (LETT #4# (QREFELT $ 6) . #7#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |v| (CAR #4#) . #7#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS (SPADCALL |v| (QREFELT $ 135)) #5#)
                                     . #7#)))
                             (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                             (EXIT (NREVERSE #5#))))
                       . #7#)
                 (SEQ (LETT |t| NIL . #7#) (LETT #3# (REVERSE |p|) . #7#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#) . #7#) NIL))
                        (GO G191)))
                      (SEQ (LETT |l| NIL . #7#)
                           (SEQ (LETT |i| 1 . #7#)
                                (LETT #2# (LENGTH |vl1|) . #7#) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((EQL
                                     (SPADCALL (QCAR |t|) |i| (QREFELT $ 45))
                                     0)
                                    "next")
                                   ((EQL
                                     (SPADCALL (QCAR |t|) |i| (QREFELT $ 45))
                                     1)
                                    (LETT |l|
                                          (CONS
                                           (SPADCALL |vl1| |i| (QREFELT $ 137))
                                           |l|)
                                          . #7#))
                                   ('T
                                    (LETT |l|
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |vl1| |i|
                                                      (QREFELT $ 137))
                                            (SPADCALL
                                             (SPADCALL (QCAR |t|) |i|
                                                       (QREFELT $ 45))
                                             (QREFELT $ 138))
                                            (QREFELT $ 139))
                                           |l|)
                                          . #7#)))))
                                (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                                (EXIT NIL))
                           (LETT |l| (REVERSE |l|) . #7#)
                           (COND
                            ((OR
                              (SPADCALL (QCDR |t|) (|spadConstant| $ 26)
                                        (QREFELT $ 140))
                              (NULL |l|))
                             (LETT |l|
                                   (CONS (SPADCALL (QCDR |t|) (QREFELT $ 134))
                                         |l|)
                                   . #7#)))
                           (EXIT
                            (COND
                             ((EQL 1 (LENGTH |l|))
                              (LETT |lt| (CONS (|SPADfirst| |l|) |lt|) . #7#))
                             ('T
                              (LETT |lt|
                                    (CONS
                                     (SPADCALL (ELT $ 142) |l| (QREFELT $ 144))
                                     |lt|)
                                    . #7#)))))
                      (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND ((EQL 1 (LENGTH |lt|)) (|SPADfirst| |lt|))
                        (#6#
                         (SPADCALL (ELT $ 145) |lt| (QREFELT $ 144))))))))))) 

(DECLAIM (NOTINLINE |GeneralDistributedMultivariatePolynomial;|)) 

(DEFUN |GeneralDistributedMultivariatePolynomial| (&REST #1=#:G981)
  (SPROG NIL
         (PROG (#2=#:G982)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GeneralDistributedMultivariatePolynomial|)
                                               '|domainEqualList|)
                    . #3=(|GeneralDistributedMultivariatePolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |GeneralDistributedMultivariatePolynomial;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GeneralDistributedMultivariatePolynomial|)))))))))) 

(DEFUN |GeneralDistributedMultivariatePolynomial;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G980 NIL) (|pv$| NIL) (#2=#:G972 NIL) (#3=#:G973 NIL) (#4=#:G974 NIL)
    (#5=#:G975 NIL) (#6=#:G976 NIL) (#7=#:G977 NIL) (#8=#:G978 NIL)
    (#9=#:G979 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|)
          . #10=(|GeneralDistributedMultivariatePolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #10#)
    (LETT DV$3 (|devaluate| |#3|) . #10#)
    (LETT |dv$|
          (LIST '|GeneralDistributedMultivariatePolynomial| DV$1 DV$2 DV$3)
          . #10#)
    (LETT $ (GETREFV 179) . #10#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#2| '(|Comparable|))
                                        (|HasCategory| |#2|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (|HasCategory| |#2| '(|EntireRing|))
                                        (LETT #9#
                                              (|HasCategory| |#2|
                                                             '(|GcdDomain|))
                                              . #10#)
                                        (OR #9#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         #9#)
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|OrderedVariableList| |#1|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (|HasCategory| |#2| '(|Field|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #8#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|))
                                              . #10#)
                                        (OR #8# #9#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (LETT #7#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|))
                                              . #10#)
                                        (OR #8# #9# #7#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #9# #7#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #8# #9# #7#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         #8#
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         #9# #7#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|PatternMatchable|
                                                  (|Float|))))
                                              . #10#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #9#
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|PatternMatchable|
                                                  (|Integer|))))
                                              . #10#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #9#
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         #5#)
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|)))))
                                              . #10#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #9#
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #4#)
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|)))))
                                              . #10#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #9#
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #3#)
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|))
                                              . #10#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #2#)))
                    . #10#))
    (|haddProp| |$ConstructorCache| '|GeneralDistributedMultivariatePolynomial|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 549755813888))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #10#)
     (|augmentPredVector| $ 1099511627776))
    (AND (OR (|HasCategory| |#2| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 2199023255552))
    (AND
     (OR (|HasCategory| |#2| '(|EntireRing|))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 4398046511104))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #9#
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 8796093022208))
    (AND
     (OR (|HasCategory| |#2| '(|RetractableTo| (|Integer|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| $ 17592186044416))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|SemiRing|)))
     (|augmentPredVector| $ 35184372088832))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| $ 70368744177664))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianMonoid|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 140737488355328))
    (AND
     (OR #2# (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 281474976710656))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 562949953421312))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (|Record| (|:| |k| |#3|) (|:| |c| |#2|)))
    (QSETREFV $ 10 (|List| (QREFELT $ 9)))
    (QSETREFV $ 11 (LENGTH |#1|))
    (COND
     ((|testBitVector| |pv$| 18)
      (QSETREFV $ 65 (CONS (|dispatchFunction| |GDMP;/;$R$;18|) $))))
    (COND
     ((|testBitVector| |pv$| 14)
      (PROGN
       (QSETREFV $ 125 (CONS (|dispatchFunction| |GDMP;content;$R;30|) $))
       (COND
        ((|HasCategory| |#2| '(|EuclideanDomain|))
         (COND
          ((|HasCategory| |#2| '(|FloatingPointSystem|))
           (QSETREFV $ 129 (CONS (|dispatchFunction| |GDMP;gcd;3$;31|) $)))
          ('T
           (QSETREFV $ 129 (CONS (|dispatchFunction| |GDMP;gcd;3$;32|) $)))))
        ('T
         (QSETREFV $ 129 (CONS (|dispatchFunction| |GDMP;gcd;3$;33|) $)))))))
    $))) 

(MAKEPROP '|GeneralDistributedMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 7 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Term| '|Rep| '|n| (|Boolean|)
              |GDMP;zero?;$B;1| (|Vector| 17) (0 . |coerce|) (5 . |Zero|)
              (|NonNegativeInteger|) (9 . +) (|Mapping| 17 17 17)
              (15 . |reduce|) |GDMP;totalDegree;$Nni;2| (|PositiveInteger|)
              (|OrderedVariableList| (NRTEVAL (QREFELT $ 6))) (22 . |lookup|)
              (27 . |One|) (31 . |One|) (35 . |directProduct|)
              (40 . |monomial|) (46 . *) |GDMP;monomial;$OvlNni$;3|
              |GDMP;coerce;Ovl$;4| (|Union| $ '"failed") (|Symbol|)
              (52 . |variable|) |GDMP;degree;$OvlNni;10| (57 . >)
              (|Union| 23 '"failed") |GDMP;mainVariable;$U;6|
              |GDMP;ground?;$B;7| (63 . |leadingCoefficient|)
              |GDMP;retract;$R;8| (|Union| 7 '"failed")
              |GDMP;retractIfCan;$U;9| (|Integer|) (68 . |elt|)
              (|SparseUnivariatePolynomial| $) |GDMP;univariate;$OvlSup;21|
              (|SparseUnivariatePolynomial| $$) (74 . |minimumDegree|)
              |GDMP;minimumDegree;$OvlNni;11| (79 . |differentiate|)
              |GDMP;multivariate;SupOvl$;27| |GDMP;differentiate;$Ovl$;12|
              (|List| 17) (|List| 23) |GDMP;degree;$LL;13|
              |GDMP;minimumDegree;$LL;14| |GDMP;numberOfMonomials;$Nni;15|
              |GDMP;monomial?;$B;16| (84 . |Zero|) (88 . >) (94 . -)
              (99 . |inv|) (104 . *) (110 . /) (116 . |new|) (122 . |degree|)
              (127 . |reductum|) (132 . |elt|) (138 . |setelt!|) (145 . ~=)
              (151 . |index|) |GDMP;variables;$L;19| (156 . >)
              (|Mapping| 12 9 9) (162 . |sort|) (|List| 44)
              |GDMP;reorder;$L$;20| (168 . |Zero|) (172 . |monomial|) (178 . +)
              (184 . |elt|) |GDMP;eval;$Ovl2$;22| (190 . |coerce|)
              |GDMP;eval;$OvlR$;23| (195 . =) (|List| 7) |GDMP;eval;$LL$;24|
              (|List| $$) (201 . =) (207 . >) '"rest" (213 . |elt|) '"first"
              (219 . |elt|) (|Mapping| $$ $$) (225 . |map|) (231 . =)
              (|Mapping| 12 23 23) (237 . |sort|) (243 . |position|)
              (249 . |elt|) (|List| $) |GDMP;eval;$LL$;26| (255 . |Zero|)
              (259 . =) (265 . |degree|) (270 . |leadingCoefficient|) (275 . ^)
              (281 . |reductum|) (286 . +) (|SparseUnivariatePolynomial| 7)
              (292 . |monomial|) (298 . |Zero|) (302 . ~=) (308 . |ground|)
              (313 . +) |GDMP;univariate;$Sup;28| (319 . =)
              (325 . |leadingCoefficient|) (330 . |degree|) (335 . |reductum|)
              |GDMP;multivariate;SupOvl$;29| (340 . |gcd|) (346 . |content|)
              (351 . =) (357 . <) (363 . |content|) (368 . |gcd|) (374 . |gcd|)
              (|PolynomialGcdPackage| 8 23 7 $$) (380 . |gcd|) (|OutputForm|)
              (386 . |coerce|) (391 . |coerce|) (|List| 133) (396 . |elt|)
              (402 . |coerce|) (407 . ^) (413 . ~=) (419 . |One|) (423 . *)
              (|Mapping| 133 133 133) (429 . |reduce|) (435 . +)
              |GDMP;coerce;$Of;34| (|Union| 153 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 44)
              (|Record| (|:| |mat| 154) (|:| |vec| (|Vector| 44))) (|Vector| $)
              (|Matrix| 44) (|PatternMatchResult| (|Float|) $)
              (|PatternMatchResult| 44 $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 44)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Factored| $) (|Factored| 46) (|Union| 163 '#1#) (|List| 46)
              (|Union| 158 '#2="failed") (|Union| 44 '#2#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|Matrix| 7)
              (|Record| (|:| |mat| 167) (|:| |vec| (|Vector| 7)))
              (|Equation| $) (|List| 169)
              (|Record| (|:| |var| 23) (|:| |exponent| 17))
              (|Union| 171 '#3="failed") (|Union| 103 '#3#) (|Mapping| 8 8)
              (|Mapping| 7 7) (|String|) (|SingleInteger|) (|HashState|))
           '#(|zero?| 441 |variables| 446 |univariate| 451 |totalDegree| 462
              |retractIfCan| 467 |retract| 472 |reorder| 477 |reductum| 483
              |numberOfMonomials| 488 |multivariate| 493 |monomial?| 505
              |monomial| 510 |minimumDegree| 523 |mainVariable| 535
              |leadingCoefficient| 540 |ground?| 545 |ground| 550 |gcd| 555
              |eval| 561 |differentiate| 589 |degree| 595 |content| 612
              |coerce| 617 ^ 632 |Zero| 638 |One| 642 / 646 + 652 * 658)
           'NIL
           (CONS
            (|makeByteWordVec2| 39
                                '(0 0 10 0 10 0 15 25 4 24 14 1 2 3 22 4 9 26
                                  16 4 27 12 27 0 1 22 26 0 0 1 4 0 0 0 0 1 1
                                  27 11 39 12 12 0 0 38 12 0 0 8 29 31 0 0 12 0
                                  0 0 0 0 0 4 5 6 7 26 13 33 35 17 12 12))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |FullyLinearlyExplicitOver&| NIL NIL |Algebra&| NIL NIL
                |Algebra&| NIL NIL |Algebra&| |EntireRing&|
                |PartialDifferentialRing&| NIL NIL |Rng&| NIL |Module&|
                |Module&| |Module&| NIL NIL NIL |NonAssociativeRing&| NIL NIL
                NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&| NIL NIL
                NIL |NonAssociativeSemiRng&| NIL |AbelianMonoid&|
                |MagmaWithUnit&| |Magma&| |AbelianSemiGroup&| NIL NIL NIL
                |FullyRetractableTo&| |SetCategory&| |Evalable&| NIL
                |InnerEvalable&| |InnerEvalable&| |RetractableTo&| |BasicType&|
                NIL NIL |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL NIL
                NIL |InnerEvalable&| |RetractableTo&|)
             (CONS
              '#((|PolynomialCategory| 7 8 (|OrderedVariableList| 6))
                 (|MaybeSkewPolynomialCategory| 7 8 (|OrderedVariableList| 6))
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 7 8) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 7 8) (|GcdDomain|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitOver| 7) (|CommutativeRing|)
                 (|LeftOreRing|) (|Algebra| 158) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 7)
                 (|LinearlyExplicitOver| 7) (|LinearlyExplicitOver| 44)
                 (|Algebra| $$) (|EntireRing|)
                 (|PartialDifferentialRing| (|OrderedVariableList| 6)) (|Ring|)
                 (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 158) (|Module| 7)
                 (|Module| $$) (|BiModule| 7 7) (|BiModule| $$ $$)
                 (|BiModule| 158 158) (|NonAssociativeRing|) (|LeftModule| 7)
                 (|RightModule| 7) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 158) (|RightModule| 158) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 44) (|FullyRetractableTo| 7)
                 (|SetCategory|) (|Evalable| $$)
                 (|VariablesCommuteWithCoefficients|)
                 (|InnerEvalable| (|OrderedVariableList| 6) $$)
                 (|InnerEvalable| (|OrderedVariableList| 6) 7)
                 (|RetractableTo| 7) (|BasicType|) (|CoercibleTo| 133)
                 (|unitsKnown|) (|RetractableTo| 158) (|RetractableTo| 44)
                 (|canonicalUnitNormal|) (|CommutativeStar|) (|noZeroDivisors|)
                 (|ConvertibleTo| 150) (|ConvertibleTo| 151)
                 (|ConvertibleTo| 149) (|InnerEvalable| $$ $$)
                 (|RetractableTo| (|OrderedVariableList| 6)))
              (|makeByteWordVec2| 146
                                  '(1 8 14 0 15 0 0 0 16 2 17 0 0 0 18 3 14 17
                                    19 0 17 20 1 23 22 0 24 0 0 0 25 0 7 0 26 1
                                    8 0 14 27 2 0 0 7 8 28 2 0 0 0 0 29 1 23 32
                                    33 34 2 17 12 0 0 36 1 0 7 0 40 2 8 17 0 44
                                    45 1 48 17 0 49 1 48 0 0 51 0 7 0 60 2 7 12
                                    0 0 61 1 7 0 0 62 1 7 0 0 63 2 0 0 7 0 64 2
                                    0 0 0 7 65 2 14 0 17 17 66 1 0 8 0 67 1 0 0
                                    0 68 2 14 17 0 44 69 3 14 17 0 44 17 70 2
                                    17 12 0 0 71 1 23 0 22 72 2 8 12 0 0 74 2
                                    10 0 75 0 76 0 48 0 79 2 48 0 2 17 80 2 48
                                    0 0 0 81 2 48 2 0 2 82 1 0 0 7 84 2 55 12 0
                                    0 86 2 89 12 0 0 90 2 23 12 0 0 91 2 89 0 0
                                    92 93 2 89 2 0 94 95 2 48 0 96 0 97 2 23 12
                                    0 0 98 2 55 0 99 0 100 2 55 44 23 0 101 2
                                    89 2 0 44 102 0 8 0 105 2 48 12 0 0 106 1
                                    48 17 0 107 1 48 2 0 108 2 0 0 0 17 109 1
                                    48 0 0 110 2 0 0 0 0 111 2 112 0 7 17 113 0
                                    112 0 114 2 48 12 0 0 115 1 0 7 0 116 2 112
                                    0 0 0 117 2 112 12 0 0 119 1 112 7 0 120 1
                                    112 17 0 121 1 112 0 0 122 2 7 0 0 0 124 1
                                    0 7 0 125 2 7 12 0 0 126 2 23 12 0 0 127 1
                                    48 2 0 128 2 0 0 0 0 129 2 48 0 0 0 130 2
                                    131 2 2 2 132 1 7 133 0 134 1 33 133 0 135
                                    2 136 133 0 44 137 1 17 133 0 138 2 133 0 0
                                    0 139 2 7 12 0 0 140 0 8 0 141 2 133 0 0 0
                                    142 2 136 133 143 0 144 2 133 0 0 0 145 1
                                    48 12 0 13 1 0 55 0 73 2 0 46 0 23 47 1 0
                                    112 0 118 1 0 17 0 21 1 0 42 0 43 1 0 7 0
                                    41 2 0 0 0 77 78 1 0 0 0 68 1 0 17 0 58 2 0
                                    0 46 23 52 2 0 0 112 23 123 1 0 12 0 59 3 0
                                    0 0 23 17 30 2 0 0 7 8 28 2 0 17 0 23 50 2
                                    0 54 0 55 57 1 0 37 0 38 1 0 7 0 40 1 0 12
                                    0 39 1 0 7 0 116 2 14 0 0 0 129 3 0 0 0 55
                                    103 104 3 0 0 0 55 87 88 3 0 0 0 23 0 83 3
                                    0 0 0 23 7 85 2 4 0 0 23 53 2 0 54 0 55 56
                                    2 0 17 0 23 35 1 0 8 0 67 1 14 7 0 125 1 12
                                    0 23 31 1 0 0 7 84 1 0 133 0 146 2 46 0 0
                                    17 109 0 48 0 16 0 46 0 25 2 18 0 0 7 65 2
                                    0 0 0 0 111 2 0 0 7 0 64 2 0 0 0 0 29)))))
           '|lookupIncomplete|)) 
