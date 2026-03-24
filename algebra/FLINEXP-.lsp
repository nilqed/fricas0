
(SDEFUN |FLINEXP-;*;SIS;1| ((|x| (S)) (|n| (|Integer|)) (% (S)))
        (SPADCALL |x| (SPADCALL (|spadConstant| % 8) |n| (QREFELT % 10))
                  (QREFELT % 11))) 

(SDEFUN |FLINEXP-;reducedSystem;MM;2|
        ((|m| (|Matrix| S)) (% (|Matrix| (|Integer|))))
        (SPADCALL (SPADCALL |m| (QREFELT % 15)) (QREFELT % 17))) 

(SDEFUN |FLINEXP-;reducedSystem;MVR;3|
        ((|m| (|Matrix| S)) (|v| (|Vector| S))
         (%
          (|Record| (|:| |mat| (|Matrix| (|Integer|)))
                    (|:| |vec| (|Vector| (|Integer|))))))
        (SPROG
         ((|rec| (|Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R)))))
         (SEQ (LETT |rec| (SPADCALL |m| |v| (QREFELT % 21)))
              (EXIT (SPADCALL (QCAR |rec|) (QCDR |rec|) (QREFELT % 23)))))) 

(DECLAIM (NOTINLINE |FullyLinearlyExplicitOver&;|)) 

(DEFUN |FullyLinearlyExplicitOver&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FullyLinearlyExplicitOver&| DV$1 DV$2))
          (LETT % (GETREFV 27))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND ((|domainEqual| |#2| (|Integer|)))
                ((|testBitVector| |pv$| 1)
                 (PROGN
                  (QSETREFV % 12
                            (CONS (|dispatchFunction| |FLINEXP-;*;SIS;1|) %))
                  (QSETREFV % 18
                            (CONS
                             (|dispatchFunction| |FLINEXP-;reducedSystem;MM;2|)
                             %))
                  (QSETREFV % 24
                            (CONS
                             (|dispatchFunction|
                              |FLINEXP-;reducedSystem;MVR;3|)
                             %)))))
          %))) 

(MAKEPROP '|FullyLinearlyExplicitOver&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (|Integer|) (4 . *) (10 . *) (16 . *) (|Matrix| 7) (|Matrix| %)
              (22 . |reducedSystem|) (|Matrix| 9) (27 . |reducedSystem|)
              (32 . |reducedSystem|)
              (|Record| (|:| |mat| 13) (|:| |vec| (|Vector| 7))) (|Vector| %)
              (37 . |reducedSystem|)
              (|Record| (|:| |mat| 16) (|:| |vec| (|Vector| 9)))
              (43 . |reducedSystem|) (49 . |reducedSystem|) (|PositiveInteger|)
              (|NonNegativeInteger|))
           '#(|reducedSystem| 55 * 66) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((* (|#1| |#1| (|Integer|))) T)
                                   '((* (|#1| (|Integer|) |#1|)) T)
                                   '((* (|#1| (|NonNegativeInteger|) |#1|)) T)
                                   '((|reducedSystem|
                                      ((|Matrix| (|Integer|)) (|Matrix| |#1|)))
                                     T)
                                   '((|reducedSystem|
                                      ((|Record|
                                        (|:| |mat| (|Matrix| (|Integer|)))
                                        (|:| |vec| (|Vector| (|Integer|))))
                                       (|Matrix| |#1|) (|Vector| |#1|)))
                                     T)
                                   '((|reducedSystem|
                                      ((|Record| (|:| |mat| (|Matrix| |#2|))
                                                 (|:| |vec| (|Vector| |#2|)))
                                       (|Matrix| |#1|) (|Vector| |#1|)))
                                     T)
                                   '((|reducedSystem|
                                      ((|Matrix| |#2|) (|Matrix| |#1|)))
                                     T)
                                   '((* (|#1| |#1| |#2|)) T)
                                   '((* (|#1| (|PositiveInteger|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 24
                                            '(0 7 0 8 2 7 0 0 9 10 2 6 0 0 7 11
                                              2 0 0 0 9 12 1 6 13 14 15 1 7 16
                                              14 17 1 0 16 14 18 2 6 19 14 20
                                              21 2 7 22 14 20 23 2 0 22 14 20
                                              24 2 0 22 14 20 24 1 0 16 14 18 2
                                              0 0 0 9 12)))))
           '|lookupComplete|)) 
