
(SDEFUN |FCPAK1;zeroVector;SPFc;1|
        ((|fname| |Symbol|) (|n| |Polynomial| (|Integer|)) ($ |FortranCode|))
        (SPROG
         ((|fa| (|FortranCode|))
          (|indices| (|List| #1=(|Polynomial| (|Integer|)))) (|ip1| #1#)
          (|segbp1| (|SegmentBinding| (|Polynomial| (|Integer|))))
          (|segp1| (|Segment| (|Polynomial| (|Integer|))))
          (|hp1| (|Polynomial| (|Integer|))) (|lp1| (|Polynomial| (|Integer|)))
          (|i1| (|Symbol|)) (|ue| (|Expression| (|Integer|))))
         (SEQ
          (LETT |ue| (|spadConstant| $ 7) . #2=(|FCPAK1;zeroVector;SPFc;1|))
          (LETT |i1| 'I1 . #2#) (LETT |lp1| (|spadConstant| $ 9) . #2#)
          (LETT |hp1| |n| . #2#)
          (LETT |segp1| (SPADCALL |lp1| |hp1| (QREFELT $ 11)) . #2#)
          (LETT |segbp1| (SPADCALL |i1| |segp1| (QREFELT $ 14)) . #2#)
          (LETT |ip1| (SPADCALL |i1| (QREFELT $ 15)) . #2#)
          (LETT |indices| (LIST |ip1|) . #2#)
          (LETT |fa|
                (SPADCALL |segbp1|
                          (SPADCALL |fname| |indices| |ue| (QREFELT $ 18))
                          (QREFELT $ 19))
                . #2#)
          (EXIT |fa|)))) 

(SDEFUN |FCPAK1;zeroMatrix;S2PFc;2|
        ((|fname| |Symbol|) (|m| |Polynomial| (|Integer|))
         (|n| |Polynomial| (|Integer|)) ($ |FortranCode|))
        (SPROG
         ((|fa| (|FortranCode|))
          (|indices| (|List| #1=(|Polynomial| (|Integer|)))) (|ip2| #1#)
          (|ip1| (|Polynomial| (|Integer|)))
          (|segbp2| #2=(|SegmentBinding| (|Polynomial| (|Integer|))))
          (|segp2| #3=(|Segment| (|Polynomial| (|Integer|))))
          (|hp2| (|Polynomial| (|Integer|))) (|i2| (|Symbol|)) (|segbp1| #2#)
          (|segp1| #3#) (|hp1| (|Polynomial| (|Integer|)))
          (|lp1| (|Polynomial| (|Integer|))) (|i1| (|Symbol|))
          (|ue| (|Expression| (|Integer|))))
         (SEQ
          (LETT |ue| (|spadConstant| $ 7) . #4=(|FCPAK1;zeroMatrix;S2PFc;2|))
          (LETT |i1| 'I1 . #4#) (LETT |lp1| (|spadConstant| $ 9) . #4#)
          (LETT |hp1| |m| . #4#)
          (LETT |segp1| (SPADCALL |lp1| |hp1| (QREFELT $ 11)) . #4#)
          (LETT |segbp1| (SPADCALL |i1| |segp1| (QREFELT $ 14)) . #4#)
          (LETT |i2| 'I2 . #4#) (LETT |hp2| |n| . #4#)
          (LETT |segp2| (SPADCALL |lp1| |hp2| (QREFELT $ 11)) . #4#)
          (LETT |segbp2| (SPADCALL |i2| |segp2| (QREFELT $ 14)) . #4#)
          (LETT |ip1| (SPADCALL |i1| (QREFELT $ 15)) . #4#)
          (LETT |ip2| (SPADCALL |i2| (QREFELT $ 15)) . #4#)
          (LETT |indices| (LIST |ip1| |ip2|) . #4#)
          (LETT |fa|
                (SPADCALL |segbp1|
                          (SPADCALL |segbp2|
                                    (SPADCALL |fname| |indices| |ue|
                                              (QREFELT $ 18))
                                    (QREFELT $ 19))
                          (QREFELT $ 19))
                . #4#)
          (EXIT |fa|)))) 

(SDEFUN |FCPAK1;zeroMatrix;S2SbFc;3|
        ((|fname| |Symbol|)
         (|segbp1| |SegmentBinding| (|Polynomial| (|Integer|)))
         (|segbp2| |SegmentBinding| (|Polynomial| (|Integer|)))
         ($ |FortranCode|))
        (SPROG
         ((|fa| (|FortranCode|))
          (|indices| (|List| #1=(|Polynomial| (|Integer|)))) (|ip2| #1#)
          (|ip1| (|Polynomial| (|Integer|))) (|i2| #2=(|Symbol|)) (|i1| #2#)
          (|ue| (|Expression| (|Integer|))))
         (SEQ
          (LETT |ue| (|spadConstant| $ 7) . #3=(|FCPAK1;zeroMatrix;S2SbFc;3|))
          (LETT |i1| (SPADCALL |segbp1| (QREFELT $ 22)) . #3#)
          (LETT |i2| (SPADCALL |segbp2| (QREFELT $ 22)) . #3#)
          (LETT |ip1| (SPADCALL |i1| (QREFELT $ 15)) . #3#)
          (LETT |ip2| (SPADCALL |i2| (QREFELT $ 15)) . #3#)
          (LETT |indices| (LIST |ip1| |ip2|) . #3#)
          (LETT |fa|
                (SPADCALL |segbp1|
                          (SPADCALL |segbp2|
                                    (SPADCALL |fname| |indices| |ue|
                                              (QREFELT $ 18))
                                    (QREFELT $ 19))
                          (QREFELT $ 19))
                . #3#)
          (EXIT |fa|)))) 

(SDEFUN |FCPAK1;zeroSquareMatrix;SPFc;4|
        ((|fname| |Symbol|) (|n| |Polynomial| (|Integer|)) ($ |FortranCode|))
        (SPROG
         ((|fa| (|FortranCode|))
          (|indices| (|List| #1=(|Polynomial| (|Integer|)))) (|ip2| #1#)
          (|ip1| (|Polynomial| (|Integer|)))
          (|segbp2| #2=(|SegmentBinding| (|Polynomial| (|Integer|))))
          (|i2| (|Symbol|)) (|segbp1| #2#)
          (|segp1| (|Segment| (|Polynomial| (|Integer|))))
          (|hp1| (|Polynomial| (|Integer|))) (|lp1| (|Polynomial| (|Integer|)))
          (|i1| (|Symbol|)) (|ue| (|Expression| (|Integer|))))
         (SEQ
          (LETT |ue| (|spadConstant| $ 7)
                . #3=(|FCPAK1;zeroSquareMatrix;SPFc;4|))
          (LETT |i1| 'I1 . #3#) (LETT |lp1| (|spadConstant| $ 9) . #3#)
          (LETT |hp1| |n| . #3#)
          (LETT |segp1| (SPADCALL |lp1| |hp1| (QREFELT $ 11)) . #3#)
          (LETT |segbp1| (SPADCALL |i1| |segp1| (QREFELT $ 14)) . #3#)
          (LETT |i2| 'I2 . #3#)
          (LETT |segbp2| (SPADCALL |i2| |segp1| (QREFELT $ 14)) . #3#)
          (LETT |ip1| (SPADCALL |i1| (QREFELT $ 15)) . #3#)
          (LETT |ip2| (SPADCALL |i2| (QREFELT $ 15)) . #3#)
          (LETT |indices| (LIST |ip1| |ip2|) . #3#)
          (LETT |fa|
                (SPADCALL |segbp1|
                          (SPADCALL |segbp2|
                                    (SPADCALL |fname| |indices| |ue|
                                              (QREFELT $ 18))
                                    (QREFELT $ 19))
                          (QREFELT $ 19))
                . #3#)
          (EXIT |fa|)))) 

(SDEFUN |FCPAK1;identitySquareMatrix;SPFc;5|
        ((|fname| |Symbol|) (|n| |Polynomial| (|Integer|)) ($ |FortranCode|))
        (SPROG
         ((|fa| #1=(|FortranCode|)) (|fl| (|List| #2=(|FortranCode|)))
          (|f1| #2#) (|fc| #1#)
          (|indices| (|List| #3=(|Polynomial| (|Integer|))))
          (|indice1| (|List| #4=(|Polynomial| (|Integer|)))) (|ip2| #3#)
          (|ip1| #4#)
          (|segbp2| #5=(|SegmentBinding| (|Polynomial| (|Integer|))))
          (|i2| (|Symbol|)) (|segbp1| #5#)
          (|segp1| (|Segment| (|Polynomial| (|Integer|))))
          (|hp1| (|Polynomial| (|Integer|))) (|lp1| (|Polynomial| (|Integer|)))
          (|i1| (|Symbol|)) (|u1| (|Expression| (|Integer|)))
          (|ue| (|Expression| (|Integer|))))
         (SEQ
          (LETT |ue| (|spadConstant| $ 7)
                . #6=(|FCPAK1;identitySquareMatrix;SPFc;5|))
          (LETT |u1| (|spadConstant| $ 25) . #6#) (LETT |i1| 'I1 . #6#)
          (LETT |lp1| (|spadConstant| $ 9) . #6#) (LETT |hp1| |n| . #6#)
          (LETT |segp1| (SPADCALL |lp1| |hp1| (QREFELT $ 11)) . #6#)
          (LETT |segbp1| (SPADCALL |i1| |segp1| (QREFELT $ 14)) . #6#)
          (LETT |i2| 'I2 . #6#)
          (LETT |segbp2| (SPADCALL |i2| |segp1| (QREFELT $ 14)) . #6#)
          (LETT |ip1| (SPADCALL |i1| (QREFELT $ 15)) . #6#)
          (LETT |ip2| (SPADCALL |i2| (QREFELT $ 15)) . #6#)
          (LETT |indice1| (LIST |ip1| |ip1|) . #6#)
          (LETT |indices| (LIST |ip1| |ip2|) . #6#)
          (LETT |fc|
                (SPADCALL |segbp2|
                          (SPADCALL |fname| |indices| |ue| (QREFELT $ 18))
                          (QREFELT $ 19))
                . #6#)
          (LETT |f1| (SPADCALL |fname| |indice1| |u1| (QREFELT $ 18)) . #6#)
          (LETT |fl| (LIST |fc| |f1|) . #6#)
          (LETT |fa|
                (SPADCALL |segbp1| (SPADCALL |fl| (QREFELT $ 27))
                          (QREFELT $ 19))
                . #6#)
          (EXIT |fa|)))) 

(DECLAIM (NOTINLINE |FortranCodePackage1;|)) 

(DEFUN |FortranCodePackage1| ()
  (SPROG NIL
         (PROG (#1=#:G711)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FortranCodePackage1|)
                    . #2=(|FortranCodePackage1|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FortranCodePackage1|
                             (LIST
                              (CONS NIL (CONS 1 (|FortranCodePackage1;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|FortranCodePackage1|)))))))))) 

(DEFUN |FortranCodePackage1;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FortranCodePackage1|) . #1=(|FortranCodePackage1|))
          (LETT $ (GETREFV 29) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FortranCodePackage1| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FortranCodePackage1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Expression| (|Integer|)) (0 . |Zero|)
              (|Polynomial| (|Integer|)) (4 . |One|) (|Segment| 8)
              (8 . |segment|) (|Symbol|) (|SegmentBinding| 8) (14 . |equation|)
              (20 . |coerce|) (|List| 8) (|FortranCode|) (25 . |assign|)
              (32 . |forLoop|) |FCPAK1;zeroVector;SPFc;1|
              |FCPAK1;zeroMatrix;S2PFc;2| (38 . |variable|)
              |FCPAK1;zeroMatrix;S2SbFc;3| |FCPAK1;zeroSquareMatrix;SPFc;4|
              (43 . |One|) (|List| $) (47 . |block|)
              |FCPAK1;identitySquareMatrix;SPFc;5|)
           '#(|zeroVector| 52 |zeroSquareMatrix| 58 |zeroMatrix| 64
              |identitySquareMatrix| 78)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(0 6 0 7 0 8 0 9 2 10 0 8 8
                                                   11 2 13 0 12 10 14 1 8 0 12
                                                   15 3 17 0 12 16 6 18 2 17 0
                                                   13 0 19 1 13 12 0 22 0 6 0
                                                   25 1 17 0 26 27 2 0 17 12 8
                                                   20 2 0 17 12 8 24 3 0 17 12
                                                   8 8 21 3 0 17 12 13 13 23 2
                                                   0 17 12 8 28)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranCodePackage1| 'NILADIC T) 
