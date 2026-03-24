
(PUT '|GDMP;zero?;%B;1| '|SPADreplace| 'NULL) 

(SDEFUN |GDMP;zero?;%B;1| ((|p| (%)) (% (|Boolean|))) (NULL |p|)) 

(SDEFUN |GDMP;totalDegree;%Nni;2| ((|p| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G28 NIL) (#2=#:G27 #3=(|NonNegativeInteger|)) (#4=#:G29 #3#)
          (#5=#:G34 NIL) (|t| NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT % 13)) 0)
                (#6='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |t| NIL) (LETT #5# |p|) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SPADCALL (ELT % 18)
                                          (SPADCALL (QCAR |t|) (QREFELT % 15))
                                          0 (QREFELT % 20)))
                          (COND (#1# (LETT #2# (MAX #2# #4#)))
                                ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# (|IdentityError| '|max|))))))))) 

(SDEFUN |GDMP;monomial;%OvlNni%;3|
        ((|p| (%)) (|v| (|OrderedVariableList| |vl|))
         (|e| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((#1=#:G40 NIL) (#2=#:G42 NIL) (|z| NIL) (#3=#:G41 NIL)
          (|locv| (|PositiveInteger|)))
         (SEQ (LETT |locv| (SPADCALL |v| (QREFELT % 24)))
              (EXIT
               (SPADCALL |p|
                         (SPADCALL (|spadConstant| % 26)
                                   (SPADCALL
                                    (PROGN
                                     (LETT #3# (GETREFV #4=(QREFELT % 11)))
                                     (SEQ (LETT |z| 1) (LETT #2# #4#)
                                          (LETT #1# 0) G190
                                          (COND
                                           ((|greater_SI| |z| #2#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SETELT #3# #1#
                                                    (COND
                                                     ((EQL |z| |locv|) |e|)
                                                     ('T 0)))))
                                          (LETT #1#
                                                (PROG1 (|inc_SI| #1#)
                                                  (LETT |z| (|inc_SI| |z|))))
                                          (GO G190) G191 (EXIT NIL))
                                     #3#)
                                    (QREFELT % 27))
                                   (QREFELT % 28))
                         (QREFELT % 29)))))) 

(SDEFUN |GDMP;coerce;Ovl%;4| ((|v| (|OrderedVariableList| |vl|)) (% (%)))
        (SPADCALL (|spadConstant| % 25) |v| 1 (QREFELT % 30))) 

(SDEFUN |GDMP;listCoef| ((|p| (%)) (% (|List| R)))
        (SPROG ((#1=#:G49 NIL) (|rec| NIL) (#2=#:G48 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |rec| NIL) (LETT #1# |p|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCDR |rec|) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GDMP;mainVariable;%U;6|
        ((|p| (%)) (% (|Union| (|OrderedVariableList| |vl|) #1="failed")))
        (SPROG
         ((#2=#:G62 NIL) (|vv| (|OrderedVariableList| |vl|)) (#3=#:G51 NIL)
          (#4=#:G63 NIL) (|v| NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |p| (QREFELT % 13)) (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (SEQ (LETT |v| NIL) (LETT #4# (QREFELT % 6)) G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |v| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |vv|
                               (PROG2 (LETT #3# (SPADCALL |v| (QREFELT % 34)))
                                   (QCDR #3#)
                                 (|check_union2| (QEQCAR #3# 0)
                                                 (|OrderedVariableList|
                                                  (QREFELT % 6))
                                                 (|Union|
                                                  (|OrderedVariableList|
                                                   (QREFELT % 6))
                                                  #1#)
                                                 #3#)))
                         (EXIT
                          (COND
                           ((> (SPADCALL |p| |vv| (QREFELT % 35)) 0)
                            (PROGN (LETT #2# (CONS 0 |vv|)) (GO #5=#:G61))))))
                        (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (CONS 1 "failed"))))))
          #5# (EXIT #2#)))) 

(SDEFUN |GDMP;ground?;%B;7| ((|p| (%)) (% (|Boolean|)))
        (QEQCAR (SPADCALL |p| (QREFELT % 37)) 1)) 

(SDEFUN |GDMP;retract;%R;8| ((|p| (%)) (% (R)))
        (COND ((NULL (SPADCALL |p| (QREFELT % 38))) (|error| "not a constant"))
              ('T (SPADCALL |p| (QREFELT % 39))))) 

(SDEFUN |GDMP;retractIfCan;%U;9| ((|p| (%)) (% (|Union| R "failed")))
        (COND
         ((SPADCALL |p| (QREFELT % 38)) (CONS 0 (SPADCALL |p| (QREFELT % 39))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |GDMP;degree;%OvlNni;10|
        ((|p| (%)) (|v| (|OrderedVariableList| |vl|))
         (% (|NonNegativeInteger|)))
        (SPROG
         ((|res| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
          (|t| (|Term|)) (|locv| (|PositiveInteger|)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT % 13)) 0)
                ('T
                 (SEQ (LETT |res| 0)
                      (LETT |locv| (SPADCALL |v| (QREFELT % 24)))
                      (SEQ G190 (COND ((NULL (NULL (NULL |p|))) (GO G191)))
                           (SEQ (LETT |t| (|SPADfirst| |p|))
                                (LETT |j|
                                      (SPADCALL (QCAR |t|) |locv|
                                                (QREFELT % 44)))
                                (COND ((> |j| |res|) (LETT |res| |j|)))
                                (EXIT (LETT |p| (CDR |p|))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |res|))))))) 

(SDEFUN |GDMP;minimumDegree;%OvlNni;11|
        ((|p| (%)) (|v| (|OrderedVariableList| |vl|))
         (% (|NonNegativeInteger|)))
        (SPADCALL (SPADCALL |p| |v| (QREFELT % 46)) (QREFELT % 48))) 

(SDEFUN |GDMP;differentiate;%Ovl%;12|
        ((|p| (%)) (|v| (|OrderedVariableList| |vl|)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |p| |v| (QREFELT % 46)) (QREFELT % 50))
                  |v| (QREFELT % 51))) 

(SDEFUN |GDMP;degree;%LL;13|
        ((|p| (%)) (|lv| (|List| (|OrderedVariableList| |vl|)))
         (% (|List| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G92 NIL) (|v| NIL) (#2=#:G91 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |v| NIL) (LETT #1# |lv|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |p| |v| (QREFELT % 35)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GDMP;minimumDegree;%LL;14|
        ((|p| (%)) (|lv| (|List| (|OrderedVariableList| |vl|)))
         (% (|List| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G97 NIL) (|v| NIL) (#2=#:G96 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |v| NIL) (LETT #1# |lv|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |p| |v| (QREFELT % 49)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GDMP;numberOfMonomials;%Nni;15| ((|p| (%)) (% (|NonNegativeInteger|)))
        (SPROG ((|l| (|Rep|)))
               (SEQ (LETT |l| |p|)
                    (EXIT (COND ((NULL |l|) 1) ('T (LENGTH |l|))))))) 

(SDEFUN |GDMP;monomial?;%B;16| ((|p| (%)) (% (|Boolean|)))
        (SPROG ((|l| (|Rep|)))
               (SEQ (LETT |l| |p|)
                    (EXIT (COND ((NULL |l|) 'T) ('T (NULL (CDR |l|)))))))) 

(SDEFUN |GDMP;maxNorm| ((|p| (%)) (% (R)))
        (SPROG ((|m| (R)) (#1=#:G107 NIL) (|r| NIL))
               (SEQ (LETT |m| (|spadConstant| % 59))
                    (SEQ (LETT |r| NIL) (LETT #1# (|GDMP;listCoef| |p| %)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |r| |m| (QREFELT % 60)) (LETT |m| |r|))
                            ((SPADCALL (SPADCALL |r| (QREFELT % 61)) |m|
                                       (QREFELT % 60))
                             (LETT |m| (SPADCALL |r| (QREFELT % 61)))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |m|)))) 

(SDEFUN |GDMP;/;%R%;18| ((|p| (%)) (|r| (R)) (% (%)))
        (SPADCALL (SPADCALL |r| (QREFELT % 62)) |p| (QREFELT % 63))) 

(SDEFUN |GDMP;variables;%L;19|
        ((|p| (%)) (% (|List| (|OrderedVariableList| |vl|))))
        (SPROG
         ((#1=#:G120 NIL) (#2=#:G126 NIL) (|i| NIL) (#3=#:G125 NIL)
          (#4=#:G124 NIL) (|tdeg| (E))
          (|maxdeg| (|Vector| (|NonNegativeInteger|))))
         (SEQ (LETT |maxdeg| (SPADCALL (QREFELT % 11) 0 (QREFELT % 65)))
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |p| (QREFELT % 13)))) (GO G191)))
                   (SEQ (LETT |tdeg| (SPADCALL |p| (QREFELT % 66)))
                        (LETT |p| (SPADCALL |p| (QREFELT % 67)))
                        (EXIT
                         (SEQ (LETT |i| 1) (LETT #4# (QREFELT % 11)) G190
                              (COND ((|greater_SI| |i| #4#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SPADCALL |maxdeg| |i|
                                          (MAX
                                           (SPADCALL |maxdeg| |i|
                                                     (QREFELT % 68))
                                           (SPADCALL |tdeg| |i|
                                                     (QREFELT % 44)))
                                          (QREFELT % 69))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #3# NIL)
                (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 11)) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |maxdeg| |i| (QREFELT % 68)) 0
                                   (QREFELT % 70))
                         (LETT #3#
                               (CONS
                                (SPADCALL
                                 (PROG1 (LETT #1# |i|)
                                   (|check_subtype2| (> #1# 0)
                                                     '(|PositiveInteger|)
                                                     '(|NonNegativeInteger|)
                                                     #1#))
                                 (QREFELT % 71))
                                #3#))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                     (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |GDMP;reorder;%L%;20| ((|p| (%)) (|perm| (|List| (|Integer|))) (% (%)))
        (SPROG
         ((|q| (%)) (#1=#:G138 NIL) (#2=#:G140 NIL) (|j| NIL) (#3=#:G139 NIL)
          (#4=#:G137 NIL) (|term| NIL) (#5=#:G136 NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |perm|) (QREFELT % 11) (QREFELT % 70))
            (|error| "must be a complete permutation of all vars"))
           ('T
            (SEQ
             (LETT |q|
                   (PROGN
                    (LETT #5# NIL)
                    (SEQ (LETT |term| NIL) (LETT #4# |p|) G190
                         (COND
                          ((OR (ATOM #4#) (PROGN (LETT |term| (CAR #4#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #5#
                                 (CONS
                                  (CONS
                                   (SPADCALL
                                    (PROGN
                                     (LETT #3# (GETREFV (SIZE |perm|)))
                                     (SEQ (LETT |j| NIL) (LETT #2# |perm|)
                                          (LETT #1# 0) G190
                                          (COND
                                           ((OR (ATOM #2#)
                                                (PROGN
                                                 (LETT |j| (CAR #2#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SETELT #3# #1#
                                                    (SPADCALL (QCAR |term|) |j|
                                                              (QREFELT %
                                                                       44)))))
                                          (LETT #1#
                                                (PROG1 (|inc_SI| #1#)
                                                  (LETT #2# (CDR #2#))))
                                          (GO G190) G191 (EXIT NIL))
                                     #3#)
                                    (QREFELT % 27))
                                   (QCDR |term|))
                                  #5#))))
                         (LETT #4# (CDR #4#)) (GO G190) G191
                         (EXIT (NREVERSE #5#)))))
             (EXIT
              (SPADCALL (CONS #'|GDMP;reorder;%L%;20!0| %) |q|
                        (QREFELT % 75))))))))) 

(SDEFUN |GDMP;reorder;%L%;20!0| ((|z1| NIL) (|z2| NIL) (% NIL))
        (SPADCALL (QCAR |z1|) (QCAR |z2|) (QREFELT % 73))) 

(SDEFUN |GDMP;univariate;%OvlSup;21|
        ((|p| (%)) (|v| (|OrderedVariableList| |vl|))
         (% (|SparseUnivariatePolynomial| %)))
        (SPROG
         ((|nexp| (E)) (|deg| (|NonNegativeInteger|)) (#1=#:G148 NIL)
          (#2=#:G150 NIL) (|i| NIL) (#3=#:G149 NIL)
          (|locv| (|PositiveInteger|)) (|exp| (E)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT % 13)) (|spadConstant| % 78))
                ('T
                 (SEQ (LETT |exp| (SPADCALL |p| (QREFELT % 66)))
                      (LETT |locv| (SPADCALL |v| (QREFELT % 24)))
                      (LETT |deg| 0)
                      (LETT |nexp|
                            (SPADCALL
                             (PROGN
                              (LETT #3# (GETREFV #4=(QREFELT % 11)))
                              (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #1# 0)
                                   G190
                                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SETELT #3# #1#
                                             (COND
                                              ((EQL |i| |locv|)
                                               (SEQ
                                                (LETT |deg|
                                                      (SPADCALL |exp| |i|
                                                                (QREFELT %
                                                                         44)))
                                                (EXIT 0)))
                                              ('T
                                               (SPADCALL |exp| |i|
                                                         (QREFELT % 44)))))))
                                   (LETT #1#
                                         (PROG1 (|inc_SI| #1#)
                                           (LETT |i| (|inc_SI| |i|))))
                                   (GO G190) G191 (EXIT NIL))
                              #3#)
                             (QREFELT % 27)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |p| (QREFELT % 39)) |nexp|
                                   (QREFELT % 28))
                         |deg| (QREFELT % 79))
                        (SPADCALL (SPADCALL |p| (QREFELT % 67)) |v|
                                  (QREFELT % 46))
                        (QREFELT % 80))))))))) 

(SDEFUN |GDMP;eval;%Ovl2%;22|
        ((|p| (%)) (|v| (|OrderedVariableList| |vl|)) (|val| (%)) (% (%)))
        (SPADCALL (SPADCALL |p| |v| (QREFELT % 46)) |val| (QREFELT % 81))) 

(SDEFUN |GDMP;eval;%OvlR%;23|
        ((|p| (%)) (|v| (|OrderedVariableList| |vl|)) (|val| (R)) (% (%)))
        (SPADCALL |p| |v| (SPADCALL |val| (QREFELT % 83)) (QREFELT % 82))) 

(SDEFUN |GDMP;eval;%LL%;24|
        ((|p| (%)) (|lv| (|List| (|OrderedVariableList| |vl|)))
         (|lval| (|List| R)) (% (%)))
        (COND ((SPADCALL |lv| NIL (QREFELT % 85)) |p|)
              ('T
               (SPADCALL
                (SPADCALL |p| (|SPADfirst| |lv|)
                          (SPADCALL (|SPADfirst| |lval|) (QREFELT % 83))
                          (QREFELT % 82))
                (CDR |lv|) (CDR |lval|) (QREFELT % 87))))) 

(SDEFUN |GDMP;evalSortedVarlist|
        ((|p| (%)) (|Lvar| (|List| (|OrderedVariableList| |vl|)))
         (|Lpval| (|List| %)) (% (%)))
        (SPROG
         ((|pts| (|SparseUnivariatePolynomial| %)) (|pval| (%))
          (|mvar| (|OrderedVariableList| |vl|))
          (|pv| (|OrderedVariableList| |vl|))
          (|v| (|Union| (|OrderedVariableList| |vl|) "failed")))
         (SEQ (LETT |v| (SPADCALL |p| (QREFELT % 37)))
              (EXIT
               (COND ((QEQCAR |v| 1) |p|)
                     (#1='T
                      (SEQ (LETT |pv| (QCDR |v|))
                           (COND
                            ((OR (SPADCALL |Lvar| NIL (QREFELT % 85))
                                 (SPADCALL |Lpval| NIL (QREFELT % 89)))
                             (EXIT |p|)))
                           (LETT |mvar| (|SPADfirst| |Lvar|))
                           (EXIT
                            (COND
                             ((SPADCALL |mvar| |pv| (QREFELT % 90))
                              (|GDMP;evalSortedVarlist| |p| (CDR |Lvar|)
                               (SPADCALL |Lpval| '|rest| (QREFELT % 92)) %))
                             (#1#
                              (SEQ
                               (LETT |pval|
                                     (SPADCALL |Lpval| '|first|
                                               (QREFELT % 94)))
                               (LETT |pts|
                                     (SPADCALL
                                      (CONS #'|GDMP;evalSortedVarlist!0|
                                            (VECTOR % |Lpval| |Lvar|))
                                      (SPADCALL |p| |pv| (QREFELT % 46))
                                      (QREFELT % 96)))
                               (EXIT
                                (COND
                                 ((SPADCALL |mvar| |pv| (QREFELT % 97))
                                  (SPADCALL |pts| |pval| (QREFELT % 81)))
                                 (#1#
                                  (SPADCALL |pts| |pv|
                                            (QREFELT % 51)))))))))))))))) 

(SDEFUN |GDMP;evalSortedVarlist!0| ((|x| NIL) ($$ NIL))
        (PROG (|Lvar| |Lpval| %)
          (LETT |Lvar| (QREFELT $$ 2))
          (LETT |Lpval| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GDMP;evalSortedVarlist| |x| |Lvar| |Lpval| %))))) 

(SDEFUN |GDMP;eval;%LL%;26|
        ((|p| (%)) (|Lvar| (|List| (|OrderedVariableList| |vl|)))
         (|Lpval| (|List| %)) (% (%)))
        (SPROG
         ((|nlpval| (|List| %)) (#1=#:G167 NIL) (|mvar| NIL) (#2=#:G166 NIL)
          (|nlvar| (|List| (|OrderedVariableList| |vl|))))
         (SEQ (LETT |nlvar| (SPADCALL (ELT % 90) |Lvar| (QREFELT % 99)))
              (LETT |nlpval|
                    (COND ((SPADCALL |Lvar| |nlvar| (QREFELT % 85)) |Lpval|)
                          ('T
                           (LETT |nlpval|
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |mvar| NIL) (LETT #1# |nlvar|)
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |mvar| (CAR #1#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |Lpval|
                                                          (SPADCALL |mvar|
                                                                    |Lvar|
                                                                    (QREFELT %
                                                                             100))
                                                          (QREFELT % 101))
                                                #2#))))
                                       (LETT #1# (CDR #1#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#))))))))
              (EXIT (|GDMP;evalSortedVarlist| |p| |nlvar| |nlpval| %))))) 

(SDEFUN |GDMP;multivariate;SupOvl%;27|
        ((|p1| (|SparseUnivariatePolynomial| %))
         (|v| (|OrderedVariableList| |vl|)) (% (%)))
        (COND
         ((SPADCALL (|spadConstant| % 78) |p1| (QREFELT % 105))
          (|spadConstant| % 16))
         ((EQL (SPADCALL |p1| (QREFELT % 106)) 0)
          (SPADCALL |p1| (QREFELT % 107)))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |p1| (QREFELT % 107))
                     (SPADCALL (SPADCALL |v| (QREFELT % 31))
                               (SPADCALL |p1| (QREFELT % 106)) (QREFELT % 108))
                     (QREFELT % 29))
           (SPADCALL (SPADCALL |p1| (QREFELT % 109)) |v| (QREFELT % 51))
           (QREFELT % 110))))) 

(SDEFUN |GDMP;univariate;%Sup;28|
        ((|p| (%)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| %))
          (|ans| (|SparseUnivariatePolynomial| R))
          (|v| (|Union| (|OrderedVariableList| |vl|) "failed")))
         (SEQ (LETT |v| (SPADCALL |p| (QREFELT % 37)))
              (EXIT
               (COND
                ((QEQCAR |v| 1)
                 (SPADCALL (SPADCALL |p| (QREFELT % 39)) 0 (QREFELT % 112)))
                ('T
                 (SEQ (LETT |q| (SPADCALL |p| (QCDR |v|) (QREFELT % 46)))
                      (LETT |ans| (|spadConstant| % 113))
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL |q| (|spadConstant| % 78)
                                        (QREFELT % 114)))
                             (GO G191)))
                           (SEQ
                            (LETT |ans|
                                  (SPADCALL |ans|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |q| (QREFELT % 107))
                                              (QREFELT % 115))
                                             (SPADCALL |q| (QREFELT % 106))
                                             (QREFELT % 112))
                                            (QREFELT % 116)))
                            (EXIT (LETT |q| (SPADCALL |q| (QREFELT % 109)))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |ans|)))))))) 

(SDEFUN |GDMP;multivariate;SupOvl%;29|
        ((|p| (|SparseUnivariatePolynomial| R))
         (|v| (|OrderedVariableList| |vl|)) (% (%)))
        (COND
         ((SPADCALL (|spadConstant| % 113) |p| (QREFELT % 118))
          (|spadConstant| % 16))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |p| (QREFELT % 119))
                     (SPADCALL (|spadConstant| % 25) |v|
                               (SPADCALL |p| (QREFELT % 120)) (QREFELT % 30))
                     (QREFELT % 63))
           (SPADCALL (SPADCALL |p| (QREFELT % 121)) |v| (QREFELT % 122))
           (QREFELT % 110))))) 

(SDEFUN |GDMP;content;%R;30| ((|p| (%)) (% (R)))
        (SPROG
         ((#1=#:G183 NIL) (#2=#:G182 (R)) (#3=#:G184 (R)) (#4=#:G187 NIL)
          (|t| NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT % 13)) (|spadConstant| % 59))
                (#5='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |t| NIL) (LETT #4# |p|) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3# (QCDR |t|))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 123))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                       (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#5# (|spadConstant| % 59))))))))) 

(SDEFUN |GDMP;gcd;3%;31| ((|p| (%)) (|q| (%)) (% (%)))
        (SPROG
         ((|r| (R)) (|qv| #1=(|Union| (|OrderedVariableList| |vl|) "failed"))
          (|pv| #1#))
         (SEQ (LETT |pv| (SPADCALL |p| (QREFELT % 37)))
              (EXIT
               (COND
                ((QEQCAR |pv| 1)
                 (COND
                  ((SPADCALL (LETT |r| (SPADCALL |p| (QREFELT % 39)))
                             (|spadConstant| % 59) (QREFELT % 125))
                   |q|)
                  (#2='T
                   (SPADCALL
                    (SPADCALL |r| (SPADCALL |q| (QREFELT % 124))
                              (QREFELT % 123))
                    (QREFELT % 83)))))
                (#2#
                 (SEQ (LETT |qv| (SPADCALL |q| (QREFELT % 37)))
                      (EXIT
                       (COND
                        ((QEQCAR |qv| 1)
                         (COND
                          ((SPADCALL (LETT |r| (SPADCALL |q| (QREFELT % 39)))
                                     (|spadConstant| % 59) (QREFELT % 125))
                           |p|)
                          (#2#
                           (SPADCALL
                            (SPADCALL |r| (SPADCALL |p| (QREFELT % 124))
                                      (QREFELT % 123))
                            (QREFELT % 83)))))
                        ((SPADCALL (QCDR |pv|) (QCDR |qv|) (QREFELT % 126))
                         (SPADCALL |p|
                                   (SPADCALL
                                    (SPADCALL |q| (QCDR |qv|) (QREFELT % 46))
                                    (QREFELT % 127))
                                   (QREFELT % 128)))
                        ((SPADCALL (QCDR |qv|) (QCDR |pv|) (QREFELT % 126))
                         (SPADCALL |q|
                                   (SPADCALL
                                    (SPADCALL |p| (QCDR |pv|) (QREFELT % 46))
                                    (QREFELT % 127))
                                   (QREFELT % 128)))
                        (#2#
                         (SPADCALL
                          (SPADCALL (SPADCALL |p| (QCDR |pv|) (QREFELT % 46))
                                    (SPADCALL |q| (QCDR |qv|) (QREFELT % 46))
                                    (QREFELT % 129))
                          (QCDR |pv|) (QREFELT % 51)))))))))))) 

(SDEFUN |GDMP;gcd;3%;32| ((|p| (%)) (|q| (%)) (% (%)))
        (SPADCALL |p| |q| (QREFELT % 131))) 

(SDEFUN |GDMP;gcd;3%;33| ((|p| (%)) (|q| (%)) (% (%)))
        (SPROG
         ((|r| (R)) (|qv| #1=(|Union| (|OrderedVariableList| |vl|) "failed"))
          (|pv| #1#))
         (SEQ (LETT |pv| (SPADCALL |p| (QREFELT % 37)))
              (EXIT
               (COND
                ((QEQCAR |pv| 1)
                 (COND
                  ((SPADCALL (LETT |r| (SPADCALL |p| (QREFELT % 39)))
                             (|spadConstant| % 59) (QREFELT % 125))
                   |q|)
                  (#2='T
                   (SPADCALL
                    (SPADCALL |r| (SPADCALL |q| (QREFELT % 124))
                              (QREFELT % 123))
                    (QREFELT % 83)))))
                (#2#
                 (SEQ (LETT |qv| (SPADCALL |q| (QREFELT % 37)))
                      (EXIT
                       (COND
                        ((QEQCAR |qv| 1)
                         (COND
                          ((SPADCALL (LETT |r| (SPADCALL |q| (QREFELT % 39)))
                                     (|spadConstant| % 59) (QREFELT % 125))
                           |p|)
                          (#2#
                           (SPADCALL
                            (SPADCALL |r| (SPADCALL |p| (QREFELT % 124))
                                      (QREFELT % 123))
                            (QREFELT % 83)))))
                        ((SPADCALL (QCDR |pv|) (QCDR |qv|) (QREFELT % 126))
                         (SPADCALL |p|
                                   (SPADCALL
                                    (SPADCALL |q| (QCDR |qv|) (QREFELT % 46))
                                    (QREFELT % 127))
                                   (QREFELT % 128)))
                        ((SPADCALL (QCDR |qv|) (QCDR |pv|) (QREFELT % 126))
                         (SPADCALL |q|
                                   (SPADCALL
                                    (SPADCALL |p| (QCDR |pv|) (QREFELT % 46))
                                    (QREFELT % 127))
                                   (QREFELT % 128)))
                        (#2#
                         (SPADCALL
                          (SPADCALL (SPADCALL |p| (QCDR |pv|) (QREFELT % 46))
                                    (SPADCALL |q| (QCDR |qv|) (QREFELT % 46))
                                    (QREFELT % 129))
                          (QCDR |pv|) (QREFELT % 51)))))))))))) 

(SDEFUN |GDMP;coerce;%Of;34| ((|p| (%)) (% (|OutputForm|)))
        (SPROG
         ((|lt| (|List| #1=(|OutputForm|))) (|l| (|List| #1#)) (#2=#:G227 NIL)
          (|i| NIL) (#3=#:G226 NIL) (|t| NIL) (|vl1| (|List| (|OutputForm|)))
          (#4=#:G225 NIL) (|v| NIL) (#5=#:G224 NIL))
         (SEQ
          (COND
           ((SPADCALL |p| (QREFELT % 13))
            (SPADCALL (|spadConstant| % 59) (QREFELT % 133)))
           (#6='T
            (SEQ (LETT |lt| NIL)
                 (LETT |vl1|
                       (PROGN
                        (LETT #5# NIL)
                        (SEQ (LETT |v| NIL) (LETT #4# (QREFELT % 6)) G190
                             (COND
                              ((OR (ATOM #4#) (PROGN (LETT |v| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS (SPADCALL |v| (QREFELT % 134))
                                           #5#))))
                             (LETT #4# (CDR #4#)) (GO G190) G191
                             (EXIT (NREVERSE #5#)))))
                 (SEQ (LETT |t| NIL) (LETT #3# (REVERSE |p|)) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |l| NIL)
                           (SEQ (LETT |i| 1) (LETT #2# (LENGTH |vl1|)) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((EQL
                                     (SPADCALL (QCAR |t|) |i| (QREFELT % 44))
                                     0)
                                    "next")
                                   ((EQL
                                     (SPADCALL (QCAR |t|) |i| (QREFELT % 44))
                                     1)
                                    (LETT |l|
                                          (CONS
                                           (SPADCALL |vl1| |i| (QREFELT % 136))
                                           |l|)))
                                   ('T
                                    (LETT |l|
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |vl1| |i|
                                                      (QREFELT % 136))
                                            (SPADCALL
                                             (SPADCALL (QCAR |t|) |i|
                                                       (QREFELT % 44))
                                             (QREFELT % 137))
                                            (QREFELT % 138))
                                           |l|))))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))
                           (LETT |l| (REVERSE |l|))
                           (COND
                            ((OR
                              (SPADCALL (QCDR |t|) (|spadConstant| % 26)
                                        (QREFELT % 139))
                              (NULL |l|))
                             (LETT |l|
                                   (CONS (SPADCALL (QCDR |t|) (QREFELT % 133))
                                         |l|))))
                           (EXIT
                            (COND
                             ((EQL 1 (LENGTH |l|))
                              (LETT |lt| (CONS (|SPADfirst| |l|) |lt|)))
                             ('T
                              (LETT |lt|
                                    (CONS
                                     (SPADCALL (ELT % 141) |l| (QREFELT % 143))
                                     |lt|))))))
                      (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND ((EQL 1 (LENGTH |lt|)) (|SPADfirst| |lt|))
                        (#6#
                         (SPADCALL (ELT % 144) |lt| (QREFELT % 143))))))))))) 

(DECLAIM (NOTINLINE |GeneralDistributedMultivariatePolynomial;|)) 

(DEFUN |GeneralDistributedMultivariatePolynomial;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G266 NIL) (|pv$| NIL) (#2=#:G257 NIL) (#3=#:G259 NIL) (#4=#:G258 NIL)
    (#5=#:G260 NIL) (#6=#:G261 NIL) (#7=#:G262 NIL) (#8=#:G263 NIL)
    (#9=#:G264 NIL) (#10=#:G265 NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT |dv$|
          (LIST '|GeneralDistributedMultivariatePolynomial| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 182))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
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
                                                       '(|CommutativeRing|))
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
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (|HasCategory| |#2| '(|EntireRing|))
                                        (LETT #10#
                                              (|HasCategory| |#2|
                                                             '(|GcdDomain|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #10#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #10#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         #10#)
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|OrderedVariableList| |#1|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (AND (|HasCategory| |#2| '(|Hashable|))
                                             (|HasCategory|
                                              (|OrderedVariableList| |#1|)
                                              '(|Hashable|)))
                                        (|HasCategory| |#3| '(|Comparable|))
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
                                        (LETT #9#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #10# #9#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #10# #9#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #10# #9#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         #10# #9#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|PatternMatchable|
                                                  (|Float|)))))
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
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #10#
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
                                         #8#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|PatternMatchable|
                                                  (|Integer|)))))
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
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #10#
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
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|))))))
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
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #10#
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
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|))))))
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
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #10#
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
                                         #5#)
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #4#)
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|)))
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         (AND #4# #10#)
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|)))
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
                                         #2#)))))
    (|haddProp| |$ConstructorCache| '|GeneralDistributedMultivariatePolynomial|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 17592186044416))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 35184372088832))
    (AND (OR (|HasCategory| |#2| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| % 70368744177664))
    (AND
     (OR (|HasCategory| |#2| '(|EntireRing|))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 140737488355328))
    (AND
     (OR (|HasCategory| |#2| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#2| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #10#
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 281474976710656))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #10# (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 562949953421312))
    (AND
     (OR (|HasCategory| |#2| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#2| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 1125899906842624))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|SemiRing|)))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#2| '(|AbelianMonoid|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|CommutativeRing|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Ring|)))
      #2#
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 36028797018963968))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9 (|Record| (|:| |k| |#3|) (|:| |c| |#2|)))
    (QSETREFV % 10 (|List| (QREFELT % 9)))
    (QSETREFV % 11 (LENGTH |#1|))
    (COND
     ((|testBitVector| |pv$| 21)
      (QSETREFV % 64 (CONS (|dispatchFunction| |GDMP;/;%R%;18|) %))))
    (COND
     ((|testBitVector| |pv$| 14)
      (PROGN
       (QSETREFV % 124 (CONS (|dispatchFunction| |GDMP;content;%R;30|) %))
       (COND
        ((|HasCategory| |#2| '(|EuclideanDomain|))
         (COND
          ((|HasCategory| |#2| '(|FloatingPointSystem|))
           (QSETREFV % 128 (CONS (|dispatchFunction| |GDMP;gcd;3%;31|) %)))
          ('T
           (QSETREFV % 128 (CONS (|dispatchFunction| |GDMP;gcd;3%;32|) %)))))
        ('T
         (QSETREFV % 128 (CONS (|dispatchFunction| |GDMP;gcd;3%;33|) %)))))))
    %))) 

(DEFUN |GeneralDistributedMultivariatePolynomial| (&REST #1=#:G267)
  (SPROG NIL
         (PROG (#2=#:G268)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T T))
                                               (HGET |$ConstructorCache|
                                                     '|GeneralDistributedMultivariatePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |GeneralDistributedMultivariatePolynomial;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GeneralDistributedMultivariatePolynomial|)))))))))) 

(MAKEPROP '|GeneralDistributedMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 7 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Term| '|Rep| '|n| (|Boolean|)
              |GDMP;zero?;%B;1| (|Vector| 17) (0 . |coerce|) (5 . |Zero|)
              (|NonNegativeInteger|) (9 . +) (|Mapping| 17 17 17)
              (15 . |reduce|) |GDMP;totalDegree;%Nni;2| (|PositiveInteger|)
              (|OrderedVariableList| (NRTEVAL (QREFELT % 6))) (22 . |lookup|)
              (27 . |One|) (31 . |One|) (35 . |directProduct|)
              (40 . |monomial|) (46 . *) |GDMP;monomial;%OvlNni%;3|
              |GDMP;coerce;Ovl%;4| (|Union| % '"failed") (|Symbol|)
              (52 . |variable|) |GDMP;degree;%OvlNni;10| (|Union| 23 '"failed")
              |GDMP;mainVariable;%U;6| |GDMP;ground?;%B;7|
              (57 . |leadingCoefficient|) |GDMP;retract;%R;8|
              (|Union| 7 '"failed") |GDMP;retractIfCan;%U;9| (|Integer|)
              (62 . |elt|) (|SparseUnivariatePolynomial| %)
              |GDMP;univariate;%OvlSup;21| (|SparseUnivariatePolynomial| $$)
              (68 . |minimumDegree|) |GDMP;minimumDegree;%OvlNni;11|
              (73 . |differentiate|) |GDMP;multivariate;SupOvl%;27|
              |GDMP;differentiate;%Ovl%;12| (|List| 17) (|List| 23)
              |GDMP;degree;%LL;13| |GDMP;minimumDegree;%LL;14|
              |GDMP;numberOfMonomials;%Nni;15| |GDMP;monomial?;%B;16|
              (78 . |Zero|) (82 . >) (88 . -) (93 . |inv|) (98 . *) (104 . /)
              (110 . |new|) (116 . |degree|) (121 . |reductum|) (126 . |elt|)
              (132 . |setelt!|) (139 . ~=) (145 . |index|)
              |GDMP;variables;%L;19| (150 . >) (|Mapping| 12 9 9)
              (156 . |sort|) (|List| 43) |GDMP;reorder;%L%;20| (162 . |Zero|)
              (166 . |monomial|) (172 . +) (178 . |elt|) |GDMP;eval;%Ovl2%;22|
              (184 . |coerce|) |GDMP;eval;%OvlR%;23| (189 . =) (|List| 7)
              |GDMP;eval;%LL%;24| (|List| $$) (195 . =) (201 . >) '"rest"
              (207 . |elt|) '"first" (213 . |elt|) (|Mapping| $$ $$)
              (219 . |map|) (225 . =) (|Mapping| 12 23 23) (231 . |sort|)
              (237 . |position|) (243 . |elt|) (|List| %) |GDMP;eval;%LL%;26|
              (249 . |Zero|) (253 . =) (259 . |degree|)
              (264 . |leadingCoefficient|) (269 . ^) (275 . |reductum|)
              (280 . +) (|SparseUnivariatePolynomial| 7) (286 . |monomial|)
              (292 . |Zero|) (296 . ~=) (302 . |ground|) (307 . +)
              |GDMP;univariate;%Sup;28| (313 . =) (319 . |leadingCoefficient|)
              (324 . |degree|) (329 . |reductum|)
              |GDMP;multivariate;SupOvl%;29| (334 . |gcd|) (340 . |content|)
              (345 . =) (351 . <) (357 . |content|) (362 . |gcd|) (368 . |gcd|)
              (|PolynomialGcdPackage| 8 23 7 $$) (374 . |gcd|) (|OutputForm|)
              (380 . |coerce|) (385 . |coerce|) (|List| 132) (390 . |elt|)
              (396 . |coerce|) (401 . ^) (407 . ~=) (413 . |One|) (417 . *)
              (|Mapping| 132 132 132) (423 . |reduce|) (429 . +)
              |GDMP;coerce;%Of;34| (|String|)
              (|Record| (|:| |k| 8) (|:| |c| 7)) (|List| 147) (|Mapping| 7 7)
              (|List| 8) (|Mapping| 8 8) (|Union| 102 '#1="failed")
              (|Union| 162 '#2="failed") (|Matrix| %) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 43) (|HashState|)
              (|SingleInteger|) (|Matrix| 43)
              (|Record| (|:| |mat| 160) (|:| |vec| (|Vector| 43))) (|Vector| %)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 43 %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 43) (|Mapping| 7 8) (|Factored| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Union| 171 '#2#) (|List| 45) (|Factored| 45)
              (|Union| 166 '#3="failed") (|Union| 43 '#3#)
              (|Record| (|:| |mat| 176) (|:| |vec| (|Vector| 7))) (|Matrix| 7)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |var| 23) (|:| |exponent| 17)) (|Union| 178 '#1#)
              (|List| 181) (|Equation| %))
           '#(~= 435 |zero?| 441 |variables| 446 |univariate| 451 |unitNormal|
              462 |unitCanonical| 467 |unit?| 472 |totalDegreeSorted| 477
              |totalDegree| 483 |support| 494 |subtractIfCan| 499
              |squareFreePolynomial| 505 |squareFreePart| 510 |squareFree| 515
              |solveLinearPolynomialEquation| 520 |smaller?| 526 |sample| 532
              |rightRecip| 536 |rightPower| 541 |retractIfCan| 553 |retract|
              573 |resultant| 593 |reorder| 600 |reductum| 606 |reducedSystem|
              611 |recip| 633 |primitivePart| 638 |primitiveMonomials| 649
              |prime?| 654 |pomopo!| 659 |plenaryPower| 667 |patternMatch| 673
              |opposite?| 687 |one?| 693 |numberOfMonomials| 698 |multivariate|
              703 |monomials| 715 |monomial?| 720 |monomial| 725 |monicDivide|
              745 |minimumDegree| 752 |mapExponents| 769 |map| 775
              |mainVariable| 781 |listOfTerms| 786 |linearExtend| 791
              |leftRecip| 797 |leftPower| 802 |leadingTerm| 814
              |leadingSupport| 819 |leadingMonomial| 824 |leadingCoefficient|
              829 |lcmCoef| 834 |lcm| 840 |latex| 851 |isTimes| 856 |isPlus|
              861 |isExpt| 866 |hashUpdate!| 871 |hash| 877 |ground?| 882
              |ground| 887 |gcdPolynomial| 892 |gcd| 898 |fmecg| 909
              |factorSquareFreePolynomial| 917 |factorPolynomial| 922 |factor|
              927 |exquo| 932 |eval| 944 |discriminant| 998 |differentiate|
              1004 |degree| 1030 |convert| 1047 |content| 1062
              |constructOrdered| 1073 |construct| 1078 |conditionP| 1083
              |commutator| 1088 |coerce| 1094 |coefficients| 1124 |coefficient|
              1129 |charthRoot| 1149 |characteristic| 1154 |binomThmExpt| 1158
              |associator| 1165 |associates?| 1172 |antiCommutator| 1178
              |annihilate?| 1184 ^ 1190 |Zero| 1202 |One| 1206 D 1210 = 1236 /
              1242 - 1248 + 1259 * 1265)
           'NIL
           (CONS
            (|makeByteWordVec2| 44
                                '(0 10 0 10 0 16 0 25 14 24 4 17 26 15 3 2 1 27
                                  27 26 12 15 1 0 26 4 5 1 0 0 38 4 4 1 0 0 0
                                  27 38 1 1 0 0 0 0 0 11 12 12 44 12 43 0 0 31
                                  29 9 0 0 0 12 12 19 26 7 6 0 0 12 12 18 35 33
                                  13 26 8 7 6 4 0 0 0 0 0 0))
            (CONS
             '#(|PolynomialCategory&| |PolynomialFactorizationExplicit&|
                |MaybeSkewPolynomialCategory&| |UniqueFactorizationDomain&|
                |FiniteAbelianMonoidRing&| |GcdDomain&| |AbelianMonoidRing&|
                NIL NIL NIL |PartialDifferentialRing&| |EntireRing&| |Algebra&|
                |Algebra&| NIL NIL |Algebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&| |Module&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL NIL NIL
                NIL |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |MagmaWithUnit&| |AbelianMonoid&| NIL |NonAssociativeSemiRng&|
                NIL NIL NIL |AbelianSemiGroup&| |Magma&| |FullyRetractableTo&|
                |RetractableTo&| |Evalable&| |Hashable&| NIL |RetractableTo&|
                |RetractableTo&| |SetCategory&| |RetractableTo&| NIL
                |InnerEvalable&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |BasicType&| NIL |InnerEvalable&| |InnerEvalable&| NIL)
             (CONS
              '#((|PolynomialCategory| 7 8 (|OrderedVariableList| 6))
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 7 8 (|OrderedVariableList| 6))
                 (|UniqueFactorizationDomain|) (|FiniteAbelianMonoidRing| 7 8)
                 (|GcdDomain|) (|AbelianMonoidRing| 7 8) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|)
                 (|PartialDifferentialRing| (|OrderedVariableList| 6))
                 (|EntireRing|) (|Algebra| $$) (|Algebra| 7)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| 166) (|Ring|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|SemiRing|) (|NonAssociativeAlgebra| 7)
                 (|NonAssociativeAlgebra| 166) (|FreeModuleCategory| 7 8)
                 (|Module| $$) (|FullyLinearlyExplicitOver| 7) (|Module| 7)
                 (|Module| 166) (|IndexedDirectProductCategory| 7 8)
                 (|SemiRng|) (|LinearlyExplicitOver| 43)
                 (|LinearlyExplicitOver| 7) (|NonAssociativeRing|)
                 (|BiModule| 166 166) (|BiModule| $$ $$) (|BiModule| 7 7)
                 (|IndexedProductCategory| 7 8) (|NonAssociativeRng|)
                 (|RightModule| 43) (|RightModule| 166) (|LeftModule| 166)
                 (|LeftModule| $$) (|RightModule| $$) (|RightModule| 7)
                 (|LeftModule| 7) (|AbelianProductCategory| 7) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|PatternMatchable| 43) (|PatternMatchable| (|Float|))
                 (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyRetractableTo| 7)
                 (|RetractableTo| (|OrderedVariableList| 6)) (|Evalable| $$)
                 (|Hashable|) (|CommutativeStar|) (|RetractableTo| 43)
                 (|RetractableTo| 166) (|SetCategory|) (|RetractableTo| 7)
                 (|CoercibleFrom| (|OrderedVariableList| 6))
                 (|InnerEvalable| $$ $$) (|ConvertibleTo| 155)
                 (|ConvertibleTo| 157) (|ConvertibleTo| 156) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|canonicalUnitNormal|) (|CoercibleFrom| 43)
                 (|CoercibleFrom| 166) (|unitsKnown|) (|CoercibleTo| 132)
                 (|BasicType|) (|CoercibleFrom| 7)
                 (|InnerEvalable| (|OrderedVariableList| 6) 7)
                 (|InnerEvalable| (|OrderedVariableList| 6) $$)
                 (|VariablesCommuteWithCoefficients|))
              (|makeByteWordVec2| 181
                                  '(1 8 14 0 15 0 0 0 16 2 17 0 0 0 18 3 14 17
                                    19 0 17 20 1 23 22 0 24 0 0 0 25 0 7 0 26 1
                                    8 0 14 27 2 0 0 7 8 28 2 0 0 0 0 29 1 23 32
                                    33 34 1 0 7 0 39 2 8 17 0 43 44 1 47 17 0
                                    48 1 47 0 0 50 0 7 0 59 2 7 12 0 0 60 1 7 0
                                    0 61 1 7 0 0 62 2 0 0 7 0 63 2 0 0 0 7 64 2
                                    14 0 17 17 65 1 0 8 0 66 1 0 0 0 67 2 14 17
                                    0 43 68 3 14 17 0 43 17 69 2 17 12 0 0 70 1
                                    23 0 22 71 2 8 12 0 0 73 2 10 0 74 0 75 0
                                    47 0 78 2 47 0 2 17 79 2 47 0 0 0 80 2 47 2
                                    0 2 81 1 0 0 7 83 2 54 12 0 0 85 2 88 12 0
                                    0 89 2 23 12 0 0 90 2 88 0 0 91 92 2 88 2 0
                                    93 94 2 47 0 95 0 96 2 23 12 0 0 97 2 54 0
                                    98 0 99 2 54 43 23 0 100 2 88 2 0 43 101 0
                                    8 0 104 2 47 12 0 0 105 1 47 17 0 106 1 47
                                    2 0 107 2 0 0 0 17 108 1 47 0 0 109 2 0 0 0
                                    0 110 2 111 0 7 17 112 0 111 0 113 2 47 12
                                    0 0 114 1 0 7 0 115 2 111 0 0 0 116 2 111
                                    12 0 0 118 1 111 7 0 119 1 111 17 0 120 1
                                    111 0 0 121 2 7 0 0 0 123 1 0 7 0 124 2 7
                                    12 0 0 125 2 23 12 0 0 126 1 47 2 0 127 2 0
                                    0 0 0 128 2 47 0 0 0 129 2 130 2 2 2 131 1
                                    7 132 0 133 1 33 132 0 134 2 135 132 0 43
                                    136 1 17 132 0 137 2 132 0 0 0 138 2 7 12 0
                                    0 139 0 8 0 140 2 132 0 0 0 141 2 135 132
                                    142 0 143 2 132 0 0 0 144 2 0 12 0 0 1 1 54
                                    12 0 13 1 0 54 0 72 1 0 111 0 117 2 0 45 0
                                    23 46 1 48 165 0 1 1 48 0 0 1 1 48 12 0 1 2
                                    0 17 0 54 1 2 0 17 0 54 1 1 0 17 0 21 1 0
                                    150 0 1 2 55 32 0 0 1 1 10 172 45 1 1 14 0
                                    0 1 1 14 168 0 1 2 10 170 171 45 1 2 9 12 0
                                    0 1 0 54 0 1 1 52 32 0 1 2 0 0 0 22 1 2 52
                                    0 0 17 1 1 0 41 0 42 1 6 173 0 1 1 7 174 0
                                    1 1 12 36 0 1 1 0 7 0 40 1 6 166 0 1 1 7 43
                                    0 1 1 12 23 0 1 3 5 0 0 0 23 1 2 0 0 0 76
                                    77 1 20 0 0 67 1 37 160 154 1 2 37 161 154
                                    162 1 2 4 175 154 162 1 1 4 176 154 1 1 52
                                    32 0 1 1 14 0 0 1 2 14 0 0 23 1 1 12 102 0
                                    1 1 10 12 0 1 4 0 0 0 7 8 0 1 2 49 0 0 22 1
                                    3 28 163 0 156 163 1 3 30 164 0 157 164 1 2
                                    54 12 0 0 1 1 52 12 0 1 1 0 17 0 57 2 0 0
                                    111 23 122 2 0 0 45 23 51 1 0 102 0 1 1 0
                                    12 0 58 2 0 0 7 8 28 3 0 0 0 54 53 1 3 0 0
                                    0 23 17 30 3 4 177 0 0 23 1 1 0 8 0 1 2 0
                                    53 0 54 56 2 0 17 0 23 49 2 0 0 151 0 1 2 0
                                    0 149 0 1 1 0 36 0 37 1 0 148 0 1 2 5 7 167
                                    0 1 1 52 32 0 1 2 0 0 0 22 1 2 52 0 0 17 1
                                    1 20 147 0 1 1 20 8 0 1 1 20 0 0 1 1 20 7 0
                                    39 2 14 169 0 0 1 1 14 0 102 1 2 14 0 0 0 1
                                    1 0 146 0 1 1 12 152 0 1 1 0 152 0 1 1 12
                                    179 0 1 2 19 158 158 0 1 1 19 159 0 1 1 0
                                    12 0 38 1 0 7 0 115 2 14 45 45 45 1 2 14 0
                                    0 0 128 1 14 0 102 1 4 4 0 0 8 7 0 1 1 10
                                    172 45 1 1 10 172 45 1 1 10 168 0 1 2 48 32
                                    0 0 1 2 13 32 0 7 1 3 0 0 0 23 7 84 3 0 0 0
                                    54 86 87 3 0 0 0 54 102 103 3 0 0 0 23 0 82
                                    2 12 0 0 180 1 2 12 0 0 181 1 3 12 0 0 102
                                    102 1 3 12 0 0 0 0 1 2 5 0 0 23 1 3 4 0 0
                                    23 17 1 3 4 0 0 54 53 1 2 4 0 0 54 1 2 4 0
                                    0 23 52 1 0 8 0 66 2 0 53 0 54 55 2 0 17 0
                                    23 35 1 18 155 0 1 1 32 156 0 1 1 34 157 0
                                    1 1 14 7 0 124 2 14 0 0 23 1 1 20 0 148 1 1
                                    0 0 148 1 1 46 153 154 1 2 53 0 0 0 1 1 0
                                    132 0 145 1 0 0 7 83 1 50 0 0 1 1 51 0 43 1
                                    1 22 0 166 1 1 12 0 23 31 1 0 86 0 1 2 0 7
                                    0 8 1 3 0 0 0 54 53 1 3 0 0 0 23 17 1 1 47
                                    32 0 1 0 53 17 1 3 45 0 0 0 17 1 3 53 0 0 0
                                    0 1 2 48 12 0 0 1 2 0 0 0 0 1 2 53 12 0 0 1
                                    2 0 0 0 22 1 2 52 0 0 17 108 0 54 0 16 0 52
                                    0 25 3 4 0 0 54 53 1 3 4 0 0 23 17 1 2 4 0
                                    0 23 1 2 4 0 0 54 1 2 0 12 0 0 1 2 21 0 0 7
                                    64 2 56 0 0 0 1 1 56 0 0 1 2 0 0 0 0 110 2
                                    0 0 22 0 1 2 0 0 0 0 29 2 0 0 0 7 1 2 0 0 7
                                    0 63 2 37 0 0 43 1 2 56 0 43 0 1 2 54 0 17
                                    0 1 2 1 0 0 166 1 2 1 0 166 0 1)))))
           '|lookupComplete|)) 
