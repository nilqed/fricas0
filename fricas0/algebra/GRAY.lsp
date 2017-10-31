
(SDEFUN |GRAY;firstSubsetGray;PiV;1|
        ((|n| |PositiveInteger|) ($ |Vector| (|Vector| (|Integer|))))
        (SPROG
         ((#1=#:G697 NIL) (|i| NIL) (|vv| (|Vector| (|Vector| (|Integer|)))))
         (SEQ (LETT |vv| (MAKEARR1 2 #()) . #2=(|GRAY;firstSubsetGray;PiV;1|))
              (SPADCALL |vv| 1 (MAKEARR1 |n| 0) (QREFELT $ 9))
              (SPADCALL |vv| 2 (MAKEARR1 (+ |n| 1) 1) (QREFELT $ 9))
              (SEQ (LETT |i| 1 . #2#) (LETT #1# (+ |n| 1) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL (SPADCALL |vv| 2 (QREFELT $ 10)) |i| |i|
                               (QREFELT $ 11))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |vv|)))) 

(SDEFUN |GRAY;nextSubsetGray;VPiV;2|
        ((|vv| |Vector| (|Vector| (|Integer|))) (|n| |PositiveInteger|)
         ($ |Vector| (|Vector| (|Integer|))))
        (SPROG
         ((|c| (|Integer|)) (|lab| #1=(|Vector| (|Integer|))) (|subs| #1#))
         (SEQ
          (LETT |subs| (SPADCALL |vv| 1 (QREFELT $ 10))
                . #2=(|GRAY;nextSubsetGray;VPiV;2|))
          (LETT |lab| (SPADCALL |vv| 2 (QREFELT $ 10)) . #2#)
          (LETT |c| (SPADCALL |lab| 1 (QREFELT $ 14)) . #2#)
          (SPADCALL |lab| 1 1 (QREFELT $ 11))
          (COND
           ((EQL (SPADCALL |subs| |c| (QREFELT $ 14)) 0)
            (SPADCALL |subs| |c| 1 (QREFELT $ 11)))
           ('T (SPADCALL |subs| |c| 0 (QREFELT $ 11))))
          (SPADCALL |lab| |c| (SPADCALL |lab| (+ |c| 1) (QREFELT $ 14))
                    (QREFELT $ 11))
          (SPADCALL |lab| (+ |c| 1) (+ |c| 1) (QREFELT $ 11)) (EXIT |vv|)))) 

(DECLAIM (NOTINLINE |GrayCode;|)) 

(DEFUN |GrayCode| ()
  (SPROG NIL
         (PROG (#1=#:G702)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|GrayCode|)
                    . #2=(|GrayCode|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|GrayCode|
                             (LIST (CONS NIL (CONS 1 (|GrayCode;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|GrayCode|)))))))))) 

(DEFUN |GrayCode;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GrayCode|) . #1=(|GrayCode|))
          (LETT $ (GETREFV 16) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|GrayCode| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|GrayCode| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Vector| 7) (|Integer|) (|Vector| 6)
              (0 . |setelt!|) (7 . |elt|) (13 . |setelt!|) (|PositiveInteger|)
              |GRAY;firstSubsetGray;PiV;1| (20 . |elt|)
              |GRAY;nextSubsetGray;VPiV;2|)
           '#(|nextSubsetGray| 26 |firstSubsetGray| 32) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 15
                                                 '(3 8 6 0 7 6 9 2 8 6 0 7 10 3
                                                   6 7 0 7 7 11 2 6 7 0 7 14 2
                                                   0 8 8 12 15 1 0 8 12 13)))))
           '|lookupComplete|)) 

(MAKEPROP '|GrayCode| 'NILADIC T) 
