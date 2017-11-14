
(SDEFUN |HOMOL;homologyGroup;2M$;1|
        ((|AInt| |Matrix| (|Integer|)) (|BInt| |Matrix| (|Integer|)) ($ $))
        (SPROG
         ((|kernelFree| (|List| (|Vector| (|Integer|))))
          (|v| (|Vector| (|Integer|))) (#1=#:G742 NIL) (|i| NIL)
          (|n_cols| #2=(|NonNegativeInteger|))
          (|n_rows| #3=(|NonNegativeInteger|))
          (|mFree| #4=(|Matrix| (|Integer|)))
          (|leftFree| #5=(|Matrix| (|Integer|)))
          (|smitFree|
           #6=(|Record| (|:| |Smith| (|Matrix| (|Integer|)))
                        (|:| |leftEqMat| (|Matrix| (|Integer|)))
                        (|:| |rightEqMat| (|Matrix| (|Integer|)))))
          (|augmented| (|Matrix| (|Integer|)))
          (|res|
           (|List|
            (|Record| (|:| |vec| (|Vector| (|Integer|)))
                      (|:| |ord| (|Integer|)))))
          (|g|
           (|Record| (|:| |vec| (|Vector| (|Integer|)))
                     (|:| |ord| (|Integer|))))
          (|order| (|Integer|)) (|r| (|Vector| (|Integer|))) (#7=#:G741 NIL)
          (|nr| NIL) (|mNCols| #2#) (|mNRows| #3#) (|leftNRows| #3#) (|m| #4#)
          (|left| #5#) (|smit| #6#) (|zero| (|Matrix| (|Integer|))))
         (SEQ
          (COND
           ((SPADCALL (ANROWS |AInt|) (ANCOLS |BInt|) (QREFELT $ 9))
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "homologyGroup validation error - A rows : "
                          (QREFELT $ 12))
                (SPADCALL (ANROWS |AInt|) (QREFELT $ 13)) (QREFELT $ 14))
               (SPADCALL "~= B cols : " (QREFELT $ 12)) (QREFELT $ 14))
              (SPADCALL (ANCOLS |BInt|) (QREFELT $ 13)) (QREFELT $ 14))
             (QREFELT $ 16)))
           ('T
            (SEQ
             (LETT |zero|
                   (SPADCALL (ANROWS |BInt|) (ANCOLS |AInt|) (QREFELT $ 18))
                   . #8=(|HOMOL;homologyGroup;2M$;1|))
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |BInt| |AInt| (QREFELT $ 19)) |zero|
                          (QREFELT $ 20))
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL "homologyGroup validation error - B*A ~= 0 : "
                              (QREFELT $ 12))
                    (SPADCALL (SPADCALL |BInt| |AInt| (QREFELT $ 19))
                              (QREFELT $ 21))
                    (QREFELT $ 14))
                   (SPADCALL "  ~= 0 : " (QREFELT $ 12)) (QREFELT $ 14))
                  (SPADCALL |zero| (QREFELT $ 21)) (QREFELT $ 14))
                 (QREFELT $ 16))))))))
          (LETT |res| NIL . #8#)
          (LETT |smit| (SPADCALL |AInt| (QREFELT $ 24)) . #8#)
          (LETT |left| (QVELT |smit| 1) . #8#)
          (LETT |m| (QVELT |smit| 0) . #8#)
          (LETT |leftNRows| (ANROWS |left|) . #8#)
          (LETT |mNRows| (ANROWS |m|) . #8#) (LETT |mNCols| (ANCOLS |m|) . #8#)
          (SEQ (LETT |nr| 1 . #8#) (LETT #7# |leftNRows| . #8#) G190
               (COND ((|greater_SI| |nr| #7#) (GO G191)))
               (SEQ (LETT |r| (SPADCALL |left| |nr| (QREFELT $ 27)) . #8#)
                    (LETT |order| 1 . #8#)
                    (COND
                     ((SPADCALL |nr| |mNRows| (QREFELT $ 28))
                      (COND
                       ((SPADCALL |nr| |mNCols| (QREFELT $ 28))
                        (LETT |order| (SPADCALL |m| |nr| |nr| (QREFELT $ 29))
                              . #8#)))))
                    (EXIT
                     (COND ((SPADCALL |order| 1 (QREFELT $ 30)) "iterate")
                           ('T
                            (SEQ (LETT |g| (CONS |r| |order|) . #8#)
                                 (EXIT
                                  (LETT |res|
                                        (SPADCALL |res| |g| (QREFELT $ 33))
                                        . #8#)))))))
               (LETT |nr| (|inc_SI| |nr|) . #8#) (GO G190) G191 (EXIT NIL))
          (LETT |augmented|
                (SPADCALL (SPADCALL |AInt| (QREFELT $ 34)) |BInt|
                          (QREFELT $ 35))
                . #8#)
          (LETT |smitFree| (SPADCALL |augmented| (QREFELT $ 24)) . #8#)
          (LETT |leftFree| (QVELT |smitFree| 1) . #8#)
          (LETT |mFree| (QVELT |smitFree| 0) . #8#)
          (LETT |n_rows| (ANROWS |mFree|) . #8#)
          (LETT |n_cols| (ANCOLS |mFree|) . #8#) (LETT |kernelFree| NIL . #8#)
          (SEQ (LETT |i| 1 . #8#) (LETT #1# |n_cols| . #8#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((OR (SPADCALL |i| |n_rows| (QREFELT $ 36))
                       (EQL (SPADCALL |mFree| |i| |i| (QREFELT $ 29)) 0))
                   (SEQ (LETT |v| (MAKEARR1 |n_cols| 0) . #8#)
                        (SPADCALL |v| |i| 1 (QREFELT $ 37))
                        (EXIT
                         (LETT |kernelFree|
                               (CONS
                                (SPADCALL (QVELT |smitFree| 2) |v|
                                          (QREFELT $ 38))
                                |kernelFree|)
                               . #8#)))))))
               (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |res| (NREVERSE |kernelFree|)))))) 

(SDEFUN |HOMOL;homology;LLL$;2|
        ((|torsionVec| |List| (|List| (|Integer|)))
         (|torsionOrd| |List| (|Integer|))
         (|free1| |List| (|List| (|Integer|))) ($ $))
        (SPROG
         ((|kernelFree| (|List| (|Vector| (|Integer|)))) (#1=#:G754 NIL)
          (|v| NIL) (#2=#:G753 NIL)
          (|res|
           (|List|
            (|Record| (|:| |vec| (|Vector| (|Integer|)))
                      (|:| |ord| (|Integer|)))))
          (|r3|
           (|Record| (|:| |vec| (|Vector| (|Integer|)))
                     (|:| |ord| (|Integer|))))
          (#3=#:G751 NIL) (|r1| NIL) (#4=#:G752 NIL) (|r2| NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |torsionVec|) (LENGTH |torsionOrd|)
                      (QREFELT $ 40))
            (|error|
             "attempt to construct homology with #torsionVec ~= #torsionOrd")))
          (LETT |res| NIL . #5=(|HOMOL;homology;LLL$;2|))
          (SEQ (LETT |r2| NIL . #5#) (LETT #4# |torsionOrd| . #5#)
               (LETT |r1| NIL . #5#) (LETT #3# |torsionVec| . #5#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |r1| (CAR #3#) . #5#) NIL)
                     (ATOM #4#) (PROGN (LETT |r2| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |r3| (CONS (SPADCALL |r1| (QREFELT $ 42)) |r2|) . #5#)
                (EXIT (LETT |res| (SPADCALL |res| |r3| (QREFELT $ 33)) . #5#)))
               (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #5#)) . #5#)
               (GO G190) G191 (EXIT NIL))
          (LETT |kernelFree|
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |v| NIL . #5#) (LETT #1# |free1| . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 42)) #2#)
                              . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #5#)
          (EXIT (CONS |res| |kernelFree|))))) 

(SDEFUN |HOMOL;homology0;$;3| (($ $)) (SPADCALL NIL NIL NIL (QREFELT $ 44))) 

(SDEFUN |HOMOL;homologyz;$;4| (($ $))
        (SPADCALL NIL NIL (LIST (LIST 1)) (QREFELT $ 44))) 

(SDEFUN |HOMOL;homologyzz;$;5| (($ $))
        (SPADCALL NIL NIL (LIST (LIST 1 0) (LIST 0 1)) (QREFELT $ 44))) 

(SDEFUN |HOMOL;homologyc2;$;6| (($ $))
        (SPADCALL (LIST (LIST 1)) (LIST 2) NIL (QREFELT $ 44))) 

(SDEFUN |HOMOL;homologyzc2;$;7| (($ $))
        (SPADCALL (LIST (LIST 1 0)) (LIST 2) (LIST (LIST 0 1)) (QREFELT $ 44))) 

(SDEFUN |HOMOL;dispGenerators;$Of;8| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|res| (|OutputForm|)) (|ln2| #1=(|OutputForm|)) (|ln| #1#)
          (#2=#:G766 NIL) (|g| NIL) (|s1| ($)))
         (SEQ
          (LETT |res| (SPADCALL (QREFELT $ 50))
                . #3=(|HOMOL;dispGenerators;$Of;8|))
          (LETT |s1| |s| . #3#)
          (SEQ (LETT |g| NIL . #3#) (LETT #2# (QCAR |s1|) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |ln|
                      (SPADCALL
                       (LIST (SPADCALL "gen=" (QREFELT $ 12))
                             (SPADCALL (QCAR |g|) (QREFELT $ 51))
                             (SPADCALL " ord=" (QREFELT $ 12))
                             (SPADCALL (QCDR |g|) (QREFELT $ 52)))
                       (QREFELT $ 54))
                      . #3#)
                (EXIT (LETT |res| (SPADCALL |res| |ln| (QREFELT $ 55)) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |ln2|
                (SPADCALL
                 (LIST (SPADCALL " free part=" (QREFELT $ 12))
                       (SPADCALL (QCDR |s1|) (QREFELT $ 57)))
                 (QREFELT $ 54))
                . #3#)
          (LETT |res| (SPADCALL |res| |ln2| (QREFELT $ 55)) . #3#)
          (EXIT |res|)))) 

(SDEFUN |HOMOL;=;2$B;9| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G778 NIL) (|noTorsionB| #2=(|Boolean|)) (#3=#:G780 NIL)
          (|tb| NIL) (|noTorsionA| #2#) (#4=#:G779 NIL) (|ta| NIL)
          (|torb|
           #5=(|List|
               (|Record| (|:| |vec| (|Vector| (|Integer|)))
                         (|:| |ord| (|Integer|)))))
          (|tora| #5#))
         (SEQ
          (EXIT
           (SEQ (LETT |tora| (QCAR |a|) . #6=(|HOMOL;=;2$B;9|))
                (LETT |torb| (QCAR |b|) . #6#) (LETT |noTorsionA| 'T . #6#)
                (LETT |noTorsionB| 'T . #6#)
                (SEQ (LETT |ta| NIL . #6#) (LETT #4# |tora| . #6#) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |ta| (CAR #4#) . #6#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (QCDR |ta|) 0 (QREFELT $ 40))
                         (COND
                          ((SPADCALL (QCDR |ta|) 1 (QREFELT $ 40))
                           (LETT |noTorsionA| NIL . #6#)))))))
                     (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |tb| NIL . #6#) (LETT #3# |torb| . #6#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |tb| (CAR #3#) . #6#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (QCDR |tb|) 0 (QREFELT $ 40))
                         (COND
                          ((SPADCALL (QCDR |tb|) 1 (QREFELT $ 40))
                           (LETT |noTorsionB| NIL . #6#)))))))
                     (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL |noTorsionA| |noTorsionA| (QREFELT $ 59))
                  (PROGN (LETT #1# NIL . #6#) (GO #7=#:G777))))
                (EXIT (EQL (LENGTH (QCDR |a|)) (LENGTH (QCDR |b|))))))
          #7# (EXIT #1#)))) 

(SDEFUN |HOMOL;coerce;$Of;10| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|res| (|OutputForm|)) (|firstTermRead| (|Boolean|))
          (|ln2| (|OutputForm|)) (#1=#:G790 NIL) (|t| NIL)
          (|nFree| (|NonNegativeInteger|)) (|s1| ($)))
         (SEQ
          (LETT |res| (SPADCALL (QREFELT $ 50)) . #2=(|HOMOL;coerce;$Of;10|))
          (LETT |firstTermRead| NIL . #2#) (LETT |s1| |s| . #2#)
          (LETT |nFree| (LENGTH (QCDR |s1|)) . #2#)
          (COND
           ((SPADCALL |nFree| 0 (QREFELT $ 36))
            (SEQ
             (LETT |res|
                   (SPADCALL |res| (SPADCALL "Z" (QREFELT $ 12))
                             (QREFELT $ 14))
                   . #2#)
             (COND
              ((SPADCALL |nFree| 1 (QREFELT $ 36))
               (LETT |res|
                     (SPADCALL
                      (LIST |res| (SPADCALL "*" (QREFELT $ 12))
                            (SPADCALL |nFree| (QREFELT $ 13)))
                      (QREFELT $ 54))
                     . #2#)))
             (EXIT (LETT |firstTermRead| 'T . #2#)))))
          (SEQ (LETT |t| NIL . #2#) (LETT #1# (QCAR |s1|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (EQL (QCDR |t|) 0))
                   (COND
                    ((NULL (EQL (QCDR |t|) 1))
                     (SEQ
                      (COND
                       (|firstTermRead|
                        (LETT |res|
                              (SPADCALL |res| (SPADCALL "+" (QREFELT $ 12))
                                        (QREFELT $ 14))
                              . #2#)))
                      (LETT |ln2|
                            (SPADCALL
                             (LIST (SPADCALL "C" (QREFELT $ 12))
                                   (SPADCALL (QCDR |t|) (QREFELT $ 52)))
                             (QREFELT $ 54))
                            . #2#)
                      (LETT |res| (SPADCALL |res| |ln2| (QREFELT $ 14)) . #2#)
                      (EXIT (LETT |firstTermRead| 'T . #2#)))))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL |firstTermRead|)
            (LETT |res|
                  (SPADCALL |res| (SPADCALL "0" (QREFELT $ 12)) (QREFELT $ 14))
                  . #2#)))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |Homology;|)) 

(DEFUN |Homology| ()
  (SPROG NIL
         (PROG (#1=#:G792)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Homology|)
                    . #2=(|Homology|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Homology|
                             (LIST (CONS NIL (CONS 1 (|Homology;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Homology|)))))))))) 

(DEFUN |Homology;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Homology|) . #1=(|Homology|))
          (LETT $ (GETREFV 64) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Homology| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record|
                     (|:| |torsionPart|
                          (|List|
                           (|Record| (|:| |vec| (|Vector| (|Integer|)))
                                     (|:| |ord| (|Integer|)))))
                     (|:| |freePart| (|List| (|Vector| (|Integer|))))))
          $))) 

(MAKEPROP '|Homology| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) (|NonNegativeInteger|)
              (0 . ~=) (|String|) (|OutputForm|) (6 . |message|)
              (11 . |coerce|) (16 . |hconcat|) (|Void|) (22 . |print|)
              (|Matrix| 26) (27 . |zero|) (33 . *) (39 . ~=) (45 . |coerce|)
              (|Record| (|:| |Smith| 17) (|:| |leftEqMat| 17)
                        (|:| |rightEqMat| 17))
              (|SmithNormalForm| 26 25 25 17) (50 . |completeSmith|)
              (|Vector| 26) (|Integer|) (55 . |row|) (61 . <=) (67 . |elt|)
              (74 . <=) (|Record| (|:| |vec| 25) (|:| |ord| 26)) (|List| 31)
              (80 . |concat|) (86 . |transpose|) (91 . |vertConcat|) (97 . >)
              (103 . |setelt!|) (110 . *) |HOMOL;homologyGroup;2M$;1|
              (116 . ~=) (|List| 26) (122 . |vector|) (|List| 41)
              |HOMOL;homology;LLL$;2| |HOMOL;homology0;$;3|
              |HOMOL;homologyz;$;4| |HOMOL;homologyzz;$;5|
              |HOMOL;homologyc2;$;6| |HOMOL;homologyzc2;$;7| (127 . |empty|)
              (131 . |coerce|) (136 . |coerce|) (|List| $) (141 . |hconcat|)
              (146 . |vconcat|) (|List| 25) (152 . |coerce|)
              |HOMOL;dispGenerators;$Of;8| (157 . ~=) |HOMOL;=;2$B;9|
              |HOMOL;coerce;$Of;10| (|HashState|) (|SingleInteger|))
           '#(~= 163 |latex| 169 |homologyzz| 174 |homologyzc2| 178 |homologyz|
              182 |homologyc2| 186 |homologyGroup| 190 |homology0| 196
              |homology| 200 |hashUpdate!| 207 |hash| 213 |dispGenerators| 218
              |coerce| 223 = 228)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 11))
                        (|makeByteWordVec2| 63
                                            '(2 8 7 0 0 9 1 11 0 10 12 1 8 11 0
                                              13 2 11 0 0 0 14 1 11 15 0 16 2
                                              17 0 8 8 18 2 17 0 0 0 19 2 17 7
                                              0 0 20 1 17 11 0 21 1 23 22 17 24
                                              2 17 25 0 26 27 2 8 7 0 0 28 3 17
                                              26 0 26 26 29 2 26 7 0 0 30 2 32
                                              0 0 31 33 1 17 0 0 34 2 17 0 0 0
                                              35 2 8 7 0 0 36 3 25 26 0 26 26
                                              37 2 17 25 0 25 38 2 26 7 0 0 40
                                              1 25 0 41 42 0 11 0 50 1 25 11 0
                                              51 1 26 11 0 52 1 11 0 53 54 2 11
                                              0 0 0 55 1 56 11 0 57 2 7 7 0 0
                                              59 2 0 7 0 0 1 1 0 10 0 1 0 0 0
                                              47 0 0 0 49 0 0 0 46 0 0 0 48 2 0
                                              0 17 17 39 0 0 0 45 3 0 0 43 41
                                              43 44 2 0 62 62 0 1 1 0 63 0 1 1
                                              0 11 0 58 1 0 11 0 61 2 0 7 0 0
                                              60)))))
           '|lookupComplete|)) 

(MAKEPROP '|Homology| 'NILADIC T) 
