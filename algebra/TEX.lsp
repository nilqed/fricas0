
(SDEFUN |TEX;new;$;1| (($ $)) (VECTOR (LIST "$$") (LIST "") (LIST "$$"))) 

(SDEFUN |TEX;newWithNum| ((|stepNum| |Integer|) ($ $))
        (SPROG ((|num| (|String|)))
               (SEQ
                (LETT |num|
                      (STRCONC (STRCONC "\\leqno(" (STRINGIMAGE |stepNum|))
                               ")"))
                (EXIT (VECTOR (LIST "$$") (LIST "") (LIST |num| "$$")))))) 

(SDEFUN |TEX;coerce;Of$;3| ((|expr| |OutputForm|) ($ $))
        (SPROG ((|f| ($)))
               (SEQ (LETT |f| (SPADCALL (QREFELT $ 22)))
                    (QSETVELT |f| 1
                              (LIST
                               (|TEX;postcondition|
                                (|TEX;formatExpr|
                                 (SPADCALL |expr| (QREFELT $ 25)) (QREFELT $ 9)
                                 $)
                                $)))
                    (EXIT |f|)))) 

(SDEFUN |TEX;convert;OfI$;4|
        ((|expr| |OutputForm|) (|stepNum| |Integer|) ($ $))
        (SPROG ((|f| ($)))
               (SEQ (LETT |f| (|TEX;newWithNum| |stepNum| $))
                    (QSETVELT |f| 1
                              (LIST
                               (|TEX;postcondition|
                                (|TEX;formatExpr|
                                 (SPADCALL |expr| (QREFELT $ 25)) (QREFELT $ 9)
                                 $)
                                $)))
                    (EXIT |f|)))) 

(PUT '|TEX;sayExpr| '|SPADreplace| '|sayTeX|) 

(SDEFUN |TEX;sayExpr| ((|s| |String|) ($ |Void|)) (|sayTeX| |s|)) 

(SDEFUN |TEX;display;$IV;6| ((|f| $) (|len| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G496 NIL) (|s| NIL) (#2=#:G495 NIL) (|t| NIL) (#3=#:G494 NIL)
          (#4=#:G493 NIL))
         (SEQ
          (SEQ (LETT |s| NIL) (LETT #4# (QVELT |f| 0)) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |s| (CAR #4#)) NIL)) (GO G191)))
               (SEQ (EXIT (|TEX;sayExpr| |s| $))) (LETT #4# (CDR #4#))
               (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |s| NIL) (LETT #3# (QVELT |f| 1)) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |s| (CAR #3#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |t| NIL) (LETT #2# (|TEX;splitLong| |s| |len| $))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (|TEX;sayExpr| |t| $))) (LETT #2# (CDR #2#))
                      (GO G190) G191 (EXIT NIL))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |s| NIL) (LETT #1# (QVELT |f| 2)) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (EXIT (|TEX;sayExpr| |s| $))) (LETT #1# (CDR #1#))
               (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (QREFELT $ 30)))))) 

(SDEFUN |TEX;display;$V;7| ((|f| $) ($ |Void|))
        (SPADCALL |f| $LINELENGTH (QREFELT $ 31))) 

(PUT '|TEX;prologue;$L;8| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 0))) 

(SDEFUN |TEX;prologue;$L;8| ((|f| $) ($ |List| (|String|))) (QVELT |f| 0)) 

(PUT '|TEX;tex;$L;9| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 1))) 

(SDEFUN |TEX;tex;$L;9| ((|f| $) ($ |List| (|String|))) (QVELT |f| 1)) 

(PUT '|TEX;epilogue;$L;10| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 2))) 

(SDEFUN |TEX;epilogue;$L;10| ((|f| $) ($ |List| (|String|))) (QVELT |f| 2)) 

(PUT '|TEX;setPrologue!;$2L;11| '|SPADreplace|
     '(XLAM (|f| |l|) (QSETVELT |f| 0 |l|))) 

(SDEFUN |TEX;setPrologue!;$2L;11|
        ((|f| $) (|l| |List| (|String|)) ($ |List| (|String|)))
        (QSETVELT |f| 0 |l|)) 

(PUT '|TEX;setTex!;$2L;12| '|SPADreplace|
     '(XLAM (|f| |l|) (QSETVELT |f| 1 |l|))) 

(SDEFUN |TEX;setTex!;$2L;12|
        ((|f| $) (|l| |List| (|String|)) ($ |List| (|String|)))
        (QSETVELT |f| 1 |l|)) 

(PUT '|TEX;setEpilogue!;$2L;13| '|SPADreplace|
     '(XLAM (|f| |l|) (QSETVELT |f| 2 |l|))) 

(SDEFUN |TEX;setEpilogue!;$2L;13|
        ((|f| $) (|l| |List| (|String|)) ($ |List| (|String|)))
        (QSETVELT |f| 2 |l|)) 

(SDEFUN |TEX;coerce;$Of;14| ((|f| $) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|String|))) (#1=#:G513 NIL) (|s| NIL) (#2=#:G512 NIL)
          (|t| NIL) (#3=#:G511 NIL) (#4=#:G510 NIL))
         (SEQ (LETT |l| NIL)
              (SEQ (LETT |s| NIL) (LETT #4# (QVELT |f| 0)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |s| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT |l| (CONS |s| |l|)))) (LETT #4# (CDR #4#))
                   (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |s| NIL) (LETT #3# (QVELT |f| 1)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |s| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |t| NIL)
                          (LETT #2# (|TEX;splitLong| |s| (- $LINELENGTH 4) $))
                          G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT |l| (CONS |t| |l|))))
                          (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |s| NIL) (LETT #1# (QVELT |f| 2)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT |l| (CONS |s| |l|)))) (LETT #1# (CDR #1#))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (REVERSE |l|) (QREFELT $ 40)))))) 

(SDEFUN |TEX;ungroup| ((|str| |String|) ($ |String|))
        (SPROG
         ((|u| (|UniversalSegment| (|Integer|))) (|rbrace| #1=(|Character|))
          (|lbrace| #1#) (|len| (|Integer|)))
         (SEQ (LETT |len| (QCSIZE |str|))
              (EXIT
               (COND ((< |len| 2) |str|)
                     ('T
                      (SEQ (LETT |lbrace| (|STR_to_CHAR| "{"))
                           (LETT |rbrace| (|STR_to_CHAR| "}"))
                           (COND
                            ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 44))
                                       |lbrace|)
                             (COND
                              ((|eql_SI| (SPADCALL |str| |len| (QREFELT $ 44))
                                         |rbrace|)
                               (SEQ
                                (LETT |u|
                                      (SPADCALL 2 (- |len| 1) (QREFELT $ 46)))
                                (EXIT
                                 (LETT |str|
                                       (SPADCALL |str| |u|
                                                 (QREFELT $ 47)))))))))
                           (EXIT |str|)))))))) 

(SDEFUN |TEX;postcondition| ((|str| |String|) ($ |String|))
        (SPROG
         ((#1=#:G526 NIL) (|i| NIL) (|minus| #2=(|Character|)) (|plus| #2#)
          (|len| (|Integer|)))
         (SEQ (LETT |str| (|TEX;ungroup| |str| $)) (LETT |len| (QCSIZE |str|))
              (LETT |plus| (|STR_to_CHAR| "+"))
              (LETT |minus| (|STR_to_CHAR| "-"))
              (EXIT
               (COND ((< |len| 4) |str|)
                     ('T
                      (SEQ
                       (SEQ (LETT |i| 1) (LETT #1# (- |len| 1)) G190
                            (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((|eql_SI| (SPADCALL |str| |i| (QREFELT $ 44))
                                          |plus|)
                                (COND
                                 ((|eql_SI|
                                   (SPADCALL |str| (+ |i| 1) (QREFELT $ 44))
                                   |minus|)
                                  (SPADCALL |str| |i| (|STR_to_CHAR| " ")
                                            (QREFELT $ 48))))))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |str|)))))))) 

(PUT '|TEX;stringify| '|SPADreplace| '|mathObject2String|) 

(SDEFUN |TEX;stringify| ((|expr| |OutputForm|) ($ |String|))
        (|mathObject2String| |expr|)) 

(SDEFUN |TEX;lineConcat|
        ((|line| |String|) (|lines| |List| (|String|)) ($ |List| (|String|)))
        (SPROG ((|length| (|NonNegativeInteger|)))
               (SEQ (LETT |length| (QCSIZE |line|))
                    (COND
                     ((> |length| 0)
                      (SEQ
                       (COND
                        ((|eql_SI| (SPADCALL |line| |length| (QREFELT $ 44))
                                   (|STR_to_CHAR| "\\"))
                         (LETT |line| (STRCONC |line| " "))))
                       (COND
                        ((|eql_SI| (SPADCALL |line| 1 (QREFELT $ 44))
                                   (|STR_to_CHAR| "%"))
                         (LETT |line| (STRCONC " \\" |line|)))
                        ((|eql_SI| (SPADCALL |line| 1 (QREFELT $ 44))
                                   (|STR_to_CHAR| "\\"))
                         (COND
                          ((> |length| 1)
                           (COND
                            ((|eql_SI| (SPADCALL |line| 2 (QREFELT $ 44))
                                       (|STR_to_CHAR| "%"))
                             (LETT |line| (STRCONC " " |line|))))))))
                       (EXIT (LETT |lines| (CONS |line| |lines|))))))
                    (EXIT |lines|)))) 

(SDEFUN |TEX;splitLong|
        ((|str| |String|) (|len| |Integer|) ($ |List| (|String|)))
        (SEQ (COND ((< |len| 20) (LETT |len| $LINELENGTH)))
             (EXIT (|TEX;splitLong1| |str| |len| $)))) 

(SDEFUN |TEX;splitLong1|
        ((|str| |String|) (|len| |Integer|) ($ |List| (|String|)))
        (SPROG
         ((|l| (|List| (|String|))) (|s| (|String|)) (|ls| (|Integer|))
          (|ownLine| (|Boolean|)) (|u| (|UniversalSegment| (|Integer|)))
          (|lss| (|Integer|)) (#1=#:G556 NIL) (|ss| NIL))
         (SEQ (LETT |l| NIL) (LETT |s| "") (LETT |ls| 0)
              (SEQ (LETT |ss| NIL)
                   (LETT #1#
                         (SPADCALL |str| (|STR_to_CHAR| " ") (QREFELT $ 50)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ss| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQUAL |ss| "\\\\")
                       (SEQ
                        (LETT |l| (|TEX;lineConcat| (STRCONC |s| |ss|) |l| $))
                        (LETT |s| "") (EXIT (LETT |ls| 0))))
                      ('T
                       (SEQ (LETT |lss| (QCSIZE |ss|))
                            (LETT |ownLine|
                                  (SEQ (LETT |u| (SPADCALL 1 4 (QREFELT $ 46)))
                                       (COND
                                        ((> |lss| 3)
                                         (COND
                                          ((EQUAL "\\end"
                                                  (SPADCALL |ss| |u|
                                                            (QREFELT $ 47)))
                                           (EXIT 'T)))))
                                       (LETT |u| (SPADCALL 1 5 (QREFELT $ 46)))
                                       (COND
                                        ((> |lss| 4)
                                         (COND
                                          ((EQUAL "\\left"
                                                  (SPADCALL |ss| |u|
                                                            (QREFELT $ 47)))
                                           (EXIT 'T)))))
                                       (LETT |u| (SPADCALL 1 6 (QREFELT $ 46)))
                                       (COND
                                        ((> |lss| 5)
                                         (COND
                                          ((OR
                                            (EQUAL "\\right"
                                                   (SPADCALL |ss| |u|
                                                             (QREFELT $ 47)))
                                            (EQUAL "\\begin"
                                                   (SPADCALL |ss| |u|
                                                             (QREFELT $ 47))))
                                           (EXIT 'T)))))
                                       (EXIT NIL)))
                            (COND
                             ((OR |ownLine| (> (+ |ls| |lss|) |len|))
                              (SEQ
                               (COND
                                ((NULL (SPADCALL |s| (QREFELT $ 52)))
                                 (LETT |l| (|TEX;lineConcat| |s| |l| $))))
                               (LETT |s| "") (EXIT (LETT |ls| 0)))))
                            (COND
                             ((OR |ownLine| (> |lss| |len|))
                              (EXIT (LETT |l| (|TEX;lineConcat| |ss| |l| $)))))
                            (COND
                             ((EQL |lss| 1)
                              (COND
                               ((|eql_SI| (SPADCALL |ss| 1 (QREFELT $ 44))
                                          (|STR_to_CHAR| "\\"))
                                (EXIT
                                 (SEQ (LETT |ls| (+ (+ |ls| |lss|) 2))
                                      (EXIT
                                       (LETT |s|
                                             (STRCONC |s|
                                                      (STRCONC |ss|
                                                               "  "))))))))))
                            (LETT |ls| (+ (+ |ls| |lss|) 1))
                            (EXIT
                             (LETT |s| (STRCONC |s| (STRCONC |ss| " ")))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND ((> |ls| 0) (LETT |l| (|TEX;lineConcat| |s| |l| $))))
              (EXIT (REVERSE |l|))))) 

(SDEFUN |TEX;group| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "{" |str| "}") (QREFELT $ 53))) 

(SDEFUN |TEX;addBraces| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "\\left\\{ " |str| " \\right\\}") (QREFELT $ 53))) 

(SDEFUN |TEX;addBrackets| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "\\left[ " |str| " \\right]") (QREFELT $ 53))) 

(SDEFUN |TEX;parenthesize| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "\\left( " |str| " \\right)") (QREFELT $ 53))) 

(SDEFUN |TEX;format_prime|
        ((|args| |List| (|OutputForm|)) (|prec| |Integer|) ($ |String|))
        (SPROG
         ((|narg2| #1=(|OutputForm|)) (|k| (|NonNegativeInteger|))
          (#2=#:G573 NIL) (|j| NIL) (#3=#:G572 NIL) (|i| NIL)
          (|res| (|String|)) (|n| (|NonNegativeInteger|))
          (|prime_str| (#4="\\prime")) (|c_char| (|Character|))
          (|arg2s| (|String|)) (|arg2| #1#))
         (SEQ (LETT |arg2| (SPADCALL |args| (QREFELT $ 55)))
              (LETT |narg2|
                    (COND
                     ((SPADCALL |arg2| (QREFELT $ 56))
                      (SEQ (LETT |arg2s| (SPADCALL |arg2| (QREFELT $ 57)))
                           (LETT |c_char| (|STR_to_CHAR| ","))
                           (EXIT
                            (COND
                             ((SPADCALL
                               (CONS #'|TEX;format_prime!0|
                                     (VECTOR $ |c_char|))
                               |arg2s| (QREFELT $ 60))
                              (SEQ (LETT |prime_str| #4#)
                                   (LETT |n| (QCSIZE |arg2s|))
                                   (EXIT
                                    (COND
                                     ((EQL |n| 1)
                                      (SPADCALL |prime_str| (QREFELT $ 61)))
                                     (#5='T
                                      (SEQ
                                       (LETT |res|
                                             (|make_full_CVEC|
                                              (* |n| (QCSIZE |prime_str|))
                                              (|STR_to_CHAR| " ")))
                                       (LETT |k| 1)
                                       (SEQ (LETT |i| 1) (LETT #3# |n|) G190
                                            (COND
                                             ((|greater_SI| |i| #3#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (SEQ (LETT |j| 1)
                                                   (LETT #2#
                                                         (QCSIZE |prime_str|))
                                                   G190
                                                   (COND
                                                    ((|greater_SI| |j| #2#)
                                                     (GO G191)))
                                                   (SEQ
                                                    (STR_SETELT1 |res| |k|
                                                                 (STR_ELT1
                                                                  |prime_str|
                                                                  |j|))
                                                    (EXIT
                                                     (LETT |k| (+ |k| 1))))
                                                   (LETT |j| (|inc_SI| |j|))
                                                   (GO G190) G191 (EXIT NIL))))
                                            (LETT |i| (|inc_SI| |i|)) (GO G190)
                                            G191 (EXIT NIL))
                                       (EXIT
                                        (SPADCALL |res| (QREFELT $ 61)))))))))
                             (#5# |arg2|)))))
                     (#5# |arg2|)))
              (EXIT
               (|TEX;formatSpecial| 'SUPERSUB
                (LIST (|SPADfirst| |args|) (SPADCALL (QREFELT $ 62)) |narg2|)
                |prec| $))))) 

(SDEFUN |TEX;format_prime!0| ((|c| NIL) ($$ NIL))
        (PROG (|c_char| $)
          (LETT |c_char| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |c| |c_char| (QREFELT $ 58)))))) 

(SDEFUN |TEX;formatSpecial|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|tmp| (|String|)) (|prescript| (|Boolean|))
          (|form| (|List| (|String|))) (#1=#:G625 NIL) (|u| NIL)
          (#2=#:G624 NIL))
         (SEQ (LETT |prescript| NIL)
              (EXIT
               (COND ((EQUAL |op| '|theMap|) "\\mbox{theMap(...)}")
                     ((EQUAL |op| 'AGGLST)
                      (|TEX;formatNary| '|,| "" 0 |args| |prec| $))
                     ((EQUAL |op| 'AGGSET)
                      (|TEX;formatNary| '|;| "" 0 |args| |prec| $))
                     ((EQUAL |op| 'TAG)
                      (|TEX;group|
                       (SPADCALL
                        (LIST (|TEX;formatExpr| (|SPADfirst| |args|) |prec| $)
                              "\\rightarrow"
                              (|TEX;formatExpr|
                               (SPADCALL |args| (QREFELT $ 55)) |prec| $))
                        (QREFELT $ 53))
                       $))
                     ((EQUAL |op| 'SLASH)
                      (|TEX;group|
                       (SPADCALL
                        (LIST (|TEX;formatExpr| (|SPADfirst| |args|) |prec| $)
                              "/"
                              (|TEX;formatExpr|
                               (SPADCALL |args| (QREFELT $ 55)) |prec| $))
                        (QREFELT $ 53))
                       $))
                     ((EQUAL |op| 'VCONCAT)
                      (|TEX;group|
                       (STRCONC "\\begin{array}{c}"
                                (STRCONC
                                 (SPADCALL
                                  (PROGN
                                   (LETT #2# NIL)
                                   (SEQ (LETT |u| NIL) (LETT #1# |args|) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN (LETT |u| (CAR #1#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (STRCONC
                                                  (|TEX;formatExpr| |u|
                                                   (QREFELT $ 9) $)
                                                  "\\\\")
                                                 #2#))))
                                        (LETT #1# (CDR #1#)) (GO G190) G191
                                        (EXIT (NREVERSE #2#))))
                                  (QREFELT $ 53))
                                 "\\end{array}"))
                       $))
                     ((EQUAL |op| 'CONCATB)
                      (|TEX;formatNary| 'STRSEP " \\ " 0 |args| |prec| $))
                     ((EQUAL |op| 'CONCAT)
                      (|TEX;formatNary| 'STRSEP "" 0 |args| (QREFELT $ 9) $))
                     ((EQUAL |op| 'QUOTE)
                      (|TEX;group|
                       (STRCONC "{\\tt '}"
                                (|TEX;formatExpr| (|SPADfirst| |args|)
                                 (QREFELT $ 9) $))
                       $))
                     ((EQUAL |op| 'BRACKET)
                      (|TEX;group|
                       (|TEX;addBrackets|
                        (|TEX;ungroup|
                         (|TEX;formatExpr| (|SPADfirst| |args|) (QREFELT $ 9)
                          $)
                         $)
                        $)
                       $))
                     ((EQUAL |op| 'BRACE)
                      (|TEX;group|
                       (|TEX;addBraces|
                        (|TEX;ungroup|
                         (|TEX;formatExpr| (|SPADfirst| |args|) (QREFELT $ 9)
                          $)
                         $)
                        $)
                       $))
                     ((EQUAL |op| 'PAREN)
                      (|TEX;group|
                       (|TEX;parenthesize|
                        (|TEX;ungroup|
                         (|TEX;formatExpr| (|SPADfirst| |args|) (QREFELT $ 9)
                          $)
                         $)
                        $)
                       $))
                     ((EQUAL |op| 'PRIME) (|TEX;format_prime| |args| |prec| $))
                     ((EQUAL |op| 'OVERBAR)
                      (COND ((NULL |args|) "")
                            (#3='T
                             (|TEX;group|
                              (SPADCALL
                               (LIST "\\overline "
                                     (|TEX;formatExpr| (|SPADfirst| |args|)
                                      (QREFELT $ 9) $))
                               (QREFELT $ 53))
                              $))))
                     ((EQUAL |op| 'ROOT)
                      (COND ((NULL |args|) "")
                            (#3#
                             (SEQ
                              (LETT |tmp|
                                    (|TEX;group|
                                     (|TEX;formatExpr| (|SPADfirst| |args|)
                                      (QREFELT $ 9) $)
                                     $))
                              (EXIT
                               (COND
                                ((NULL (CDR |args|))
                                 (|TEX;group|
                                  (SPADCALL (LIST "\\sqrt " |tmp|)
                                            (QREFELT $ 53))
                                  $))
                                (#3#
                                 (|TEX;group|
                                  (SPADCALL
                                   (LIST "\\root "
                                         (|TEX;group|
                                          (|TEX;formatExpr|
                                           (|SPADfirst| (CDR |args|))
                                           (QREFELT $ 9) $)
                                          $)
                                         " \\of " |tmp|)
                                   (QREFELT $ 53))
                                  $))))))))
                     ((EQUAL |op| 'SEGMENT)
                      (SEQ
                       (LETT |tmp|
                             (SPADCALL
                              (LIST
                               (|TEX;formatExpr| (|SPADfirst| |args|)
                                (QREFELT $ 9) $)
                               "..")
                              (QREFELT $ 53)))
                       (EXIT
                        (|TEX;group|
                         (COND ((NULL (CDR |args|)) |tmp|)
                               (#3#
                                (SPADCALL
                                 (LIST |tmp|
                                       (|TEX;formatExpr|
                                        (|SPADfirst| (CDR |args|))
                                        (QREFELT $ 9) $))
                                 (QREFELT $ 53))))
                         $))))
                     ((EQUAL |op| 'SUB)
                      (|TEX;group|
                       (SPADCALL
                        (LIST
                         (|TEX;formatExpr| (|SPADfirst| |args|) (QREFELT $ 9)
                          $)
                         " \\sb "
                         (|TEX;formatSpecial| 'AGGLST (CDR |args|)
                          (QREFELT $ 9) $))
                        (QREFELT $ 53))
                       $))
                     ((EQUAL |op| 'SUPERSUB)
                      (SEQ
                       (LETT |form|
                             (LIST
                              (|TEX;formatExpr| (|SPADfirst| |args|)
                               (QREFELT $ 9) $)))
                       (LETT |args| (CDR |args|))
                       (EXIT
                        (COND ((NULL |args|) (SPADCALL |form| (QREFELT $ 53)))
                              (#3#
                               (SEQ
                                (LETT |tmp|
                                      (|TEX;formatExpr| (|SPADfirst| |args|)
                                       (QREFELT $ 9) $))
                                (COND
                                 ((SPADCALL |tmp| "" (QREFELT $ 63))
                                  (COND
                                   ((SPADCALL |tmp| "{}" (QREFELT $ 63))
                                    (COND
                                     ((SPADCALL |tmp| " " (QREFELT $ 63))
                                      (LETT |form|
                                            (SPADCALL |form|
                                                      (LIST " \\sb "
                                                            (|TEX;group| |tmp|
                                                             $))
                                                      (QREFELT $ 64)))))))))
                                (LETT |args| (CDR |args|))
                                (EXIT
                                 (COND
                                  ((NULL |args|)
                                   (|TEX;group|
                                    (SPADCALL |form| (QREFELT $ 53)) $))
                                  (#3#
                                   (SEQ
                                    (LETT |tmp|
                                          (|TEX;formatExpr|
                                           (|SPADfirst| |args|) (QREFELT $ 9)
                                           $))
                                    (COND
                                     ((SPADCALL |tmp| "" (QREFELT $ 63))
                                      (COND
                                       ((SPADCALL |tmp| "{}" (QREFELT $ 63))
                                        (COND
                                         ((SPADCALL |tmp| " " (QREFELT $ 63))
                                          (LETT |form|
                                                (SPADCALL |form|
                                                          (LIST " \\sp "
                                                                (|TEX;group|
                                                                 |tmp| $))
                                                          (QREFELT $
                                                                   64)))))))))
                                    (LETT |args| (CDR |args|))
                                    (EXIT
                                     (COND
                                      ((NULL |args|)
                                       (|TEX;group|
                                        (SPADCALL |form| (QREFELT $ 53)) $))
                                      (#3#
                                       (SEQ
                                        (LETT |tmp|
                                              (|TEX;formatExpr|
                                               (|SPADfirst| |args|)
                                               (QREFELT $ 9) $))
                                        (COND
                                         ((SPADCALL |tmp| "" (QREFELT $ 63))
                                          (COND
                                           ((SPADCALL |tmp| "{}"
                                                      (QREFELT $ 63))
                                            (COND
                                             ((SPADCALL |tmp| " "
                                                        (QREFELT $ 63))
                                              (SEQ
                                               (LETT |form|
                                                     (SPADCALL
                                                      (LIST " \\sp "
                                                            (|TEX;group| |tmp|
                                                             $))
                                                      |form| (QREFELT $ 64)))
                                               (EXIT
                                                (LETT |prescript| 'T)))))))))
                                        (LETT |args| (CDR |args|))
                                        (EXIT
                                         (COND
                                          ((NULL |args|)
                                           (|TEX;group|
                                            (SPADCALL
                                             (COND
                                              (|prescript| (CONS "{}" |form|))
                                              (#3# |form|))
                                             (QREFELT $ 53))
                                            $))
                                          (#3#
                                           (SEQ
                                            (LETT |tmp|
                                                  (|TEX;formatExpr|
                                                   (|SPADfirst| |args|)
                                                   (QREFELT $ 9) $))
                                            (COND
                                             ((SPADCALL |tmp| ""
                                                        (QREFELT $ 63))
                                              (COND
                                               ((SPADCALL |tmp| "{}"
                                                          (QREFELT $ 63))
                                                (COND
                                                 ((SPADCALL |tmp| " "
                                                            (QREFELT $ 63))
                                                  (SEQ
                                                   (LETT |form|
                                                         (SPADCALL
                                                          (LIST " \\sb "
                                                                (|TEX;group|
                                                                 |tmp| $))
                                                          |form|
                                                          (QREFELT $ 64)))
                                                   (EXIT
                                                    (LETT |prescript|
                                                          'T)))))))))
                                            (EXIT
                                             (|TEX;group|
                                              (SPADCALL
                                               (COND
                                                (|prescript|
                                                 (CONS "{}" |form|))
                                                (#3# |form|))
                                               (QREFELT $ 53))
                                              $))))))))))))))))))))
                     ((EQUAL |op| 'SC)
                      (COND ((NULL |args|) "")
                            (#3#
                             (SEQ
                              (LETT |tmp|
                                    (|TEX;formatNaryNoGroup| 'STRSEP " \\\\ "
                                     800 |args| (QREFELT $ 9) $))
                              (EXIT
                               (|TEX;group|
                                (SPADCALL
                                 (LIST "\\begin{array}{l} " |tmp|
                                       " \\end{array} ")
                                 (QREFELT $ 53))
                                $))))))
                     ((EQUAL |op| 'MATRIX) (|TEX;formatMatrix| (CDR |args|) $))
                     ((EQUAL |op| 'ZAG)
                      (SPADCALL
                       (LIST " \\zag{"
                             (|TEX;formatExpr| (|SPADfirst| |args|)
                              (QREFELT $ 9) $)
                             "}{"
                             (|TEX;formatExpr| (|SPADfirst| (CDR |args|))
                              (QREFELT $ 9) $)
                             "}")
                       (QREFELT $ 53)))
                     (#3#
                      (SPADCALL
                       (LIST "not done yet for "
                             (SPADCALL |op| (QREFELT $ 66)))
                       (QREFELT $ 53)))))))) 

(SDEFUN |TEX;formatPlex|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|s| (|String|)) (|hold| (|String|)) (|n| (|Integer|))
          (|opPrec| (|Integer|)) (|p| (|Integer|)))
         (SEQ (LETT |p| (SPADCALL |op| (QREFELT $ 17) (QREFELT $ 68)))
              (EXIT
               (COND ((< |p| 1) (|error| "unknown plex op"))
                     (#1='T
                      (SEQ
                       (LETT |opPrec|
                             (SPADCALL (QREFELT $ 18) |p| (QREFELT $ 70)))
                       (LETT |n| (LENGTH |args|))
                       (COND
                        ((SPADCALL |n| 2 (QREFELT $ 71))
                         (COND
                          ((SPADCALL |n| 3 (QREFELT $ 71))
                           (EXIT
                            (|error| "wrong number of arguments for plex"))))))
                       (LETT |s|
                             (COND
                              ((OR (EQUAL |op| 'SIGMA) (EQUAL |op| 'SIGMA2))
                               "\\sum")
                              ((OR (EQUAL |op| 'PI) (EQUAL |op| 'PI2))
                               "\\prod")
                              ((EQUAL |op| 'INTSIGN) "\\int") (#1# "????")))
                       (LETT |hold|
                             (|TEX;formatExpr| (|SPADfirst| |args|)
                              (QREFELT $ 9) $))
                       (LETT |args| (CDR |args|))
                       (COND
                        ((SPADCALL |hold| "" (QREFELT $ 63))
                         (LETT |s|
                               (SPADCALL
                                (LIST |s| " \\sb"
                                      (|TEX;group|
                                       (SPADCALL
                                        (LIST "\\displaystyle " |hold|)
                                        (QREFELT $ 53))
                                       $))
                                (QREFELT $ 53)))))
                       (COND
                        ((NULL (NULL (CDR |args|)))
                         (SEQ
                          (LETT |hold|
                                (|TEX;formatExpr| (|SPADfirst| |args|)
                                 (QREFELT $ 9) $))
                          (COND
                           ((SPADCALL |hold| "" (QREFELT $ 63))
                            (LETT |s|
                                  (SPADCALL
                                   (LIST |s| " \\sp"
                                         (|TEX;group|
                                          (SPADCALL
                                           (LIST "\\displaystyle " |hold|)
                                           (QREFELT $ 53))
                                          $))
                                   (QREFELT $ 53)))))
                          (EXIT (LETT |args| (CDR |args|))))))
                       (LETT |s|
                             (SPADCALL
                              (LIST |s| " "
                                    (|TEX;formatExpr| (|SPADfirst| |args|)
                                     |opPrec| $))
                              (QREFELT $ 53)))
                       (COND
                        ((< |opPrec| |prec|)
                         (LETT |s| (|TEX;parenthesize| |s| $))))
                       (EXIT (|TEX;group| |s| $))))))))) 

(SDEFUN |TEX;formatMatrix| ((|args| |List| (|OutputForm|)) ($ |String|))
        (SPROG ((|cols| (|String|)) (#1=#:G644 NIL) (|i| NIL))
               (SEQ (LETT |cols| "{")
                    (SEQ (LETT |i| 1)
                         (LETT #1#
                               (LENGTH
                                (SPADCALL (|SPADfirst| |args|)
                                          (QREFELT $ 72))))
                         G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (EXIT (LETT |cols| (STRCONC |cols| "c"))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |cols| (STRCONC |cols| "} "))
                    (EXIT
                     (|TEX;group|
                      (|TEX;addBrackets|
                       (SPADCALL
                        (LIST "\\begin{array}" |cols|
                              (|TEX;formatNaryNoGroup| 'STRSEP " \\\\ " 0
                               |args| (QREFELT $ 9) $)
                              " \\end{array} ")
                        (QREFELT $ 53))
                       $)
                      $))))) 

(SDEFUN |TEX;formatFunction|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG ((|ops| (|String|)))
               (SEQ (LETT |ops| (|TEX;formatExpr| |op| (QREFELT $ 9) $))
                    (EXIT
                     (|TEX;group|
                      (SPADCALL
                       (LIST |ops| " "
                             (|TEX;parenthesize|
                              (|TEX;formatNary| '|,| "" 0 |args| (QREFELT $ 9)
                               $)
                              $))
                       (QREFELT $ 53))
                      $))))) 

(SDEFUN |TEX;formatNullary| ((|op| |Symbol|) ($ |String|))
        (COND ((EQUAL |op| 'NOTHING) "")
              ('T
               (|TEX;group|
                (SPADCALL (LIST (SPADCALL |op| (QREFELT $ 66)) "()")
                          (QREFELT $ 53))
                $)))) 

(SDEFUN |TEX;formatUnary|
        ((|op| |Symbol|) (|arg| |OutputForm|) (|prec| |Integer|) ($ |String|))
        (SPROG ((|s| (|String|)) (|opPrec| (|Integer|)) (|p| (|Integer|)))
               (SEQ (LETT |p| (SPADCALL |op| (QREFELT $ 10) (QREFELT $ 68)))
                    (EXIT
                     (COND ((< |p| 1) (|error| "unknown unary op"))
                           (#1='T
                            (SEQ
                             (LETT |opPrec|
                                   (SPADCALL (QREFELT $ 11) |p|
                                             (QREFELT $ 70)))
                             (LETT |s|
                                   (SPADCALL
                                    (LIST (SPADCALL |op| (QREFELT $ 66))
                                          (|TEX;formatExpr| |arg| |opPrec| $))
                                    (QREFELT $ 53)))
                             (EXIT
                              (COND
                               ((< |opPrec| |prec|)
                                (|TEX;group| (|TEX;parenthesize| |s| $) $))
                               ((EQUAL |op| '-) |s|)
                               (#1# (|TEX;group| |s| $))))))))))) 

(SDEFUN |TEX;formatBinary|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|s| (|String|)) (|ops| (|String|)) (|s2| #1=(|String|)) (|s1| #1#)
          (|opPrec| (|Integer|)) (|p| (|Integer|)))
         (SEQ (LETT |p| (SPADCALL |op| (QREFELT $ 12) (QREFELT $ 68)))
              (EXIT
               (COND ((< |p| 1) (|error| "unknown binary op"))
                     (#2='T
                      (SEQ
                       (LETT |opPrec|
                             (SPADCALL (QREFELT $ 13) |p| (QREFELT $ 70)))
                       (LETT |s1|
                             (|TEX;formatExpr| (|SPADfirst| |args|) |opPrec|
                              $))
                       (LETT |s2|
                             (|TEX;formatExpr| (|SPADfirst| (CDR |args|))
                              (COND ((EQUAL |op| '^) (QREFELT $ 9))
                                    (#2# |opPrec|))
                              $))
                       (LETT |ops|
                             (COND ((EQUAL |op| '|\||) " \\mid ")
                                   ((EQUAL |op| '^) " \\sp ")
                                   ((EQUAL |op| '/) " \\over ")
                                   (#2#
                                    (COND ((EQUAL |op| 'OVER) " \\over ")
                                          ((EQUAL |op| '+->) " \\mapsto ")
                                          ((EQUAL |op| '~=) " \\ne ")
                                          ((EQUAL |op| '<=) " \\leq ")
                                          ((EQUAL |op| '>=) " \\geq ")
                                          (#2#
                                           (COND ((EQUAL |op| 'LET) " := ")
                                                 (#2#
                                                  (SPADCALL |op|
                                                            (QREFELT $
                                                                     66)))))))))
                       (LETT |s|
                             (COND
                              ((EQUAL |op| '^)
                               (SPADCALL
                                (LIST (|TEX;group| |s1| $) |ops|
                                      (|TEX;group| |s2| $))
                                (QREFELT $ 53)))
                              (#2#
                               (SPADCALL (LIST |s1| |ops| |s2|)
                                         (QREFELT $ 53)))))
                       (EXIT
                        (|TEX;group|
                         (COND
                          ((OR (OR (EQUAL |op| '/) (EQUAL |op| 'OVER))
                               (NULL (< |opPrec| |prec|)))
                           |s|)
                          ('T (|TEX;parenthesize| |s| $)))
                         $))))))))) 

(SDEFUN |TEX;formatNary|
        ((|op| |Symbol|) (|sep| |String|) (|opprec| |Integer|)
         (|args| |List| (|OutputForm|)) (|prec| |Integer|) ($ |String|))
        (|TEX;group|
         (|TEX;formatNaryNoGroup| |op| |sep| |opprec| |args| |prec| $) $)) 

(SDEFUN |TEX;formatNaryNoGroup|
        ((|op| |Symbol|) (|sep| |String|) (|opprec| |Integer|)
         (|args| |List| (|OutputForm|)) (|prec| |Integer|) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|l| (|List| (|String|))) (#1=#:G670 NIL) (|a| NIL)
          (|opPrec| (|Integer|)) (|ops| (|String|)) (|p| (|Integer|)))
         (SEQ
          (COND ((NULL |args|) "")
                (#2='T
                 (SEQ (LETT |p| (SPADCALL |op| (QREFELT $ 14) (QREFELT $ 68)))
                      (EXIT
                       (COND ((< |p| 1) (|error| "unknown nary op"))
                             (#2#
                              (SEQ
                               (LETT |ops|
                                     (COND ((EQUAL |op| 'STRSEP) |sep|)
                                           ((EQUAL |op| '|,|) ", \\: ")
                                           ((EQUAL |op| '|;|) "; \\: ")
                                           ((EQUAL |op| '*) (QREFELT $ 7))
                                           (#2#
                                            (COND ((EQUAL |op| '| |) " \\ ")
                                                  ((EQUAL |op| 'ROW) " & ")
                                                  ((EQUAL |op| 'TENSOR)
                                                   " \\otimes ")
                                                  (#2#
                                                   (SPADCALL |op|
                                                             (QREFELT $
                                                                      66)))))))
                               (LETT |l| NIL)
                               (LETT |opPrec|
                                     (COND ((EQUAL |op| 'STRSEP) |opprec|)
                                           (#2#
                                            (SPADCALL (QREFELT $ 15) |p|
                                                      (QREFELT $ 70)))))
                               (SEQ (LETT |a| NIL) (LETT #1# |args|) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |a| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |l|
                                            (CONS |ops|
                                                  (CONS
                                                   (|TEX;formatExpr| |a|
                                                    |opPrec| $)
                                                   |l|)))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT NIL))
                               (LETT |s|
                                     (SPADCALL (REVERSE (CDR |l|))
                                               (QREFELT $ 53)))
                               (EXIT
                                (COND
                                 ((< |opPrec| |prec|)
                                  (|TEX;parenthesize| |s| $))
                                 (#2# |s|))))))))))))) 

(SDEFUN |TEX;formatExpr|
        ((|expr| |OutputForm|) (|prec| |Integer|) ($ |String|))
        (SPROG
         ((|op| (|Symbol|)) (|nargs| (|Integer|))
          (|args| (|List| (|OutputForm|))) (|opf| (|OutputForm|))
          (|i| (|Integer|)) (|str| (|String|)) (|s| (|String|)) (#1=#:G710 NIL)
          (#2=#:G709 NIL) (|u| (|UniversalSegment| (|Integer|)))
          (|nstr| (|String|)) (|len| (|Integer|)) (|intSplitLen| (|Integer|)))
         (SEQ (LETT |intSplitLen| 20)
              (EXIT
               (COND
                ((SPADCALL |expr| (QREFELT $ 73))
                 (SEQ (LETT |str| (|TEX;stringify| |expr| $))
                      (LETT |len| (QCSIZE |str|))
                      (EXIT
                       (COND
                        ((SPADCALL |expr| (QREFELT $ 74))
                         (SEQ (LETT |i| (SPADCALL |expr| (QREFELT $ 75)))
                              (EXIT
                               (COND
                                ((OR (< |i| 0) (> |i| 9))
                                 (|TEX;group|
                                  (SEQ (LETT |nstr| "")
                                       (SEQ G190
                                            (COND
                                             ((NULL
                                               (> (LETT |len| (QCSIZE |str|))
                                                  |intSplitLen|))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |nstr|
                                                   (SPADCALL
                                                    (LIST |nstr| " "
                                                          (SPADCALL |str|
                                                                    (SPADCALL 1
                                                                              |intSplitLen|
                                                                              (QREFELT
                                                                               $
                                                                               46))
                                                                    (QREFELT $
                                                                             47)))
                                                    (QREFELT $ 53)))
                                             (EXIT
                                              (LETT |str|
                                                    (SPADCALL |str|
                                                              (SPADCALL
                                                               (+ |intSplitLen|
                                                                  1)
                                                               (QREFELT $ 76))
                                                              (QREFELT $
                                                                       47)))))
                                            NIL (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |nstr| (QREFELT $ 52))
                                          |str|)
                                         (#3='T
                                          (SEQ
                                           (LETT |nstr|
                                                 (COND
                                                  ((SPADCALL |str|
                                                             (QREFELT $ 52))
                                                   |nstr|)
                                                  (#3#
                                                   (SPADCALL
                                                    (LIST |nstr| " " |str|)
                                                    (QREFELT $ 53)))))
                                           (EXIT
                                            (SPADCALL |nstr|
                                                      (SPADCALL 2
                                                                (QREFELT $ 76))
                                                      (QREFELT $ 47))))))))
                                  $))
                                ('T |str|)))))
                        ((EQUAL |str| "%pi") "\\pi") ((EQUAL |str| "%e") "e")
                        ((EQUAL |str| "%i") "i")
                        (#3#
                         (SEQ
                          (COND
                           ((> |len| 1)
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 44))
                                        (|STR_to_CHAR| "%"))
                              (COND
                               ((|eql_SI| (SPADCALL |str| 2 (QREFELT $ 44))
                                          (|STR_to_CHAR| "%"))
                                (EXIT
                                 (SEQ
                                  (LETT |u| (SPADCALL 3 |len| (QREFELT $ 46)))
                                  (EXIT
                                   (STRCONC " \\%\\%"
                                            (SPADCALL |str| |u|
                                                      (QREFELT $ 47))))))))))))
                          (COND
                           ((> |len| 0)
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 44))
                                        (|STR_to_CHAR| "%"))
                              (EXIT (STRCONC " \\" |str|))))))
                          (COND
                           ((> |len| 0)
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 44))
                                        (|STR_to_CHAR| "\""))
                              (EXIT
                               (SEQ (LETT |s| "\\verb#")
                                    (SEQ (LETT |i| 1) (LETT #2# |len|) G190
                                         (COND
                                          ((|greater_SI| |i| #2#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((|eql_SI|
                                              (SPADCALL |str| |i|
                                                        (QREFELT $ 44))
                                              (|STR_to_CHAR| "#"))
                                             (LETT |s|
                                                   (STRCONC |s|
                                                            "#\\verb-#-\\verb#")))
                                            ('T
                                             (LETT |s|
                                                   (STRCONC |s|
                                                            (SPADCALL
                                                             (SPADCALL |str|
                                                                       |i|
                                                                       (QREFELT
                                                                        $ 44))
                                                             (QREFELT $
                                                                      77))))))))
                                         (LETT |i| (|inc_SI| |i|)) (GO G190)
                                         G191 (EXIT NIL))
                                    (EXIT (STRCONC |s| "#"))))))))
                          (COND
                           ((EQL |len| 1)
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 44))
                                        (|STR_to_CHAR| " "))
                              (EXIT "{\\ }")))))
                          (LETT |s| "")
                          (SEQ (LETT |i| 1) (LETT #1# |len|) G190
                               (COND ((|greater_SI| |i| #1#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |s|
                                       (STRCONC |s|
                                                (COND
                                                 ((|eql_SI|
                                                   (SPADCALL |str| |i|
                                                             (QREFELT $ 44))
                                                   (|STR_to_CHAR| "_"))
                                                  "\\_")
                                                 ('T
                                                  (SPADCALL
                                                   (SPADCALL |str| |i|
                                                             (QREFELT $ 44))
                                                   (QREFELT $ 77))))))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT NIL))
                          (LETT |str| |s|)
                          (COND
                           ((> |len| 1)
                            (COND
                             ((SPADCALL (SPADCALL |str| 1 (QREFELT $ 44))
                                        (QREFELT $ 78))
                              (EXIT (|TEX;group| |str| $))))))
                          (COND
                           ((SPADCALL |expr| (QREFELT $ 79))
                            (SEQ (LETT |op| (SPADCALL |expr| (QREFELT $ 80)))
                                 (LETT |i|
                                       (SPADCALL |op| (QREFELT $ 20)
                                                 (QREFELT $ 68)))
                                 (EXIT
                                  (COND
                                   ((> |i| 0)
                                    (LETT |str|
                                          (SPADCALL (QREFELT $ 21) |i|
                                                    (QREFELT $ 81)))))))))
                          (LETT |i|
                                (SPADCALL (|STR_to_CHAR| " ") |str|
                                          (QREFELT $ 83)))
                          (EXIT
                           (COND
                            ((> |i| 0)
                             (SPADCALL (LIST " \\mbox{\\rm " |str| "} ")
                                       (QREFELT $ 53)))
                            (#3# |str|)))))))))
                (#3#
                 (SEQ (LETT |opf| (SPADCALL |expr| (QREFELT $ 84)))
                      (LETT |args| (SPADCALL |expr| (QREFELT $ 72)))
                      (LETT |nargs| (LENGTH |args|))
                      (EXIT
                       (COND
                        ((SPADCALL |opf| (QREFELT $ 79))
                         (SEQ (LETT |op| (SPADCALL |opf| (QREFELT $ 80)))
                              (EXIT
                               (COND
                                ((SPADCALL |op| (QREFELT $ 19) (QREFELT $ 85))
                                 (|TEX;formatSpecial| |op| |args| |prec| $))
                                ((SPADCALL |op| (QREFELT $ 17) (QREFELT $ 85))
                                 (|TEX;formatPlex| |op| |args| |prec| $))
                                ((EQL 0 |nargs|) (|TEX;formatNullary| |op| $))
                                (#3#
                                 (SEQ
                                  (COND
                                   ((EQL 1 |nargs|)
                                    (COND
                                     ((SPADCALL |op| (QREFELT $ 10)
                                                (QREFELT $ 85))
                                      (EXIT
                                       (|TEX;formatUnary| |op|
                                        (|SPADfirst| |args|) |prec| $))))))
                                  (COND
                                   ((EQL 2 |nargs|)
                                    (COND
                                     ((SPADCALL |op| (QREFELT $ 12)
                                                (QREFELT $ 85))
                                      (EXIT
                                       (|TEX;formatBinary| |op| |args| |prec|
                                        $))))))
                                  (EXIT
                                   (COND
                                    ((SPADCALL |op| (QREFELT $ 16)
                                               (QREFELT $ 85))
                                     (|TEX;formatNaryNoGroup| |op| "" 0 |args|
                                      |prec| $))
                                    ((SPADCALL |op| (QREFELT $ 14)
                                               (QREFELT $ 85))
                                     (|TEX;formatNary| |op| "" 0 |args| |prec|
                                      $))
                                    (#3#
                                     (|TEX;formatFunction| |opf| |args| |prec|
                                      $))))))))))
                        (#3#
                         (|TEX;formatFunction| |opf| |args| |prec| $))))))))))) 

(DECLAIM (NOTINLINE |TexFormat;|)) 

(DEFUN |TexFormat| ()
  (SPROG NIL
         (PROG (#1=#:G712)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|TexFormat|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|TexFormat|
                             (LIST (CONS NIL (CONS 1 (|TexFormat;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|TexFormat|)))))))))) 

(DEFUN |TexFormat;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|TexFormat|))
          (LETT $ (GETREFV 88))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|TexFormat| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |prolog| (|List| (|String|)))
                              (|:| |TeX| (|List| (|String|)))
                              (|:| |epilog| (|List| (|String|)))))
          (QSETREFV $ 7 " \\  ")
          (QSETREFV $ 8 1000000)
          (QSETREFV $ 9 0)
          (QSETREFV $ 10 '(-))
          (QSETREFV $ 11 '(710))
          (QSETREFV $ 12 '(+-> |\|| ^ / = ~= < <= > >= OVER LET))
          (QSETREFV $ 13 (LIST 0 0 900 700 400 400 400 400 400 400 700 125))
          (QSETREFV $ 14 '(- + * |,| |;| ROW STRSEP TENSOR))
          (QSETREFV $ 15 (LIST 700 700 800 110 110 0 0 850))
          (QSETREFV $ 16 '(ROW))
          (QSETREFV $ 17 '(SIGMA SIGMA2 PI PI2 INTSIGN))
          (QSETREFV $ 18 '(750 750 750 750 700))
          (QSETREFV $ 19
                    '(MATRIX BRACKET BRACE CONCATB VCONCAT AGGLST CONCAT
                      OVERBAR ROOT SUB TAG SUPERSUB ZAG AGGSET SC PAREN SEGMENT
                      QUOTE |theMap| SLASH PRIME))
          (QSETREFV $ 20
                    '(|cos| |cot| |csc| |log| |sec| |sin| |tan| |cosh| |coth|
                      |csch| |sech| |sinh| |tanh| |acos| |asin| |atan| |erf|
                      |...| $ |infinity| |Gamma|))
          (QSETREFV $ 21
                    (LIST "\\cos" "\\cot" "\\csc" "\\log" "\\sec" "\\sin"
                          "\\tan" "\\cosh" "\\coth" "\\csch" "\\sech" "\\sinh"
                          "\\tanh" "\\arccos" "\\arcsin" "\\arctan" "\\erf"
                          "\\ldots" "\\$" "\\infty" "\\Gamma"))
          $))) 

(MAKEPROP '|TexFormat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| '|blank| '|maxPrec| '|minPrec|
              '|unaryOps| '|unaryPrecs| '|binaryOps| '|binaryPrecs| '|naryOps|
              '|naryPrecs| '|naryNGOps| '|plexOps| '|plexPrecs| '|specialOps|
              '|specialStrings| '|specialStringsInTeX| |TEX;new;$;1|
              (|OutputForm|) (|OutputFormTools|) (0 . |precondition|)
              |TEX;coerce;Of$;3| (|Integer|) |TEX;convert;OfI$;4| (|Void|)
              (5 . |void|) |TEX;display;$IV;6| |TEX;display;$V;7| (|List| 43)
              |TEX;prologue;$L;8| |TEX;tex;$L;9| |TEX;epilogue;$L;10|
              |TEX;setPrologue!;$2L;11| |TEX;setTex!;$2L;12|
              |TEX;setEpilogue!;$2L;13| (9 . |coerce|) |TEX;coerce;$Of;14|
              (|Character|) (|String|) (14 . |elt|) (|UniversalSegment| 27)
              (20 . |segment|) (26 . |elt|) (32 . |setelt!|) (|List| $)
              (39 . |split|) (|Boolean|) (45 . |empty?|) (50 . |concat|)
              (|List| 23) (55 . |second|) (60 . |string?|) (65 . |string|)
              (70 . =) (|Mapping| 51 42) (76 . |every?|) (82 . |message|)
              (87 . |empty|) (91 . ~=) (97 . |append|) (|Symbol|)
              (103 . |string|) (|List| 65) (108 . |position|) (|List| 27)
              (114 . |elt|) (120 . ~=) (126 . |arguments|) (131 . |atom?|)
              (136 . |integer?|) (141 . |integer|) (146 . |segment|)
              (151 . |coerce|) (156 . |digit?|) (161 . |symbol?|)
              (166 . |symbol|) (171 . |elt|) (177 . |char|) (182 . |position|)
              (188 . |operator|) (193 . |member?|) (|SingleInteger|)
              (|HashState|))
           '#(~= 199 |tex| 205 |setTex!| 210 |setPrologue!| 216 |setEpilogue!|
              222 |prologue| 228 |new| 233 |latex| 237 |hashUpdate!| 242 |hash|
              248 |epilogue| 253 |display| 258 |convert| 269 |coerce| 282 =
              292)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 23))
                        (|makeByteWordVec2| 87
                                            '(1 24 23 23 25 0 29 0 30 1 33 23 0
                                              40 2 43 42 0 27 44 2 45 0 27 27
                                              46 2 43 0 0 45 47 3 43 42 0 27 42
                                              48 2 43 49 0 42 50 1 43 51 0 52 1
                                              43 0 49 53 1 54 23 0 55 1 24 51
                                              23 56 1 24 43 23 57 2 42 51 0 0
                                              58 2 43 51 59 0 60 1 23 0 43 61 0
                                              23 0 62 2 43 51 0 0 63 2 33 0 0 0
                                              64 1 65 43 0 66 2 67 27 65 0 68 2
                                              69 27 0 27 70 2 27 51 0 0 71 1 24
                                              54 23 72 1 24 51 23 73 1 24 51 23
                                              74 1 24 27 23 75 1 45 0 27 76 1
                                              43 0 42 77 1 42 51 0 78 1 24 51
                                              23 79 1 24 65 23 80 2 33 43 0 27
                                              81 1 42 0 43 82 2 43 27 42 0 83 1
                                              24 23 23 84 2 67 51 65 0 85 2 0
                                              51 0 0 1 1 0 33 0 35 2 0 33 0 33
                                              38 2 0 33 0 33 37 2 0 33 0 33 39
                                              1 0 33 0 34 0 0 0 22 1 0 43 0 1 2
                                              0 87 87 0 1 1 0 86 0 1 1 0 33 0
                                              36 2 0 29 0 27 31 1 0 29 0 32 2 0
                                              0 23 27 28 3 0 0 23 27 23 1 1 0 0
                                              23 26 1 0 23 0 41 2 0 51 0 0
                                              1)))))
           '|lookupComplete|)) 

(MAKEPROP '|TexFormat| 'NILADIC T) 
