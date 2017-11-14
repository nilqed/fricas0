
(SDEFUN |FAGROUP;-;2$;1| ((|f| $) ($ $))
        (SPADCALL (ELT $ 8) |f| (QREFELT $ 10))) 

(SDEFUN |FAGROUP;inmax|
        ((|l| |List| (|Record| (|:| |gen| S) (|:| |exp| (|Integer|))))
         ($ |Record| (|:| |gen| S) (|:| |exp| (|Integer|))))
        (SPROG
         ((|mx| (|Record| (|:| |gen| S) (|:| |exp| (|Integer|))))
          (#1=#:G716 NIL) (|t| NIL))
         (SEQ (LETT |mx| (|SPADfirst| |l|) . #2=(|FAGROUP;inmax|))
              (SEQ (LETT |t| NIL . #2#) (LETT #1# (CDR |l|) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QCAR |mx|) (QCAR |t|) (QREFELT $ 13))
                       (LETT |mx| |t| . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |mx|)))) 

(SDEFUN |FAGROUP;<;2$B;3| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((|lc| ($)) (|tb| #1=(|Record| (|:| |gen| S) (|:| |exp| (|Integer|))))
          (|ta| #1#))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT $ 14))
            (COND ((SPADCALL |b| (QREFELT $ 14)) NIL)
                  (#2='T
                   (< 0
                      (QCDR
                       (|FAGROUP;inmax| (SPADCALL |b| (QREFELT $ 18)) $))))))
           (#2#
            (SEQ
             (LETT |ta| (|FAGROUP;inmax| (SPADCALL |a| (QREFELT $ 18)) $)
                   . #3=(|FAGROUP;<;2$B;3|))
             (EXIT
              (COND ((SPADCALL |b| (QREFELT $ 14)) (< (QCDR |ta|) 0))
                    (#2#
                     (SEQ
                      (LETT |tb|
                            (|FAGROUP;inmax| (SPADCALL |b| (QREFELT $ 18)) $)
                            . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL (QCAR |ta|) (QCAR |tb|) (QREFELT $ 13))
                         (< 0 (QCDR |tb|)))
                        ((SPADCALL (QCAR |tb|) (QCAR |ta|) (QREFELT $ 13))
                         (< (QCDR |ta|) 0))
                        ((< (QCDR |ta|) (QCDR |tb|)) 'T)
                        ((< (QCDR |tb|) (QCDR |ta|)) NIL)
                        (#2#
                         (SEQ
                          (LETT |lc|
                                (SPADCALL (QCDR |ta|) (QCAR |ta|)
                                          (QREFELT $ 19))
                                . #3#)
                          (EXIT
                           (SPADCALL (SPADCALL |a| |lc| (QREFELT $ 20))
                                     (SPADCALL |b| |lc| (QREFELT $ 20))
                                     (QREFELT $ 21))))))))))))))))) 

(DECLAIM (NOTINLINE |FreeAbelianGroup;|)) 

(DEFUN |FreeAbelianGroup| (#1=#:G738)
  (SPROG NIL
         (PROG (#2=#:G739)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FreeAbelianGroup|)
                                               '|domainEqualList|)
                    . #3=(|FreeAbelianGroup|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FreeAbelianGroup;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FreeAbelianGroup|)))))))))) 

(DEFUN |FreeAbelianGroup;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FreeAbelianGroup|))
          (LETT |dv$| (LIST '|FreeAbelianGroup| DV$1) . #1#)
          (LETT $ (GETREFV 31) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|OrderedSet|))
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedAbelianMonoid|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|FreeAbelianGroup| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 21 (CONS (|dispatchFunction| |FAGROUP;<;2$B;3|) $)))))
          $))) 

(MAKEPROP '|FreeAbelianGroup| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerFreeAbelianMonoid| 6 7 (NRTEVAL 1))
              (|local| |#1|) (|Integer|) (0 . -) (|Mapping| 7 7)
              (5 . |mapCoef|) |FAGROUP;-;2$;1| (|Boolean|) (11 . <)
              (17 . |zero?|) (22 . |Zero|)
              (|Record| (|:| |gen| 6) (|:| |exp| 7)) (|List| 16) (26 . |terms|)
              (31 . *) (37 . -) (43 . <) (|Union| 6 '"failed")
              (|NonNegativeInteger|) (|Mapping| 6 6) (|Union| $ '"failed")
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(|zero?| 49 |terms| 54 |mapCoef| 59 |Zero| 65 < 69 - 75 * 86) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 1))
                 (CONS
                  '#(|Module&| NIL NIL NIL |AbelianGroup&| NIL NIL
                     |AbelianMonoid&| |OrderedSet&| |AbelianSemiGroup&| NIL
                     |SetCategory&| |RetractableTo&| |BasicType&| NIL
                     |PartialOrder&|)
                  (CONS
                   '#((|Module| 7) (|BiModule| 7 7) (|RightModule| 7)
                      (|LeftModule| 7) (|AbelianGroup|)
                      (|FreeAbelianMonoidCategory| 6 7)
                      (|CancellationAbelianMonoid|) (|AbelianMonoid|)
                      (|OrderedSet|) (|AbelianSemiGroup|) (|Comparable|)
                      (|SetCategory|) (|RetractableTo| 6) (|BasicType|)
                      (|CoercibleTo| 30) (|PartialOrder|))
                   (|makeByteWordVec2| 21
                                       '(1 7 0 0 8 2 0 0 9 0 10 2 6 12 0 0 13 1
                                         0 12 0 14 0 0 0 15 1 0 17 0 18 2 0 0 7
                                         6 19 2 0 0 0 0 20 2 0 12 0 0 21 1 0 12
                                         0 14 1 0 17 0 18 2 0 0 9 0 10 0 0 0 15
                                         2 1 12 0 0 21 2 0 0 0 0 20 1 0 0 0 11
                                         2 0 0 7 6 19)))))
           '|lookupIncomplete|)) 
