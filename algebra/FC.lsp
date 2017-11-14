
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
                  (SEQ (LETT |l1| |switch1| . #1=(|FC;format_switch|))
                       (EXIT
                        (COND
                         ((EQ (|SPADfirst| |l1|) 'NULL)
                          (LETT |switch1| (|SPADfirst| (CDR |l1|)) . #1#)))))))
                (LETT |r| (NREVERSE (SPADCALL |switch1| (QREFELT $ 15))) . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |r|) NIL)
                              ('T (NULL (EQUAL (|SPADfirst| |r|) "%l")))))
                       (GO G191)))
                     (SEQ (LETT |l| (CONS (|SPADfirst| |r|) |l|) . #1#)
                          (EXIT (LETT |r| (CDR |r|) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (LIST |l| |r|))))) 

(SDEFUN |FC;fortFormatIf1|
        ((|switch1| |OutputForm|) (|i| |Integer|) (|kind| |String|)
         ($ |List| (|String|)))
        (SPROG
         ((|r| NIL) (|#G11| #1=(|List| (|List| (|String|))))
          (|l| (|List| (|String|))) (|#G10| #1#))
         (SEQ (LETT |l| (LIST ")THEN") . #2=(|FC;fortFormatIf1|))
              (SPADCALL (- |i|) (QREFELT $ 18))
              (PROGN
               (LETT |#G10| (|FC;format_switch| |switch1| |l| $) . #2#)
               (LETT |#G11| |#G10| . #2#)
               (LETT |l| (|SPADfirst| |#G11|) . #2#)
               (LETT |#G11| (CDR |#G11|) . #2#)
               (LETT |r| (|SPADfirst| |#G11|) . #2#)
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
          (LETT |switch1| (QREFELT $$ 1) . #1=(|FC;fortFormatIf|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FC;fortFormatIf1| |switch1| 8 "IF(" $))))) 

(SDEFUN |FC;fortFormatElseIf| ((|switch1| |OutputForm|) ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL (CONS #'|FC;fortFormatElseIf!0| (VECTOR $ |switch1|))
                         (QREFELT $ 21)))) 

(SDEFUN |FC;fortFormatElseIf!0| (($$ NIL))
        (PROG (|switch1| $)
          (LETT |switch1| (QREFELT $$ 1) . #1=(|FC;fortFormatElseIf|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FC;fortFormatIf1| |switch1| 12 "ELSEIF(" $))))) 

(SDEFUN |FC;fortFormatIfGoto1|
        ((|switch1| |OutputForm|) (|lab| |SingleInteger|)
         ($ |List| (|String|)))
        (SPROG
         ((|r| NIL) (|#G19| #1=(|List| (|List| (|String|))))
          (|l| (|List| (|String|))) (|#G18| #1#))
         (SEQ
          (LETT |l| (LIST ")GOTO " (STRINGIMAGE |lab|))
                . #2=(|FC;fortFormatIfGoto1|))
          (SPADCALL -8 (QREFELT $ 18))
          (PROGN
           (LETT |#G18| (|FC;format_switch| |switch1| |l| $) . #2#)
           (LETT |#G19| |#G18| . #2#)
           (LETT |l| (|SPADfirst| |#G19|) . #2#)
           (LETT |#G19| (CDR |#G19|) . #2#)
           (LETT |r| (|SPADfirst| |#G19|) . #2#)
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
          (LETT |switch1| (QREFELT $$ 2) . #1=(|FC;fortFormatIfGoto|))
          (LETT |lab| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FC;fortFormatIfGoto1| |switch1| |lab| $))))) 

(SDEFUN |FC;fortFormatLabelledIfGoto1|
        ((|switch1| |OutputForm|) (|lab1| |SingleInteger|)
         (|lab2| |SingleInteger|) ($ |List| (|String|)))
        (SPROG ((|l| (|List| (|String|))) (|labString| (|String|)) (|i| NIL))
               (SEQ
                (LETT |l| (|FC;fortFormatIfGoto1| |switch1| |lab2| $)
                      . #1=(|FC;fortFormatLabelledIfGoto1|))
                (LETT |labString| (STRINGIMAGE |lab1|) . #1#)
                (SEQ (LETT |i| (QCSIZE |labString|) . #1#) G190
                     (COND ((> |i| 5) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |labString| (STRCONC |labString| " ") . #1#)))
                     (LETT |i| (+ |i| 1) . #1#) (GO G190) G191 (EXIT NIL))
                (LETT |l| (SPADCALL |l| (QREFELT $ 22)) . #1#)
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
        (SPROG ((#1=#:G758 NIL) (|l| (|List| (|String|))))
               (SEQ
                (LETT |l|
                      (SPADCALL (CONS #'|FC;getfortarrayexp1!0| |name|) |of|
                                |int_to_floats?| (QREFELT $ 28))
                      . #2=(|FC;getfortarrayexp1|))
                (EXIT
                 (SPADCALL |l|
                           (PROG1 (LETT #1# (- (LENGTH |l|) 2) . #2#)
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
          (LETT |name| (QREFELT $$ 3) . #1=(|FC;getfortarrayexp|))
          (LETT |of| (QREFELT $$ 2) . #1#)
          (LETT |int_to_floats?| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|FC;getfortarrayexp1| |name| |of| |int_to_floats?| $))))) 

(SDEFUN |FC;fortFormatDo1|
        ((|var1| |Symbol|) (|lo| |OutputForm|) (|hi| |OutputForm|)
         (|incr| |OutputForm|) (|lab| |SingleInteger|) ($ |List| (|String|)))
        (SPROG
         ((|il| (|List| (|String|))) (|incl| (|List| (|String|)))
          (|hil| #1=(|List| (|String|))) (|lol| #1#))
         (SEQ
          (LETT |lol| (SPADCALL |lo| (QREFELT $ 15)) . #2=(|FC;fortFormatDo1|))
          (LETT |hil| (SPADCALL |hi| (QREFELT $ 15)) . #2#)
          (LETT |incl|
                (COND
                 ((EQUAL |incr| 1) (CONS "," (SPADCALL |incr| (QREFELT $ 15))))
                 ('T NIL))
                . #2#)
          (LETT |il|
                (SPADCALL |lol|
                          (CONS "," (SPADCALL |hil| |incl| (QREFELT $ 19)))
                          (QREFELT $ 19))
                . #2#)
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
          (LETT |var1| (QREFELT $$ 5) . #1=(|FC;fortFormatDo|))
          (LETT |lo| (QREFELT $$ 4) . #1#)
          (LETT |hi| (QREFELT $$ 3) . #1#)
          (LETT |inc| (QREFELT $$ 2) . #1#)
          (LETT |lab| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FC;fortFormatDo1| |var1| |lo| |hi| |inc| |lab| $))))) 

(SDEFUN |FC;addCommas| ((|l| |List| (|Symbol|)) ($ |List| (|String|)))
        (SPROG ((|r| (|List| (|String|))) (#1=#:G780 NIL) (|e| NIL))
               (SEQ
                (COND ((NULL |l|) NIL)
                      ('T
                       (SEQ
                        (LETT |r|
                              (LIST
                               (SPADCALL (|SPADfirst| |l|) (QREFELT $ 32)))
                              . #2=(|FC;addCommas|))
                        (SEQ (LETT |e| NIL . #2#) (LETT #1# (CDR |l|) . #2#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |r|
                                     (CONS (SPADCALL |e| (QREFELT $ 32))
                                           (CONS "," |r|))
                                     . #2#)))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (NREVERSE |r|)))))))) 

(SDEFUN |FC;setLabelValue;2Si;15| ((|u| |SingleInteger|) ($ |SingleInteger|))
        (SETELT $ 36 |u|)) 

(SDEFUN |FC;newLabel| (($ |SingleInteger|))
        (SEQ (SETELT $ 36 (|add_SI| (QREFELT $ 36) 1)) (EXIT (QREFELT $ 36)))) 

(SDEFUN |FC;commaSep| ((|l| |List| (|String|)) ($ |List| (|String|)))
        (SPROG
         ((#1=#:G787 NIL) (#2=#:G786 #3=(|List| (|String|))) (#4=#:G788 #3#)
          (#5=#:G790 NIL) (|u| NIL))
         (SEQ
          (CONS (SPADCALL |l| 1 (QREFELT $ 40))
                (PROGN
                 (LETT #1# NIL . #6=(|FC;commaSep|))
                 (SEQ (LETT |u| NIL . #6#) (LETT #5# (CDR |l|) . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# (LIST "," |u|) . #6#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #4# (QREFELT $ 19)) . #6#))
                          ('T
                           (PROGN
                            (LETT #2# #4# . #6#)
                            (LETT #1# 'T . #6#)))))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
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
         (SEQ
          (LETT |returnToken| (SPADCALL 'RETURN (QREFELT $ 8))
                . #1=(|FC;getReturn|))
          (EXIT
           (COND ((QCAR |rec|) (SPADCALL |returnToken| NIL (QREFELT $ 14)))
                 ('T
                  (SEQ (LETT |rt| (QCDR |rec|) . #1#)
                       (LETT |rv| (QCDR |rt|) . #1#)
                       (EXIT
                        (SPADCALL
                         (SPADCALL |returnToken| (LIST |rv|) (QREFELT $ 10))
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
        (SPROG ((|ll| (|List| (|String|))) (#1=#:G802 NIL) (|i| NIL))
               (SEQ (LETT |ll| (LIST "PRINT*") . #2=(|FC;getPrint|))
                    (SEQ (LETT |i| NIL . #2#) (LETT #1# |l| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ll|
                                 (SPADCALL |ll|
                                           (CONS ","
                                                 (SPADCALL |i| (QREFELT $ 41)))
                                           (QREFELT $ 19))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |ll| (QREFELT $ 22)))))) 

(SDEFUN |FC;getBlock| ((|rec| |List| $) ($ |List| (|String|)))
        (SPROG ((|expr| (|List| (|String|))) (#1=#:G806 NIL) (|u| NIL))
               (SEQ (SPADCALL 1 (QREFELT $ 42))
                    (LETT |expr| NIL . #2=(|FC;getBlock|))
                    (SEQ (LETT |u| NIL . #2#) (LETT #1# |rec| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |u| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |expr|
                                 (SPADCALL |expr| (SPADCALL |u| (QREFELT $ 43))
                                           (QREFELT $ 19))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (SPADCALL -1 (QREFELT $ 42)) (EXIT |expr|)))) 

(SDEFUN |FC;getBody| ((|f| $) ($ |List| (|String|)))
        (SPROG ((|expr| (|List| (|String|))))
               (SEQ
                (COND
                 ((QEQCAR (SPADCALL |f| (QREFELT $ 45)) 4)
                  (SPADCALL |f| (QREFELT $ 43)))
                 ('T
                  (SEQ (SPADCALL 1 (QREFELT $ 42))
                       (LETT |expr| (SPADCALL |f| (QREFELT $ 43)) |FC;getBody|)
                       (SPADCALL -1 (QREFELT $ 42)) (EXIT |expr|))))))) 

(SDEFUN |FC;getElseIf| ((|f| $) ($ |List| (|String|)))
        (SPROG
         ((|expr| (|List| (|String|))) (|elseBranch| ($)) (#1=#:G834 NIL)
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
         (SEQ (LETT |rec| (SPADCALL |f| (QREFELT $ 55)) . #3=(|FC;getElseIf|))
              (LETT |expr|
                    (|FC;fortFormatElseIf|
                     (SPADCALL
                      (QVELT
                       (PROG2 (LETT #1# |rec| . #3#)
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
                     $)
                    . #3#)
              (LETT |expr|
                    (SPADCALL |expr|
                              (|FC;getBody|
                               (QVELT
                                (PROG2 (LETT #1# |rec| . #3#)
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
                              (QREFELT $ 19))
                    . #3#)
              (LETT |elseBranch|
                    (QVELT
                     (PROG2 (LETT #1# |rec| . #3#)
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
                     2)
                    . #3#)
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
                                    (QREFELT $ 19))
                          . #3#)
                    (EXIT
                     (LETT |expr|
                           (SPADCALL |expr| (|FC;getBody| |elseBranch| $)
                                     (QREFELT $ 19))
                           . #3#))))))))
              (EXIT |expr|)))) 

(SDEFUN |FC;getContinue| ((|label| |SingleInteger|) ($ |List| (|String|)))
        (SPROG
         ((|sp| (|OutputForm|)) (|cnt| (#1="CONTINUE")) (|lab| (|String|)))
         (SEQ (LETT |lab| (STRINGIMAGE |label|) . #2=(|FC;getContinue|))
              (COND
               ((SPADCALL (QCSIZE |lab|) 6 (QREFELT $ 58))
                (|error| "Label too big")))
              (LETT |cnt| #1# . #2#)
              (LETT |sp|
                    (SPADCALL (- (SPADCALL (QREFELT $ 59)) (QCSIZE |lab|))
                              (QREFELT $ 60))
                    . #2#)
              (EXIT (STRCONC |lab| |sp| |cnt|))))) 

(SDEFUN |FC;getGoto| ((|label| |SingleInteger|) ($ |List| (|String|)))
        (SPADCALL (LIST (STRCONC "GOTO " (STRINGIMAGE |label|)))
                  (QREFELT $ 22))) 

(SDEFUN |FC;getRepeat|
        ((|repRec| |Record| (|:| |switch| (|Switch|)) (|:| |body| $))
         ($ |List| (|String|)))
        (SPROG ((|bod| ($)) (|lab| (|SingleInteger|)) (|sw| (|Switch|)))
               (SEQ
                (LETT |sw| (SPADCALL (QCAR |repRec|) (QREFELT $ 61))
                      . #1=(|FC;getRepeat|))
                (LETT |lab| (|FC;newLabel| $) . #1#)
                (LETT |bod| (QCDR |repRec|) . #1#)
                (EXIT
                 (SPADCALL (|FC;getContinue| |lab| $)
                           (SPADCALL (|FC;getBody| |bod| $)
                                     (|FC;fortFormatIfGoto|
                                      (SPADCALL |sw| (QREFELT $ 57)) |lab| $)
                                     (QREFELT $ 19))
                           (QREFELT $ 19)))))) 

(SDEFUN |FC;getWhile|
        ((|whileRec| |Record| (|:| |switch| (|Switch|)) (|:| |body| $))
         ($ |List| (|String|)))
        (SPROG
         ((|rl1| (|List| (|List| (|String|)))) (|ig| (|List| (|String|)))
          (|bod| ($)) (|lab2| #1=(|SingleInteger|)) (|lab1| #1#)
          (|sw| (|Switch|)))
         (SEQ
          (LETT |sw| (SPADCALL (QCAR |whileRec|) (QREFELT $ 61))
                . #2=(|FC;getWhile|))
          (LETT |lab1| (|FC;newLabel| $) . #2#)
          (LETT |lab2| (|FC;newLabel| $) . #2#)
          (LETT |bod| (QCDR |whileRec|) . #2#)
          (LETT |ig|
                (|FC;fortFormatLabelledIfGoto| (SPADCALL |sw| (QREFELT $ 57))
                 |lab1| |lab2| $)
                . #2#)
          (LETT |rl1|
                (LIST |ig| (|FC;getBody| |bod| $)
                      (|FC;getBody| (SPADCALL |lab1| (QREFELT $ 62)) $)
                      (|FC;getContinue| |lab2| $))
                . #2#)
          (EXIT (SPADCALL |rl1| (QREFELT $ 63)))))) 

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
         (SEQ (LETT |indices| (QVELT |rec| 1) . #2=(|FC;getAssign|))
              (LETT |lhs| (SPADCALL (QVELT |rec| 0) (QREFELT $ 8)) . #2#)
              (COND
               ((NULL (NULL |indices|))
                (LETT |lhs|
                      (SPADCALL |lhs|
                                (SPADCALL (ELT $ 64) |indices| (QREFELT $ 69))
                                (QREFELT $ 10))
                      . #2#)))
              (LETT |ass| (QVELT |rec| 2) . #2#) (LETT |ex| (QCDR |ass|) . #2#)
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
                       (|FC;getBody| (QVELT |rec| 1) $) (QREFELT $ 19))
                      . #1=(|FC;getCond|))
                (LETT |elseBranch| (QVELT |rec| 2) . #1#)
                (COND
                 ((NULL (QEQCAR (SPADCALL |elseBranch| (QREFELT $ 45)) 0))
                  (COND
                   ((QEQCAR (SPADCALL |elseBranch| (QREFELT $ 45)) 2)
                    (LETT |expr|
                          (SPADCALL |expr| (|FC;getElseIf| |elseBranch| $)
                                    (QREFELT $ 19))
                          . #1#))
                   ('T
                    (LETT |expr|
                          (SPADCALL |expr|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL 'ELSE (QREFELT $ 8))
                                               NIL (QREFELT $ 14))
                                     (|FC;getBody| |elseBranch| $)
                                     (QREFELT $ 19))
                                    (QREFELT $ 19))
                          . #1#)))))
                (EXIT
                 (SPADCALL |expr|
                           (SPADCALL (SPADCALL 'ENDIF (QREFELT $ 8)) NIL
                                     (QREFELT $ 14))
                           (QREFELT $ 19)))))) 

(SDEFUN |FC;getComment| ((|rec| |List| (|String|)) ($ |List| (|String|)))
        (SPROG ((#1=#:G906 NIL) (|c| NIL) (#2=#:G905 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FC;getComment|))
                 (SEQ (LETT |c| NIL . #3#) (LETT #1# |rec| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (STRCONC "C     " |c|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FC;getCall| ((|rec| |String|) ($ |List| (|String|)))
        (SPROG ((|expr| (|String|)))
               (SEQ (LETT |expr| (STRCONC "CALL " |rec|) |FC;getCall|)
                    (EXIT
                     (COND
                      ((SPADCALL (QCSIZE |expr|) 1320 (QREFELT $ 58))
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
         (SEQ (LETT |rnge| (QVELT |rec| 0) . #3=(|FC;getFor|))
              (LETT |increment| (QVELT |rec| 1) . #3#)
              (LETT |lab| (|FC;newLabel| $) . #3#)
              (SPADCALL (SPADCALL |rnge| (QREFELT $ 71))
                        (SPADCALL (QREFELT $ 73)) (QREFELT $ 75))
              (LETT |expr|
                    (|FC;fortFormatDo| (SPADCALL |rnge| (QREFELT $ 71))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rnge| (QREFELT $ 77))
                                (QREFELT $ 78))
                      (QREFELT $ 64))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rnge| (QREFELT $ 77))
                                (QREFELT $ 79))
                      (QREFELT $ 64))
                     (SPADCALL |increment| (QREFELT $ 64)) |lab| $)
                    . #3#)
              (EXIT
               (SPADCALL |expr|
                         (SPADCALL (|FC;getBody| (QVELT |rec| 2) $)
                                   (|FC;getContinue| |lab| $) (QREFELT $ 19))
                         (QREFELT $ 19)))))) 

(SDEFUN |FC;getCode;$L;36| ((|f| $) ($ |List| (|String|)))
        (SPROG
         ((#1=#:G944 NIL) (#2=#:G945 NIL) (#3=#:G943 NIL) (#4=#:G942 NIL)
          (#5=#:G941 NIL) (#6=#:G940 NIL) (#7=#:G939 NIL) (#8=#:G938 NIL)
          (#9=#:G937 NIL) (#10=#:G936 NIL) (#11=#:G935 NIL) (#12=#:G934 NIL)
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
         (SEQ
          (LETT |opp| (SPADCALL |f| (QREFELT $ 45)) . #14=(|FC;getCode;$L;36|))
          (LETT |rec| (SPADCALL |f| (QREFELT $ 55)) . #14#)
          (EXIT
           (COND
            ((QEQCAR |opp| 1)
             (|FC;getAssign|
              (PROG2 (LETT #12# |rec| . #14#)
                  (QCDR #12#)
                (|check_union2| (QEQCAR #12# 1)
                                (|Record| (|:| |var| (|Symbol|))
                                          (|:| |arrayIndex|
                                               (|List|
                                                (|Polynomial| (|Integer|))))
                                          (|:| |rand|
                                               (|Record|
                                                (|:| |ints2Floats?|
                                                     (|Boolean|))
                                                (|:| |expr| (|OutputForm|)))))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
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
                                              (|Record| (|:| |var| (|Symbol|))
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
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #12#))
              $))
            ((QEQCAR |opp| 12)
             (|FC;getArrayAssign|
              (PROG2 (LETT #11# |rec| . #14#)
                  (QCDR #11#)
                (|check_union2| (QEQCAR #11# 2)
                                (|Record| (|:| |var| (|Symbol|))
                                          (|:| |rand| (|OutputForm|))
                                          (|:| |ints2Floats?| (|Boolean|)))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
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
                                              (|Record| (|:| |var| (|Symbol|))
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
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #11#))
              $))
            ((QEQCAR |opp| 2)
             (|FC;getCond|
              (PROG2 (LETT #10# |rec| . #14#)
                  (QCDR #10#)
                (|check_union2| (QEQCAR #10# 3)
                                (|Record| (|:| |switch| (|Switch|))
                                          (|:| |thenClause| $)
                                          (|:| |elseClause| $))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
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
                                              (|Record| (|:| |var| (|Symbol|))
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
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #10#))
              $))
            ((QEQCAR |opp| 3)
             (|FC;getReturn|
              (PROG2 (LETT #9# |rec| . #14#)
                  (QCDR #9#)
                (|check_union2| (QEQCAR #9# 4)
                                (|Record| (|:| |empty?| (|Boolean|))
                                          (|:| |value|
                                               (|Record|
                                                (|:| |ints2Floats?|
                                                     (|Boolean|))
                                                (|:| |expr| (|OutputForm|)))))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
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
                                              (|Record| (|:| |var| (|Symbol|))
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
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #9#))
              $))
            ((QEQCAR |opp| 4)
             (|FC;getBlock|
              (PROG2 (LETT #8# |rec| . #14#)
                  (QCDR #8#)
                (|check_union2| (QEQCAR #8# 5) (|List| $)
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
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
                                              (|Record| (|:| |var| (|Symbol|))
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
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #8#))
              $))
            ((QEQCAR |opp| 5)
             (|FC;getComment|
              (PROG2 (LETT #7# |rec| . #14#)
                  (QCDR #7#)
                (|check_union2| (QEQCAR #7# 6) (|List| (|String|))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
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
                                              (|Record| (|:| |var| (|Symbol|))
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
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #7#))
              $))
            ((QEQCAR |opp| 6)
             (|FC;getCall|
              (PROG2 (LETT #6# |rec| . #14#)
                  (QCDR #6#)
                (|check_union2| (QEQCAR #6# 7) (|String|)
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
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
                                              (|Record| (|:| |var| (|Symbol|))
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
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #6#))
              $))
            ((QEQCAR |opp| 7)
             (|FC;getFor|
              (PROG2 (LETT #5# |rec| . #14#)
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
                                              (|Record| (|:| |var| (|Symbol|))
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
                                              (|Record| (|:| |var| (|Symbol|))
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
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #5#))
              $))
            ((QEQCAR |opp| 11)
             (|FC;getContinue|
              (PROG2 (LETT #4# |rec| . #14#)
                  (QCDR #4#)
                (|check_union2| (QEQCAR #4# 9) (|SingleInteger|)
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
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
                                              (|Record| (|:| |var| (|Symbol|))
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
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #4#))
              $))
            ((QEQCAR |opp| 10)
             (|FC;getGoto|
              (PROG2 (LETT #4# |rec| . #14#)
                  (QCDR #4#)
                (|check_union2| (QEQCAR #4# 9) (|SingleInteger|)
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
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
                                              (|Record| (|:| |var| (|Symbol|))
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
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #4#))
              $))
            ((QEQCAR |opp| 9)
             (|FC;getRepeat|
              (PROG2 (LETT #3# |rec| . #14#)
                  (QCDR #3#)
                (|check_union2| (QEQCAR #3# 10)
                                (|Record| (|:| |switch| (|Switch|))
                                          (|:| |body| $))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
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
                                              (|Record| (|:| |var| (|Symbol|))
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
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #3#))
              $))
            ((QEQCAR |opp| 8)
             (|FC;getWhile|
              (PROG2 (LETT #3# |rec| . #14#)
                  (QCDR #3#)
                (|check_union2| (QEQCAR #3# 10)
                                (|Record| (|:| |switch| (|Switch|))
                                          (|:| |body| $))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
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
                                              (|Record| (|:| |var| (|Symbol|))
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
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #3#))
              $))
            ((QEQCAR |opp| 13) (|FC;getSave| $))
            ((QEQCAR |opp| 14) (|FC;getStop| $))
            ((QEQCAR |opp| 16)
             (|FC;getPrint|
              (PROG2 (LETT #2# |rec| . #14#)
                  (QCDR #2#)
                (|check_union2| (QEQCAR #2# 12) (|List| (|OutputForm|))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
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
                                              (|Record| (|:| |var| (|Symbol|))
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
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #2#))
              $))
            ((QEQCAR |opp| 15)
             (|FC;getCommon|
              (PROG2 (LETT #1# |rec| . #14#)
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 11)
                                (|Record| (|:| |name| (|Symbol|))
                                          (|:| |contents| (|List| (|Symbol|))))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
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
                                              (|Record| (|:| |var| (|Symbol|))
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
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #1#))
              $))
            ('T (|error| "Unsupported program construct."))))))) 

(SDEFUN |FC;printCode;$V;37| ((|f| $) ($ |Void|))
        (SEQ (SPADCALL (SPADCALL |f| (QREFELT $ 43)) (QREFELT $ 80))
             (EXIT (SPADCALL (QREFELT $ 81))))) 

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
        (CONS (CONS 5 "comment") (CONS 6 (SPADCALL |s| (QREFELT $ 89))))) 

(SDEFUN |FC;forLoop;Sb2$;46|
        ((|r| |SegmentBinding| (|Polynomial| (|Integer|))) (|body| $) ($ $))
        (CONS (CONS 7 "for")
              (CONS 8
                    (VECTOR |r|
                            (SPADCALL
                             (SPADCALL (SPADCALL |r| (QREFELT $ 77))
                                       (QREFELT $ 91))
                             (QREFELT $ 92))
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
          (LETT |v| (CONS NIL (SPADCALL (|spadConstant| $ 98) (QREFELT $ 64)))
                |FC;returns;$;52|)
          (EXIT (CONS (CONS 3 "return") (CONS 4 (CONS 'T |v|))))))) 

(SDEFUN |FC;returns;E$;53| ((|v| |Expression| (|MachineInteger|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 101))))))) 

(SDEFUN |FC;returns;E$;54| ((|v| |Expression| (|MachineFloat|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 104))))))) 

(SDEFUN |FC;returns;E$;55| ((|v| |Expression| (|MachineComplex|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 107))))))) 

(SDEFUN |FC;returns;E$;56| ((|v| |Expression| (|Integer|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 110))))))) 

(SDEFUN |FC;returns;E$;57| ((|v| |Expression| (|Float|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 113))))))) 

(SDEFUN |FC;returns;E$;58| ((|v| |Expression| (|Complex| (|Float|))) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 116))))))) 

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
        (SPADCALL (QCAR |f|) (QREFELT $ 121))) 

(SDEFUN |FC;assign;SS$;63| ((|v| |Symbol|) (|rhs| |String|) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS NIL (SPADCALL |rhs| (QREFELT $ 123))))))) 

(SDEFUN |FC;assign;SM$;64|
        ((|v| |Symbol|) (|rhs| |Matrix| (|MachineInteger|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 126)) NIL)))) 

(SDEFUN |FC;assign;SM$;65|
        ((|v| |Symbol|) (|rhs| |Matrix| (|MachineFloat|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 129)) 'T)))) 

(SDEFUN |FC;assign;SM$;66|
        ((|v| |Symbol|) (|rhs| |Matrix| (|MachineComplex|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 132)) 'T)))) 

(SDEFUN |FC;assign;SV$;67|
        ((|v| |Symbol|) (|rhs| |Vector| (|MachineInteger|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 135)) NIL)))) 

(SDEFUN |FC;assign;SV$;68|
        ((|v| |Symbol|) (|rhs| |Vector| (|MachineFloat|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 138)) 'T)))) 

(SDEFUN |FC;assign;SV$;69|
        ((|v| |Symbol|) (|rhs| |Vector| (|MachineComplex|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 141)) 'T)))) 

(SDEFUN |FC;assign;SM$;70|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|MachineInteger|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 144)) NIL)))) 

(SDEFUN |FC;assign;SM$;71|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|MachineFloat|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 147)) 'T)))) 

(SDEFUN |FC;assign;SM$;72|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|MachineComplex|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 150)) 'T)))) 

(SDEFUN |FC;assign;SV$;73|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|MachineInteger|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 153)) NIL)))) 

(SDEFUN |FC;assign;SV$;74|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|MachineFloat|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 156)) 'T)))) 

(SDEFUN |FC;assign;SV$;75|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|MachineComplex|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 159)) 'T)))) 

(SDEFUN |FC;assign;SLE$;76|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|MachineInteger|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS NIL (SPADCALL |rhs| (QREFELT $ 101))))))) 

(SDEFUN |FC;assign;SLE$;77|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|MachineFloat|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 104))))))) 

(SDEFUN |FC;assign;SLE$;78|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|MachineComplex|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 107))))))) 

(SDEFUN |FC;assign;SE$;79|
        ((|v| |Symbol|) (|rhs| |Expression| (|MachineInteger|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS NIL (SPADCALL |rhs| (QREFELT $ 101))))))) 

(SDEFUN |FC;assign;SE$;80|
        ((|v| |Symbol|) (|rhs| |Expression| (|MachineFloat|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 104))))))) 

(SDEFUN |FC;assign;SE$;81|
        ((|v| |Symbol|) (|rhs| |Expression| (|MachineComplex|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 107))))))) 

(SDEFUN |FC;assign;SM$;82|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|Integer|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 168)) NIL)))) 

(SDEFUN |FC;assign;SM$;83|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|Float|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 171)) 'T)))) 

(SDEFUN |FC;assign;SM$;84|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|Complex| (|Float|))))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 174)) 'T)))) 

(SDEFUN |FC;assign;SV$;85|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|Integer|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 177)) NIL)))) 

(SDEFUN |FC;assign;SV$;86|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|Float|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 180)) 'T)))) 

(SDEFUN |FC;assign;SV$;87|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|Complex| (|Float|))))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 183)) 'T)))) 

(SDEFUN |FC;assign;SLE$;88|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|Integer|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS NIL (SPADCALL |rhs| (QREFELT $ 110))))))) 

(SDEFUN |FC;assign;SLE$;89|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|Float|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 113))))))) 

(SDEFUN |FC;assign;SLE$;90|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|Complex| (|Float|))) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 116))))))) 

(SDEFUN |FC;assign;SE$;91|
        ((|v| |Symbol|) (|rhs| |Expression| (|Integer|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS NIL (SPADCALL |rhs| (QREFELT $ 110))))))) 

(SDEFUN |FC;assign;SE$;92|
        ((|v| |Symbol|) (|rhs| |Expression| (|Float|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 113))))))) 

(SDEFUN |FC;assign;SE$;93|
        ((|v| |Symbol|) (|rhs| |Expression| (|Complex| (|Float|))) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 116))))))) 

(SDEFUN |FC;call;S$;94| ((|s| |String|) ($ $))
        (CONS (CONS 6 "call") (CONS 7 |s|))) 

(DECLAIM (NOTINLINE |FortranCode;|)) 

(DEFUN |FortranCode| ()
  (SPROG NIL
         (PROG (#1=#:G2928)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FortranCode|)
                    . #2=(|FortranCode|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FortranCode|
                             (LIST (CONS NIL (CONS 1 (|FortranCode;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|FortranCode|)))))))))) 

(DEFUN |FortranCode;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FortranCode|) . #1=(|FortranCode|))
          (LETT $ (GETREFV 193) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FortranCode| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 33
                    (|Record|
                     (|:| |op|
                          (|Union| (|:| |Null| #2="null")
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
                          (|Union| (|:| |nullBranch| #2#)
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
              (|Record| (|:| |var| 7) (|:| |arrayIndex| 67) (|:| |rand| 46))
              (|Record| (|:| |var| 7) (|:| |rand| 6) (|:| |ints2Floats?| 12))
              (|Record| (|:| |switch| 56) (|:| |thenClause| $)
                        (|:| |elseClause| $))
              (|Record| (|:| |empty?| 12) (|:| |value| 46))
              (|Record| (|:| |range| 70) (|:| |span| 38) (|:| |body| $))
              (|Record| (|:| |switch| 56) (|:| |body| $))
              (|Record| (|:| |name| 7) (|:| |contents| 83))
              (|Union| (|:| |nullBranch| '"null") (|:| |assignmentBranch| 47)
                       (|:| |arrayAssignmentBranch| 48)
                       (|:| |conditionalBranch| 49) (|:| |returnBranch| 50)
                       (|:| |blockBranch| 9) (|:| |commentBranch| 11)
                       (|:| |callBranch| 25) (|:| |forBranch| 51)
                       (|:| |labelBranch| 34) (|:| |loopBranch| 52)
                       (|:| |commonBranch| 53) (|:| |printBranch| 65))
              |FC;code;$U;38| (|Switch|) (103 . |coerce|) (108 . >)
              (114 . |get_fort_indent|) (118 . |hspace|) (123 . NOT)
              |FC;gotoJump;Si$;48| (128 . |concat|) (133 . |coerce|) (|List| 6)
              (|Mapping| 6 38) (|List| 38) (|ListFunctions2| 38 6)
              (138 . |map|) (|SegmentBinding| 38) (144 . |variable|)
              (|FortranType|) (149 . |fortranInteger|) (|TheSymbolTable|)
              (153 . |declare!|) (|Segment| 38) (159 . |segment|) (164 . |low|)
              (169 . |high|) (174 . |displayLines|) (179 . |void|)
              |FC;printCode;$V;37| (|List| 7) |FC;common;SL$;40| |FC;stop;$;41|
              |FC;save;$;42| |FC;printStatement;L$;43| |FC;comment;L$;44|
              (183 . |list|) |FC;comment;S$;45| (188 . |incr|) (193 . |coerce|)
              |FC;forLoop;Sb2$;46| |FC;forLoop;SbP2$;47| |FC;continue;Si$;49|
              |FC;whileLoop;S2$;50| |FC;repeatUntilLoop;S2$;51| (198 . |Zero|)
              |FC;returns;$;52| (|Expression| (|MachineInteger|))
              (202 . |coerce|) |FC;returns;E$;53|
              (|Expression| (|MachineFloat|)) (207 . |coerce|)
              |FC;returns;E$;54| (|Expression| (|MachineComplex|))
              (212 . |coerce|) |FC;returns;E$;55| (|Expression| 17)
              (217 . |coerce|) |FC;returns;E$;56| (|Expression| (|Float|))
              (222 . |coerce|) |FC;returns;E$;57|
              (|Expression| (|Complex| (|Float|))) (227 . |coerce|)
              |FC;returns;E$;58| |FC;block;L$;59| |FC;cond;S2$;60|
              |FC;cond;S3$;61| (232 . |coerce|) |FC;coerce;$Of;62|
              (237 . |coerce|) |FC;assign;SS$;63| (|Matrix| (|MachineInteger|))
              (242 . |coerce|) |FC;assign;SM$;64| (|Matrix| (|MachineFloat|))
              (247 . |coerce|) |FC;assign;SM$;65| (|Matrix| (|MachineComplex|))
              (252 . |coerce|) |FC;assign;SM$;66| (|Vector| (|MachineInteger|))
              (257 . |coerce|) |FC;assign;SV$;67| (|Vector| (|MachineFloat|))
              (262 . |coerce|) |FC;assign;SV$;68| (|Vector| (|MachineComplex|))
              (267 . |coerce|) |FC;assign;SV$;69| (|Matrix| 100)
              (272 . |coerce|) |FC;assign;SM$;70| (|Matrix| 103)
              (277 . |coerce|) |FC;assign;SM$;71| (|Matrix| 106)
              (282 . |coerce|) |FC;assign;SM$;72| (|Vector| 100)
              (287 . |coerce|) |FC;assign;SV$;73| (|Vector| 103)
              (292 . |coerce|) |FC;assign;SV$;74| (|Vector| 106)
              (297 . |coerce|) |FC;assign;SV$;75| |FC;assign;SLE$;76|
              |FC;assign;SLE$;77| |FC;assign;SLE$;78| |FC;assign;SE$;79|
              |FC;assign;SE$;80| |FC;assign;SE$;81| (|Matrix| 109)
              (302 . |coerce|) |FC;assign;SM$;82| (|Matrix| 112)
              (307 . |coerce|) |FC;assign;SM$;83| (|Matrix| 115)
              (312 . |coerce|) |FC;assign;SM$;84| (|Vector| 109)
              (317 . |coerce|) |FC;assign;SV$;85| (|Vector| 112)
              (322 . |coerce|) |FC;assign;SV$;86| (|Vector| 115)
              (327 . |coerce|) |FC;assign;SV$;87| |FC;assign;SLE$;88|
              |FC;assign;SLE$;89| |FC;assign;SLE$;90| |FC;assign;SE$;91|
              |FC;assign;SE$;92| |FC;assign;SE$;93| |FC;call;S$;94|
              (|HashState|))
           '#(~= 332 |whileLoop| 338 |stop| 344 |setLabelValue| 348 |save| 353
              |returns| 357 |repeatUntilLoop| 391 |printStatement| 397
              |printCode| 402 |operation| 407 |latex| 412 |hashUpdate!| 417
              |hash| 423 |gotoJump| 428 |getCode| 433 |forLoop| 438 |continue|
              451 |cond| 456 |common| 469 |comment| 475 |coerce| 485 |code| 490
              |call| 495 |block| 500 |assign| 505 = 697)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 6))
                        (|makeByteWordVec2| 192
                                            '(1 7 6 0 8 2 6 0 0 9 10 2 13 11 6
                                              12 14 1 13 11 6 15 1 13 16 17 18
                                              2 11 0 0 0 19 1 13 11 20 21 1 13
                                              11 11 22 1 23 0 17 24 2 25 0 0 23
                                              26 3 13 11 27 6 12 28 2 11 0 0 29
                                              30 2 13 11 12 20 31 1 7 25 0 32 1
                                              34 0 17 35 0 38 0 39 2 11 25 0 17
                                              40 1 13 11 6 41 1 13 16 17 42 1
                                              56 6 0 57 2 29 12 0 0 58 0 13 17
                                              59 1 6 0 17 60 1 56 0 0 61 1 11 0
                                              9 63 1 38 6 0 64 2 68 65 66 67 69
                                              1 70 7 0 71 0 72 0 73 2 74 72 7
                                              72 75 1 70 76 0 77 1 76 38 0 78 1
                                              76 38 0 79 1 13 16 11 80 0 16 0
                                              81 1 11 0 25 89 1 76 17 0 91 1 38
                                              0 17 92 0 38 0 98 1 100 6 0 101 1
                                              103 6 0 104 1 106 6 0 107 1 109 6
                                              0 110 1 112 6 0 113 1 115 6 0 116
                                              1 44 6 0 121 1 25 6 0 123 1 125 6
                                              0 126 1 128 6 0 129 1 131 6 0 132
                                              1 134 6 0 135 1 137 6 0 138 1 140
                                              6 0 141 1 143 6 0 144 1 146 6 0
                                              147 1 149 6 0 150 1 152 6 0 153 1
                                              155 6 0 156 1 158 6 0 159 1 167 6
                                              0 168 1 170 6 0 171 1 173 6 0 174
                                              1 176 6 0 177 1 179 6 0 180 1 182
                                              6 0 183 2 0 12 0 0 1 2 0 0 56 0
                                              96 0 0 0 85 1 0 34 34 37 0 0 0 86
                                              1 0 0 115 117 1 0 0 112 114 1 0 0
                                              109 111 1 0 0 100 102 1 0 0 106
                                              108 0 0 0 99 1 0 0 103 105 2 0 0
                                              56 0 97 1 0 0 65 87 1 0 16 0 82 1
                                              0 44 0 45 1 0 25 0 1 2 0 192 192
                                              0 1 1 0 34 0 1 1 0 0 34 62 1 0 11
                                              0 43 3 0 0 70 38 0 94 2 0 0 70 0
                                              93 1 0 0 34 95 3 0 0 56 0 0 120 2
                                              0 0 56 0 119 2 0 0 7 83 84 1 0 0
                                              11 88 1 0 0 25 90 1 0 6 0 122 1 0
                                              54 0 55 1 0 0 25 191 1 0 0 9 118
                                              3 0 0 7 67 112 186 3 0 0 7 67 115
                                              187 2 0 0 7 182 184 3 0 0 7 67
                                              109 185 2 0 0 7 176 178 2 0 0 7
                                              179 181 2 0 0 7 170 172 2 0 0 7
                                              173 175 2 0 0 7 115 190 2 0 0 7
                                              167 169 2 0 0 7 109 188 2 0 0 7
                                              112 189 3 0 0 7 67 103 162 3 0 0
                                              7 67 106 163 2 0 0 7 158 160 3 0
                                              0 7 67 100 161 2 0 0 7 152 154 2
                                              0 0 7 155 157 2 0 0 7 146 148 2 0
                                              0 7 149 151 2 0 0 7 140 142 2 0 0
                                              7 143 145 2 0 0 7 134 136 2 0 0 7
                                              137 139 2 0 0 7 128 130 2 0 0 7
                                              131 133 2 0 0 7 106 166 2 0 0 7
                                              125 127 2 0 0 7 100 164 2 0 0 7
                                              103 165 2 0 0 7 25 124 2 0 12 0 0
                                              1)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranCode| 'NILADIC T) 
