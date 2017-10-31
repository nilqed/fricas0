
(PUT '|ANY;obj;$N;1| '|SPADreplace| 'QCDR) 

(SDEFUN |ANY;obj;$N;1| ((|x| $) ($ |None|)) (QCDR |x|)) 

(PUT '|ANY;dom;$Se;2| '|SPADreplace| 'QCAR) 

(SDEFUN |ANY;dom;$Se;2| ((|x| $) ($ |SExpression|)) (QCAR |x|)) 

(SDEFUN |ANY;domainOf;$Of;3| ((|x| $) ($ |OutputForm|))
        (|typeToOutputForm| (QCAR |x|))) 

(SDEFUN |ANY;=;2$B;4| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((|Dx| (|Type|)) (|dy| #1=(|SExpression|)) (|dx| #1#))
               (SEQ
                (LETT |dx| (SPADCALL |x| (QREFELT $ 14)) . #2=(|ANY;=;2$B;4|))
                (LETT |dy| (SPADCALL |y| (QREFELT $ 14)) . #2#)
                (EXIT
                 (COND ((SPADCALL |dx| |dy| (QREFELT $ 17)) NIL)
                       (#3='T
                        (SEQ (LETT |Dx| (|evalType| |dx|) . #2#)
                             (EXIT
                              (COND
                               ((|HasCategory| |Dx| '(|BasicType|))
                                (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                                          (SPADCALL |y| (QREFELT $ 12))
                                          (|compiledLookupCheck| '=
                                                                 (LIST
                                                                  (LIST
                                                                   '|Boolean|)
                                                                  '$ '$)
                                                                 |Dx|)))
                               (#3#
                                (EQ (SPADCALL |x| (QREFELT $ 12))
                                    (SPADCALL |y| (QREFELT $ 12))))))))))))) 

(SDEFUN |ANY;objectOf;$Of;5| ((|x| $) ($ |OutputForm|))
        (|spad2BootCoerce| (QCDR |x|) (QCAR |x|)
                           (SPADCALL '|OutputForm| (QREFELT $ 21)))) 

(SDEFUN |ANY;showTypeInOutput;BS;6| ((|b| |Boolean|) ($ |String|))
        (SEQ (SETELT $ 10 (SPADCALL |b| (QREFELT $ 9)))
             (EXIT
              (COND
               (|b|
                "Type of object will be displayed in output of a member of Any")
               ('T
                "Type of object will not be displayed in output of a member of Any"))))) 

(SDEFUN |ANY;coerce;$Of;7| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|dom1| (|List| (|OutputForm|))) (|p| (|SExpression|))
          (|obj1| (|OutputForm|)))
         (SEQ
          (LETT |obj1| (SPADCALL |x| (QREFELT $ 22)) . #1=(|ANY;coerce;$Of;7|))
          (COND
           ((NULL (SPADCALL (QREFELT $ 10) (QREFELT $ 25))) (EXIT |obj1|)))
          (LETT |dom1|
                (SEQ
                 (LETT |p| (|prefix2String| (|devaluate| (QCAR |x|))) . #1#)
                 (EXIT
                  (COND
                   ((SPADCALL |p| (QREFELT $ 26))
                    (SPADCALL |p| (QREFELT $ 28)))
                   ('T |p|))))
                . #1#)
          (EXIT (SPADCALL (CONS |obj1| (CONS ":" |dom1|)) (QREFELT $ 30)))))) 

(SDEFUN |ANY;any;SeN$;8| ((|domain| |SExpression|) (|object| |None|) ($ $))
        (SEQ
         (COND ((|isValidType| |domain|) (CONS |domain| |object|))
               (#1='T
                (SEQ (LETT |domain| (|devaluate| |domain|) |ANY;any;SeN$;8|)
                     (EXIT
                      (COND ((|isValidType| |domain|) (CONS |domain| |object|))
                            (#1#
                             (|error|
                              "function any must have a domain as first argument"))))))))) 

(DECLAIM (NOTINLINE |Any;|)) 

(DEFUN |Any| ()
  (SPROG NIL
         (PROG (#1=#:G726)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Any|) . #2=(|Any|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Any|
                             (LIST (CONS NIL (CONS 1 (|Any;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Any|)))))))))) 

(DEFUN |Any;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Any|) . #1=(|Any|))
          (LETT $ (GETREFV 35) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Any| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |dm| (|SExpression|)) (|:| |ob| (|None|))))
          (QSETREFV $ 10 (SPADCALL NIL (QREFELT $ 9)))
          $))) 

(MAKEPROP '|Any| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) (|Reference| 7)
              (0 . |ref|) '|printTypeInOutputP| (|None|) |ANY;obj;$N;1|
              (|SExpression|) |ANY;dom;$Se;2| (|OutputForm|)
              |ANY;domainOf;$Of;3| (5 . ~=) |ANY;=;2$B;4| (|Symbol|)
              (|List| 19) (11 . |list|) |ANY;objectOf;$Of;5| (|String|)
              |ANY;showTypeInOutput;BS;6| (16 . |deref|) (21 . |atom?|)
              (|List| 15) (26 . |list|) (|List| $) (31 . |hconcat|)
              |ANY;coerce;$Of;7| |ANY;any;SeN$;8| (|SingleInteger|)
              (|HashState|))
           '#(~= 36 |showTypeInOutput| 42 |objectOf| 47 |obj| 52 |latex| 57
              |hashUpdate!| 62 |hash| 68 |domainOf| 73 |dom| 78 |coerce| 83
              |any| 88 = 94)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 15))
                        (|makeByteWordVec2| 34
                                            '(1 8 0 7 9 2 13 7 0 0 17 1 20 0 19
                                              21 1 8 7 0 25 1 13 7 0 26 1 27 0
                                              15 28 1 15 0 29 30 2 0 7 0 0 1 1
                                              0 23 7 24 1 0 15 0 22 1 0 11 0 12
                                              1 0 23 0 1 2 0 34 34 0 1 1 0 33 0
                                              1 1 0 15 0 16 1 0 13 0 14 1 0 15
                                              0 31 2 0 0 13 11 32 2 0 7 0 0
                                              18)))))
           '|lookupComplete|)) 

(MAKEPROP '|Any| 'NILADIC T) 
