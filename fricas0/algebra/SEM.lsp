
(SDEFUN |SEM;greater|
        ((|r1| |Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))
         (|r2| |Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))
         ($ |Boolean|))
        (COND ((NULL (QCAR |r1|)) NIL) ((NULL (QCAR |r2|)) 'T)
              ('T
               (SPADCALL (|SPADfirst| (QCAR |r2|)) (|SPADfirst| (QCAR |r1|))
                         (QREFELT $ 19))))) 

(PUT '|SEM;ncols;$Nni;2| '|SPADreplace| '(XLAM (A) (QVELT A 0))) 

(SDEFUN |SEM;ncols;$Nni;2| ((A $) ($ |NonNegativeInteger|)) (QVELT A 0)) 

(PUT '|SEM;nrows;$Nni;3| '|SPADreplace| '(XLAM (A) (QVELT A 1))) 

(SDEFUN |SEM;nrows;$Nni;3| ((A $) ($ |NonNegativeInteger|)) (QVELT A 1)) 

(SDEFUN |SEM;allIndices;$L;4| ((A $) ($ |List| C))
        (SPADCALL (QVELT A 2) (QREFELT $ 25))) 

(SDEFUN |SEM;row;$IR;5|
        ((A $) (|i| |Integer|)
         ($ |Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
        (QAREF1O (QVELT A 3) |i| 1)) 

(SDEFUN |SEM;setRow!;$IRV;6|
        ((A $) (|i| |Integer|)
         (|r| |Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))
         ($ |Void|))
        (SEQ (QSETAREF1O (QVELT A 3) |i| |r| 1)
             (EXIT (SPADCALL (QREFELT $ 30))))) 

(SDEFUN |SEM;setRow!;$ILLV;7|
        ((A $) (|i| |Integer|) (|inds| |List| C) (|ents| |List| D) ($ |Void|))
        (SEQ (QSETAREF1O (QVELT A 3) |i| (CONS |inds| |ents|) 1)
             (EXIT (SPADCALL (QREFELT $ 30))))) 

(SDEFUN |SEM;new;LI$;8| ((|inds| |List| C) (|n| |Integer|) ($ $))
        (SPROG
         ((#1=#:G789 NIL) (#2=#:G791 NIL) (|i| NIL) (#3=#:G790 NIL)
          (#4=#:G786 NIL))
         (SEQ
          (VECTOR (LENGTH |inds|)
                  (PROG1 (LETT #4# |n| . #5=(|SEM;new;LI$;8|))
                    (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #4#))
                  |inds|
                  (PROGN
                   (LETT #3# (GETREFV |n|) . #5#)
                   (SEQ (LETT |i| 1 . #5#) (LETT #2# |n| . #5#)
                        (LETT #1# 0 . #5#) G190
                        (COND ((|greater_SI| |i| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT #3# #1#
                                  (CONS (CAR (QREFELT $ 14))
                                        (CDR (QREFELT $ 14))))))
                        (LETT #1#
                              (PROG1 (|inc_SI| #1#)
                                (LETT |i| (|inc_SI| |i|) . #5#))
                              . #5#)
                        (GO G190) G191 (EXIT NIL))
                   #3#))))) 

(SDEFUN |SEM;elt;$ICD;9| ((A $) (|i| |Integer|) (|c| C) ($ D))
        (SPROG
         ((|pos| (|Integer|))
          (|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
         (SEQ
          (LETT |r| (SPADCALL A |i| (QREFELT $ 28)) . #1=(|SEM;elt;$ICD;9|))
          (LETT |pos| (SPADCALL |c| (QCAR |r|) (QREFELT $ 35)) . #1#)
          (EXIT
           (COND ((< |pos| (QREFELT $ 11)) (|spadConstant| $ 36))
                 ('T (SPADCALL (QCDR |r|) |pos| (QREFELT $ 37)))))))) 

(SDEFUN |SEM;setelt!;$ICDV;10|
        ((A $) (|i| |Integer|) (|c| C) (|d| D) ($ |Void|))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G799 NIL) (|ind| NIL) (|pos| (|Integer|))
          (|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
         (SEQ
          (LETT |r| (SPADCALL A |i| (QREFELT $ 28))
                . #2=(|SEM;setelt!;$ICDV;10|))
          (LETT |pos| (SPADCALL |c| (QCAR |r|) (QREFELT $ 35)) . #2#)
          (COND
           ((>= |pos| (QREFELT $ 11))
            (SPADCALL (QCDR |r|) |pos| |d| (QREFELT $ 39)))
           ('T
            (SEQ (LETT |j| (QREFELT $ 11) . #2#)
                 (SEQ (LETT |ind| NIL . #2#) (LETT #1# (QCAR |r|) . #2#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ind| (CAR #1#) . #2#) NIL)
                            (NULL (SPADCALL |c| |ind| (QREFELT $ 19))))
                        (GO G191)))
                      (SEQ (EXIT (LETT |j| (+ |j| 1) . #2#)))
                      (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                 (PROGN
                  (RPLACA |r| (SPADCALL |c| (QCAR |r|) |j| (QREFELT $ 40)))
                  (QCAR |r|))
                 (EXIT
                  (PROGN
                   (RPLACD |r| (SPADCALL |d| (QCDR |r|) |j| (QREFELT $ 41)))
                   (QCDR |r|))))))
          (QSETAREF1O (QVELT A 3) |i| |r| 1) (EXIT (SPADCALL (QREFELT $ 30)))))) 

(SDEFUN |SEM;coerce;$M;11| ((A $) ($ |Matrix| D))
        (SPROG
         ((|ents| (|List| D)) (|inds| (|List| C)) (#1=#:G812 NIL) (|ind| NIL)
          (|j| NIL) (#2=#:G811 NIL) (|r| NIL) (|i| NIL) (AA (|Matrix| D)))
         (SEQ
          (COND
           ((ZEROP (QVELT A 0))
            (|error| "cannot coerce matrix with zero columns"))
           ('T
            (SEQ
             (LETT AA
                   (MAKE_MATRIX1 (QVELT A 1) (QVELT A 0) (|spadConstant| $ 36))
                   . #3=(|SEM;coerce;$M;11|))
             (SEQ (LETT |i| 1 . #3#) (LETT |r| NIL . #3#)
                  (LETT #2# (SPADCALL (QVELT A 3) (QREFELT $ 45)) . #3#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |r| (CAR #2#) . #3#) NIL))
                    (GO G191)))
                  (SEQ (LETT |inds| (QCAR |r|) . #3#)
                       (LETT |ents| (QCDR |r|) . #3#)
                       (EXIT
                        (SEQ (LETT |j| 1 . #3#) (LETT |ind| NIL . #3#)
                             (LETT #1# (QVELT A 2) . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |ind| (CAR #1#) . #3#) NIL)
                                   (NULL (NULL (NULL |inds|))))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |ind| (|SPADfirst| |inds|)
                                           (QREFELT $ 46))
                                 (SEQ
                                  (QSETAREF2O AA |i| |j| (|SPADfirst| |ents|) 1
                                              1)
                                  (LETT |inds| (CDR |inds|) . #3#)
                                  (EXIT (LETT |ents| (CDR |ents|) . #3#)))))))
                             (LETT #1#
                                   (PROG1 (CDR #1#)
                                     (LETT |j| (|inc_SI| |j|) . #3#))
                                   . #3#)
                             (GO G190) G191 (EXIT NIL))))
                  (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #3#))
                        . #3#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT AA))))))) 

(SDEFUN |SEM;coerce;$Of;12| ((A $) ($ |OutputForm|))
        (COND
         ((ZEROP (QVELT A 0)) (SPADCALL (|spadConstant| $ 36) (QREFELT $ 50)))
         ('T (SPADCALL (SPADCALL A (QREFELT $ 48)) (QREFELT $ 51))))) 

(SDEFUN |SEM;copy;2$;13| ((A $) ($ $))
        (SPROG
         ((|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (#1=#:G820 NIL) (|l| NIL)
          (|resRows|
           (|Vector|
            (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))))
         (SEQ
          (LETT |resRows| (MAKEARR1 (QVELT A 1) (QREFELT $ 14))
                . #2=(|SEM;copy;2$;13|))
          (SEQ (LETT |l| 1 . #2#) (LETT #1# (QVELT A 1) . #2#) G190
               (COND ((|greater_SI| |l| #1#) (GO G191)))
               (SEQ (LETT |r| (QAREF1O (QVELT A 3) |l| 1) . #2#)
                    (EXIT
                     (QSETAREF1O |resRows| |l|
                                 (CONS (SPADCALL (QCAR |r|) (QREFELT $ 25))
                                       (SPADCALL (QCDR |r|) (QREFELT $ 53)))
                                 1)))
               (LETT |l| (|inc_SI| |l|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (VECTOR (QVELT A 0) (QVELT A 1)
                   (SPADCALL (QVELT A 2) (QREFELT $ 25)) |resRows|))))) 

(SDEFUN |SEM;elimZeroCols!;$V;14| ((A $) ($ |Void|))
        (SPROG ((|newInds| (|List| C)) (#1=#:G825 NIL) (|r| NIL))
               (SEQ (LETT |newInds| NIL . #2=(|SEM;elimZeroCols!;$V;14|))
                    (SEQ (LETT |r| NIL . #2#)
                         (LETT #1# (SPADCALL (QVELT A 3) (QREFELT $ 45)) . #2#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |r| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |newInds|
                                 (SPADCALL
                                  (SPADCALL
                                   (CONS #'|SEM;elimZeroCols!;$V;14!0| $)
                                   |newInds| (QCAR |r|) (QREFELT $ 56))
                                  (QREFELT $ 57))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (QSETVELT A 2 |newInds|) (EXIT (SPADCALL (QREFELT $ 30)))))) 

(SDEFUN |SEM;elimZeroCols!;$V;14!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL |y| |x| (QREFELT $ 19))) 

(SDEFUN |SEM;purge!;$MV;15| ((A $) (|crit| |Mapping| (|Boolean|) C) ($ |Void|))
        (SPROG
         ((|newEnts| (|List| D)) (|newInds| (|List| C)) (#1=#:G841 NIL)
          (|c| NIL) (#2=#:G842 NIL) (|e| NIL)
          (|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (#3=#:G840 NIL) (|l| NIL) (#4=#:G839 NIL))
         (SEQ (LETT |newInds| NIL . #5=(|SEM;purge!;$MV;15|))
              (SEQ (LETT |c| NIL . #5#) (LETT #4# (QVELT A 2) . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |c| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |c| |crit|))
                       (LETT |newInds| (CONS |c| |newInds|) . #5#)))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |newInds| (NREVERSE |newInds|) . #5#)
              (COND
               ((SPADCALL (LENGTH |newInds|) (LENGTH (QVELT A 2))
                          (QREFELT $ 59))
                (SEQ (QSETVELT A 2 |newInds|)
                     (EXIT
                      (SEQ (LETT |l| 1 . #5#) (LETT #3# (QVELT A 1) . #5#) G190
                           (COND ((|greater_SI| |l| #3#) (GO G191)))
                           (SEQ (LETT |r| (QAREF1O (QVELT A 3) |l| 1) . #5#)
                                (LETT |newInds| NIL . #5#)
                                (LETT |newEnts| NIL . #5#)
                                (SEQ (LETT |e| NIL . #5#)
                                     (LETT #2# (QCDR |r|) . #5#)
                                     (LETT |c| NIL . #5#)
                                     (LETT #1# (QCAR |r|) . #5#) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |c| (CAR #1#) . #5#)
                                            NIL)
                                           (ATOM #2#)
                                           (PROGN
                                            (LETT |e| (CAR #2#) . #5#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((NULL (SPADCALL |c| |crit|))
                                         (SEQ
                                          (LETT |newInds| (CONS |c| |newInds|)
                                                . #5#)
                                          (EXIT
                                           (LETT |newEnts| (CONS |e| |newEnts|)
                                                 . #5#)))))))
                                     (LETT #1#
                                           (PROG1 (CDR #1#)
                                             (LETT #2# (CDR #2#) . #5#))
                                           . #5#)
                                     (GO G190) G191 (EXIT NIL))
                                (EXIT
                                 (QSETAREF1O (QVELT A 3) |l|
                                             (CONS (NREVERSE |newInds|)
                                                   (NREVERSE |newEnts|))
                                             1)))
                           (LETT |l| (|inc_SI| |l|) . #5#) (GO G190) G191
                           (EXIT NIL))))))
              (EXIT (SPADCALL (QREFELT $ 30)))))) 

(SDEFUN |SEM;sortedPurge!;$MV;16|
        ((A $) (|crit| |Mapping| (|Boolean|) C) ($ |Void|))
        (SPROG
         ((|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (#1=#:G855 NIL) (|l| NIL))
         (SEQ
          (COND
           ((SPADCALL (|SPADfirst| (QVELT A 2)) |crit|)
            (SEQ
             (SEQ G190
                  (COND
                   ((NULL
                     (COND ((NULL (QVELT A 2)) NIL)
                           ('T (SPADCALL (|SPADfirst| (QVELT A 2)) |crit|))))
                    (GO G191)))
                  (SEQ (EXIT (QSETVELT A 2 (CDR (QVELT A 2))))) NIL (GO G190)
                  G191 (EXIT NIL))
             (EXIT
              (SEQ (LETT |l| 1 . #2=(|SEM;sortedPurge!;$MV;16|))
                   (LETT #1# (QVELT A 1) . #2#) G190
                   (COND ((|greater_SI| |l| #1#) (GO G191)))
                   (SEQ (LETT |r| (QAREF1O (QVELT A 3) |l| 1) . #2#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL (QCAR |r|)) NIL)
                                      ('T
                                       (SPADCALL (|SPADfirst| (QCAR |r|))
                                                 |crit|))))
                               (GO G191)))
                             (SEQ
                              (PROGN (RPLACA |r| (CDR (QCAR |r|))) (QCAR |r|))
                              (EXIT
                               (PROGN
                                (RPLACD |r| (CDR (QCDR |r|)))
                                (QCDR |r|))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (QSETAREF1O (QVELT A 3) |l| |r| 1)))
                   (LETT |l| (|inc_SI| |l|) . #2#) (GO G190) G191
                   (EXIT NIL))))))
          (EXIT (SPADCALL (QREFELT $ 30)))))) 

(SDEFUN |SEM;deleteRow!;$IV;17| ((A $) (|i| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G865 NIL) (|l| NIL) (#2=#:G864 NIL)
          (|resRows|
           (|Vector|
            (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
          (|nr| (|NonNegativeInteger|)) (#3=#:G856 NIL))
         (SEQ
          (COND ((SPADCALL |i| (QVELT A 1) (QREFELT $ 63)) A)
                ('T
                 (SEQ
                  (LETT |nr|
                        (PROG1
                            (LETT #3# (- (QVELT A 1) 1)
                                  . #4=(|SEM;deleteRow!;$IV;17|))
                          (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #3#))
                        . #4#)
                  (LETT |resRows| (MAKEARR1 |nr| (QREFELT $ 14)) . #4#)
                  (SEQ (LETT |l| 1 . #4#) (LETT #2# (- |i| 1) . #4#) G190
                       (COND ((|greater_SI| |l| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (QSETAREF1O |resRows| |l| (QAREF1O (QVELT A 3) |l| 1)
                                     1)))
                       (LETT |l| (|inc_SI| |l|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  (SEQ (LETT |l| (+ |i| 1) . #4#) (LETT #1# (QVELT A 1) . #4#)
                       G190 (COND ((> |l| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (QSETAREF1O |resRows| (- |l| 1)
                                     (QAREF1O (QVELT A 3) |l| 1) 1)))
                       (LETT |l| (+ |l| 1) . #4#) (GO G190) G191 (EXIT NIL))
                  (QSETVELT A 1 |nr|) (QSETVELT A 3 |resRows|)
                  (EXIT (SPADCALL (QREFELT $ 30))))))))) 

(SDEFUN |SEM;consRow!;$RV;18|
        ((A $)
         (|r| |Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))
         ($ |Void|))
        (SPROG
         ((|newInds| (|List| C))
          (|newRows|
           (|List|
            (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))))
         (SEQ (QSETVELT A 1 (+ (QVELT A 1) 1))
              (LETT |newRows| (CONS |r| (SPADCALL (QVELT A 3) (QREFELT $ 45)))
                    . #1=(|SEM;consRow!;$RV;18|))
              (QSETVELT A 3 (SPADCALL |newRows| (QREFELT $ 65)))
              (LETT |newInds| (SPADCALL (QCAR |r|) (QVELT A 2) (QREFELT $ 66))
                    . #1#)
              (COND
               ((NULL (NULL |newInds|))
                (QSETVELT A 2
                          (SPADCALL (CONS #'|SEM;consRow!;$RV;18!0| $)
                                    (QVELT A 2)
                                    (SPADCALL
                                     (CONS #'|SEM;consRow!;$RV;18!1| $)
                                     |newInds| (QREFELT $ 67))
                                    (QREFELT $ 68)))))
              (EXIT (SPADCALL (QREFELT $ 30)))))) 

(SDEFUN |SEM;consRow!;$RV;18!1| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL |y| |x| (QREFELT $ 19))) 

(SDEFUN |SEM;consRow!;$RV;18!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL |y| |x| (QREFELT $ 19))) 

(SDEFUN |SEM;appendRow!;$RV;19|
        ((A $)
         (|r| |Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))
         ($ |Void|))
        (SPROG
         ((|newInds| (|List| C))
          (|newRows|
           (|List|
            (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))))
         (SEQ (QSETVELT A 1 (+ (QVELT A 1) 1))
              (LETT |newRows|
                    (SPADCALL (SPADCALL (QVELT A 3) (QREFELT $ 45)) |r|
                              (QREFELT $ 70))
                    . #1=(|SEM;appendRow!;$RV;19|))
              (QSETVELT A 3 (SPADCALL |newRows| (QREFELT $ 65)))
              (LETT |newInds| (SPADCALL (QCAR |r|) (QVELT A 2) (QREFELT $ 66))
                    . #1#)
              (COND
               ((NULL (NULL |newInds|))
                (QSETVELT A 2
                          (SPADCALL (CONS #'|SEM;appendRow!;$RV;19!0| $)
                                    (QVELT A 2)
                                    (SPADCALL
                                     (CONS #'|SEM;appendRow!;$RV;19!1| $)
                                     |newInds| (QREFELT $ 67))
                                    (QREFELT $ 68)))))
              (EXIT (SPADCALL (QREFELT $ 30)))))) 

(SDEFUN |SEM;appendRow!;$RV;19!1| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL |y| |x| (QREFELT $ 19))) 

(SDEFUN |SEM;appendRow!;$RV;19!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL |y| |x| (QREFELT $ 19))) 

(SDEFUN |SEM;extract;$2I$;20| ((A $) (|i1| |Integer|) (|i2| |Integer|) ($ $))
        (SPROG
         ((|newInds| (|List| C)) (#1=#:G891 NIL) (|i| NIL)
          (|resRows|
           (|Vector|
            (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
          (|nr| (|NonNegativeInteger|)) (#2=#:G884 NIL))
         (SEQ
          (LETT |nr|
                (PROG1
                    (LETT #2# (+ (- |i2| |i1|) 1) . #3=(|SEM;extract;$2I$;20|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#))
                . #3#)
          (LETT |resRows| (MAKEARR1 |nr| (QREFELT $ 14)) . #3#)
          (LETT |newInds| NIL . #3#)
          (SEQ (LETT |i| |i1| . #3#) (LETT #1# |i2| . #3#) G190
               (COND ((> |i| #1#) (GO G191)))
               (SEQ
                (QSETAREF1O |resRows| (+ (- |i| |i1|) 1)
                            (SPADCALL A |i| (QREFELT $ 28)) 1)
                (EXIT
                 (LETT |newInds|
                       (SPADCALL
                        (SPADCALL (CONS #'|SEM;extract;$2I$;20!0| $) |newInds|
                                  (QCAR (SPADCALL A |i| (QREFELT $ 28)))
                                  (QREFELT $ 68))
                        (QREFELT $ 57))
                       . #3#)))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR (QVELT A 0) |nr| |newInds| |resRows|))))) 

(SDEFUN |SEM;extract;$2I$;20!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL |y| |x| (QREFELT $ 19))) 

(SDEFUN |SEM;join;3$;21| ((A1 $) (A2 $) ($ $))
        (SPROG
         ((#1=#:G905 NIL) (|l| NIL) (#2=#:G904 NIL)
          (|newRows|
           (|Vector|
            (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
          (|newNRows| (|NonNegativeInteger|)) (|newInds| (|List| C)))
         (SEQ
          (LETT |newInds|
                (SPADCALL
                 (SPADCALL (CONS #'|SEM;join;3$;21!0| $) (QVELT A1 2)
                           (QVELT A2 2) (QREFELT $ 68))
                 (QREFELT $ 57))
                . #3=(|SEM;join;3$;21|))
          (LETT |newNRows| (+ (QVELT A1 1) (QVELT A2 1)) . #3#)
          (LETT |newRows| (MAKEARR1 |newNRows| (QREFELT $ 14)) . #3#)
          (SEQ (LETT |l| 1 . #3#) (LETT #2# (QVELT A1 1) . #3#) G190
               (COND ((|greater_SI| |l| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1O |newRows| |l| (QAREF1O (QVELT A1 3) |l| 1) 1)))
               (LETT |l| (|inc_SI| |l|) . #3#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |l| 1 . #3#) (LETT #1# (QVELT A2 1) . #3#) G190
               (COND ((|greater_SI| |l| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1O |newRows| (+ (QVELT A1 1) |l|)
                             (QAREF1O (QVELT A2 3) |l| 1) 1)))
               (LETT |l| (|inc_SI| |l|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR (LENGTH |newInds|) |newNRows| |newInds| |newRows|))))) 

(SDEFUN |SEM;join;3$;21!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL |y| |x| (QREFELT $ 19))) 

(SDEFUN |SEM;horizJoin;3$;22| ((A1 $) (A2 $) ($ $))
        (SPROG
         ((|r2|
           #1=(|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (|r1| #1#) (#2=#:G911 NIL) (|i| NIL) (|res| ($))
          (|newInds| (|List| C)))
         (SEQ
          (COND
           ((SPADCALL (QVELT A1 1) (QVELT A2 1) (QREFELT $ 59))
            (|error| "incompatible dimensions in horizJoin"))
           ('T
            (SEQ
             (LETT |newInds|
                   (SPADCALL (QVELT A1 2) (QVELT A2 2) (QREFELT $ 74))
                   . #3=(|SEM;horizJoin;3$;22|))
             (LETT |res| (SPADCALL |newInds| (QVELT A1 1) (QREFELT $ 34))
                   . #3#)
             (SEQ (LETT |i| 1 . #3#) (LETT #2# (QVELT A1 1) . #3#) G190
                  (COND ((|greater_SI| |i| #2#) (GO G191)))
                  (SEQ (LETT |r1| (SPADCALL A1 |i| (QREFELT $ 28)) . #3#)
                       (LETT |r2| (SPADCALL A2 |i| (QREFELT $ 28)) . #3#)
                       (EXIT
                        (SPADCALL |res| |i|
                                  (SPADCALL (QCAR |r1|) (QCAR |r2|)
                                            (QREFELT $ 74))
                                  (SPADCALL (QCDR |r1|) (QCDR |r2|)
                                            (QREFELT $ 75))
                                  (QREFELT $ 33))))
                  (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
             (EXIT |res|))))))) 

(SDEFUN |SEM;horizSplit;$CR;23|
        ((A $) (|c| C) ($ |Record| (|:| |Left| $) (|:| |Right| $)))
        (SPROG
         ((|le| (|List| D)) (|li| #1=(|List| C)) (|re| (|List| D))
          (|ri| (|List| C))
          (|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (#2=#:G928 NIL) (|i| NIL) (RA ($)) (LA ($)) (|linds| #1#)
          (|rinds| (|List| C)))
         (SEQ
          (LETT |rinds| (SPADCALL A (QREFELT $ 26))
                . #3=(|SEM;horizSplit;$CR;23|))
          (LETT |linds| NIL . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (COND ((NULL |rinds|) NIL)
                        ('T
                         (SPADCALL (|SPADfirst| |rinds|) |c| (QREFELT $ 77)))))
                 (GO G191)))
               (SEQ (LETT |linds| (CONS (|SPADfirst| |rinds|) |linds|) . #3#)
                    (EXIT (LETT |rinds| (CDR |rinds|) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((NULL |linds|)
             (CONS (SPADCALL |linds| (QVELT A 1) (QREFELT $ 34)) A))
            (#4='T
             (SEQ (LETT |linds| (NREVERSE |linds|) . #3#)
                  (EXIT
                   (COND
                    ((NULL |rinds|)
                     (CONS A (SPADCALL |rinds| (QVELT A 1) (QREFELT $ 34))))
                    (#4#
                     (SEQ
                      (LETT LA (SPADCALL |linds| (QVELT A 1) (QREFELT $ 34))
                            . #3#)
                      (LETT RA (SPADCALL |rinds| (QVELT A 1) (QREFELT $ 34))
                            . #3#)
                      (SEQ (LETT |i| 1 . #3#) (LETT #2# (QVELT A 1) . #3#) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (LETT |r| (SPADCALL A |i| (QREFELT $ 28)) . #3#)
                            (LETT |ri| (QCAR |r|) . #3#)
                            (LETT |re| (QCDR |r|) . #3#) (LETT |li| NIL . #3#)
                            (LETT |le| NIL . #3#)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |ri|) NIL)
                                          ('T
                                           (SPADCALL (|SPADfirst| |ri|) |c|
                                                     (QREFELT $ 77)))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |li| (CONS (|SPADfirst| |ri|) |li|)
                                        . #3#)
                                  (LETT |le| (CONS (|SPADfirst| |re|) |le|)
                                        . #3#)
                                  (LETT |ri| (CDR |ri|) . #3#)
                                  (EXIT (LETT |re| (CDR |re|) . #3#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (COND
                             ((NULL (NULL |li|))
                              (SEQ (LETT |li| (NREVERSE |li|) . #3#)
                                   (LETT |le| (NREVERSE |le|) . #3#)
                                   (EXIT
                                    (SPADCALL LA |i| |li| |le|
                                              (QREFELT $ 33))))))
                            (EXIT
                             (COND
                              ((NULL (NULL |ri|))
                               (SPADCALL RA |i| |ri| |re| (QREFELT $ 33))))))
                           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (CONS LA RA))))))))))))) 

(SDEFUN |SEM;addRows|
        ((|d1| D)
         (|r1| |Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))
         (|d2| D)
         (|r2| |Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))
         ($ |Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
        (SPROG
         ((|resE| (|List| D)) (|resI| (|List| C)) (|lent2| (|List| D))
          (|lind2| (|List| C)) (|sum| (D)) (#1=#:G967 NIL) (|c1| NIL)
          (#2=#:G968 NIL) (|e1| NIL) (#3=#:G966 NIL) (|e2| NIL) (#4=#:G965 NIL)
          (|lent1| (|List| D)) (#5=#:G964 NIL) (#6=#:G963 NIL) (#7=#:G962 NIL)
          (#8=#:G961 NIL) (#9=#:G960 NIL) (#10=#:G959 NIL))
         (SEQ
          (COND
           ((NULL (QCAR |r1|))
            (COND ((SPADCALL |d2| (QREFELT $ 80)) |r2|)
                  (#11='T
                   (CONS (QCAR |r2|)
                         (PROGN
                          (LETT #10# NIL . #12=(|SEM;addRows|))
                          (SEQ (LETT |e2| NIL . #12#)
                               (LETT #9# (QCDR |r2|) . #12#) G190
                               (COND
                                ((OR (ATOM #9#)
                                     (PROGN (LETT |e2| (CAR #9#) . #12#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #10#
                                       (CONS
                                        (SPADCALL |d2| |e2| (QREFELT $ 81))
                                        #10#)
                                       . #12#)))
                               (LETT #9# (CDR #9#) . #12#) (GO G190) G191
                               (EXIT (NREVERSE #10#))))))))
           ((NULL (QCAR |r2|))
            (COND ((SPADCALL |d1| (QREFELT $ 80)) |r1|)
                  (#11#
                   (CONS (QCAR |r1|)
                         (PROGN
                          (LETT #8# NIL . #12#)
                          (SEQ (LETT |e1| NIL . #12#)
                               (LETT #7# (QCDR |r1|) . #12#) G190
                               (COND
                                ((OR (ATOM #7#)
                                     (PROGN (LETT |e1| (CAR #7#) . #12#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #8#
                                       (CONS
                                        (SPADCALL |d1| |e1| (QREFELT $ 81))
                                        #8#)
                                       . #12#)))
                               (LETT #7# (CDR #7#) . #12#) (GO G190) G191
                               (EXIT (NREVERSE #8#))))))))
           (#11#
            (SEQ (LETT |resI| NIL . #12#) (LETT |resE| NIL . #12#)
                 (COND
                  ((OR (QREFELT $ 15) (NULL (SPADCALL |d1| (QREFELT $ 80))))
                   (LETT |lent1|
                         (PROGN
                          (LETT #6# NIL . #12#)
                          (SEQ (LETT |e1| NIL . #12#)
                               (LETT #5# (QCDR |r1|) . #12#) G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |e1| (CAR #5#) . #12#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #6#
                                       (CONS
                                        (SPADCALL |d1| |e1| (QREFELT $ 81))
                                        #6#)
                                       . #12#)))
                               (LETT #5# (CDR #5#) . #12#) (GO G190) G191
                               (EXIT (NREVERSE #6#))))
                         . #12#))
                  ('T (LETT |lent1| (QCDR |r1|) . #12#)))
                 (COND
                  ((OR (QREFELT $ 15) (NULL (SPADCALL |d2| (QREFELT $ 80))))
                   (LETT |lent2|
                         (PROGN
                          (LETT #4# NIL . #12#)
                          (SEQ (LETT |e2| NIL . #12#)
                               (LETT #3# (QCDR |r2|) . #12#) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |e2| (CAR #3#) . #12#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #4#
                                       (CONS
                                        (SPADCALL |d2| |e2| (QREFELT $ 81))
                                        #4#)
                                       . #12#)))
                               (LETT #3# (CDR #3#) . #12#) (GO G190) G191
                               (EXIT (NREVERSE #4#))))
                         . #12#))
                  ('T
                   (LETT |lent2| (SPADCALL (QCDR |r2|) (QREFELT $ 53))
                         . #12#)))
                 (LETT |lind2| (SPADCALL (QCAR |r2|) (QREFELT $ 25)) . #12#)
                 (SEQ (LETT |e1| NIL . #12#) (LETT #2# |lent1| . #12#)
                      (LETT |c1| NIL . #12#) (LETT #1# (QCAR |r1|) . #12#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |c1| (CAR #1#) . #12#) NIL)
                            (ATOM #2#)
                            (PROGN (LETT |e1| (CAR #2#) . #12#) NIL))
                        (GO G191)))
                      (SEQ
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND ((NULL |lind2|) NIL)
                                     ('T
                                      (SPADCALL |c1| (|SPADfirst| |lind2|)
                                                (QREFELT $ 19)))))
                              (GO G191)))
                            (SEQ
                             (LETT |resI| (CONS (|SPADfirst| |lind2|) |resI|)
                                   . #12#)
                             (LETT |resE| (CONS (|SPADfirst| |lent2|) |resE|)
                                   . #12#)
                             (LETT |lind2| (CDR |lind2|) . #12#)
                             (EXIT (LETT |lent2| (CDR |lent2|) . #12#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (COND
                         ((OR (NULL |lind2|)
                              (NULL
                               (SPADCALL (|SPADfirst| |lind2|) |c1|
                                         (QREFELT $ 46))))
                          (SEQ (LETT |resI| (CONS |c1| |resI|) . #12#)
                               (EXIT (LETT |resE| (CONS |e1| |resE|) . #12#))))
                         ('T
                          (SEQ
                           (LETT |sum|
                                 (SPADCALL |e1| (|SPADfirst| |lent2|)
                                           (QREFELT $ 82))
                                 . #12#)
                           (COND
                            ((OR (QREFELT $ 15)
                                 (NULL (SPADCALL |sum| (QREFELT $ 83))))
                             (SEQ (LETT |resI| (CONS |c1| |resI|) . #12#)
                                  (EXIT
                                   (LETT |resE| (CONS |sum| |resE|) . #12#)))))
                           (LETT |lind2| (CDR |lind2|) . #12#)
                           (EXIT (LETT |lent2| (CDR |lent2|) . #12#)))))))
                      (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #12#))
                            . #12#)
                      (GO G190) G191 (EXIT NIL))
                 (LETT |resI|
                       (SPADCALL (NREVERSE |resI|) |lind2| (QREFELT $ 84))
                       . #12#)
                 (LETT |resE|
                       (SPADCALL (NREVERSE |resE|) |lent2| (QREFELT $ 85))
                       . #12#)
                 (SEQ G190
                      (COND
                       ((NULL
                         (COND ((NULL |resE|) NIL)
                               ('T
                                (SPADCALL (|SPADfirst| |resE|)
                                          (QREFELT $ 83)))))
                        (GO G191)))
                      (SEQ (LETT |resI| (CDR |resI|) . #12#)
                           (EXIT (LETT |resE| (CDR |resE|) . #12#)))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT (CONS |resI| |resE|)))))))) 

(SDEFUN |SEM;pivot;$IR;25|
        ((A $) (|i| |Integer|) ($ |Record| (|:| |Index| C) (|:| |Entry| D)))
        (SPROG
         ((|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
         (SEQ (LETT |r| (SPADCALL A |i| (QREFELT $ 28)) |SEM;pivot;$IR;25|)
              (EXIT
               (COND ((NULL (QCAR |r|)) (|error| "empty row"))
                     ('T
                      (CONS (|SPADfirst| (QCAR |r|))
                            (|SPADfirst| (QCDR |r|))))))))) 

(SDEFUN |SEM;pivots;$R;26|
        ((A $)
         ($ |Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
        (SPROG
         ((|resE| (|List| D)) (|resI| (|List| C)) (#1=#:G978 NIL) (|r| NIL))
         (SEQ (LETT |resI| NIL . #2=(|SEM;pivots;$R;26|))
              (LETT |resE| NIL . #2#)
              (SEQ (LETT |r| NIL . #2#)
                   (LETT #1# (SPADCALL (QVELT A 3) (QREFELT $ 45)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (NULL (QCAR |r|)))
                       (SEQ
                        (LETT |resI| (CONS (|SPADfirst| (QCAR |r|)) |resI|)
                              . #2#)
                        (EXIT
                         (LETT |resE| (CONS (|SPADfirst| (QCDR |r|)) |resE|)
                               . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |resI|) (NREVERSE |resE|)))))) 

(SDEFUN |SEM;rowEchelon;$R;27|
        ((AA $)
         ($ |Record| (|:| |Ech| $) (|:| |Lt| (|Matrix| D))
          (|:| |Pivots| (|List| D)) (|:| |Rank| (|NonNegativeInteger|))))
        (SPROG
         ((|rk| (|NonNegativeInteger|)) (#1=#:G1034 NIL) (|l| NIL)
          (#2=#:G1033 NIL) (|f| (D)) (#3=#:G1032 NIL)
          (|r|
           #4=(|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (|c| (D)) (#5=#:G1031 NIL) (|j| NIL) (|pr| #4#) (|Pivs| (|List| D))
          (|piv| (D)) (|pivrow| (|NonNegativeInteger|))
          (|pivlen| #6=(|NonNegativeInteger|)) (|k| (|Integer|)) (|len| #6#)
          (#7=#:G1030 NIL) (|pivind| (C)) (#8=#:G994 NIL)
          (|finished?| #9=(|Boolean|)) (#10=#:G1028 NIL) (|i| NIL)
          (#11=#:G1029 NIL) (|oldr| #4#) (|sorted?| #9#) (|newr| #4#)
          (#12=#:G1027 NIL) (#13=#:G1026 NIL) (|changed?| #9#)
          (#14=#:G1025 NIL) (|LTr| (|Matrix| D)) (#15=#:G1022 NIL)
          (#16=#:G1024 NIL) (#17=#:G1023 NIL) (A ($)))
         (SEQ
          (LETT A (SPADCALL AA (QREFELT $ 54)) . #18=(|SEM;rowEchelon;$R;27|))
          (LETT |LTr|
                (SPADCALL
                 (PROGN
                  (LETT #17# (GETREFV #19=(QVELT A 1)) . #18#)
                  (SEQ (LETT |i| 1 . #18#) (LETT #16# #19# . #18#)
                       (LETT #15# 0 . #18#) G190
                       (COND ((|greater_SI| |i| #16#) (GO G191)))
                       (SEQ (EXIT (SETELT #17# #15# (|spadConstant| $ 12))))
                       (LETT #15#
                             (PROG1 (|inc_SI| #15#)
                               (LETT |i| (|inc_SI| |i|) . #18#))
                             . #18#)
                       (GO G190) G191 (EXIT NIL))
                  #17#)
                 (QREFELT $ 90))
                . #18#)
          (LETT |Pivs| NIL . #18#)
          (SEQ (LETT |i| 1 . #18#) (LETT #14# (QVELT A 1) . #18#) G190
               (COND ((|greater_SI| |i| #14#) (GO G191)))
               (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1) . #18#)
                    (LETT |changed?| NIL . #18#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL (QCDR |r|)) NIL)
                                  ('T
                                   (SPADCALL (|SPADfirst| (QCDR |r|))
                                             (QREFELT $ 83)))))
                           (GO G191)))
                         (SEQ (PROGN (RPLACD |r| (CDR (QCDR |r|))) (QCDR |r|))
                              (PROGN (RPLACA |r| (CDR (QCAR |r|))) (QCAR |r|))
                              (EXIT (LETT |changed?| 'T . #18#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND (|changed?| (QSETAREF1O (QVELT A 3) |i| |r| 1)))))
               (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191 (EXIT NIL))
          (LETT |sorted?| NIL . #18#)
          (SEQ (LETT #13# NIL . #18#) G190 (COND (#13# (GO G191)))
               (SEQ (LETT |sorted?| 'T . #18#)
                    (LETT |oldr| (QAREF1O (QVELT A 3) 1 1) . #18#)
                    (EXIT
                     (SEQ (LETT |i| 2 . #18#) (LETT #12# (QVELT A 1) . #18#)
                          G190 (COND ((|greater_SI| |i| #12#) (GO G191)))
                          (SEQ (LETT |newr| (QAREF1O (QVELT A 3) |i| 1) . #18#)
                               (EXIT
                                (COND
                                 ((|SEM;greater| |newr| |oldr| $)
                                  (SEQ (QSETAREF1O (QVELT A 3) |i| |oldr| 1)
                                       (QSETAREF1O (QVELT A 3) (- |i| 1) |newr|
                                                   1)
                                       (SPADCALL |LTr| (- |i| 1) |i|
                                                 (QREFELT $ 91))
                                       (EXIT (LETT |sorted?| NIL . #18#))))
                                 ('T (LETT |oldr| |newr| . #18#)))))
                          (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #13# |sorted?| . #18#) (GO G190) G191 (EXIT NIL))
          (LETT |finished?| NIL . #18#)
          (SEQ (LETT #11# NIL . #18#) (LETT |i| 1 . #18#)
               (LETT #10# (QVELT A 1) . #18#) G190
               (COND ((OR (|greater_SI| |i| #10#) #11#) (GO G191)))
               (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1) . #18#)
                    (LETT |finished?| (NULL (QCAR |r|)) . #18#)
                    (EXIT
                     (COND
                      (|finished?|
                       (LETT |rk|
                             (PROG1 (LETT #8# (- |i| 1) . #18#)
                               (|check_subtype2| (>= #8# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #8#))
                             . #18#))
                      ('T
                       (SEQ (LETT |pivind| (|SPADfirst| (QCAR |r|)) . #18#)
                            (LETT |pivlen| (LENGTH (QCAR |r|)) . #18#)
                            (LETT |pivrow| |i| . #18#) (LETT |k| 0 . #18#)
                            (SEQ (LETT |j| (+ |i| 1) . #18#)
                                 (LETT #7# (QVELT A 1) . #18#) G190
                                 (COND
                                  ((OR (> |j| #7#)
                                       (NULL
                                        (COND
                                         ((NULL
                                           (QCAR (QAREF1O (QVELT A 3) |j| 1)))
                                          NIL)
                                         ('T
                                          (SPADCALL |pivind|
                                                    (|SPADfirst|
                                                     (QCAR
                                                      (QAREF1O (QVELT A 3) |j|
                                                               1)))
                                                    (QREFELT $ 46))))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |len|
                                        (LENGTH
                                         (QCAR (QAREF1O (QVELT A 3) |j| 1)))
                                        . #18#)
                                  (LETT |k| (+ |k| 1) . #18#)
                                  (EXIT
                                   (COND
                                    ((< |len| |pivlen|)
                                     (SEQ (LETT |pivlen| |len| . #18#)
                                          (EXIT
                                           (LETT |pivrow| |j| . #18#)))))))
                                 (LETT |j| (+ |j| 1) . #18#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |piv|
                                  (|SPADfirst|
                                   (QCDR (QAREF1O (QVELT A 3) |pivrow| 1)))
                                  . #18#)
                            (LETT |Pivs| (CONS |piv| |Pivs|) . #18#)
                            (EXIT
                             (COND
                              ((SPADCALL |k| 0 (QREFELT $ 63))
                               (SEQ
                                (COND
                                 ((SPADCALL |pivrow| |i| (QREFELT $ 59))
                                  (SEQ
                                   (LETT |pr| (QAREF1O (QVELT A 3) |pivrow| 1)
                                         . #18#)
                                   (QSETAREF1O (QVELT A 3) |pivrow|
                                               (QAREF1O (QVELT A 3) |i| 1) 1)
                                   (QSETAREF1O (QVELT A 3) |i| |pr| 1)
                                   (EXIT
                                    (SPADCALL |LTr| |i| |pivrow|
                                              (QREFELT $ 91))))))
                                (LETT |pr|
                                      (CONS (CAR (QAREF1O (QVELT A 3) |i| 1))
                                            (CDR (QAREF1O (QVELT A 3) |i| 1)))
                                      . #18#)
                                (PROGN
                                 (RPLACA |pr| (CDR (QCAR |pr|)))
                                 (QCAR |pr|))
                                (PROGN
                                 (RPLACD |pr| (CDR (QCDR |pr|)))
                                 (QCDR |pr|))
                                (EXIT
                                 (SEQ (LETT |j| (+ |i| 1) . #18#)
                                      (LETT #5# (+ |i| |k|) . #18#) G190
                                      (COND ((> |j| #5#) (GO G191)))
                                      (SEQ
                                       (LETT |r|
                                             (CONS
                                              (CAR
                                               (QAREF1O (QVELT A 3) (+ |i| 1)
                                                        1))
                                              (CDR
                                               (QAREF1O (QVELT A 3) (+ |i| 1)
                                                        1)))
                                             . #18#)
                                       (LETT |c| (|SPADfirst| (QCDR |r|))
                                             . #18#)
                                       (PROGN
                                        (RPLACA |r| (CDR (QCAR |r|)))
                                        (QCAR |r|))
                                       (PROGN
                                        (RPLACD |r| (CDR (QCDR |r|)))
                                        (QCDR |r|))
                                       (LETT |r|
                                             (|SEM;addRows| |piv| |r|
                                              (SPADCALL |c| (QREFELT $ 92))
                                              |pr| $)
                                             . #18#)
                                       (SEQ (LETT |l| 1 . #18#)
                                            (LETT #3# (QVELT A 1) . #18#) G190
                                            (COND
                                             ((|greater_SI| |l| #3#)
                                              (GO G191)))
                                            (SEQ
                                             (LETT |f|
                                                   (SPADCALL
                                                    (SPADCALL |piv|
                                                              (QAREF2O |LTr|
                                                                       (+ |i|
                                                                          1)
                                                                       |l| 1 1)
                                                              (QREFELT $ 81))
                                                    (SPADCALL |c|
                                                              (QAREF2O |LTr|
                                                                       |i| |l|
                                                                       1 1)
                                                              (QREFELT $ 81))
                                                    (QREFELT $ 93))
                                                   . #18#)
                                             (EXIT
                                              (QSETAREF2O |LTr| (+ |i| 1) |l|
                                                          |f| 1 1)))
                                            (LETT |l| (|inc_SI| |l|) . #18#)
                                            (GO G190) G191 (EXIT NIL))
                                       (SEQ (LETT |l| (+ |i| 2) . #18#)
                                            (LETT #2#
                                                  (-
                                                   (+
                                                    (+
                                                     (SPADCALL 2 |i|
                                                               (QREFELT $ 95))
                                                     |k|)
                                                    1)
                                                   |j|)
                                                  . #18#)
                                            G190 (COND ((> |l| #2#) (GO G191)))
                                            (SEQ
                                             (QSETAREF1O (QVELT A 3) (- |l| 1)
                                                         (QAREF1O (QVELT A 3)
                                                                  |l| 1)
                                                         1)
                                             (EXIT
                                              (SPADCALL |LTr| (- |l| 1) |l|
                                                        (QREFELT $ 91))))
                                            (LETT |l| (+ |l| 1) . #18#)
                                            (GO G190) G191 (EXIT NIL))
                                       (SEQ
                                        (LETT |l|
                                              (-
                                               (+
                                                (+
                                                 (SPADCALL 2 |i|
                                                           (QREFELT $ 95))
                                                 |k|)
                                                2)
                                               |j|)
                                              . #18#)
                                        (LETT #1# (QVELT A 1) . #18#) G190
                                        (COND
                                         ((OR (> |l| #1#)
                                              (NULL
                                               (|SEM;greater|
                                                (QAREF1O (QVELT A 3) |l| 1) |r|
                                                $)))
                                          (GO G191)))
                                        (SEQ
                                         (QSETAREF1O (QVELT A 3) (- |l| 1)
                                                     (QAREF1O (QVELT A 3) |l|
                                                              1)
                                                     1)
                                         (EXIT
                                          (SPADCALL |LTr| (- |l| 1) |l|
                                                    (QREFELT $ 91))))
                                        (LETT |l| (+ |l| 1) . #18#) (GO G190)
                                        G191 (EXIT NIL))
                                       (EXIT
                                        (QSETAREF1O (QVELT A 3) (- |l| 1) |r|
                                                    1)))
                                      (LETT |j| (+ |j| 1) . #18#) (GO G190)
                                      G191 (EXIT NIL))))))))))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #11# |finished?| . #18#))
                     . #18#)
               (GO G190) G191 (EXIT NIL))
          (COND ((NULL |finished?|) (LETT |rk| (QVELT A 1) . #18#)))
          (EXIT (VECTOR A |LTr| |Pivs| |rk|))))) 

(SDEFUN |SEM;setGcdMode;2S;28| ((|s| |Symbol|) ($ |Symbol|))
        (SPROG ((|tmp| (|Symbol|)))
               (SEQ (LETT |tmp| (QREFELT $ 17) |SEM;setGcdMode;2S;28|)
                    (COND
                     ((OR (EQUAL |s| '|iterated|) (EQUAL |s| '|random|))
                      (EXIT (SEQ (SETELT $ 17 |s|) (EXIT |tmp|)))))
                    (EXIT (|error| "unknown gcd mode"))))) 

(SDEFUN |SEM;randomGCD| ((|le| |List| D) ($ D))
        (SPROG
         ((|l| (|List| D)) (|tmp| (|Union| D "failed")) (#1=#:G1062 NIL)
          (|e| NIL) (|h| (D)) (|g| (D)) (#2=#:G1061 NIL) (|f| (D)))
         (SEQ
          (EXIT
           (COND
            ((EQL (LENGTH |le|) 2)
             (SPADCALL (|SPADfirst| |le|) (SPADCALL |le| (QREFELT $ 100))
                       (QREFELT $ 101)))
            (#3='T
             (SEQ (LETT |f| (|SPADfirst| |le|) . #4=(|SEM;randomGCD|))
                  (LETT |g| (SPADCALL |le| (QREFELT $ 100)) . #4#)
                  (LETT |l| (CDR (CDR |le|)) . #4#)
                  (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (|SPADfirst| |l|) (QREFELT $ 80))
                           (PROGN
                            (LETT #2# (|spadConstant| $ 12) . #4#)
                            (GO #5=#:G1060)))
                          ('T
                           (SEQ
                            (LETT |f|
                                  (SPADCALL |f|
                                            (SPADCALL (+ 1 (RANDOM 113))
                                                      (|SPADfirst| |l|)
                                                      (QREFELT $ 102))
                                            (QREFELT $ 82))
                                  . #4#)
                            (LETT |l| (CDR |l|) . #4#)
                            (EXIT
                             (COND
                              ((NULL (NULL |l|))
                               (COND
                                ((SPADCALL (|SPADfirst| |l|) (QREFELT $ 80))
                                 (PROGN
                                  (LETT #2# (|spadConstant| $ 12) . #4#)
                                  (GO #5#)))
                                ('T
                                 (SEQ
                                  (LETT |g|
                                        (SPADCALL |g|
                                                  (SPADCALL (+ 1 (RANDOM 113))
                                                            (|SPADfirst| |l|)
                                                            (QREFELT $ 102))
                                                  (QREFELT $ 82))
                                        . #4#)
                                  (EXIT (LETT |l| (CDR |l|) . #4#)))))))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |h| (SPADCALL |f| |g| (QREFELT $ 101)) . #4#)
                  (LETT |l| (LIST |h|) . #4#)
                  (SEQ (LETT |e| NIL . #4#) (LETT #1# |le| . #4#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |tmp| (SPADCALL |e| |h| (QREFELT $ 104)) . #4#)
                        (EXIT
                         (COND
                          ((QEQCAR |tmp| 1) (LETT |l| (CONS |e| |l|) . #4#)))))
                       (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL (LENGTH |l|) 1) |h|)
                         (#3# (|SEM;randomGCD| |l| $))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |SEM;iteratedGCD| ((|le| |List| D) ($ D))
        (SPROG ((|l| (|List| D)) (|res| (D)))
               (SEQ
                (LETT |res|
                      (SPADCALL (|SPADfirst| |le|)
                                (SPADCALL |le| (QREFELT $ 100))
                                (QREFELT $ 101))
                      . #1=(|SEM;iteratedGCD|))
                (LETT |l| (CDR (CDR |le|)) . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |l|) NIL)
                              ('T (NULL (SPADCALL |res| (QREFELT $ 80))))))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (SPADCALL |res| (|SPADfirst| |l|) (QREFELT $ 101))
                            . #1#)
                      (EXIT (LETT |l| (CDR |l|) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))) 

(SDEFUN |SEM;makePrimitive|
        ((|r| |Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))
         ($ |Record| (|:| GCD D)
          (|:| |Row|
               (|Record| (|:| |Indices| (|List| C))
                         (|:| |Entries| (|List| D))))))
        (SPROG
         ((|le| (|List| D)) (#1=#:G1072 NIL) (#2=#:G1080 NIL) (|e| NIL)
          (#3=#:G1079 NIL) (|g| (D)))
         (SEQ (LETT |le| (QCDR |r|) . #4=(|SEM;makePrimitive|))
              (EXIT
               (COND
                ((EQL (LENGTH |le|) 1)
                 (CONS (|SPADfirst| |le|)
                       (CONS (QCAR |r|) (LIST (|spadConstant| $ 12)))))
                (#5='T
                 (SEQ
                  (COND
                   ((EQUAL (QREFELT $ 17) '|iterated|)
                    (LETT |g| (|SEM;iteratedGCD| |le| $) . #4#))
                   (#5# (LETT |g| (|SEM;randomGCD| |le| $) . #4#)))
                  (EXIT
                   (COND
                    ((SPADCALL |g| (QREFELT $ 80))
                     (CONS (|spadConstant| $ 12) |r|))
                    (#5#
                     (SEQ
                      (LETT |le|
                            (PROGN
                             (LETT #3# NIL . #4#)
                             (SEQ (LETT |e| NIL . #4#) (LETT #2# |le| . #4#)
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |e| (CAR #2#) . #4#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (PROG2
                                               (LETT #1#
                                                     (SPADCALL |e| |g|
                                                               (QREFELT $ 104))
                                                     . #4#)
                                               (QCDR #1#)
                                             (|check_union2| (QEQCAR #1# 0)
                                                             (QREFELT $ 7)
                                                             (|Union|
                                                              (QREFELT $ 7)
                                                              "failed")
                                                             #1#))
                                           #3#)
                                          . #4#)))
                                  (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            . #4#)
                      (EXIT (CONS |g| (CONS (QCAR |r|) |le|)))))))))))))) 

(SDEFUN |SEM;primitiveRowEchelon;$R;32|
        ((AA $)
         ($ |Record| (|:| |Ech| $) (|:| |Lt| (|Matrix| (|Fraction| D)))
          (|:| |Pivots| (|List| D)) (|:| |Rank| (|NonNegativeInteger|))))
        (SPROG
         ((|rk| (|NonNegativeInteger|)) (#1=#:G1145 NIL) (|l| NIL)
          (#2=#:G1144 NIL) (|fd| (|Fraction| D)) (#3=#:G1143 NIL)
          (|r|
           #4=(|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (|c| (D)) (#5=#:G1142 NIL) (|j| NIL) (|pr| #4#) (|Pivs| (|List| D))
          (|piv| (D)) (#6=#:G1141 NIL) (|q| (|Fraction| D))
          (|tmp|
           (|Record| (|:| GCD D)
                     (|:| |Row|
                          (|Record| (|:| |Indices| (|List| C))
                                    (|:| |Entries| (|List| D))))))
          (|pivrow| (|NonNegativeInteger|))
          (|pivlen| #7=(|NonNegativeInteger|)) (|k| (|Integer|)) (|len| #7#)
          (#8=#:G1140 NIL) (|pivind| (C)) (#9=#:G1099 NIL)
          (|finished?| #10=(|Boolean|)) (#11=#:G1138 NIL) (|i| NIL)
          (#12=#:G1139 NIL) (|oldr| #4#) (|sorted?| #10#) (|newr| #4#)
          (#13=#:G1137 NIL) (#14=#:G1136 NIL) (|changed?| #10#)
          (#15=#:G1135 NIL) (|LTr| (|Matrix| (|Fraction| D))) (#16=#:G1132 NIL)
          (#17=#:G1134 NIL) (#18=#:G1133 NIL) (A ($)))
         (SEQ
          (LETT A (SPADCALL AA (QREFELT $ 54))
                . #19=(|SEM;primitiveRowEchelon;$R;32|))
          (LETT |LTr|
                (SPADCALL
                 (PROGN
                  (LETT #18# (GETREFV #20=(QVELT A 1)) . #19#)
                  (SEQ (LETT |i| 1 . #19#) (LETT #17# #20# . #19#)
                       (LETT #16# 0 . #19#) G190
                       (COND ((|greater_SI| |i| #17#) (GO G191)))
                       (SEQ (EXIT (SETELT #18# #16# (|spadConstant| $ 106))))
                       (LETT #16#
                             (PROG1 (|inc_SI| #16#)
                               (LETT |i| (|inc_SI| |i|) . #19#))
                             . #19#)
                       (GO G190) G191 (EXIT NIL))
                  #18#)
                 (QREFELT $ 109))
                . #19#)
          (LETT |Pivs| NIL . #19#)
          (SEQ (LETT |i| 1 . #19#) (LETT #15# (QVELT A 1) . #19#) G190
               (COND ((|greater_SI| |i| #15#) (GO G191)))
               (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1) . #19#)
                    (LETT |changed?| NIL . #19#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL (QCDR |r|)) NIL)
                                  ('T
                                   (SPADCALL (|SPADfirst| (QCDR |r|))
                                             (QREFELT $ 83)))))
                           (GO G191)))
                         (SEQ (PROGN (RPLACD |r| (CDR (QCDR |r|))) (QCDR |r|))
                              (PROGN (RPLACA |r| (CDR (QCAR |r|))) (QCAR |r|))
                              (EXIT (LETT |changed?| 'T . #19#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND (|changed?| (QSETAREF1O (QVELT A 3) |i| |r| 1)))))
               (LETT |i| (|inc_SI| |i|) . #19#) (GO G190) G191 (EXIT NIL))
          (LETT |sorted?| NIL . #19#)
          (SEQ (LETT #14# NIL . #19#) G190 (COND (#14# (GO G191)))
               (SEQ (LETT |sorted?| 'T . #19#)
                    (LETT |oldr| (QAREF1O (QVELT A 3) 1 1) . #19#)
                    (EXIT
                     (SEQ (LETT |i| 2 . #19#) (LETT #13# (QVELT A 1) . #19#)
                          G190 (COND ((|greater_SI| |i| #13#) (GO G191)))
                          (SEQ (LETT |newr| (QAREF1O (QVELT A 3) |i| 1) . #19#)
                               (EXIT
                                (COND
                                 ((|SEM;greater| |newr| |oldr| $)
                                  (SEQ (QSETAREF1O (QVELT A 3) |i| |oldr| 1)
                                       (QSETAREF1O (QVELT A 3) (- |i| 1) |newr|
                                                   1)
                                       (SPADCALL |LTr| (- |i| 1) |i|
                                                 (QREFELT $ 110))
                                       (EXIT (LETT |sorted?| NIL . #19#))))
                                 ('T (LETT |oldr| |newr| . #19#)))))
                          (LETT |i| (|inc_SI| |i|) . #19#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #14# |sorted?| . #19#) (GO G190) G191 (EXIT NIL))
          (LETT |finished?| NIL . #19#)
          (SEQ (LETT #12# NIL . #19#) (LETT |i| 1 . #19#)
               (LETT #11# (QVELT A 1) . #19#) G190
               (COND ((OR (|greater_SI| |i| #11#) #12#) (GO G191)))
               (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1) . #19#)
                    (LETT |finished?| (NULL (QCAR |r|)) . #19#)
                    (EXIT
                     (COND
                      (|finished?|
                       (LETT |rk|
                             (PROG1 (LETT #9# (- |i| 1) . #19#)
                               (|check_subtype2| (>= #9# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #9#))
                             . #19#))
                      ('T
                       (SEQ (LETT |pivind| (|SPADfirst| (QCAR |r|)) . #19#)
                            (LETT |pivlen| (LENGTH (QCAR |r|)) . #19#)
                            (LETT |pivrow| |i| . #19#) (LETT |k| 0 . #19#)
                            (SEQ (LETT |j| (+ |i| 1) . #19#)
                                 (LETT #8# (QVELT A 1) . #19#) G190
                                 (COND
                                  ((OR (> |j| #8#)
                                       (NULL
                                        (COND
                                         ((NULL
                                           (QCAR (QAREF1O (QVELT A 3) |j| 1)))
                                          NIL)
                                         ('T
                                          (SPADCALL |pivind|
                                                    (|SPADfirst|
                                                     (QCAR
                                                      (QAREF1O (QVELT A 3) |j|
                                                               1)))
                                                    (QREFELT $ 46))))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |len|
                                        (LENGTH
                                         (QCAR (QAREF1O (QVELT A 3) |j| 1)))
                                        . #19#)
                                  (LETT |k| (+ |k| 1) . #19#)
                                  (EXIT
                                   (COND
                                    ((< |len| |pivlen|)
                                     (SEQ (LETT |pivlen| |len| . #19#)
                                          (EXIT
                                           (LETT |pivrow| |j| . #19#)))))))
                                 (LETT |j| (+ |j| 1) . #19#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |tmp|
                                  (|SEM;makePrimitive|
                                   (QAREF1O (QVELT A 3) |pivrow| 1) $)
                                  . #19#)
                            (COND
                             ((NULL (SPADCALL (QCAR |tmp|) (QREFELT $ 80)))
                              (SEQ
                               (QSETAREF1O (QVELT A 3) |pivrow| (QCDR |tmp|) 1)
                               (LETT |q|
                                     (SPADCALL (|spadConstant| $ 12)
                                               (QCAR |tmp|) (QREFELT $ 111))
                                     . #19#)
                               (EXIT
                                (SEQ (LETT |l| 1 . #19#)
                                     (LETT #6# (QVELT A 1) . #19#) G190
                                     (COND ((|greater_SI| |l| #6#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((NULL
                                          (SPADCALL
                                           (QAREF2O |LTr| |pivrow| |l| 1 1)
                                           (QREFELT $ 112)))
                                         (QSETAREF2O |LTr| |pivrow| |l|
                                                     (SPADCALL |q|
                                                               (QAREF2O |LTr|
                                                                        |pivrow|
                                                                        |l| 1
                                                                        1)
                                                               (QREFELT $ 113))
                                                     1 1)))))
                                     (LETT |l| (|inc_SI| |l|) . #19#) (GO G190)
                                     G191 (EXIT NIL))))))
                            (LETT |piv|
                                  (|SPADfirst|
                                   (QCDR (QAREF1O (QVELT A 3) |pivrow| 1)))
                                  . #19#)
                            (LETT |Pivs| (CONS |piv| |Pivs|) . #19#)
                            (EXIT
                             (COND
                              ((SPADCALL |k| 0 (QREFELT $ 63))
                               (SEQ
                                (COND
                                 ((SPADCALL |pivrow| |i| (QREFELT $ 59))
                                  (SEQ
                                   (LETT |pr| (QAREF1O (QVELT A 3) |pivrow| 1)
                                         . #19#)
                                   (QSETAREF1O (QVELT A 3) |pivrow|
                                               (QAREF1O (QVELT A 3) |i| 1) 1)
                                   (QSETAREF1O (QVELT A 3) |i| |pr| 1)
                                   (EXIT
                                    (SPADCALL |LTr| |i| |pivrow|
                                              (QREFELT $ 110))))))
                                (LETT |pr|
                                      (CONS (CAR (QCDR |tmp|))
                                            (CDR (QCDR |tmp|)))
                                      . #19#)
                                (PROGN
                                 (RPLACA |pr| (CDR (QCAR |pr|)))
                                 (QCAR |pr|))
                                (PROGN
                                 (RPLACD |pr| (CDR (QCDR |pr|)))
                                 (QCDR |pr|))
                                (EXIT
                                 (SEQ (LETT |j| (+ |i| 1) . #19#)
                                      (LETT #5# (+ |i| |k|) . #19#) G190
                                      (COND ((> |j| #5#) (GO G191)))
                                      (SEQ
                                       (LETT |r|
                                             (CONS
                                              (CAR
                                               (QAREF1O (QVELT A 3) (+ |i| 1)
                                                        1))
                                              (CDR
                                               (QAREF1O (QVELT A 3) (+ |i| 1)
                                                        1)))
                                             . #19#)
                                       (LETT |c| (|SPADfirst| (QCDR |r|))
                                             . #19#)
                                       (PROGN
                                        (RPLACA |r| (CDR (QCAR |r|)))
                                        (QCAR |r|))
                                       (PROGN
                                        (RPLACD |r| (CDR (QCDR |r|)))
                                        (QCDR |r|))
                                       (LETT |r|
                                             (|SEM;addRows| |piv| |r|
                                              (SPADCALL |c| (QREFELT $ 92))
                                              |pr| $)
                                             . #19#)
                                       (SEQ (LETT |l| 1 . #19#)
                                            (LETT #3# (QVELT A 1) . #19#) G190
                                            (COND
                                             ((|greater_SI| |l| #3#)
                                              (GO G191)))
                                            (SEQ
                                             (LETT |fd|
                                                   (SPADCALL
                                                    (SPADCALL |piv|
                                                              (QAREF2O |LTr|
                                                                       (+ |i|
                                                                          1)
                                                                       |l| 1 1)
                                                              (QREFELT $ 114))
                                                    (SPADCALL |c|
                                                              (QAREF2O |LTr|
                                                                       |i| |l|
                                                                       1 1)
                                                              (QREFELT $ 114))
                                                    (QREFELT $ 115))
                                                   . #19#)
                                             (EXIT
                                              (QSETAREF2O |LTr| (+ |i| 1) |l|
                                                          |fd| 1 1)))
                                            (LETT |l| (|inc_SI| |l|) . #19#)
                                            (GO G190) G191 (EXIT NIL))
                                       (SEQ (LETT |l| (+ |i| 2) . #19#)
                                            (LETT #2#
                                                  (-
                                                   (+
                                                    (+
                                                     (SPADCALL 2 |i|
                                                               (QREFELT $ 95))
                                                     |k|)
                                                    1)
                                                   |j|)
                                                  . #19#)
                                            G190 (COND ((> |l| #2#) (GO G191)))
                                            (SEQ
                                             (QSETAREF1O (QVELT A 3) (- |l| 1)
                                                         (QAREF1O (QVELT A 3)
                                                                  |l| 1)
                                                         1)
                                             (EXIT
                                              (SPADCALL |LTr| (- |l| 1) |l|
                                                        (QREFELT $ 110))))
                                            (LETT |l| (+ |l| 1) . #19#)
                                            (GO G190) G191 (EXIT NIL))
                                       (SEQ
                                        (LETT |l|
                                              (-
                                               (+
                                                (+
                                                 (SPADCALL 2 |i|
                                                           (QREFELT $ 95))
                                                 |k|)
                                                2)
                                               |j|)
                                              . #19#)
                                        (LETT #1# (QVELT A 1) . #19#) G190
                                        (COND
                                         ((OR (> |l| #1#)
                                              (NULL
                                               (|SEM;greater|
                                                (QAREF1O (QVELT A 3) |l| 1) |r|
                                                $)))
                                          (GO G191)))
                                        (SEQ
                                         (QSETAREF1O (QVELT A 3) (- |l| 1)
                                                     (QAREF1O (QVELT A 3) |l|
                                                              1)
                                                     1)
                                         (EXIT
                                          (SPADCALL |LTr| (- |l| 1) |l|
                                                    (QREFELT $ 110))))
                                        (LETT |l| (+ |l| 1) . #19#) (GO G190)
                                        G191 (EXIT NIL))
                                       (EXIT
                                        (QSETAREF1O (QVELT A 3) (- |l| 1) |r|
                                                    1)))
                                      (LETT |j| (+ |j| 1) . #19#) (GO G190)
                                      G191 (EXIT NIL))))))))))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #12# |finished?| . #19#))
                     . #19#)
               (GO G190) G191 (EXIT NIL))
          (COND ((NULL |finished?|) (LETT |rk| (QVELT A 1) . #19#)))
          (EXIT (VECTOR A |LTr| |Pivs| |rk|))))) 

(SDEFUN |SEM;*;M2$;33| ((LM |Matrix| D) (AA $) ($ $))
        (SPROG
         ((|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (#1=#:G1169 NIL) (|k| NIL) (#2=#:G1168 NIL) (#3=#:G1167 NIL)
          (|inds| (|List| C)) (#4=#:G1166 NIL) (|i| NIL) (|tmp| (|Vector| D))
          (#5=#:G1165 NIL) (|c| NIL) (|res| ($))
          (|rlen| (|NonNegativeInteger|)) (A ($)))
         (SEQ
          (COND
           ((SPADCALL (ANCOLS LM) (QVELT AA 1) (QREFELT $ 59))
            (|error| "improper matrix dimensions"))
           ('T
            (SEQ (LETT A (SPADCALL AA (QREFELT $ 54)) . #6=(|SEM;*;M2$;33|))
                 (LETT |rlen| (ANROWS LM) . #6#)
                 (LETT |res| (SPADCALL (QVELT A 2) |rlen| (QREFELT $ 34))
                       . #6#)
                 (SEQ (LETT |c| NIL . #6#) (LETT #5# (QVELT A 2) . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |tmp| (MAKEARR1 |rlen| (|spadConstant| $ 36))
                             . #6#)
                       (SEQ (LETT |i| 1 . #6#) (LETT #4# (QVELT A 1) . #6#)
                            G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                            (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1) . #6#)
                                 (LETT |inds| (QCAR |r|) . #6#)
                                 (EXIT
                                  (COND
                                   ((NULL (NULL |inds|))
                                    (COND
                                     ((SPADCALL (|SPADfirst| |inds|) |c|
                                                (QREFELT $ 46))
                                      (SEQ
                                       (SEQ (LETT |k| 1 . #6#)
                                            (LETT #3# |rlen| . #6#) G190
                                            (COND
                                             ((|greater_SI| |k| #3#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL
                                                  (QAREF2O LM |k| |i| 1 1)
                                                  (QREFELT $ 83)))
                                                (QSETAREF1O |tmp| |k|
                                                            (SPADCALL
                                                             (QAREF1O |tmp| |k|
                                                                      1)
                                                             (SPADCALL
                                                              (QAREF2O LM |k|
                                                                       |i| 1 1)
                                                              (|SPADfirst|
                                                               (QCDR |r|))
                                                              (QREFELT $ 81))
                                                             (QREFELT $ 82))
                                                            1)))))
                                            (LETT |k| (|inc_SI| |k|) . #6#)
                                            (GO G190) G191 (EXIT NIL))
                                       (PROGN
                                        (RPLACD |r| (CDR (QCDR |r|)))
                                        (QCDR |r|))
                                       (PROGN
                                        (RPLACA |r| (CDR |inds|))
                                        (QCAR |r|))
                                       (EXIT
                                        (QSETAREF1O (QVELT A 3) |i| |r|
                                                    1)))))))))
                            (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (SEQ (LETT |k| 1 . #6#) (LETT #2# |rlen| . #6#) G190
                             (COND ((|greater_SI| |k| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL (QAREF1O |tmp| |k| 1)
                                            (QREFELT $ 83)))
                                 (SEQ
                                  (LETT |r| (QAREF1O (QVELT |res| 3) |k| 1)
                                        . #6#)
                                  (PROGN
                                   (RPLACA |r| (CONS |c| (QCAR |r|)))
                                   (QCAR |r|))
                                  (PROGN
                                   (RPLACD |r|
                                           (CONS (QAREF1O |tmp| |k| 1)
                                                 (QCDR |r|)))
                                   (QCDR |r|))
                                  (EXIT
                                   (QSETAREF1O (QVELT |res| 3) |k| |r| 1)))))))
                             (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (SEQ (LETT |k| 1 . #6#) (LETT #1# |rlen| . #6#) G190
                      (COND ((|greater_SI| |k| #1#) (GO G191)))
                      (SEQ (LETT |r| (QAREF1O (QVELT |res| 3) |k| 1) . #6#)
                           (PROGN
                            (RPLACA |r| (NREVERSE (QCAR |r|)))
                            (QCAR |r|))
                           (PROGN
                            (RPLACD |r| (NREVERSE (QCDR |r|)))
                            (QCDR |r|))
                           (EXIT (QSETAREF1O (QVELT |res| 3) |k| |r| 1)))
                      (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                      (EXIT NIL))
                 (EXIT |res|))))))) 

(SDEFUN |SEM;mult| ((|f| |Fraction| D) (|d| D) ($ D))
        (SPROG ((|tmp| (|Union| D "failed")) (|res| (D)))
               (SEQ
                (LETT |res|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 119)) |d|
                                (QREFELT $ 81))
                      . #1=(|SEM;mult|))
                (LETT |tmp|
                      (SPADCALL |res| (SPADCALL |f| (QREFELT $ 120))
                                (QREFELT $ 104))
                      . #1#)
                (EXIT
                 (COND ((QEQCAR |tmp| 1) (|error| "cannot divide in mult"))
                       ('T (QCDR |tmp|))))))) 

(SDEFUN |SEM;*;M2$;35| ((LM |Matrix| (|Fraction| D)) (AA $) ($ $))
        (SPROG
         ((|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (#1=#:G1202 NIL) (|k| NIL) (|d| (|Union| D "failed"))
          (#2=#:G1201 NIL) (#3=#:G1200 NIL) (|inds| (|List| C))
          (#4=#:G1199 NIL) (|i| NIL) (|tmp| (|Vector| (|Fraction| D)))
          (#5=#:G1198 NIL) (|c| NIL) (|res| ($))
          (|rlen| (|NonNegativeInteger|)) (A ($)))
         (SEQ
          (COND
           ((SPADCALL (ANCOLS LM) (QVELT AA 1) (QREFELT $ 59))
            (|error| "improper matrix dimensions"))
           ('T
            (SEQ (LETT A (SPADCALL AA (QREFELT $ 54)) . #6=(|SEM;*;M2$;35|))
                 (LETT |rlen| (ANROWS LM) . #6#)
                 (LETT |res| (SPADCALL (QVELT A 2) |rlen| (QREFELT $ 34))
                       . #6#)
                 (SEQ (LETT |c| NIL . #6#) (LETT #5# (QVELT A 2) . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |tmp| (MAKEARR1 |rlen| (|spadConstant| $ 121))
                             . #6#)
                       (SEQ (LETT |i| 1 . #6#) (LETT #4# (QVELT A 1) . #6#)
                            G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                            (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1) . #6#)
                                 (LETT |inds| (QCAR |r|) . #6#)
                                 (EXIT
                                  (COND
                                   ((NULL (NULL |inds|))
                                    (COND
                                     ((SPADCALL (|SPADfirst| |inds|) |c|
                                                (QREFELT $ 46))
                                      (SEQ
                                       (SEQ (LETT |k| 1 . #6#)
                                            (LETT #3# |rlen| . #6#) G190
                                            (COND
                                             ((|greater_SI| |k| #3#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL
                                                  (QAREF2O LM |k| |i| 1 1)
                                                  (QREFELT $ 112)))
                                                (QSETAREF1O |tmp| |k|
                                                            (SPADCALL
                                                             (QAREF1O |tmp| |k|
                                                                      1)
                                                             (SPADCALL
                                                              (QAREF2O LM |k|
                                                                       |i| 1 1)
                                                              (|SPADfirst|
                                                               (QCDR |r|))
                                                              (QREFELT $ 122))
                                                             (QREFELT $ 123))
                                                            1)))))
                                            (LETT |k| (|inc_SI| |k|) . #6#)
                                            (GO G190) G191 (EXIT NIL))
                                       (PROGN
                                        (RPLACD |r| (CDR (QCDR |r|)))
                                        (QCDR |r|))
                                       (PROGN
                                        (RPLACA |r| (CDR |inds|))
                                        (QCAR |r|))
                                       (EXIT
                                        (QSETAREF1O (QVELT A 3) |i| |r|
                                                    1)))))))))
                            (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (SEQ (LETT |k| 1 . #6#) (LETT #2# |rlen| . #6#) G190
                             (COND ((|greater_SI| |k| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL (QAREF1O |tmp| |k| 1)
                                            (QREFELT $ 112)))
                                 (SEQ
                                  (LETT |d|
                                        (SPADCALL (QAREF1O |tmp| |k| 1)
                                                  (QREFELT $ 125))
                                        . #6#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |d| 1)
                                     (|error| "cannot divide in *"))
                                    ('T
                                     (SEQ
                                      (LETT |r| (QAREF1O (QVELT |res| 3) |k| 1)
                                            . #6#)
                                      (PROGN
                                       (RPLACA |r| (CONS |c| (QCAR |r|)))
                                       (QCAR |r|))
                                      (PROGN
                                       (RPLACD |r|
                                               (CONS (QCDR |d|) (QCDR |r|)))
                                       (QCDR |r|))
                                      (EXIT
                                       (QSETAREF1O (QVELT |res| 3) |k| |r|
                                                   1)))))))))))
                             (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (SEQ (LETT |k| 1 . #6#) (LETT #1# |rlen| . #6#) G190
                      (COND ((|greater_SI| |k| #1#) (GO G191)))
                      (SEQ (LETT |r| (QAREF1O (QVELT |res| 3) |k| 1) . #6#)
                           (PROGN
                            (RPLACA |r| (NREVERSE (QCAR |r|)))
                            (QCAR |r|))
                           (PROGN
                            (RPLACD |r| (NREVERSE (QCDR |r|)))
                            (QCDR |r|))
                           (EXIT (QSETAREF1O (QVELT |res| 3) |k| |r| 1)))
                      (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                      (EXIT NIL))
                 (EXIT |res|))))))) 

(DECLAIM (NOTINLINE |SparseEchelonMatrix;|)) 

(DEFUN |SparseEchelonMatrix| (&REST #1=#:G1204)
  (SPROG NIL
         (PROG (#2=#:G1205)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseEchelonMatrix|)
                                               '|domainEqualList|)
                    . #3=(|SparseEchelonMatrix|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SparseEchelonMatrix;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SparseEchelonMatrix|)))))))))) 

(DEFUN |SparseEchelonMatrix;| (|#1| |#2|)
  (SPROG
   ((|i| NIL) (#1=#:G1203 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL)
    (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|) . #2=(|SparseEchelonMatrix|))
     (LETT DV$2 (|devaluate| |#2|) . #2#)
     (LETT |dv$| (LIST '|SparseEchelonMatrix| DV$1 DV$2) . #2#)
     (LETT $ (GETREFV 127) . #2#)
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3
               (LETT |pv$|
                     (|buildPredVector| 0 0
                                        (LIST
                                         (|HasCategory| |#2| '(|GcdDomain|))
                                         (|HasCategory| |#2|
                                                        '(|IntegralDomain|))))
                     . #2#))
     (|haddProp| |$ConstructorCache| '|SparseEchelonMatrix| (LIST DV$1 DV$2)
                 (CONS 1 $))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (QSETREFV $ 7 |#2|)
     (SETF |pv$| (QREFELT $ 3))
     (QSETREFV $ 11
               (SPADCALL
                (PROGN
                 (LETT #1# NIL . #2#)
                 (SEQ (LETT |i| 1 . #2#) G190
                      (COND ((|greater_SI| |i| 1) (GO G191)))
                      (SEQ (EXIT (LETT #1# (CONS |i| #1#) . #2#)))
                      (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                      (EXIT (NREVERSE #1#))))
                (QREFELT $ 10)))
     (QSETREFV $ 13 (- (QREFELT $ 11) 1))
     (QSETREFV $ 14 (CONS NIL NIL))
     (QSETREFV $ 15 (|HasCategory| |#2| '(|lazyRepresentation|)))
     (QSETREFV $ 16 113)
     (QSETREFV $ 17 '|iterated|)
     (QSETREFV $ 20
               (|Record| (|:| |NCols| (|NonNegativeInteger|))
                         (|:| |NRows| (|NonNegativeInteger|))
                         (|:| |AllInds| (|List| |#1|))
                         (|:| |Rows|
                              (|Vector|
                               (|Record| (|:| |Indices| (|List| |#1|))
                                         (|:| |Entries| (|List| |#2|)))))))
     (COND
      ((|testBitVector| |pv$| 1)
       (PROGN
        (QSETREFV $ 99 (CONS (|dispatchFunction| |SEM;setGcdMode;2S;28|) $))
        (QSETREFV $ 117
                  (CONS (|dispatchFunction| |SEM;primitiveRowEchelon;$R;32|)
                        $)))))
     (COND
      ((|testBitVector| |pv$| 2)
       (PROGN (QSETREFV $ 126 (CONS (|dispatchFunction| |SEM;*;M2$;35|) $)))))
     $)))) 

(MAKEPROP '|SparseEchelonMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (|List| 21) (0 . |minIndex|) '|minInd| (5 . |One|) '|offset|
              '|emptyRec| '|noChecks?| '|seed| '|GCDmode| (|Boolean|) (9 . <)
              '|Rep| (|NonNegativeInteger|) |SEM;ncols;$Nni;2|
              |SEM;nrows;$Nni;3| (|List| 6) (15 . |copy|) |SEM;allIndices;$L;4|
              (|Record| (|:| |Indices| 24) (|:| |Entries| 32)) |SEM;row;$IR;5|
              (|Void|) (20 . |void|) |SEM;setRow!;$IRV;6| (|List| 7)
              |SEM;setRow!;$ILLV;7| |SEM;new;LI$;8| (24 . |position|)
              (30 . |Zero|) (34 . |qelt|) |SEM;elt;$ICD;9| (40 . |qsetelt!|)
              (47 . |insert!|) (54 . |insert!|) |SEM;setelt!;$ICDV;10|
              (|List| 27) (|Vector| 27) (61 . |entries|) (66 . =) (|Matrix| 7)
              |SEM;coerce;$M;11| (|OutputForm|) (72 . |coerce|) (77 . |coerce|)
              |SEM;coerce;$Of;12| (82 . |copy|) |SEM;copy;2$;13|
              (|Mapping| 18 6 6) (87 . |merge!|) (94 . |removeDuplicates!|)
              |SEM;elimZeroCols!;$V;14| (99 . ~=) (|Mapping| 18 6)
              |SEM;purge!;$MV;15| |SEM;sortedPurge!;$MV;16| (105 . >)
              |SEM;deleteRow!;$IV;17| (111 . |construct|)
              (116 . |setDifference|) (122 . |sort!|) (128 . |merge|)
              |SEM;consRow!;$RV;18| (135 . |concat|) |SEM;appendRow!;$RV;19|
              |SEM;extract;$2I$;20| |SEM;join;3$;21| (141 . |append|)
              (147 . |append|) |SEM;horizJoin;3$;22| (153 . >)
              (|Record| (|:| |Left| $) (|:| |Right| $)) |SEM;horizSplit;$CR;23|
              (159 . |one?|) (164 . *) (170 . +) (176 . |zero?|)
              (181 . |concat!|) (187 . |concat!|)
              (|Record| (|:| |Index| 6) (|:| |Entry| 7)) |SEM;pivot;$IR;25|
              |SEM;pivots;$R;26| (|Vector| 7) (193 . |diagonalMatrix|)
              (198 . |swapRows!|) (205 . -) (210 . -) (|PositiveInteger|)
              (216 . *)
              (|Record| (|:| |Ech| $) (|:| |Lt| 47) (|:| |Pivots| 32)
                        (|:| |Rank| 21))
              |SEM;rowEchelon;$R;27| (|Symbol|) (222 . |setGcdMode|)
              (227 . |second|) (232 . |gcd|) (238 . *) (|Union| $ '"failed")
              (244 . |exquo|) (|Fraction| 7) (250 . |One|) (|Vector| 105)
              (|Matrix| 105) (254 . |diagonalMatrix|) (259 . |swapRows!|)
              (266 . /) (272 . |zero?|) (277 . *) (283 . *) (289 . -)
              (|Record| (|:| |Ech| $) (|:| |Lt| 108) (|:| |Pivots| 32)
                        (|:| |Rank| 21))
              (295 . |primitiveRowEchelon|) |SEM;*;M2$;33| (300 . |numer|)
              (305 . |denom|) (310 . |Zero|) (314 . *) (320 . +)
              (|Union| 7 '"failed") (326 . |retractIfCan|) (331 . *))
           '#(|sortedPurge!| 337 |setelt!| 343 |setRow!| 351 |setGcdMode| 366
              |rowEchelon| 371 |row| 376 |purge!| 382 |primitiveRowEchelon| 388
              |pivots| 393 |pivot| 398 |nrows| 404 |new| 409 |ncols| 415 |join|
              420 |horizSplit| 426 |horizJoin| 432 |extract| 438 |elt| 445
              |elimZeroCols!| 452 |deleteRow!| 457 |copy| 463 |consRow!| 468
              |coerce| 474 |appendRow!| 484 |allIndices| 490 * 495)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(NIL NIL NIL)
                       (CONS
                        '#((|CoercibleTo| 49) (|shallowlyMutable|)
                           (|finiteAggregate|))
                        (|makeByteWordVec2| 126
                                            '(1 9 8 0 10 0 7 0 12 2 6 18 0 0 19
                                              1 24 0 0 25 0 29 0 30 2 24 8 6 0
                                              35 0 7 0 36 2 32 7 0 8 37 3 32 7
                                              0 8 7 39 3 24 0 6 0 8 40 3 32 0 7
                                              0 8 41 1 44 43 0 45 2 6 18 0 0 46
                                              1 7 49 0 50 1 47 49 0 51 1 32 0 0
                                              53 3 24 0 55 0 0 56 1 24 0 0 57 2
                                              21 18 0 0 59 2 8 18 0 0 63 1 44 0
                                              43 65 2 24 0 0 0 66 2 24 0 55 0
                                              67 3 24 0 55 0 0 68 2 43 0 0 27
                                              70 2 24 0 0 0 74 2 32 0 0 0 75 2
                                              6 18 0 0 77 1 7 18 0 80 2 7 0 0 0
                                              81 2 7 0 0 0 82 1 7 18 0 83 2 24
                                              0 0 0 84 2 32 0 0 0 85 1 47 0 89
                                              90 3 47 0 0 8 8 91 1 7 0 0 92 2 7
                                              0 0 0 93 2 21 0 94 0 95 1 0 98 98
                                              99 1 32 7 0 100 2 7 0 0 0 101 2 7
                                              0 8 0 102 2 7 103 0 0 104 0 105 0
                                              106 1 108 0 107 109 3 108 0 0 8 8
                                              110 2 105 0 7 7 111 1 105 18 0
                                              112 2 105 0 0 0 113 2 105 0 7 0
                                              114 2 105 0 0 0 115 1 0 116 0 117
                                              1 105 7 0 119 1 105 7 0 120 0 105
                                              0 121 2 105 0 0 7 122 2 105 0 0 0
                                              123 1 105 124 0 125 2 0 0 108 0
                                              126 2 0 29 0 60 62 4 0 29 0 8 6 7
                                              42 4 0 29 0 8 24 32 33 3 0 29 0 8
                                              27 31 1 1 98 98 99 1 0 96 0 97 2
                                              0 27 0 8 28 2 0 29 0 60 61 1 1
                                              116 0 117 1 0 27 0 88 2 0 86 0 8
                                              87 1 0 21 0 23 2 0 0 24 8 34 1 0
                                              21 0 22 2 0 0 0 0 73 2 0 78 0 6
                                              79 2 0 0 0 0 76 3 0 0 0 8 8 72 3
                                              0 7 0 8 6 38 1 0 29 0 58 2 0 29 0
                                              8 64 1 0 0 0 54 2 0 29 0 27 69 1
                                              0 49 0 52 1 0 47 0 48 2 0 29 0 27
                                              71 1 0 24 0 26 2 2 0 108 0 126 2
                                              0 0 47 0 118)))))
           '|lookupComplete|)) 
