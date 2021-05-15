
(SDEFUN |PATTERN;coerce;R$;1| ((|r| R) ($ $))
        (|PATTERN;mkPat| 'T (CONS 0 |r|) 0 $)) 

(SDEFUN |PATTERN;mkPat|
        ((|c| |Boolean|)
         (|p| |Union| (|:| |ret| R)
          (|:| |ker|
               (|Record| (|:| |tag| (|SingleInteger|))
                         (|:| |op| (|BasicOperator|)) (|:| |arg| (|List| $))))
          (|:| |exp|
               (|Record| (|:| |val| $)
                         (|:| |exponent| (|NonNegativeInteger|))))
          (|:| |qot| (|Record| (|:| |num| $) (|:| |den| $)))
          (|:| |sym|
               (|Record| (|:| |tag| (|SingleInteger|)) (|:| |val| (|Symbol|))
                         (|:| |pred| (|List| (|Any|)))
                         (|:| |bad| (|List| (|Any|))))))
         (|l| |NonNegativeInteger|) ($ $))
        (VECTOR |c| |p| |l| NIL (QREFELT $ 17))) 

(SDEFUN |PATTERN;hasTopPredicate?;$B;3| ((|x| $) ($ |Boolean|))
        (NULL (NULL (QVELT |x| 3)))) 

(SDEFUN |PATTERN;topPredicate;$R;4|
        ((|x| $)
         ($ |Record| (|:| |var| (|List| (|Symbol|))) (|:| |pred| (|Any|))))
        (CONS (QVELT |x| 3) (QVELT |x| 4))) 

(SDEFUN |PATTERN;setTopPredicate;$LA$;5|
        ((|x| $) (|l| |List| (|Symbol|)) (|f| |Any|) ($ $))
        (SEQ (QSETVELT |x| 3 |l|) (QSETVELT |x| 4 |f|) (EXIT |x|))) 

(PUT '|PATTERN;constant?;$B;6| '|SPADreplace| '(XLAM (|p|) (QVELT |p| 0))) 

(SDEFUN |PATTERN;constant?;$B;6| ((|p| $) ($ |Boolean|)) (QVELT |p| 0)) 

(PUT '|PATTERN;depth;$Nni;7| '|SPADreplace| '(XLAM (|p|) (QVELT |p| 2))) 

(SDEFUN |PATTERN;depth;$Nni;7| ((|p| $) ($ |NonNegativeInteger|)) (QVELT |p| 2)) 

(SDEFUN |PATTERN;inR?;$B;8| ((|p| $) ($ |Boolean|)) (QEQCAR (QVELT |p| 1) 0)) 

(SDEFUN |PATTERN;symbol?;$B;9| ((|p| $) ($ |Boolean|)) (QEQCAR (QVELT |p| 1) 4)) 

(SDEFUN |PATTERN;isPlus;$U;10| ((|p| $) ($ |Union| (|List| $) "failed"))
        (|PATTERN;isTaggedOp| |p| 1 $)) 

(SDEFUN |PATTERN;isTimes;$U;11| ((|p| $) ($ |Union| (|List| $) "failed"))
        (|PATTERN;isTaggedOp| |p| (SPADCALL 2 (QREFELT $ 33)) $)) 

(SDEFUN |PATTERN;isList;$U;12| ((|p| $) ($ |Union| (|List| $) "failed"))
        (|PATTERN;isTaggedOp| |p| (SPADCALL 3 (QREFELT $ 33)) $)) 

(SDEFUN |PATTERN;isExpt;$U;13|
        ((|p| $)
         ($ |Union|
          (|Record| (|:| |val| $) (|:| |exponent| (|NonNegativeInteger|)))
          "failed"))
        (SPROG ((#1=#:G435 NIL))
               (COND
                ((QEQCAR (QVELT |p| 1) 2)
                 (CONS 0
                       (PROG2 (LETT #1# (QVELT |p| 1))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 2)
                                         (|Record| (|:| |val| $)
                                                   (|:| |exponent|
                                                        (|NonNegativeInteger|)))
                                         (|Union| (|:| |ret| (QREFELT $ 6))
                                                  (|:| |ker|
                                                       (|Record|
                                                        (|:| |tag|
                                                             (|SingleInteger|))
                                                        (|:| |op|
                                                             (|BasicOperator|))
                                                        (|:| |arg|
                                                             (|List| $))))
                                                  (|:| |exp|
                                                       (|Record| (|:| |val| $)
                                                                 (|:|
                                                                  |exponent|
                                                                  (|NonNegativeInteger|))))
                                                  (|:| |qot|
                                                       (|Record| (|:| |num| $)
                                                                 (|:| |den|
                                                                      $)))
                                                  (|:| |sym|
                                                       (|Record|
                                                        (|:| |tag|
                                                             (|SingleInteger|))
                                                        (|:| |val| (|Symbol|))
                                                        (|:| |pred|
                                                             (|List| (|Any|)))
                                                        (|:| |bad|
                                                             (|List|
                                                              (|Any|))))))
                                         #1#))))
                ('T (CONS 1 "failed"))))) 

(SDEFUN |PATTERN;isQuotient;$U;14|
        ((|p| $) ($ |Union| (|Record| (|:| |num| $) (|:| |den| $)) "failed"))
        (SPROG ((#1=#:G436 NIL))
               (COND
                ((QEQCAR (QVELT |p| 1) 3)
                 (CONS 0
                       (PROG2 (LETT #1# (QVELT |p| 1))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 3)
                                         (|Record| (|:| |num| $) (|:| |den| $))
                                         (|Union| (|:| |ret| (QREFELT $ 6))
                                                  (|:| |ker|
                                                       (|Record|
                                                        (|:| |tag|
                                                             (|SingleInteger|))
                                                        (|:| |op|
                                                             (|BasicOperator|))
                                                        (|:| |arg|
                                                             (|List| $))))
                                                  (|:| |exp|
                                                       (|Record| (|:| |val| $)
                                                                 (|:|
                                                                  |exponent|
                                                                  (|NonNegativeInteger|))))
                                                  (|:| |qot|
                                                       (|Record| (|:| |num| $)
                                                                 (|:| |den|
                                                                      $)))
                                                  (|:| |sym|
                                                       (|Record|
                                                        (|:| |tag|
                                                             (|SingleInteger|))
                                                        (|:| |val| (|Symbol|))
                                                        (|:| |pred|
                                                             (|List| (|Any|)))
                                                        (|:| |bad|
                                                             (|List|
                                                              (|Any|))))))
                                         #1#))))
                ('T (CONS 1 "failed"))))) 

(SDEFUN |PATTERN;hasPredicate?;$B;15| ((|p| $) ($ |Boolean|))
        (NULL (NULL (SPADCALL |p| (QREFELT $ 43))))) 

(SDEFUN |PATTERN;quoted?;$B;16| ((|p| $) ($ |Boolean|))
        (SPROG ((#1=#:G437 NIL))
               (COND
                ((SPADCALL |p| (QREFELT $ 29))
                 (ZEROP
                  (QVELT
                   (PROG2 (LETT #1# (QVELT |p| 1))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 4)
                                     (|Record| (|:| |tag| (|SingleInteger|))
                                               (|:| |val| (|Symbol|))
                                               (|:| |pred| (|List| (|Any|)))
                                               (|:| |bad| (|List| (|Any|))))
                                     (|Union| (|:| |ret| (QREFELT $ 6))
                                              (|:| |ker|
                                                   (|Record|
                                                    (|:| |tag|
                                                         (|SingleInteger|))
                                                    (|:| |op|
                                                         (|BasicOperator|))
                                                    (|:| |arg| (|List| $))))
                                              (|:| |exp|
                                                   (|Record| (|:| |val| $)
                                                             (|:| |exponent|
                                                                  (|NonNegativeInteger|))))
                                              (|:| |qot|
                                                   (|Record| (|:| |num| $)
                                                             (|:| |den| $)))
                                              (|:| |sym|
                                                   (|Record|
                                                    (|:| |tag|
                                                         (|SingleInteger|))
                                                    (|:| |val| (|Symbol|))
                                                    (|:| |pred|
                                                         (|List| (|Any|)))
                                                    (|:| |bad|
                                                         (|List| (|Any|))))))
                                     #1#))
                   0)))
                ('T NIL)))) 

(SDEFUN |PATTERN;generic?;$B;17| ((|p| $) ($ |Boolean|))
        (SPROG ((#1=#:G437 NIL))
               (COND
                ((SPADCALL |p| (QREFELT $ 29))
                 (|PATTERN;bitSet?|
                  (QVELT
                   (PROG2 (LETT #1# (QVELT |p| 1))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 4)
                                     (|Record| (|:| |tag| (|SingleInteger|))
                                               (|:| |val| (|Symbol|))
                                               (|:| |pred| (|List| (|Any|)))
                                               (|:| |bad| (|List| (|Any|))))
                                     (|Union| (|:| |ret| (QREFELT $ 6))
                                              (|:| |ker|
                                                   (|Record|
                                                    (|:| |tag|
                                                         (|SingleInteger|))
                                                    (|:| |op|
                                                         (|BasicOperator|))
                                                    (|:| |arg| (|List| $))))
                                              (|:| |exp|
                                                   (|Record| (|:| |val| $)
                                                             (|:| |exponent|
                                                                  (|NonNegativeInteger|))))
                                              (|:| |qot|
                                                   (|Record| (|:| |num| $)
                                                             (|:| |den| $)))
                                              (|:| |sym|
                                                   (|Record|
                                                    (|:| |tag|
                                                         (|SingleInteger|))
                                                    (|:| |val| (|Symbol|))
                                                    (|:| |pred|
                                                         (|List| (|Any|)))
                                                    (|:| |bad|
                                                         (|List| (|Any|))))))
                                     #1#))
                   0)
                  1 $))
                ('T NIL)))) 

(SDEFUN |PATTERN;multiple?;$B;18| ((|p| $) ($ |Boolean|))
        (SPROG ((#1=#:G437 NIL))
               (COND
                ((SPADCALL |p| (QREFELT $ 29))
                 (|PATTERN;bitSet?|
                  (QVELT
                   (PROG2 (LETT #1# (QVELT |p| 1))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 4)
                                     (|Record| (|:| |tag| (|SingleInteger|))
                                               (|:| |val| (|Symbol|))
                                               (|:| |pred| (|List| (|Any|)))
                                               (|:| |bad| (|List| (|Any|))))
                                     (|Union| (|:| |ret| (QREFELT $ 6))
                                              (|:| |ker|
                                                   (|Record|
                                                    (|:| |tag|
                                                         (|SingleInteger|))
                                                    (|:| |op|
                                                         (|BasicOperator|))
                                                    (|:| |arg| (|List| $))))
                                              (|:| |exp|
                                                   (|Record| (|:| |val| $)
                                                             (|:| |exponent|
                                                                  (|NonNegativeInteger|))))
                                              (|:| |qot|
                                                   (|Record| (|:| |num| $)
                                                             (|:| |den| $)))
                                              (|:| |sym|
                                                   (|Record|
                                                    (|:| |tag|
                                                         (|SingleInteger|))
                                                    (|:| |val| (|Symbol|))
                                                    (|:| |pred|
                                                         (|List| (|Any|)))
                                                    (|:| |bad|
                                                         (|List| (|Any|))))))
                                     #1#))
                   0)
                  (SPADCALL 2 (QREFELT $ 33)) $))
                ('T NIL)))) 

(SDEFUN |PATTERN;optional?;$B;19| ((|p| $) ($ |Boolean|))
        (SPROG ((#1=#:G437 NIL))
               (COND
                ((SPADCALL |p| (QREFELT $ 29))
                 (|PATTERN;bitSet?|
                  (QVELT
                   (PROG2 (LETT #1# (QVELT |p| 1))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 4)
                                     (|Record| (|:| |tag| (|SingleInteger|))
                                               (|:| |val| (|Symbol|))
                                               (|:| |pred| (|List| (|Any|)))
                                               (|:| |bad| (|List| (|Any|))))
                                     (|Union| (|:| |ret| (QREFELT $ 6))
                                              (|:| |ker|
                                                   (|Record|
                                                    (|:| |tag|
                                                         (|SingleInteger|))
                                                    (|:| |op|
                                                         (|BasicOperator|))
                                                    (|:| |arg| (|List| $))))
                                              (|:| |exp|
                                                   (|Record| (|:| |val| $)
                                                             (|:| |exponent|
                                                                  (|NonNegativeInteger|))))
                                              (|:| |qot|
                                                   (|Record| (|:| |num| $)
                                                             (|:| |den| $)))
                                              (|:| |sym|
                                                   (|Record|
                                                    (|:| |tag|
                                                         (|SingleInteger|))
                                                    (|:| |val| (|Symbol|))
                                                    (|:| |pred|
                                                         (|List| (|Any|)))
                                                    (|:| |bad|
                                                         (|List| (|Any|))))))
                                     #1#))
                   0)
                  (SPADCALL 4 (QREFELT $ 33)) $))
                ('T NIL)))) 

(SDEFUN |PATTERN;bitSet?|
        ((|a| |SingleInteger|) (|b| |SingleInteger|) ($ |Boolean|))
        (SPADCALL (|and_SI| |a| |b|) 0 (QREFELT $ 49))) 

(SDEFUN |PATTERN;coerce;$Of;21| ((|p| $) ($ |OutputForm|))
        (|PATTERN;PAT2O| (QVELT |p| 1) $)) 

(SDEFUN |PATTERN;^;3$;22| ((|p1| $) (|p2| $) ($ $))
        (|PATTERN;taggedElt| (SPADCALL 6 (QREFELT $ 33)) (LIST |p1| |p2|) $)) 

(SDEFUN |PATTERN;LPAT2O|
        ((|f| |Mapping| (|OutputForm|) (|OutputForm|) (|OutputForm|))
         (|l| |List| $) ($ |OutputForm|))
        (SPROG ((#1=#:G503 NIL) (|x| NIL) (#2=#:G502 NIL))
               (SEQ
                (SPADCALL |f|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |x| NIL) (LETT #1# |l|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |x| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |x| (QREFELT $ 51))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 55))))) 

(SDEFUN |PATTERN;retract;$R;24| ((|p| $) ($ R))
        (SPROG ((#1=#:G433 NIL))
               (COND
                ((SPADCALL |p| (QREFELT $ 28))
                 (PROG2 (LETT #1# (QVELT |p| 1))
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                   (|Union| (|:| |ret| (QREFELT $ 6))
                                            (|:| |ker|
                                                 (|Record|
                                                  (|:| |tag| (|SingleInteger|))
                                                  (|:| |op| (|BasicOperator|))
                                                  (|:| |arg| (|List| $))))
                                            (|:| |exp|
                                                 (|Record| (|:| |val| $)
                                                           (|:| |exponent|
                                                                (|NonNegativeInteger|))))
                                            (|:| |qot|
                                                 (|Record| (|:| |num| $)
                                                           (|:| |den| $)))
                                            (|:| |sym|
                                                 (|Record|
                                                  (|:| |tag| (|SingleInteger|))
                                                  (|:| |val| (|Symbol|))
                                                  (|:| |pred| (|List| (|Any|)))
                                                  (|:| |bad|
                                                       (|List| (|Any|))))))
                                   #1#)))
                ('T (|error| "Not retractable"))))) 

(SDEFUN |PATTERN;convert;L$;25| ((|l| |List| $) ($ $))
        (|PATTERN;taggedElt| (SPADCALL 3 (QREFELT $ 33)) |l| $)) 

(SDEFUN |PATTERN;retractIfCan;$U;26| ((|p| $) ($ |Union| R "failed"))
        (SPROG ((#1=#:G433 NIL))
               (COND
                ((SPADCALL |p| (QREFELT $ 28))
                 (CONS 0
                       (PROG2 (LETT #1# (QVELT |p| 1))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                         (|Union| (|:| |ret| (QREFELT $ 6))
                                                  (|:| |ker|
                                                       (|Record|
                                                        (|:| |tag|
                                                             (|SingleInteger|))
                                                        (|:| |op|
                                                             (|BasicOperator|))
                                                        (|:| |arg|
                                                             (|List| $))))
                                                  (|:| |exp|
                                                       (|Record| (|:| |val| $)
                                                                 (|:|
                                                                  |exponent|
                                                                  (|NonNegativeInteger|))))
                                                  (|:| |qot|
                                                       (|Record| (|:| |num| $)
                                                                 (|:| |den|
                                                                      $)))
                                                  (|:| |sym|
                                                       (|Record|
                                                        (|:| |tag|
                                                             (|SingleInteger|))
                                                        (|:| |val| (|Symbol|))
                                                        (|:| |pred|
                                                             (|List| (|Any|)))
                                                        (|:| |bad|
                                                             (|List|
                                                              (|Any|))))))
                                         #1#))))
                ('T (CONS 1 "failed"))))) 

(SDEFUN |PATTERN;withPredicates;$L$;27| ((|p| $) (|l| |List| (|Any|)) ($ $))
        (SPADCALL (SPADCALL |p| (QREFELT $ 61)) |l| (QREFELT $ 62))) 

(SDEFUN |PATTERN;coerce;S$;28| ((|sy| |Symbol|) ($ $))
        (SPADCALL |sy| NIL NIL NIL (QREFELT $ 64))) 

(SDEFUN |PATTERN;copy;2$;29| ((|p| $) ($ $))
        (VECTOR (SPADCALL |p| (QREFELT $ 25))
                (|PATTERN;patcopy| (QVELT |p| 1) $) (QVELT |p| 2) (QVELT |p| 3)
                (QVELT |p| 4))) 

(SDEFUN |PATTERN;optpair;LU;30|
        ((|l| |List| $) ($ |Union| (|List| $) "failed"))
        (SPROG ((|a| ($)) (|b| ($)))
               (SEQ
                (COND
                 ((SPADCALL
                   (SPADCALL (SPADCALL |l| (QREFELT $ 67)) (QREFELT $ 67))
                   (QREFELT $ 68))
                  (SEQ
                   (LETT |b|
                         (SPADCALL (SPADCALL |l| (QREFELT $ 67))
                                   (QREFELT $ 69)))
                   (EXIT
                    (COND
                     ((SPADCALL (LETT |a| (SPADCALL |l| (QREFELT $ 69)))
                                (QREFELT $ 48))
                      (CONS 0 |l|))
                     ((SPADCALL |b| (QREFELT $ 48))
                      (CONS 0 (SPADCALL |l| (QREFELT $ 70))))
                     (#1='T (CONS 1 "failed"))))))
                 (#1# (CONS 1 "failed")))))) 

(SDEFUN |PATTERN;incmax| ((|l| |List| $) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G530 NIL) (|p| NIL) (#2=#:G529 NIL))
               (SEQ
                (+ 1
                   (SPADCALL (ELT $ 73)
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |p| NIL) (LETT #1# |l|) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |p| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT (LETT #2# (CONS (QVELT |p| 2) #2#))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             0 (QREFELT $ 76)))))) 

(SDEFUN |PATTERN;=;2$B;32| ((|p1| $) (|p2| $) ($ |Boolean|))
        (COND
         ((|BooleanEquality| (QVELT |p1| 0) (QVELT |p2| 0))
          (COND
           ((EQL (QVELT |p1| 2) (QVELT |p2| 2))
            (COND
             ((SPADCALL (QVELT |p1| 3) (QVELT |p2| 3) (QREFELT $ 77))
              (COND
               ((EQ (QVELT |p1| 4) (QVELT |p2| 4))
                (|PATTERN;pateq?| (QVELT |p1| 1) (QVELT |p2| 1) $))
               (#1='T NIL)))
             (#1# NIL)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |PATTERN;isPower;$U;33|
        ((|p| $)
         ($ |Union| (|Record| (|:| |val| $) (|:| |exponent| $)) "failed"))
        (SPROG ((|u| (|Union| (|List| $) "failed")))
               (SEQ
                (LETT |u|
                      (|PATTERN;isTaggedOp| |p| (SPADCALL 6 (QREFELT $ 33)) $))
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (CONS (SPADCALL (QCDR |u|) (QREFELT $ 69))
                                    (SPADCALL (QCDR |u|) (QREFELT $ 79)))))))))) 

(SDEFUN |PATTERN;taggedElt| ((|n| |SingleInteger|) (|l| |List| $) ($ $))
        (|PATTERN;mkPat| (SPADCALL (ELT $ 25) |l| (QREFELT $ 84))
         (CONS 1 (VECTOR |n| (QREFELT $ 12) |l|)) (|PATTERN;incmax| |l| $) $)) 

(SDEFUN |PATTERN;elt;BoL$;35| ((|o| |BasicOperator|) (|l| |List| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL |o| '|%power| (QREFELT $ 85))
           (COND
            ((EQL (SPADCALL |l| (QREFELT $ 86)) 2)
             (EXIT
              (SPADCALL (SPADCALL |l| (QREFELT $ 69))
                        (SPADCALL |l| (QREFELT $ 87)) (QREFELT $ 52)))))))
         (EXIT
          (|PATTERN;mkPat| (SPADCALL (ELT $ 25) |l| (QREFELT $ 84))
           (CONS 1 (VECTOR 0 |o| |l|)) (|PATTERN;incmax| |l| $) $)))) 

(SDEFUN |PATTERN;isOp;$U;36|
        ((|p| $)
         ($ |Union|
          (|Record| (|:| |op| (|BasicOperator|)) (|:| |arg| (|List| $)))
          "failed"))
        (SPROG ((#1=#:G434 NIL))
               (SEQ
                (COND
                 ((QEQCAR (QVELT |p| 1) 1)
                  (COND
                   ((ZEROP
                     (QVELT
                      (PROG2 (LETT #1# (QVELT |p| 1))
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 1)
                                        (|Record| (|:| |tag| (|SingleInteger|))
                                                  (|:| |op| (|BasicOperator|))
                                                  (|:| |arg| (|List| $)))
                                        (|Union| (|:| |ret| (QREFELT $ 6))
                                                 (|:| |ker|
                                                      (|Record|
                                                       (|:| |tag|
                                                            (|SingleInteger|))
                                                       (|:| |op|
                                                            (|BasicOperator|))
                                                       (|:| |arg| (|List| $))))
                                                 (|:| |exp|
                                                      (|Record| (|:| |val| $)
                                                                (|:| |exponent|
                                                                     (|NonNegativeInteger|))))
                                                 (|:| |qot|
                                                      (|Record| (|:| |num| $)
                                                                (|:| |den| $)))
                                                 (|:| |sym|
                                                      (|Record|
                                                       (|:| |tag|
                                                            (|SingleInteger|))
                                                       (|:| |val| (|Symbol|))
                                                       (|:| |pred|
                                                            (|List| (|Any|)))
                                                       (|:| |bad|
                                                            (|List|
                                                             (|Any|))))))
                                        #1#))
                      0))
                    (EXIT
                     (CONS 0
                           (CONS
                            (QVELT
                             (PROG2 (LETT #1# (QVELT |p| 1))
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 1)
                                               (|Record|
                                                (|:| |tag| (|SingleInteger|))
                                                (|:| |op| (|BasicOperator|))
                                                (|:| |arg| (|List| $)))
                                               (|Union|
                                                (|:| |ret| (QREFELT $ 6))
                                                (|:| |ker|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |op|
                                                           (|BasicOperator|))
                                                      (|:| |arg| (|List| $))))
                                                (|:| |exp|
                                                     (|Record| (|:| |val| $)
                                                               (|:| |exponent|
                                                                    (|NonNegativeInteger|))))
                                                (|:| |qot|
                                                     (|Record| (|:| |num| $)
                                                               (|:| |den| $)))
                                                (|:| |sym|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |val| (|Symbol|))
                                                      (|:| |pred|
                                                           (|List| (|Any|)))
                                                      (|:| |bad|
                                                           (|List| (|Any|))))))
                                               #1#))
                             1)
                            (QVELT
                             (PROG2 (LETT #1# (QVELT |p| 1))
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 1)
                                               (|Record|
                                                (|:| |tag| (|SingleInteger|))
                                                (|:| |op| (|BasicOperator|))
                                                (|:| |arg| (|List| $)))
                                               (|Union|
                                                (|:| |ret| (QREFELT $ 6))
                                                (|:| |ker|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |op|
                                                           (|BasicOperator|))
                                                      (|:| |arg| (|List| $))))
                                                (|:| |exp|
                                                     (|Record| (|:| |val| $)
                                                               (|:| |exponent|
                                                                    (|NonNegativeInteger|))))
                                                (|:| |qot|
                                                     (|Record| (|:| |num| $)
                                                               (|:| |den| $)))
                                                (|:| |sym|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |val| (|Symbol|))
                                                      (|:| |pred|
                                                           (|List| (|Any|)))
                                                      (|:| |bad|
                                                           (|List| (|Any|))))))
                                               #1#))
                             2))))))))
                (EXIT (CONS 1 "failed"))))) 

(SDEFUN |PATTERN;isTaggedOp|
        ((|p| $) (|t| |SingleInteger|) ($ |Union| (|List| $) "failed"))
        (SPROG ((#1=#:G434 NIL))
               (SEQ
                (COND
                 ((QEQCAR (QVELT |p| 1) 1)
                  (COND
                   ((|eql_SI|
                     (QVELT
                      (PROG2 (LETT #1# (QVELT |p| 1))
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 1)
                                        (|Record| (|:| |tag| (|SingleInteger|))
                                                  (|:| |op| (|BasicOperator|))
                                                  (|:| |arg| (|List| $)))
                                        (|Union| (|:| |ret| (QREFELT $ 6))
                                                 (|:| |ker|
                                                      (|Record|
                                                       (|:| |tag|
                                                            (|SingleInteger|))
                                                       (|:| |op|
                                                            (|BasicOperator|))
                                                       (|:| |arg| (|List| $))))
                                                 (|:| |exp|
                                                      (|Record| (|:| |val| $)
                                                                (|:| |exponent|
                                                                     (|NonNegativeInteger|))))
                                                 (|:| |qot|
                                                      (|Record| (|:| |num| $)
                                                                (|:| |den| $)))
                                                 (|:| |sym|
                                                      (|Record|
                                                       (|:| |tag|
                                                            (|SingleInteger|))
                                                       (|:| |val| (|Symbol|))
                                                       (|:| |pred|
                                                            (|List| (|Any|)))
                                                       (|:| |bad|
                                                            (|List|
                                                             (|Any|))))))
                                        #1#))
                      0)
                     |t|)
                    (EXIT
                     (CONS 0
                           (QVELT
                            (PROG2 (LETT #1# (QVELT |p| 1))
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 1)
                                              (|Record|
                                               (|:| |tag| (|SingleInteger|))
                                               (|:| |op| (|BasicOperator|))
                                               (|:| |arg| (|List| $)))
                                              (|Union|
                                               (|:| |ret| (QREFELT $ 6))
                                               (|:| |ker|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |op|
                                                          (|BasicOperator|))
                                                     (|:| |arg| (|List| $))))
                                               (|:| |exp|
                                                    (|Record| (|:| |val| $)
                                                              (|:| |exponent|
                                                                   (|NonNegativeInteger|))))
                                               (|:| |qot|
                                                    (|Record| (|:| |num| $)
                                                              (|:| |den| $)))
                                               (|:| |sym|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |val| (|Symbol|))
                                                     (|:| |pred|
                                                          (|List| (|Any|)))
                                                     (|:| |bad|
                                                          (|List| (|Any|))))))
                                              #1#))
                            2)))))))
                (EXIT (CONS 1 "failed"))))) 

(SDEFUN |PATTERN;One;$;38| (($ $))
        (SPADCALL (|spadConstant| $ 93) (QREFELT $ 18))) 

(SDEFUN |PATTERN;One;$;39| (($ $))
        (|PATTERN;taggedElt| (SPADCALL 5 (QREFELT $ 33))
         (SPADCALL (QREFELT $ 94)) $)) 

(SDEFUN |PATTERN;Zero;$;40| (($ $))
        (SPADCALL (|spadConstant| $ 95) (QREFELT $ 18))) 

(SDEFUN |PATTERN;Zero;$;41| (($ $))
        (|PATTERN;taggedElt| (SPADCALL 4 (QREFELT $ 33))
         (SPADCALL (QREFELT $ 94)) $)) 

(SDEFUN |PATTERN;^;$Nni$;42| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SEQ
         (COND
          ((SPADCALL |p| (|spadConstant| $ 88) (QREFELT $ 78))
           (COND ((> |n| 0) (EXIT (|spadConstant| $ 88))))))
         (COND
          ((OR (SPADCALL |p| (|spadConstant| $ 72) (QREFELT $ 78)) (ZEROP |n|))
           (EXIT (|spadConstant| $ 72))))
         (EXIT
          (COND ((EQL |n| 1) |p|)
                ('T
                 (|PATTERN;mkPat| (SPADCALL |p| (QREFELT $ 25))
                  (CONS 2 (CONS |p| |n|)) (+ 1 (QVELT |p| 2)) $)))))) 

(SDEFUN |PATTERN;/;3$;43| ((|p1| $) (|p2| $) ($ $))
        (COND ((SPADCALL |p2| (|spadConstant| $ 72) (QREFELT $ 78)) |p1|)
              (#1='T
               (|PATTERN;mkPat|
                (COND
                 ((SPADCALL |p1| (QREFELT $ 25))
                  (SPADCALL |p2| (QREFELT $ 25)))
                 (#1# NIL))
                (CONS 3 (CONS |p1| |p2|))
                (+ 1 (MAX (QVELT |p1| 2) (QVELT |p2| 2))) $)))) 

(SDEFUN |PATTERN;+;3$;44| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|u2| #1=(|Union| (|List| $) "failed")) (|u1| #1#))
               (SEQ
                (COND
                 ((SPADCALL |p1| (|spadConstant| $ 88) (QREFELT $ 78)) |p2|)
                 ((SPADCALL |p2| (|spadConstant| $ 88) (QREFELT $ 78)) |p1|)
                 (#2='T
                  (SEQ (LETT |u1| (SPADCALL |p1| (QREFELT $ 31)))
                       (EXIT
                        (COND
                         ((QEQCAR |u1| 0)
                          (SEQ (LETT |u2| (SPADCALL |p2| (QREFELT $ 31)))
                               (EXIT
                                (COND
                                 ((QEQCAR |u2| 0)
                                  (|PATTERN;taggedElt| 1
                                   (SPADCALL (QCDR |u1|) (QCDR |u2|)
                                             (QREFELT $ 98))
                                   $))
                                 (#2#
                                  (|PATTERN;taggedElt| 1
                                   (SPADCALL (QCDR |u1|) |p2| (QREFELT $ 99))
                                   $))))))
                         (#2#
                          (SEQ (LETT |u2| (SPADCALL |p2| (QREFELT $ 31)))
                               (EXIT
                                (COND
                                 ((QEQCAR |u2| 0)
                                  (|PATTERN;taggedElt| 1
                                   (SPADCALL |p1| (QCDR |u2|) (QREFELT $ 100))
                                   $))
                                 (#2#
                                  (|PATTERN;taggedElt| 1 (LIST |p1| |p2|)
                                   $)))))))))))))) 

(SDEFUN |PATTERN;*;3$;45| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|u2| #1=(|Union| (|List| $) "failed")) (|u1| #1#))
               (SEQ
                (COND
                 ((OR (SPADCALL |p1| (|spadConstant| $ 88) (QREFELT $ 78))
                      (SPADCALL |p2| (|spadConstant| $ 88) (QREFELT $ 78)))
                  (|spadConstant| $ 88))
                 ('T
                  (COND
                   ((SPADCALL |p1| (|spadConstant| $ 72) (QREFELT $ 78)) |p2|)
                   ((SPADCALL |p2| (|spadConstant| $ 72) (QREFELT $ 78)) |p1|)
                   (#2='T
                    (SEQ (LETT |u1| (SPADCALL |p1| (QREFELT $ 34)))
                         (EXIT
                          (COND
                           ((QEQCAR |u1| 0)
                            (SEQ (LETT |u2| (SPADCALL |p2| (QREFELT $ 34)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |u2| 0)
                                    (|PATTERN;taggedElt|
                                     (SPADCALL 2 (QREFELT $ 33))
                                     (SPADCALL (QCDR |u1|) (QCDR |u2|)
                                               (QREFELT $ 98))
                                     $))
                                   (#2#
                                    (|PATTERN;taggedElt|
                                     (SPADCALL 2 (QREFELT $ 33))
                                     (SPADCALL (QCDR |u1|) |p2| (QREFELT $ 99))
                                     $))))))
                           (#2#
                            (SEQ (LETT |u2| (SPADCALL |p2| (QREFELT $ 34)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |u2| 0)
                                    (|PATTERN;taggedElt|
                                     (SPADCALL 2 (QREFELT $ 33))
                                     (SPADCALL |p1| (QCDR |u2|)
                                               (QREFELT $ 100))
                                     $))
                                   (#2#
                                    (|PATTERN;taggedElt|
                                     (SPADCALL 2 (QREFELT $ 33))
                                     (LIST |p1| |p2|) $)))))))))))))))) 

(SDEFUN |PATTERN;isOp;$BoU;46|
        ((|p| $) (|o| |BasicOperator|) ($ |Union| (|List| $) "failed"))
        (SPROG ((#1=#:G434 NIL))
               (SEQ
                (COND
                 ((QEQCAR (QVELT |p| 1) 1)
                  (COND
                   ((ZEROP
                     (QVELT
                      (PROG2 (LETT #1# (QVELT |p| 1))
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 1)
                                        (|Record| (|:| |tag| (|SingleInteger|))
                                                  (|:| |op| (|BasicOperator|))
                                                  (|:| |arg| (|List| $)))
                                        (|Union| (|:| |ret| (QREFELT $ 6))
                                                 (|:| |ker|
                                                      (|Record|
                                                       (|:| |tag|
                                                            (|SingleInteger|))
                                                       (|:| |op|
                                                            (|BasicOperator|))
                                                       (|:| |arg| (|List| $))))
                                                 (|:| |exp|
                                                      (|Record| (|:| |val| $)
                                                                (|:| |exponent|
                                                                     (|NonNegativeInteger|))))
                                                 (|:| |qot|
                                                      (|Record| (|:| |num| $)
                                                                (|:| |den| $)))
                                                 (|:| |sym|
                                                      (|Record|
                                                       (|:| |tag|
                                                            (|SingleInteger|))
                                                       (|:| |val| (|Symbol|))
                                                       (|:| |pred|
                                                            (|List| (|Any|)))
                                                       (|:| |bad|
                                                            (|List|
                                                             (|Any|))))))
                                        #1#))
                      0))
                    (COND
                     ((SPADCALL
                       (QVELT
                        (PROG2 (LETT #1# (QVELT |p| 1))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 1)
                                          (|Record|
                                           (|:| |tag| (|SingleInteger|))
                                           (|:| |op| (|BasicOperator|))
                                           (|:| |arg| (|List| $)))
                                          (|Union| (|:| |ret| (QREFELT $ 6))
                                                   (|:| |ker|
                                                        (|Record|
                                                         (|:| |tag|
                                                              (|SingleInteger|))
                                                         (|:| |op|
                                                              (|BasicOperator|))
                                                         (|:| |arg|
                                                              (|List| $))))
                                                   (|:| |exp|
                                                        (|Record| (|:| |val| $)
                                                                  (|:|
                                                                   |exponent|
                                                                   (|NonNegativeInteger|))))
                                                   (|:| |qot|
                                                        (|Record| (|:| |num| $)
                                                                  (|:| |den|
                                                                       $)))
                                                   (|:| |sym|
                                                        (|Record|
                                                         (|:| |tag|
                                                              (|SingleInteger|))
                                                         (|:| |val| (|Symbol|))
                                                         (|:| |pred|
                                                              (|List| (|Any|)))
                                                         (|:| |bad|
                                                              (|List|
                                                               (|Any|))))))
                                          #1#))
                        1)
                       |o| (QREFELT $ 103))
                      (EXIT
                       (CONS 0
                             (QVELT
                              (PROG2 (LETT #1# (QVELT |p| 1))
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 1)
                                                (|Record|
                                                 (|:| |tag| (|SingleInteger|))
                                                 (|:| |op| (|BasicOperator|))
                                                 (|:| |arg| (|List| $)))
                                                (|Union|
                                                 (|:| |ret| (QREFELT $ 6))
                                                 (|:| |ker|
                                                      (|Record|
                                                       (|:| |tag|
                                                            (|SingleInteger|))
                                                       (|:| |op|
                                                            (|BasicOperator|))
                                                       (|:| |arg| (|List| $))))
                                                 (|:| |exp|
                                                      (|Record| (|:| |val| $)
                                                                (|:| |exponent|
                                                                     (|NonNegativeInteger|))))
                                                 (|:| |qot|
                                                      (|Record| (|:| |num| $)
                                                                (|:| |den| $)))
                                                 (|:| |sym|
                                                      (|Record|
                                                       (|:| |tag|
                                                            (|SingleInteger|))
                                                       (|:| |val| (|Symbol|))
                                                       (|:| |pred|
                                                            (|List| (|Any|)))
                                                       (|:| |bad|
                                                            (|List|
                                                             (|Any|))))))
                                                #1#))
                              2)))))))))
                (EXIT (CONS 1 "failed"))))) 

(SDEFUN |PATTERN;predicates;$L;47| ((|p| $) ($ |List| (|Any|)))
        (SPROG ((#1=#:G437 NIL))
               (COND
                ((SPADCALL |p| (QREFELT $ 29))
                 (QVELT
                  (PROG2 (LETT #1# (QVELT |p| 1))
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 4)
                                    (|Record| (|:| |tag| (|SingleInteger|))
                                              (|:| |val| (|Symbol|))
                                              (|:| |pred| (|List| (|Any|)))
                                              (|:| |bad| (|List| (|Any|))))
                                    (|Union| (|:| |ret| (QREFELT $ 6))
                                             (|:| |ker|
                                                  (|Record|
                                                   (|:| |tag|
                                                        (|SingleInteger|))
                                                   (|:| |op| (|BasicOperator|))
                                                   (|:| |arg| (|List| $))))
                                             (|:| |exp|
                                                  (|Record| (|:| |val| $)
                                                            (|:| |exponent|
                                                                 (|NonNegativeInteger|))))
                                             (|:| |qot|
                                                  (|Record| (|:| |num| $)
                                                            (|:| |den| $)))
                                             (|:| |sym|
                                                  (|Record|
                                                   (|:| |tag|
                                                        (|SingleInteger|))
                                                   (|:| |val| (|Symbol|))
                                                   (|:| |pred|
                                                        (|List| (|Any|)))
                                                   (|:| |bad|
                                                        (|List| (|Any|))))))
                                    #1#))
                  2))
                ('T NIL)))) 

(SDEFUN |PATTERN;setPredicates;$L$;48| ((|p| $) (|l| |List| (|Any|)) ($ $))
        (SPROG ((#1=#:G437 NIL))
               (SEQ
                (COND
                 ((SPADCALL |p| (QREFELT $ 46))
                  (SEQ
                   (QSETVELT
                    (PROG2 (LETT #1# (QVELT |p| 1))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 4)
                                      (|Record| (|:| |tag| (|SingleInteger|))
                                                (|:| |val| (|Symbol|))
                                                (|:| |pred| (|List| (|Any|)))
                                                (|:| |bad| (|List| (|Any|))))
                                      (|Union| (|:| |ret| (QREFELT $ 6))
                                               (|:| |ker|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |op|
                                                          (|BasicOperator|))
                                                     (|:| |arg| (|List| $))))
                                               (|:| |exp|
                                                    (|Record| (|:| |val| $)
                                                              (|:| |exponent|
                                                                   (|NonNegativeInteger|))))
                                               (|:| |qot|
                                                    (|Record| (|:| |num| $)
                                                              (|:| |den| $)))
                                               (|:| |sym|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |val| (|Symbol|))
                                                     (|:| |pred|
                                                          (|List| (|Any|)))
                                                     (|:| |bad|
                                                          (|List| (|Any|))))))
                                      #1#))
                    2 |l|)
                   (EXIT |p|)))
                 ('T
                  (|error| "Can only attach predicates to generic symbol")))))) 

(SDEFUN |PATTERN;resetBadValues;2$;49| ((|p| $) ($ $))
        (SPROG ((#1=#:G437 NIL))
               (SEQ
                (COND
                 ((SPADCALL |p| (QREFELT $ 46))
                  (SEQ
                   (QSETVELT
                    (PROG2 (LETT #1# (QVELT |p| 1))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 4)
                                      (|Record| (|:| |tag| (|SingleInteger|))
                                                (|:| |val| (|Symbol|))
                                                (|:| |pred| (|List| (|Any|)))
                                                (|:| |bad| (|List| (|Any|))))
                                      (|Union| (|:| |ret| (QREFELT $ 6))
                                               (|:| |ker|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |op|
                                                          (|BasicOperator|))
                                                     (|:| |arg| (|List| $))))
                                               (|:| |exp|
                                                    (|Record| (|:| |val| $)
                                                              (|:| |exponent|
                                                                   (|NonNegativeInteger|))))
                                               (|:| |qot|
                                                    (|Record| (|:| |num| $)
                                                              (|:| |den| $)))
                                               (|:| |sym|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |val| (|Symbol|))
                                                     (|:| |pred|
                                                          (|List| (|Any|)))
                                                     (|:| |bad|
                                                          (|List| (|Any|))))))
                                      #1#))
                    3 NIL)
                   (EXIT |p|)))
                 ('T
                  (|error| "Can only attach bad values to generic symbol")))))) 

(SDEFUN |PATTERN;addBadValue;$A$;50| ((|p| $) (|a| |Any|) ($ $))
        (SPROG ((#1=#:G437 NIL))
               (SEQ
                (COND
                 ((SPADCALL |p| (QREFELT $ 46))
                  (SEQ
                   (COND
                    ((NULL
                      (SPADCALL |a|
                                (QVELT
                                 (PROG2 (LETT #1# (QVELT |p| 1))
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 4)
                                                   (|Record|
                                                    (|:| |tag|
                                                         (|SingleInteger|))
                                                    (|:| |val| (|Symbol|))
                                                    (|:| |pred|
                                                         (|List| (|Any|)))
                                                    (|:| |bad|
                                                         (|List| (|Any|))))
                                                   (|Union|
                                                    (|:| |ret| (QREFELT $ 6))
                                                    (|:| |ker|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |op|
                                                               (|BasicOperator|))
                                                          (|:| |arg|
                                                               (|List| $))))
                                                    (|:| |exp|
                                                         (|Record|
                                                          (|:| |val| $)
                                                          (|:| |exponent|
                                                               (|NonNegativeInteger|))))
                                                    (|:| |qot|
                                                         (|Record|
                                                          (|:| |num| $)
                                                          (|:| |den| $)))
                                                    (|:| |sym|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |val|
                                                               (|Symbol|))
                                                          (|:| |pred|
                                                               (|List|
                                                                (|Any|)))
                                                          (|:| |bad|
                                                               (|List|
                                                                (|Any|))))))
                                                   #1#))
                                 3)
                                (QREFELT $ 106)))
                     (QSETVELT
                      (PROG2 (LETT #1# (QVELT |p| 1))
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 4)
                                        (|Record| (|:| |tag| (|SingleInteger|))
                                                  (|:| |val| (|Symbol|))
                                                  (|:| |pred| (|List| (|Any|)))
                                                  (|:| |bad| (|List| (|Any|))))
                                        (|Union| (|:| |ret| (QREFELT $ 6))
                                                 (|:| |ker|
                                                      (|Record|
                                                       (|:| |tag|
                                                            (|SingleInteger|))
                                                       (|:| |op|
                                                            (|BasicOperator|))
                                                       (|:| |arg| (|List| $))))
                                                 (|:| |exp|
                                                      (|Record| (|:| |val| $)
                                                                (|:| |exponent|
                                                                     (|NonNegativeInteger|))))
                                                 (|:| |qot|
                                                      (|Record| (|:| |num| $)
                                                                (|:| |den| $)))
                                                 (|:| |sym|
                                                      (|Record|
                                                       (|:| |tag|
                                                            (|SingleInteger|))
                                                       (|:| |val| (|Symbol|))
                                                       (|:| |pred|
                                                            (|List| (|Any|)))
                                                       (|:| |bad|
                                                            (|List|
                                                             (|Any|))))))
                                        #1#))
                      3
                      (CONS |a|
                            (QVELT
                             (PROG2 (LETT #1# (QVELT |p| 1))
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 4)
                                               (|Record|
                                                (|:| |tag| (|SingleInteger|))
                                                (|:| |val| (|Symbol|))
                                                (|:| |pred| (|List| (|Any|)))
                                                (|:| |bad| (|List| (|Any|))))
                                               (|Union|
                                                (|:| |ret| (QREFELT $ 6))
                                                (|:| |ker|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |op|
                                                           (|BasicOperator|))
                                                      (|:| |arg| (|List| $))))
                                                (|:| |exp|
                                                     (|Record| (|:| |val| $)
                                                               (|:| |exponent|
                                                                    (|NonNegativeInteger|))))
                                                (|:| |qot|
                                                     (|Record| (|:| |num| $)
                                                               (|:| |den| $)))
                                                (|:| |sym|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |val| (|Symbol|))
                                                      (|:| |pred|
                                                           (|List| (|Any|)))
                                                      (|:| |bad|
                                                           (|List| (|Any|))))))
                                               #1#))
                             3)))))
                   (EXIT |p|)))
                 ('T
                  (|error| "Can only attach bad values to generic symbol")))))) 

(SDEFUN |PATTERN;getBadValues;$L;51| ((|p| $) ($ |List| (|Any|)))
        (SPROG ((#1=#:G437 NIL))
               (COND
                ((SPADCALL |p| (QREFELT $ 46))
                 (QVELT
                  (PROG2 (LETT #1# (QVELT |p| 1))
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 4)
                                    (|Record| (|:| |tag| (|SingleInteger|))
                                              (|:| |val| (|Symbol|))
                                              (|:| |pred| (|List| (|Any|)))
                                              (|:| |bad| (|List| (|Any|))))
                                    (|Union| (|:| |ret| (QREFELT $ 6))
                                             (|:| |ker|
                                                  (|Record|
                                                   (|:| |tag|
                                                        (|SingleInteger|))
                                                   (|:| |op| (|BasicOperator|))
                                                   (|:| |arg| (|List| $))))
                                             (|:| |exp|
                                                  (|Record| (|:| |val| $)
                                                            (|:| |exponent|
                                                                 (|NonNegativeInteger|))))
                                             (|:| |qot|
                                                  (|Record| (|:| |num| $)
                                                            (|:| |den| $)))
                                             (|:| |sym|
                                                  (|Record|
                                                   (|:| |tag|
                                                        (|SingleInteger|))
                                                   (|:| |val| (|Symbol|))
                                                   (|:| |pred|
                                                        (|List| (|Any|)))
                                                   (|:| |bad|
                                                        (|List| (|Any|))))))
                                    #1#))
                  3))
                ('T (|error| "Not a generic symbol"))))) 

(SDEFUN |PATTERN;SYM2O|
        ((|p| |Record| (|:| |tag| (|SingleInteger|)) (|:| |val| (|Symbol|))
          (|:| |pred| (|List| (|Any|))) (|:| |bad| (|List| (|Any|))))
         ($ |OutputForm|))
        (SPROG
         ((#1=#:G636 NIL) (|i| NIL) (#2=#:G635 NIL) (|sy| (|OutputForm|)))
         (SEQ (LETT |sy| (SPADCALL (QVELT |p| 1) (QREFELT $ 109)))
              (EXIT
               (COND ((NULL (QVELT |p| 2)) |sy|)
                     ('T
                      (SPADCALL
                       (SPADCALL (SPADCALL " | " (QREFELT $ 111)) |sy|
                                 (SPADCALL (ELT $ 112)
                                           (PROGN
                                            (LETT #2# NIL)
                                            (SEQ (LETT |i| 1)
                                                 (LETT #1#
                                                       (LENGTH (QVELT |p| 2)))
                                                 G190
                                                 (COND
                                                  ((|greater_SI| |i| #1#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #2#
                                                         (CONS
                                                          (SPADCALL
                                                           (SPADCALL "f"
                                                                     (QREFELT $
                                                                              111))
                                                           (SPADCALL |i|
                                                                     (QREFELT $
                                                                              113))
                                                           (QREFELT $ 114))
                                                          #2#))))
                                                 (LETT |i| (|inc_SI| |i|))
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #2#))))
                                           (QREFELT $ 55))
                                 (QREFELT $ 115))
                       (QREFELT $ 116)))))))) 

(SDEFUN |PATTERN;variables;$L;53| ((|p| $) ($ |List| $))
        (SPROG
         ((#1=#:G644 NIL) (#2=#:G434 NIL) (|r| NIL) (#3=#:G643 NIL)
          (#4=#:G436 NIL) (#5=#:G435 NIL)
          (|q|
           (|Union| (|:| |ret| R)
                    (|:| |ker|
                         (|Record| (|:| |tag| (|SingleInteger|))
                                   (|:| |op| (|BasicOperator|))
                                   (|:| |arg| (|List| $))))
                    (|:| |exp|
                         (|Record| (|:| |val| $)
                                   (|:| |exponent| (|NonNegativeInteger|))))
                    (|:| |qot| (|Record| (|:| |num| $) (|:| |den| $)))
                    (|:| |sym|
                         (|Record| (|:| |tag| (|SingleInteger|))
                                   (|:| |val| (|Symbol|))
                                   (|:| |pred| (|List| (|Any|)))
                                   (|:| |bad| (|List| (|Any|))))))))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 25)) (SPADCALL (QREFELT $ 94)))
                ((SPADCALL |p| (QREFELT $ 46)) (LIST |p|))
                (#6='T
                 (SEQ (LETT |q| (QVELT |p| 1))
                      (EXIT
                       (COND ((QEQCAR |q| 0) (SPADCALL (QREFELT $ 94)))
                             ((QEQCAR |q| 2)
                              (SPADCALL
                               (QCAR
                                (PROG2 (LETT #5# |q|)
                                    (QCDR #5#)
                                  (|check_union2| (QEQCAR #5# 2)
                                                  (|Record| (|:| |val| $)
                                                            (|:| |exponent|
                                                                 (|NonNegativeInteger|)))
                                                  (|Union|
                                                   (|:| |ret| (QREFELT $ 6))
                                                   (|:| |ker|
                                                        (|Record|
                                                         (|:| |tag|
                                                              (|SingleInteger|))
                                                         (|:| |op|
                                                              (|BasicOperator|))
                                                         (|:| |arg|
                                                              (|List| $))))
                                                   (|:| |exp|
                                                        (|Record| (|:| |val| $)
                                                                  (|:|
                                                                   |exponent|
                                                                   (|NonNegativeInteger|))))
                                                   (|:| |qot|
                                                        (|Record| (|:| |num| $)
                                                                  (|:| |den|
                                                                       $)))
                                                   (|:| |sym|
                                                        (|Record|
                                                         (|:| |tag|
                                                              (|SingleInteger|))
                                                         (|:| |val| (|Symbol|))
                                                         (|:| |pred|
                                                              (|List| (|Any|)))
                                                         (|:| |bad|
                                                              (|List|
                                                               (|Any|))))))
                                                  #5#)))
                               (QREFELT $ 117)))
                             ((QEQCAR |q| 3)
                              (SPADCALL
                               (SPADCALL
                                (QCAR
                                 (PROG2 (LETT #4# |q|)
                                     (QCDR #4#)
                                   (|check_union2| (QEQCAR #4# 3)
                                                   (|Record| (|:| |num| $)
                                                             (|:| |den| $))
                                                   (|Union|
                                                    (|:| |ret| (QREFELT $ 6))
                                                    (|:| |ker|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |op|
                                                               (|BasicOperator|))
                                                          (|:| |arg|
                                                               (|List| $))))
                                                    (|:| |exp|
                                                         (|Record|
                                                          (|:| |val| $)
                                                          (|:| |exponent|
                                                               (|NonNegativeInteger|))))
                                                    (|:| |qot|
                                                         (|Record|
                                                          (|:| |num| $)
                                                          (|:| |den| $)))
                                                    (|:| |sym|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |val|
                                                               (|Symbol|))
                                                          (|:| |pred|
                                                               (|List|
                                                                (|Any|)))
                                                          (|:| |bad|
                                                               (|List|
                                                                (|Any|))))))
                                                   #4#)))
                                (QREFELT $ 117))
                               (SPADCALL
                                (QCDR
                                 (PROG2 (LETT #4# |q|)
                                     (QCDR #4#)
                                   (|check_union2| (QEQCAR #4# 3)
                                                   (|Record| (|:| |num| $)
                                                             (|:| |den| $))
                                                   (|Union|
                                                    (|:| |ret| (QREFELT $ 6))
                                                    (|:| |ker|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |op|
                                                               (|BasicOperator|))
                                                          (|:| |arg|
                                                               (|List| $))))
                                                    (|:| |exp|
                                                         (|Record|
                                                          (|:| |val| $)
                                                          (|:| |exponent|
                                                               (|NonNegativeInteger|))))
                                                    (|:| |qot|
                                                         (|Record|
                                                          (|:| |num| $)
                                                          (|:| |den| $)))
                                                    (|:| |sym|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |val|
                                                               (|Symbol|))
                                                          (|:| |pred|
                                                               (|List|
                                                                (|Any|)))
                                                          (|:| |bad|
                                                               (|List|
                                                                (|Any|))))))
                                                   #4#)))
                                (QREFELT $ 117))
                               (QREFELT $ 118)))
                             ((QEQCAR |q| 1)
                              (SPADCALL
                               (PROGN
                                (LETT #3# NIL)
                                (SEQ (LETT |r| NIL)
                                     (LETT #1#
                                           (QVELT
                                            (PROG2 (LETT #2# |q|)
                                                (QCDR #2#)
                                              (|check_union2| (QEQCAR #2# 1)
                                                              (|Record|
                                                               (|:| |tag|
                                                                    (|SingleInteger|))
                                                               (|:| |op|
                                                                    (|BasicOperator|))
                                                               (|:| |arg|
                                                                    (|List|
                                                                     $)))
                                                              (|Union|
                                                               (|:| |ret|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |ker|
                                                                    (|Record|
                                                                     (|:| |tag|
                                                                          (|SingleInteger|))
                                                                     (|:| |op|
                                                                          (|BasicOperator|))
                                                                     (|:| |arg|
                                                                          (|List|
                                                                           $))))
                                                               (|:| |exp|
                                                                    (|Record|
                                                                     (|:| |val|
                                                                          $)
                                                                     (|:|
                                                                      |exponent|
                                                                      (|NonNegativeInteger|))))
                                                               (|:| |qot|
                                                                    (|Record|
                                                                     (|:| |num|
                                                                          $)
                                                                     (|:| |den|
                                                                          $)))
                                                               (|:| |sym|
                                                                    (|Record|
                                                                     (|:| |tag|
                                                                          (|SingleInteger|))
                                                                     (|:| |val|
                                                                          (|Symbol|))
                                                                     (|:|
                                                                      |pred|
                                                                      (|List|
                                                                       (|Any|)))
                                                                     (|:| |bad|
                                                                          (|List|
                                                                           (|Any|))))))
                                                              #2#))
                                            2))
                                     G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN (LETT |r| (CAR #1#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #3#
                                             (CONS
                                              (SPADCALL |r| (QREFELT $ 117))
                                              #3#))))
                                     (LETT #1# (CDR #1#)) (GO G190) G191
                                     (EXIT (NREVERSE #3#))))
                               (QREFELT $ 119)))
                             (#6# (SPADCALL (QREFELT $ 94))))))))))) 

(SDEFUN |PATTERN;PAT2O|
        ((|p| |Union| (|:| |ret| R)
          (|:| |ker|
               (|Record| (|:| |tag| (|SingleInteger|))
                         (|:| |op| (|BasicOperator|)) (|:| |arg| (|List| $))))
          (|:| |exp|
               (|Record| (|:| |val| $)
                         (|:| |exponent| (|NonNegativeInteger|))))
          (|:| |qot| (|Record| (|:| |num| $) (|:| |den| $)))
          (|:| |sym|
               (|Record| (|:| |tag| (|SingleInteger|)) (|:| |val| (|Symbol|))
                         (|:| |pred| (|List| (|Any|)))
                         (|:| |bad| (|List| (|Any|))))))
         ($ |OutputForm|))
        (SPROG
         ((#1=#:G434 NIL)
          (|u|
           (|Union| (|Mapping| (|OutputForm|) (|List| (|OutputForm|)))
                    "failed"))
          (|l| (|List| (|OutputForm|))) (#2=#:G663 NIL) (|x| NIL)
          (#3=#:G662 NIL) (#4=#:G436 NIL) (#5=#:G435 NIL) (#6=#:G437 NIL))
         (SEQ
          (COND ((QEQCAR |p| 0) (SPADCALL (CDR |p|) (QREFELT $ 120)))
                ((QEQCAR |p| 4)
                 (|PATTERN;SYM2O|
                  (PROG2 (LETT #6# |p|)
                      (QCDR #6#)
                    (|check_union2| (QEQCAR #6# 4)
                                    (|Record| (|:| |tag| (|SingleInteger|))
                                              (|:| |val| (|Symbol|))
                                              (|:| |pred| (|List| (|Any|)))
                                              (|:| |bad| (|List| (|Any|))))
                                    (|Union| (|:| |ret| (QREFELT $ 6))
                                             (|:| |ker|
                                                  (|Record|
                                                   (|:| |tag|
                                                        (|SingleInteger|))
                                                   (|:| |op| (|BasicOperator|))
                                                   (|:| |arg| (|List| $))))
                                             (|:| |exp|
                                                  (|Record| (|:| |val| $)
                                                            (|:| |exponent|
                                                                 (|NonNegativeInteger|))))
                                             (|:| |qot|
                                                  (|Record| (|:| |num| $)
                                                            (|:| |den| $)))
                                             (|:| |sym|
                                                  (|Record|
                                                   (|:| |tag|
                                                        (|SingleInteger|))
                                                   (|:| |val| (|Symbol|))
                                                   (|:| |pred|
                                                        (|List| (|Any|)))
                                                   (|:| |bad|
                                                        (|List| (|Any|))))))
                                    #6#))
                  $))
                ((QEQCAR |p| 2)
                 (SPADCALL
                  (SPADCALL
                   (QCAR
                    (PROG2 (LETT #5# |p|)
                        (QCDR #5#)
                      (|check_union2| (QEQCAR #5# 2)
                                      (|Record| (|:| |val| $)
                                                (|:| |exponent|
                                                     (|NonNegativeInteger|)))
                                      (|Union| (|:| |ret| (QREFELT $ 6))
                                               (|:| |ker|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |op|
                                                          (|BasicOperator|))
                                                     (|:| |arg| (|List| $))))
                                               (|:| |exp|
                                                    (|Record| (|:| |val| $)
                                                              (|:| |exponent|
                                                                   (|NonNegativeInteger|))))
                                               (|:| |qot|
                                                    (|Record| (|:| |num| $)
                                                              (|:| |den| $)))
                                               (|:| |sym|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |val| (|Symbol|))
                                                     (|:| |pred|
                                                          (|List| (|Any|)))
                                                     (|:| |bad|
                                                          (|List| (|Any|))))))
                                      #5#)))
                   (QREFELT $ 51))
                  (SPADCALL
                   (QCDR
                    (PROG2 (LETT #5# |p|)
                        (QCDR #5#)
                      (|check_union2| (QEQCAR #5# 2)
                                      (|Record| (|:| |val| $)
                                                (|:| |exponent|
                                                     (|NonNegativeInteger|)))
                                      (|Union| (|:| |ret| (QREFELT $ 6))
                                               (|:| |ker|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |op|
                                                          (|BasicOperator|))
                                                     (|:| |arg| (|List| $))))
                                               (|:| |exp|
                                                    (|Record| (|:| |val| $)
                                                              (|:| |exponent|
                                                                   (|NonNegativeInteger|))))
                                               (|:| |qot|
                                                    (|Record| (|:| |num| $)
                                                              (|:| |den| $)))
                                               (|:| |sym|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |val| (|Symbol|))
                                                     (|:| |pred|
                                                          (|List| (|Any|)))
                                                     (|:| |bad|
                                                          (|List| (|Any|))))))
                                      #5#)))
                   (QREFELT $ 113))
                  (QREFELT $ 121)))
                ((QEQCAR |p| 3)
                 (SPADCALL
                  (SPADCALL
                   (QCAR
                    (PROG2 (LETT #4# |p|)
                        (QCDR #4#)
                      (|check_union2| (QEQCAR #4# 3)
                                      (|Record| (|:| |num| $) (|:| |den| $))
                                      (|Union| (|:| |ret| (QREFELT $ 6))
                                               (|:| |ker|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |op|
                                                          (|BasicOperator|))
                                                     (|:| |arg| (|List| $))))
                                               (|:| |exp|
                                                    (|Record| (|:| |val| $)
                                                              (|:| |exponent|
                                                                   (|NonNegativeInteger|))))
                                               (|:| |qot|
                                                    (|Record| (|:| |num| $)
                                                              (|:| |den| $)))
                                               (|:| |sym|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |val| (|Symbol|))
                                                     (|:| |pred|
                                                          (|List| (|Any|)))
                                                     (|:| |bad|
                                                          (|List| (|Any|))))))
                                      #4#)))
                   (QREFELT $ 51))
                  (SPADCALL
                   (QCDR
                    (PROG2 (LETT #4# |p|)
                        (QCDR #4#)
                      (|check_union2| (QEQCAR #4# 3)
                                      (|Record| (|:| |num| $) (|:| |den| $))
                                      (|Union| (|:| |ret| (QREFELT $ 6))
                                               (|:| |ker|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |op|
                                                          (|BasicOperator|))
                                                     (|:| |arg| (|List| $))))
                                               (|:| |exp|
                                                    (|Record| (|:| |val| $)
                                                              (|:| |exponent|
                                                                   (|NonNegativeInteger|))))
                                               (|:| |qot|
                                                    (|Record| (|:| |num| $)
                                                              (|:| |den| $)))
                                               (|:| |sym|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |val| (|Symbol|))
                                                     (|:| |pred|
                                                          (|List| (|Any|)))
                                                     (|:| |bad|
                                                          (|List| (|Any|))))))
                                      #4#)))
                   (QREFELT $ 51))
                  (QREFELT $ 122)))
                (#7='T
                 (COND
                  ((EQL
                    (QVELT
                     (PROG2 (LETT #1# |p|)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 1)
                                       (|Record| (|:| |tag| (|SingleInteger|))
                                                 (|:| |op| (|BasicOperator|))
                                                 (|:| |arg| (|List| $)))
                                       (|Union| (|:| |ret| (QREFELT $ 6))
                                                (|:| |ker|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |op|
                                                           (|BasicOperator|))
                                                      (|:| |arg| (|List| $))))
                                                (|:| |exp|
                                                     (|Record| (|:| |val| $)
                                                               (|:| |exponent|
                                                                    (|NonNegativeInteger|))))
                                                (|:| |qot|
                                                     (|Record| (|:| |num| $)
                                                               (|:| |den| $)))
                                                (|:| |sym|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |val| (|Symbol|))
                                                      (|:| |pred|
                                                           (|List| (|Any|)))
                                                      (|:| |bad|
                                                           (|List| (|Any|))))))
                                       #1#))
                     0)
                    1)
                   (|PATTERN;LPAT2O| (ELT $ 123)
                    (QVELT
                     (PROG2 (LETT #1# |p|)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 1)
                                       (|Record| (|:| |tag| (|SingleInteger|))
                                                 (|:| |op| (|BasicOperator|))
                                                 (|:| |arg| (|List| $)))
                                       (|Union| (|:| |ret| (QREFELT $ 6))
                                                (|:| |ker|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |op|
                                                           (|BasicOperator|))
                                                      (|:| |arg| (|List| $))))
                                                (|:| |exp|
                                                     (|Record| (|:| |val| $)
                                                               (|:| |exponent|
                                                                    (|NonNegativeInteger|))))
                                                (|:| |qot|
                                                     (|Record| (|:| |num| $)
                                                               (|:| |den| $)))
                                                (|:| |sym|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |val| (|Symbol|))
                                                      (|:| |pred|
                                                           (|List| (|Any|)))
                                                      (|:| |bad|
                                                           (|List| (|Any|))))))
                                       #1#))
                     2)
                    $))
                  ((|eql_SI|
                    (QVELT
                     (PROG2 (LETT #1# |p|)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 1)
                                       (|Record| (|:| |tag| (|SingleInteger|))
                                                 (|:| |op| (|BasicOperator|))
                                                 (|:| |arg| (|List| $)))
                                       (|Union| (|:| |ret| (QREFELT $ 6))
                                                (|:| |ker|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |op|
                                                           (|BasicOperator|))
                                                      (|:| |arg| (|List| $))))
                                                (|:| |exp|
                                                     (|Record| (|:| |val| $)
                                                               (|:| |exponent|
                                                                    (|NonNegativeInteger|))))
                                                (|:| |qot|
                                                     (|Record| (|:| |num| $)
                                                               (|:| |den| $)))
                                                (|:| |sym|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |val| (|Symbol|))
                                                      (|:| |pred|
                                                           (|List| (|Any|)))
                                                      (|:| |bad|
                                                           (|List| (|Any|))))))
                                       #1#))
                     0)
                    (SPADCALL 2 (QREFELT $ 33)))
                   (|PATTERN;LPAT2O| (ELT $ 124)
                    (QVELT
                     (PROG2 (LETT #1# |p|)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 1)
                                       (|Record| (|:| |tag| (|SingleInteger|))
                                                 (|:| |op| (|BasicOperator|))
                                                 (|:| |arg| (|List| $)))
                                       (|Union| (|:| |ret| (QREFELT $ 6))
                                                (|:| |ker|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |op|
                                                           (|BasicOperator|))
                                                      (|:| |arg| (|List| $))))
                                                (|:| |exp|
                                                     (|Record| (|:| |val| $)
                                                               (|:| |exponent|
                                                                    (|NonNegativeInteger|))))
                                                (|:| |qot|
                                                     (|Record| (|:| |num| $)
                                                               (|:| |den| $)))
                                                (|:| |sym|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |val| (|Symbol|))
                                                      (|:| |pred|
                                                           (|List| (|Any|)))
                                                      (|:| |bad|
                                                           (|List| (|Any|))))))
                                       #1#))
                     2)
                    $))
                  ((|eql_SI|
                    (QVELT
                     (PROG2 (LETT #1# |p|)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 1)
                                       (|Record| (|:| |tag| (|SingleInteger|))
                                                 (|:| |op| (|BasicOperator|))
                                                 (|:| |arg| (|List| $)))
                                       (|Union| (|:| |ret| (QREFELT $ 6))
                                                (|:| |ker|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |op|
                                                           (|BasicOperator|))
                                                      (|:| |arg| (|List| $))))
                                                (|:| |exp|
                                                     (|Record| (|:| |val| $)
                                                               (|:| |exponent|
                                                                    (|NonNegativeInteger|))))
                                                (|:| |qot|
                                                     (|Record| (|:| |num| $)
                                                               (|:| |den| $)))
                                                (|:| |sym|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |val| (|Symbol|))
                                                      (|:| |pred|
                                                           (|List| (|Any|)))
                                                      (|:| |bad|
                                                           (|List| (|Any|))))))
                                       #1#))
                     0)
                    (SPADCALL 3 (QREFELT $ 33)))
                   (SPADCALL
                    (QVELT
                     (PROG2 (LETT #1# |p|)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 1)
                                       (|Record| (|:| |tag| (|SingleInteger|))
                                                 (|:| |op| (|BasicOperator|))
                                                 (|:| |arg| (|List| $)))
                                       (|Union| (|:| |ret| (QREFELT $ 6))
                                                (|:| |ker|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |op|
                                                           (|BasicOperator|))
                                                      (|:| |arg| (|List| $))))
                                                (|:| |exp|
                                                     (|Record| (|:| |val| $)
                                                               (|:| |exponent|
                                                                    (|NonNegativeInteger|))))
                                                (|:| |qot|
                                                     (|Record| (|:| |num| $)
                                                               (|:| |den| $)))
                                                (|:| |sym|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |val| (|Symbol|))
                                                      (|:| |pred|
                                                           (|List| (|Any|)))
                                                      (|:| |bad|
                                                           (|List| (|Any|))))))
                                       #1#))
                     2)
                    (QREFELT $ 125)))
                  ((|eql_SI|
                    (QVELT
                     (PROG2 (LETT #1# |p|)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 1)
                                       (|Record| (|:| |tag| (|SingleInteger|))
                                                 (|:| |op| (|BasicOperator|))
                                                 (|:| |arg| (|List| $)))
                                       (|Union| (|:| |ret| (QREFELT $ 6))
                                                (|:| |ker|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |op|
                                                           (|BasicOperator|))
                                                      (|:| |arg| (|List| $))))
                                                (|:| |exp|
                                                     (|Record| (|:| |val| $)
                                                               (|:| |exponent|
                                                                    (|NonNegativeInteger|))))
                                                (|:| |qot|
                                                     (|Record| (|:| |num| $)
                                                               (|:| |den| $)))
                                                (|:| |sym|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |val| (|Symbol|))
                                                      (|:| |pred|
                                                           (|List| (|Any|)))
                                                      (|:| |bad|
                                                           (|List| (|Any|))))))
                                       #1#))
                     0)
                    (SPADCALL 4 (QREFELT $ 33)))
                   (SPADCALL 0 (QREFELT $ 126)))
                  ((|eql_SI|
                    (QVELT
                     (PROG2 (LETT #1# |p|)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 1)
                                       (|Record| (|:| |tag| (|SingleInteger|))
                                                 (|:| |op| (|BasicOperator|))
                                                 (|:| |arg| (|List| $)))
                                       (|Union| (|:| |ret| (QREFELT $ 6))
                                                (|:| |ker|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |op|
                                                           (|BasicOperator|))
                                                      (|:| |arg| (|List| $))))
                                                (|:| |exp|
                                                     (|Record| (|:| |val| $)
                                                               (|:| |exponent|
                                                                    (|NonNegativeInteger|))))
                                                (|:| |qot|
                                                     (|Record| (|:| |num| $)
                                                               (|:| |den| $)))
                                                (|:| |sym|
                                                     (|Record|
                                                      (|:| |tag|
                                                           (|SingleInteger|))
                                                      (|:| |val| (|Symbol|))
                                                      (|:| |pred|
                                                           (|List| (|Any|)))
                                                      (|:| |bad|
                                                           (|List| (|Any|))))))
                                       #1#))
                     0)
                    (SPADCALL 5 (QREFELT $ 33)))
                   (SPADCALL 1 (QREFELT $ 126)))
                  (#7#
                   (SEQ
                    (LETT |l|
                          (PROGN
                           (LETT #3# NIL)
                           (SEQ (LETT |x| NIL)
                                (LETT #2#
                                      (QVELT
                                       (PROG2 (LETT #1# |p|)
                                           (QCDR #1#)
                                         (|check_union2| (QEQCAR #1# 1)
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |op|
                                                               (|BasicOperator|))
                                                          (|:| |arg|
                                                               (|List| $)))
                                                         (|Union|
                                                          (|:| |ret|
                                                               (QREFELT $ 6))
                                                          (|:| |ker|
                                                               (|Record|
                                                                (|:| |tag|
                                                                     (|SingleInteger|))
                                                                (|:| |op|
                                                                     (|BasicOperator|))
                                                                (|:| |arg|
                                                                     (|List|
                                                                      $))))
                                                          (|:| |exp|
                                                               (|Record|
                                                                (|:| |val| $)
                                                                (|:| |exponent|
                                                                     (|NonNegativeInteger|))))
                                                          (|:| |qot|
                                                               (|Record|
                                                                (|:| |num| $)
                                                                (|:| |den| $)))
                                                          (|:| |sym|
                                                               (|Record|
                                                                (|:| |tag|
                                                                     (|SingleInteger|))
                                                                (|:| |val|
                                                                     (|Symbol|))
                                                                (|:| |pred|
                                                                     (|List|
                                                                      (|Any|)))
                                                                (|:| |bad|
                                                                     (|List|
                                                                      (|Any|))))))
                                                         #1#))
                                       2))
                                G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |x| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3#
                                        (CONS (SPADCALL |x| (QREFELT $ 51))
                                              #3#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #3#)))))
                    (LETT |u|
                          (SPADCALL
                           (QVELT
                            (PROG2 (LETT #1# |p|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 1)
                                              (|Record|
                                               (|:| |tag| (|SingleInteger|))
                                               (|:| |op| (|BasicOperator|))
                                               (|:| |arg| (|List| $)))
                                              (|Union|
                                               (|:| |ret| (QREFELT $ 6))
                                               (|:| |ker|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |op|
                                                          (|BasicOperator|))
                                                     (|:| |arg| (|List| $))))
                                               (|:| |exp|
                                                    (|Record| (|:| |val| $)
                                                              (|:| |exponent|
                                                                   (|NonNegativeInteger|))))
                                               (|:| |qot|
                                                    (|Record| (|:| |num| $)
                                                              (|:| |den| $)))
                                               (|:| |sym|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |val| (|Symbol|))
                                                     (|:| |pred|
                                                          (|List| (|Any|)))
                                                     (|:| |bad|
                                                          (|List| (|Any|))))))
                                              #1#))
                            1)
                           (QREFELT $ 129)))
                    (EXIT
                     (COND
                      ((QEQCAR |u| 1)
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (QVELT
                           (PROG2 (LETT #1# |p|)
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 1)
                                             (|Record|
                                              (|:| |tag| (|SingleInteger|))
                                              (|:| |op| (|BasicOperator|))
                                              (|:| |arg| (|List| $)))
                                             (|Union| (|:| |ret| (QREFELT $ 6))
                                                      (|:| |ker|
                                                           (|Record|
                                                            (|:| |tag|
                                                                 (|SingleInteger|))
                                                            (|:| |op|
                                                                 (|BasicOperator|))
                                                            (|:| |arg|
                                                                 (|List| $))))
                                                      (|:| |exp|
                                                           (|Record|
                                                            (|:| |val| $)
                                                            (|:| |exponent|
                                                                 (|NonNegativeInteger|))))
                                                      (|:| |qot|
                                                           (|Record|
                                                            (|:| |num| $)
                                                            (|:| |den| $)))
                                                      (|:| |sym|
                                                           (|Record|
                                                            (|:| |tag|
                                                                 (|SingleInteger|))
                                                            (|:| |val|
                                                                 (|Symbol|))
                                                            (|:| |pred|
                                                                 (|List|
                                                                  (|Any|)))
                                                            (|:| |bad|
                                                                 (|List|
                                                                  (|Any|))))))
                                             #1#))
                           1)
                          (QREFELT $ 130))
                         (QREFELT $ 109))
                        |l| (QREFELT $ 131)))
                      (#7# (SPADCALL |l| (QCDR |u|))))))))))))) 

(SDEFUN |PATTERN;patcopy|
        ((|p| |Union| (|:| |ret| R)
          (|:| |ker|
               (|Record| (|:| |tag| (|SingleInteger|))
                         (|:| |op| (|BasicOperator|)) (|:| |arg| (|List| $))))
          (|:| |exp|
               (|Record| (|:| |val| $)
                         (|:| |exponent| (|NonNegativeInteger|))))
          (|:| |qot| (|Record| (|:| |num| $) (|:| |den| $)))
          (|:| |sym|
               (|Record| (|:| |tag| (|SingleInteger|)) (|:| |val| (|Symbol|))
                         (|:| |pred| (|List| (|Any|)))
                         (|:| |bad| (|List| (|Any|))))))
         ($ |Union| (|:| |ret| R)
          (|:| |ker|
               (|Record| (|:| |tag| (|SingleInteger|))
                         (|:| |op| (|BasicOperator|)) (|:| |arg| (|List| $))))
          (|:| |exp|
               (|Record| (|:| |val| $)
                         (|:| |exponent| (|NonNegativeInteger|))))
          (|:| |qot| (|Record| (|:| |num| $) (|:| |den| $)))
          (|:| |sym|
               (|Record| (|:| |tag| (|SingleInteger|)) (|:| |val| (|Symbol|))
                         (|:| |pred| (|List| (|Any|)))
                         (|:| |bad| (|List| (|Any|)))))))
        (SPROG
         ((#1=#:G435 NIL) (#2=#:G436 NIL) (#3=#:G670 NIL) (#4=#:G434 NIL)
          (|x| NIL) (#5=#:G669 NIL) (#6=#:G437 NIL))
         (SEQ
          (COND ((QEQCAR |p| 0) (CONS 0 (CDR |p|)))
                ((QEQCAR |p| 4)
                 (CONS 4
                       (VECTOR
                        (QVELT
                         (PROG2 (LETT #6# |p|)
                             (QCDR #6#)
                           (|check_union2| (QEQCAR #6# 4)
                                           (|Record|
                                            (|:| |tag| (|SingleInteger|))
                                            (|:| |val| (|Symbol|))
                                            (|:| |pred| (|List| (|Any|)))
                                            (|:| |bad| (|List| (|Any|))))
                                           (|Union| (|:| |ret| (QREFELT $ 6))
                                                    (|:| |ker|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |op|
                                                               (|BasicOperator|))
                                                          (|:| |arg|
                                                               (|List| $))))
                                                    (|:| |exp|
                                                         (|Record|
                                                          (|:| |val| $)
                                                          (|:| |exponent|
                                                               (|NonNegativeInteger|))))
                                                    (|:| |qot|
                                                         (|Record|
                                                          (|:| |num| $)
                                                          (|:| |den| $)))
                                                    (|:| |sym|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |val|
                                                               (|Symbol|))
                                                          (|:| |pred|
                                                               (|List|
                                                                (|Any|)))
                                                          (|:| |bad|
                                                               (|List|
                                                                (|Any|))))))
                                           #6#))
                         0)
                        (QVELT
                         (PROG2 (LETT #6# |p|)
                             (QCDR #6#)
                           (|check_union2| (QEQCAR #6# 4)
                                           (|Record|
                                            (|:| |tag| (|SingleInteger|))
                                            (|:| |val| (|Symbol|))
                                            (|:| |pred| (|List| (|Any|)))
                                            (|:| |bad| (|List| (|Any|))))
                                           (|Union| (|:| |ret| (QREFELT $ 6))
                                                    (|:| |ker|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |op|
                                                               (|BasicOperator|))
                                                          (|:| |arg|
                                                               (|List| $))))
                                                    (|:| |exp|
                                                         (|Record|
                                                          (|:| |val| $)
                                                          (|:| |exponent|
                                                               (|NonNegativeInteger|))))
                                                    (|:| |qot|
                                                         (|Record|
                                                          (|:| |num| $)
                                                          (|:| |den| $)))
                                                    (|:| |sym|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |val|
                                                               (|Symbol|))
                                                          (|:| |pred|
                                                               (|List|
                                                                (|Any|)))
                                                          (|:| |bad|
                                                               (|List|
                                                                (|Any|))))))
                                           #6#))
                         1)
                        (SPADCALL
                         (QVELT
                          (PROG2 (LETT #6# |p|)
                              (QCDR #6#)
                            (|check_union2| (QEQCAR #6# 4)
                                            (|Record|
                                             (|:| |tag| (|SingleInteger|))
                                             (|:| |val| (|Symbol|))
                                             (|:| |pred| (|List| (|Any|)))
                                             (|:| |bad| (|List| (|Any|))))
                                            (|Union| (|:| |ret| (QREFELT $ 6))
                                                     (|:| |ker|
                                                          (|Record|
                                                           (|:| |tag|
                                                                (|SingleInteger|))
                                                           (|:| |op|
                                                                (|BasicOperator|))
                                                           (|:| |arg|
                                                                (|List| $))))
                                                     (|:| |exp|
                                                          (|Record|
                                                           (|:| |val| $)
                                                           (|:| |exponent|
                                                                (|NonNegativeInteger|))))
                                                     (|:| |qot|
                                                          (|Record|
                                                           (|:| |num| $)
                                                           (|:| |den| $)))
                                                     (|:| |sym|
                                                          (|Record|
                                                           (|:| |tag|
                                                                (|SingleInteger|))
                                                           (|:| |val|
                                                                (|Symbol|))
                                                           (|:| |pred|
                                                                (|List|
                                                                 (|Any|)))
                                                           (|:| |bad|
                                                                (|List|
                                                                 (|Any|))))))
                                            #6#))
                          2)
                         (QREFELT $ 132))
                        (SPADCALL
                         (QVELT
                          (PROG2 (LETT #6# |p|)
                              (QCDR #6#)
                            (|check_union2| (QEQCAR #6# 4)
                                            (|Record|
                                             (|:| |tag| (|SingleInteger|))
                                             (|:| |val| (|Symbol|))
                                             (|:| |pred| (|List| (|Any|)))
                                             (|:| |bad| (|List| (|Any|))))
                                            (|Union| (|:| |ret| (QREFELT $ 6))
                                                     (|:| |ker|
                                                          (|Record|
                                                           (|:| |tag|
                                                                (|SingleInteger|))
                                                           (|:| |op|
                                                                (|BasicOperator|))
                                                           (|:| |arg|
                                                                (|List| $))))
                                                     (|:| |exp|
                                                          (|Record|
                                                           (|:| |val| $)
                                                           (|:| |exponent|
                                                                (|NonNegativeInteger|))))
                                                     (|:| |qot|
                                                          (|Record|
                                                           (|:| |num| $)
                                                           (|:| |den| $)))
                                                     (|:| |sym|
                                                          (|Record|
                                                           (|:| |tag|
                                                                (|SingleInteger|))
                                                           (|:| |val|
                                                                (|Symbol|))
                                                           (|:| |pred|
                                                                (|List|
                                                                 (|Any|)))
                                                           (|:| |bad|
                                                                (|List|
                                                                 (|Any|))))))
                                            #6#))
                          3)
                         (QREFELT $ 132)))))
                ((QEQCAR |p| 1)
                 (CONS 1
                       (VECTOR
                        (QVELT
                         (PROG2 (LETT #4# |p|)
                             (QCDR #4#)
                           (|check_union2| (QEQCAR #4# 1)
                                           (|Record|
                                            (|:| |tag| (|SingleInteger|))
                                            (|:| |op| (|BasicOperator|))
                                            (|:| |arg| (|List| $)))
                                           (|Union| (|:| |ret| (QREFELT $ 6))
                                                    (|:| |ker|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |op|
                                                               (|BasicOperator|))
                                                          (|:| |arg|
                                                               (|List| $))))
                                                    (|:| |exp|
                                                         (|Record|
                                                          (|:| |val| $)
                                                          (|:| |exponent|
                                                               (|NonNegativeInteger|))))
                                                    (|:| |qot|
                                                         (|Record|
                                                          (|:| |num| $)
                                                          (|:| |den| $)))
                                                    (|:| |sym|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |val|
                                                               (|Symbol|))
                                                          (|:| |pred|
                                                               (|List|
                                                                (|Any|)))
                                                          (|:| |bad|
                                                               (|List|
                                                                (|Any|))))))
                                           #4#))
                         0)
                        (QVELT
                         (PROG2 (LETT #4# |p|)
                             (QCDR #4#)
                           (|check_union2| (QEQCAR #4# 1)
                                           (|Record|
                                            (|:| |tag| (|SingleInteger|))
                                            (|:| |op| (|BasicOperator|))
                                            (|:| |arg| (|List| $)))
                                           (|Union| (|:| |ret| (QREFELT $ 6))
                                                    (|:| |ker|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |op|
                                                               (|BasicOperator|))
                                                          (|:| |arg|
                                                               (|List| $))))
                                                    (|:| |exp|
                                                         (|Record|
                                                          (|:| |val| $)
                                                          (|:| |exponent|
                                                               (|NonNegativeInteger|))))
                                                    (|:| |qot|
                                                         (|Record|
                                                          (|:| |num| $)
                                                          (|:| |den| $)))
                                                    (|:| |sym|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |val|
                                                               (|Symbol|))
                                                          (|:| |pred|
                                                               (|List|
                                                                (|Any|)))
                                                          (|:| |bad|
                                                               (|List|
                                                                (|Any|))))))
                                           #4#))
                         1)
                        (PROGN
                         (LETT #5# NIL)
                         (SEQ (LETT |x| NIL)
                              (LETT #3#
                                    (QVELT
                                     (PROG2 (LETT #4# |p|)
                                         (QCDR #4#)
                                       (|check_union2| (QEQCAR #4# 1)
                                                       (|Record|
                                                        (|:| |tag|
                                                             (|SingleInteger|))
                                                        (|:| |op|
                                                             (|BasicOperator|))
                                                        (|:| |arg| (|List| $)))
                                                       (|Union|
                                                        (|:| |ret|
                                                             (QREFELT $ 6))
                                                        (|:| |ker|
                                                             (|Record|
                                                              (|:| |tag|
                                                                   (|SingleInteger|))
                                                              (|:| |op|
                                                                   (|BasicOperator|))
                                                              (|:| |arg|
                                                                   (|List|
                                                                    $))))
                                                        (|:| |exp|
                                                             (|Record|
                                                              (|:| |val| $)
                                                              (|:| |exponent|
                                                                   (|NonNegativeInteger|))))
                                                        (|:| |qot|
                                                             (|Record|
                                                              (|:| |num| $)
                                                              (|:| |den| $)))
                                                        (|:| |sym|
                                                             (|Record|
                                                              (|:| |tag|
                                                                   (|SingleInteger|))
                                                              (|:| |val|
                                                                   (|Symbol|))
                                                              (|:| |pred|
                                                                   (|List|
                                                                    (|Any|)))
                                                              (|:| |bad|
                                                                   (|List|
                                                                    (|Any|))))))
                                                       #4#))
                                     2))
                              G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |x| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #5#
                                      (CONS (SPADCALL |x| (QREFELT $ 61))
                                            #5#))))
                              (LETT #3# (CDR #3#)) (GO G190) G191
                              (EXIT (NREVERSE #5#)))))))
                ((QEQCAR |p| 3)
                 (CONS 3
                       (CONS
                        (SPADCALL
                         (QCAR
                          (PROG2 (LETT #2# |p|)
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 3)
                                            (|Record| (|:| |num| $)
                                                      (|:| |den| $))
                                            (|Union| (|:| |ret| (QREFELT $ 6))
                                                     (|:| |ker|
                                                          (|Record|
                                                           (|:| |tag|
                                                                (|SingleInteger|))
                                                           (|:| |op|
                                                                (|BasicOperator|))
                                                           (|:| |arg|
                                                                (|List| $))))
                                                     (|:| |exp|
                                                          (|Record|
                                                           (|:| |val| $)
                                                           (|:| |exponent|
                                                                (|NonNegativeInteger|))))
                                                     (|:| |qot|
                                                          (|Record|
                                                           (|:| |num| $)
                                                           (|:| |den| $)))
                                                     (|:| |sym|
                                                          (|Record|
                                                           (|:| |tag|
                                                                (|SingleInteger|))
                                                           (|:| |val|
                                                                (|Symbol|))
                                                           (|:| |pred|
                                                                (|List|
                                                                 (|Any|)))
                                                           (|:| |bad|
                                                                (|List|
                                                                 (|Any|))))))
                                            #2#)))
                         (QREFELT $ 61))
                        (SPADCALL
                         (QCDR
                          (PROG2 (LETT #2# |p|)
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 3)
                                            (|Record| (|:| |num| $)
                                                      (|:| |den| $))
                                            (|Union| (|:| |ret| (QREFELT $ 6))
                                                     (|:| |ker|
                                                          (|Record|
                                                           (|:| |tag|
                                                                (|SingleInteger|))
                                                           (|:| |op|
                                                                (|BasicOperator|))
                                                           (|:| |arg|
                                                                (|List| $))))
                                                     (|:| |exp|
                                                          (|Record|
                                                           (|:| |val| $)
                                                           (|:| |exponent|
                                                                (|NonNegativeInteger|))))
                                                     (|:| |qot|
                                                          (|Record|
                                                           (|:| |num| $)
                                                           (|:| |den| $)))
                                                     (|:| |sym|
                                                          (|Record|
                                                           (|:| |tag|
                                                                (|SingleInteger|))
                                                           (|:| |val|
                                                                (|Symbol|))
                                                           (|:| |pred|
                                                                (|List|
                                                                 (|Any|)))
                                                           (|:| |bad|
                                                                (|List|
                                                                 (|Any|))))))
                                            #2#)))
                         (QREFELT $ 61)))))
                ('T
                 (CONS 2
                       (CONS
                        (SPADCALL
                         (QCAR
                          (PROG2 (LETT #1# |p|)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 2)
                                            (|Record| (|:| |val| $)
                                                      (|:| |exponent|
                                                           (|NonNegativeInteger|)))
                                            (|Union| (|:| |ret| (QREFELT $ 6))
                                                     (|:| |ker|
                                                          (|Record|
                                                           (|:| |tag|
                                                                (|SingleInteger|))
                                                           (|:| |op|
                                                                (|BasicOperator|))
                                                           (|:| |arg|
                                                                (|List| $))))
                                                     (|:| |exp|
                                                          (|Record|
                                                           (|:| |val| $)
                                                           (|:| |exponent|
                                                                (|NonNegativeInteger|))))
                                                     (|:| |qot|
                                                          (|Record|
                                                           (|:| |num| $)
                                                           (|:| |den| $)))
                                                     (|:| |sym|
                                                          (|Record|
                                                           (|:| |tag|
                                                                (|SingleInteger|))
                                                           (|:| |val|
                                                                (|Symbol|))
                                                           (|:| |pred|
                                                                (|List|
                                                                 (|Any|)))
                                                           (|:| |bad|
                                                                (|List|
                                                                 (|Any|))))))
                                            #1#)))
                         (QREFELT $ 61))
                        (QCDR
                         (PROG2 (LETT #1# |p|)
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 2)
                                           (|Record| (|:| |val| $)
                                                     (|:| |exponent|
                                                          (|NonNegativeInteger|)))
                                           (|Union| (|:| |ret| (QREFELT $ 6))
                                                    (|:| |ker|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |op|
                                                               (|BasicOperator|))
                                                          (|:| |arg|
                                                               (|List| $))))
                                                    (|:| |exp|
                                                         (|Record|
                                                          (|:| |val| $)
                                                          (|:| |exponent|
                                                               (|NonNegativeInteger|))))
                                                    (|:| |qot|
                                                         (|Record|
                                                          (|:| |num| $)
                                                          (|:| |den| $)))
                                                    (|:| |sym|
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |val|
                                                               (|Symbol|))
                                                          (|:| |pred|
                                                               (|List|
                                                                (|Any|)))
                                                          (|:| |bad|
                                                               (|List|
                                                                (|Any|))))))
                                           #1#)))))))))) 

(SDEFUN |PATTERN;pateq?|
        ((|p1| |Union| (|:| |ret| R)
          (|:| |ker|
               (|Record| (|:| |tag| (|SingleInteger|))
                         (|:| |op| (|BasicOperator|)) (|:| |arg| (|List| $))))
          (|:| |exp|
               (|Record| (|:| |val| $)
                         (|:| |exponent| (|NonNegativeInteger|))))
          (|:| |qot| (|Record| (|:| |num| $) (|:| |den| $)))
          (|:| |sym|
               (|Record| (|:| |tag| (|SingleInteger|)) (|:| |val| (|Symbol|))
                         (|:| |pred| (|List| (|Any|)))
                         (|:| |bad| (|List| (|Any|))))))
         (|p2| |Union| (|:| |ret| R)
          (|:| |ker|
               (|Record| (|:| |tag| (|SingleInteger|))
                         (|:| |op| (|BasicOperator|)) (|:| |arg| (|List| $))))
          (|:| |exp|
               (|Record| (|:| |val| $)
                         (|:| |exponent| (|NonNegativeInteger|))))
          (|:| |qot| (|Record| (|:| |num| $) (|:| |den| $)))
          (|:| |sym|
               (|Record| (|:| |tag| (|SingleInteger|)) (|:| |val| (|Symbol|))
                         (|:| |pred| (|List| (|Any|)))
                         (|:| |bad| (|List| (|Any|))))))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G435 NIL) (#2=#:G434 NIL) (#3=#:G437 NIL) (#4=#:G436 NIL))
         (COND
          ((QEQCAR |p1| 0)
           (COND
            ((QEQCAR |p2| 0) (SPADCALL (CDR |p1|) (CDR |p2|) (QREFELT $ 133)))
            (#5='T NIL)))
          ((QEQCAR |p1| 3)
           (COND
            ((QEQCAR |p2| 3)
             (COND
              ((SPADCALL
                (QCAR
                 (PROG2 (LETT #4# |p1|)
                     (QCDR #4#)
                   (|check_union2| (QEQCAR #4# 3)
                                   (|Record| (|:| |num| $) (|:| |den| $))
                                   (|Union| (|:| |ret| (QREFELT $ 6))
                                            (|:| |ker|
                                                 (|Record|
                                                  (|:| |tag| (|SingleInteger|))
                                                  (|:| |op| (|BasicOperator|))
                                                  (|:| |arg| (|List| $))))
                                            (|:| |exp|
                                                 (|Record| (|:| |val| $)
                                                           (|:| |exponent|
                                                                (|NonNegativeInteger|))))
                                            (|:| |qot|
                                                 (|Record| (|:| |num| $)
                                                           (|:| |den| $)))
                                            (|:| |sym|
                                                 (|Record|
                                                  (|:| |tag| (|SingleInteger|))
                                                  (|:| |val| (|Symbol|))
                                                  (|:| |pred| (|List| (|Any|)))
                                                  (|:| |bad|
                                                       (|List| (|Any|))))))
                                   #4#)))
                (QCAR (CDR |p2|)) (QREFELT $ 78))
               (SPADCALL
                (QCDR
                 (PROG2 (LETT #4# |p1|)
                     (QCDR #4#)
                   (|check_union2| (QEQCAR #4# 3)
                                   (|Record| (|:| |num| $) (|:| |den| $))
                                   (|Union| (|:| |ret| (QREFELT $ 6))
                                            (|:| |ker|
                                                 (|Record|
                                                  (|:| |tag| (|SingleInteger|))
                                                  (|:| |op| (|BasicOperator|))
                                                  (|:| |arg| (|List| $))))
                                            (|:| |exp|
                                                 (|Record| (|:| |val| $)
                                                           (|:| |exponent|
                                                                (|NonNegativeInteger|))))
                                            (|:| |qot|
                                                 (|Record| (|:| |num| $)
                                                           (|:| |den| $)))
                                            (|:| |sym|
                                                 (|Record|
                                                  (|:| |tag| (|SingleInteger|))
                                                  (|:| |val| (|Symbol|))
                                                  (|:| |pred| (|List| (|Any|)))
                                                  (|:| |bad|
                                                       (|List| (|Any|))))))
                                   #4#)))
                (QCDR (CDR |p2|)) (QREFELT $ 78)))
              (#5# NIL)))
            (#5# NIL)))
          ((QEQCAR |p1| 4)
           (COND
            ((QEQCAR |p2| 4)
             (COND
              ((EQUAL
                (QVELT
                 (PROG2 (LETT #3# |p1|)
                     (QCDR #3#)
                   (|check_union2| (QEQCAR #3# 4)
                                   (|Record| (|:| |tag| (|SingleInteger|))
                                             (|:| |val| (|Symbol|))
                                             (|:| |pred| (|List| (|Any|)))
                                             (|:| |bad| (|List| (|Any|))))
                                   (|Union| (|:| |ret| (QREFELT $ 6))
                                            (|:| |ker|
                                                 (|Record|
                                                  (|:| |tag| (|SingleInteger|))
                                                  (|:| |op| (|BasicOperator|))
                                                  (|:| |arg| (|List| $))))
                                            (|:| |exp|
                                                 (|Record| (|:| |val| $)
                                                           (|:| |exponent|
                                                                (|NonNegativeInteger|))))
                                            (|:| |qot|
                                                 (|Record| (|:| |num| $)
                                                           (|:| |den| $)))
                                            (|:| |sym|
                                                 (|Record|
                                                  (|:| |tag| (|SingleInteger|))
                                                  (|:| |val| (|Symbol|))
                                                  (|:| |pred| (|List| (|Any|)))
                                                  (|:| |bad|
                                                       (|List| (|Any|))))))
                                   #3#))
                 1)
                (QVELT (CDR |p2|) 1))
               (COND
                ((SPADCALL
                  (SPADCALL
                   (QVELT
                    (PROG2 (LETT #3# |p1|)
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 4)
                                      (|Record| (|:| |tag| (|SingleInteger|))
                                                (|:| |val| (|Symbol|))
                                                (|:| |pred| (|List| (|Any|)))
                                                (|:| |bad| (|List| (|Any|))))
                                      (|Union| (|:| |ret| (QREFELT $ 6))
                                               (|:| |ker|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |op|
                                                          (|BasicOperator|))
                                                     (|:| |arg| (|List| $))))
                                               (|:| |exp|
                                                    (|Record| (|:| |val| $)
                                                              (|:| |exponent|
                                                                   (|NonNegativeInteger|))))
                                               (|:| |qot|
                                                    (|Record| (|:| |num| $)
                                                              (|:| |den| $)))
                                               (|:| |sym|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |val| (|Symbol|))
                                                     (|:| |pred|
                                                          (|List| (|Any|)))
                                                     (|:| |bad|
                                                          (|List| (|Any|))))))
                                      #3#))
                    2)
                   (QREFELT $ 135))
                  (SPADCALL (QVELT (CDR |p2|) 2) (QREFELT $ 135))
                  (QREFELT $ 136))
                 (SPADCALL
                  (SPADCALL
                   (QVELT
                    (PROG2 (LETT #3# |p1|)
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 4)
                                      (|Record| (|:| |tag| (|SingleInteger|))
                                                (|:| |val| (|Symbol|))
                                                (|:| |pred| (|List| (|Any|)))
                                                (|:| |bad| (|List| (|Any|))))
                                      (|Union| (|:| |ret| (QREFELT $ 6))
                                               (|:| |ker|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |op|
                                                          (|BasicOperator|))
                                                     (|:| |arg| (|List| $))))
                                               (|:| |exp|
                                                    (|Record| (|:| |val| $)
                                                              (|:| |exponent|
                                                                   (|NonNegativeInteger|))))
                                               (|:| |qot|
                                                    (|Record| (|:| |num| $)
                                                              (|:| |den| $)))
                                               (|:| |sym|
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |val| (|Symbol|))
                                                     (|:| |pred|
                                                          (|List| (|Any|)))
                                                     (|:| |bad|
                                                          (|List| (|Any|))))))
                                      #3#))
                    3)
                   (QREFELT $ 135))
                  (SPADCALL (QVELT (CDR |p2|) 3) (QREFELT $ 135))
                  (QREFELT $ 136)))
                (#5# NIL)))
              (#5# NIL)))
            (#5# NIL)))
          ((QEQCAR |p1| 1)
           (COND
            ((QEQCAR |p2| 1)
             (COND
              ((EQL
                (QVELT
                 (PROG2 (LETT #2# |p1|)
                     (QCDR #2#)
                   (|check_union2| (QEQCAR #2# 1)
                                   (|Record| (|:| |tag| (|SingleInteger|))
                                             (|:| |op| (|BasicOperator|))
                                             (|:| |arg| (|List| $)))
                                   (|Union| (|:| |ret| (QREFELT $ 6))
                                            (|:| |ker|
                                                 (|Record|
                                                  (|:| |tag| (|SingleInteger|))
                                                  (|:| |op| (|BasicOperator|))
                                                  (|:| |arg| (|List| $))))
                                            (|:| |exp|
                                                 (|Record| (|:| |val| $)
                                                           (|:| |exponent|
                                                                (|NonNegativeInteger|))))
                                            (|:| |qot|
                                                 (|Record| (|:| |num| $)
                                                           (|:| |den| $)))
                                            (|:| |sym|
                                                 (|Record|
                                                  (|:| |tag| (|SingleInteger|))
                                                  (|:| |val| (|Symbol|))
                                                  (|:| |pred| (|List| (|Any|)))
                                                  (|:| |bad|
                                                       (|List| (|Any|))))))
                                   #2#))
                 0)
                (QVELT (CDR |p2|) 0))
               (COND
                ((SPADCALL
                  (QVELT
                   (PROG2 (LETT #2# |p1|)
                       (QCDR #2#)
                     (|check_union2| (QEQCAR #2# 1)
                                     (|Record| (|:| |tag| (|SingleInteger|))
                                               (|:| |op| (|BasicOperator|))
                                               (|:| |arg| (|List| $)))
                                     (|Union| (|:| |ret| (QREFELT $ 6))
                                              (|:| |ker|
                                                   (|Record|
                                                    (|:| |tag|
                                                         (|SingleInteger|))
                                                    (|:| |op|
                                                         (|BasicOperator|))
                                                    (|:| |arg| (|List| $))))
                                              (|:| |exp|
                                                   (|Record| (|:| |val| $)
                                                             (|:| |exponent|
                                                                  (|NonNegativeInteger|))))
                                              (|:| |qot|
                                                   (|Record| (|:| |num| $)
                                                             (|:| |den| $)))
                                              (|:| |sym|
                                                   (|Record|
                                                    (|:| |tag|
                                                         (|SingleInteger|))
                                                    (|:| |val| (|Symbol|))
                                                    (|:| |pred|
                                                         (|List| (|Any|)))
                                                    (|:| |bad|
                                                         (|List| (|Any|))))))
                                     #2#))
                   1)
                  (QVELT (CDR |p2|) 1) (QREFELT $ 103))
                 (SPADCALL
                  (QVELT
                   (PROG2 (LETT #2# |p1|)
                       (QCDR #2#)
                     (|check_union2| (QEQCAR #2# 1)
                                     (|Record| (|:| |tag| (|SingleInteger|))
                                               (|:| |op| (|BasicOperator|))
                                               (|:| |arg| (|List| $)))
                                     (|Union| (|:| |ret| (QREFELT $ 6))
                                              (|:| |ker|
                                                   (|Record|
                                                    (|:| |tag|
                                                         (|SingleInteger|))
                                                    (|:| |op|
                                                         (|BasicOperator|))
                                                    (|:| |arg| (|List| $))))
                                              (|:| |exp|
                                                   (|Record| (|:| |val| $)
                                                             (|:| |exponent|
                                                                  (|NonNegativeInteger|))))
                                              (|:| |qot|
                                                   (|Record| (|:| |num| $)
                                                             (|:| |den| $)))
                                              (|:| |sym|
                                                   (|Record|
                                                    (|:| |tag|
                                                         (|SingleInteger|))
                                                    (|:| |val| (|Symbol|))
                                                    (|:| |pred|
                                                         (|List| (|Any|)))
                                                    (|:| |bad|
                                                         (|List| (|Any|))))))
                                     #2#))
                   2)
                  (QVELT (CDR |p2|) 2) (QREFELT $ 137)))
                (#5# NIL)))
              (#5# NIL)))
            (#5# NIL)))
          ((QEQCAR |p2| 2)
           (COND
            ((EQL
              (QCDR
               (PROG2 (LETT #1# |p1|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 2)
                                 (|Record| (|:| |val| $)
                                           (|:| |exponent|
                                                (|NonNegativeInteger|)))
                                 (|Union| (|:| |ret| (QREFELT $ 6))
                                          (|:| |ker|
                                               (|Record|
                                                (|:| |tag| (|SingleInteger|))
                                                (|:| |op| (|BasicOperator|))
                                                (|:| |arg| (|List| $))))
                                          (|:| |exp|
                                               (|Record| (|:| |val| $)
                                                         (|:| |exponent|
                                                              (|NonNegativeInteger|))))
                                          (|:| |qot|
                                               (|Record| (|:| |num| $)
                                                         (|:| |den| $)))
                                          (|:| |sym|
                                               (|Record|
                                                (|:| |tag| (|SingleInteger|))
                                                (|:| |val| (|Symbol|))
                                                (|:| |pred| (|List| (|Any|)))
                                                (|:| |bad| (|List| (|Any|))))))
                                 #1#)))
              (QCDR (CDR |p2|)))
             (SPADCALL
              (QCAR
               (PROG2 (LETT #1# |p1|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 2)
                                 (|Record| (|:| |val| $)
                                           (|:| |exponent|
                                                (|NonNegativeInteger|)))
                                 (|Union| (|:| |ret| (QREFELT $ 6))
                                          (|:| |ker|
                                               (|Record|
                                                (|:| |tag| (|SingleInteger|))
                                                (|:| |op| (|BasicOperator|))
                                                (|:| |arg| (|List| $))))
                                          (|:| |exp|
                                               (|Record| (|:| |val| $)
                                                         (|:| |exponent|
                                                              (|NonNegativeInteger|))))
                                          (|:| |qot|
                                               (|Record| (|:| |num| $)
                                                         (|:| |den| $)))
                                          (|:| |sym|
                                               (|Record|
                                                (|:| |tag| (|SingleInteger|))
                                                (|:| |val| (|Symbol|))
                                                (|:| |pred| (|List| (|Any|)))
                                                (|:| |bad| (|List| (|Any|))))))
                                 #1#)))
              (QCAR (CDR |p2|)) (QREFELT $ 78)))
            (#5# NIL)))
          (#5# NIL)))) 

(SDEFUN |PATTERN;retractIfCan;$U;57| ((|p| $) ($ |Union| (|Symbol|) "failed"))
        (SPROG ((#1=#:G437 NIL))
               (COND
                ((SPADCALL |p| (QREFELT $ 29))
                 (CONS 0
                       (QVELT
                        (PROG2 (LETT #1# (QVELT |p| 1))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 4)
                                          (|Record|
                                           (|:| |tag| (|SingleInteger|))
                                           (|:| |val| (|Symbol|))
                                           (|:| |pred| (|List| (|Any|)))
                                           (|:| |bad| (|List| (|Any|))))
                                          (|Union| (|:| |ret| (QREFELT $ 6))
                                                   (|:| |ker|
                                                        (|Record|
                                                         (|:| |tag|
                                                              (|SingleInteger|))
                                                         (|:| |op|
                                                              (|BasicOperator|))
                                                         (|:| |arg|
                                                              (|List| $))))
                                                   (|:| |exp|
                                                        (|Record| (|:| |val| $)
                                                                  (|:|
                                                                   |exponent|
                                                                   (|NonNegativeInteger|))))
                                                   (|:| |qot|
                                                        (|Record| (|:| |num| $)
                                                                  (|:| |den|
                                                                       $)))
                                                   (|:| |sym|
                                                        (|Record|
                                                         (|:| |tag|
                                                              (|SingleInteger|))
                                                         (|:| |val| (|Symbol|))
                                                         (|:| |pred|
                                                              (|List| (|Any|)))
                                                         (|:| |bad|
                                                              (|List|
                                                               (|Any|))))))
                                          #1#))
                        1)))
                ('T (CONS 1 "failed"))))) 

(SDEFUN |PATTERN;mkrsy|
        ((|t| |Symbol|) (|c?| |Boolean|) (|o?| |Boolean|) (|m?| |Boolean|)
         ($ |Record| (|:| |tag| (|SingleInteger|)) (|:| |val| (|Symbol|))
          (|:| |pred| (|List| (|Any|))) (|:| |bad| (|List| (|Any|)))))
        (SPROG ((|opt| #1=(|SingleInteger|)) (|mlt| #1#))
               (SEQ
                (COND (|c?| (VECTOR 0 |t| NIL NIL))
                      (#2='T
                       (SEQ (LETT |mlt| (COND (|m?| 2) (#2# 0)))
                            (LETT |opt| (COND (|o?| 4) (#2# 0)))
                            (EXIT
                             (VECTOR (|or_SI| (|or_SI| 1 |mlt|) |opt|) |t| NIL
                                     NIL)))))))) 

(SDEFUN |PATTERN;patternVariable;S3B$;59|
        ((|sy| |Symbol|) (|c?| |Boolean|) (|o?| |Boolean|) (|m?| |Boolean|)
         ($ $))
        (SPROG
         ((|rsy|
           (|Record| (|:| |tag| (|SingleInteger|)) (|:| |val| (|Symbol|))
                     (|:| |pred| (|List| (|Any|)))
                     (|:| |bad| (|List| (|Any|))))))
         (SEQ (LETT |rsy| (|PATTERN;mkrsy| |sy| |c?| |o?| |m?| $))
              (EXIT
               (|PATTERN;mkPat| (ZEROP (QVELT |rsy| 0)) (CONS 4 |rsy|) 0 $))))) 

(DECLAIM (NOTINLINE |Pattern;|)) 

(DEFUN |Pattern| (#1=#:G691)
  (SPROG NIL
         (PROG (#2=#:G692)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Pattern|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Pattern;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Pattern|)))))))))) 

(DEFUN |Pattern;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Pattern| DV$1))
          (LETT $ (GETREFV 141))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Pattern| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |cons?| (|Boolean|))
                              (|:| |pat|
                                   (|Union| (|:| |ret| |#1|)
                                            (|:| |ker|
                                                 (|Record|
                                                  (|:| |tag| (|SingleInteger|))
                                                  (|:| |op| (|BasicOperator|))
                                                  (|:| |arg| (|List| $))))
                                            (|:| |exp|
                                                 (|Record| (|:| |val| $)
                                                           (|:| |exponent|
                                                                (|NonNegativeInteger|))))
                                            (|:| |qot|
                                                 (|Record| (|:| |num| $)
                                                           (|:| |den| $)))
                                            (|:| |sym|
                                                 (|Record|
                                                  (|:| |tag| (|SingleInteger|))
                                                  (|:| |val| (|Symbol|))
                                                  (|:| |pred| (|List| (|Any|)))
                                                  (|:| |bad|
                                                       (|List| (|Any|)))))))
                              (|:| |lev| (|NonNegativeInteger|))
                              (|:| |topvar| (|List| (|Symbol|)))
                              (|:| |toppred| (|Any|))))
          (QSETREFV $ 12 (SPADCALL (SPADCALL (QREFELT $ 9)) (QREFELT $ 11)))
          (QSETREFV $ 17 (SPADCALL 0 (QREFELT $ 16)))
          (COND
           ((|HasCategory| |#1| '(|Monoid|))
            (QSETREFV $ 72
                      (CONS #'|makeSpadConstant|
                            (LIST (|dispatchFunction| |PATTERN;One;$;38|) $
                                  72))))
           ('T
            (QSETREFV $ 72
                      (CONS #'|makeSpadConstant|
                            (LIST (|dispatchFunction| |PATTERN;One;$;39|) $
                                  72)))))
          (COND
           ((|HasCategory| |#1| '(|AbelianMonoid|))
            (QSETREFV $ 88
                      (CONS #'|makeSpadConstant|
                            (LIST (|dispatchFunction| |PATTERN;Zero;$;40|) $
                                  88))))
           ('T
            (QSETREFV $ 88
                      (CONS #'|makeSpadConstant|
                            (LIST (|dispatchFunction| |PATTERN;Zero;$;41|) $
                                  88)))))
          $))) 

(MAKEPROP '|Pattern| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Symbol|)
              (0 . |new|) (|BasicOperator|) (4 . |operator|) '|dummy| (|Any|)
              (|Integer|) (|AnyFunctions1| 14) (9 . |coerce|) '|nopred|
              |PATTERN;coerce;R$;1| (|Boolean|) |PATTERN;hasTopPredicate?;$B;3|
              (|Record| (|:| |var| 23) (|:| |pred| 13))
              |PATTERN;topPredicate;$R;4| (|List| 8)
              |PATTERN;setTopPredicate;$LA$;5| |PATTERN;constant?;$B;6|
              (|NonNegativeInteger|) |PATTERN;depth;$Nni;7| |PATTERN;inR?;$B;8|
              |PATTERN;symbol?;$B;9| (|Union| 57 '"failed")
              |PATTERN;isPlus;$U;10| (|SingleInteger|) (14 . |coerce|)
              |PATTERN;isTimes;$U;11| |PATTERN;isList;$U;12|
              (|Record| (|:| |val| $) (|:| |exponent| 26))
              (|Union| 36 '"failed") |PATTERN;isExpt;$U;13|
              (|Record| (|:| |num| $) (|:| |den| $)) (|Union| 39 '"failed")
              |PATTERN;isQuotient;$U;14| (|List| 13) |PATTERN;predicates;$L;47|
              |PATTERN;hasPredicate?;$B;15| |PATTERN;quoted?;$B;16|
              |PATTERN;generic?;$B;17| |PATTERN;multiple?;$B;18|
              |PATTERN;optional?;$B;19| (19 . ~=) (|OutputForm|)
              |PATTERN;coerce;$Of;21| |PATTERN;^;3$;22| (|Mapping| 50 50 50)
              (|List| 50) (25 . |reduce|) |PATTERN;retract;$R;24| (|List| $)
              |PATTERN;convert;L$;25| (|Union| 6 '"failed")
              |PATTERN;retractIfCan;$U;26| |PATTERN;copy;2$;29|
              |PATTERN;setPredicates;$L$;48| |PATTERN;withPredicates;$L$;27|
              |PATTERN;patternVariable;S3B$;59| |PATTERN;coerce;S$;28|
              (|List| $$) (31 . |rest|) (36 . |empty?|) (41 . |first|)
              (46 . |reverse|) |PATTERN;optpair;LU;30| (51 . |One|)
              (55 . |max|) (|Mapping| 26 26 26) (|List| 26) (61 . |reduce|)
              (68 . =) |PATTERN;=;2$B;32| (74 . |second|)
              (|Record| (|:| |val| $) (|:| |exponent| $))
              (|Union| 80 '"failed") |PATTERN;isPower;$U;33| (|Mapping| 19 $$)
              (79 . |every?|) (85 . |is?|) (91 . |#|) (96 . |last|)
              (101 . |Zero|) |PATTERN;elt;BoL$;35|
              (|Record| (|:| |op| 10) (|:| |arg| 57)) (|Union| 90 '"failed")
              |PATTERN;isOp;$U;36| (105 . |One|) (109 . |empty|) (113 . |Zero|)
              |PATTERN;^;$Nni$;42| |PATTERN;/;3$;43| (117 . |concat|)
              (123 . |concat|) (129 . |concat|) |PATTERN;+;3$;44|
              |PATTERN;*;3$;45| (135 . =) |PATTERN;isOp;$BoU;46|
              |PATTERN;resetBadValues;2$;49| (141 . |member?|)
              |PATTERN;addBadValue;$A$;50| |PATTERN;getBadValues;$L;51|
              (147 . |coerce|) (|String|) (152 . |message|) (157 . |and|)
              (163 . |coerce|) (168 . |sub|) (174 . |infix|) (181 . |paren|)
              |PATTERN;variables;$L;53| (186 . |concat!|) (192 . |concat|)
              (197 . |coerce|) (202 . ^) (208 . /) (214 . +) (220 . *)
              (226 . |coerce|) (231 . |coerce|) (|Mapping| 50 54)
              (|Union| 127 '"failed") (236 . |display|) (241 . |name|)
              (246 . |prefix|) (252 . |copy|) (257 . =) (|Set| 13)
              (263 . |set|) (268 . =) (274 . =) (|Union| 8 '"failed")
              |PATTERN;retractIfCan;$U;57| (|HashState|))
           '#(~= 280 |withPredicates| 286 |variables| 292 |topPredicate| 297
              |symbol?| 302 |setTopPredicate| 307 |setPredicates| 314
              |retractIfCan| 320 |retract| 330 |resetBadValues| 340 |quoted?|
              345 |predicates| 350 |patternVariable| 355 |optpair| 363
              |optional?| 368 |multiple?| 373 |latex| 378 |isTimes| 383
              |isQuotient| 388 |isPower| 393 |isPlus| 398 |isOp| 403 |isList|
              414 |isExpt| 419 |inR?| 424 |hashUpdate!| 429 |hash| 435
              |hasTopPredicate?| 440 |hasPredicate?| 445 |getBadValues| 450
              |generic?| 455 |elt| 460 |depth| 466 |copy| 471 |convert| 476
              |constant?| 481 |coerce| 486 |addBadValue| 501 ^ 507 |Zero| 519
              |One| 523 = 527 / 533 + 539 * 545)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0))
                 (CONS
                  '#(|SetCategory&| |BasicType&| |RetractableTo&|
                     |RetractableTo&| NIL)
                  (CONS
                   '#((|SetCategory|) (|BasicType|) (|RetractableTo| 8)
                      (|RetractableTo| 6) (|CoercibleTo| 50))
                   (|makeByteWordVec2| 140
                                       '(0 8 0 9 1 10 0 8 11 1 15 13 14 16 1 32
                                         0 14 33 2 32 19 0 0 49 2 54 50 53 0 55
                                         1 66 0 0 67 1 66 19 0 68 1 66 2 0 69 1
                                         66 0 0 70 0 0 0 72 2 26 0 0 0 73 3 75
                                         26 74 0 26 76 2 23 19 0 0 77 1 66 2 0
                                         79 2 66 19 83 0 84 2 10 19 0 8 85 1 66
                                         26 0 86 1 66 2 0 87 0 0 0 88 0 6 0 93
                                         0 66 0 94 0 6 0 95 2 66 0 0 0 98 2 66
                                         0 0 2 99 2 66 0 2 0 100 2 10 19 0 0
                                         103 2 42 19 13 0 106 1 8 50 0 109 1 50
                                         0 110 111 2 50 0 0 0 112 1 26 50 0 113
                                         2 50 0 0 0 114 3 50 0 0 0 0 115 1 50 0
                                         0 116 2 66 0 0 0 118 1 66 0 57 119 1 6
                                         50 0 120 2 50 0 0 0 121 2 50 0 0 0 122
                                         2 50 0 0 0 123 2 50 0 0 0 124 1 66 50
                                         0 125 1 14 50 0 126 1 10 128 0 129 1
                                         10 8 0 130 2 50 0 0 57 131 1 42 0 0
                                         132 2 6 19 0 0 133 1 134 0 42 135 2
                                         134 19 0 0 136 2 66 19 0 0 137 2 0 19
                                         0 0 1 2 0 0 0 42 63 1 0 57 0 117 1 0
                                         21 0 22 1 0 19 0 29 3 0 0 0 23 13 24 2
                                         0 0 0 42 62 1 0 138 0 139 1 0 59 0 60
                                         1 0 8 0 1 1 0 6 0 56 1 0 0 0 105 1 0
                                         19 0 45 1 0 42 0 43 4 0 0 8 19 19 19
                                         64 1 0 30 57 71 1 0 19 0 48 1 0 19 0
                                         47 1 0 110 0 1 1 0 30 0 34 1 0 40 0 41
                                         1 0 81 0 82 1 0 30 0 31 1 0 91 0 92 2
                                         0 30 0 10 104 1 0 30 0 35 1 0 37 0 38
                                         1 0 19 0 28 2 0 140 140 0 1 1 0 32 0 1
                                         1 0 19 0 20 1 0 19 0 44 1 0 42 0 108 1
                                         0 19 0 46 2 0 0 10 57 89 1 0 26 0 27 1
                                         0 0 0 61 1 0 0 57 58 1 0 19 0 25 1 0 0
                                         8 65 1 0 0 6 18 1 0 50 0 51 2 0 0 0 13
                                         107 2 0 0 0 0 52 2 0 0 0 26 96 0 0 0
                                         88 0 0 0 72 2 0 19 0 0 78 2 0 0 0 0 97
                                         2 0 0 0 0 101 2 0 0 0 0 102)))))
           '|lookupComplete|)) 
