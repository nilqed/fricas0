
(SDEFUN |IJB;setNotation;2S;1| ((|s| |Symbol|) ($ |Symbol|))
        (SPROG ((|t| (|Symbol|)))
               (SEQ
                (COND
                 ((NULL
                   (SPADCALL |s| (LIST '|Multi| '|Repeated|) (QREFELT $ 16)))
                  (|error| "Unknown notation"))
                 ('T
                  (SEQ (LETT |t| (QREFELT $ 12) |IJB;setNotation;2S;1|)
                       (SETELT $ 12 |s|) (EXIT |t|))))))) 

(SDEFUN |IJB;getNotation;S;2| (($ |Symbol|)) (QREFELT $ 12)) 

(SDEFUN |IJB;multiIndex;$L;3| ((|jv| $) ($ |List| (|NonNegativeInteger|)))
        (SPADCALL (CDR (CDR |jv|)) (QREFELT $ 19))) 

(SDEFUN |IJB;index;$Pi;4| ((|jv| $) ($ |PositiveInteger|))
        (SPROG ((#1=#:G712 NIL))
               (PROG1 (LETT #1# (|SPADfirst| (CDR |jv|)) |IJB;index;$Pi;4|)
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |IJB;type;$S;5| ((|jv| $) ($ |Symbol|))
        (SPROG ((|t| (|NonNegativeInteger|)))
               (SEQ (LETT |t| (|SPADfirst| |jv|) |IJB;type;$S;5|)
                    (EXIT
                     (COND ((ZEROP |t|) '|Const|) ((EQL |t| 1) '|Indep|)
                           ((EQL |t| 2) '|Dep|) ('T '|Deriv|)))))) 

(SDEFUN |IJB;CheckZeroIndex|
        ((|il| |List| (|NonNegativeInteger|)) ($ |Boolean|))
        (SPROG ((#1=#:G721 NIL) (#2=#:G722 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| NIL . #3=(|IJB;CheckZeroIndex|))
                       (LETT #2# |il| . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (ZEROP |i|))
                           (PROGN (LETT #1# NIL . #3#) (GO #4=#:G720))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #4# (EXIT #1#)))) 

(SDEFUN |IJB;X;Pi$;7| ((|up| |PositiveInteger|) ($ $))
        (COND
         ((SPADCALL |up| (QREFELT $ 9) (QREFELT $ 25))
          (|error| "Improper upper index"))
         ('T (LIST 1 |up|)))) 

(SDEFUN |IJB;U;Pi$;8| ((|up| |PositiveInteger|) ($ $))
        (SPROG ((#1=#:G728 NIL) (|i| NIL) (#2=#:G727 NIL))
               (SEQ
                (COND
                 ((SPADCALL |up| (QREFELT $ 10) (QREFELT $ 25))
                  (|error| "Improper upper index"))
                 ('T
                  (CONS 2
                        (CONS |up|
                              (PROGN
                               (LETT #2# NIL . #3=(|IJB;U;Pi$;8|))
                               (SEQ (LETT |i| 1 . #3#)
                                    (LETT #1# (QREFELT $ 9) . #3#) G190
                                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                                    (SEQ (EXIT (LETT #2# (CONS 0 #2#) . #3#)))
                                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190)
                                    G191 (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |IJB;Pm;PiL$;9|
        ((|up| |PositiveInteger|) (|lo| |List| (|NonNegativeInteger|)) ($ $))
        (COND
         ((SPADCALL |up| (QREFELT $ 10) (QREFELT $ 25))
          (|error| "Improper upper index"))
         ((SPADCALL (SPADCALL |lo| (QREFELT $ 29)) (QREFELT $ 9)
                    (QREFELT $ 30))
          (|error| "Improper multi-index"))
         ((|IJB;CheckZeroIndex| |lo| $) (SPADCALL |up| (QREFELT $ 27)))
         ('T (CONS 3 (CONS |up| |lo|))))) 

(PUT '|IJB;One;$;10| '|SPADreplace| '(XLAM NIL (LIST 0 1))) 

(SDEFUN |IJB;One;$;10| (($ $)) (LIST 0 1)) 

(SDEFUN |IJB;numIndVar;Pi;11| (($ |PositiveInteger|)) (QREFELT $ 9)) 

(SDEFUN |IJB;numDepVar;Pi;12| (($ |PositiveInteger|)) (QREFELT $ 10)) 

(SDEFUN |IJB;name;$S;13| ((|jv| $) ($ |Symbol|))
        (SPROG
         ((#1=#:G757 NIL) (|j| NIL) (#2=#:G756 NIL) (#3=#:G755 NIL)
          (#4=#:G754 NIL) (#5=#:G753 NIL) (|i| NIL) (#6=#:G752 NIL)
          (#7=#:G751 NIL) (#8=#:G750 NIL) (|jt| (|Symbol|)))
         (SEQ
          (LETT |jt| (SPADCALL |jv| (QREFELT $ 24)) . #9=(|IJB;name;$S;13|))
          (EXIT
           (COND ((EQUAL |jt| '|Const|) '|1|)
                 ((EQUAL |jt| '|Indep|)
                  (COND
                   ((SPADCALL (QREFELT $ 9) 1 (QREFELT $ 25))
                    (SPADCALL (QREFELT $ 6)
                              (LIST
                               (SPADCALL (SPADCALL |jv| (QREFELT $ 23))
                                         (QREFELT $ 36)))
                              (QREFELT $ 38)))
                   (#10='T (QREFELT $ 6))))
                 ((EQUAL |jt| '|Dep|)
                  (COND
                   ((SPADCALL (QREFELT $ 10) 1 (QREFELT $ 25))
                    (SPADCALL (QREFELT $ 7)
                              (LIST
                               (SPADCALL (SPADCALL |jv| (QREFELT $ 23))
                                         (QREFELT $ 36)))
                              (QREFELT $ 38)))
                   (#10# (QREFELT $ 7))))
                 ((EQUAL (SPADCALL (QREFELT $ 18)) '|Multi|)
                  (COND
                   ((SPADCALL (QREFELT $ 10) 1 (QREFELT $ 25))
                    (SPADCALL (QREFELT $ 8)
                              (VECTOR
                               (LIST
                                (SPADCALL
                                 (PROGN
                                  (LETT #8# NIL . #9#)
                                  (SEQ (LETT |i| NIL . #9#)
                                       (LETT #7# (SPADCALL |jv| (QREFELT $ 21))
                                             . #9#)
                                       G190
                                       (COND
                                        ((OR (ATOM #7#)
                                             (PROGN
                                              (LETT |i| (CAR #7#) . #9#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #8#
                                               (CONS
                                                (SPADCALL |i| (QREFELT $ 39))
                                                #8#)
                                               . #9#)))
                                       (LETT #7# (CDR #7#) . #9#) (GO G190)
                                       G191 (EXIT (NREVERSE #8#))))
                                 (QREFELT $ 41)))
                               (LIST
                                (SPADCALL (SPADCALL |jv| (QREFELT $ 23))
                                          (QREFELT $ 36)))
                               NIL NIL NIL)
                              (QREFELT $ 43)))
                   (#10#
                    (SPADCALL (QREFELT $ 8)
                              (LIST
                               (SPADCALL
                                (PROGN
                                 (LETT #6# NIL . #9#)
                                 (SEQ (LETT |i| NIL . #9#)
                                      (LETT #5# (SPADCALL |jv| (QREFELT $ 21))
                                            . #9#)
                                      G190
                                      (COND
                                       ((OR (ATOM #5#)
                                            (PROGN
                                             (LETT |i| (CAR #5#) . #9#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #6#
                                              (CONS
                                               (SPADCALL |i| (QREFELT $ 39))
                                               #6#)
                                              . #9#)))
                                      (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                                      (EXIT (NREVERSE #6#))))
                                (QREFELT $ 41)))
                              (QREFELT $ 44)))))
                 ((SPADCALL (QREFELT $ 10) 1 (QREFELT $ 25))
                  (SPADCALL (QREFELT $ 8)
                            (VECTOR
                             (LIST
                              (SPADCALL
                               (PROGN
                                (LETT #4# NIL . #9#)
                                (SEQ (LETT |j| NIL . #9#)
                                     (LETT #3# (SPADCALL |jv| (QREFELT $ 46))
                                           . #9#)
                                     G190
                                     (COND
                                      ((OR (ATOM #3#)
                                           (PROGN
                                            (LETT |j| (CAR #3#) . #9#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #4#
                                             (CONS
                                              (SPADCALL |j| (QREFELT $ 36))
                                              #4#)
                                             . #9#)))
                                     (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                                     (EXIT (NREVERSE #4#))))
                               (QREFELT $ 47)))
                             (LIST
                              (SPADCALL (SPADCALL |jv| (QREFELT $ 23))
                                        (QREFELT $ 36)))
                             NIL NIL NIL)
                            (QREFELT $ 43)))
                 (#10#
                  (SPADCALL (QREFELT $ 8)
                            (LIST
                             (SPADCALL
                              (PROGN
                               (LETT #2# NIL . #9#)
                               (SEQ (LETT |j| NIL . #9#)
                                    (LETT #1# (SPADCALL |jv| (QREFELT $ 46))
                                          . #9#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |j| (CAR #1#) . #9#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS (SPADCALL |j| (QREFELT $ 36))
                                                  #2#)
                                            . #9#)))
                                    (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 47)))
                            (QREFELT $ 44)))))))) 

(PUT '|IJB;opdisp| '|SPADreplace| '|SPADfirst|) 

(SDEFUN |IJB;opdisp| ((|l| |List| (|OutputForm|)) ($ |OutputForm|))
        (|SPADfirst| |l|)) 

(SDEFUN |IJB;coerce;$E;15| ((|jv| $) ($ |Expression| (|Integer|)))
        (SPROG
         ((|arg| (|List| (|Expression| (|Integer|)))) (#1=#:G769 NIL) (|j| NIL)
          (#2=#:G768 NIL) (#3=#:G767 NIL) (|i| NIL) (#4=#:G766 NIL)
          (|jop| (|BasicOperator|)) (|tmp| (|None|)) (|opname| (|Symbol|)))
         (SEQ
          (COND
           ((EQUAL (SPADCALL |jv| (QREFELT $ 24)) '|Const|)
            (|spadConstant| $ 50))
           (#5='T
            (SEQ
             (LETT |opname| (SPADCALL |jv| (QREFELT $ 48))
                   . #6=(|IJB;coerce;$E;15|))
             (LETT |jop| (SPADCALL |opname| (QREFELT $ 52)) . #6#)
             (SPADCALL |jop| (CONS (|function| |IJB;opdisp|) $) (QREFELT $ 54))
             (LETT |tmp| (SPADCALL |jv| (QREFELT $ 57)) . #6#)
             (LETT |jop| (SPADCALL |jop| '|%symbol| |tmp| (QREFELT $ 58))
                   . #6#)
             (LETT |tmp|
                   (SPADCALL (SPADCALL |jv| (QREFELT $ 59)) (QREFELT $ 61))
                   . #6#)
             (LETT |jop| (SPADCALL |jop| '|%weight| |tmp| (QREFELT $ 58))
                   . #6#)
             (LETT |tmp|
                   (SPADCALL (SPADCALL |jv| (QREFELT $ 24)) (QREFELT $ 63))
                   . #6#)
             (LETT |jop| (SPADCALL |jop| '|%jet| |tmp| (QREFELT $ 58)) . #6#)
             (COND
              ((EQUAL (SPADCALL (QREFELT $ 18)) '|Multi|)
               (LETT |arg|
                     (PROGN
                      (LETT #4# NIL . #6#)
                      (SEQ (LETT |i| NIL . #6#)
                           (LETT #3# (SPADCALL |jv| (QREFELT $ 21)) . #6#) G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |i| (CAR #3#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4# (CONS (SPADCALL |i| (QREFELT $ 65)) #4#)
                                   . #6#)))
                           (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     . #6#))
              (#5#
               (LETT |arg|
                     (PROGN
                      (LETT #2# NIL . #6#)
                      (SEQ (LETT |j| NIL . #6#)
                           (LETT #1# (SPADCALL |jv| (QREFELT $ 46)) . #6#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |j| (CAR #1#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2# (CONS (SPADCALL |j| (QREFELT $ 65)) #2#)
                                   . #6#)))
                           (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     . #6#)))
             (LETT |arg|
                   (SPADCALL
                    (LIST (SPADCALL |opname| (QREFELT $ 66))
                          (SPADCALL (SPADCALL |jv| (QREFELT $ 23))
                                    (QREFELT $ 65)))
                    |arg| (QREFELT $ 68))
                   . #6#)
             (EXIT (SPADCALL |jop| |arg| (QREFELT $ 69))))))))) 

(DECLAIM (NOTINLINE |IndexedJetBundle;|)) 

(DEFUN |IndexedJetBundle| (&REST #1=#:G776)
  (SPROG NIL
         (PROG (#2=#:G777)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IndexedJetBundle|)
                                               '|domainEqualList|)
                    . #3=(|IndexedJetBundle|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IndexedJetBundle;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|IndexedJetBundle|)))))))))) 

(DEFUN |IndexedJetBundle;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|IndexedJetBundle|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|IndexedJetBundle| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 77) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|IndexedJetBundle|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 11 (|List| (|NonNegativeInteger|)))
    (QSETREFV $ 12 '|Repeated|)
    $))) 

(MAKEPROP '|IndexedJetBundle| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) '|Rep| '|notation|
              (|Boolean|) (|Symbol|) (|List| 14) (0 . |member?|)
              |IJB;setNotation;2S;1| |IJB;getNotation;S;2| (6 . |copy|)
              (|List| 28) |IJB;multiIndex;$L;3| (|PositiveInteger|)
              |IJB;index;$Pi;4| |IJB;type;$S;5| (11 . >) |IJB;X;Pi$;7|
              |IJB;U;Pi$;8| (|NonNegativeInteger|) (17 . |#|) (22 . ~=)
              |IJB;Pm;PiL$;9|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |IJB;One;$;10|) $))
              |IJB;numIndVar;Pi;11| |IJB;numDepVar;Pi;12| (|OutputForm|)
              (28 . |coerce|) (|List| 35) (33 . |superscript|) (39 . |coerce|)
              (|List| $) (44 . |bracket|)
              (|Record| (|:| |sub| 37) (|:| |sup| 37) (|:| |presup| 37)
                        (|:| |presub| 37) (|:| |args| 37))
              (49 . |script|) (55 . |subscript|) (|List| 22)
              (61 . |repeatedIndex|) (66 . |blankSeparate|) |IJB;name;$S;13|
              (|Expression| 64) (71 . |One|) (|BasicOperator|)
              (75 . |operator|) (|Mapping| 35 37) (80 . |display|) (|None|)
              (|NoneFunctions1| $$) (86 . |coerce|) (91 . |setProperty|)
              (98 . |weight|) (|NoneFunctions1| 28) (103 . |coerce|)
              (|NoneFunctions1| 14) (108 . |coerce|) (|Integer|)
              (113 . |coerce|) (118 . |coerce|) (|List| 49) (123 . |concat!|)
              (129 . |kernel|) |IJB;coerce;$E;15| (|Union| $ '"failed")
              (|Union| $ '"0") (|List| 45) (|HashState|) (|String|)
              (|SingleInteger|))
           '#(~= 135 |weight| 141 |variables| 146 |type| 157 |smaller?| 162
              |setNotation| 168 |repeatedIndex| 173 |r2m| 178 |order| 183
              |one?| 188 |numIndVar| 193 |numDepVar| 197 |name| 201
              |multiIndex| 206 |min| 211 |max| 217 |m2r| 223 |latex| 228
              |integrateIfCan| 233 |integrate| 239 |index| 245 |hashUpdate!|
              250 |hash| 256 |getNotation| 261 |dimS| 265 |dimJ| 270
              |differentiate| 275 |derivativeOf?| 281 |coerce| 287 |class| 297
              |allRepeated| 307 X 312 U 321 |Pr| 330 |Pm| 336 P 342 |One| 364
              >= 368 > 374 = 380 <= 386 < 392)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|JetBundleCategory&| |OrderedSet&| NIL |SetCategory&|
                     |BasicType&| NIL |PartialOrder&| NIL)
                  (CONS
                   '#((|JetBundleCategory|) (|OrderedSet|) (|Comparable|)
                      (|SetCategory|) (|BasicType|) (|CoercibleTo| 49)
                      (|PartialOrder|) (|CoercibleTo| 35))
                   (|makeByteWordVec2| 76
                                       '(2 15 13 14 0 16 1 11 0 0 19 2 22 13 0
                                         0 25 1 11 28 0 29 2 28 13 0 0 30 1 22
                                         35 0 36 2 14 0 0 37 38 1 28 35 0 39 1
                                         35 0 40 41 2 14 0 0 42 43 2 14 0 0 37
                                         44 1 0 45 0 46 1 35 0 40 47 0 49 0 50
                                         1 51 0 14 52 2 51 0 0 53 54 1 56 55 2
                                         57 3 51 0 0 14 55 58 1 0 28 0 59 1 60
                                         55 28 61 1 62 55 14 63 1 49 0 64 65 1
                                         49 0 14 66 2 67 0 0 0 68 2 49 0 51 40
                                         69 2 0 13 0 0 1 1 0 28 0 59 1 0 40 28
                                         1 2 0 40 28 22 1 1 0 14 0 24 2 0 13 0
                                         0 1 1 0 14 14 17 1 0 45 0 46 1 0 20 45
                                         1 1 0 28 0 1 1 0 13 0 1 0 0 22 33 0 0
                                         22 34 1 0 14 0 48 1 0 20 0 21 2 0 0 0
                                         0 1 2 0 0 0 0 1 1 0 45 20 1 1 0 75 0 1
                                         2 0 71 0 22 1 2 0 0 0 22 1 1 0 22 0 23
                                         2 0 74 74 0 1 1 0 76 0 1 0 0 14 18 1 0
                                         28 28 1 1 0 28 28 1 2 0 72 0 22 1 2 0
                                         20 0 0 1 1 0 49 0 70 1 0 35 0 1 1 0 28
                                         0 1 1 0 28 20 1 1 0 73 20 1 0 0 0 1 1
                                         0 0 22 26 0 0 0 1 1 0 0 22 27 2 0 0 22
                                         45 1 2 0 0 22 20 31 1 0 0 28 1 1 0 0
                                         20 1 2 0 0 22 28 1 2 0 0 22 20 1 0 0 0
                                         32 2 0 13 0 0 1 2 0 13 0 0 1 2 0 13 0
                                         0 1 2 0 13 0 0 1 2 0 13 0 0 1)))))
           '|lookupComplete|)) 
