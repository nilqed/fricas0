
(SDEFUN |TYPED;var;S$;1| ((|n| |String|) ($ $))
        (CONS |n| (SPADCALL (QREFELT $ 8)))) 

(PUT '|TYPED;var;SIl$;2| '|SPADreplace| 'CONS) 

(SDEFUN |TYPED;var;SIl$;2| ((|n| |String|) (|t| |ILogic|) ($ $)) (CONS |n| |t|)) 

(PUT '|TYPED;getName;$S;3| '|SPADreplace| 'QCAR) 

(SDEFUN |TYPED;getName;$S;3| ((|v| $) ($ |String|)) (QCAR |v|)) 

(PUT '|TYPED;getType;$Il;4| '|SPADreplace| 'QCDR) 

(SDEFUN |TYPED;getType;$Il;4| ((|v| $) ($ |ILogic|)) (QCDR |v|)) 

(SDEFUN |TYPED;toString;$S;5| ((|v| $) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ
                (LETT |s|
                      (SPADCALL
                       (LIST (QCAR |v|) ":"
                             (SPADCALL (QCDR |v|) (QREFELT $ 14)))
                       (QREFELT $ 16))
                      |TYPED;toString;$S;5|)
                (EXIT |s|)))) 

(SDEFUN |TYPED;parseVarTerm;SNniR;6|
        ((|t1| |String|) (|pin| |NonNegativeInteger|)
         ($ |Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|))))
        (SPROG
         ((#1=#:G720 NIL) (|pt| (|NonNegativeInteger|))
          (|r|
           (|Record| (|:| |rft| (|ILogic|))
                     (|:| |pout| (|NonNegativeInteger|))))
          (|ch| (|Character|)) (|vnm| (|String|)))
         (SEQ
          (EXIT
           (SEQ (LETT |vnm| "" . #2=(|TYPED;parseVarTerm;SNniR;6|))
                (LETT |pt| |pin| . #2#) (LETT |ch| (STR_ELT1 |t1| |pt|) . #2#)
                (SEQ G190
                     (COND ((NULL (SPADCALL |ch| (QREFELT $ 20))) (GO G191)))
                     (SEQ
                      (LETT |vnm| (SPADCALL |vnm| |ch| (QREFELT $ 21)) . #2#)
                      (LETT |pt| (+ |pt| 1) . #2#)
                      (COND
                       ((SPADCALL |pt| (SPADCALL |t1| (QREFELT $ 23))
                                  (QREFELT $ 24))
                        (PROGN
                         (LETT #1# (CONS (SPADCALL |vnm| (QREFELT $ 10)) |pt|)
                               . #2#)
                         (GO #3=#:G719))))
                      (EXIT (LETT |ch| (STR_ELT1 |t1| |pt|) . #2#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 ((|eql_SI| |ch| (|STR_to_CHAR| ":"))
                  (SEQ (LETT |pt| (+ |pt| 1) . #2#)
                       (COND
                        ((SPADCALL |pt| (SPADCALL |t1| (QREFELT $ 23))
                                   (QREFELT $ 24))
                         (PROGN
                          (LETT #1# (CONS (SPADCALL |vnm| (QREFELT $ 10)) |pt|)
                                . #2#)
                          (GO #3#))))
                       (LETT |r| (SPADCALL |t1| |pt| (QREFELT $ 27)) . #2#)
                       (LETT |pt| (QCDR |r|) . #2#)
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (CONS (SPADCALL |vnm| (QCAR |r|) (QREFELT $ 11))
                                     |pt|)
                               . #2#)
                         (GO #3#))))))
                (EXIT (CONS (SPADCALL |vnm| (QREFELT $ 10)) |pt|))))
          #3# (EXIT #1#)))) 

(SDEFUN |TYPED;parseVar;S$;7| ((|t1| |String|) ($ $))
        (SPROG
         ((|r| (|Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|)))))
         (SEQ (LETT |r| (SPADCALL |t1| 1 (QREFELT $ 28)) |TYPED;parseVar;S$;7|)
              (EXIT (QCAR |r|))))) 

(SDEFUN |TYPED;=;2$B;8| ((|x| $) (|y| $) ($ |Boolean|))
        (COND
         ((EQUAL (QCAR |x|) (QCAR |y|))
          (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 30)))
         ('T NIL))) 

(SDEFUN |TYPED;coerce;$Of;9| ((|n| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL |n| (QREFELT $ 17)) (QREFELT $ 33))) 

(DECLAIM (NOTINLINE |Typed;|)) 

(DEFUN |Typed| ()
  (SPROG NIL
         (PROG (#1=#:G729)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Typed|) . #2=(|Typed|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Typed|
                             (LIST (CONS NIL (CONS 1 (|Typed;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Typed|)))))))))) 

(DEFUN |Typed;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Typed|) . #1=(|Typed|))
          (LETT $ (GETREFV 35) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Typed| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |nme| (|String|)) (|:| |typ| (|ILogic|))))
          $))) 

(MAKEPROP '|Typed| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|ILogic|) (0 . |logicT|)
              (|String|) |TYPED;var;S$;1| |TYPED;var;SIl$;2|
              |TYPED;getName;$S;3| |TYPED;getType;$Il;4| (4 . |toString|)
              (|List| $) (9 . |concat|) |TYPED;toString;$S;5| (|Boolean|)
              (|Character|) (14 . |alphanumeric?|) (19 . |concat|) (|Integer|)
              (25 . |maxIndex|) (30 . >)
              (|Record| (|:| |rft| $) (|:| |pout| 26)) (|NonNegativeInteger|)
              (36 . |parseIL2|) |TYPED;parseVarTerm;SNniR;6|
              |TYPED;parseVar;S$;7| (42 . =) |TYPED;=;2$B;8| (|OutputForm|)
              (48 . |coerce|) |TYPED;coerce;$Of;9|)
           '#(|var| 53 |toString| 64 |parseVarTerm| 69 |parseVar| 75 |getType|
              80 |getName| 85 |coerce| 90 = 95)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(NIL NIL NIL)
                       (CONS '#((|VarCat|) (|Type|) (|CoercibleTo| 32))
                             (|makeByteWordVec2| 34
                                                 '(0 7 0 8 1 7 9 0 14 1 9 0 15
                                                   16 1 19 18 0 20 2 9 0 0 19
                                                   21 1 9 22 0 23 2 22 18 0 0
                                                   24 2 7 25 9 26 27 2 7 18 0 0
                                                   30 1 9 32 0 33 1 0 0 9 10 2
                                                   0 0 9 7 11 1 0 9 0 17 2 0 25
                                                   9 26 28 1 0 0 9 29 1 0 7 0
                                                   13 1 0 9 0 12 1 0 32 0 34 2
                                                   0 18 0 0 31)))))
           '|lookupComplete|)) 

(MAKEPROP '|Typed| 'NILADIC T) 
