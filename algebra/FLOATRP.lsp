
(SDEFUN |FLOATRP;makeEq|
        ((|nres| |List| |Par|) (|lv| |List| (|Symbol|))
         ($ |List| (|Equation| (|Polynomial| |Par|))))
        (SPROG
         ((#1=#:G702 NIL) (|x| NIL) (#2=#:G703 NIL) (|r| NIL) (#3=#:G701 NIL))
         (SEQ
          (PROGN
           (LETT #3# NIL . #4=(|FLOATRP;makeEq|))
           (SEQ (LETT |r| NIL . #4#) (LETT #2# |nres| . #4#)
                (LETT |x| NIL . #4#) (LETT #1# |lv| . #4#) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #4#) NIL)
                      (ATOM #2#) (PROGN (LETT |r| (CAR #2#) . #4#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #3#
                        (CONS
                         (SPADCALL (SPADCALL |x| (QREFELT $ 9))
                                   (SPADCALL |r| (QREFELT $ 10))
                                   (QREFELT $ 12))
                         #3#)
                        . #4#)))
                (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#)) . #4#)
                (GO G190) G191 (EXIT (NREVERSE #3#))))))) 

(SDEFUN |FLOATRP;realRoots;FParL;2|
        ((|p| |Fraction| (|Polynomial| (|Integer|))) (|eps| |Par|)
         ($ |List| |Par|))
        (SPADCALL (SPADCALL |p| (QREFELT $ 15)) |eps| (QREFELT $ 18))) 

(SDEFUN |FLOATRP;realRoots;LLParL;3|
        ((|lp| |List| (|Fraction| (|Polynomial| (|Integer|))))
         (|lv| |List| (|Symbol|)) (|eps| |Par|) ($ |List| (|List| |Par|)))
        (SPROG
         ((|lden| (|List| #1=(|Polynomial| (|Integer|)))) (|dp| #1#)
          (#2=#:G720 NIL) (|p| NIL) (#3=#:G719 NIL)
          (|lnum| (|List| (|Polynomial| (|Integer|)))) (#4=#:G718 NIL)
          (#5=#:G717 NIL))
         (SEQ
          (LETT |lnum|
                (PROGN
                 (LETT #5# NIL . #6=(|FLOATRP;realRoots;LLParL;3|))
                 (SEQ (LETT |p| NIL . #6#) (LETT #4# |lp| . #6#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5# (CONS (SPADCALL |p| (QREFELT $ 15)) #5#)
                              . #6#)))
                      (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #6#)
          (LETT |lden|
                (PROGN
                 (LETT #3# NIL . #6#)
                 (SEQ (LETT |p| NIL . #6#) (LETT #2# |lp| . #6#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL
                           (LETT |dp| (SPADCALL |p| (QREFELT $ 20)) . #6#)
                           (|spadConstant| $ 21) (QREFELT $ 23))
                          (LETT #3# (CONS |dp| #3#) . #6#)))))
                      (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #6#)
          (EXIT (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT $ 27)))))) 

(SDEFUN |FLOATRP;solve;LParL;4|
        ((|lp| |List| (|Fraction| (|Polynomial| (|Integer|)))) (|eps| |Par|)
         ($ |List| (|List| (|Equation| (|Polynomial| |Par|)))))
        (SPROG
         ((#1=#:G744 NIL) (|numres| NIL) (#2=#:G743 NIL)
          (|lv| #3=(|List| (|Symbol|))) (#4=#:G731 NIL) (#5=#:G730 #3#)
          (#6=#:G732 #3#) (#7=#:G742 NIL) (|dp| #8=(|Polynomial| (|Integer|)))
          (#9=#:G724 NIL) (#10=#:G723 #3#) (#11=#:G725 #3#) (#12=#:G741 NIL)
          (|np| NIL) (|lden| (|List| #8#)) (#13=#:G740 NIL) (|p| NIL)
          (#14=#:G739 NIL) (|lnum| (|List| (|Polynomial| (|Integer|))))
          (#15=#:G738 NIL) (#16=#:G737 NIL))
         (SEQ
          (LETT |lnum|
                (PROGN
                 (LETT #16# NIL . #17=(|FLOATRP;solve;LParL;4|))
                 (SEQ (LETT |p| NIL . #17#) (LETT #15# |lp| . #17#) G190
                      (COND
                       ((OR (ATOM #15#)
                            (PROGN (LETT |p| (CAR #15#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #16# (CONS (SPADCALL |p| (QREFELT $ 15)) #16#)
                              . #17#)))
                      (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #16#))))
                . #17#)
          (LETT |lden|
                (PROGN
                 (LETT #14# NIL . #17#)
                 (SEQ (LETT |p| NIL . #17#) (LETT #13# |lp| . #17#) G190
                      (COND
                       ((OR (ATOM #13#)
                            (PROGN (LETT |p| (CAR #13#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL
                           (LETT |dp| (SPADCALL |p| (QREFELT $ 20)) . #17#)
                           (|spadConstant| $ 21) (QREFELT $ 23))
                          (LETT #14# (CONS |dp| #14#) . #17#)))))
                      (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #14#))))
                . #17#)
          (LETT |lv|
                (PROGN
                 (LETT #9# NIL . #17#)
                 (SEQ (LETT |np| NIL . #17#) (LETT #12# |lnum| . #17#) G190
                      (COND
                       ((OR (ATOM #12#)
                            (PROGN (LETT |np| (CAR #12#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #11# (SPADCALL |np| (QREFELT $ 30)) . #17#)
                         (COND
                          (#9#
                           (LETT #10# (SPADCALL #10# #11# (QREFELT $ 31))
                                 . #17#))
                          ('T
                           (PROGN
                            (LETT #10# #11# . #17#)
                            (LETT #9# 'T . #17#)))))))
                      (LETT #12# (CDR #12#) . #17#) (GO G190) G191 (EXIT NIL))
                 (COND (#9# #10#) (#18='T (|IdentityError| '|setUnion|))))
                . #17#)
          (COND
           ((SPADCALL |lden| NIL (QREFELT $ 32))
            (LETT |lv|
                  (SPADCALL |lv|
                            (PROGN
                             (LETT #4# NIL . #17#)
                             (SEQ (LETT |dp| NIL . #17#)
                                  (LETT #7# |lden| . #17#) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN
                                         (LETT |dp| (CAR #7#) . #17#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #6# (SPADCALL |dp| (QREFELT $ 30))
                                           . #17#)
                                     (COND
                                      (#4#
                                       (LETT #5#
                                             (SPADCALL #5# #6# (QREFELT $ 31))
                                             . #17#))
                                      ('T
                                       (PROGN
                                        (LETT #5# #6# . #17#)
                                        (LETT #4# 'T . #17#)))))))
                                  (LETT #7# (CDR #7#) . #17#) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#4# #5#)
                                   (#18# (|IdentityError| '|setUnion|))))
                            (QREFELT $ 31))
                  . #17#)))
          (EXIT
           (PROGN
            (LETT #2# NIL . #17#)
            (SEQ (LETT |numres| NIL . #17#)
                 (LETT #1# (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT $ 27))
                       . #17#)
                 G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |numres| (CAR #1#) . #17#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (|FLOATRP;makeEq| |numres| |lv| $) #2#)
                         . #17#)))
                 (LETT #1# (CDR #1#) . #17#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |FLOATRP;solve;LParL;5|
        ((|le| |List| (|Equation| (|Fraction| (|Polynomial| (|Integer|)))))
         (|eps| |Par|) ($ |List| (|List| (|Equation| (|Polynomial| |Par|)))))
        (SPROG
         ((#1=#:G767 NIL) (|numres| NIL) (#2=#:G766 NIL)
          (|lv| #3=(|List| (|Symbol|))) (#4=#:G752 NIL) (#5=#:G751 #3#)
          (#6=#:G753 #3#) (#7=#:G765 NIL) (|dp| #8=(|Polynomial| (|Integer|)))
          (#9=#:G749 NIL) (#10=#:G748 #3#) (#11=#:G750 #3#) (#12=#:G764 NIL)
          (|np| NIL) (|lden| (|List| #8#)) (#13=#:G763 NIL) (|p| NIL)
          (#14=#:G762 NIL) (|lnum| (|List| (|Polynomial| (|Integer|))))
          (#15=#:G761 NIL) (#16=#:G760 NIL)
          (|lp| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
          (#17=#:G759 NIL) (|ep| NIL) (#18=#:G758 NIL))
         (SEQ
          (LETT |lp|
                (PROGN
                 (LETT #18# NIL . #19=(|FLOATRP;solve;LParL;5|))
                 (SEQ (LETT |ep| NIL . #19#) (LETT #17# |le| . #19#) G190
                      (COND
                       ((OR (ATOM #17#)
                            (PROGN (LETT |ep| (CAR #17#) . #19#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #18#
                              (CONS
                               (SPADCALL (SPADCALL |ep| (QREFELT $ 36))
                                         (SPADCALL |ep| (QREFELT $ 37))
                                         (QREFELT $ 38))
                               #18#)
                              . #19#)))
                      (LETT #17# (CDR #17#) . #19#) (GO G190) G191
                      (EXIT (NREVERSE #18#))))
                . #19#)
          (LETT |lnum|
                (PROGN
                 (LETT #16# NIL . #19#)
                 (SEQ (LETT |p| NIL . #19#) (LETT #15# |lp| . #19#) G190
                      (COND
                       ((OR (ATOM #15#)
                            (PROGN (LETT |p| (CAR #15#) . #19#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #16# (CONS (SPADCALL |p| (QREFELT $ 15)) #16#)
                              . #19#)))
                      (LETT #15# (CDR #15#) . #19#) (GO G190) G191
                      (EXIT (NREVERSE #16#))))
                . #19#)
          (LETT |lden|
                (PROGN
                 (LETT #14# NIL . #19#)
                 (SEQ (LETT |p| NIL . #19#) (LETT #13# |lp| . #19#) G190
                      (COND
                       ((OR (ATOM #13#)
                            (PROGN (LETT |p| (CAR #13#) . #19#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL
                           (LETT |dp| (SPADCALL |p| (QREFELT $ 20)) . #19#)
                           (|spadConstant| $ 21) (QREFELT $ 23))
                          (LETT #14# (CONS |dp| #14#) . #19#)))))
                      (LETT #13# (CDR #13#) . #19#) (GO G190) G191
                      (EXIT (NREVERSE #14#))))
                . #19#)
          (LETT |lv|
                (PROGN
                 (LETT #9# NIL . #19#)
                 (SEQ (LETT |np| NIL . #19#) (LETT #12# |lnum| . #19#) G190
                      (COND
                       ((OR (ATOM #12#)
                            (PROGN (LETT |np| (CAR #12#) . #19#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #11# (SPADCALL |np| (QREFELT $ 30)) . #19#)
                         (COND
                          (#9#
                           (LETT #10# (SPADCALL #10# #11# (QREFELT $ 31))
                                 . #19#))
                          ('T
                           (PROGN
                            (LETT #10# #11# . #19#)
                            (LETT #9# 'T . #19#)))))))
                      (LETT #12# (CDR #12#) . #19#) (GO G190) G191 (EXIT NIL))
                 (COND (#9# #10#) (#20='T (|IdentityError| '|setUnion|))))
                . #19#)
          (COND
           ((SPADCALL |lden| NIL (QREFELT $ 32))
            (LETT |lv|
                  (SPADCALL |lv|
                            (PROGN
                             (LETT #4# NIL . #19#)
                             (SEQ (LETT |dp| NIL . #19#)
                                  (LETT #7# |lden| . #19#) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN
                                         (LETT |dp| (CAR #7#) . #19#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #6# (SPADCALL |dp| (QREFELT $ 30))
                                           . #19#)
                                     (COND
                                      (#4#
                                       (LETT #5#
                                             (SPADCALL #5# #6# (QREFELT $ 31))
                                             . #19#))
                                      ('T
                                       (PROGN
                                        (LETT #5# #6# . #19#)
                                        (LETT #4# 'T . #19#)))))))
                                  (LETT #7# (CDR #7#) . #19#) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#4# #5#)
                                   (#20# (|IdentityError| '|setUnion|))))
                            (QREFELT $ 31))
                  . #19#)))
          (EXIT
           (PROGN
            (LETT #2# NIL . #19#)
            (SEQ (LETT |numres| NIL . #19#)
                 (LETT #1# (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT $ 27))
                       . #19#)
                 G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |numres| (CAR #1#) . #19#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (|FLOATRP;makeEq| |numres| |lv| $) #2#)
                         . #19#)))
                 (LETT #1# (CDR #1#) . #19#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |FLOATRP;solve;FParL;6|
        ((|p| |Fraction| (|Polynomial| (|Integer|))) (|eps| |Par|)
         ($ |List| (|Equation| (|Polynomial| |Par|))))
        (SPROG
         ((#1=#:G776 NIL) (|val| NIL) (#2=#:G775 NIL)
          (|x| (|Polynomial| |Par|)) (|mvar| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |mvar| (SPADCALL (SPADCALL |p| (QREFELT $ 15)) (QREFELT $ 42))
                . #3=(|FLOATRP;solve;FParL;6|))
          (EXIT
           (COND ((QEQCAR |mvar| 1) (|error| "no variable found"))
                 ('T
                  (SEQ (LETT |x| (SPADCALL (QCDR |mvar|) (QREFELT $ 9)) . #3#)
                       (EXIT
                        (PROGN
                         (LETT #2# NIL . #3#)
                         (SEQ (LETT |val| NIL . #3#)
                              (LETT #1# (SPADCALL |p| |eps| (QREFELT $ 19))
                                    . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |val| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (SPADCALL |x|
                                                 (SPADCALL |val|
                                                           (QREFELT $ 10))
                                                 (QREFELT $ 12))
                                       #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |FLOATRP;solve;EParL;7|
        ((|eq| |Equation| (|Fraction| (|Polynomial| (|Integer|))))
         (|eps| |Par|) ($ |List| (|Equation| (|Polynomial| |Par|))))
        (SPADCALL
         (SPADCALL (SPADCALL |eq| (QREFELT $ 36))
                   (SPADCALL |eq| (QREFELT $ 37)) (QREFELT $ 38))
         |eps| (QREFELT $ 44))) 

(DECLAIM (NOTINLINE |FloatingRealPackage;|)) 

(DEFUN |FloatingRealPackage| (#1=#:G778)
  (SPROG NIL
         (PROG (#2=#:G779)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FloatingRealPackage|)
                                               '|domainEqualList|)
                    . #3=(|FloatingRealPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FloatingRealPackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FloatingRealPackage|)))))))))) 

(DEFUN |FloatingRealPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FloatingRealPackage|))
          (LETT |dv$| (LIST '|FloatingRealPackage| DV$1) . #1#)
          (LETT $ (GETREFV 46) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FloatingRealPackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FloatingRealPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|)
              (|Polynomial| 6) (0 . |coerce|) (5 . |coerce|) (|Equation| 8)
              (10 . |equation|) (|Polynomial| (|Integer|)) (|Fraction| 13)
              (16 . |numer|) (|List| 6)
              (|InnerNumericFloatSolvePackage| (|Integer|) 6 6)
              (21 . |innerSolve1|) |FLOATRP;realRoots;FParL;2| (27 . |denom|)
              (32 . |One|) (|Boolean|) (36 . ~=) (|List| 16) (|List| 13)
              (|List| 7) (42 . |innerSolve|) (|List| 14)
              |FLOATRP;realRoots;LLParL;3| (50 . |variables|) (55 . |setUnion|)
              (61 . ~=) (|List| 43) |FLOATRP;solve;LParL;4| (|Equation| 14)
              (67 . |lhs|) (72 . |rhs|) (77 . -) (|List| 35)
              |FLOATRP;solve;LParL;5| (|Union| 7 '"failed")
              (83 . |mainVariable|) (|List| 11) |FLOATRP;solve;FParL;6|
              |FLOATRP;solve;EParL;7|)
           '#(|solve| 88 |realRoots| 112) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 45
                                                 '(1 8 0 7 9 1 8 0 6 10 2 11 0
                                                   8 8 12 1 14 13 0 15 2 17 16
                                                   13 6 18 1 14 13 0 20 0 13 0
                                                   21 2 13 22 0 0 23 4 17 24 25
                                                   25 26 6 27 1 13 26 0 30 2 26
                                                   0 0 0 31 2 25 22 0 0 32 1 35
                                                   14 0 36 1 35 14 0 37 2 14 0
                                                   0 0 38 1 13 41 0 42 2 0 33
                                                   28 6 34 2 0 43 14 6 44 2 0
                                                   33 39 6 40 2 0 43 35 6 45 2
                                                   0 16 14 6 19 3 0 24 28 26 6
                                                   29)))))
           '|lookupComplete|)) 
