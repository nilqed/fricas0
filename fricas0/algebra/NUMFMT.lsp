
(SDEFUN |NUMFMT;replaceD| ((|c| |Character|) ($ |Character|))
        (COND ((|eql_SI| |c| (|STR_to_CHAR| "D")) (|STR_to_CHAR| "E"))
              ('T |c|))) 

(SDEFUN |NUMFMT;replaced| ((|c| |Character|) ($ |Character|))
        (COND ((|eql_SI| |c| (|STR_to_CHAR| "d")) (|STR_to_CHAR| "E"))
              ('T |c|))) 

(SDEFUN |NUMFMT;contract| ((|s| |String|) ($ |String|))
        (SPROG ((|ls| (|List| (|String|))))
               (SEQ
                (LETT |s|
                      (SPADCALL (CONS (|function| |NUMFMT;replaceD|) $) |s|
                                (QREFELT $ 8))
                      . #1=(|NUMFMT;contract|))
                (LETT |s|
                      (SPADCALL (CONS (|function| |NUMFMT;replaced|) $) |s|
                                (QREFELT $ 8))
                      . #1#)
                (LETT |ls| (SPADCALL |s| (|STR_to_CHAR| " ") (QREFELT $ 11))
                      . #1#)
                (EXIT (LETT |s| (SPADCALL |ls| (QREFELT $ 12)) . #1#))))) 

(SDEFUN |NUMFMT;check| ((|s| |String|) ($ |Boolean|))
        (COND
         ((NUMBERP (READ-FROM-STRING |s|))
          (COND
           ((SPADCALL (CONS #'|NUMFMT;check!0| $) |s| (QREFELT $ 17))
            (COND
             ((SPADCALL (CONS #'|NUMFMT;check!1| $) |s| (QREFELT $ 17)) 'T)
             (#1='T NIL)))
           (#1# 'T)))
         (#1# NIL))) 

(SDEFUN |NUMFMT;check!1| ((|c1| NIL) ($ NIL))
        (SPADCALL |c1| (SPADCALL "." (QREFELT $ 13)) (QREFELT $ 15))) 

(SDEFUN |NUMFMT;check!0| ((|c1| NIL) ($ NIL))
        (SPADCALL |c1| (SPADCALL "E" (QREFELT $ 13)) (QREFELT $ 15))) 

(SDEFUN |NUMFMT;ScanFloatIgnoreSpaces;SF;5| ((|s| |String|) ($ |Float|))
        (SPROG ((|res| (|Union| (|Float|) "failed")))
               (SEQ
                (LETT |res| (SPADCALL |s| (QREFELT $ 24))
                      |NUMFMT;ScanFloatIgnoreSpaces;SF;5|)
                (EXIT
                 (COND ((QEQCAR |res| 1) (|error| "Non-numeric value"))
                       ('T (QCDR |res|))))))) 

(SDEFUN |NUMFMT;ScanFloatIgnoreSpacesIfCan;SU;6|
        ((|s| |String|) ($ |Union| (|Float|) "failed"))
        (SPROG
         ((|f| (|Integer|)) (|sCheck| (|SExpression|)) (|sex| (|SExpression|)))
         (SEQ
          (LETT |s| (|NUMFMT;contract| |s| $)
                . #1=(|NUMFMT;ScanFloatIgnoreSpacesIfCan;SU;6|))
          (COND ((NULL (|NUMFMT;check| |s| $)) (EXIT (CONS 1 "failed"))))
          (LETT |sex|
                (|interpret| (|packageTran| (|ncParseFromString| |s|)) NIL)
                . #1#)
          (LETT |sCheck|
                (SPADCALL (SPADCALL |sex| (QREFELT $ 27)) (QREFELT $ 27))
                . #1#)
          (EXIT
           (COND
            ((|BooleanEquality|
              (SPADCALL |sCheck| (QREFELT $ 22) (QREFELT $ 28)) 'T)
             (LETT |f|
                   (CONS 0
                         (SPADCALL (SPADCALL |sex| (QREFELT $ 29))
                                   (QREFELT $ 29)))
                   . #1#))
            ((|BooleanEquality|
              (SPADCALL (SPADCALL |sex| (QREFELT $ 29)) (QREFELT $ 30)) 'T)
             (SEQ (LETT |f| (SPADCALL |sex| (QREFELT $ 29)) . #1#)
                  (EXIT (CONS 0 (SPADCALL |f| (QREFELT $ 32))))))
            ('T (CONS 1 "failed"))))))) 

(PUT '|NUMFMT;FormatArabic;PiS;7| '|SPADreplace| 'STRINGIMAGE) 

(SDEFUN |NUMFMT;FormatArabic;PiS;7| ((|n| |PositiveInteger|) ($ |String|))
        (STRINGIMAGE |n|)) 

(SDEFUN |NUMFMT;ScanArabic;SPi;8| ((|s| |String|) ($ |PositiveInteger|))
        (SPADCALL |s| (QREFELT $ 50))) 

(SDEFUN |NUMFMT;FormatRoman;PiS;9| ((|pn| |PositiveInteger|) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|mm| (|String|)) (#1=#:G771 NIL) (|j| NIL)
          (#2=#:G770 NIL) (|m0| (|String|)) (|n| (|Integer|)) (|d| (|Integer|))
          (|i| NIL) (#3=#:G757 NIL))
         (SEQ (LETT |n| |pn| . #4=(|NUMFMT;FormatRoman;PiS;9|))
              (LETT |d| (+ (REM |n| 10) (QREFELT $ 39)) . #4#)
              (LETT |n| (QUOTIENT2 |n| 10) . #4#)
              (LETT |s| (QAREF1 (QREFELT $ 36) |d|) . #4#)
              (EXIT
               (COND ((ZEROP |n|) |s|)
                     (#5='T
                      (SEQ (LETT |d| (+ (REM |n| 10) (QREFELT $ 40)) . #4#)
                           (LETT |n| (QUOTIENT2 |n| 10) . #4#)
                           (LETT |s| (STRCONC (QAREF1 (QREFELT $ 37) |d|) |s|)
                                 . #4#)
                           (EXIT
                            (COND ((ZEROP |n|) |s|)
                                  (#5#
                                   (SEQ
                                    (LETT |d| (+ (REM |n| 10) (QREFELT $ 41))
                                          . #4#)
                                    (LETT |n| (QUOTIENT2 |n| 10) . #4#)
                                    (LETT |s|
                                          (STRCONC (QAREF1 (QREFELT $ 38) |d|)
                                                   |s|)
                                          . #4#)
                                    (EXIT
                                     (COND ((ZEROP |n|) |s|)
                                           (#5#
                                            (SEQ (LETT |d| (REM |n| 10) . #4#)
                                                 (LETT |n| (QUOTIENT2 |n| 10)
                                                       . #4#)
                                                 (LETT |s|
                                                       (STRCONC
                                                        (|make_full_CVEC|
                                                         (PROG1
                                                             (LETT #3# |d|
                                                                   . #4#)
                                                           (|check_subtype2|
                                                            (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #3#))
                                                         (QREFELT $ 43))
                                                        |s|)
                                                       . #4#)
                                                 (EXIT
                                                  (COND ((ZEROP |n|) |s|)
                                                        (#5#
                                                         (SEQ
                                                          (SEQ
                                                           (LETT |i| 2 . #4#)
                                                           G190
                                                           (COND
                                                            ((NULL
                                                              (NULL
                                                               (ZEROP |n|)))
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |d|
                                                                  (REM |n| 10)
                                                                  . #4#)
                                                            (LETT |n|
                                                                  (QUOTIENT2
                                                                   |n| 10)
                                                                  . #4#)
                                                            (EXIT
                                                             (COND
                                                              ((ZEROP |d|)
                                                               "iterate")
                                                              ('T
                                                               (SEQ
                                                                (LETT |m0|
                                                                      (STRCONC
                                                                       (|make_full_CVEC|
                                                                        |i|
                                                                        (QREFELT
                                                                         $ 44))
                                                                       (STRCONC
                                                                        "I"
                                                                        (|make_full_CVEC|
                                                                         |i|
                                                                         (QREFELT
                                                                          $
                                                                          45))))
                                                                      . #4#)
                                                                (LETT |mm|
                                                                      (SPADCALL
                                                                       (PROGN
                                                                        (LETT
                                                                         #2#
                                                                         NIL
                                                                         . #4#)
                                                                        (SEQ
                                                                         (LETT
                                                                          |j| 1
                                                                          . #4#)
                                                                         (LETT
                                                                          #1#
                                                                          |d|
                                                                          . #4#)
                                                                         G190
                                                                         (COND
                                                                          ((|greater_SI|
                                                                            |j|
                                                                            #1#)
                                                                           (GO
                                                                            G191)))
                                                                         (SEQ
                                                                          (EXIT
                                                                           (LETT
                                                                            #2#
                                                                            (CONS
                                                                             |m0|
                                                                             #2#)
                                                                            . #4#)))
                                                                         (LETT
                                                                          |j|
                                                                          (|inc_SI|
                                                                           |j|)
                                                                          . #4#)
                                                                         (GO
                                                                          G190)
                                                                         G191
                                                                         (EXIT
                                                                          (NREVERSE
                                                                           #2#))))
                                                                       (QREFELT
                                                                        $ 12))
                                                                      . #4#)
                                                                (COND
                                                                 ((SPADCALL
                                                                   (QCSIZE |s|)
                                                                   0
                                                                   (QREFELT $
                                                                            53))
                                                                  (LETT |s|
                                                                        (STRCONC
                                                                         " "
                                                                         |s|)
                                                                        . #4#)))
                                                                (EXIT
                                                                 (LETT |s|
                                                                       (STRCONC
                                                                        |mm|
                                                                        |s|)
                                                                       . #4#)))))))
                                                           (LETT |i|
                                                                 (|inc_SI| |i|)
                                                                 . #4#)
                                                           (GO G190) G191
                                                           (EXIT NIL))
                                                          (EXIT
                                                           |s|)))))))))))))))))))) 

(SDEFUN |NUMFMT;ScanRoman;SPi;10| ((|s| |String|) ($ |PositiveInteger|))
        (SPROG
         ((#1=#:G782 NIL) (|Max| (|Integer|)) (|tot| (|Integer|))
          (|n| (|Integer|)) (#2=#:G785 NIL) (|i| (|Integer|))
          (|c| (|Character|)) (#3=#:G786 NIL) (|k| NIL)
          (|nprens| (|PositiveInteger|)))
         (SEQ
          (LETT |s| (SPADCALL |s| (QREFELT $ 55))
                . #4=(|NUMFMT;ScanRoman;SPi;10|))
          (LETT |tot| 0 . #4#) (LETT |Max| 0 . #4#)
          (LETT |i| (SPADCALL |s| (QREFELT $ 56)) . #4#)
          (SEQ G190
               (COND ((NULL (>= |i| (SPADCALL |s| (QREFELT $ 57)))) (GO G191)))
               (SEQ (LETT |c| (SPADCALL |s| |i| (QREFELT $ 58)) . #4#)
                    (LETT |i| (- |i| 1) . #4#)
                    (LETT |n| (QAREF1 (QREFELT $ 42) |c|) . #4#)
                    (COND
                     ((< |n| 0)
                      (COND
                       ((SPADCALL |c| (QREFELT $ 45) (QREFELT $ 59))
                        (|error|
                         (STRCONC "Improper character in Roman numeral: "
                                  (|make_full_CVEC| 1 |c|))))
                       ('T
                        (SEQ (LETT |nprens| 1 . #4#)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND
                                      ((|eql_SI| |c| (QREFELT $ 45))
                                       (>= |i| (SPADCALL |s| (QREFELT $ 57))))
                                      ('T NIL)))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |c| (SPADCALL |s| |i| (QREFELT $ 58))
                                         . #4#)
                                   (LETT |i| (- |i| 1) . #4#)
                                   (EXIT
                                    (COND
                                     ((|eql_SI| |c| (QREFELT $ 45))
                                      (LETT |nprens| (+ |nprens| 1) . #4#)))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT
                              (COND
                               ((SPADCALL |c| (QREFELT $ 46) (QREFELT $ 59))
                                (|error| "Improper Roman numeral: (x)"))
                               ('T
                                (SEQ
                                 (SEQ (LETT |k| 1 . #4#)
                                      (LETT #3# |nprens| . #4#) G190
                                      (COND
                                       ((OR (|greater_SI| |k| #3#)
                                            (NULL
                                             (>= |i|
                                                 (SPADCALL |s|
                                                           (QREFELT $ 57)))))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ
                                         (LETT |c|
                                               (SPADCALL |s| |i|
                                                         (QREFELT $ 58))
                                               . #4#)
                                         (LETT |i| (- |i| 1) . #4#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |c| (QREFELT $ 44)
                                                      (QREFELT $ 59))
                                            (PROGN
                                             (LETT #2#
                                                   (|error|
                                                    "Improper Roman numeral: unbalanced ')'")
                                                   . #4#)
                                             (GO #5=#:G774)))))))
                                       #5# (EXIT #2#))
                                      (LETT |k| (|inc_SI| |k|) . #4#) (GO G190)
                                      G191 (EXIT NIL))
                                 (EXIT
                                  (LETT |n|
                                        (SPADCALL 10 (+ |nprens| 2)
                                                  (QREFELT $ 60))
                                        . #4#)))))))))))
                    (EXIT
                     (COND ((< |n| |Max|) (LETT |tot| (- |tot| |n|) . #4#))
                           ('T
                            (SEQ (LETT |tot| (+ |tot| |n|) . #4#)
                                 (EXIT (LETT |Max| |n| . #4#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((SPADCALL |tot| 0 (QREFELT $ 61))
             (|error|
              (STRCONC "Improper Roman numeral: " (STRINGIMAGE |tot|))))
            ('T
             (PROG1 (LETT #1# |tot| . #4#)
               (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                 #1#)))))))) 

(DECLAIM (NOTINLINE |NumberFormats;|)) 

(DEFUN |NumberFormats| ()
  (SPROG NIL
         (PROG (#1=#:G788)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|NumberFormats|)
                    . #2=(|NumberFormats|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|NumberFormats|
                             (LIST (CONS NIL (CONS 1 (|NumberFormats;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|NumberFormats|)))))))))) 

(DEFUN |NumberFormats;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|NumberFormats|) . #1=(|NumberFormats|))
          (LETT $ (GETREFV 63) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|NumberFormats| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 22
                    (SPADCALL (SPADCALL "Float" (QREFELT $ 19))
                              (QREFELT $ 21)))
          (QSETREFV $ 36
                    (SPADCALL
                     (LIST #2="" #3="I" "II" "III" "IV" #4="V" "VI" "VII"
                           "VIII" "IX")
                     (QREFELT $ 35)))
          (QSETREFV $ 37
                    (SPADCALL
                     (LIST #2# #5="X" "XX" "XXX" "XL" #6="L" "LX" "LXX" "LXXX"
                           "XC")
                     (QREFELT $ 35)))
          (QSETREFV $ 38
                    (SPADCALL
                     (LIST #2# #7="C" "CC" "CCC" "CD" #8="D" "DC" "DCC" "DCCC"
                           "CM")
                     (QREFELT $ 35)))
          (QSETREFV $ 39 0)
          (QSETREFV $ 40 0)
          (QSETREFV $ 41 0)
          (QSETREFV $ 42 (MAKEARR1 256 -1))
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| " ") 0)
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| #3#) 1)
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| #4#) 5)
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| #5#) 10)
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| #6#) 50)
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| #7#) 100)
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| #8#) 500)
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| #9="M") 1000)
          (QSETREFV $ 43 (|STR_to_CHAR| #9#))
          (QSETREFV $ 44 (|STR_to_CHAR| "("))
          (QSETREFV $ 45 (|STR_to_CHAR| ")"))
          (QSETREFV $ 46 (|STR_to_CHAR| #3#))
          $))) 

(MAKEPROP '|NumberFormats| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Mapping| 10 10) (|String|) (0 . |map|)
              (|List| $) (|Character|) (6 . |split|) (12 . |concat|)
              (17 . |char|) (|Boolean|) (22 . =) (|Mapping| 14 10)
              (28 . |any?|) (|Symbol|) (34 . |coerce|) (|SExpression|)
              (39 . |convert|) '|sexfloat| (|Union| 25 '"failed")
              |NUMFMT;ScanFloatIgnoreSpacesIfCan;SU;6| (|Float|)
              |NUMFMT;ScanFloatIgnoreSpaces;SF;5| (44 . |car|) (49 . =)
              (55 . |cdr|) (60 . |integer?|) (|Integer|) (65 . |coerce|)
              (|List| 7) (|PrimitiveArray| 7) (70 . |construct|) '|units|
              '|tens| '|hunds| '|umin| '|tmin| '|hmin| '|romval| '|thou|
              '|plen| '|pren| '|ichar| (|PositiveInteger|)
              |NUMFMT;FormatArabic;PiS;7| (|ScanningUtilities|)
              (75 . |parse_integer|) |NUMFMT;ScanArabic;SPi;8|
              (|NonNegativeInteger|) (80 . >) |NUMFMT;FormatRoman;PiS;9|
              (86 . |upperCase|) (91 . |maxIndex|) (96 . |minIndex|)
              (101 . |elt|) (107 . ~=) (113 . ^) (119 . <=)
              |NUMFMT;ScanRoman;SPi;10|)
           '#(|ScanRoman| 125 |ScanFloatIgnoreSpacesIfCan| 130
              |ScanFloatIgnoreSpaces| 135 |ScanArabic| 140 |FormatRoman| 145
              |FormatArabic| 150)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 62
                                                 '(2 7 0 6 0 8 2 7 9 0 10 11 1
                                                   7 0 9 12 1 10 0 7 13 2 10 14
                                                   0 0 15 2 7 14 16 0 17 1 18 0
                                                   7 19 1 20 0 18 21 1 20 0 0
                                                   27 2 20 14 0 0 28 1 20 0 0
                                                   29 1 20 14 0 30 1 25 0 31 32
                                                   1 34 0 33 35 1 49 31 7 50 2
                                                   52 14 0 0 53 1 7 0 0 55 1 7
                                                   31 0 56 1 7 31 0 57 2 7 10 0
                                                   31 58 2 10 14 0 0 59 2 47 0
                                                   0 47 60 2 31 14 0 0 61 1 0
                                                   47 7 62 1 0 23 7 24 1 0 25 7
                                                   26 1 0 47 7 51 1 0 7 47 54 1
                                                   0 7 47 48)))))
           '|lookupComplete|)) 

(MAKEPROP '|NumberFormats| 'NILADIC T) 
