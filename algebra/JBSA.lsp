
(SDEFUN |JBSA;setNotation;2S;1| ((|s| |Symbol|) ($ |Symbol|))
        (SEQ
         (SPADCALL
          (SPADCALL "only repeated index notation possible" (QREFELT $ 36))
          (QREFELT $ 38))
         (EXIT '|Repeated|))) 

(PUT '|JBSA;getNotation;S;2| '|SPADreplace| '(XLAM NIL '|Repeated|)) 

(SDEFUN |JBSA;getNotation;S;2| (($ |Symbol|)) '|Repeated|) 

(SDEFUN |JBSA;multiIndex;$L;3| ((|jv| $) ($ |List| (|NonNegativeInteger|)))
        (SPADCALL |jv| (QREFELT $ 42))) 

(SDEFUN |JBSA;index;$Pi;4| ((|jv| $) ($ |PositiveInteger|))
        (SPADCALL |jv| (QREFELT $ 44))) 

(SDEFUN |JBSA;type;$S;5| ((|jv| $) ($ |Symbol|)) (SPADCALL |jv| (QREFELT $ 46))) 

(SDEFUN |JBSA;X;Pi$;6| ((|up| |PositiveInteger|) ($ $))
        (SPADCALL |up| (QREFELT $ 48))) 

(SDEFUN |JBSA;U;Pi$;7| ((|up| |PositiveInteger|) ($ $))
        (SPADCALL |up| (QREFELT $ 50))) 

(SDEFUN |JBSA;Pm;PiL$;8|
        ((|up| |PositiveInteger|) (|lo| |List| (|NonNegativeInteger|)) ($ $))
        (SPADCALL |up| |lo| (QREFELT $ 52))) 

(SDEFUN |JBSA;coerce;S$;9| ((|s| |Symbol|) ($ $)) (SPADCALL |s| (QREFELT $ 54))) 

(SDEFUN |JBSA;D;SL$;10| ((|u| |Symbol|) (|der| |List| (|Symbol|)) ($ $))
        (SPADCALL |u| |der| (QREFELT $ 56))) 

(SDEFUN |JBSA;One;$;11| (($ $)) (|spadConstant| $ 58)) 

(SDEFUN |JBSA;numIndVar;Pi;12| (($ |PositiveInteger|))
        (+ (QREFELT $ 11) (QREFELT $ 13))) 

(SDEFUN |JBSA;numDepVar;Pi;13| (($ |PositiveInteger|))
        (+ (QREFELT $ 11) (QREFELT $ 13))) 

(SDEFUN |JBSA;name;$S;14| ((|jv| $) ($ |Symbol|))
        (SPADCALL |jv| (QREFELT $ 61))) 

(SDEFUN |JBSA;coerce;$E;15| ((|jv| $) ($ |Expression| (|Integer|)))
        (SPADCALL |jv| (QREFELT $ 64))) 

(DECLAIM (NOTINLINE |JetBundleSymAna;|)) 

(DEFUN |JetBundleSymAna| (&REST #1=#:G758)
  (SPROG NIL
         (PROG (#2=#:G759)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|JetBundleSymAna|)
                                               '|domainEqualList|)
                    . #3=(|JetBundleSymAna|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |JetBundleSymAna;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundleSymAna|)))))))))) 

(DEFUN |JetBundleSymAna;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G757 NIL) (|i| NIL) (#2=#:G756 NIL) (#3=#:G755 NIL) (#4=#:G754 NIL)
    (#5=#:G753 NIL) (|jv| NIL) (#6=#:G752 NIL) (#7=#:G711 NIL) (#8=#:G751 NIL)
    (#9=#:G750 NIL) (#10=#:G708 NIL) (#11=#:G749 NIL) (#12=#:G748 NIL)
    (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|) . #13=(|JetBundleSymAna|))
     (LETT DV$2 (|devaluate| |#2|) . #13#)
     (LETT DV$3 (|devaluate| |#3|) . #13#)
     (LETT |dv$| (LIST '|JetBundleSymAna| DV$1 DV$2 DV$3) . #13#)
     (LETT $ (GETREFV 73) . #13#)
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #13#))
     (|haddProp| |$ConstructorCache| '|JetBundleSymAna| (LIST DV$1 DV$2 DV$3)
                 (CONS 1 $))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (QSETREFV $ 7 |#2|)
     (QSETREFV $ 8 |#3|)
     (SETF |pv$| (QREFELT $ 3))
     (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
     (QSETREFV $ 13 (SPADCALL (QREFELT $ 12)))
     (QSETREFV $ 18
               (SPADCALL
                (PROGN
                 (LETT #12# NIL . #13#)
                 (SEQ (LETT |i| 1 . #13#) (LETT #11# (QREFELT $ 11) . #13#)
                      G190 (COND ((|greater_SI| |i| #11#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #12#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #10# |i| . #13#)
                                  (|check_subtype2| (> #10# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #10#))
                                (QREFELT $ 14))
                               #12#)
                              . #13#)))
                      (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #12#))))
                (PROGN
                 (LETT #9# NIL . #13#)
                 (SEQ (LETT |i| 1 . #13#) (LETT #8# (QREFELT $ 13) . #13#) G190
                      (COND ((|greater_SI| |i| #8#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #9#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #7# |i| . #13#)
                                  (|check_subtype2| (> #7# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #7#))
                                (QREFELT $ 15))
                               #9#)
                              . #13#)))
                      (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #9#))))
                (QREFELT $ 17)))
     (QSETREFV $ 21
               (PROGN
                (LETT #6# NIL . #13#)
                (SEQ (LETT |jv| NIL . #13#) (LETT #5# (QREFELT $ 18) . #13#)
                     G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |jv| (CAR #5#) . #13#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #6# (CONS (SPADCALL |jv| (QREFELT $ 20)) #6#)
                             . #13#)))
                     (LETT #5# (CDR #5#) . #13#) (GO G190) G191
                     (EXIT (NREVERSE #6#)))))
     (QSETREFV $ 22 NIL)
     (COND
      ((QEQCAR |#2| 0)
       (COND
        ((SPADCALL (QREFELT $ 11) 1 (QREFELT $ 26))
         (SETELT $ 22
                 (PROGN
                  (LETT #4# NIL . #13#)
                  (SEQ (LETT |i| 1 . #13#) (LETT #3# (QREFELT $ 11) . #13#)
                       G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4#
                               (CONS
                                (SPADCALL (QCDR |#2|)
                                          (LIST (SPADCALL |i| (QREFELT $ 29)))
                                          (QREFELT $ 31))
                                #4#)
                               . #13#)))
                       (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                       (EXIT (NREVERSE #4#))))))
        ('T (SETELT $ 22 (LIST (QCDR |#2|))))))
      ('T (SETELT $ 22 (QCDR |#2|))))
     (COND
      ((QEQCAR |#3| 0)
       (COND
        ((SPADCALL (QREFELT $ 13) 1 (QREFELT $ 26))
         (SETELT $ 22
                 (SPADCALL (QREFELT $ 22)
                           (PROGN
                            (LETT #2# NIL . #13#)
                            (SEQ (LETT |i| 1 . #13#)
                                 (LETT #1# (QREFELT $ 13) . #13#) G190
                                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS
                                          (SPADCALL (QCDR |#3|)
                                                    (LIST
                                                     (SPADCALL |i|
                                                               (QREFELT $ 29)))
                                                    (QREFELT $ 31))
                                          #2#)
                                         . #13#)))
                                 (LETT |i| (|inc_SI| |i|) . #13#) (GO G190)
                                 G191 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 33))))
        ('T
         (SETELT $ 22
                 (SPADCALL (QREFELT $ 22) (LIST (QCDR |#3|))
                           (QREFELT $ 33))))))
      ('T (SETELT $ 22 (SPADCALL (QREFELT $ 22) (QCDR |#3|) (QREFELT $ 33)))))
     (QSETREFV $ 34 (|JetBundle| (QREFELT $ 21) (QREFELT $ 22)))
     $)))) 

(MAKEPROP '|JetBundleSymAna| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|PositiveInteger|) (0 . |numIndVar|) '|nn|
              (4 . |numDepVar|) '|mm| (8 . X) (13 . U) (|List| 6)
              (18 . |concat!|) '|vars| (|Symbol|) (24 . |name|) '|indVars|
              '|depVars|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JBSA;One;$;11|) $))
              (29 . |One|) (|Boolean|) (33 . >) (|OutputForm|)
              (|NonNegativeInteger|) (39 . |coerce|) (|List| 27)
              (44 . |superscript|) (|List| 19) (50 . |append|) '|Rep|
              (|String|) (56 . |message|) (|Void|) (61 . |print|)
              |JBSA;setNotation;2S;1| |JBSA;getNotation;S;2| (|List| 28)
              (66 . |multiIndex|) |JBSA;multiIndex;$L;3| (71 . |index|)
              |JBSA;index;$Pi;4| (76 . |type|) |JBSA;type;$S;5| (81 . X)
              |JBSA;X;Pi$;6| (86 . U) |JBSA;U;Pi$;7| (91 . |Pm|)
              |JBSA;Pm;PiL$;8| (97 . |coerce|) |JBSA;coerce;S$;9| (102 . D)
              |JBSA;D;SL$;10| (108 . |One|) |JBSA;numIndVar;Pi;12|
              |JBSA;numDepVar;Pi;13| (112 . |name|) |JBSA;name;$S;14|
              (|Expression| (|Integer|)) (117 . |coerce|) |JBSA;coerce;$E;15|
              (|List| $) (|List| 9) (|Union| $ '"failed") (|Union| $ '"0")
              (|List| 67) (|HashState|) (|SingleInteger|))
           '#(~= 122 |weight| 128 |variables| 133 |type| 144 |smaller?| 149
              |setNotation| 155 |repeatedIndex| 160 |r2m| 165 |order| 170
              |one?| 175 |numIndVar| 180 |numDepVar| 184 |name| 188
              |multiIndex| 193 |min| 198 |max| 204 |m2r| 210 |latex| 215
              |integrateIfCan| 220 |integrate| 226 |index| 232 |hashUpdate!|
              237 |hash| 243 |getNotation| 248 |dimS| 252 |dimJ| 257
              |differentiate| 262 |derivativeOf?| 268 |coerce| 274 |class| 289
              |allRepeated| 299 X 304 U 313 |Pr| 322 |Pm| 328 P 334 |One| 356 D
              360 >= 366 > 372 = 378 <= 384 < 390)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|JetBundleCategory&| |OrderedSet&| NIL |SetCategory&|
                     |BasicType&| NIL |PartialOrder&| NIL)
                  (CONS
                   '#((|JetBundleCategory|) (|OrderedSet|) (|Comparable|)
                      (|SetCategory|) (|BasicType|) (|CoercibleTo| 63)
                      (|PartialOrder|) (|CoercibleTo| 27))
                   (|makeByteWordVec2| 72
                                       '(0 6 9 10 0 6 9 12 1 6 0 9 14 1 6 0 9
                                         15 2 16 0 0 0 17 1 6 19 0 20 0 6 0 24
                                         2 9 25 0 0 26 1 28 27 0 29 2 19 0 0 30
                                         31 2 32 0 0 0 33 1 27 0 35 36 1 27 37
                                         0 38 1 34 41 0 42 1 34 9 0 44 1 34 19
                                         0 46 1 34 0 9 48 1 34 0 9 50 2 34 0 9
                                         41 52 1 34 0 19 54 2 34 0 19 32 56 0
                                         34 0 58 1 34 19 0 61 1 34 63 0 64 2 0
                                         25 0 0 1 1 0 28 0 1 2 0 66 28 9 1 1 0
                                         66 28 1 1 0 19 0 47 2 0 25 0 0 1 1 0
                                         19 19 39 1 0 67 0 1 1 0 41 67 1 1 0 28
                                         0 1 1 0 25 0 1 0 0 9 59 0 0 9 60 1 0
                                         19 0 62 1 0 41 0 43 2 0 0 0 0 1 2 0 0
                                         0 0 1 1 0 67 41 1 1 0 35 0 1 2 0 68 0
                                         9 1 2 0 0 0 9 1 1 0 9 0 45 2 0 71 71 0
                                         1 1 0 72 0 1 0 0 19 40 1 0 28 28 1 1 0
                                         28 28 1 2 0 69 0 9 1 2 0 41 0 0 1 1 0
                                         0 19 55 1 0 63 0 65 1 0 27 0 1 1 0 28
                                         0 1 1 0 28 41 1 1 0 70 41 1 0 0 0 1 1
                                         0 0 9 49 0 0 0 1 1 0 0 9 51 2 0 0 9 67
                                         1 2 0 0 9 41 53 1 0 0 28 1 1 0 0 41 1
                                         2 0 0 9 28 1 2 0 0 9 41 1 0 0 0 23 2 0
                                         0 19 32 57 2 0 25 0 0 1 2 0 25 0 0 1 2
                                         0 25 0 0 1 2 0 25 0 0 1 2 0 25 0 0
                                         1)))))
           '|lookupComplete|)) 
