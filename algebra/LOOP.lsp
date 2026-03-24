
(SDEFUN |LOOP;loop;L%;1| ((|lis| (|List| (|NonNegativeInteger|))) (% (%)))
        (SPROG
         ((|li| #1=(|List| (|NonNegativeInteger|)))
          (|lx| #2=(|List| (|NonNegativeInteger|)))
          (|minValue| (|NonNegativeInteger|)) (|l2| #2#) (|l1| #1#)
          (#3=#:G17 NIL) (|x| NIL) (#4=#:G16 NIL))
         (SEQ
          (LETT |li|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |x| NIL) (LETT #3# |lis|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #4# (CONS |x| #4#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (EXIT
           (COND ((NULL |li|) (|error| "cannot form empty loop"))
                 ('T
                  (SEQ (LETT |minValue| (|SPADfirst| |li|)) (LETT |lx| NIL)
                       (LETT |l1| |li|) (LETT |l2| |lx|)
                       (SEQ G190 (COND ((NULL (NULL (NULL |li|))) (GO G191)))
                            (SEQ
                             (COND
                              ((< (|SPADfirst| |li|) |minValue|)
                               (SEQ (LETT |l1| |li|) (LETT |l2| |lx|)
                                    (EXIT
                                     (LETT |minValue| (|SPADfirst| |li|))))))
                             (LETT |lx| (CONS (|SPADfirst| |li|) |lx|))
                             (EXIT (LETT |li| (CDR |li|))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL (SPADCALL |l1| (REVERSE |l2|) (QREFELT % 8))
                                  (QREFELT % 9)))))))))) 

(SDEFUN |LOOP;entries;%L;2| ((|lp| (%)) (% (|List| (|NonNegativeInteger|))))
        (SPADCALL |lp| (QREFELT % 11))) 

(PUT '|LOOP;hash| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |LOOP;hash| ((|s| (%)) (% (|SingleInteger|))) 0) 

(SDEFUN |LOOP;=;2%B;4| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G26 NIL) (#2=#:G27 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT % 14))
                              (SPADCALL |y| (QREFELT % 14)) (QREFELT % 16))
                    (PROGN (LETT #1# NIL) (GO #3=#:G25))))
                  (SEQ (LETT |i| 1) (LETT #2# (SPADCALL |x| (QREFELT % 14)))
                       G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QAREF1 |x| (- |i| 1))
                                     (QAREF1 |y| (- |i| 1)) (QREFELT % 16))
                           (PROGN (LETT #1# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |LOOP;coerce;%Of;5| ((|lp| (%)) (% (|OutputForm|)))
        (SPROG
         ((|res| (|OutputForm|)) (|x| (|NonNegativeInteger|)) (#1=#:G33 NIL)
          (|i| NIL))
         (SEQ (LETT |res| (SPADCALL (QREFELT % 19)))
              (SEQ (LETT |i| 1) (LETT #1# (SPADCALL |lp| (QREFELT % 14))) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |x| (QAREF1 |lp| (- |i| 1)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL
                                (LIST |res| (SPADCALL '-> (QREFELT % 21))
                                      (SPADCALL |x| (QREFELT % 22)))
                                (QREFELT % 24)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 25)))))) 

(DECLAIM (NOTINLINE |Loop;|)) 

(DEFUN |Loop;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Loop|))
          (LETT % (GETREFV 28))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Loop| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|PrimitiveArray| (|NonNegativeInteger|)))
          %))) 

(DEFUN |Loop| ()
  (SPROG NIL
         (PROG (#1=#:G35)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Loop|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Loop|
                             (LIST (CONS NIL (CONS 1 (|Loop;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Loop|)))))))))) 

(MAKEPROP '|Loop| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 13) (0 . |concat|)
              (6 . |construct|) |LOOP;loop;L%;1| (11 . |entries|)
              |LOOP;entries;%L;2| (|NonNegativeInteger|) (16 . |#|) (|Boolean|)
              (21 . ~=) |LOOP;=;2%B;4| (|OutputForm|) (27 . |empty|) (|Symbol|)
              (31 . |outputForm|) (36 . |coerce|) (|List| %) (41 . |hconcat|)
              (46 . |bracket|) |LOOP;coerce;%Of;5| (|String|))
           '#(~= 51 |loop| 57 |latex| 62 |entries| 67 |coerce| 72 = 77) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 18) (|BasicType|))
                        (|makeByteWordVec2| 27
                                            '(2 7 0 0 0 8 1 6 0 7 9 1 6 7 0 11
                                              1 6 13 0 14 2 13 15 0 0 16 0 18 0
                                              19 1 18 0 20 21 1 13 18 0 22 1 18
                                              0 23 24 1 18 0 0 25 2 0 15 0 0 1
                                              1 0 0 7 10 1 0 27 0 1 1 0 7 0 12
                                              1 0 18 0 26 2 0 15 0 0 17)))))
           '|lookupComplete|)) 
