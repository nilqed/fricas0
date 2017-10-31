
(SDEFUN |FLOATCP;complexRoots;FParL;1|
        ((|q| |Fraction| (|Polynomial| (|Complex| (|Integer|)))) (|eps| |Par|)
         ($ |List| (|Complex| |Par|)))
        (SPROG ((|p| (|Polynomial| (|Complex| (|Integer|)))))
               (SEQ
                (LETT |p| (SPADCALL |q| (QREFELT $ 9))
                      |FLOATCP;complexRoots;FParL;1|)
                (EXIT
                 (SPADCALL (SPADCALL |p| (QREFELT $ 11)) |eps|
                           (QREFELT $ 14)))))) 

(SDEFUN |FLOATCP;complexRoots;LLParL;2|
        ((|lp| |List| (|Fraction| (|Polynomial| (|Complex| (|Integer|)))))
         (|lv| |List| (|Symbol|)) (|eps| |Par|)
         ($ |List| (|List| (|Complex| |Par|))))
        (SPROG
         ((|lden| (|List| #1=(|Polynomial| (|Complex| (|Integer|)))))
          (|dp| #1#) (#2=#:G718 NIL) (|p| NIL) (#3=#:G717 NIL)
          (|lnum| (|List| (|Polynomial| (|Complex| (|Integer|)))))
          (#4=#:G716 NIL) (#5=#:G715 NIL))
         (SEQ
          (LETT |lnum|
                (PROGN
                 (LETT #5# NIL . #6=(|FLOATCP;complexRoots;LLParL;2|))
                 (SEQ (LETT |p| NIL . #6#) (LETT #4# |lp| . #6#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5# (CONS (SPADCALL |p| (QREFELT $ 9)) #5#)
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
                           (LETT |dp| (SPADCALL |p| (QREFELT $ 16)) . #6#)
                           (|spadConstant| $ 17) (QREFELT $ 19))
                          (LETT #3# (CONS |dp| #3#) . #6#)))))
                      (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #6#)
          (EXIT (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT $ 24)))))) 

(SDEFUN |FLOATCP;complexSolve;LParL;3|
        ((|lp| |List| (|Fraction| (|Polynomial| (|Complex| (|Integer|)))))
         (|eps| |Par|)
         ($ |List| (|List| (|Equation| (|Polynomial| (|Complex| |Par|))))))
        (SPROG
         ((#1=#:G745 NIL) (|x| NIL) (#2=#:G746 NIL) (|r| NIL) (#3=#:G744 NIL)
          (#4=#:G743 NIL) (|nres| NIL) (#5=#:G742 NIL)
          (|lv| #6=(|List| (|Symbol|))) (#7=#:G729 NIL) (#8=#:G728 #6#)
          (#9=#:G730 #6#) (#10=#:G741 NIL)
          (|dp| #11=(|Polynomial| (|Complex| (|Integer|)))) (#12=#:G722 NIL)
          (#13=#:G721 #6#) (#14=#:G723 #6#) (#15=#:G740 NIL) (|np| NIL)
          (|lden| (|List| #11#)) (#16=#:G739 NIL) (|p| NIL) (#17=#:G738 NIL)
          (|lnum| (|List| (|Polynomial| (|Complex| (|Integer|)))))
          (#18=#:G737 NIL) (#19=#:G736 NIL))
         (SEQ
          (LETT |lnum|
                (PROGN
                 (LETT #19# NIL . #20=(|FLOATCP;complexSolve;LParL;3|))
                 (SEQ (LETT |p| NIL . #20#) (LETT #18# |lp| . #20#) G190
                      (COND
                       ((OR (ATOM #18#)
                            (PROGN (LETT |p| (CAR #18#) . #20#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #19# (CONS (SPADCALL |p| (QREFELT $ 9)) #19#)
                              . #20#)))
                      (LETT #18# (CDR #18#) . #20#) (GO G190) G191
                      (EXIT (NREVERSE #19#))))
                . #20#)
          (LETT |lden|
                (PROGN
                 (LETT #17# NIL . #20#)
                 (SEQ (LETT |p| NIL . #20#) (LETT #16# |lp| . #20#) G190
                      (COND
                       ((OR (ATOM #16#)
                            (PROGN (LETT |p| (CAR #16#) . #20#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL
                           (LETT |dp| (SPADCALL |p| (QREFELT $ 16)) . #20#)
                           (|spadConstant| $ 17) (QREFELT $ 19))
                          (LETT #17# (CONS |dp| #17#) . #20#)))))
                      (LETT #16# (CDR #16#) . #20#) (GO G190) G191
                      (EXIT (NREVERSE #17#))))
                . #20#)
          (LETT |lv|
                (PROGN
                 (LETT #12# NIL . #20#)
                 (SEQ (LETT |np| NIL . #20#) (LETT #15# |lnum| . #20#) G190
                      (COND
                       ((OR (ATOM #15#)
                            (PROGN (LETT |np| (CAR #15#) . #20#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #14# (SPADCALL |np| (QREFELT $ 27)) . #20#)
                         (COND
                          (#12#
                           (LETT #13# (SPADCALL #13# #14# (QREFELT $ 28))
                                 . #20#))
                          ('T
                           (PROGN
                            (LETT #13# #14# . #20#)
                            (LETT #12# 'T . #20#)))))))
                      (LETT #15# (CDR #15#) . #20#) (GO G190) G191 (EXIT NIL))
                 (COND (#12# #13#) (#21='T (|IdentityError| '|setUnion|))))
                . #20#)
          (COND
           ((SPADCALL |lden| NIL (QREFELT $ 29))
            (LETT |lv|
                  (SPADCALL |lv|
                            (PROGN
                             (LETT #7# NIL . #20#)
                             (SEQ (LETT |dp| NIL . #20#)
                                  (LETT #10# |lden| . #20#) G190
                                  (COND
                                   ((OR (ATOM #10#)
                                        (PROGN
                                         (LETT |dp| (CAR #10#) . #20#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #9# (SPADCALL |dp| (QREFELT $ 27))
                                           . #20#)
                                     (COND
                                      (#7#
                                       (LETT #8#
                                             (SPADCALL #8# #9# (QREFELT $ 28))
                                             . #20#))
                                      ('T
                                       (PROGN
                                        (LETT #8# #9# . #20#)
                                        (LETT #7# 'T . #20#)))))))
                                  (LETT #10# (CDR #10#) . #20#) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#7# #8#)
                                   (#21# (|IdentityError| '|setUnion|))))
                            (QREFELT $ 28))
                  . #20#)))
          (EXIT
           (PROGN
            (LETT #5# NIL . #20#)
            (SEQ (LETT |nres| NIL . #20#)
                 (LETT #4# (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT $ 24))
                       . #20#)
                 G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |nres| (CAR #4#) . #20#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #5#
                         (CONS
                          (PROGN
                           (LETT #3# NIL . #20#)
                           (SEQ (LETT |r| NIL . #20#) (LETT #2# |nres| . #20#)
                                (LETT |x| NIL . #20#) (LETT #1# |lv| . #20#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |x| (CAR #1#) . #20#) NIL)
                                      (ATOM #2#)
                                      (PROGN (LETT |r| (CAR #2#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |x| (QREFELT $ 32))
                                          (SPADCALL |r| (QREFELT $ 34))
                                          (QREFELT $ 36))
                                         #3#)
                                        . #20#)))
                                (LETT #1#
                                      (PROG1 (CDR #1#)
                                        (LETT #2# (CDR #2#) . #20#))
                                      . #20#)
                                (GO G190) G191 (EXIT (NREVERSE #3#))))
                          #5#)
                         . #20#)))
                 (LETT #4# (CDR #4#) . #20#) (GO G190) G191
                 (EXIT (NREVERSE #5#)))))))) 

(SDEFUN |FLOATCP;complexSolve;LParL;4|
        ((|le| |List|
          (|Equation| (|Fraction| (|Polynomial| (|Complex| (|Integer|))))))
         (|eps| |Par|)
         ($ |List| (|List| (|Equation| (|Polynomial| (|Complex| |Par|))))))
        (SPROG
         ((#1=#:G772 NIL) (|x| NIL) (#2=#:G773 NIL) (|r| NIL) (#3=#:G771 NIL)
          (#4=#:G770 NIL) (|nres| NIL) (#5=#:G769 NIL)
          (|lv| #6=(|List| (|Symbol|))) (#7=#:G754 NIL) (#8=#:G753 #6#)
          (#9=#:G755 #6#) (#10=#:G768 NIL)
          (|dp| #11=(|Polynomial| (|Complex| (|Integer|)))) (#12=#:G751 NIL)
          (#13=#:G750 #6#) (#14=#:G752 #6#) (#15=#:G767 NIL) (|np| NIL)
          (|lden| (|List| #11#)) (#16=#:G766 NIL) (|p| NIL) (#17=#:G765 NIL)
          (|lnum| (|List| (|Polynomial| (|Complex| (|Integer|)))))
          (#18=#:G764 NIL) (#19=#:G763 NIL)
          (|lp| (|List| (|Fraction| (|Polynomial| (|Complex| (|Integer|))))))
          (#20=#:G762 NIL) (|ep| NIL) (#21=#:G761 NIL))
         (SEQ
          (LETT |lp|
                (PROGN
                 (LETT #21# NIL . #22=(|FLOATCP;complexSolve;LParL;4|))
                 (SEQ (LETT |ep| NIL . #22#) (LETT #20# |le| . #22#) G190
                      (COND
                       ((OR (ATOM #20#)
                            (PROGN (LETT |ep| (CAR #20#) . #22#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #21#
                              (CONS
                               (SPADCALL (SPADCALL |ep| (QREFELT $ 40))
                                         (SPADCALL |ep| (QREFELT $ 41))
                                         (QREFELT $ 42))
                               #21#)
                              . #22#)))
                      (LETT #20# (CDR #20#) . #22#) (GO G190) G191
                      (EXIT (NREVERSE #21#))))
                . #22#)
          (LETT |lnum|
                (PROGN
                 (LETT #19# NIL . #22#)
                 (SEQ (LETT |p| NIL . #22#) (LETT #18# |lp| . #22#) G190
                      (COND
                       ((OR (ATOM #18#)
                            (PROGN (LETT |p| (CAR #18#) . #22#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #19# (CONS (SPADCALL |p| (QREFELT $ 9)) #19#)
                              . #22#)))
                      (LETT #18# (CDR #18#) . #22#) (GO G190) G191
                      (EXIT (NREVERSE #19#))))
                . #22#)
          (LETT |lden|
                (PROGN
                 (LETT #17# NIL . #22#)
                 (SEQ (LETT |p| NIL . #22#) (LETT #16# |lp| . #22#) G190
                      (COND
                       ((OR (ATOM #16#)
                            (PROGN (LETT |p| (CAR #16#) . #22#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL
                           (LETT |dp| (SPADCALL |p| (QREFELT $ 16)) . #22#)
                           (|spadConstant| $ 17) (QREFELT $ 19))
                          (LETT #17# (CONS |dp| #17#) . #22#)))))
                      (LETT #16# (CDR #16#) . #22#) (GO G190) G191
                      (EXIT (NREVERSE #17#))))
                . #22#)
          (LETT |lv|
                (PROGN
                 (LETT #12# NIL . #22#)
                 (SEQ (LETT |np| NIL . #22#) (LETT #15# |lnum| . #22#) G190
                      (COND
                       ((OR (ATOM #15#)
                            (PROGN (LETT |np| (CAR #15#) . #22#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #14# (SPADCALL |np| (QREFELT $ 27)) . #22#)
                         (COND
                          (#12#
                           (LETT #13# (SPADCALL #13# #14# (QREFELT $ 28))
                                 . #22#))
                          ('T
                           (PROGN
                            (LETT #13# #14# . #22#)
                            (LETT #12# 'T . #22#)))))))
                      (LETT #15# (CDR #15#) . #22#) (GO G190) G191 (EXIT NIL))
                 (COND (#12# #13#) (#23='T (|IdentityError| '|setUnion|))))
                . #22#)
          (COND
           ((SPADCALL |lden| NIL (QREFELT $ 29))
            (LETT |lv|
                  (SPADCALL |lv|
                            (PROGN
                             (LETT #7# NIL . #22#)
                             (SEQ (LETT |dp| NIL . #22#)
                                  (LETT #10# |lden| . #22#) G190
                                  (COND
                                   ((OR (ATOM #10#)
                                        (PROGN
                                         (LETT |dp| (CAR #10#) . #22#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #9# (SPADCALL |dp| (QREFELT $ 27))
                                           . #22#)
                                     (COND
                                      (#7#
                                       (LETT #8#
                                             (SPADCALL #8# #9# (QREFELT $ 28))
                                             . #22#))
                                      ('T
                                       (PROGN
                                        (LETT #8# #9# . #22#)
                                        (LETT #7# 'T . #22#)))))))
                                  (LETT #10# (CDR #10#) . #22#) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#7# #8#)
                                   (#23# (|IdentityError| '|setUnion|))))
                            (QREFELT $ 28))
                  . #22#)))
          (EXIT
           (PROGN
            (LETT #5# NIL . #22#)
            (SEQ (LETT |nres| NIL . #22#)
                 (LETT #4# (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT $ 24))
                       . #22#)
                 G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |nres| (CAR #4#) . #22#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #5#
                         (CONS
                          (PROGN
                           (LETT #3# NIL . #22#)
                           (SEQ (LETT |r| NIL . #22#) (LETT #2# |nres| . #22#)
                                (LETT |x| NIL . #22#) (LETT #1# |lv| . #22#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |x| (CAR #1#) . #22#) NIL)
                                      (ATOM #2#)
                                      (PROGN (LETT |r| (CAR #2#) . #22#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |x| (QREFELT $ 32))
                                          (SPADCALL |r| (QREFELT $ 34))
                                          (QREFELT $ 36))
                                         #3#)
                                        . #22#)))
                                (LETT #1#
                                      (PROG1 (CDR #1#)
                                        (LETT #2# (CDR #2#) . #22#))
                                      . #22#)
                                (GO G190) G191 (EXIT (NREVERSE #3#))))
                          #5#)
                         . #22#)))
                 (LETT #4# (CDR #4#) . #22#) (GO G190) G191
                 (EXIT (NREVERSE #5#)))))))) 

(SDEFUN |FLOATCP;complexSolve;FParL;5|
        ((|p| |Fraction| (|Polynomial| (|Complex| (|Integer|)))) (|eps| |Par|)
         ($ |List| (|Equation| (|Polynomial| (|Complex| |Par|)))))
        (SPROG
         ((#1=#:G782 NIL) (|val| NIL) (#2=#:G781 NIL)
          (|x| (|Polynomial| (|Complex| |Par|)))
          (|mvar| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |mvar| (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 46))
                . #3=(|FLOATCP;complexSolve;FParL;5|))
          (EXIT
           (COND ((QEQCAR |mvar| 1) (|error| "no variable found"))
                 ('T
                  (SEQ (LETT |x| (SPADCALL (QCDR |mvar|) (QREFELT $ 32)) . #3#)
                       (EXIT
                        (PROGN
                         (LETT #2# NIL . #3#)
                         (SEQ (LETT |val| NIL . #3#)
                              (LETT #1# (SPADCALL |p| |eps| (QREFELT $ 15))
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
                                                           (QREFELT $ 34))
                                                 (QREFELT $ 36))
                                       #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |FLOATCP;complexSolve;EParL;6|
        ((|eq| |Equation| (|Fraction| (|Polynomial| (|Complex| (|Integer|)))))
         (|eps| |Par|)
         ($ |List| (|Equation| (|Polynomial| (|Complex| |Par|)))))
        (SPADCALL
         (SPADCALL (SPADCALL |eq| (QREFELT $ 40))
                   (SPADCALL |eq| (QREFELT $ 41)) (QREFELT $ 42))
         |eps| (QREFELT $ 48))) 

(DECLAIM (NOTINLINE |FloatingComplexPackage;|)) 

(DEFUN |FloatingComplexPackage| (#1=#:G784)
  (SPROG NIL
         (PROG (#2=#:G785)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FloatingComplexPackage|)
                                               '|domainEqualList|)
                    . #3=(|FloatingComplexPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FloatingComplexPackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FloatingComplexPackage|)))))))))) 

(DEFUN |FloatingComplexPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FloatingComplexPackage|))
          (LETT |dv$| (LIST '|FloatingComplexPackage| DV$1) . #1#)
          (LETT $ (GETREFV 50) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FloatingComplexPackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FloatingComplexPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|Polynomial| (|Complex| (|Integer|))) (|Fraction| 7)
              (0 . |numer|)
              (|SparseUnivariatePolynomial| (|Complex| (|Integer|)))
              (5 . |univariate|) (|List| 33) (|ComplexRootPackage| 10 6)
              (10 . |complexZeros|) |FLOATCP;complexRoots;FParL;1|
              (16 . |denom|) (21 . |One|) (|Boolean|) (25 . ~=) (|List| 12)
              (|List| 7) (|List| 30)
              (|InnerNumericFloatSolvePackage| (|Complex| (|Integer|)) 33 6)
              (31 . |innerSolve|) (|List| 8) |FLOATCP;complexRoots;LLParL;2|
              (39 . |variables|) (44 . |setUnion|) (50 . ~=) (|Symbol|)
              (|Polynomial| 33) (56 . |coerce|) (|Complex| 6) (61 . |coerce|)
              (|Equation| 31) (66 . |equation|) (|List| 47)
              |FLOATCP;complexSolve;LParL;3| (|Equation| 8) (72 . |lhs|)
              (77 . |rhs|) (82 . -) (|List| 39) |FLOATCP;complexSolve;LParL;4|
              (|Union| 30 '"failed") (88 . |mainVariable|) (|List| 35)
              |FLOATCP;complexSolve;FParL;5| |FLOATCP;complexSolve;EParL;6|)
           '#(|complexSolve| 93 |complexRoots| 117) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 49
                                                 '(1 8 7 0 9 1 7 10 0 11 2 13
                                                   12 10 6 14 1 8 7 0 16 0 7 0
                                                   17 2 7 18 0 0 19 4 23 20 21
                                                   21 22 6 24 1 7 22 0 27 2 22
                                                   0 0 0 28 2 21 18 0 0 29 1 31
                                                   0 30 32 1 31 0 33 34 2 35 0
                                                   31 31 36 1 39 8 0 40 1 39 8
                                                   0 41 2 8 0 0 0 42 1 7 45 0
                                                   46 2 0 37 25 6 38 2 0 47 8 6
                                                   48 2 0 37 43 6 44 2 0 47 39
                                                   6 49 3 0 20 25 22 6 26 2 0
                                                   12 8 6 15)))))
           '|lookupComplete|)) 
