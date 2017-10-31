
(PUT '|UNTYPED;var;S$;1| '|SPADreplace| 'LIST) 

(SDEFUN |UNTYPED;var;S$;1| ((|n| |String|) ($ $)) (LIST |n|)) 

(PUT '|UNTYPED;var;SIl$;2| '|SPADreplace| '(XLAM (|n| |t|) (LIST |n|))) 

(SDEFUN |UNTYPED;var;SIl$;2| ((|n| |String|) (|t| |ILogic|) ($ $)) (LIST |n|)) 

(PUT '|UNTYPED;getName;$S;3| '|SPADreplace| 'QCAR) 

(SDEFUN |UNTYPED;getName;$S;3| ((|v| $) ($ |String|)) (QCAR |v|)) 

(SDEFUN |UNTYPED;getType;$Il;4| ((|v| $) ($ |ILogic|))
        (SPADCALL (QREFELT $ 12))) 

(PUT '|UNTYPED;toString;$S;5| '|SPADreplace| 'QCAR) 

(SDEFUN |UNTYPED;toString;$S;5| ((|v| $) ($ |String|)) (QCAR |v|)) 

(SDEFUN |UNTYPED;parseVarTerm;SNniR;6|
        ((|t1| |String|) (|pin| |NonNegativeInteger|)
         ($ |Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|))))
        (SPROG
         ((|pt| (|NonNegativeInteger|))
          (|r|
           (|Record| (|:| |rft| (|ILogic|))
                     (|:| |pout| (|NonNegativeInteger|))))
          (|ch| (|Character|)) (#1=#:G711 NIL) (|vnm| (|String|)))
         (SEQ
          (EXIT
           (SEQ (LETT |vnm| "" . #2=(|UNTYPED;parseVarTerm;SNniR;6|))
                (LETT |pt| |pin| . #2#) (LETT |ch| (STR_ELT1 |t1| |pt|) . #2#)
                (SEQ G190
                     (COND ((NULL (SPADCALL |ch| (QREFELT $ 17))) (GO G191)))
                     (SEQ
                      (LETT |vnm| (SPADCALL |vnm| |ch| (QREFELT $ 18)) . #2#)
                      (LETT |pt| (+ |pt| 1) . #2#)
                      (COND
                       ((SPADCALL |pt| (SPADCALL |t1| (QREFELT $ 20))
                                  (QREFELT $ 21))
                        (PROGN
                         (LETT #1# (CONS (SPADCALL |vnm| (QREFELT $ 8)) |pt|)
                               . #2#)
                         (GO #3=#:G710))))
                      (EXIT (LETT |ch| (STR_ELT1 |t1| |pt|) . #2#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 ((|eql_SI| |ch| (|STR_to_CHAR| ":"))
                  (SEQ (LETT |r| (SPADCALL |t1| |pt| (QREFELT $ 24)) . #2#)
                       (EXIT (LETT |pt| (QCDR |r|) . #2#)))))
                (EXIT (CONS (SPADCALL |vnm| (QREFELT $ 8)) |pt|))))
          #3# (EXIT #1#)))) 

(SDEFUN |UNTYPED;parseVar;S$;7| ((|t1| |String|) ($ $))
        (SPROG
         ((|r| (|Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |r| (SPADCALL |t1| 1 (QREFELT $ 25)) |UNTYPED;parseVar;S$;7|)
          (EXIT (QCAR |r|))))) 

(SDEFUN |UNTYPED;=;2$B;8| ((|x| $) (|y| $) ($ |Boolean|))
        (EQUAL (QCAR |x|) (QCAR |y|))) 

(SDEFUN |UNTYPED;coerce;$Of;9| ((|n| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL |n| (QREFELT $ 14)) (QREFELT $ 29))) 

(DECLAIM (NOTINLINE |Untyped;|)) 

(DEFUN |Untyped| ()
  (SPROG NIL
         (PROG (#1=#:G719)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Untyped|) . #2=(|Untyped|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Untyped|
                             (LIST (CONS NIL (CONS 1 (|Untyped;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Untyped|)))))))))) 

(DEFUN |Untyped;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Untyped|) . #1=(|Untyped|))
          (LETT $ (GETREFV 31) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Untyped| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|Record| (|:| |nme| (|String|))))
          $))) 

(MAKEPROP '|Untyped| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|String|) |UNTYPED;var;S$;1|
              (|ILogic|) |UNTYPED;var;SIl$;2| |UNTYPED;getName;$S;3|
              (0 . |logicT|) |UNTYPED;getType;$Il;4| |UNTYPED;toString;$S;5|
              (|Boolean|) (|Character|) (4 . |alphanumeric?|) (9 . |concat|)
              (|Integer|) (15 . |maxIndex|) (20 . >)
              (|Record| (|:| |rft| $) (|:| |pout| 23)) (|NonNegativeInteger|)
              (26 . |parseIL2|) |UNTYPED;parseVarTerm;SNniR;6|
              |UNTYPED;parseVar;S$;7| |UNTYPED;=;2$B;8| (|OutputForm|)
              (32 . |coerce|) |UNTYPED;coerce;$Of;9|)
           '#(|var| 37 |toString| 48 |parseVarTerm| 53 |parseVar| 59 |getType|
              64 |getName| 69 |coerce| 74 = 79)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(NIL NIL NIL)
                       (CONS '#((|VarCat|) (|Type|) (|CoercibleTo| 28))
                             (|makeByteWordVec2| 30
                                                 '(0 9 0 12 1 16 15 0 17 2 7 0
                                                   0 16 18 1 7 19 0 20 2 19 15
                                                   0 0 21 2 9 22 7 23 24 1 7 28
                                                   0 29 1 0 0 7 8 2 0 0 7 9 10
                                                   1 0 7 0 14 2 0 22 7 23 25 1
                                                   0 0 7 26 1 0 9 0 13 1 0 7 0
                                                   11 1 0 28 0 30 2 0 15 0 0
                                                   27)))))
           '|lookupComplete|)) 

(MAKEPROP '|Untyped| 'NILADIC T) 
