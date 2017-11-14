
(SDEFUN |UFD-;squareFreePart;2S;1| ((|x| S) ($ S))
        (SPROG
         ((#1=#:G721 NIL) (#2=#:G720 (S)) (#3=#:G722 (S)) (#4=#:G724 NIL)
          (|f| NIL) (|s| (|Factored| S)))
         (SEQ
          (SPADCALL
           (SPADCALL
            (LETT |s| (SPADCALL |x| (QREFELT $ 8))
                  . #5=(|UFD-;squareFreePart;2S;1|))
            (QREFELT $ 10))
           (PROGN
            (LETT #1# NIL . #5#)
            (SEQ (LETT |f| NIL . #5#)
                 (LETT #4# (SPADCALL |s| (QREFELT $ 13)) . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3# (QCAR |f|) . #5#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 14)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 15))))
           (QREFELT $ 14))))) 

(SDEFUN |UFD-;prime?;SB;2| ((|x| S) ($ |Boolean|))
        (EQL (LENGTH (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 21)))
             1)) 

(DECLAIM (NOTINLINE |UniqueFactorizationDomain&;|)) 

(DEFUN |UniqueFactorizationDomain&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|UniqueFactorizationDomain&|))
          (LETT |dv$| (LIST '|UniqueFactorizationDomain&| DV$1) . #1#)
          (LETT $ (GETREFV 24) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|UniqueFactorizationDomain&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Factored| $)
              (0 . |squareFree|) (|Factored| 6) (5 . |unit|)
              (|Record| (|:| |factor| 6) (|:| |exponent| (|Integer|)))
              (|List| 11) (10 . |factors|) (15 . *) (21 . |One|)
              |UFD-;squareFreePart;2S;1| (25 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 18) (|:| |fctr| 6) (|:| |xpnt| (|Integer|)))
              (|List| 19) (30 . |factorList|) (|Boolean|) |UFD-;prime?;SB;2|)
           '#(|squareFreePart| 35 |prime?| 40) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 23
                                                 '(1 6 7 0 8 1 9 6 0 10 1 9 12
                                                   0 13 2 6 0 0 0 14 0 6 0 15 1
                                                   6 7 0 17 1 9 20 0 21 1 0 0 0
                                                   16 1 0 22 0 23)))))
           '|lookupComplete|)) 
