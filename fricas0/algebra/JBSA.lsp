
(SDEFUN |JBSA;setNotation;2S;1| ((|s| |Symbol|) ($ |Symbol|))
        (SEQ (SPADCALL "only repeated index notation possible" (QREFELT $ 36))
             (EXIT '|Repeated|))) 

(PUT '|JBSA;getNotation;S;2| '|SPADreplace| '(XLAM NIL '|Repeated|)) 

(SDEFUN |JBSA;getNotation;S;2| (($ |Symbol|)) '|Repeated|) 

(SDEFUN |JBSA;multiIndex;$L;3| ((|jv| $) ($ |List| (|NonNegativeInteger|)))
        (SPADCALL |jv| (QREFELT $ 40))) 

(SDEFUN |JBSA;index;$Pi;4| ((|jv| $) ($ |PositiveInteger|))
        (SPADCALL |jv| (QREFELT $ 42))) 

(SDEFUN |JBSA;type;$S;5| ((|jv| $) ($ |Symbol|)) (SPADCALL |jv| (QREFELT $ 44))) 

(SDEFUN |JBSA;X;Pi$;6| ((|up| |PositiveInteger|) ($ $))
        (SPADCALL |up| (QREFELT $ 46))) 

(SDEFUN |JBSA;U;Pi$;7| ((|up| |PositiveInteger|) ($ $))
        (SPADCALL |up| (QREFELT $ 48))) 

(SDEFUN |JBSA;Pm;PiL$;8|
        ((|up| |PositiveInteger|) (|lo| |List| (|NonNegativeInteger|)) ($ $))
        (SPADCALL |up| |lo| (QREFELT $ 50))) 

(SDEFUN |JBSA;coerce;S$;9| ((|s| |Symbol|) ($ $)) (SPADCALL |s| (QREFELT $ 52))) 

(SDEFUN |JBSA;D;SL$;10| ((|u| |Symbol|) (|der| |List| (|Symbol|)) ($ $))
        (SPADCALL |u| |der| (QREFELT $ 54))) 

(SDEFUN |JBSA;One;$;11| (($ $)) (|spadConstant| $ 56)) 

(SDEFUN |JBSA;numIndVar;Pi;12| (($ |PositiveInteger|))
        (+ (QREFELT $ 11) (QREFELT $ 13))) 

(SDEFUN |JBSA;numDepVar;Pi;13| (($ |PositiveInteger|))
        (+ (QREFELT $ 11) (QREFELT $ 13))) 

(SDEFUN |JBSA;name;$S;14| ((|jv| $) ($ |Symbol|))
        (SPADCALL |jv| (QREFELT $ 59))) 

(SDEFUN |JBSA;coerce;$E;15| ((|jv| $) ($ |Expression| (|Integer|)))
        (SPADCALL |jv| (QREFELT $ 62))) 

(DECLAIM (NOTINLINE |JetBundleSymAna;|)) 

(DEFUN |JetBundleSymAna| (&REST #1=#:G755)
  (SPROG NIL
         (PROG (#2=#:G756)
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
   ((#1=#:G754 NIL) (|i| NIL) (#2=#:G753 NIL) (#3=#:G752 NIL) (#4=#:G751 NIL)
    (#5=#:G750 NIL) (|jv| NIL) (#6=#:G749 NIL) (#7=#:G707 NIL) (#8=#:G748 NIL)
    (#9=#:G747 NIL) (#10=#:G704 NIL) (#11=#:G746 NIL) (#12=#:G745 NIL)
    (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|) . #13=(|JetBundleSymAna|))
     (LETT DV$2 (|devaluate| |#2|) . #13#)
     (LETT DV$3 (|devaluate| |#3|) . #13#)
     (LETT |dv$| (LIST '|JetBundleSymAna| DV$1 DV$2 DV$3) . #13#)
     (LETT $ (GETREFV 72) . #13#)
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
              (44 . |superscript|) (|List| 19) (50 . |append|) '|Rep| (|Void|)
              (56 . |print|) |JBSA;setNotation;2S;1| |JBSA;getNotation;S;2|
              (|List| 28) (61 . |multiIndex|) |JBSA;multiIndex;$L;3|
              (66 . |index|) |JBSA;index;$Pi;4| (71 . |type|) |JBSA;type;$S;5|
              (76 . X) |JBSA;X;Pi$;6| (81 . U) |JBSA;U;Pi$;7| (86 . |Pm|)
              |JBSA;Pm;PiL$;8| (92 . |coerce|) |JBSA;coerce;S$;9| (97 . D)
              |JBSA;D;SL$;10| (103 . |One|) |JBSA;numIndVar;Pi;12|
              |JBSA;numDepVar;Pi;13| (107 . |name|) |JBSA;name;$S;14|
              (|Expression| (|Integer|)) (112 . |coerce|) |JBSA;coerce;$E;15|
              (|List| $) (|List| 9) (|Union| $ '"failed") (|Union| $ '"0")
              (|List| 65) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 117 |weight| 123 |variables| 128 |type| 139 |smaller?| 144
              |setNotation| 150 |repeatedIndex| 155 |r2m| 160 |order| 165
              |one?| 170 |numIndVar| 175 |numDepVar| 179 |name| 183
              |multiIndex| 188 |min| 193 |max| 199 |m2r| 205 |latex| 210
              |integrateIfCan| 215 |integrate| 221 |index| 227 |hashUpdate!|
              232 |hash| 238 |getNotation| 243 |dimS| 247 |dimJ| 252
              |differentiate| 257 |derivativeOf?| 263 |coerce| 269 |class| 284
              |allRepeated| 294 X 299 U 308 |Pr| 317 |Pm| 323 P 329 |One| 351 D
              355 >= 361 > 367 = 373 <= 379 < 385)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|JetBundleCategory&| |OrderedSet&| NIL |SetCategory&|
                     |BasicType&| NIL |PartialOrder&| NIL)
                  (CONS
                   '#((|JetBundleCategory|) (|OrderedSet|) (|Comparable|)
                      (|SetCategory|) (|BasicType|) (|CoercibleTo| 61)
                      (|PartialOrder|) (|CoercibleTo| 27))
                   (|makeByteWordVec2| 71
                                       '(0 6 9 10 0 6 9 12 1 6 0 9 14 1 6 0 9
                                         15 2 16 0 0 0 17 1 6 19 0 20 0 6 0 24
                                         2 9 25 0 0 26 1 28 27 0 29 2 19 0 0 30
                                         31 2 32 0 0 0 33 1 27 35 0 36 1 34 39
                                         0 40 1 34 9 0 42 1 34 19 0 44 1 34 0 9
                                         46 1 34 0 9 48 2 34 0 9 39 50 1 34 0
                                         19 52 2 34 0 19 32 54 0 34 0 56 1 34
                                         19 0 59 1 34 61 0 62 2 0 25 0 0 1 1 0
                                         28 0 1 2 0 64 28 9 1 1 0 64 28 1 1 0
                                         19 0 45 2 0 25 0 0 1 1 0 19 19 37 1 0
                                         65 0 1 1 0 39 65 1 1 0 28 0 1 1 0 25 0
                                         1 0 0 9 57 0 0 9 58 1 0 19 0 60 1 0 39
                                         0 41 2 0 0 0 0 1 2 0 0 0 0 1 1 0 65 39
                                         1 1 0 70 0 1 2 0 66 0 9 1 2 0 0 0 9 1
                                         1 0 9 0 43 2 0 69 69 0 1 1 0 71 0 1 0
                                         0 19 38 1 0 28 28 1 1 0 28 28 1 2 0 67
                                         0 9 1 2 0 39 0 0 1 1 0 0 19 53 1 0 61
                                         0 63 1 0 27 0 1 1 0 28 0 1 1 0 28 39 1
                                         1 0 68 39 1 0 0 0 1 1 0 0 9 47 0 0 0 1
                                         1 0 0 9 49 2 0 0 9 65 1 2 0 0 9 39 51
                                         1 0 0 28 1 1 0 0 39 1 2 0 0 9 28 1 2 0
                                         0 9 39 1 0 0 0 23 2 0 0 19 32 55 2 0
                                         25 0 0 1 2 0 25 0 0 1 2 0 25 0 0 1 2 0
                                         25 0 0 1 2 0 25 0 0 1)))))
           '|lookupComplete|)) 
