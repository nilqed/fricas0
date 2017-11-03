
(SDEFUN |PERM;smallerElement?| ((|a| S) (|b| S) ($ |Boolean|))
        (COND
         ((|HasCategory| (QREFELT $ 6) '(|OrderedSet|))
          (SPADCALL |a| |b| (QREFELT $ 9)))
         ((|HasCategory| (QREFELT $ 6) '(|Finite|))
          (< (SPADCALL |a| (QREFELT $ 11)) (SPADCALL |b| (QREFELT $ 11))))
         ('T NIL))) 

(SDEFUN |PERM;rotateCycle| ((|cyc| |List| S) ($ |List| S))
        (SPROG
         ((#1=#:G746 NIL) (#2=#:G745 NIL) (|minpos| (|Integer|)) (|min| (S))
          (#3=#:G749 NIL) (|i| NIL))
         (SEQ (LETT |min| (|SPADfirst| |cyc|) . #4=(|PERM;rotateCycle|))
              (LETT |minpos| 1 . #4#)
              (SEQ (LETT |i| 2 . #4#)
                   (LETT #3# (SPADCALL |cyc| (QREFELT $ 14)) . #4#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((|PERM;smallerElement?|
                        (SPADCALL |cyc| |i| (QREFELT $ 15)) |min| $)
                       (SEQ
                        (LETT |min| (SPADCALL |cyc| |i| (QREFELT $ 15)) . #4#)
                        (EXIT (LETT |minpos| |i| . #4#)))))))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((EQL |minpos| 1) |cyc|)
                     ('T
                      (SPADCALL
                       (SPADCALL |cyc|
                                 (PROG1
                                     (LETT #2#
                                           (+ (- (LENGTH |cyc|) |minpos|) 1)
                                           . #4#)
                                   (|check_subtype2| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                 (QREFELT $ 18))
                       (SPADCALL |cyc|
                                 (PROG1 (LETT #1# (- |minpos| 1) . #4#)
                                   (|check_subtype2| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                 (QREFELT $ 19))
                       (QREFELT $ 20)))))))) 

(SDEFUN |PERM;coerceCycle| ((|lls| |List| (|List| S)) ($ $))
        (SPROG ((|perm| ($)) (#1=#:G753 NIL) (|lists| NIL))
               (SEQ
                (LETT |perm| (|spadConstant| $ 16) . #2=(|PERM;coerceCycle|))
                (SEQ (LETT |lists| NIL . #2#) (LETT #1# (REVERSE |lls|) . #2#)
                     G190
                     (COND
                      ((OR (ATOM #1#)
                           (PROGN (LETT |lists| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |perm|
                             (SPADCALL (SPADCALL |lists| (QREFELT $ 21)) |perm|
                                       (QREFELT $ 22))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |perm|)))) 

(SDEFUN |PERM;smallerCycle?|
        ((|cyca| |List| S) (|cycb| |List| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G759 NIL) (#2=#:G760 NIL) (#3=#:G761 NIL) (|i| NIL)
          (#4=#:G762 NIL) (|j| NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LENGTH |cyca|) (LENGTH |cycb|) (QREFELT $ 23))
             (< (LENGTH |cyca|) (LENGTH |cycb|)))
            ('T
             (SEQ
              (SEQ
               (EXIT
                (SEQ (LETT |j| NIL . #5=(|PERM;smallerCycle?|))
                     (LETT #4# |cycb| . #5#) (LETT |i| NIL . #5#)
                     (LETT #3# |cyca| . #5#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #5#) NIL)
                           (ATOM #4#) (PROGN (LETT |j| (CAR #4#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |i| |j| (QREFELT $ 24))
                         (PROGN
                          (LETT #1#
                                (PROGN
                                 (LETT #2# (|PERM;smallerElement?| |i| |j| $)
                                       . #5#)
                                 (GO #6=#:G758))
                                . #5#)
                          (GO #7=#:G755))))))
                     (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #5#))
                           . #5#)
                     (GO G190) G191 (EXIT NIL)))
               #7# (EXIT #1#))
              (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |PERM;shorterCycle?|
        ((|cyca| |List| S) (|cycb| |List| S) ($ |Boolean|))
        (< (LENGTH |cyca|) (LENGTH |cycb|))) 

(SDEFUN |PERM;permord|
        ((|pa| |Record| (|:| |cycl| (|List| (|List| S))) (|:| |permut| $))
         (|pb| |Record| (|:| |cycl| (|List| (|List| S))) (|:| |permut| $))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G769 NIL) (#2=#:G770 NIL) (#3=#:G771 NIL) (|i| NIL)
          (#4=#:G772 NIL) (|j| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |j| NIL . #5=(|PERM;permord|))
                   (LETT #4# (QCAR |pb|) . #5#) (LETT |i| NIL . #5#)
                   (LETT #3# (QCAR |pa|) . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #5#) NIL)
                         (ATOM #4#) (PROGN (LETT |j| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |i| |j| (QREFELT $ 25))
                       (PROGN
                        (LETT #1#
                              (PROGN
                               (LETT #2# (|PERM;smallerCycle?| |i| |j| $)
                                     . #5#)
                               (GO #6=#:G768))
                              . #5#)
                        (GO #7=#:G766))))))
                   (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL)))
             #7# (EXIT #1#))
            (EXIT (< (LENGTH (QCAR |pa|)) (LENGTH (QCAR |pb|))))))
          #6# (EXIT #2#)))) 

(SDEFUN |PERM;coerceToCycle|
        ((|p| $) (|doSorting?| |Boolean|) ($ |List| (|List| S)))
        (SPROG
         ((|cycles| (|List| (|List| S))) (|nextCycle| (|List| S))
          (|im| #1=(|List| S)) (|nextEltInCycle| (S)) (|preim| #1#)
          (|i| (|Integer|)) (|firstEltInCycle| (S)))
         (SEQ
          (LETT |preim| (SPADCALL |p| 1 (QREFELT $ 26))
                . #2=(|PERM;coerceToCycle|))
          (LETT |im| (SPADCALL |p| 2 (QREFELT $ 26)) . #2#)
          (LETT |cycles| NIL . #2#)
          (SEQ G190 (COND ((NULL (NULL (NULL |preim|))) (GO G191)))
               (SEQ (LETT |firstEltInCycle| (|SPADfirst| |preim|) . #2#)
                    (LETT |nextCycle|
                          (SPADCALL |firstEltInCycle| (QREFELT $ 27)) . #2#)
                    (LETT |preim| (CDR |preim|) . #2#)
                    (LETT |nextEltInCycle| (|SPADfirst| |im|) . #2#)
                    (LETT |im| (CDR |im|) . #2#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |nextEltInCycle| |firstEltInCycle|
                                      (QREFELT $ 24)))
                           (GO G191)))
                         (SEQ
                          (LETT |nextCycle| (CONS |nextEltInCycle| |nextCycle|)
                                . #2#)
                          (LETT |i|
                                (SPADCALL |nextEltInCycle| |preim|
                                          (QREFELT $ 28))
                                . #2#)
                          (LETT |preim| (SPADCALL |preim| |i| (QREFELT $ 29))
                                . #2#)
                          (LETT |nextEltInCycle|
                                (SPADCALL |im| |i| (QREFELT $ 15)) . #2#)
                          (EXIT
                           (LETT |im| (SPADCALL |im| |i| (QREFELT $ 29))
                                 . #2#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |nextCycle| (REVERSE |nextCycle|) . #2#)
                    (EXIT
                     (COND
                      ((NULL (NULL (CDR |nextCycle|)))
                       (SEQ
                        (COND
                         (|doSorting?|
                          (COND
                           ((OR (|HasCategory| (QREFELT $ 6) '(|OrderedSet|))
                                (|HasCategory| (QREFELT $ 6) '(|Finite|)))
                            (LETT |nextCycle|
                                  (|PERM;rotateCycle| |nextCycle| $) . #2#)))))
                        (EXIT
                         (LETT |cycles| (CONS |nextCycle| |cycles|)
                               . #2#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            (|doSorting?|
             (COND
              ((OR (|HasCategory| (QREFELT $ 6) '(|OrderedSet|))
                   (|HasCategory| (QREFELT $ 6) '(|Finite|)))
               (SPADCALL (CONS (|function| |PERM;smallerCycle?|) $) |cycles|
                         (QREFELT $ 32)))
              ('T
               (SPADCALL (CONS (|function| |PERM;shorterCycle?|) $) |cycles|
                         (QREFELT $ 32)))))
            ('T |cycles|)))))) 

(SDEFUN |PERM;duplicates?| ((|ls| |List| S) ($ |Boolean|))
        (SPROG ((|x| (|List| S)) (#1=#:G794 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |x| (SPADCALL |ls| (QREFELT $ 33))
                        . #2=(|PERM;duplicates?|))
                  (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (|SPADfirst| |x|) (CDR |x|)
                                     (QREFELT $ 34))
                           (PROGN (LETT #1# 'T . #2#) (GO #3=#:G793)))
                          ('T (LETT |x| (CDR |x|) . #2#)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |PERM;listRepresentation;$R;9|
        ((|p| $)
         ($
          . #1=(|Record| (|:| |preimage| (|List| S))
                         (|:| |image| (|List| S)))))
        (SPROG ((|s| #1#))
               (LETT |s|
                     (CONS (SPADCALL |p| 1 (QREFELT $ 26))
                           (SPADCALL |p| 2 (QREFELT $ 26)))
                     |PERM;listRepresentation;$R;9|))) 

(SDEFUN |PERM;coercePreimagesImages;L$;10|
        ((|preImageAndImage| |List| (|List| S)) ($ $))
        (SPROG
         ((|image| (|List| S)) (|preImage| (|List| S)) (#1=#:G803 NIL)
          (|i| NIL) (#2=#:G804 NIL) (|pi| NIL))
         (SEQ (LETT |preImage| NIL . #3=(|PERM;coercePreimagesImages;L$;10|))
              (LETT |image| NIL . #3#)
              (SEQ (LETT |pi| NIL . #3#)
                   (LETT #2# (SPADCALL |preImageAndImage| 2 (QREFELT $ 37))
                         . #3#)
                   (LETT |i| NIL . #3#)
                   (LETT #1# (SPADCALL |preImageAndImage| 1 (QREFELT $ 37))
                         . #3#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #3#) NIL)
                         (ATOM #2#) (PROGN (LETT |pi| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |i| |pi| (QREFELT $ 24))
                       (SEQ (LETT |preImage| (CONS |i| |preImage|) . #3#)
                            (EXIT
                             (LETT |image| (CONS |pi| |image|) . #3#)))))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |preImage| |image|))))) 

(SDEFUN |PERM;movedPoints;$S;11| ((|p| $) ($ |Set| S))
        (SPADCALL (SPADCALL |p| 1 (QREFELT $ 26)) (QREFELT $ 40))) 

(SDEFUN |PERM;degree;$Nni;12| ((|p| $) ($ |NonNegativeInteger|))
        (SPADCALL (SPADCALL |p| (QREFELT $ 41)) (QREFELT $ 42))) 

(SDEFUN |PERM;=;2$B;13| ((|p| $) (|q| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G815 NIL) (#2=#:G816 NIL) (|pos| (|Integer|)) (#3=#:G817 NIL)
          (|i| NIL) (|preimq| #4=(|List| S)) (|preimp| #4#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL
              (LENGTH
               (LETT |preimp| (SPADCALL |p| 1 (QREFELT $ 26))
                     . #5=(|PERM;=;2$B;13|)))
              (LENGTH (LETT |preimq| (SPADCALL |q| 1 (QREFELT $ 26)) . #5#))
              (QREFELT $ 23))
             NIL)
            ('T
             (SEQ
              (SEQ (LETT |i| 1 . #5#)
                   (LETT #3# (SPADCALL |preimp| (QREFELT $ 14)) . #5#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (LETT |pos|
                          (SPADCALL (SPADCALL |preimp| |i| (QREFELT $ 15))
                                    |preimq| (QREFELT $ 28))
                          . #5#)
                    (EXIT
                     (COND
                      ((EQL |pos| 0)
                       (PROGN (LETT #2# NIL . #5#) (GO #6=#:G814)))
                      ('T
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL (SPADCALL |p| 2 (QREFELT $ 26)) |i|
                                      (QREFELT $ 15))
                            (SPADCALL (SPADCALL |q| 2 (QREFELT $ 26)) |pos|
                                      (QREFELT $ 15))
                            (QREFELT $ 24))
                           (PROGN
                            (LETT #1# (PROGN (LETT #2# NIL . #5#) (GO #6#))
                                  . #5#)
                            (GO #7=#:G809)))))
                        #7# (EXIT #1#))))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT 'T)))))
          #6# (EXIT #2#)))) 

(SDEFUN |PERM;orbit;$SS;14| ((|p| $) (|el| S) ($ |Set| S))
        (SPROG ((|el2| (S)) (|out| (|Set| S)))
               (SEQ
                (LETT |out|
                      (SPADCALL (SPADCALL |el| (QREFELT $ 27)) (QREFELT $ 45))
                      . #1=(|PERM;orbit;$SS;14|))
                (LETT |el2| (SPADCALL |p| |el| (QREFELT $ 46)) . #1#)
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |el2| |el| (QREFELT $ 24))) (GO G191)))
                     (SEQ (SPADCALL |el2| |out| (QREFELT $ 47))
                          (EXIT
                           (LETT |el2| (SPADCALL |p| |el2| (QREFELT $ 46))
                                 . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |out|)))) 

(SDEFUN |PERM;cyclePartition;$P;15| ((|p| $) ($ |Partition|))
        (SPROG ((#1=#:G825 NIL) (|c| NIL) (#2=#:G824 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|PERM;cyclePartition;$P;15|))
                  (SEQ (LETT |c| NIL . #3#)
                       (LETT #1# (|PERM;coerceToCycle| |p| NIL $) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS (LENGTH |c|) #2#) . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 51))))) 

(SDEFUN |PERM;order;$Nni;16| ((|p| $) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G826 NIL) (|ord| (|Integer|)))
               (SEQ
                (LETT |ord|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |p| (QREFELT $ 52)) (QREFELT $ 53))
                        (QREFELT $ 54))
                       (QREFELT $ 56))
                      . #2=(|PERM;order;$Nni;16|))
                (EXIT
                 (PROG1 (LETT #1# |ord| . #2#)
                   (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #1#)))))) 

(SDEFUN |PERM;sign;$I;17| ((|p| $) ($ |Integer|))
        (COND ((SPADCALL |p| (QREFELT $ 58)) 1) ('T -1))) 

(SDEFUN |PERM;even?;$B;18| ((|p| $) ($ |Boolean|))
        (SPADCALL
         (- (LENGTH (SPADCALL |p| 1 (QREFELT $ 26)))
            (SPADCALL |p| (QREFELT $ 60)))
         (QREFELT $ 61))) 

(SDEFUN |PERM;odd?;$B;19| ((|p| $) ($ |Boolean|))
        (ODDP
         (- (LENGTH (SPADCALL |p| 1 (QREFELT $ 26)))
            (SPADCALL |p| (QREFELT $ 60))))) 

(SDEFUN |PERM;<;2$B;20| ((|pa| $) (|pb| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G837 NIL) (#2=#:G838 NIL) (#3=#:G839 NIL) (|i| NIL)
          (#4=#:G840 NIL) (|j| NIL) (|pbcyc| #5=(|List| (|List| S)))
          (|pacyc| #5#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |pacyc| (|PERM;coerceToCycle| |pa| 'T $)
                  . #6=(|PERM;<;2$B;20|))
            (LETT |pbcyc| (|PERM;coerceToCycle| |pb| 'T $) . #6#)
            (SEQ
             (EXIT
              (SEQ (LETT |j| NIL . #6#) (LETT #4# |pbcyc| . #6#)
                   (LETT |i| NIL . #6#) (LETT #3# |pacyc| . #6#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #6#) NIL)
                         (ATOM #4#) (PROGN (LETT |j| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |i| |j| (QREFELT $ 25))
                       (PROGN
                        (LETT #1#
                              (PROGN
                               (LETT #2# (|PERM;smallerCycle?| |i| |j| $)
                                     . #6#)
                               (GO #7=#:G836))
                              . #6#)
                        (GO #8=#:G834))))))
                   (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT NIL)))
             #8# (EXIT #1#))
            (EXIT
             (< (SPADCALL |pacyc| (QREFELT $ 63))
                (SPADCALL |pbcyc| (QREFELT $ 63))))))
          #7# (EXIT #2#)))) 

(SDEFUN |PERM;coerce;L$;21| ((|lls| |List| (|List| S)) ($ $))
        (|PERM;coerceCycle| |lls| $)) 

(SDEFUN |PERM;coerce;L$;22| ((|ls| |List| S) ($ $))
        (SPADCALL |ls| (QREFELT $ 21))) 

(SDEFUN |PERM;sort;2L;23| ((|inList| |List| $) ($ |List| $))
        (SPROG
         ((|outList| (|List| $)) (#1=#:G853 NIL) (|rec| NIL)
          (|ownList|
           (|List|
            (|Record| (|:| |cycl| (|List| (|List| S))) (|:| |permut| $))))
          (#2=#:G852 NIL) (|sigma| NIL))
         (SEQ
          (COND
           ((NULL (|HasCategory| (QREFELT $ 6) '(|OrderedSet|)))
            (COND
             ((NULL (|HasCategory| (QREFELT $ 6) '(|Finite|)))
              (EXIT |inList|)))))
          (LETT |ownList| NIL . #3=(|PERM;sort;2L;23|))
          (SEQ (LETT |sigma| NIL . #3#) (LETT #2# |inList| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |sigma| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |ownList|
                       (SPADCALL
                        (CONS (|PERM;coerceToCycle| |sigma| 'T $) |sigma|)
                        |ownList| (QREFELT $ 69))
                       . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |ownList|
                (SPADCALL (CONS (|function| |PERM;permord|) $) |ownList|
                          (QREFELT $ 71))
                . #3#)
          (LETT |outList| NIL . #3#)
          (SEQ (LETT |rec| NIL . #3#) (LETT #1# |ownList| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |outList|
                       (SPADCALL (QCDR |rec|) |outList| (QREFELT $ 73))
                       . #3#)))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |outList| (QREFELT $ 74)))))) 

(SDEFUN |PERM;coerce;$Of;24| ((|p| $) ($ |OutputForm|))
        (SPROG
         ((|outfmL| (|List| (|OutputForm|)))
          (|outcycL| (|List| (|OutputForm|))) (#1=#:G861 NIL) (|elt| NIL)
          (#2=#:G860 NIL) (|cycle| NIL) (|cycles| (|List| (|List| S))))
         (SEQ
          (LETT |cycles| (|PERM;coerceToCycle| |p| 'T $)
                . #3=(|PERM;coerce;$Of;24|))
          (LETT |outfmL| NIL . #3#)
          (SEQ (LETT |cycle| NIL . #3#) (LETT #2# |cycles| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |cycle| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |outcycL| NIL . #3#)
                    (SEQ (LETT |elt| NIL . #3#) (LETT #1# |cycle| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |elt| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |outcycL|
                                 (CONS (SPADCALL |elt| (QREFELT $ 77))
                                       |outcycL|)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |outfmL|
                           (CONS
                            (SPADCALL
                             (SPADCALL (REVERSE |outcycL|) (QREFELT $ 78))
                             (QREFELT $ 79))
                            |outfmL|)
                           . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND ((NULL |outfmL|) (SPADCALL 1 (QREFELT $ 80)))
                 ((NULL (CDR |outfmL|)) (|SPADfirst| |outfmL|))
                 ('T (SPADCALL (REVERSE |outfmL|) (QREFELT $ 81)))))))) 

(SDEFUN |PERM;cycles;L$;25| ((|vs| |List| (|List| S)) ($ $))
        (|PERM;coerceCycle| |vs| $)) 

(SDEFUN |PERM;cycle;L$;26| ((|ls| |List| S) ($ $))
        (COND ((< (LENGTH |ls|) 2) (|spadConstant| $ 16))
              ((|PERM;duplicates?| |ls| $)
               (|error| "cycle: the input contains duplicates"))
              ('T
               (VECTOR |ls|
                       (SPADCALL (CDR |ls|)
                                 (SPADCALL (|SPADfirst| |ls|) (QREFELT $ 27))
                                 (QREFELT $ 84)))))) 

(SDEFUN |PERM;coerceListOfPairs;L$;27| ((|loP| |List| (|List| S)) ($ $))
        (SPROG
         ((|im| (|List| S)) (|preim| (|List| S)) (#1=#:G874 NIL) (|pair| NIL))
         (SEQ (LETT |preim| NIL . #2=(|PERM;coerceListOfPairs;L$;27|))
              (LETT |im| NIL . #2#)
              (SEQ (LETT |pair| NIL . #2#) (LETT #1# |loP| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |pair| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (|SPADfirst| |pair|)
                                 (SPADCALL |pair| (QREFELT $ 85))
                                 (QREFELT $ 24))
                       (SEQ
                        (LETT |preim| (CONS (|SPADfirst| |pair|) |preim|)
                              . #2#)
                        (EXIT
                         (LETT |im|
                               (CONS (SPADCALL |pair| (QREFELT $ 85)) |im|)
                               . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (COND
               ((OR (|PERM;duplicates?| |preim| $)
                    (OR (|PERM;duplicates?| |im| $)
                        (SPADCALL (SPADCALL |preim| (QREFELT $ 45))
                                  (SPADCALL |im| (QREFELT $ 45))
                                  (QREFELT $ 86))))
                (EXIT
                 (|error|
                  "coerceListOfPairs: the input cannot be interpreted as a permutation"))))
              (EXIT (VECTOR |preim| |im|))))) 

(SDEFUN |PERM;*;3$;28| ((|q| $) (|p| $) ($ $))
        (SPROG
         ((|imOfq| #1=(|List| S)) (|preimOfq| #1#) (|imOfqp| (|List| S))
          (|preimOfqp| (|List| S)) (|el| (S)) (|j| (|Integer|)) (#2=#:G885 NIL)
          (|i| NIL) (|imOfp| #3=(|Vector| S)) (|preimOfp| #3#))
         (SEQ
          (LETT |preimOfp|
                (SPADCALL (SPADCALL |p| 1 (QREFELT $ 26)) (QREFELT $ 89))
                . #4=(|PERM;*;3$;28|))
          (LETT |imOfp|
                (SPADCALL (SPADCALL |p| 2 (QREFELT $ 26)) (QREFELT $ 89))
                . #4#)
          (LETT |preimOfq| (SPADCALL |q| 1 (QREFELT $ 26)) . #4#)
          (LETT |imOfq| (SPADCALL |q| 2 (QREFELT $ 26)) . #4#)
          (LETT |preimOfqp| NIL . #4#) (LETT |imOfqp| NIL . #4#)
          (SEQ (LETT |i| 1 . #4#) (LETT #2# (QVSIZE |preimOfp|) . #4#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (LETT |j|
                      (SPADCALL (SPADCALL |imOfp| |i| (QREFELT $ 90))
                                |preimOfq| (QREFELT $ 28))
                      . #4#)
                (EXIT
                 (COND
                  ((EQL |j| 0)
                   (SEQ
                    (LETT |preimOfqp|
                          (CONS (SPADCALL |preimOfp| |i| (QREFELT $ 90))
                                |preimOfqp|)
                          . #4#)
                    (EXIT
                     (LETT |imOfqp|
                           (CONS (SPADCALL |imOfp| |i| (QREFELT $ 90))
                                 |imOfqp|)
                           . #4#))))
                  ('T
                   (SEQ (LETT |el| (SPADCALL |imOfq| |j| (QREFELT $ 15)) . #4#)
                        (COND
                         ((SPADCALL |el|
                                    (SPADCALL |preimOfp| |i| (QREFELT $ 90))
                                    (QREFELT $ 24))
                          (SEQ
                           (LETT |preimOfqp|
                                 (CONS (SPADCALL |preimOfp| |i| (QREFELT $ 90))
                                       |preimOfqp|)
                                 . #4#)
                           (EXIT (LETT |imOfqp| (CONS |el| |imOfqp|) . #4#)))))
                        (LETT |preimOfq|
                              (SPADCALL |preimOfq| |j| (QREFELT $ 29)) . #4#)
                        (EXIT
                         (LETT |imOfq| (SPADCALL |imOfq| |j| (QREFELT $ 29))
                               . #4#)))))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (VECTOR (SPADCALL |preimOfqp| |preimOfq| (QREFELT $ 84))
                   (SPADCALL |imOfqp| |imOfq| (QREFELT $ 84))))))) 

(PUT '|PERM;One;$;29| '|SPADreplace| '(XLAM NIL (MAKEARR1 2 NIL))) 

(SDEFUN |PERM;One;$;29| (($ $)) (MAKEARR1 2 NIL)) 

(SDEFUN |PERM;inv;2$;30| ((|p| $) ($ $))
        (VECTOR (SPADCALL |p| 2 (QREFELT $ 26))
                (SPADCALL |p| 1 (QREFELT $ 26)))) 

(SDEFUN |PERM;eval;$2S;31| ((|p| $) (|el| S) ($ S))
        (SPROG ((|pos| (|Integer|)))
               (SEQ
                (LETT |pos|
                      (SPADCALL |el| (SPADCALL |p| 1 (QREFELT $ 26))
                                (QREFELT $ 28))
                      |PERM;eval;$2S;31|)
                (EXIT
                 (COND ((EQL |pos| 0) |el|)
                       ('T
                        (SPADCALL (SPADCALL |p| 2 (QREFELT $ 26)) |pos|
                                  (QREFELT $ 15)))))))) 

(SDEFUN |PERM;elt;$2S;32| ((|p| $) (|el| S) ($ S))
        (SPADCALL |p| |el| (QREFELT $ 46))) 

(SDEFUN |PERM;numberOfCycles;$Nni;33| ((|p| $) ($ |NonNegativeInteger|))
        (LENGTH (|PERM;coerceToCycle| |p| NIL $))) 

(SDEFUN |PERM;coerceImages;L$;34| ((|image| |List| S) ($ $))
        (SPROG
         ((|preImage| (|List| S)) (#1=#:G896 NIL) (|i| NIL) (#2=#:G895 NIL))
         (SEQ
          (LETT |preImage|
                (PROGN
                 (LETT #2# NIL . #3=(|PERM;coerceImages;L$;34|))
                 (SEQ (LETT |i| 1 . #3#)
                      (LETT #1# (SPADCALL |image| (QREFELT $ 14)) . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |i| (QREFELT $ 93)) #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (SPADCALL (LIST |preImage| |image|) (QREFELT $ 38)))))) 

(SDEFUN |PERM;coerceImages;L$;35| ((|image| |List| S) ($ $))
        (SPROG
         ((|preImage| (|List| S)) (#1=#:G898 NIL) (#2=#:G903 NIL) (|i| NIL)
          (#3=#:G902 NIL))
         (SEQ
          (LETT |preImage|
                (PROGN
                 (LETT #3# NIL . #4=(|PERM;coerceImages;L$;35|))
                 (SEQ (LETT |i| 1 . #4#)
                      (LETT #2# (SPADCALL |image| (QREFELT $ 14)) . #4#) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #1# |i| . #4#)
                                  (|check_subtype2| (> #1# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #1#))
                                (QREFELT $ 95))
                               #3#)
                              . #4#)))
                      (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (EXIT (SPADCALL (LIST |preImage| |image|) (QREFELT $ 38)))))) 

(SDEFUN |PERM;fixedPoints;$S;36| ((|p| $) ($ |Set| S))
        (SPADCALL (SPADCALL |p| (QREFELT $ 41)) (QREFELT $ 96))) 

(SDEFUN |PERM;cyclePartition;$P;37| ((|p| $) ($ |Partition|))
        (SPROG ((|pt| (|Partition|)) (#1=#:G909 NIL) (|c| NIL) (#2=#:G908 NIL))
               (SEQ
                (LETT |pt|
                      (SPADCALL
                       (PROGN
                        (LETT #2# NIL . #3=(|PERM;cyclePartition;$P;37|))
                        (SEQ (LETT |c| NIL . #3#)
                             (LETT #1# (|PERM;coerceToCycle| |p| NIL $) . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT (LETT #2# (CONS (LENGTH |c|) #2#) . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT $ 51))
                      . #3#)
                (EXIT
                 (SPADCALL |pt|
                           (SPADCALL
                            (SPADCALL
                             (LIST
                              (SPADCALL (SPADCALL |p| (QREFELT $ 97))
                                        (QREFELT $ 42)))
                             (QREFELT $ 51))
                            (QREFELT $ 98))
                           (QREFELT $ 99)))))) 

(DECLAIM (NOTINLINE |Permutation;|)) 

(DEFUN |Permutation| (#1=#:G914)
  (SPROG NIL
         (PROG (#2=#:G915)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Permutation|)
                                               '|domainEqualList|)
                    . #3=(|Permutation|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Permutation;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|Permutation|)))))))))) 

(DEFUN |Permutation;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G913 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|Permutation|))
          (LETT |dv$| (LIST '|Permutation| DV$1) . #2#)
          (LETT $ (GETREFV 104) . #2#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (LETT #1#
                                                    (|HasCategory| |#1|
                                                                   '(|Finite|))
                                                    . #2#)
                                              (OR #1#
                                                  (|HasCategory| |#1|
                                                                 '(|OrderedSet|)))
                                              (OR #1#
                                                  (|HasCategory| |#1|
                                                                 '(|IntegerNumberSystem|)))))
                          . #2#))
          (|haddProp| |$ConstructorCache| '|Permutation| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|Vector| (|List| |#1|)))
          (COND
           ((|HasCategory| |#1| '(|IntegerNumberSystem|))
            (QSETREFV $ 94
                      (CONS (|dispatchFunction| |PERM;coerceImages;L$;34|)
                            $))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 94
                       (CONS (|dispatchFunction| |PERM;coerceImages;L$;35|) $))
             (QSETREFV $ 97
                       (CONS (|dispatchFunction| |PERM;fixedPoints;$S;36|) $))
             (QSETREFV $ 52
                       (CONS (|dispatchFunction| |PERM;cyclePartition;$P;37|)
                             $)))))
          $))) 

(MAKEPROP '|Permutation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|) (0 . <)
              (|PositiveInteger|) (6 . |lookup|) (|Integer|) (|List| 6)
              (11 . |maxIndex|) (16 . |elt|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |PERM;One;$;29|) $))
              (|NonNegativeInteger|) (22 . |last|) (28 . |first|)
              (34 . |concat|) |PERM;cycle;L$;26| |PERM;*;3$;28| (40 . ~=)
              (46 . ~=) (52 . ~=) (58 . |elt|) (64 . |list|) (69 . |position|)
              (75 . |delete|) (|Mapping| 8 13 13) (|List| 13) (81 . |sort|)
              (87 . |copy|) (92 . |member?|)
              (|Record| (|:| |preimage| 13) (|:| |image| 13))
              |PERM;listRepresentation;$R;9| (98 . |elt|)
              |PERM;coercePreimagesImages;L$;10| (|Set| 6) (104 . |construct|)
              |PERM;movedPoints;$S;11| (109 . |#|) |PERM;degree;$Nni;12|
              |PERM;=;2$B;13| (114 . |set|) |PERM;eval;$2S;31|
              (119 . |insert!|) |PERM;orbit;$SS;14| (|List| 12) (|Partition|)
              (125 . |partition|) |PERM;cyclePartition;$P;15| (130 . |convert|)
              (135 . |removeDuplicates|) (|List| $) (140 . |lcm|)
              |PERM;order;$Nni;16| |PERM;even?;$B;18| |PERM;sign;$I;17|
              |PERM;numberOfCycles;$Nni;33| (145 . |even?|) |PERM;odd?;$B;19|
              (150 . |maxIndex|) |PERM;<;2$B;20| |PERM;coerce;L$;21|
              |PERM;coerce;L$;22| (|Record| (|:| |cycl| 31) (|:| |permut| $$))
              (|List| 67) (155 . |cons|) (|Mapping| 8 67 67) (161 . |sort|)
              (|List| $$) (167 . |cons|) (173 . |reverse|) |PERM;sort;2L;23|
              (|OutputForm|) (178 . |coerce|) (183 . |blankSeparate|)
              (188 . |paren|) (193 . |outputForm|) (198 . |hconcat|)
              |PERM;coerce;$Of;24| |PERM;cycles;L$;25| (203 . |append|)
              (209 . |second|) (214 . ~=) |PERM;coerceListOfPairs;L$;27|
              (|Vector| 6) (220 . |construct|) (225 . |elt|) |PERM;inv;2$;30|
              |PERM;elt;$2S;32| (231 . |coerce|) (236 . |coerceImages|)
              (241 . |index|) (246 . |complement|) (251 . |fixedPoints|)
              (256 . |conjugate|) (261 . +) (|Union| $ '"failed") (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 267 |sort| 273 |smaller?| 278 |sign| 284 |sample| 289
              |rightRecip| 293 |rightPower| 298 |recip| 310 |order| 315 |orbit|
              320 |one?| 326 |odd?| 331 |numberOfCycles| 336 |movedPoints| 341
              |min| 346 |max| 352 |listRepresentation| 358 |leftRecip| 363
              |leftPower| 368 |latex| 380 |inv| 385 |hashUpdate!| 390 |hash|
              396 |fixedPoints| 401 |even?| 406 |eval| 411 |elt| 417 |degree|
              423 |cycles| 428 |cyclePartition| 433 |cycle| 438 |conjugate| 443
              |commutator| 449 |coercePreimagesImages| 455 |coerceListOfPairs|
              460 |coerceImages| 465 |coerce| 470 ^ 485 |One| 503 >= 507 > 513
              = 519 <= 525 < 531 / 537 * 543)
           'NIL
           (CONS (|makeByteWordVec2| 2 '(0 0 0 0 0 2 0 2 0 0 0 0 2))
                 (CONS
                  '#(NIL |Group&| NIL NIL |MagmaWithUnit&| |OrderedSet&|
                     |Magma&| NIL |SetCategory&| NIL |BasicType&| NIL
                     |PartialOrder&|)
                  (CONS
                   '#((|PermutationCategory| 6) (|Group|) (|Monoid|)
                      (|SemiGroup|) (|MagmaWithUnit|) (|OrderedSet|) (|Magma|)
                      (|Comparable|) (|SetCategory|) (|unitsKnown|)
                      (|BasicType|) (|CoercibleTo| 76) (|PartialOrder|))
                   (|makeByteWordVec2| 103
                                       '(2 6 8 0 0 9 1 6 10 0 11 1 13 12 0 14 2
                                         13 6 0 12 15 2 13 0 0 17 18 2 13 0 0
                                         17 19 2 13 0 0 0 20 2 12 8 0 0 23 2 6
                                         8 0 0 24 2 13 8 0 0 25 2 7 13 0 12 26
                                         1 13 0 6 27 2 13 12 6 0 28 2 13 0 0 12
                                         29 2 31 0 30 0 32 1 13 0 0 33 2 13 8 6
                                         0 34 2 31 13 0 12 37 1 39 0 13 40 1 39
                                         17 0 42 1 39 0 13 45 2 39 0 6 0 47 1
                                         50 0 49 51 1 50 49 0 53 1 49 0 0 54 1
                                         12 0 55 56 1 12 8 0 61 1 31 12 0 63 2
                                         68 0 67 0 69 2 68 0 70 0 71 2 72 0 2 0
                                         73 1 72 0 0 74 1 6 76 0 77 1 76 0 55
                                         78 1 76 0 0 79 1 76 0 12 80 1 76 0 55
                                         81 2 13 0 0 0 84 1 13 6 0 85 2 39 8 0
                                         0 86 1 88 0 13 89 2 88 6 0 12 90 1 6 0
                                         12 93 1 0 0 13 94 1 6 0 10 95 1 39 0 0
                                         96 1 0 39 0 97 1 50 0 0 98 2 50 0 0 0
                                         99 2 0 8 0 0 1 1 0 55 55 75 2 2 8 0 0
                                         1 1 0 12 0 59 0 0 0 1 1 0 100 0 1 2 0
                                         0 0 17 1 2 0 0 0 10 1 1 0 100 0 1 1 0
                                         17 0 57 2 0 39 0 6 48 1 0 8 0 1 1 0 8
                                         0 62 1 0 17 0 60 1 0 39 0 41 2 2 0 0 0
                                         1 2 2 0 0 0 1 1 0 35 0 36 1 0 100 0 1
                                         2 0 0 0 17 1 2 0 0 0 10 1 1 0 102 0 1
                                         1 0 0 0 91 2 0 101 101 0 1 1 0 103 0 1
                                         1 1 39 0 97 1 0 8 0 58 2 0 6 0 6 46 2
                                         0 6 0 6 92 1 0 17 0 43 1 0 0 31 83 1 0
                                         50 0 52 1 0 0 13 21 2 0 0 0 0 1 2 0 0
                                         0 0 1 1 0 0 31 38 1 0 0 31 87 1 3 0 13
                                         94 1 0 0 13 66 1 0 0 31 65 1 0 76 0 82
                                         2 0 0 0 12 1 2 0 0 0 17 1 2 0 0 0 10 1
                                         0 0 0 16 2 2 8 0 0 1 2 2 8 0 0 1 2 0 8
                                         0 0 44 2 2 8 0 0 1 2 0 8 0 0 64 2 0 0
                                         0 0 1 2 0 0 0 0 22)))))
           '|lookupComplete|)) 
