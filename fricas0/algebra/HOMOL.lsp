
(SDEFUN |HOMOL;homologyGroup;2M$;1|
        ((|AInt| |Matrix| (|Integer|)) (|BInt| |Matrix| (|Integer|)) ($ $))
        (SPROG
         ((|kernelFree| (|List| (|Vector| (|Integer|))))
          (|v| (|Vector| (|Integer|))) (#1=#:G739 NIL) (|i| NIL)
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
          (|order| (|Integer|)) (|r| (|Vector| (|Integer|))) (#7=#:G738 NIL)
          (|nr| NIL) (|mNCols| #2#) (|mNRows| #3#) (|leftNRows| #3#) (|m| #4#)
          (|left| #5#) (|smit| #6#) (|zero| (|Matrix| (|Integer|))))
         (SEQ
          (COND
           ((SPADCALL (ANROWS |AInt|) (ANCOLS |BInt|) (QREFELT $ 9))
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL "homologyGroup validation error - A rows : "
                         (SPADCALL (ANROWS |AInt|) (QREFELT $ 11))
                         (QREFELT $ 12))
               "~= B cols : " (QREFELT $ 12))
              (SPADCALL (ANCOLS |BInt|) (QREFELT $ 11)) (QREFELT $ 12))
             (QREFELT $ 14)))
           ('T
            (SEQ
             (LETT |zero|
                   (SPADCALL (ANROWS |BInt|) (ANCOLS |AInt|) (QREFELT $ 16))
                   . #8=(|HOMOL;homologyGroup;2M$;1|))
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |BInt| |AInt| (QREFELT $ 17)) |zero|
                          (QREFELT $ 18))
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL "homologyGroup validation error - B*A ~= 0 : "
                             (SPADCALL (SPADCALL |BInt| |AInt| (QREFELT $ 17))
                                       (QREFELT $ 19))
                             (QREFELT $ 12))
                   "  ~= 0 : " (QREFELT $ 12))
                  (SPADCALL |zero| (QREFELT $ 19)) (QREFELT $ 12))
                 (QREFELT $ 14))))))))
          (LETT |res| NIL . #8#)
          (LETT |smit| (SPADCALL |AInt| (QREFELT $ 22)) . #8#)
          (LETT |left| (QVELT |smit| 1) . #8#)
          (LETT |m| (QVELT |smit| 0) . #8#)
          (LETT |leftNRows| (ANROWS |left|) . #8#)
          (LETT |mNRows| (ANROWS |m|) . #8#) (LETT |mNCols| (ANCOLS |m|) . #8#)
          (SEQ (LETT |nr| 1 . #8#) (LETT #7# |leftNRows| . #8#) G190
               (COND ((|greater_SI| |nr| #7#) (GO G191)))
               (SEQ (LETT |r| (SPADCALL |left| |nr| (QREFELT $ 25)) . #8#)
                    (LETT |order| 1 . #8#)
                    (COND
                     ((SPADCALL |nr| |mNRows| (QREFELT $ 26))
                      (COND
                       ((SPADCALL |nr| |mNCols| (QREFELT $ 26))
                        (LETT |order| (SPADCALL |m| |nr| |nr| (QREFELT $ 27))
                              . #8#)))))
                    (EXIT
                     (COND ((SPADCALL |order| 1 (QREFELT $ 28)) "iterate")
                           ('T
                            (SEQ (LETT |g| (CONS |r| |order|) . #8#)
                                 (EXIT
                                  (LETT |res|
                                        (SPADCALL |res| |g| (QREFELT $ 31))
                                        . #8#)))))))
               (LETT |nr| (|inc_SI| |nr|) . #8#) (GO G190) G191 (EXIT NIL))
          (LETT |augmented|
                (SPADCALL (SPADCALL |AInt| (QREFELT $ 32)) |BInt|
                          (QREFELT $ 33))
                . #8#)
          (LETT |smitFree| (SPADCALL |augmented| (QREFELT $ 22)) . #8#)
          (LETT |leftFree| (QVELT |smitFree| 1) . #8#)
          (LETT |mFree| (QVELT |smitFree| 0) . #8#)
          (LETT |n_rows| (ANROWS |mFree|) . #8#)
          (LETT |n_cols| (ANCOLS |mFree|) . #8#) (LETT |kernelFree| NIL . #8#)
          (SEQ (LETT |i| 1 . #8#) (LETT #1# |n_cols| . #8#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((OR (SPADCALL |i| |n_rows| (QREFELT $ 34))
                       (EQL (SPADCALL |mFree| |i| |i| (QREFELT $ 27)) 0))
                   (SEQ (LETT |v| (MAKEARR1 |n_cols| 0) . #8#)
                        (SPADCALL |v| |i| 1 (QREFELT $ 35))
                        (EXIT
                         (LETT |kernelFree|
                               (CONS
                                (SPADCALL (QVELT |smitFree| 2) |v|
                                          (QREFELT $ 36))
                                |kernelFree|)
                               . #8#)))))))
               (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |res| (NREVERSE |kernelFree|)))))) 

(SDEFUN |HOMOL;homology;LLL$;2|
        ((|torsionVec| |List| (|List| (|Integer|)))
         (|torsionOrd| |List| (|Integer|))
         (|free1| |List| (|List| (|Integer|))) ($ $))
        (SPROG
         ((|kernelFree| (|List| (|Vector| (|Integer|)))) (#1=#:G751 NIL)
          (|v| NIL) (#2=#:G750 NIL)
          (|res|
           (|List|
            (|Record| (|:| |vec| (|Vector| (|Integer|)))
                      (|:| |ord| (|Integer|)))))
          (|r3|
           (|Record| (|:| |vec| (|Vector| (|Integer|)))
                     (|:| |ord| (|Integer|))))
          (#3=#:G748 NIL) (|r1| NIL) (#4=#:G749 NIL) (|r2| NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |torsionVec|) (LENGTH |torsionOrd|)
                      (QREFELT $ 38))
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
                (LETT |r3| (CONS (SPADCALL |r1| (QREFELT $ 40)) |r2|) . #5#)
                (EXIT (LETT |res| (SPADCALL |res| |r3| (QREFELT $ 31)) . #5#)))
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
                        (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 40)) #2#)
                              . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #5#)
          (EXIT (CONS |res| |kernelFree|))))) 

(SDEFUN |HOMOL;homology0;$;3| (($ $)) (SPADCALL NIL NIL NIL (QREFELT $ 42))) 

(SDEFUN |HOMOL;homologyz;$;4| (($ $))
        (SPADCALL NIL NIL (LIST (LIST 1)) (QREFELT $ 42))) 

(SDEFUN |HOMOL;homologyzz;$;5| (($ $))
        (SPADCALL NIL NIL (LIST (LIST 1 0) (LIST 0 1)) (QREFELT $ 42))) 

(SDEFUN |HOMOL;homologyc2;$;6| (($ $))
        (SPADCALL (LIST (LIST 1)) (LIST 2) NIL (QREFELT $ 42))) 

(SDEFUN |HOMOL;homologyzc2;$;7| (($ $))
        (SPADCALL (LIST (LIST 1 0)) (LIST 2) (LIST (LIST 0 1)) (QREFELT $ 42))) 

(SDEFUN |HOMOL;dispGenerators;$Of;8| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|res| (|OutputForm|)) (|ln2| #1=(|OutputForm|)) (|ln| #1#)
          (#2=#:G763 NIL) (|g| NIL) (|s1| ($)))
         (SEQ
          (LETT |res| (SPADCALL (QREFELT $ 48))
                . #3=(|HOMOL;dispGenerators;$Of;8|))
          (LETT |s1| |s| . #3#)
          (SEQ (LETT |g| NIL . #3#) (LETT #2# (QCAR |s1|) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |ln|
                      (SPADCALL
                       (LIST "gen=" (SPADCALL (QCAR |g|) (QREFELT $ 49))
                             " ord=" (SPADCALL (QCDR |g|) (QREFELT $ 50)))
                       (QREFELT $ 52))
                      . #3#)
                (EXIT (LETT |res| (SPADCALL |res| |ln| (QREFELT $ 53)) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |ln2|
                (SPADCALL
                 (LIST " free part=" (SPADCALL (QCDR |s1|) (QREFELT $ 55)))
                 (QREFELT $ 52))
                . #3#)
          (LETT |res| (SPADCALL |res| |ln2| (QREFELT $ 53)) . #3#)
          (EXIT |res|)))) 

(SDEFUN |HOMOL;=;2$B;9| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G775 NIL) (|noTorsionB| #2=(|Boolean|)) (#3=#:G777 NIL)
          (|tb| NIL) (|noTorsionA| #2#) (#4=#:G776 NIL) (|ta| NIL)
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
                        ((SPADCALL (QCDR |ta|) 0 (QREFELT $ 38))
                         (COND
                          ((SPADCALL (QCDR |ta|) 1 (QREFELT $ 38))
                           (LETT |noTorsionA| NIL . #6#)))))))
                     (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |tb| NIL . #6#) (LETT #3# |torb| . #6#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |tb| (CAR #3#) . #6#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (QCDR |tb|) 0 (QREFELT $ 38))
                         (COND
                          ((SPADCALL (QCDR |tb|) 1 (QREFELT $ 38))
                           (LETT |noTorsionB| NIL . #6#)))))))
                     (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL |noTorsionA| |noTorsionA| (QREFELT $ 57))
                  (PROGN (LETT #1# NIL . #6#) (GO #7=#:G774))))
                (EXIT (EQL (LENGTH (QCDR |a|)) (LENGTH (QCDR |b|))))))
          #7# (EXIT #1#)))) 

(SDEFUN |HOMOL;coerce;$Of;10| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|res| (|OutputForm|)) (|firstTermRead| (|Boolean|))
          (|ln2| (|OutputForm|)) (#1=#:G787 NIL) (|t| NIL)
          (|nFree| (|NonNegativeInteger|)) (|s1| ($)))
         (SEQ
          (LETT |res| (SPADCALL (QREFELT $ 48)) . #2=(|HOMOL;coerce;$Of;10|))
          (LETT |firstTermRead| NIL . #2#) (LETT |s1| |s| . #2#)
          (LETT |nFree| (LENGTH (QCDR |s1|)) . #2#)
          (COND
           ((SPADCALL |nFree| 0 (QREFELT $ 34))
            (SEQ (LETT |res| (SPADCALL |res| "Z" (QREFELT $ 12)) . #2#)
                 (COND
                  ((SPADCALL |nFree| 1 (QREFELT $ 34))
                   (LETT |res|
                         (SPADCALL
                          (LIST |res| "*" (SPADCALL |nFree| (QREFELT $ 11)))
                          (QREFELT $ 52))
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
                        (LETT |res| (SPADCALL |res| "+" (QREFELT $ 12))
                              . #2#)))
                      (LETT |ln2|
                            (SPADCALL
                             (LIST "C" (SPADCALL (QCDR |t|) (QREFELT $ 50)))
                             (QREFELT $ 52))
                            . #2#)
                      (LETT |res| (SPADCALL |res| |ln2| (QREFELT $ 12)) . #2#)
                      (EXIT (LETT |firstTermRead| 'T . #2#)))))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL |firstTermRead|)
            (LETT |res| (SPADCALL |res| "0" (QREFELT $ 12)) . #2#)))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |Homology;|)) 

(DEFUN |Homology| ()
  (SPROG NIL
         (PROG (#1=#:G789)
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
          (LETT $ (GETREFV 63) . #1#)
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
              (0 . ~=) (|OutputForm|) (6 . |coerce|) (11 . |hconcat|) (|Void|)
              (17 . |print|) (|Matrix| 24) (22 . |zero|) (28 . *) (34 . ~=)
              (40 . |coerce|)
              (|Record| (|:| |Smith| 15) (|:| |leftEqMat| 15)
                        (|:| |rightEqMat| 15))
              (|SmithNormalForm| 24 23 23 15) (45 . |completeSmith|)
              (|Vector| 24) (|Integer|) (50 . |row|) (56 . <=) (62 . |elt|)
              (69 . <=) (|Record| (|:| |vec| 23) (|:| |ord| 24)) (|List| 29)
              (75 . |concat|) (81 . |transpose|) (86 . |vertConcat|) (92 . >)
              (98 . |setelt!|) (105 . *) |HOMOL;homologyGroup;2M$;1| (111 . ~=)
              (|List| 24) (117 . |vector|) (|List| 39) |HOMOL;homology;LLL$;2|
              |HOMOL;homology0;$;3| |HOMOL;homologyz;$;4|
              |HOMOL;homologyzz;$;5| |HOMOL;homologyc2;$;6|
              |HOMOL;homologyzc2;$;7| (122 . |empty|) (126 . |coerce|)
              (131 . |coerce|) (|List| $) (136 . |hconcat|) (141 . |vconcat|)
              (|List| 23) (147 . |coerce|) |HOMOL;dispGenerators;$Of;8|
              (152 . ~=) |HOMOL;=;2$B;9| |HOMOL;coerce;$Of;10| (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 158 |latex| 164 |homologyzz| 169 |homologyzc2| 173 |homologyz|
              177 |homologyc2| 181 |homologyGroup| 185 |homology0| 191
              |homology| 195 |hashUpdate!| 202 |hash| 208 |dispGenerators| 213
              |coerce| 218 = 223)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 10))
                        (|makeByteWordVec2| 62
                                            '(2 8 7 0 0 9 1 8 10 0 11 2 10 0 0
                                              0 12 1 10 13 0 14 2 15 0 8 8 16 2
                                              15 0 0 0 17 2 15 7 0 0 18 1 15 10
                                              0 19 1 21 20 15 22 2 15 23 0 24
                                              25 2 8 7 0 0 26 3 15 24 0 24 24
                                              27 2 24 7 0 0 28 2 30 0 0 29 31 1
                                              15 0 0 32 2 15 0 0 0 33 2 8 7 0 0
                                              34 3 23 24 0 24 24 35 2 15 23 0
                                              23 36 2 24 7 0 0 38 1 23 0 39 40
                                              0 10 0 48 1 23 10 0 49 1 24 10 0
                                              50 1 10 0 51 52 2 10 0 0 0 53 1
                                              54 10 0 55 2 7 7 0 0 57 2 0 7 0 0
                                              1 1 0 61 0 1 0 0 0 45 0 0 0 47 0
                                              0 0 44 0 0 0 46 2 0 0 15 15 37 0
                                              0 0 43 3 0 0 41 39 41 42 2 0 60
                                              60 0 1 1 0 62 0 1 1 0 10 0 56 1 0
                                              10 0 59 2 0 7 0 0 58)))))
           '|lookupComplete|)) 

(MAKEPROP '|Homology| 'NILADIC T) 
