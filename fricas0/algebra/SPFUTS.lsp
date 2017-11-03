
(SDEFUN |SPFUTS;lambertW0;2UTS;1| ((|x| UTS) ($ UTS))
        (SPROG ((|dx| (UTS)))
               (SEQ
                (LETT |dx| (SPADCALL |x| (QREFELT $ 8))
                      |SPFUTS;lambertW0;2UTS;1|)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (CONS #'|SPFUTS;lambertW0;2UTS;1!1| (VECTOR |dx| $))
                   (QREFELT $ 29))
                  (QREFELT $ 12)))))) 

(SDEFUN |SPFUTS;lambertW0;2UTS;1!1| ((|s| NIL) ($$ NIL))
        (PROG ($ |dx|)
          (LETT $ (QREFELT $$ 1) . #1=(|SPFUTS;lambertW0;2UTS;1|))
          (LETT |dx| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (|spadConstant| $ 9)
                             (CONS #'|SPFUTS;lambertW0;2UTS;1!0|
                                   (VECTOR $ |s| |dx|))
                             (QREFELT $ 26))))))) 

(SDEFUN |SPFUTS;lambertW0;2UTS;1!0| (($$ NIL))
        (PROG (|dx| |s| $)
          (LETT |dx| (QREFELT $$ 2) NIL)
          (LETT |s| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL
              (SPADCALL |dx|
                        (SPADCALL
                         (SPADCALL (SPADCALL |s| (QREFELT $ 12))
                                   (QREFELT $ 13))
                         (QREFELT $ 14))
                        (QREFELT $ 15))
              (SPADCALL
               (SPADCALL (|spadConstant| $ 16) (SPADCALL |s| (QREFELT $ 12))
                         (QREFELT $ 17))
               (SPADCALL (|spadConstant| $ 18) (QREFELT $ 21)) (QREFELT $ 22))
              (QREFELT $ 15))
             (QREFELT $ 23)))))) 

(SDEFUN |SPFUTS;compose| ((|s| |Stream| |Coef|) (|x| UTS) ($ UTS))
        (SPADCALL (SPADCALL |s| (SPADCALL |x| (QREFELT $ 23)) (QREFELT $ 31))
                  (QREFELT $ 12))) 

(SDEFUN |SPFUTS;p_re|
        ((|k| |Integer|) (|lcr| |List| |Coef|) ($ |Stream| |Coef|))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|SPFUTS;p_re!0| (VECTOR |k| $ |lcr|))
                          (QREFELT $ 48))))) 

(SDEFUN |SPFUTS;p_re!0| (($$ NIL))
        (PROG (|lcr| $ |k|)
          (LETT |lcr| (QREFELT $$ 2) . #1=(|SPFUTS;p_re|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |k| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|lm| NIL) (|ck_m| NIL) (#2=#:G717 NIL) (|cm| NIL)
              (#3=#:G716 NIL) (|m| NIL) (#4=#:G715 NIL) (|ss| NIL) (|two| NIL)
              (|three| NIL) (|ck| NIL))
             (SEQ (LETT |lm| (SPADCALL |lcr| (QREFELT $ 33)) NIL)
                  (LETT |ss| (|spadConstant| $ 9) NIL)
                  (SEQ (LETT |ck_m| NIL NIL)
                       (LETT #2# (SPADCALL |lcr| (QREFELT $ 36)) NIL)
                       (LETT |cm| NIL NIL) (LETT #3# |lm| NIL) (LETT |m| 2 NIL)
                       (LETT #4# (SPADCALL |k| 2 (QREFELT $ 35)) NIL) G190
                       (COND
                        ((OR (|greater_SI| |m| #4#) (ATOM #3#)
                             (PROGN (LETT |cm| (CAR #3#) NIL) NIL) (ATOM #2#)
                             (PROGN (LETT |ck_m| (CAR #2#) NIL) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |ss|
                               (SPADCALL |ss|
                                         (SPADCALL |cm| |ck_m| (QREFELT $ 37))
                                         (QREFELT $ 38))
                               NIL)))
                       (LETT |m|
                             (PROG1 (|inc_SI| |m|)
                               (LETT #3#
                                     (PROG1 (CDR #3#) (LETT #2# (CDR #2#) NIL))
                                     NIL))
                             NIL)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |two|
                        (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 18)
                                  (QREFELT $ 38))
                        NIL)
                  (LETT |three|
                        (SPADCALL |two| (|spadConstant| $ 18) (QREFELT $ 38))
                        NIL)
                  (LETT |ck|
                        (SPADCALL (SPADCALL |three| |ss| (QREFELT $ 37))
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |k| |two| (QREFELT $ 39))
                                    (|spadConstant| $ 18) (QREFELT $ 38))
                                   (SPADCALL
                                    (SPADCALL |k| (|spadConstant| $ 18)
                                              (QREFELT $ 39))
                                    |three| (QREFELT $ 40))
                                   (QREFELT $ 37))
                                  (QREFELT $ 41))
                        NIL)
                  (EXIT
                   (SPADCALL |ck|
                             (|SPFUTS;p_re|
                              (SPADCALL |k| (|spadConstant| $ 43)
                                        (QREFELT $ 44))
                              (SPADCALL |ck| |lcr| (QREFELT $ 45)) $)
                             (QREFELT $ 46))))))))) 

(SDEFUN |SPFUTS;p_stream| ((|g2| |Coef|) (|g3| |Coef|) ($ |Stream| |Coef|))
        (SPROG
         ((|c28| (|Coef|)) (|c20| (|Coef|)) (|c5| (|Coef|)) (|c4| (|Coef|))
          (|c2| (|Coef|)))
         (SEQ
          (LETT |c2|
                (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 18)
                          (QREFELT $ 38))
                . #1=(|SPFUTS;p_stream|))
          (LETT |c4| (SPADCALL |c2| |c2| (QREFELT $ 38)) . #1#)
          (LETT |c5| (SPADCALL |c4| (|spadConstant| $ 18) (QREFELT $ 38))
                . #1#)
          (LETT |c20| (SPADCALL |c4| |c5| (QREFELT $ 37)) . #1#)
          (LETT |c28|
                (SPADCALL |c4| (SPADCALL |c5| |c2| (QREFELT $ 38))
                          (QREFELT $ 37))
                . #1#)
          (EXIT
           (SPADCALL (|spadConstant| $ 9)
                     (SPADCALL (SPADCALL |g2| |c20| (QREFELT $ 41))
                               (SPADCALL (SPADCALL |g3| |c28| (QREFELT $ 41))
                                         (|SPFUTS;p_re| 4
                                          (LIST
                                           (SPADCALL |g3| |c28| (QREFELT $ 41))
                                           (SPADCALL |g2| |c20|
                                                     (QREFELT $ 41)))
                                          $)
                                         (QREFELT $ 46))
                               (QREFELT $ 46))
                     (QREFELT $ 46)))))) 

(SDEFUN |SPFUTS;weierstrassP0;2Coef2UTS;5|
        ((|g2| |Coef|) (|g3| |Coef|) (|x| UTS) ($ UTS))
        (|SPFUTS;compose| (|SPFUTS;p_stream| |g2| |g3| $)
         (SPADCALL |x| |x| (QREFELT $ 15)) $)) 

(SDEFUN |SPFUTS;weierstrassPPrime0;2Coef2UTS;6|
        ((|g2| |Coef|) (|g3| |Coef|) (|x| UTS) ($ UTS))
        (SPADCALL (SPADCALL (+ 1 1) |x| (QREFELT $ 50))
                  (|SPFUTS;compose|
                   (SPADCALL (|SPFUTS;p_stream| |g2| |g3| $) (QREFELT $ 51))
                   (SPADCALL |x| |x| (QREFELT $ 15)) $)
                  (QREFELT $ 15))) 

(SDEFUN |SPFUTS;weierstrassZeta0;2Coef2UTS;7|
        ((|g2| |Coef|) (|g3| |Coef|) (|x| UTS) ($ UTS))
        (SPROG ((|ps2| (|Stream| |Coef|)))
               (SEQ
                (LETT |ps2|
                      (SPADCALL (|SPFUTS;p_stream| |g2| |g3| $)
                                (SPADCALL (SPADCALL |x| |x| (QREFELT $ 15))
                                          (QREFELT $ 23))
                                (QREFELT $ 31))
                      |SPFUTS;weierstrassZeta0;2Coef2UTS;7|)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 9) |ps2| (QREFELT $ 53))
                   (QREFELT $ 12))
                  (QREFELT $ 13)))))) 

(SDEFUN |SPFUTS;weierstrassSigma0;2Coef2UTS;8|
        ((|g2| |Coef|) (|g3| |Coef|) (|x| UTS) ($ UTS))
        (SPROG
         ((|lsigma| #1=(|Stream| |Coef|)) (|zs| #1#) (|ps2| (|Stream| |Coef|)))
         (SEQ
          (LETT |ps2|
                (SPADCALL (|SPFUTS;p_stream| |g2| |g3| $)
                          (SPADCALL (SPADCALL |x| |x| (QREFELT $ 15))
                                    (QREFELT $ 23))
                          (QREFELT $ 31))
                . #2=(|SPFUTS;weierstrassSigma0;2Coef2UTS;8|))
          (LETT |zs| (SPADCALL (|spadConstant| $ 9) |ps2| (QREFELT $ 53))
                . #2#)
          (LETT |lsigma|
                (SPADCALL (|spadConstant| $ 9) (SPADCALL |zs| (QREFELT $ 55))
                          (QREFELT $ 53))
                . #2#)
          (EXIT
           (SPADCALL |x|
                     (SPADCALL (SPADCALL |lsigma| (QREFELT $ 57))
                               (QREFELT $ 12))
                     (QREFELT $ 15)))))) 

(DECLAIM (NOTINLINE |SpecialFunctionUnivariateTaylorSeries;|)) 

(DEFUN |SpecialFunctionUnivariateTaylorSeries| (&REST #1=#:G727)
  (SPROG NIL
         (PROG (#2=#:G728)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SpecialFunctionUnivariateTaylorSeries|)
                                               '|domainEqualList|)
                    . #3=(|SpecialFunctionUnivariateTaylorSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |SpecialFunctionUnivariateTaylorSeries;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SpecialFunctionUnivariateTaylorSeries|)))))))))) 

(DEFUN |SpecialFunctionUnivariateTaylorSeries;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|SpecialFunctionUnivariateTaylorSeries|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|SpecialFunctionUnivariateTaylorSeries| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 59) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|SpecialFunctionUnivariateTaylorSeries| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SpecialFunctionUnivariateTaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |differentiate|) (5 . |Zero|) (9 . |Zero|) (|Stream| 6)
              (13 . |series|) (18 . -) (23 . |exp|) (28 . *) (34 . |One|)
              (38 . +) (44 . |One|) (|PositiveInteger|) (48 . |One|) (52 . -)
              (57 . ^) (63 . |coefficients|) (|Mapping| 11)
              (|StreamTaylorSeriesOperations| 6) (68 . |lazyIntegrate|)
              (|Mapping| 11 11) (|ParadoxicalCombinatorsForStreams| 6) (74 . Y)
              |SPFUTS;lambertW0;2UTS;1| (79 . |compose|) (|List| 6)
              (85 . |reverse|) (|Integer|) (90 . -) (96 . |rest|) (101 . *)
              (107 . +) (113 . *) (119 . -) (125 . /) (|SingleInteger|)
              (131 . |One|) (135 . +) (141 . |cons|) (147 . |concat|)
              (|Mapping| $) (153 . |delay|) |SPFUTS;weierstrassP0;2Coef2UTS;5|
              (158 . *) (164 . |deriv|) |SPFUTS;weierstrassPPrime0;2Coef2UTS;6|
              (169 . |integrate|) |SPFUTS;weierstrassZeta0;2Coef2UTS;7|
              (175 . -) (|StreamTranscendentalFunctions| 6) (180 . |exp|)
              |SPFUTS;weierstrassSigma0;2Coef2UTS;8|)
           '#(|weierstrassZeta0| 185 |weierstrassSigma0| 192
              |weierstrassPPrime0| 199 |weierstrassP0| 206 |lambertW0| 213)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 58
                                                 '(1 7 0 0 8 0 6 0 9 0 7 0 10 1
                                                   7 0 11 12 1 7 0 0 13 1 7 0 0
                                                   14 2 7 0 0 0 15 0 7 0 16 2 7
                                                   0 0 0 17 0 6 0 18 0 19 0 20
                                                   1 6 0 0 21 2 7 0 0 6 22 1 7
                                                   11 0 23 2 25 11 6 24 26 1 28
                                                   11 27 29 2 25 11 11 11 31 1
                                                   32 0 0 33 2 34 0 0 0 35 1 32
                                                   0 0 36 2 6 0 0 0 37 2 6 0 0
                                                   0 38 2 6 0 34 0 39 2 6 0 0 0
                                                   40 2 6 0 0 0 41 0 42 0 43 2
                                                   34 0 0 0 44 2 32 0 6 0 45 2
                                                   11 0 6 0 46 1 11 0 47 48 2 7
                                                   0 19 0 50 1 25 11 11 51 2 25
                                                   11 6 11 53 1 25 11 11 55 1
                                                   56 11 11 57 3 0 7 6 6 7 54 3
                                                   0 7 6 6 7 58 3 0 7 6 6 7 52
                                                   3 0 7 6 6 7 49 1 0 7 7
                                                   30)))))
           '|lookupComplete|)) 
