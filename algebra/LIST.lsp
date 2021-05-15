
(PUT '|LIST;#;$Nni;1| '|SPADreplace| 'LENGTH) 

(SDEFUN |LIST;#;$Nni;1| ((|x| $) ($ |NonNegativeInteger|)) (LENGTH |x|)) 

(PUT '|LIST;cons;S2$;2| '|SPADreplace| 'CONS) 

(SDEFUN |LIST;cons;S2$;2| ((|s| S) (|x| $) ($ $)) (CONS |s| |x|)) 

(PUT '|LIST;concat;S2$;3| '|SPADreplace| 'CONS) 

(SDEFUN |LIST;concat;S2$;3| ((|s| S) (|x| $) ($ $)) (CONS |s| |x|)) 

(PUT '|LIST;eq?;2$B;4| '|SPADreplace| 'EQ) 

(SDEFUN |LIST;eq?;2$B;4| ((|x| $) (|y| $) ($ |Boolean|)) (EQ |x| |y|)) 

(PUT '|LIST;first;$S;5| '|SPADreplace| '|SPADfirst|) 

(SDEFUN |LIST;first;$S;5| ((|x| $) ($ S)) (|SPADfirst| |x|)) 

(PUT '|LIST;elt;$firstS;6| '|SPADreplace|
     '(XLAM (|x| "first") (|SPADfirst| |x|))) 

(SDEFUN |LIST;elt;$firstS;6| ((|x| $) (T11 "first") ($ S)) (|SPADfirst| |x|)) 

(PUT '|LIST;empty;$;7| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |LIST;empty;$;7| (($ $)) NIL) 

(PUT '|LIST;empty?;$B;8| '|SPADreplace| 'NULL) 

(SDEFUN |LIST;empty?;$B;8| ((|x| $) ($ |Boolean|)) (NULL |x|)) 

(PUT '|LIST;rest;2$;9| '|SPADreplace| 'CDR) 

(SDEFUN |LIST;rest;2$;9| ((|x| $) ($ $)) (CDR |x|)) 

(PUT '|LIST;elt;$rest$;10| '|SPADreplace| '(XLAM (|x| "rest") (CDR |x|))) 

(SDEFUN |LIST;elt;$rest$;10| ((|x| $) (T12 "rest") ($ $)) (CDR |x|)) 

(PUT '|LIST;qsetfirst!;$2S;11| '|SPADreplace| '|qset_first|) 

(SDEFUN |LIST;qsetfirst!;$2S;11| ((|x| $) (|s| S) ($ S)) (|qset_first| |x| |s|)) 

(SDEFUN |LIST;setfirst!;$2S;12| ((|x| $) (|s| S) ($ S))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_first| |x| |s|)))) 

(SDEFUN |LIST;setelt!;$first2S;13| ((|x| $) (T13 "first") (|s| S) ($ S))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_first| |x| |s|)))) 

(PUT '|LIST;qsetrest!;3$;14| '|SPADreplace| '|qset_rest|) 

(SDEFUN |LIST;qsetrest!;3$;14| ((|x| $) (|y| $) ($ $)) (|qset_rest| |x| |y|)) 

(SDEFUN |LIST;setrest!;3$;15| ((|x| $) (|y| $) ($ $))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_rest| |x| |y|)))) 

(SDEFUN |LIST;setelt!;$rest2$;16| ((|x| $) (T14 "rest") (|y| $) ($ $))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_rest| |x| |y|)))) 

(PUT '|LIST;construct;2$;17| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |LIST;construct;2$;17| ((|l| |List| S) ($ $)) |l|) 

(PUT '|LIST;parts;2$;18| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |LIST;parts;2$;18| ((|s| $) ($ |List| S)) |s|) 

(PUT '|LIST;reverse!;2$;19| '|SPADreplace| 'NREVERSE) 

(SDEFUN |LIST;reverse!;2$;19| ((|x| $) ($ $)) (NREVERSE |x|)) 

(PUT '|LIST;reverse;2$;20| '|SPADreplace| 'REVERSE) 

(SDEFUN |LIST;reverse;2$;20| ((|x| $) ($ $)) (REVERSE |x|)) 

(PUT '|LIST;minIndex;$I;21| '|SPADreplace| '(XLAM (|x|) 1)) 

(SDEFUN |LIST;minIndex;$I;21| ((|x| $) ($ |Integer|)) 1) 

(PUT '|LIST;maxIndex;$I;22| '|SPADreplace| 'LENGTH) 

(SDEFUN |LIST;maxIndex;$I;22| ((|x| $) ($ |Integer|)) (LENGTH |x|)) 

(SDEFUN |LIST;first;$Nni$;23| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|l| ($)) (#1=#:G1715 NIL) (|i| NIL))
               (SEQ (LETT |l| NIL)
                    (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND ((NULL |x|) (|error| "Index out of range"))
                                 ('T
                                  (SEQ
                                   (LETT |l|
                                         (SPADCALL (|SPADfirst| |x|) |l|
                                                   (QREFELT $ 10)))
                                   (EXIT (LETT |x| (CDR |x|))))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |l|))))) 

(SDEFUN |LIST;rest;$Nni$;24| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G1721 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (COND ((NULL |x|) (|error| "index out of range")))
                          (EXIT (LETT |x| (QCDR |x|))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |LIST;copy;2$;25| ((|x| $) ($ $))
        (SPROG ((|y| ($)) (|i| NIL))
               (SEQ (LETT |y| NIL)
                    (SEQ (LETT |i| 0) G190
                         (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                         (SEQ
                          (COND
                           ((EQL |i| 1000)
                            (COND
                             ((SPADCALL |x| (QREFELT $ 37))
                              (|error| "cyclic list")))))
                          (LETT |y| (CONS (QCAR |x|) |y|))
                          (EXIT (LETT |x| (QCDR |x|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |y|))))) 

(SDEFUN |LIST;leaves;2$;26| ((|x| $) ($ |List| S))
        (SPROG ((#1=#:G1734 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (COND ((NULL |x|) NIL)
                       ('T
                        (SEQ (LETT |i| 0) G190
                             (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                             (SEQ
                              (COND
                               ((EQL |i| 1000)
                                (COND
                                 ((SPADCALL |x| (QREFELT $ 37))
                                  (EXIT (|error| "cyclic list"))))))
                              (EXIT
                               (COND
                                ((SPADCALL |x| (QREFELT $ 39))
                                 (PROGN
                                  (LETT #1#
                                        (LIST (SPADCALL |x| (QREFELT $ 40))))
                                  (GO #2=#:G1733)))
                                ('T (LETT |x| (QCDR |x|))))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL)))))
                #2# (EXIT #1#)))) 

(SDEFUN |LIST;coerce;$Of;27| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|z| (|List| (|OutputForm|))) (|y| (|List| (|OutputForm|)))
          (|s| ($)))
         (SEQ (LETT |y| NIL) (LETT |s| (SPADCALL |x| (QREFELT $ 42)))
              (SEQ G190 (COND ((NULL (NULL (EQ |x| |s|))) (GO G191)))
                   (SEQ
                    (LETT |y|
                          (SPADCALL (SPADCALL (|SPADfirst| |x|) (QREFELT $ 44))
                                    |y| (QREFELT $ 46)))
                    (EXIT (LETT |x| (CDR |x|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |y| (NREVERSE |y|))
              (EXIT
               (COND ((NULL |s|) (SPADCALL |y| (QREFELT $ 48)))
                     ('T
                      (SEQ
                       (LETT |z|
                             (SPADCALL
                              (SPADCALL (|SPADfirst| |x|) (QREFELT $ 44))
                              (QREFELT $ 49)))
                       (SEQ G190
                            (COND ((NULL (NULL (EQ |s| (CDR |x|)))) (GO G191)))
                            (SEQ (LETT |x| (CDR |x|))
                                 (EXIT
                                  (LETT |z|
                                        (SPADCALL
                                         (SPADCALL (|SPADfirst| |x|)
                                                   (QREFELT $ 44))
                                         |z| (QREFELT $ 46)))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL
                         (SPADCALL |y|
                                   (SPADCALL
                                    (SPADCALL (NREVERSE |z|) (QREFELT $ 50))
                                    (QREFELT $ 51))
                                   (QREFELT $ 52))
                         (QREFELT $ 48)))))))))) 

(SDEFUN |LIST;=;2$B;28| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G1752 NIL))
               (SEQ
                (EXIT
                 (COND ((EQ |x| |y|) 'T)
                       (#2='T
                        (SEQ
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND ((NULL |x|) NIL)
                                       ('T (NULL (NULL |y|)))))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (QCAR |x|) (QCAR |y|)
                                            (QREFELT $ 54))
                                  (PROGN (LETT #1# NIL) (GO #3=#:G1751)))
                                 ('T
                                  (SEQ (LETT |x| (QCDR |x|))
                                       (EXIT (LETT |y| (QCDR |y|))))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT (COND ((NULL |x|) (NULL |y|)) (#2# NIL)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |LIST;member?;S$B;29| ((|s| S) (|x| $) ($ |Boolean|))
        (SPROG ((#1=#:G1758 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |s| (QCAR |x|) (QREFELT $ 56))
                           (PROGN (LETT #1# 'T) (GO #2=#:G1757)))
                          ('T (LETT |x| (QCDR |x|))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |LIST;latex;$S;30| ((|x| $) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| "\\left[")
                    (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                         (SEQ
                          (LETT |s|
                                (STRCONC |s|
                                         (SPADCALL (QCAR |x|) (QREFELT $ 59))))
                          (LETT |x| (QCDR |x|))
                          (EXIT
                           (COND
                            ((NULL (NULL |x|))
                             (LETT |s| (STRCONC |s| ", "))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (STRCONC |s| " \\right]"))))) 

(SDEFUN |LIST;hashUpdate!;Hs$Hs;31| ((|s| |HashState|) (|x| $) ($ |HashState|))
        (SEQ
         (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
              (SEQ (LETT |s| (SPADCALL |s| (QCAR |x|) (QREFELT $ 62)))
                   (EXIT (LETT |x| (QCDR |x|))))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT |s|))) 

(SDEFUN |LIST;concat!;3$;32| ((|x| $) (|y| $) ($ $))
        (SPROG ((|z| ($)))
               (SEQ
                (COND ((NULL |x|) |y|)
                      ('T
                       (SEQ (LETT |z| |x|)
                            (SEQ G190
                                 (COND
                                  ((NULL (NULL (NULL (QCDR |z|)))) (GO G191)))
                                 (SEQ (EXIT (LETT |z| (QCDR |z|)))) NIL
                                 (GO G190) G191 (EXIT NIL))
                            (|qset_rest| |z| |y|) (EXIT |x|))))))) 

(SDEFUN |LIST;removeDuplicates!;2$;33| ((|l| $) ($ $))
        (SPROG ((|pp| ($)) (|pr| ($)) (|p| ($)) (|f| (S)))
               (SEQ (LETT |p| |l|)
                    (SEQ G190 (COND ((NULL (NULL (NULL |p|))) (GO G191)))
                         (SEQ (LETT |pp| |p|) (LETT |f| (QCAR |p|))
                              (LETT |p| (QCDR |p|))
                              (EXIT
                               (SEQ G190
                                    (COND
                                     ((NULL
                                       (NULL (NULL (LETT |pr| (QCDR |pp|)))))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL (QCAR |pr|) |f|
                                                  (QREFELT $ 56))
                                        (|qset_rest| |pp| (QCDR |pr|)))
                                       ('T (LETT |pp| |pr|)))))
                                    NIL (GO G190) G191 (EXIT NIL))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |l|)))) 

(SDEFUN |LIST;sort!;M2$;34| ((|f| |Mapping| (|Boolean|) S S) (|l| $) ($ $))
        (|LIST;mergeSort| |f| |l| (LENGTH |l|) $)) 

(SDEFUN |LIST;merge!;M3$;35|
        ((|f| |Mapping| (|Boolean|) S S) (|p| $) (|q| $) ($ $))
        (SPROG ((|t| ($)) (|r| ($)))
               (SEQ
                (COND ((NULL |p|) |q|) ((NULL |q|) |p|)
                      ((EQ |p| |q|)
                       (|error| "cannot merge a list into itself"))
                      (#1='T
                       (SEQ
                        (COND
                         ((SPADCALL (QCAR |p|) (QCAR |q|) |f|)
                          (SEQ (LETT |r| (LETT |t| |p|))
                               (EXIT (LETT |p| (QCDR |p|)))))
                         (#1#
                          (SEQ (LETT |r| (LETT |t| |q|))
                               (EXIT (LETT |q| (QCDR |q|))))))
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |p|) NIL) ('T (NULL (NULL |q|)))))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (QCAR |p|) (QCAR |q|) |f|)
                                 (SEQ (|qset_rest| |t| |p|) (LETT |t| |p|)
                                      (EXIT (LETT |p| (QCDR |p|)))))
                                ('T
                                 (SEQ (|qset_rest| |t| |q|) (LETT |t| |q|)
                                      (EXIT (LETT |q| (QCDR |q|))))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (|qset_rest| |t| (COND ((NULL |p|) |q|) (#1# |p|)))
                        (EXIT |r|))))))) 

(SDEFUN |LIST;split!;$Nni$;36| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|q| ($)) (#1=#:G1802 NIL))
               (SEQ
                (COND ((< |n| 1) (|error| "index out of range"))
                      ('T
                       (SEQ
                        (LETT |p|
                              (SPADCALL |p|
                                        (PROG1 (LETT #1# (- |n| 1))
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 36)))
                        (LETT |q| (QCDR |p|)) (|qset_rest| |p| NIL)
                        (EXIT |q|))))))) 

(SDEFUN |LIST;mergeSort|
        ((|f| |Mapping| (|Boolean|) S S) (|p| $) (|n| |Integer|) ($ $))
        (SPROG ((|q| ($)) (|l| (|NonNegativeInteger|)) (#1=#:G1806 NIL))
               (SEQ
                (COND
                 ((EQL |n| 2)
                  (COND
                   ((SPADCALL (|SPADfirst| (CDR |p|)) (|SPADfirst| |p|) |f|)
                    (LETT |p| (NREVERSE |p|))))))
                (EXIT
                 (COND ((< |n| 3) |p|)
                       ('T
                        (SEQ
                         (LETT |l|
                               (PROG1 (LETT #1# (QUOTIENT2 |n| 2))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#)))
                         (LETT |q| (SPADCALL |p| |l| (QREFELT $ 68)))
                         (LETT |p| (|LIST;mergeSort| |f| |p| |l| $))
                         (LETT |q| (|LIST;mergeSort| |f| |q| (- |n| |l|) $))
                         (EXIT (SPADCALL |f| |p| |q| (QREFELT $ 67)))))))))) 

(SDEFUN |LIST;append;3$;38| ((|l| $) (|t| $) ($ $))
        (SPADCALL |l| |t| (QREFELT $ 69))) 

(SDEFUN |LIST;tails;$L;39| ((|x| $) ($ |List| $))
        (SPROG ((#1=#:G1820 NIL) (|i| NIL) (#2=#:G1819 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 0) (LETT #1# (- (LENGTH |x|) 1)) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |x| |i| (QREFELT $ 36)) #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |LIST;writeOMList| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 74))
             (SPADCALL |dev| "list1" "list" (QREFELT $ 75))
             (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                  (SEQ (SPADCALL |dev| (|SPADfirst| |x|) NIL (QREFELT $ 76))
                       (EXIT (LETT |x| (CDR |x|))))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL |dev| (QREFELT $ 77))))) 

(SDEFUN |LIST;OMwrite;Omd$BV;41|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 78))))
             (|LIST;writeOMList| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 79))))))) 

(SDEFUN |LIST;setUnion;3$;42| ((|l1| $) (|l2| $) ($ $))
        (SPADCALL (SPADCALL |l1| |l2| (QREFELT $ 69)) (QREFELT $ 81))) 

(SDEFUN |LIST;setIntersection;3$;43| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|u| ($)))
               (SEQ (LETT |u| NIL) (LETT |l1| (SPADCALL |l1| (QREFELT $ 81)))
                    (SEQ G190 (COND ((NULL (NULL (NULL |l1|))) (GO G191)))
                         (SEQ
                          (COND
                           ((SPADCALL (|SPADfirst| |l1|) |l2| (QREFELT $ 57))
                            (LETT |u| (CONS (|SPADfirst| |l1|) |u|))))
                          (EXIT (LETT |l1| (CDR |l1|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |u|)))) 

(SDEFUN |LIST;setDifference;3$;44| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|lu| ($)) (|l11| (S)))
               (SEQ (LETT |l1| (SPADCALL |l1| (QREFELT $ 81)))
                    (EXIT
                     (COND ((NULL |l2|) |l1|)
                           ('T
                            (SEQ (LETT |lu| NIL)
                                 (SEQ G190
                                      (COND
                                       ((NULL (NULL (NULL |l1|))) (GO G191)))
                                      (SEQ
                                       (LETT |l11|
                                             (SPADCALL |l1| 1 (QREFELT $ 84)))
                                       (COND
                                        ((NULL
                                          (SPADCALL |l11| |l2| (QREFELT $ 57)))
                                         (LETT |lu|
                                               (SPADCALL |l11| |lu|
                                                         (QREFELT $ 10)))))
                                       (EXIT (LETT |l1| (CDR |l1|))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (EXIT |lu|)))))))) 

(SDEFUN |LIST;map!;M2$;45| ((|f| |Mapping| S S) (|l| $) ($ $))
        (SPROG ((|y| ($)))
               (SEQ (LETT |y| |l|)
                    (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                         (SEQ
                          (SPADCALL |l| (SPADCALL (|SPADfirst| |l|) |f|)
                                    (QREFELT $ 22))
                          (EXIT (LETT |l| (CDR |l|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |y|)))) 

(SDEFUN |LIST;convert;$If;46| ((|x| $) ($ |InputForm|))
        (SPROG ((#1=#:G1860 NIL) (|a| NIL) (#2=#:G1859 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL (SPADCALL '|construct| (QREFELT $ 90))
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |a| NIL) (LETT #1# |x|) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |a| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS (SPADCALL |a| (QREFELT $ 91))
                                               #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 93))
                 (QREFELT $ 94))))) 

(DECLAIM (NOTINLINE |List;|)) 

(DEFUN |List| (#1=#:G1873)
  (SPROG NIL
         (PROG (#2=#:G1874)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|List|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|List;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|List|)))))))))) 

(DEFUN |List;| (|#1|)
  (SPROG
   ((#1=#:G1869 NIL) (#2=#:G1870 NIL) (#3=#:G1872 NIL) (#4=#:G1871 NIL)
    (|pv$| NIL) (#5=#:G1866 NIL) (#6=#:G1867 NIL) (#7=#:G1868 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|List| DV$1))
    (LETT $ (GETREFV 106))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|OpenMath|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #6#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #5# #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))))))
    (|haddProp| |$ConstructorCache| '|List| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (LETT #4# (|HasCategory| $ '(|finiteAggregate|)))
         (|augmentPredVector| $ 8192))
    (AND
     (LETT #3#
           (AND (|HasCategory| |#1| '(|OrderedSet|))
                (|HasCategory| $ '(|finiteAggregate|))))
     (|augmentPredVector| $ 16384))
    (AND (OR #5# (AND #7# #4#) #3#) (|augmentPredVector| $ 32768))
    (AND (OR (AND #7# #4#) #3# #6#) (|augmentPredVector| $ 65536))
    (AND (OR (AND #7# #4#) #3#) (|augmentPredVector| $ 131072))
    (AND
     (LETT #2#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|))))
     (|augmentPredVector| $ 262144))
    (AND (OR #2# (AND #7# #4#) #3# #6#) (|augmentPredVector| $ 524288))
    (AND (LETT #1# (|HasCategory| $ '(|shallowlyMutable|)))
         (|augmentPredVector| $ 1048576))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #4# #1#
         (|augmentPredVector| $ 2097152))
    (AND #4# #1# (|augmentPredVector| $ 4194304))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 11)
      (QSETREFV $ 53 (CONS (|dispatchFunction| |LIST;coerce;$Of;27|) $))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 55 (CONS (|dispatchFunction| |LIST;=;2$B;28|) $))
       (QSETREFV $ 57 (CONS (|dispatchFunction| |LIST;member?;S$B;29|) $)))))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV $ 60 (CONS (|dispatchFunction| |LIST;latex;$S;30|) $))
       (QSETREFV $ 62
                 (CONS (|dispatchFunction| |LIST;hashUpdate!;Hs$Hs;31|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV $ 64
                (CONS (|dispatchFunction| |LIST;removeDuplicates!;2$;33|) $))))
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV $ 80
                 (CONS (|dispatchFunction| |LIST;OMwrite;Omd$BV;41|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 82 (CONS (|dispatchFunction| |LIST;setUnion;3$;42|) $))
       (QSETREFV $ 83
                 (CONS (|dispatchFunction| |LIST;setIntersection;3$;43|) $))
       (QSETREFV $ 85
                 (CONS (|dispatchFunction| |LIST;setDifference;3$;44|) $)))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 95 (CONS (|dispatchFunction| |LIST;convert;$If;46|) $))))
    $))) 

(MAKEPROP '|List| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              |LIST;#;$Nni;1| |LIST;cons;S2$;2| |LIST;concat;S2$;3| (|Boolean|)
              |LIST;eq?;2$B;4| |LIST;first;$S;5| '"first" |LIST;elt;$firstS;6|
              |LIST;empty;$;7| |LIST;empty?;$B;8| |LIST;rest;2$;9| '"rest"
              |LIST;elt;$rest$;10| |LIST;qsetfirst!;$2S;11|
              |LIST;setfirst!;$2S;12| |LIST;setelt!;$first2S;13|
              |LIST;qsetrest!;3$;14| |LIST;setrest!;3$;15|
              |LIST;setelt!;$rest2$;16| (|List| 6) |LIST;construct;2$;17|
              |LIST;parts;2$;18| |LIST;reverse!;2$;19| |LIST;reverse;2$;20|
              (|Integer|) |LIST;minIndex;$I;21| |LIST;maxIndex;$I;22|
              |LIST;first;$Nni$;23| |LIST;rest;$Nni$;24| (0 . |cyclic?|)
              |LIST;copy;2$;25| (5 . |leaf?|) (10 . |value|)
              |LIST;leaves;2$;26| (15 . |cycleEntry|) (|OutputForm|)
              (20 . |coerce|) (|List| 43) (25 . |concat|) (|List| $)
              (31 . |bracket|) (36 . |list|) (41 . |commaSeparate|)
              (46 . |overbar|) (51 . |concat!|) (57 . |coerce|) (62 . ~=)
              (68 . =) (74 . =) (80 . |member?|) (|String|) (86 . |latex|)
              (91 . |latex|) (|HashState|) (96 . |hashUpdate!|)
              |LIST;concat!;3$;32| (102 . |removeDuplicates!|)
              (|Mapping| 11 6 6) |LIST;sort!;M2$;34| |LIST;merge!;M3$;35|
              |LIST;split!;$Nni$;36| (107 . |concat|) |LIST;append;3$;38|
              |LIST;tails;$L;39| (|Void|) (|OpenMathDevice|) (113 . |OMputApp|)
              (118 . |OMputSymbol|) (125 . |OMwrite|) (132 . |OMputEndApp|)
              (137 . |OMputObject|) (142 . |OMputEndObject|) (147 . |OMwrite|)
              (154 . |removeDuplicates|) (159 . |setUnion|)
              (165 . |setIntersection|) (171 . |elt|) (177 . |setDifference|)
              (|Mapping| 6 6) |LIST;map!;M2$;45| (|Symbol|) (|InputForm|)
              (183 . |convert|) (188 . |convert|) (|List| 89) (193 . |concat|)
              (199 . |convert|) (204 . |convert|) (|Mapping| 6 6 6)
              (|Equation| 6) (|List| 97) (|SingleInteger|) (|Mapping| 11 6)
              (|UniversalSegment| 32) '"last" '"value" (|List| 32)
              (|Union| 6 '"failed"))
           '#(~= 209 |value| 215 |trim| 220 |third| 226 |tails| 231 |tail| 236
              |swap!| 241 |split!| 248 |sorted?| 254 |sort!| 265 |sort| 276
              |smaller?| 287 |size?| 293 |setvalue!| 299 |setrest!| 305
              |setlast!| 311 |setfirst!| 317 |setelt!| 323 |setchildren!| 365
              |setUnion| 371 |setIntersection| 377 |setDifference| 383
              |select!| 389 |select| 395 |second| 401 |sample| 406 |rightTrim|
              410 |reverse!| 416 |reverse| 421 |rest| 426 |removeDuplicates!|
              437 |removeDuplicates| 442 |remove!| 447 |remove| 459 |reduce|
              471 |qsetrest!| 492 |qsetfirst!| 498 |qsetelt!| 504 |qelt| 511
              |possiblyInfinite?| 517 |position| 522 |parts| 541 |nodes| 546
              |node?| 551 |new| 557 |more?| 563 |minIndex| 569 |min| 574
              |merge!| 585 |merge| 598 |members| 611 |member?| 616 |maxIndex|
              622 |max| 627 |map!| 644 |map| 650 |list| 663 |less?| 668
              |leftTrim| 674 |leaves| 680 |leaf?| 685 |latex| 690 |last| 695
              |insert!| 706 |insert| 720 |indices| 734 |index?| 739
              |hashUpdate!| 745 |hash| 751 |first| 756 |find| 767 |fill!| 773
              |explicitlyFinite?| 779 |every?| 784 |eval| 790 |eq?| 816
              |entry?| 822 |entries| 828 |empty?| 833 |empty| 838 |elt| 842
              |distance| 885 |delete!| 891 |delete| 903 |cyclic?| 915
              |cycleTail| 920 |cycleSplit!| 925 |cycleLength| 930 |cycleEntry|
              935 |count| 940 |copyInto!| 952 |copy| 959 |convert| 964
              |construct| 969 |cons| 974 |concat!| 980 |concat| 997 |coerce|
              1020 |children| 1025 |child?| 1030 |append| 1036 |any?| 1042
              |OMwrite| 1048 >= 1072 > 1078 = 1084 <= 1090 < 1096 |#| 1102)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 0 0 0 0 1 0 6 0 0 8 10 0 0 0 0 0 8
                                  9 12 1 2 3))
            (CONS
             '#(|ListAggregate&| |StreamAggregate&|
                |ExtensibleLinearAggregate&| NIL |UnaryRecursiveAggregate&|
                |LinearAggregate&| |RecursiveAggregate&| |IndexedAggregate&|
                |Collection&| |OrderedSet&| |HomogeneousAggregate&| NIL
                |Aggregate&| |EltableAggregate&| |Evalable&| |SetCategory&| NIL
                NIL NIL NIL NIL |InnerEvalable&| |BasicType&| NIL
                |PartialOrder&| NIL |OpenMath&|)
             (CONS
              '#((|ListAggregate| 6) (|StreamAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|UnaryRecursiveAggregate| 6) (|LinearAggregate| 6)
                 (|RecursiveAggregate| 6) (|IndexedAggregate| 32 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 32 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Eltable| 101 $$) (|Type|)
                 (|Eltable| 32 6) (|InnerEvalable| 6 6) (|BasicType|)
                 (|CoercibleTo| 43) (|PartialOrder|) (|ConvertibleTo| 89)
                 (|OpenMath|))
              (|makeByteWordVec2| 105
                                  '(1 0 11 0 37 1 0 11 0 39 1 0 6 0 40 1 0 0 0
                                    42 1 6 43 0 44 2 45 0 43 0 46 1 43 0 47 48
                                    1 45 0 43 49 1 43 0 47 50 1 43 0 0 51 2 45
                                    0 0 43 52 1 0 43 0 53 2 6 11 0 0 54 2 0 11
                                    0 0 55 2 6 11 0 0 56 2 0 11 6 0 57 1 6 58 0
                                    59 1 0 58 0 60 2 0 61 61 0 62 1 0 0 0 64 2
                                    0 0 0 0 69 1 73 72 0 74 3 73 72 0 58 58 75
                                    3 6 72 73 0 11 76 1 73 72 0 77 1 73 72 0 78
                                    1 73 72 0 79 3 0 72 73 0 11 80 1 0 0 0 81 2
                                    0 0 0 0 82 2 0 0 0 0 83 2 0 6 0 32 84 2 0 0
                                    0 0 85 1 89 0 88 90 1 6 89 0 91 2 92 0 89 0
                                    93 1 89 0 47 94 1 0 89 0 95 2 20 11 0 0 1 1
                                    0 6 0 40 2 19 0 0 6 1 1 0 6 0 1 1 0 47 0 71
                                    1 0 0 0 1 3 21 72 0 32 32 1 2 21 0 0 7 68 1
                                    15 11 0 1 2 14 11 65 0 1 1 22 0 0 1 2 23 0
                                    65 0 66 1 15 0 0 1 2 14 0 65 0 1 2 18 11 0
                                    0 1 2 0 11 0 7 1 2 21 6 0 6 1 2 21 0 0 0 25
                                    2 21 6 0 6 1 2 21 6 0 6 22 3 21 6 0 32 6 1
                                    3 21 6 0 101 6 1 3 21 6 0 102 6 1 3 21 0 0
                                    19 0 26 3 21 6 0 14 6 23 3 21 6 0 103 6 1 2
                                    21 0 0 47 1 2 4 0 0 0 82 2 4 0 0 0 83 2 4 0
                                    0 0 85 2 0 0 100 0 1 2 14 0 100 0 1 1 0 6 0
                                    1 0 0 0 1 2 19 0 0 6 1 1 23 0 0 30 1 14 0 0
                                    31 2 0 0 0 7 36 1 0 0 0 18 1 4 0 0 64 1 19
                                    0 0 81 2 4 0 6 0 1 2 0 0 100 0 1 2 19 0 6 0
                                    1 2 14 0 100 0 1 4 19 6 96 0 6 6 1 3 14 6
                                    96 0 6 1 2 14 6 96 0 1 2 21 0 0 0 24 2 21 6
                                    0 6 21 3 21 6 0 32 6 1 2 0 6 0 32 1 1 0 11
                                    0 1 2 19 32 6 0 1 3 19 32 6 0 32 1 2 14 32
                                    100 0 1 1 14 27 0 29 1 0 47 0 1 2 4 11 0 0
                                    1 2 0 0 7 6 1 2 0 11 0 7 1 1 13 32 0 33 2
                                    15 0 0 0 1 1 15 6 0 1 2 1 0 0 0 1 3 0 0 65
                                    0 0 67 2 15 0 0 0 1 3 14 0 65 0 0 1 1 14 27
                                    0 1 2 19 11 6 0 57 1 13 32 0 34 2 15 0 0 0
                                    1 1 15 6 0 1 2 14 6 65 0 1 2 21 0 86 0 87 3
                                    0 0 96 0 0 1 2 0 0 86 0 1 1 0 0 6 1 2 0 11
                                    0 7 1 2 19 0 0 6 1 1 0 27 0 41 1 0 11 0 39
                                    1 17 58 0 60 2 0 0 0 7 1 1 0 6 0 1 3 0 0 6
                                    0 32 1 3 0 0 0 0 32 1 3 0 0 0 0 32 1 3 0 0
                                    6 0 32 1 1 0 104 0 1 2 0 11 32 0 1 2 17 61
                                    61 0 62 1 17 99 0 1 2 0 0 0 7 35 1 0 6 0 13
                                    2 0 105 100 0 1 2 21 0 0 6 1 1 0 11 0 1 2
                                    14 11 100 0 1 3 8 0 0 6 6 1 3 8 0 0 27 27 1
                                    2 8 0 0 97 1 2 8 0 0 98 1 2 0 11 0 0 12 2
                                    19 11 6 0 1 1 0 27 0 1 1 0 11 0 17 0 0 0 16
                                    2 0 6 0 32 84 3 0 6 0 32 6 1 2 0 0 0 101 1
                                    2 0 6 0 102 1 2 0 0 0 19 20 2 0 6 0 14 15 2
                                    0 6 0 103 1 2 0 32 0 0 1 2 0 0 0 32 1 2 0 0
                                    0 101 1 2 0 0 0 32 1 2 0 0 0 101 1 1 0 11 0
                                    37 1 0 0 0 1 1 21 0 0 1 1 0 7 0 1 1 0 0 0
                                    42 2 19 7 6 0 1 2 14 7 100 0 1 3 23 0 0 0
                                    32 1 1 0 0 0 38 1 2 89 0 95 1 0 0 27 28 2 0
                                    0 6 0 9 1 21 0 47 1 2 0 0 0 6 1 2 0 0 0 0
                                    63 1 0 0 47 1 2 0 0 0 6 1 2 0 0 6 0 10 2 0
                                    0 0 0 69 1 16 43 0 53 1 0 47 0 1 2 4 11 0 0
                                    1 2 0 0 0 0 70 2 14 11 100 0 1 1 3 58 0 1 2
                                    3 72 73 0 1 2 3 58 0 11 1 3 3 72 73 0 11 80
                                    2 15 11 0 0 1 2 15 11 0 0 1 2 20 11 0 0 55
                                    2 15 11 0 0 1 2 15 11 0 0 1 1 14 7 0 8)))))
           '|lookupComplete|)) 
