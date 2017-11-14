
(SDEFUN |IPRNTPK;iprint;SV;1| ((|s| |String|) ($ |Void|))
        (SEQ (PRINC (SPADCALL |s| (QREFELT $ 8))) (EXIT (FORCE-OUTPUT)))) 

(DECLAIM (NOTINLINE |InternalPrintPackage;|)) 

(DEFUN |InternalPrintPackage| ()
  (SPROG NIL
         (PROG (#1=#:G711)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|InternalPrintPackage|)
                    . #2=(|InternalPrintPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|InternalPrintPackage|
                             (LIST
                              (CONS NIL (CONS 1 (|InternalPrintPackage;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|InternalPrintPackage|)))))))))) 

(DEFUN |InternalPrintPackage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|InternalPrintPackage|) . #1=(|InternalPrintPackage|))
          (LETT $ (GETREFV 11) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|InternalPrintPackage| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|InternalPrintPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|) (|Symbol|) (0 . |coerce|)
              (|Void|) |IPRNTPK;iprint;SV;1|)
           '#(|iprint| 5) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 10 '(1 7 0 6 8 1 0 9 6 10)))))
           '|lookupComplete|)) 

(MAKEPROP '|InternalPrintPackage| 'NILADIC T) 
