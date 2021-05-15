
(SDEFUN |FC;get_assignment|
        ((|name| |OutputForm|) (|e| |OutputForm|) (|int_to_floats?| |Boolean|)
         ($ |List| (|String|)))
        (SPADCALL
         (SPADCALL (SPADCALL '= (QREFELT $ 8)) (LIST |name| |e|)
                   (QREFELT $ 10))
         |int_to_floats?| (QREFELT $ 14))) 

(SDEFUN |FC;format_switch|
        ((|switch1| |OutputForm|) (|l| |List| (|String|))
         ($ |List| (|List| (|String|))))
        (SPROG ((|r| (|List| (|String|))) (|l1| (|List| (|OutputForm|))))
               (SEQ
                (COND
                 ((LISTP |switch1|)
                  (SEQ (LETT |l1| |switch1|)
                       (EXIT
                        (COND
                         ((EQ (|SPADfirst| |l1|) 'NULL)
                          (LETT |switch1| (|SPADfirst| (CDR |l1|)))))))))
                (LETT |r| (NREVERSE (SPADCALL |switch1| (QREFELT $ 15))))
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |r|) NIL)
                              ('T (NULL (EQUAL (|SPADfirst| |r|) "%l")))))
                       (GO G191)))
                     (SEQ (LETT |l| (CONS (|SPADfirst| |r|) |l|))
                          (EXIT (LETT |r| (CDR |r|))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (LIST |l| |r|))))) 

(SDEFUN |FC;fortFormatIf1|
        ((|switch1| |OutputForm|) (|i| |Integer|) (|kind| |String|)
         ($ |List| (|String|)))
        (SPROG
         ((|r| NIL) (|#G11| #1=(|List| (|List| (|String|))))
          (|l| (|List| (|String|))) (|#G10| #1#))
         (SEQ (LETT |l| (LIST ")THEN")) (SPADCALL (- |i|) (QREFELT $ 18))
              (PROGN
               (LETT |#G10| (|FC;format_switch| |switch1| |l| $))
               (LETT |#G11| |#G10|)
               (LETT |l| (|SPADfirst| |#G11|))
               (LETT |#G11| (CDR |#G11|))
               (LETT |r| (|SPADfirst| |#G11|))
               |#G10|)
              (SPADCALL |i| (QREFELT $ 18))
              (EXIT
               (NREVERSE
                (SPADCALL (NREVERSE |l|) (CONS |kind| |r|) (QREFELT $ 19))))))) 

(SDEFUN |FC;fortFormatIf| ((|switch1| |OutputForm|) ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL (CONS #'|FC;fortFormatIf!0| (VECTOR $ |switch1|))
                         (QREFELT $ 21)))) 

(SDEFUN |FC;fortFormatIf!0| (($$ NIL))
        (PROG (|switch1| $)
          (LETT |switch1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|FC;fortFormatIf1| |switch1| 8 "IF(" $))))) 

(SDEFUN |FC;fortFormatElseIf| ((|switch1| |OutputForm|) ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL (CONS #'|FC;fortFormatElseIf!0| (VECTOR $ |switch1|))
                         (QREFELT $ 21)))) 

(SDEFUN |FC;fortFormatElseIf!0| (($$ NIL))
        (PROG (|switch1| $)
          (LETT |switch1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|FC;fortFormatIf1| |switch1| 12 "ELSEIF(" $))))) 

(SDEFUN |FC;fortFormatIfGoto1|
        ((|switch1| |OutputForm|) (|lab| |SingleInteger|)
         ($ |List| (|String|)))
        (SPROG
         ((|r| NIL) (|#G19| #1=(|List| (|List| (|String|))))
          (|l| (|List| (|String|))) (|#G18| #1#))
         (SEQ (LETT |l| (LIST ")GOTO " (STRINGIMAGE |lab|)))
              (SPADCALL -8 (QREFELT $ 18))
              (PROGN
               (LETT |#G18| (|FC;format_switch| |switch1| |l| $))
               (LETT |#G19| |#G18|)
               (LETT |l| (|SPADfirst| |#G19|))
               (LETT |#G19| (CDR |#G19|))
               (LETT |r| (|SPADfirst| |#G19|))
               |#G18|)
              (SPADCALL 8 (QREFELT $ 18))
              (EXIT
               (NREVERSE
                (SPADCALL (NREVERSE |l|) (CONS "IF(" |r|) (QREFELT $ 19))))))) 

(SDEFUN |FC;fortFormatIfGoto|
        ((|switch1| |OutputForm|) (|lab| |SingleInteger|)
         ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|FC;fortFormatIfGoto!0| (VECTOR $ |lab| |switch1|))
                (QREFELT $ 21)))) 

(SDEFUN |FC;fortFormatIfGoto!0| (($$ NIL))
        (PROG (|switch1| |lab| $)
          (LETT |switch1| (QREFELT $$ 2))
          (LETT |lab| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|FC;fortFormatIfGoto1| |switch1| |lab| $))))) 

(SDEFUN |FC;fortFormatLabelledIfGoto1|
        ((|switch1| |OutputForm|) (|lab1| |SingleInteger|)
         (|lab2| |SingleInteger|) ($ |List| (|String|)))
        (SPROG ((|l| (|List| (|String|))) (|labString| (|String|)) (|i| NIL))
               (SEQ (LETT |l| (|FC;fortFormatIfGoto1| |switch1| |lab2| $))
                    (LETT |labString| (STRINGIMAGE |lab1|))
                    (SEQ (LETT |i| (QCSIZE |labString|)) G190
                         (COND ((> |i| 5) (GO G191)))
                         (SEQ
                          (EXIT (LETT |labString| (STRCONC |labString| " "))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                    (LETT |l| (SPADCALL |l| (QREFELT $ 22)))
                    (EXIT
                     (CONS
                      (STRCONC |labString|
                               (SPADCALL (|SPADfirst| |l|)
                                         (SPADCALL 7 (QREFELT $ 24))
                                         (QREFELT $ 26)))
                      (CDR |l|)))))) 

(SDEFUN |FC;fortFormatLabelledIfGoto|
        ((|switch1| |OutputForm|) (|lab1| |SingleInteger|)
         (|lab2| |SingleInteger|) ($ |List| (|String|)))
        (|FC;fortFormatLabelledIfGoto1| |switch1| |lab1| |lab2| $)) 

(SDEFUN |FC;getfortarrayexp1|
        ((|name| |Symbol|) (|of| |OutputForm|) (|int_to_floats?| |Boolean|)
         ($ |List| (|String|)))
        (SPROG ((#1=#:G419 NIL) (|l| (|List| (|String|))))
               (SEQ
                (LETT |l|
                      (SPADCALL (CONS #'|FC;getfortarrayexp1!0| |name|) |of|
                                |int_to_floats?| (QREFELT $ 28)))
                (EXIT
                 (SPADCALL |l|
                           (PROG1 (LETT #1# (- (LENGTH |l|) 2))
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 30)))))) 

(SDEFUN |FC;getfortarrayexp1!0| ((|name| NIL)) |name|) 

(SDEFUN |FC;getfortarrayexp|
        ((|name| |Symbol|) (|of| |OutputForm|) (|int_to_floats?| |Boolean|)
         ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL |int_to_floats?|
                         (CONS #'|FC;getfortarrayexp!0|
                               (VECTOR $ |int_to_floats?| |of| |name|))
                         (QREFELT $ 31)))) 

(SDEFUN |FC;getfortarrayexp!0| (($$ NIL))
        (PROG (|name| |of| |int_to_floats?| $)
          (LETT |name| (QREFELT $$ 3))
          (LETT |of| (QREFELT $$ 2))
          (LETT |int_to_floats?| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN (|FC;getfortarrayexp1| |name| |of| |int_to_floats?| $))))) 

(SDEFUN |FC;fortFormatDo1|
        ((|var1| |Symbol|) (|lo| |OutputForm|) (|hi| |OutputForm|)
         (|incr| |OutputForm|) (|lab| |SingleInteger|) ($ |List| (|String|)))
        (SPROG
         ((|il| (|List| (|String|))) (|incl| (|List| (|String|)))
          (|hil| #1=(|List| (|String|))) (|lol| #1#))
         (SEQ (LETT |lol| (SPADCALL |lo| (QREFELT $ 15)))
              (LETT |hil| (SPADCALL |hi| (QREFELT $ 15)))
              (LETT |incl|
                    (COND
                     ((EQUAL |incr| 1)
                      (CONS "," (SPADCALL |incr| (QREFELT $ 15))))
                     ('T NIL)))
              (LETT |il|
                    (SPADCALL |lol|
                              (CONS "," (SPADCALL |hil| |incl| (QREFELT $ 19)))
                              (QREFELT $ 19)))
              (EXIT
               (SPADCALL
                (LIST "DO " (STRINGIMAGE |lab|) " "
                      (SPADCALL |var1| (QREFELT $ 32)) "=")
                |il| (QREFELT $ 19)))))) 

(SDEFUN |FC;fortFormatDo|
        ((|var1| |Symbol|) (|lo| |OutputForm|) (|hi| |OutputForm|)
         (|inc| |OutputForm|) (|lab| |SingleInteger|) ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL NIL
                         (CONS #'|FC;fortFormatDo!0|
                               (VECTOR $ |lab| |inc| |hi| |lo| |var1|))
                         (QREFELT $ 31)))) 

(SDEFUN |FC;fortFormatDo!0| (($$ NIL))
        (PROG (|var1| |lo| |hi| |inc| |lab| $)
          (LETT |var1| (QREFELT $$ 5))
          (LETT |lo| (QREFELT $$ 4))
          (LETT |hi| (QREFELT $$ 3))
          (LETT |inc| (QREFELT $$ 2))
          (LETT |lab| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|FC;fortFormatDo1| |var1| |lo| |hi| |inc| |lab| $))))) 

(SDEFUN |FC;addCommas| ((|l| |List| (|Symbol|)) ($ |List| (|String|)))
        (SPROG ((|r| (|List| (|String|))) (#1=#:G433 NIL) (|e| NIL))
               (SEQ
                (COND ((NULL |l|) NIL)
                      ('T
                       (SEQ
                        (LETT |r|
                              (LIST
                               (SPADCALL (|SPADfirst| |l|) (QREFELT $ 32))))
                        (SEQ (LETT |e| NIL) (LETT #1# (CDR |l|)) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |r|
                                     (CONS (SPADCALL |e| (QREFELT $ 32))
                                           (CONS "," |r|)))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (NREVERSE |r|)))))))) 

(SDEFUN |FC;setLabelValue;2Si;15| ((|u| |SingleInteger|) ($ |SingleInteger|))
        (SETELT $ 36 |u|)) 

(SDEFUN |FC;newLabel| (($ |SingleInteger|))
        (SEQ (SETELT $ 36 (|add_SI| (QREFELT $ 36) 1)) (EXIT (QREFELT $ 36)))) 

(SDEFUN |FC;commaSep| ((|l| |List| (|String|)) ($ |List| (|String|)))
        (SPROG
         ((#1=#:G440 NIL) (#2=#:G439 #3=(|List| (|String|))) (#4=#:G441 #3#)
          (#5=#:G443 NIL) (|u| NIL))
         (SEQ
          (CONS (SPADCALL |l| 1 (QREFELT $ 40))
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |u| NIL) (LETT #5# (CDR |l|)) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# (LIST "," |u|))
                         (COND
                          (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 19))))
                          ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                      (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T NIL))))))) 

(SDEFUN |FC;getReturn|
        ((|rec| |Record| (|:| |empty?| (|Boolean|))
          (|:| |value|
               (|Record| (|:| |ints2Floats?| (|Boolean|))
                         (|:| |expr| (|OutputForm|)))))
         ($ |List| (|String|)))
        (SPROG
         ((|rv| (|OutputForm|))
          (|rt|
           (|Record| (|:| |ints2Floats?| (|Boolean|))
                     (|:| |expr| (|OutputForm|))))
          (|returnToken| (|OutputForm|)))
         (SEQ (LETT |returnToken| (SPADCALL 'RETURN (QREFELT $ 8)))
              (EXIT
               (COND ((QCAR |rec|) (SPADCALL |returnToken| NIL (QREFELT $ 14)))
                     ('T
                      (SEQ (LETT |rt| (QCDR |rec|)) (LETT |rv| (QCDR |rt|))
                           (EXIT
                            (SPADCALL
                             (SPADCALL |returnToken| (LIST |rv|)
                                       (QREFELT $ 10))
                             (QCAR |rt|) (QREFELT $ 14)))))))))) 

(SDEFUN |FC;getStop| (($ |List| (|String|)))
        (SPADCALL (LIST "STOP") (QREFELT $ 22))) 

(SDEFUN |FC;getSave| (($ |List| (|String|)))
        (SPADCALL (LIST "SAVE") (QREFELT $ 22))) 

(SDEFUN |FC;getCommon|
        ((|u| |Record| (|:| |name| (|Symbol|))
          (|:| |contents| (|List| (|Symbol|))))
         ($ |List| (|String|)))
        (SPADCALL
         (SPADCALL
          (LIST "COMMON" " /" (SPADCALL (QCAR |u|) (QREFELT $ 32)) "/ ")
          (|FC;addCommas| (QCDR |u|) $) (QREFELT $ 19))
         (QREFELT $ 22))) 

(SDEFUN |FC;getPrint| ((|l| |List| (|OutputForm|)) ($ |List| (|String|)))
        (SPROG ((|ll| (|List| (|String|))) (#1=#:G455 NIL) (|i| NIL))
               (SEQ (LETT |ll| (LIST "PRINT*"))
                    (SEQ (LETT |i| NIL) (LETT #1# |l|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ll|
                                 (SPADCALL |ll|
                                           (CONS ","
                                                 (SPADCALL |i| (QREFELT $ 41)))
                                           (QREFELT $ 19)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |ll| (QREFELT $ 22)))))) 

(SDEFUN |FC;getBlock| ((|rec| |List| $) ($ |List| (|String|)))
        (SPROG ((|expr| (|List| (|String|))) (#1=#:G459 NIL) (|u| NIL))
               (SEQ (SPADCALL 1 (QREFELT $ 42)) (LETT |expr| NIL)
                    (SEQ (LETT |u| NIL) (LETT #1# |rec|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |expr|
                                 (SPADCALL |expr| (SPADCALL |u| (QREFELT $ 43))
                                           (QREFELT $ 19)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (SPADCALL -1 (QREFELT $ 42)) (EXIT |expr|)))) 

(SDEFUN |FC;getBody| ((|f| $) ($ |List| (|String|)))
        (SPROG ((|expr| (|List| (|String|))))
               (SEQ
                (COND
                 ((QEQCAR (SPADCALL |f| (QREFELT $ 45)) 4)
                  (SPADCALL |f| (QREFELT $ 43)))
                 ('T
                  (SEQ (SPADCALL 1 (QREFELT $ 42))
                       (LETT |expr| (SPADCALL |f| (QREFELT $ 43)))
                       (SPADCALL -1 (QREFELT $ 42)) (EXIT |expr|))))))) 

(SDEFUN |FC;getElseIf| ((|f| $) ($ |List| (|String|)))
        (SPROG
         ((|expr| (|List| (|String|))) (|elseBranch| ($)) (#1=#:G487 NIL)
          (|rec|
           (|Union| (|:| |nullBranch| #2="null")
                    (|:| |assignmentBranch|
                         (|Record| (|:| |var| (|Symbol|))
                                   (|:| |arrayIndex|
                                        (|List| (|Polynomial| (|Integer|))))
                                   (|:| |rand|
                                        (|Record|
                                         (|:| |ints2Floats?| (|Boolean|))
                                         (|:| |expr| (|OutputForm|))))))
                    (|:| |arrayAssignmentBranch|
                         (|Record| (|:| |var| (|Symbol|))
                                   (|:| |rand| (|OutputForm|))
                                   (|:| |ints2Floats?| (|Boolean|))))
                    (|:| |conditionalBranch|
                         (|Record| (|:| |switch| (|Switch|))
                                   (|:| |thenClause| $) (|:| |elseClause| $)))
                    (|:| |returnBranch|
                         (|Record| (|:| |empty?| (|Boolean|))
                                   (|:| |value|
                                        (|Record|
                                         (|:| |ints2Floats?| (|Boolean|))
                                         (|:| |expr| (|OutputForm|))))))
                    (|:| |blockBranch| (|List| $))
                    (|:| |commentBranch| (|List| (|String|)))
                    (|:| |callBranch| (|String|))
                    (|:| |forBranch|
                         (|Record|
                          (|:| |range|
                               (|SegmentBinding| (|Polynomial| (|Integer|))))
                          (|:| |span| (|Polynomial| (|Integer|)))
                          (|:| |body| $)))
                    (|:| |labelBranch| (|SingleInteger|))
                    (|:| |loopBranch|
                         (|Record| (|:| |switch| (|Switch|)) (|:| |body| $)))
                    (|:| |commonBranch|
                         (|Record| (|:| |name| (|Symbol|))
                                   (|:| |contents| (|List| (|Symbol|)))))
                    (|:| |printBranch| (|List| (|OutputForm|))))))
         (SEQ (LETT |rec| (SPADCALL |f| (QREFELT $ 55)))
              (LETT |expr|
                    (|FC;fortFormatElseIf|
                     (SPADCALL
                      (QVELT
                       (PROG2 (LETT #1# |rec|)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 3)
                                         (|Record| (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $))
                                         (|Union| (|:| |nullBranch| #2#)
                                                  (|:| |assignmentBranch|
                                                       (|Record|
                                                        (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                                  (|:| |arrayAssignmentBranch|
                                                       (|Record|
                                                        (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                                  (|:| |conditionalBranch|
                                                       (|Record|
                                                        (|:| |switch|
                                                             (|Switch|))
                                                        (|:| |thenClause| $)
                                                        (|:| |elseClause| $)))
                                                  (|:| |returnBranch|
                                                       (|Record|
                                                        (|:| |empty?|
                                                             (|Boolean|))
                                                        (|:| |value|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                                  (|:| |blockBranch|
                                                       (|List| $))
                                                  (|:| |commentBranch|
                                                       (|List| (|String|)))
                                                  (|:| |callBranch| (|String|))
                                                  (|:| |forBranch|
                                                       (|Record|
                                                        (|:| |range|
                                                             (|SegmentBinding|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |span|
                                                             (|Polynomial|
                                                              (|Integer|)))
                                                        (|:| |body| $)))
                                                  (|:| |labelBranch|
                                                       (|SingleInteger|))
                                                  (|:| |loopBranch|
                                                       (|Record|
                                                        (|:| |switch|
                                                             (|Switch|))
                                                        (|:| |body| $)))
                                                  (|:| |commonBranch|
                                                       (|Record|
                                                        (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                                  (|:| |printBranch|
                                                       (|List|
                                                        (|OutputForm|))))
                                         #1#))
                       0)
                      (QREFELT $ 57))
                     $))
              (LETT |expr|
                    (SPADCALL |expr|
                              (|FC;getBody|
                               (QVELT
                                (PROG2 (LETT #1# |rec|)
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 3)
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $))
                                                  (|Union|
                                                   (|:| |nullBranch| #2#)
                                                   (|:| |assignmentBranch|
                                                        (|Record|
                                                         (|:| |var| (|Symbol|))
                                                         (|:| |arrayIndex|
                                                              (|List|
                                                               (|Polynomial|
                                                                (|Integer|))))
                                                         (|:| |rand|
                                                              (|Record|
                                                               (|:|
                                                                |ints2Floats?|
                                                                (|Boolean|))
                                                               (|:| |expr|
                                                                    (|OutputForm|))))))
                                                   (|:| |arrayAssignmentBranch|
                                                        (|Record|
                                                         (|:| |var| (|Symbol|))
                                                         (|:| |rand|
                                                              (|OutputForm|))
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))))
                                                   (|:| |conditionalBranch|
                                                        (|Record|
                                                         (|:| |switch|
                                                              (|Switch|))
                                                         (|:| |thenClause| $)
                                                         (|:| |elseClause| $)))
                                                   (|:| |returnBranch|
                                                        (|Record|
                                                         (|:| |empty?|
                                                              (|Boolean|))
                                                         (|:| |value|
                                                              (|Record|
                                                               (|:|
                                                                |ints2Floats?|
                                                                (|Boolean|))
                                                               (|:| |expr|
                                                                    (|OutputForm|))))))
                                                   (|:| |blockBranch|
                                                        (|List| $))
                                                   (|:| |commentBranch|
                                                        (|List| (|String|)))
                                                   (|:| |callBranch|
                                                        (|String|))
                                                   (|:| |forBranch|
                                                        (|Record|
                                                         (|:| |range|
                                                              (|SegmentBinding|
                                                               (|Polynomial|
                                                                (|Integer|))))
                                                         (|:| |span|
                                                              (|Polynomial|
                                                               (|Integer|)))
                                                         (|:| |body| $)))
                                                   (|:| |labelBranch|
                                                        (|SingleInteger|))
                                                   (|:| |loopBranch|
                                                        (|Record|
                                                         (|:| |switch|
                                                              (|Switch|))
                                                         (|:| |body| $)))
                                                   (|:| |commonBranch|
                                                        (|Record|
                                                         (|:| |name|
                                                              (|Symbol|))
                                                         (|:| |contents|
                                                              (|List|
                                                               (|Symbol|)))))
                                                   (|:| |printBranch|
                                                        (|List|
                                                         (|OutputForm|))))
                                                  #1#))
                                1)
                               $)
                              (QREFELT $ 19)))
              (LETT |elseBranch|
                    (QVELT
                     (PROG2 (LETT #1# |rec|)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 3)
                                       (|Record| (|:| |switch| (|Switch|))
                                                 (|:| |thenClause| $)
                                                 (|:| |elseClause| $))
                                       (|Union| (|:| |nullBranch| #2#)
                                                (|:| |assignmentBranch|
                                                     (|Record|
                                                      (|:| |var| (|Symbol|))
                                                      (|:| |arrayIndex|
                                                           (|List|
                                                            (|Polynomial|
                                                             (|Integer|))))
                                                      (|:| |rand|
                                                           (|Record|
                                                            (|:| |ints2Floats?|
                                                                 (|Boolean|))
                                                            (|:| |expr|
                                                                 (|OutputForm|))))))
                                                (|:| |arrayAssignmentBranch|
                                                     (|Record|
                                                      (|:| |var| (|Symbol|))
                                                      (|:| |rand|
                                                           (|OutputForm|))
                                                      (|:| |ints2Floats?|
                                                           (|Boolean|))))
                                                (|:| |conditionalBranch|
                                                     (|Record|
                                                      (|:| |switch| (|Switch|))
                                                      (|:| |thenClause| $)
                                                      (|:| |elseClause| $)))
                                                (|:| |returnBranch|
                                                     (|Record|
                                                      (|:| |empty?|
                                                           (|Boolean|))
                                                      (|:| |value|
                                                           (|Record|
                                                            (|:| |ints2Floats?|
                                                                 (|Boolean|))
                                                            (|:| |expr|
                                                                 (|OutputForm|))))))
                                                (|:| |blockBranch| (|List| $))
                                                (|:| |commentBranch|
                                                     (|List| (|String|)))
                                                (|:| |callBranch| (|String|))
                                                (|:| |forBranch|
                                                     (|Record|
                                                      (|:| |range|
                                                           (|SegmentBinding|
                                                            (|Polynomial|
                                                             (|Integer|))))
                                                      (|:| |span|
                                                           (|Polynomial|
                                                            (|Integer|)))
                                                      (|:| |body| $)))
                                                (|:| |labelBranch|
                                                     (|SingleInteger|))
                                                (|:| |loopBranch|
                                                     (|Record|
                                                      (|:| |switch| (|Switch|))
                                                      (|:| |body| $)))
                                                (|:| |commonBranch|
                                                     (|Record|
                                                      (|:| |name| (|Symbol|))
                                                      (|:| |contents|
                                                           (|List|
                                                            (|Symbol|)))))
                                                (|:| |printBranch|
                                                     (|List| (|OutputForm|))))
                                       #1#))
                     2))
              (COND
               ((NULL (QEQCAR (SPADCALL |elseBranch| (QREFELT $ 45)) 0))
                (EXIT
                 (COND
                  ((QEQCAR (SPADCALL |elseBranch| (QREFELT $ 45)) 2)
                   (SPADCALL |expr| (|FC;getElseIf| |elseBranch| $)
                             (QREFELT $ 19)))
                  ('T
                   (SEQ
                    (LETT |expr|
                          (SPADCALL |expr|
                                    (SPADCALL (SPADCALL 'ELSE (QREFELT $ 8))
                                              NIL (QREFELT $ 14))
                                    (QREFELT $ 19)))
                    (EXIT
                     (LETT |expr|
                           (SPADCALL |expr| (|FC;getBody| |elseBranch| $)
                                     (QREFELT $ 19))))))))))
              (EXIT |expr|)))) 

(SDEFUN |FC;getContinue| ((|label| |SingleInteger|) ($ |List| (|String|)))
        (SPROG
         ((|sp| (|OutputForm|)) (|cnt| (#1="CONTINUE")) (|lab| (|String|)))
         (SEQ (LETT |lab| (STRINGIMAGE |label|))
              (COND ((> (QCSIZE |lab|) 6) (|error| "Label too big")))
              (LETT |cnt| #1#)
              (LETT |sp|
                    (SPADCALL (- (SPADCALL (QREFELT $ 58)) (QCSIZE |lab|))
                              (QREFELT $ 59)))
              (EXIT (STRCONC |lab| |sp| |cnt|))))) 

(SDEFUN |FC;getGoto| ((|label| |SingleInteger|) ($ |List| (|String|)))
        (SPADCALL (LIST (STRCONC "GOTO " (STRINGIMAGE |label|)))
                  (QREFELT $ 22))) 

(SDEFUN |FC;getRepeat|
        ((|repRec| |Record| (|:| |switch| (|Switch|)) (|:| |body| $))
         ($ |List| (|String|)))
        (SPROG ((|bod| ($)) (|lab| (|SingleInteger|)) (|sw| (|Switch|)))
               (SEQ (LETT |sw| (SPADCALL (QCAR |repRec|) (QREFELT $ 60)))
                    (LETT |lab| (|FC;newLabel| $)) (LETT |bod| (QCDR |repRec|))
                    (EXIT
                     (SPADCALL (|FC;getContinue| |lab| $)
                               (SPADCALL (|FC;getBody| |bod| $)
                                         (|FC;fortFormatIfGoto|
                                          (SPADCALL |sw| (QREFELT $ 57)) |lab|
                                          $)
                                         (QREFELT $ 19))
                               (QREFELT $ 19)))))) 

(SDEFUN |FC;getWhile|
        ((|whileRec| |Record| (|:| |switch| (|Switch|)) (|:| |body| $))
         ($ |List| (|String|)))
        (SPROG
         ((|rl1| (|List| (|List| (|String|)))) (|ig| (|List| (|String|)))
          (|bod| ($)) (|lab2| #1=(|SingleInteger|)) (|lab1| #1#)
          (|sw| (|Switch|)))
         (SEQ (LETT |sw| (SPADCALL (QCAR |whileRec|) (QREFELT $ 60)))
              (LETT |lab1| (|FC;newLabel| $)) (LETT |lab2| (|FC;newLabel| $))
              (LETT |bod| (QCDR |whileRec|))
              (LETT |ig|
                    (|FC;fortFormatLabelledIfGoto|
                     (SPADCALL |sw| (QREFELT $ 57)) |lab1| |lab2| $))
              (LETT |rl1|
                    (LIST |ig| (|FC;getBody| |bod| $)
                          (|FC;getBody| (SPADCALL |lab1| (QREFELT $ 61)) $)
                          (|FC;getContinue| |lab2| $)))
              (EXIT (SPADCALL |rl1| (QREFELT $ 62)))))) 

(SDEFUN |FC;getArrayAssign|
        ((|rec| |Record| (|:| |var| (|Symbol|)) (|:| |rand| (|OutputForm|))
          (|:| |ints2Floats?| (|Boolean|)))
         ($ |List| (|String|)))
        (|FC;getfortarrayexp| (QVELT |rec| 0) (QVELT |rec| 1) (QVELT |rec| 2)
         $)) 

(SDEFUN |FC;getAssign|
        ((|rec| |Record| (|:| |var| (|Symbol|))
          (|:| |arrayIndex| (|List| (|Polynomial| (|Integer|))))
          (|:| |rand|
               (|Record| (|:| |ints2Floats?| (|Boolean|))
                         (|:| |expr| (|OutputForm|)))))
         ($ |List| (|String|)))
        (SPROG
         ((|ex| #1=(|OutputForm|))
          (|ass| (|Record| (|:| |ints2Floats?| (|Boolean|)) (|:| |expr| #1#)))
          (|lhs| (|OutputForm|))
          (|indices| (|List| (|Polynomial| (|Integer|)))))
         (SEQ (LETT |indices| (QVELT |rec| 1))
              (LETT |lhs| (SPADCALL (QVELT |rec| 0) (QREFELT $ 8)))
              (COND
               ((NULL (NULL |indices|))
                (LETT |lhs|
                      (SPADCALL |lhs|
                                (SPADCALL (ELT $ 63) |indices| (QREFELT $ 68))
                                (QREFELT $ 10)))))
              (LETT |ass| (QVELT |rec| 2)) (LETT |ex| (QCDR |ass|))
              (EXIT (|FC;get_assignment| |lhs| |ex| (QCAR |ass|) $))))) 

(SDEFUN |FC;getCond|
        ((|rec| |Record| (|:| |switch| (|Switch|)) (|:| |thenClause| $)
          (|:| |elseClause| $))
         ($ |List| (|String|)))
        (SPROG ((|expr| (|List| (|String|))) (|elseBranch| ($)))
               (SEQ
                (LETT |expr|
                      (SPADCALL
                       (|FC;fortFormatIf|
                        (SPADCALL (QVELT |rec| 0) (QREFELT $ 57)) $)
                       (|FC;getBody| (QVELT |rec| 1) $) (QREFELT $ 19)))
                (LETT |elseBranch| (QVELT |rec| 2))
                (COND
                 ((NULL (QEQCAR (SPADCALL |elseBranch| (QREFELT $ 45)) 0))
                  (COND
                   ((QEQCAR (SPADCALL |elseBranch| (QREFELT $ 45)) 2)
                    (LETT |expr|
                          (SPADCALL |expr| (|FC;getElseIf| |elseBranch| $)
                                    (QREFELT $ 19))))
                   ('T
                    (LETT |expr|
                          (SPADCALL |expr|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL 'ELSE (QREFELT $ 8))
                                               NIL (QREFELT $ 14))
                                     (|FC;getBody| |elseBranch| $)
                                     (QREFELT $ 19))
                                    (QREFELT $ 19)))))))
                (EXIT
                 (SPADCALL |expr|
                           (SPADCALL (SPADCALL 'ENDIF (QREFELT $ 8)) NIL
                                     (QREFELT $ 14))
                           (QREFELT $ 19)))))) 

(SDEFUN |FC;getComment| ((|rec| |List| (|String|)) ($ |List| (|String|)))
        (SPROG ((#1=#:G559 NIL) (|c| NIL) (#2=#:G558 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |c| NIL) (LETT #1# |rec|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (STRCONC "C     " |c|) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FC;getCall| ((|rec| |String|) ($ |List| (|String|)))
        (SPROG ((|expr| (|String|)))
               (SEQ (LETT |expr| (STRCONC "CALL " |rec|))
                    (EXIT
                     (COND
                      ((> (QCSIZE |expr|) 1320)
                       (|error| "Fortran CALL too large"))
                      ('T (SPADCALL (LIST |expr|) (QREFELT $ 22)))))))) 

(SDEFUN |FC;getFor|
        ((|rec| |Record|
          (|:| |range| #1=(|SegmentBinding| (|Polynomial| (|Integer|))))
          (|:| |span| #2=(|Polynomial| (|Integer|))) (|:| |body| $))
         ($ |List| (|String|)))
        (SPROG
         ((|expr| (|List| (|String|))) (|lab| (|SingleInteger|))
          (|increment| #2#) (|rnge| #1#))
         (SEQ (LETT |rnge| (QVELT |rec| 0)) (LETT |increment| (QVELT |rec| 1))
              (LETT |lab| (|FC;newLabel| $))
              (SPADCALL (SPADCALL |rnge| (QREFELT $ 70))
                        (SPADCALL (QREFELT $ 72)) (QREFELT $ 74))
              (LETT |expr|
                    (|FC;fortFormatDo| (SPADCALL |rnge| (QREFELT $ 70))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rnge| (QREFELT $ 76))
                                (QREFELT $ 77))
                      (QREFELT $ 63))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rnge| (QREFELT $ 76))
                                (QREFELT $ 78))
                      (QREFELT $ 63))
                     (SPADCALL |increment| (QREFELT $ 63)) |lab| $))
              (EXIT
               (SPADCALL |expr|
                         (SPADCALL (|FC;getBody| (QVELT |rec| 2) $)
                                   (|FC;getContinue| |lab| $) (QREFELT $ 19))
                         (QREFELT $ 19)))))) 

(SDEFUN |FC;getCode;$L;36| ((|f| $) ($ |List| (|String|)))
        (SPROG
         ((#1=#:G597 NIL) (#2=#:G598 NIL) (#3=#:G596 NIL) (#4=#:G595 NIL)
          (#5=#:G594 NIL) (#6=#:G593 NIL) (#7=#:G592 NIL) (#8=#:G591 NIL)
          (#9=#:G590 NIL) (#10=#:G589 NIL) (#11=#:G588 NIL) (#12=#:G587 NIL)
          (|rec|
           (|Union| (|:| |nullBranch| #13="null")
                    (|:| |assignmentBranch|
                         (|Record| (|:| |var| (|Symbol|))
                                   (|:| |arrayIndex|
                                        (|List| (|Polynomial| (|Integer|))))
                                   (|:| |rand|
                                        (|Record|
                                         (|:| |ints2Floats?| (|Boolean|))
                                         (|:| |expr| (|OutputForm|))))))
                    (|:| |arrayAssignmentBranch|
                         (|Record| (|:| |var| (|Symbol|))
                                   (|:| |rand| (|OutputForm|))
                                   (|:| |ints2Floats?| (|Boolean|))))
                    (|:| |conditionalBranch|
                         (|Record| (|:| |switch| (|Switch|))
                                   (|:| |thenClause| $) (|:| |elseClause| $)))
                    (|:| |returnBranch|
                         (|Record| (|:| |empty?| (|Boolean|))
                                   (|:| |value|
                                        (|Record|
                                         (|:| |ints2Floats?| (|Boolean|))
                                         (|:| |expr| (|OutputForm|))))))
                    (|:| |blockBranch| (|List| $))
                    (|:| |commentBranch| (|List| (|String|)))
                    (|:| |callBranch| (|String|))
                    (|:| |forBranch|
                         (|Record|
                          (|:| |range|
                               (|SegmentBinding| (|Polynomial| (|Integer|))))
                          (|:| |span| (|Polynomial| (|Integer|)))
                          (|:| |body| $)))
                    (|:| |labelBranch| (|SingleInteger|))
                    (|:| |loopBranch|
                         (|Record| (|:| |switch| (|Switch|)) (|:| |body| $)))
                    (|:| |commonBranch|
                         (|Record| (|:| |name| (|Symbol|))
                                   (|:| |contents| (|List| (|Symbol|)))))
                    (|:| |printBranch| (|List| (|OutputForm|)))))
          (|opp|
           (|Union| (|:| |Null| "null") (|:| |Assignment| "assignment")
                    (|:| |Conditional| "conditional") (|:| |Return| "return")
                    (|:| |Block| "block") (|:| |Comment| "comment")
                    (|:| |Call| "call") (|:| |For| "for") (|:| |While| "while")
                    (|:| |Repeat| "repeat") (|:| |Goto| "goto")
                    (|:| |Continue| "continue")
                    (|:| |ArrayAssignment| "arrayAssignment")
                    (|:| |Save| "save") (|:| |Stop| "stop")
                    (|:| |Common| "common") (|:| |Print| "print"))))
         (SEQ (LETT |opp| (SPADCALL |f| (QREFELT $ 45)))
              (LETT |rec| (SPADCALL |f| (QREFELT $ 55)))
              (EXIT
               (COND
                ((QEQCAR |opp| 1)
                 (|FC;getAssign|
                  (PROG2 (LETT #12# |rec|)
                      (QCDR #12#)
                    (|check_union2| (QEQCAR #12# 1)
                                    (|Record| (|:| |var| (|Symbol|))
                                              (|:| |arrayIndex|
                                                   (|List|
                                                    (|Polynomial|
                                                     (|Integer|))))
                                              (|:| |rand|
                                                   (|Record|
                                                    (|:| |ints2Floats?|
                                                         (|Boolean|))
                                                    (|:| |expr|
                                                         (|OutputForm|)))))
                                    (|Union| (|:| |nullBranch| #13#)
                                             (|:| |assignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |arrayIndex|
                                                        (|List|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |rand|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |arrayAssignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |rand| (|OutputForm|))
                                                   (|:| |ints2Floats?|
                                                        (|Boolean|))))
                                             (|:| |conditionalBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $)))
                                             (|:| |returnBranch|
                                                  (|Record|
                                                   (|:| |empty?| (|Boolean|))
                                                   (|:| |value|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |blockBranch| (|List| $))
                                             (|:| |commentBranch|
                                                  (|List| (|String|)))
                                             (|:| |callBranch| (|String|))
                                             (|:| |forBranch|
                                                  (|Record|
                                                   (|:| |range|
                                                        (|SegmentBinding|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |span|
                                                        (|Polynomial|
                                                         (|Integer|)))
                                                   (|:| |body| $)))
                                             (|:| |labelBranch|
                                                  (|SingleInteger|))
                                             (|:| |loopBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |body| $)))
                                             (|:| |commonBranch|
                                                  (|Record|
                                                   (|:| |name| (|Symbol|))
                                                   (|:| |contents|
                                                        (|List| (|Symbol|)))))
                                             (|:| |printBranch|
                                                  (|List| (|OutputForm|))))
                                    #12#))
                  $))
                ((QEQCAR |opp| 12)
                 (|FC;getArrayAssign|
                  (PROG2 (LETT #11# |rec|)
                      (QCDR #11#)
                    (|check_union2| (QEQCAR #11# 2)
                                    (|Record| (|:| |var| (|Symbol|))
                                              (|:| |rand| (|OutputForm|))
                                              (|:| |ints2Floats?| (|Boolean|)))
                                    (|Union| (|:| |nullBranch| #13#)
                                             (|:| |assignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |arrayIndex|
                                                        (|List|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |rand|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |arrayAssignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |rand| (|OutputForm|))
                                                   (|:| |ints2Floats?|
                                                        (|Boolean|))))
                                             (|:| |conditionalBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $)))
                                             (|:| |returnBranch|
                                                  (|Record|
                                                   (|:| |empty?| (|Boolean|))
                                                   (|:| |value|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |blockBranch| (|List| $))
                                             (|:| |commentBranch|
                                                  (|List| (|String|)))
                                             (|:| |callBranch| (|String|))
                                             (|:| |forBranch|
                                                  (|Record|
                                                   (|:| |range|
                                                        (|SegmentBinding|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |span|
                                                        (|Polynomial|
                                                         (|Integer|)))
                                                   (|:| |body| $)))
                                             (|:| |labelBranch|
                                                  (|SingleInteger|))
                                             (|:| |loopBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |body| $)))
                                             (|:| |commonBranch|
                                                  (|Record|
                                                   (|:| |name| (|Symbol|))
                                                   (|:| |contents|
                                                        (|List| (|Symbol|)))))
                                             (|:| |printBranch|
                                                  (|List| (|OutputForm|))))
                                    #11#))
                  $))
                ((QEQCAR |opp| 2)
                 (|FC;getCond|
                  (PROG2 (LETT #10# |rec|)
                      (QCDR #10#)
                    (|check_union2| (QEQCAR #10# 3)
                                    (|Record| (|:| |switch| (|Switch|))
                                              (|:| |thenClause| $)
                                              (|:| |elseClause| $))
                                    (|Union| (|:| |nullBranch| #13#)
                                             (|:| |assignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |arrayIndex|
                                                        (|List|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |rand|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |arrayAssignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |rand| (|OutputForm|))
                                                   (|:| |ints2Floats?|
                                                        (|Boolean|))))
                                             (|:| |conditionalBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $)))
                                             (|:| |returnBranch|
                                                  (|Record|
                                                   (|:| |empty?| (|Boolean|))
                                                   (|:| |value|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |blockBranch| (|List| $))
                                             (|:| |commentBranch|
                                                  (|List| (|String|)))
                                             (|:| |callBranch| (|String|))
                                             (|:| |forBranch|
                                                  (|Record|
                                                   (|:| |range|
                                                        (|SegmentBinding|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |span|
                                                        (|Polynomial|
                                                         (|Integer|)))
                                                   (|:| |body| $)))
                                             (|:| |labelBranch|
                                                  (|SingleInteger|))
                                             (|:| |loopBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |body| $)))
                                             (|:| |commonBranch|
                                                  (|Record|
                                                   (|:| |name| (|Symbol|))
                                                   (|:| |contents|
                                                        (|List| (|Symbol|)))))
                                             (|:| |printBranch|
                                                  (|List| (|OutputForm|))))
                                    #10#))
                  $))
                ((QEQCAR |opp| 3)
                 (|FC;getReturn|
                  (PROG2 (LETT #9# |rec|)
                      (QCDR #9#)
                    (|check_union2| (QEQCAR #9# 4)
                                    (|Record| (|:| |empty?| (|Boolean|))
                                              (|:| |value|
                                                   (|Record|
                                                    (|:| |ints2Floats?|
                                                         (|Boolean|))
                                                    (|:| |expr|
                                                         (|OutputForm|)))))
                                    (|Union| (|:| |nullBranch| #13#)
                                             (|:| |assignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |arrayIndex|
                                                        (|List|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |rand|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |arrayAssignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |rand| (|OutputForm|))
                                                   (|:| |ints2Floats?|
                                                        (|Boolean|))))
                                             (|:| |conditionalBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $)))
                                             (|:| |returnBranch|
                                                  (|Record|
                                                   (|:| |empty?| (|Boolean|))
                                                   (|:| |value|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |blockBranch| (|List| $))
                                             (|:| |commentBranch|
                                                  (|List| (|String|)))
                                             (|:| |callBranch| (|String|))
                                             (|:| |forBranch|
                                                  (|Record|
                                                   (|:| |range|
                                                        (|SegmentBinding|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |span|
                                                        (|Polynomial|
                                                         (|Integer|)))
                                                   (|:| |body| $)))
                                             (|:| |labelBranch|
                                                  (|SingleInteger|))
                                             (|:| |loopBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |body| $)))
                                             (|:| |commonBranch|
                                                  (|Record|
                                                   (|:| |name| (|Symbol|))
                                                   (|:| |contents|
                                                        (|List| (|Symbol|)))))
                                             (|:| |printBranch|
                                                  (|List| (|OutputForm|))))
                                    #9#))
                  $))
                ((QEQCAR |opp| 4)
                 (|FC;getBlock|
                  (PROG2 (LETT #8# |rec|)
                      (QCDR #8#)
                    (|check_union2| (QEQCAR #8# 5) (|List| $)
                                    (|Union| (|:| |nullBranch| #13#)
                                             (|:| |assignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |arrayIndex|
                                                        (|List|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |rand|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |arrayAssignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |rand| (|OutputForm|))
                                                   (|:| |ints2Floats?|
                                                        (|Boolean|))))
                                             (|:| |conditionalBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $)))
                                             (|:| |returnBranch|
                                                  (|Record|
                                                   (|:| |empty?| (|Boolean|))
                                                   (|:| |value|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |blockBranch| (|List| $))
                                             (|:| |commentBranch|
                                                  (|List| (|String|)))
                                             (|:| |callBranch| (|String|))
                                             (|:| |forBranch|
                                                  (|Record|
                                                   (|:| |range|
                                                        (|SegmentBinding|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |span|
                                                        (|Polynomial|
                                                         (|Integer|)))
                                                   (|:| |body| $)))
                                             (|:| |labelBranch|
                                                  (|SingleInteger|))
                                             (|:| |loopBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |body| $)))
                                             (|:| |commonBranch|
                                                  (|Record|
                                                   (|:| |name| (|Symbol|))
                                                   (|:| |contents|
                                                        (|List| (|Symbol|)))))
                                             (|:| |printBranch|
                                                  (|List| (|OutputForm|))))
                                    #8#))
                  $))
                ((QEQCAR |opp| 5)
                 (|FC;getComment|
                  (PROG2 (LETT #7# |rec|)
                      (QCDR #7#)
                    (|check_union2| (QEQCAR #7# 6) (|List| (|String|))
                                    (|Union| (|:| |nullBranch| #13#)
                                             (|:| |assignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |arrayIndex|
                                                        (|List|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |rand|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |arrayAssignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |rand| (|OutputForm|))
                                                   (|:| |ints2Floats?|
                                                        (|Boolean|))))
                                             (|:| |conditionalBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $)))
                                             (|:| |returnBranch|
                                                  (|Record|
                                                   (|:| |empty?| (|Boolean|))
                                                   (|:| |value|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |blockBranch| (|List| $))
                                             (|:| |commentBranch|
                                                  (|List| (|String|)))
                                             (|:| |callBranch| (|String|))
                                             (|:| |forBranch|
                                                  (|Record|
                                                   (|:| |range|
                                                        (|SegmentBinding|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |span|
                                                        (|Polynomial|
                                                         (|Integer|)))
                                                   (|:| |body| $)))
                                             (|:| |labelBranch|
                                                  (|SingleInteger|))
                                             (|:| |loopBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |body| $)))
                                             (|:| |commonBranch|
                                                  (|Record|
                                                   (|:| |name| (|Symbol|))
                                                   (|:| |contents|
                                                        (|List| (|Symbol|)))))
                                             (|:| |printBranch|
                                                  (|List| (|OutputForm|))))
                                    #7#))
                  $))
                ((QEQCAR |opp| 6)
                 (|FC;getCall|
                  (PROG2 (LETT #6# |rec|)
                      (QCDR #6#)
                    (|check_union2| (QEQCAR #6# 7) (|String|)
                                    (|Union| (|:| |nullBranch| #13#)
                                             (|:| |assignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |arrayIndex|
                                                        (|List|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |rand|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |arrayAssignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |rand| (|OutputForm|))
                                                   (|:| |ints2Floats?|
                                                        (|Boolean|))))
                                             (|:| |conditionalBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $)))
                                             (|:| |returnBranch|
                                                  (|Record|
                                                   (|:| |empty?| (|Boolean|))
                                                   (|:| |value|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |blockBranch| (|List| $))
                                             (|:| |commentBranch|
                                                  (|List| (|String|)))
                                             (|:| |callBranch| (|String|))
                                             (|:| |forBranch|
                                                  (|Record|
                                                   (|:| |range|
                                                        (|SegmentBinding|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |span|
                                                        (|Polynomial|
                                                         (|Integer|)))
                                                   (|:| |body| $)))
                                             (|:| |labelBranch|
                                                  (|SingleInteger|))
                                             (|:| |loopBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |body| $)))
                                             (|:| |commonBranch|
                                                  (|Record|
                                                   (|:| |name| (|Symbol|))
                                                   (|:| |contents|
                                                        (|List| (|Symbol|)))))
                                             (|:| |printBranch|
                                                  (|List| (|OutputForm|))))
                                    #6#))
                  $))
                ((QEQCAR |opp| 7)
                 (|FC;getFor|
                  (PROG2 (LETT #5# |rec|)
                      (QCDR #5#)
                    (|check_union2| (QEQCAR #5# 8)
                                    (|Record|
                                     (|:| |range|
                                          (|SegmentBinding|
                                           (|Polynomial| (|Integer|))))
                                     (|:| |span| (|Polynomial| (|Integer|)))
                                     (|:| |body| $))
                                    (|Union| (|:| |nullBranch| #13#)
                                             (|:| |assignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |arrayIndex|
                                                        (|List|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |rand|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |arrayAssignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |rand| (|OutputForm|))
                                                   (|:| |ints2Floats?|
                                                        (|Boolean|))))
                                             (|:| |conditionalBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $)))
                                             (|:| |returnBranch|
                                                  (|Record|
                                                   (|:| |empty?| (|Boolean|))
                                                   (|:| |value|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |blockBranch| (|List| $))
                                             (|:| |commentBranch|
                                                  (|List| (|String|)))
                                             (|:| |callBranch| (|String|))
                                             (|:| |forBranch|
                                                  (|Record|
                                                   (|:| |range|
                                                        (|SegmentBinding|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |span|
                                                        (|Polynomial|
                                                         (|Integer|)))
                                                   (|:| |body| $)))
                                             (|:| |labelBranch|
                                                  (|SingleInteger|))
                                             (|:| |loopBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |body| $)))
                                             (|:| |commonBranch|
                                                  (|Record|
                                                   (|:| |name| (|Symbol|))
                                                   (|:| |contents|
                                                        (|List| (|Symbol|)))))
                                             (|:| |printBranch|
                                                  (|List| (|OutputForm|))))
                                    #5#))
                  $))
                ((QEQCAR |opp| 11)
                 (|FC;getContinue|
                  (PROG2 (LETT #4# |rec|)
                      (QCDR #4#)
                    (|check_union2| (QEQCAR #4# 9) (|SingleInteger|)
                                    (|Union| (|:| |nullBranch| #13#)
                                             (|:| |assignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |arrayIndex|
                                                        (|List|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |rand|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |arrayAssignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |rand| (|OutputForm|))
                                                   (|:| |ints2Floats?|
                                                        (|Boolean|))))
                                             (|:| |conditionalBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $)))
                                             (|:| |returnBranch|
                                                  (|Record|
                                                   (|:| |empty?| (|Boolean|))
                                                   (|:| |value|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |blockBranch| (|List| $))
                                             (|:| |commentBranch|
                                                  (|List| (|String|)))
                                             (|:| |callBranch| (|String|))
                                             (|:| |forBranch|
                                                  (|Record|
                                                   (|:| |range|
                                                        (|SegmentBinding|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |span|
                                                        (|Polynomial|
                                                         (|Integer|)))
                                                   (|:| |body| $)))
                                             (|:| |labelBranch|
                                                  (|SingleInteger|))
                                             (|:| |loopBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |body| $)))
                                             (|:| |commonBranch|
                                                  (|Record|
                                                   (|:| |name| (|Symbol|))
                                                   (|:| |contents|
                                                        (|List| (|Symbol|)))))
                                             (|:| |printBranch|
                                                  (|List| (|OutputForm|))))
                                    #4#))
                  $))
                ((QEQCAR |opp| 10)
                 (|FC;getGoto|
                  (PROG2 (LETT #4# |rec|)
                      (QCDR #4#)
                    (|check_union2| (QEQCAR #4# 9) (|SingleInteger|)
                                    (|Union| (|:| |nullBranch| #13#)
                                             (|:| |assignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |arrayIndex|
                                                        (|List|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |rand|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |arrayAssignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |rand| (|OutputForm|))
                                                   (|:| |ints2Floats?|
                                                        (|Boolean|))))
                                             (|:| |conditionalBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $)))
                                             (|:| |returnBranch|
                                                  (|Record|
                                                   (|:| |empty?| (|Boolean|))
                                                   (|:| |value|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |blockBranch| (|List| $))
                                             (|:| |commentBranch|
                                                  (|List| (|String|)))
                                             (|:| |callBranch| (|String|))
                                             (|:| |forBranch|
                                                  (|Record|
                                                   (|:| |range|
                                                        (|SegmentBinding|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |span|
                                                        (|Polynomial|
                                                         (|Integer|)))
                                                   (|:| |body| $)))
                                             (|:| |labelBranch|
                                                  (|SingleInteger|))
                                             (|:| |loopBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |body| $)))
                                             (|:| |commonBranch|
                                                  (|Record|
                                                   (|:| |name| (|Symbol|))
                                                   (|:| |contents|
                                                        (|List| (|Symbol|)))))
                                             (|:| |printBranch|
                                                  (|List| (|OutputForm|))))
                                    #4#))
                  $))
                ((QEQCAR |opp| 9)
                 (|FC;getRepeat|
                  (PROG2 (LETT #3# |rec|)
                      (QCDR #3#)
                    (|check_union2| (QEQCAR #3# 10)
                                    (|Record| (|:| |switch| (|Switch|))
                                              (|:| |body| $))
                                    (|Union| (|:| |nullBranch| #13#)
                                             (|:| |assignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |arrayIndex|
                                                        (|List|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |rand|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |arrayAssignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |rand| (|OutputForm|))
                                                   (|:| |ints2Floats?|
                                                        (|Boolean|))))
                                             (|:| |conditionalBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $)))
                                             (|:| |returnBranch|
                                                  (|Record|
                                                   (|:| |empty?| (|Boolean|))
                                                   (|:| |value|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |blockBranch| (|List| $))
                                             (|:| |commentBranch|
                                                  (|List| (|String|)))
                                             (|:| |callBranch| (|String|))
                                             (|:| |forBranch|
                                                  (|Record|
                                                   (|:| |range|
                                                        (|SegmentBinding|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |span|
                                                        (|Polynomial|
                                                         (|Integer|)))
                                                   (|:| |body| $)))
                                             (|:| |labelBranch|
                                                  (|SingleInteger|))
                                             (|:| |loopBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |body| $)))
                                             (|:| |commonBranch|
                                                  (|Record|
                                                   (|:| |name| (|Symbol|))
                                                   (|:| |contents|
                                                        (|List| (|Symbol|)))))
                                             (|:| |printBranch|
                                                  (|List| (|OutputForm|))))
                                    #3#))
                  $))
                ((QEQCAR |opp| 8)
                 (|FC;getWhile|
                  (PROG2 (LETT #3# |rec|)
                      (QCDR #3#)
                    (|check_union2| (QEQCAR #3# 10)
                                    (|Record| (|:| |switch| (|Switch|))
                                              (|:| |body| $))
                                    (|Union| (|:| |nullBranch| #13#)
                                             (|:| |assignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |arrayIndex|
                                                        (|List|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |rand|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |arrayAssignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |rand| (|OutputForm|))
                                                   (|:| |ints2Floats?|
                                                        (|Boolean|))))
                                             (|:| |conditionalBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $)))
                                             (|:| |returnBranch|
                                                  (|Record|
                                                   (|:| |empty?| (|Boolean|))
                                                   (|:| |value|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |blockBranch| (|List| $))
                                             (|:| |commentBranch|
                                                  (|List| (|String|)))
                                             (|:| |callBranch| (|String|))
                                             (|:| |forBranch|
                                                  (|Record|
                                                   (|:| |range|
                                                        (|SegmentBinding|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |span|
                                                        (|Polynomial|
                                                         (|Integer|)))
                                                   (|:| |body| $)))
                                             (|:| |labelBranch|
                                                  (|SingleInteger|))
                                             (|:| |loopBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |body| $)))
                                             (|:| |commonBranch|
                                                  (|Record|
                                                   (|:| |name| (|Symbol|))
                                                   (|:| |contents|
                                                        (|List| (|Symbol|)))))
                                             (|:| |printBranch|
                                                  (|List| (|OutputForm|))))
                                    #3#))
                  $))
                ((QEQCAR |opp| 13) (|FC;getSave| $))
                ((QEQCAR |opp| 14) (|FC;getStop| $))
                ((QEQCAR |opp| 16)
                 (|FC;getPrint|
                  (PROG2 (LETT #2# |rec|)
                      (QCDR #2#)
                    (|check_union2| (QEQCAR #2# 12) (|List| (|OutputForm|))
                                    (|Union| (|:| |nullBranch| #13#)
                                             (|:| |assignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |arrayIndex|
                                                        (|List|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |rand|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |arrayAssignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |rand| (|OutputForm|))
                                                   (|:| |ints2Floats?|
                                                        (|Boolean|))))
                                             (|:| |conditionalBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $)))
                                             (|:| |returnBranch|
                                                  (|Record|
                                                   (|:| |empty?| (|Boolean|))
                                                   (|:| |value|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |blockBranch| (|List| $))
                                             (|:| |commentBranch|
                                                  (|List| (|String|)))
                                             (|:| |callBranch| (|String|))
                                             (|:| |forBranch|
                                                  (|Record|
                                                   (|:| |range|
                                                        (|SegmentBinding|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |span|
                                                        (|Polynomial|
                                                         (|Integer|)))
                                                   (|:| |body| $)))
                                             (|:| |labelBranch|
                                                  (|SingleInteger|))
                                             (|:| |loopBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |body| $)))
                                             (|:| |commonBranch|
                                                  (|Record|
                                                   (|:| |name| (|Symbol|))
                                                   (|:| |contents|
                                                        (|List| (|Symbol|)))))
                                             (|:| |printBranch|
                                                  (|List| (|OutputForm|))))
                                    #2#))
                  $))
                ((QEQCAR |opp| 15)
                 (|FC;getCommon|
                  (PROG2 (LETT #1# |rec|)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 11)
                                    (|Record| (|:| |name| (|Symbol|))
                                              (|:| |contents|
                                                   (|List| (|Symbol|))))
                                    (|Union| (|:| |nullBranch| #13#)
                                             (|:| |assignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |arrayIndex|
                                                        (|List|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |rand|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |arrayAssignmentBranch|
                                                  (|Record|
                                                   (|:| |var| (|Symbol|))
                                                   (|:| |rand| (|OutputForm|))
                                                   (|:| |ints2Floats?|
                                                        (|Boolean|))))
                                             (|:| |conditionalBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $)))
                                             (|:| |returnBranch|
                                                  (|Record|
                                                   (|:| |empty?| (|Boolean|))
                                                   (|:| |value|
                                                        (|Record|
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))
                                                         (|:| |expr|
                                                              (|OutputForm|))))))
                                             (|:| |blockBranch| (|List| $))
                                             (|:| |commentBranch|
                                                  (|List| (|String|)))
                                             (|:| |callBranch| (|String|))
                                             (|:| |forBranch|
                                                  (|Record|
                                                   (|:| |range|
                                                        (|SegmentBinding|
                                                         (|Polynomial|
                                                          (|Integer|))))
                                                   (|:| |span|
                                                        (|Polynomial|
                                                         (|Integer|)))
                                                   (|:| |body| $)))
                                             (|:| |labelBranch|
                                                  (|SingleInteger|))
                                             (|:| |loopBranch|
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |body| $)))
                                             (|:| |commonBranch|
                                                  (|Record|
                                                   (|:| |name| (|Symbol|))
                                                   (|:| |contents|
                                                        (|List| (|Symbol|)))))
                                             (|:| |printBranch|
                                                  (|List| (|OutputForm|))))
                                    #1#))
                  $))
                ('T (|error| "Unsupported program construct."))))))) 

(SDEFUN |FC;printCode;$V;37| ((|f| $) ($ |Void|))
        (SEQ (SPADCALL (SPADCALL |f| (QREFELT $ 43)) (QREFELT $ 79))
             (EXIT (SPADCALL (QREFELT $ 80))))) 

(PUT '|FC;code;$U;38| '|SPADreplace| 'QCDR) 

(SDEFUN |FC;code;$U;38|
        ((|f| $)
         ($ |Union| (|:| |nullBranch| "null")
          (|:| |assignmentBranch|
               (|Record| (|:| |var| (|Symbol|))
                         (|:| |arrayIndex| (|List| (|Polynomial| (|Integer|))))
                         (|:| |rand|
                              (|Record| (|:| |ints2Floats?| (|Boolean|))
                                        (|:| |expr| (|OutputForm|))))))
          (|:| |arrayAssignmentBranch|
               (|Record| (|:| |var| (|Symbol|)) (|:| |rand| (|OutputForm|))
                         (|:| |ints2Floats?| (|Boolean|))))
          (|:| |conditionalBranch|
               (|Record| (|:| |switch| (|Switch|)) (|:| |thenClause| $)
                         (|:| |elseClause| $)))
          (|:| |returnBranch|
               (|Record| (|:| |empty?| (|Boolean|))
                         (|:| |value|
                              (|Record| (|:| |ints2Floats?| (|Boolean|))
                                        (|:| |expr| (|OutputForm|))))))
          (|:| |blockBranch| (|List| $))
          (|:| |commentBranch| (|List| (|String|)))
          (|:| |callBranch| (|String|))
          (|:| |forBranch|
               (|Record|
                (|:| |range| (|SegmentBinding| (|Polynomial| (|Integer|))))
                (|:| |span| (|Polynomial| (|Integer|))) (|:| |body| $)))
          (|:| |labelBranch| (|SingleInteger|))
          (|:| |loopBranch|
               (|Record| (|:| |switch| (|Switch|)) (|:| |body| $)))
          (|:| |commonBranch|
               (|Record| (|:| |name| (|Symbol|))
                         (|:| |contents| (|List| (|Symbol|)))))
          (|:| |printBranch| (|List| (|OutputForm|)))))
        (QCDR |f|)) 

(PUT '|FC;operation;$U;39| '|SPADreplace| 'QCAR) 

(SDEFUN |FC;operation;$U;39|
        ((|f| $)
         ($ |Union| (|:| |Null| "null") (|:| |Assignment| "assignment")
          (|:| |Conditional| "conditional") (|:| |Return| "return")
          (|:| |Block| "block") (|:| |Comment| "comment") (|:| |Call| "call")
          (|:| |For| "for") (|:| |While| "while") (|:| |Repeat| "repeat")
          (|:| |Goto| "goto") (|:| |Continue| "continue")
          (|:| |ArrayAssignment| "arrayAssignment") (|:| |Save| "save")
          (|:| |Stop| "stop") (|:| |Common| "common") (|:| |Print| "print")))
        (QCAR |f|)) 

(SDEFUN |FC;common;SL$;40|
        ((|name| |Symbol|) (|contents| |List| (|Symbol|)) ($ $))
        (CONS (CONS 15 "common") (CONS 11 (CONS |name| |contents|)))) 

(SDEFUN |FC;stop;$;41| (($ $)) (CONS (CONS 14 "stop") (CONS 0 "null"))) 

(SDEFUN |FC;save;$;42| (($ $)) (CONS (CONS 13 "save") (CONS 0 "null"))) 

(SDEFUN |FC;printStatement;L$;43| ((|l| |List| (|OutputForm|)) ($ $))
        (CONS (CONS 16 "print") (CONS 12 |l|))) 

(SDEFUN |FC;comment;L$;44| ((|s| |List| (|String|)) ($ $))
        (CONS (CONS 5 "comment") (CONS 6 |s|))) 

(SDEFUN |FC;comment;S$;45| ((|s| |String|) ($ $))
        (CONS (CONS 5 "comment") (CONS 6 (SPADCALL |s| (QREFELT $ 88))))) 

(SDEFUN |FC;forLoop;Sb2$;46|
        ((|r| |SegmentBinding| (|Polynomial| (|Integer|))) (|body| $) ($ $))
        (CONS (CONS 7 "for")
              (CONS 8
                    (VECTOR |r|
                            (SPADCALL
                             (SPADCALL (SPADCALL |r| (QREFELT $ 76))
                                       (QREFELT $ 90))
                             (QREFELT $ 91))
                            |body|)))) 

(SDEFUN |FC;forLoop;SbP2$;47|
        ((|r| |SegmentBinding| (|Polynomial| (|Integer|)))
         (|increment| |Polynomial| (|Integer|)) (|body| $) ($ $))
        (CONS (CONS 7 "for") (CONS 8 (VECTOR |r| |increment| |body|)))) 

(SDEFUN |FC;gotoJump;Si$;48| ((|l| |SingleInteger|) ($ $))
        (CONS (CONS 10 "goto") (CONS 9 |l|))) 

(SDEFUN |FC;continue;Si$;49| ((|l| |SingleInteger|) ($ $))
        (CONS (CONS 11 "continue") (CONS 9 |l|))) 

(SDEFUN |FC;whileLoop;S2$;50| ((|sw| |Switch|) (|b| $) ($ $))
        (CONS (CONS 8 "while") (CONS 10 (CONS |sw| |b|)))) 

(SDEFUN |FC;repeatUntilLoop;S2$;51| ((|sw| |Switch|) (|b| $) ($ $))
        (CONS (CONS 9 "repeat") (CONS 10 (CONS |sw| |b|)))) 

(SDEFUN |FC;returns;$;52| (($ $))
        (SPROG
         ((|v|
           (|Record| (|:| |ints2Floats?| (|Boolean|))
                     (|:| |expr| (|OutputForm|)))))
         (SEQ
          (LETT |v| (CONS NIL (SPADCALL (|spadConstant| $ 97) (QREFELT $ 63))))
          (EXIT (CONS (CONS 3 "return") (CONS 4 (CONS 'T |v|))))))) 

(SDEFUN |FC;returns;E$;53| ((|v| |Expression| (|MachineInteger|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 100))))))) 

(SDEFUN |FC;returns;E$;54| ((|v| |Expression| (|MachineFloat|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 103))))))) 

(SDEFUN |FC;returns;E$;55| ((|v| |Expression| (|MachineComplex|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 106))))))) 

(SDEFUN |FC;returns;E$;56| ((|v| |Expression| (|Integer|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 109))))))) 

(SDEFUN |FC;returns;E$;57| ((|v| |Expression| (|Float|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 112))))))) 

(SDEFUN |FC;returns;E$;58| ((|v| |Expression| (|Complex| (|Float|))) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 115))))))) 

(SDEFUN |FC;block;L$;59| ((|l| |List| $) ($ $))
        (CONS (CONS 4 "block") (CONS 5 |l|))) 

(SDEFUN |FC;cond;S2$;60| ((|sw| |Switch|) (|thenC| $) ($ $))
        (CONS (CONS 2 "conditional")
              (CONS 3
                    (VECTOR |sw| |thenC|
                            (CONS (CONS 0 "null") (CONS 0 "null")))))) 

(SDEFUN |FC;cond;S3$;61| ((|sw| |Switch|) (|thenC| $) (|elseC| $) ($ $))
        (CONS (CONS 2 "conditional") (CONS 3 (VECTOR |sw| |thenC| |elseC|)))) 

(SDEFUN |FC;coerce;$Of;62| ((|f| $) ($ |OutputForm|))
        (SPADCALL (QCAR |f|) (QREFELT $ 120))) 

(SDEFUN |FC;assign;SS$;63| ((|v| |Symbol|) (|rhs| |String|) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS NIL (SPADCALL |rhs| (QREFELT $ 122))))))) 

(SDEFUN |FC;assign;SM$;64|
        ((|v| |Symbol|) (|rhs| |Matrix| (|MachineInteger|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 125)) NIL)))) 

(SDEFUN |FC;assign;SM$;65|
        ((|v| |Symbol|) (|rhs| |Matrix| (|MachineFloat|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 128)) 'T)))) 

(SDEFUN |FC;assign;SM$;66|
        ((|v| |Symbol|) (|rhs| |Matrix| (|MachineComplex|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 131)) 'T)))) 

(SDEFUN |FC;assign;SV$;67|
        ((|v| |Symbol|) (|rhs| |Vector| (|MachineInteger|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 134)) NIL)))) 

(SDEFUN |FC;assign;SV$;68|
        ((|v| |Symbol|) (|rhs| |Vector| (|MachineFloat|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 137)) 'T)))) 

(SDEFUN |FC;assign;SV$;69|
        ((|v| |Symbol|) (|rhs| |Vector| (|MachineComplex|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 140)) 'T)))) 

(SDEFUN |FC;assign;SM$;70|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|MachineInteger|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 143)) NIL)))) 

(SDEFUN |FC;assign;SM$;71|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|MachineFloat|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 146)) 'T)))) 

(SDEFUN |FC;assign;SM$;72|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|MachineComplex|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 149)) 'T)))) 

(SDEFUN |FC;assign;SV$;73|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|MachineInteger|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 152)) NIL)))) 

(SDEFUN |FC;assign;SV$;74|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|MachineFloat|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 155)) 'T)))) 

(SDEFUN |FC;assign;SV$;75|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|MachineComplex|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 158)) 'T)))) 

(SDEFUN |FC;assign;SLE$;76|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|MachineInteger|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS NIL (SPADCALL |rhs| (QREFELT $ 100))))))) 

(SDEFUN |FC;assign;SLE$;77|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|MachineFloat|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 103))))))) 

(SDEFUN |FC;assign;SLE$;78|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|MachineComplex|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 106))))))) 

(SDEFUN |FC;assign;SE$;79|
        ((|v| |Symbol|) (|rhs| |Expression| (|MachineInteger|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS NIL (SPADCALL |rhs| (QREFELT $ 100))))))) 

(SDEFUN |FC;assign;SE$;80|
        ((|v| |Symbol|) (|rhs| |Expression| (|MachineFloat|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 103))))))) 

(SDEFUN |FC;assign;SE$;81|
        ((|v| |Symbol|) (|rhs| |Expression| (|MachineComplex|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 106))))))) 

(SDEFUN |FC;assign;SM$;82|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|Integer|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 167)) NIL)))) 

(SDEFUN |FC;assign;SM$;83|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|Float|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 170)) 'T)))) 

(SDEFUN |FC;assign;SM$;84|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|Complex| (|Float|))))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 173)) 'T)))) 

(SDEFUN |FC;assign;SV$;85|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|Integer|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 176)) NIL)))) 

(SDEFUN |FC;assign;SV$;86|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|Float|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 179)) 'T)))) 

(SDEFUN |FC;assign;SV$;87|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|Complex| (|Float|))))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 182)) 'T)))) 

(SDEFUN |FC;assign;SLE$;88|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|Integer|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS NIL (SPADCALL |rhs| (QREFELT $ 109))))))) 

(SDEFUN |FC;assign;SLE$;89|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|Float|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 112))))))) 

(SDEFUN |FC;assign;SLE$;90|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|Complex| (|Float|))) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 115))))))) 

(SDEFUN |FC;assign;SE$;91|
        ((|v| |Symbol|) (|rhs| |Expression| (|Integer|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS NIL (SPADCALL |rhs| (QREFELT $ 109))))))) 

(SDEFUN |FC;assign;SE$;92|
        ((|v| |Symbol|) (|rhs| |Expression| (|Float|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 112))))))) 

(SDEFUN |FC;assign;SE$;93|
        ((|v| |Symbol|) (|rhs| |Expression| (|Complex| (|Float|))) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 115))))))) 

(SDEFUN |FC;call;S$;94| ((|s| |String|) ($ $))
        (CONS (CONS 6 "call") (CONS 7 |s|))) 

(DECLAIM (NOTINLINE |FortranCode;|)) 

(DEFUN |FortranCode| ()
  (SPROG NIL
         (PROG (#1=#:G2569)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FortranCode|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FortranCode|
                             (LIST (CONS NIL (CONS 1 (|FortranCode;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|FortranCode|)))))))))) 

(DEFUN |FortranCode;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FortranCode|))
          (LETT $ (GETREFV 192))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FortranCode| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 33
                    (|Record|
                     (|:| |op|
                          (|Union| (|:| |Null| #1="null")
                                   (|:| |Assignment| "assignment")
                                   (|:| |Conditional| "conditional")
                                   (|:| |Return| "return")
                                   (|:| |Block| "block")
                                   (|:| |Comment| "comment")
                                   (|:| |Call| "call") (|:| |For| "for")
                                   (|:| |While| "while")
                                   (|:| |Repeat| "repeat") (|:| |Goto| "goto")
                                   (|:| |Continue| "continue")
                                   (|:| |ArrayAssignment| "arrayAssignment")
                                   (|:| |Save| "save") (|:| |Stop| "stop")
                                   (|:| |Common| "common")
                                   (|:| |Print| "print")))
                     (|:| |data|
                          (|Union| (|:| |nullBranch| #1#)
                                   (|:| |assignmentBranch|
                                        (|Record| (|:| |var| (|Symbol|))
                                                  (|:| |arrayIndex|
                                                       (|List|
                                                        (|Polynomial|
                                                         (|Integer|))))
                                                  (|:| |rand|
                                                       (|Record|
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))
                                                        (|:| |expr|
                                                             (|OutputForm|))))))
                                   (|:| |arrayAssignmentBranch|
                                        (|Record| (|:| |var| (|Symbol|))
                                                  (|:| |rand| (|OutputForm|))
                                                  (|:| |ints2Floats?|
                                                       (|Boolean|))))
                                   (|:| |conditionalBranch|
                                        (|Record| (|:| |switch| (|Switch|))
                                                  (|:| |thenClause| $)
                                                  (|:| |elseClause| $)))
                                   (|:| |returnBranch|
                                        (|Record| (|:| |empty?| (|Boolean|))
                                                  (|:| |value|
                                                       (|Record|
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))
                                                        (|:| |expr|
                                                             (|OutputForm|))))))
                                   (|:| |blockBranch| (|List| $))
                                   (|:| |commentBranch| (|List| (|String|)))
                                   (|:| |callBranch| (|String|))
                                   (|:| |forBranch|
                                        (|Record|
                                         (|:| |range|
                                              (|SegmentBinding|
                                               (|Polynomial| (|Integer|))))
                                         (|:| |span|
                                              (|Polynomial| (|Integer|)))
                                         (|:| |body| $)))
                                   (|:| |labelBranch| (|SingleInteger|))
                                   (|:| |loopBranch|
                                        (|Record| (|:| |switch| (|Switch|))
                                                  (|:| |body| $)))
                                   (|:| |commonBranch|
                                        (|Record| (|:| |name| (|Symbol|))
                                                  (|:| |contents|
                                                       (|List| (|Symbol|)))))
                                   (|:| |printBranch|
                                        (|List| (|OutputForm|)))))))
          (QSETREFV $ 36 (SPADCALL 25000 (QREFELT $ 35)))
          $))) 

(MAKEPROP '|FortranCode| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|OutputForm|) (|Symbol|) (0 . |coerce|)
              (|List| $) (5 . |elt|) (|List| 25) (|Boolean|)
              (|FortranCodeTools|) (11 . |getStatement|)
              (17 . |statement2Fortran|) (|Void|) (|Integer|)
              (22 . |changeExprLength|) (27 . |append|) (|Mapping| 11)
              (33 . |do_with_error_env1|) (38 . |fort_clean_lines|)
              (|UniversalSegment| 17) (43 . SEGMENT) (|String|) (48 . |elt|)
              (|Mapping| 7) (54 . |expression2Fortran1|) (|NonNegativeInteger|)
              (61 . |first|) (67 . |do_with_error_env2|) (73 . |string|) '|Rep|
              (|SingleInteger|) (78 . |coerce|) '|labelValue|
              |FC;setLabelValue;2Si;15| (|Polynomial| 17) (83 . |One|)
              (87 . |elt|) (93 . |expression2Fortran|) (98 . |indentFortLevel|)
              |FC;getCode;$L;36|
              (|Union| (|:| |Null| '"null") (|:| |Assignment| '"assignment")
                       (|:| |Conditional| '"conditional")
                       (|:| |Return| '"return") (|:| |Block| '"block")
                       (|:| |Comment| '"comment") (|:| |Call| '"call")
                       (|:| |For| '"for") (|:| |While| '"while")
                       (|:| |Repeat| '"repeat") (|:| |Goto| '"goto")
                       (|:| |Continue| '"continue")
                       (|:| |ArrayAssignment| '"arrayAssignment")
                       (|:| |Save| '"save") (|:| |Stop| '"stop")
                       (|:| |Common| '"common") (|:| |Print| '"print"))
              |FC;operation;$U;39|
              (|Record| (|:| |ints2Floats?| 12) (|:| |expr| 6))
              (|Record| (|:| |var| 7) (|:| |arrayIndex| 66) (|:| |rand| 46))
              (|Record| (|:| |var| 7) (|:| |rand| 6) (|:| |ints2Floats?| 12))
              (|Record| (|:| |switch| 56) (|:| |thenClause| $)
                        (|:| |elseClause| $))
              (|Record| (|:| |empty?| 12) (|:| |value| 46))
              (|Record| (|:| |range| 69) (|:| |span| 38) (|:| |body| $))
              (|Record| (|:| |switch| 56) (|:| |body| $))
              (|Record| (|:| |name| 7) (|:| |contents| 82))
              (|Union| (|:| |nullBranch| '"null") (|:| |assignmentBranch| 47)
                       (|:| |arrayAssignmentBranch| 48)
                       (|:| |conditionalBranch| 49) (|:| |returnBranch| 50)
                       (|:| |blockBranch| 9) (|:| |commentBranch| 11)
                       (|:| |callBranch| 25) (|:| |forBranch| 51)
                       (|:| |labelBranch| 34) (|:| |loopBranch| 52)
                       (|:| |commonBranch| 53) (|:| |printBranch| 64))
              |FC;code;$U;38| (|Switch|) (103 . |coerce|)
              (108 . |get_fort_indent|) (112 . |hspace|) (117 . NOT)
              |FC;gotoJump;Si$;48| (122 . |concat|) (127 . |coerce|) (|List| 6)
              (|Mapping| 6 38) (|List| 38) (|ListFunctions2| 38 6)
              (132 . |map|) (|SegmentBinding| 38) (138 . |variable|)
              (|FortranType|) (143 . |fortranInteger|) (|TheSymbolTable|)
              (147 . |declare!|) (|Segment| 38) (153 . |segment|) (158 . |low|)
              (163 . |high|) (168 . |displayLines|) (173 . |void|)
              |FC;printCode;$V;37| (|List| 7) |FC;common;SL$;40| |FC;stop;$;41|
              |FC;save;$;42| |FC;printStatement;L$;43| |FC;comment;L$;44|
              (177 . |list|) |FC;comment;S$;45| (182 . |incr|) (187 . |coerce|)
              |FC;forLoop;Sb2$;46| |FC;forLoop;SbP2$;47| |FC;continue;Si$;49|
              |FC;whileLoop;S2$;50| |FC;repeatUntilLoop;S2$;51| (192 . |Zero|)
              |FC;returns;$;52| (|Expression| (|MachineInteger|))
              (196 . |coerce|) |FC;returns;E$;53|
              (|Expression| (|MachineFloat|)) (201 . |coerce|)
              |FC;returns;E$;54| (|Expression| (|MachineComplex|))
              (206 . |coerce|) |FC;returns;E$;55| (|Expression| 17)
              (211 . |coerce|) |FC;returns;E$;56| (|Expression| (|Float|))
              (216 . |coerce|) |FC;returns;E$;57|
              (|Expression| (|Complex| (|Float|))) (221 . |coerce|)
              |FC;returns;E$;58| |FC;block;L$;59| |FC;cond;S2$;60|
              |FC;cond;S3$;61| (226 . |coerce|) |FC;coerce;$Of;62|
              (231 . |coerce|) |FC;assign;SS$;63| (|Matrix| (|MachineInteger|))
              (236 . |coerce|) |FC;assign;SM$;64| (|Matrix| (|MachineFloat|))
              (241 . |coerce|) |FC;assign;SM$;65| (|Matrix| (|MachineComplex|))
              (246 . |coerce|) |FC;assign;SM$;66| (|Vector| (|MachineInteger|))
              (251 . |coerce|) |FC;assign;SV$;67| (|Vector| (|MachineFloat|))
              (256 . |coerce|) |FC;assign;SV$;68| (|Vector| (|MachineComplex|))
              (261 . |coerce|) |FC;assign;SV$;69| (|Matrix| 99)
              (266 . |coerce|) |FC;assign;SM$;70| (|Matrix| 102)
              (271 . |coerce|) |FC;assign;SM$;71| (|Matrix| 105)
              (276 . |coerce|) |FC;assign;SM$;72| (|Vector| 99)
              (281 . |coerce|) |FC;assign;SV$;73| (|Vector| 102)
              (286 . |coerce|) |FC;assign;SV$;74| (|Vector| 105)
              (291 . |coerce|) |FC;assign;SV$;75| |FC;assign;SLE$;76|
              |FC;assign;SLE$;77| |FC;assign;SLE$;78| |FC;assign;SE$;79|
              |FC;assign;SE$;80| |FC;assign;SE$;81| (|Matrix| 108)
              (296 . |coerce|) |FC;assign;SM$;82| (|Matrix| 111)
              (301 . |coerce|) |FC;assign;SM$;83| (|Matrix| 114)
              (306 . |coerce|) |FC;assign;SM$;84| (|Vector| 108)
              (311 . |coerce|) |FC;assign;SV$;85| (|Vector| 111)
              (316 . |coerce|) |FC;assign;SV$;86| (|Vector| 114)
              (321 . |coerce|) |FC;assign;SV$;87| |FC;assign;SLE$;88|
              |FC;assign;SLE$;89| |FC;assign;SLE$;90| |FC;assign;SE$;91|
              |FC;assign;SE$;92| |FC;assign;SE$;93| |FC;call;S$;94|
              (|HashState|))
           '#(~= 326 |whileLoop| 332 |stop| 338 |setLabelValue| 342 |save| 347
              |returns| 351 |repeatUntilLoop| 385 |printStatement| 391
              |printCode| 396 |operation| 401 |latex| 406 |hashUpdate!| 411
              |hash| 417 |gotoJump| 422 |getCode| 427 |forLoop| 432 |continue|
              445 |cond| 450 |common| 463 |comment| 469 |coerce| 479 |code| 484
              |call| 489 |block| 494 |assign| 499 = 691)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 6))
                        (|makeByteWordVec2| 191
                                            '(1 7 6 0 8 2 6 0 0 9 10 2 13 11 6
                                              12 14 1 13 11 6 15 1 13 16 17 18
                                              2 11 0 0 0 19 1 13 11 20 21 1 13
                                              11 11 22 1 23 0 17 24 2 25 0 0 23
                                              26 3 13 11 27 6 12 28 2 11 0 0 29
                                              30 2 13 11 12 20 31 1 7 25 0 32 1
                                              34 0 17 35 0 38 0 39 2 11 25 0 17
                                              40 1 13 11 6 41 1 13 16 17 42 1
                                              56 6 0 57 0 13 17 58 1 6 0 17 59
                                              1 56 0 0 60 1 11 0 9 62 1 38 6 0
                                              63 2 67 64 65 66 68 1 69 7 0 70 0
                                              71 0 72 2 73 71 7 71 74 1 69 75 0
                                              76 1 75 38 0 77 1 75 38 0 78 1 13
                                              16 11 79 0 16 0 80 1 11 0 25 88 1
                                              75 17 0 90 1 38 0 17 91 0 38 0 97
                                              1 99 6 0 100 1 102 6 0 103 1 105
                                              6 0 106 1 108 6 0 109 1 111 6 0
                                              112 1 114 6 0 115 1 44 6 0 120 1
                                              25 6 0 122 1 124 6 0 125 1 127 6
                                              0 128 1 130 6 0 131 1 133 6 0 134
                                              1 136 6 0 137 1 139 6 0 140 1 142
                                              6 0 143 1 145 6 0 146 1 148 6 0
                                              149 1 151 6 0 152 1 154 6 0 155 1
                                              157 6 0 158 1 166 6 0 167 1 169 6
                                              0 170 1 172 6 0 173 1 175 6 0 176
                                              1 178 6 0 179 1 181 6 0 182 2 0
                                              12 0 0 1 2 0 0 56 0 95 0 0 0 84 1
                                              0 34 34 37 0 0 0 85 1 0 0 114 116
                                              1 0 0 111 113 1 0 0 108 110 1 0 0
                                              99 101 1 0 0 105 107 0 0 0 98 1 0
                                              0 102 104 2 0 0 56 0 96 1 0 0 64
                                              86 1 0 16 0 81 1 0 44 0 45 1 0 25
                                              0 1 2 0 191 191 0 1 1 0 34 0 1 1
                                              0 0 34 61 1 0 11 0 43 3 0 0 69 38
                                              0 93 2 0 0 69 0 92 1 0 0 34 94 3
                                              0 0 56 0 0 119 2 0 0 56 0 118 2 0
                                              0 7 82 83 1 0 0 11 87 1 0 0 25 89
                                              1 0 6 0 121 1 0 54 0 55 1 0 0 25
                                              190 1 0 0 9 117 3 0 0 7 66 111
                                              185 3 0 0 7 66 114 186 2 0 0 7
                                              181 183 3 0 0 7 66 108 184 2 0 0
                                              7 175 177 2 0 0 7 178 180 2 0 0 7
                                              169 171 2 0 0 7 172 174 2 0 0 7
                                              114 189 2 0 0 7 166 168 2 0 0 7
                                              108 187 2 0 0 7 111 188 3 0 0 7
                                              66 102 161 3 0 0 7 66 105 162 2 0
                                              0 7 157 159 3 0 0 7 66 99 160 2 0
                                              0 7 151 153 2 0 0 7 154 156 2 0 0
                                              7 145 147 2 0 0 7 148 150 2 0 0 7
                                              139 141 2 0 0 7 142 144 2 0 0 7
                                              133 135 2 0 0 7 136 138 2 0 0 7
                                              127 129 2 0 0 7 130 132 2 0 0 7
                                              105 165 2 0 0 7 124 126 2 0 0 7
                                              99 163 2 0 0 7 102 164 2 0 0 7 25
                                              123 2 0 12 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranCode| 'NILADIC T) 
