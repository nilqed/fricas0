
(DECLAIM (NOTINLINE |ModularFactorization;|)) 

(DEFUN |ModularFactorization;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ModularFactorization|))
          (LETT % (GETREFV 13))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ModularFactorization| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |ModularFactorization| ()
  (SPROG NIL
         (PROG (#1=#:G8)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ModularFactorization|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ModularFactorization|
                             (LIST
                              (CONS NIL (CONS 1 (|ModularFactorization;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|ModularFactorization|)))))))))) 

(MAKEPROP '|ModularFactorization| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|ModularFactorizationGeneral| 9 (|U32Matrix|) 10
                                             (|List|
                                              (|Record|
                                               (|:| |ind|
                                                    (|NonNegativeInteger|))
                                               (|:| |poly| 9)))
                                             (|ModularFactorizationTools1|))
              (|Mapping| 12)
              (|Record| (|:| |poly| 9) (|:| |degree| (|NonNegativeInteger|))
                        (|:| |separate_factors| 6))
              (|List| 7) (|U32Vector|) (|Integer|) (|Boolean|) (|List| 9))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|mfactor|
                                 ((|List| #1=(|U32Vector|)) #1#
                                  #2=(|Integer|)))
                                T)
                              '((|ddfact|
                                 ((|List|
                                   (|Record| (|:| |poly| #1#)
                                             (|:| |degree|
                                                  (|NonNegativeInteger|))
                                             (|:| |separate_factors|
                                                  (|Mapping| (|List| #1#)))))
                                  #1# #2#))
                                T)
                              '((|irreducible?| ((|Boolean|) #1# #2#)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
