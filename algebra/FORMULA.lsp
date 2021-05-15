
(SDEFUN |FORMULA;new;$;1| (($ $))
        (VECTOR (LIST ".eq set blank @" ":df.") (LIST "") (LIST ":edf."))) 

(SDEFUN |FORMULA;coerce;Of$;2| ((|expr| |OutputForm|) ($ $))
        (SPROG ((|f| ($)))
               (SEQ (LETT |f| (SPADCALL (QREFELT $ 23)))
                    (QSETVELT |f| 1
                              (LIST
                               (|FORMULA;postcondition|
                                (|FORMULA;formatFormula|
                                 (SPADCALL |expr| (QREFELT $ 26)) (QREFELT $ 9)
                                 $)
                                $)))
                    (EXIT |f|)))) 

(SDEFUN |FORMULA;convert;OfI$;3|
        ((|expr| |OutputForm|) (|stepNum| |Integer|) ($ $))
        (SPROG ((|f| ($)))
               (SEQ (LETT |f| (SPADCALL (QREFELT $ 23)))
                    (QSETVELT |f| 1
                              (SPADCALL
                               (LIST "<leqno lparen " (STRINGIMAGE |stepNum|)
                                     " rparen>")
                               (LIST
                                (|FORMULA;postcondition|
                                 (|FORMULA;formatFormula|
                                  (SPADCALL |expr| (QREFELT $ 26))
                                  (QREFELT $ 9) $)
                                 $))
                               (QREFELT $ 29)))
                    (EXIT |f|)))) 

(SDEFUN |FORMULA;display;$IV;4| ((|f| $) (|len| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G422 NIL) (|s| NIL) (#2=#:G421 NIL) (|t| NIL) (#3=#:G420 NIL)
          (#4=#:G419 NIL))
         (SEQ
          (SEQ (LETT |s| NIL) (LETT #4# (QVELT |f| 0)) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |s| (CAR #4#)) NIL)) (GO G191)))
               (SEQ (EXIT (|sayFORMULA| |s|))) (LETT #4# (CDR #4#)) (GO G190)
               G191 (EXIT NIL))
          (SEQ (LETT |s| NIL) (LETT #3# (QVELT |f| 1)) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |s| (CAR #3#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |t| NIL)
                      (LETT #2# (|FORMULA;splitLong| |s| |len| $)) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (|sayFORMULA| |t|))) (LETT #2# (CDR #2#))
                      (GO G190) G191 (EXIT NIL))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |s| NIL) (LETT #1# (QVELT |f| 2)) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (EXIT (|sayFORMULA| |s|))) (LETT #1# (CDR #1#)) (GO G190)
               G191 (EXIT NIL))
          (EXIT (SPADCALL (QREFELT $ 33)))))) 

(SDEFUN |FORMULA;display;$V;5| ((|f| $) ($ |Void|))
        (SPADCALL |f| $LINELENGTH (QREFELT $ 34))) 

(PUT '|FORMULA;prologue;$L;6| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 0))) 

(SDEFUN |FORMULA;prologue;$L;6| ((|f| $) ($ |List| (|String|))) (QVELT |f| 0)) 

(PUT '|FORMULA;formula;$L;7| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 1))) 

(SDEFUN |FORMULA;formula;$L;7| ((|f| $) ($ |List| (|String|))) (QVELT |f| 1)) 

(PUT '|FORMULA;epilogue;$L;8| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 2))) 

(SDEFUN |FORMULA;epilogue;$L;8| ((|f| $) ($ |List| (|String|))) (QVELT |f| 2)) 

(PUT '|FORMULA;setPrologue!;$2L;9| '|SPADreplace|
     '(XLAM (|f| |l|) (QSETVELT |f| 0 |l|))) 

(SDEFUN |FORMULA;setPrologue!;$2L;9|
        ((|f| $) (|l| |List| (|String|)) ($ |List| (|String|)))
        (QSETVELT |f| 0 |l|)) 

(PUT '|FORMULA;setFormula!;$2L;10| '|SPADreplace|
     '(XLAM (|f| |l|) (QSETVELT |f| 1 |l|))) 

(SDEFUN |FORMULA;setFormula!;$2L;10|
        ((|f| $) (|l| |List| (|String|)) ($ |List| (|String|)))
        (QSETVELT |f| 1 |l|)) 

(PUT '|FORMULA;setEpilogue!;$2L;11| '|SPADreplace|
     '(XLAM (|f| |l|) (QSETVELT |f| 2 |l|))) 

(SDEFUN |FORMULA;setEpilogue!;$2L;11|
        ((|f| $) (|l| |List| (|String|)) ($ |List| (|String|)))
        (QSETVELT |f| 2 |l|)) 

(SDEFUN |FORMULA;coerce;$Of;12| ((|f| $) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|String|))) (#1=#:G439 NIL) (|s| NIL) (#2=#:G438 NIL)
          (|t| NIL) (#3=#:G437 NIL) (#4=#:G436 NIL))
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
                          (LETT #2#
                                (|FORMULA;splitLong| |s| (- $LINELENGTH 4) $))
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
              (EXIT (SPADCALL (REVERSE |l|) (QREFELT $ 42)))))) 

(SDEFUN |FORMULA;postcondition| ((|str| |String|) ($ |String|))
        (SPROG
         ((#1=#:G446 NIL) (|i| NIL) (|minus| #2=(|Character|)) (|plus| #2#)
          (|len| (|Integer|)))
         (SEQ (LETT |len| (QCSIZE |str|))
              (EXIT
               (COND ((< |len| 4) |str|)
                     ('T
                      (SEQ (LETT |plus| (|STR_to_CHAR| "+"))
                           (LETT |minus| (|STR_to_CHAR| "-"))
                           (SEQ (LETT |i| 1) (LETT #1# (- |len| 1)) G190
                                (COND ((|greater_SI| |i| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((|eql_SI|
                                     (SPADCALL |str| |i| (QREFELT $ 46))
                                     |plus|)
                                    (COND
                                     ((|eql_SI|
                                       (SPADCALL |str| (+ |i| 1)
                                                 (QREFELT $ 46))
                                       |minus|)
                                      (SPADCALL |str| |i| (|STR_to_CHAR| " ")
                                                (QREFELT $ 47))))))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |str|)))))))) 

(PUT '|FORMULA;stringify| '|SPADreplace| '|object2String|) 

(SDEFUN |FORMULA;stringify| ((|expr| |OutputForm|) ($ |String|))
        (|object2String| |expr|)) 

(SDEFUN |FORMULA;splitLong|
        ((|str| |String|) (|len| |Integer|) ($ |List| (|String|)))
        (SEQ (COND ((< |len| 20) (LETT |len| $LINELENGTH)))
             (EXIT (|FORMULA;splitLong1| |str| |len| $)))) 

(SDEFUN |FORMULA;splitLong1|
        ((|str| |String|) (|len| |Integer|) ($ |List| (|String|)))
        (SPROG
         ((|l| (|List| (|String|))) (|s| (|String|)) (|ls| (|Integer|))
          (|lss| (|Integer|)) (#1=#:G457 NIL) (|ss| NIL))
         (SEQ (LETT |l| NIL) (LETT |s| "") (LETT |ls| 0)
              (SEQ (LETT |ss| NIL)
                   (LETT #1#
                         (SPADCALL |str| (|STR_to_CHAR| " ") (QREFELT $ 49)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ss| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |lss| (QCSIZE |ss|))
                        (COND
                         ((> (+ |ls| |lss|) |len|)
                          (SEQ (LETT |l| (CONS |s| |l|)) (LETT |s| "")
                               (EXIT (LETT |ls| 0)))))
                        (EXIT
                         (COND ((> |lss| |len|) (LETT |l| (CONS |ss| |l|)))
                               ('T
                                (SEQ (LETT |ls| (+ (+ |ls| |lss|) 1))
                                     (EXIT
                                      (LETT |s|
                                            (STRCONC |s|
                                                     (STRCONC |ss| " ")))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND ((> |ls| 0) (LETT |l| (CONS |s| |l|))))
              (EXIT (REVERSE |l|))))) 

(SDEFUN |FORMULA;group| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "<" |str| ">") (QREFELT $ 50))) 

(SDEFUN |FORMULA;addBraces| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "left lbrace " |str| " right rbrace") (QREFELT $ 50))) 

(SDEFUN |FORMULA;addBrackets| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "left lb " |str| " right rb") (QREFELT $ 50))) 

(SDEFUN |FORMULA;parenthesize| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "left lparen " |str| " right rparen") (QREFELT $ 50))) 

(SDEFUN |FORMULA;formatSpecial|
        ((|op| |String|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG ((|form| (|List| #1=(|String|))) (|tmp| #1#))
               (SEQ
                (COND
                 ((EQUAL |op| "AGGLST")
                  (|FORMULA;formatNary| "," |args| |prec| $))
                 ((EQUAL |op| "AGGSET")
                  (|FORMULA;formatNary| ";" |args| |prec| $))
                 ((EQUAL |op| "CONCATB")
                  (|FORMULA;formatNary| " " |args| |prec| $))
                 ((EQUAL |op| "CONCAT")
                  (|FORMULA;formatNary| "" |args| |prec| $))
                 ((EQUAL |op| "BRACKET")
                  (|FORMULA;group|
                   (|FORMULA;addBrackets|
                    (|FORMULA;formatFormula| (|SPADfirst| |args|) (QREFELT $ 9)
                     $)
                    $)
                   $))
                 ((EQUAL |op| "BRACE")
                  (|FORMULA;group|
                   (|FORMULA;addBraces|
                    (|FORMULA;formatFormula| (|SPADfirst| |args|) (QREFELT $ 9)
                     $)
                    $)
                   $))
                 ((EQUAL |op| "PAREN")
                  (|FORMULA;group|
                   (|FORMULA;parenthesize|
                    (|FORMULA;formatFormula| (|SPADfirst| |args|) (QREFELT $ 9)
                     $)
                    $)
                   $))
                 ((EQUAL |op| "PRIME")
                  (|FORMULA;formatSpecial| "SUPERSUB"
                   (LIST (|SPADfirst| |args|) (SPADCALL (QREFELT $ 51))
                         (SPADCALL |args| (QREFELT $ 53)))
                   |prec| $))
                 ((EQUAL |op| "OVERBAR")
                  (COND ((NULL |args|) "")
                        (#2='T
                         (|FORMULA;group|
                          (SPADCALL
                           (LIST
                            (|FORMULA;formatFormula| (|SPADfirst| |args|)
                             (QREFELT $ 9) $)
                            " bar")
                           (QREFELT $ 50))
                          $))))
                 ((EQUAL |op| "ROOT")
                  (COND ((NULL |args|) "")
                        (#2#
                         (SEQ
                          (LETT |tmp|
                                (|FORMULA;formatFormula| (|SPADfirst| |args|)
                                 (QREFELT $ 9) $))
                          (EXIT
                           (COND
                            ((NULL (CDR |args|))
                             (|FORMULA;group|
                              (SPADCALL (LIST "sqrt " |tmp|) (QREFELT $ 50))
                              $))
                            (#2#
                             (|FORMULA;group|
                              (SPADCALL
                               (LIST "midsup adjust(u 1.5 r 9) "
                                     (|FORMULA;formatFormula|
                                      (|SPADfirst| (CDR |args|)) (QREFELT $ 9)
                                      $)
                                     " sqrt " |tmp|)
                               (QREFELT $ 50))
                              $))))))))
                 ((EQUAL |op| "SC")
                  (|FORMULA;formatNary| " labove " |args| |prec| $))
                 ((EQUAL |op| "SUB")
                  (|FORMULA;group|
                   (SPADCALL
                    (LIST
                     (|FORMULA;formatFormula| (|SPADfirst| |args|)
                      (QREFELT $ 9) $)
                     " sub "
                     (|FORMULA;formatSpecial| "AGGLST" (CDR |args|)
                      (QREFELT $ 9) $))
                    (QREFELT $ 50))
                   $))
                 ((EQUAL |op| "SUPERSUB")
                  (SEQ
                   (LETT |form|
                         (LIST
                          (|FORMULA;formatFormula| (|SPADfirst| |args|)
                           (QREFELT $ 9) $)))
                   (LETT |args| (CDR |args|))
                   (EXIT
                    (COND ((NULL |args|) (SPADCALL |form| (QREFELT $ 50)))
                          (#2#
                           (SEQ
                            (LETT |tmp|
                                  (|FORMULA;formatFormula| (|SPADfirst| |args|)
                                   (QREFELT $ 9) $))
                            (COND
                             ((SPADCALL |tmp| "" (QREFELT $ 55))
                              (LETT |form|
                                    (SPADCALL |form| (LIST " sub " |tmp|)
                                              (QREFELT $ 56)))))
                            (LETT |args| (CDR |args|))
                            (EXIT
                             (COND
                              ((NULL |args|)
                               (|FORMULA;group|
                                (SPADCALL |form| (QREFELT $ 50)) $))
                              (#2#
                               (SEQ
                                (LETT |tmp|
                                      (|FORMULA;formatFormula|
                                       (|SPADfirst| |args|) (QREFELT $ 9) $))
                                (COND
                                 ((SPADCALL |tmp| "" (QREFELT $ 55))
                                  (LETT |form|
                                        (SPADCALL |form| (LIST " sup " |tmp|)
                                                  (QREFELT $ 56)))))
                                (LETT |args| (CDR |args|))
                                (EXIT
                                 (COND
                                  ((NULL |args|)
                                   (|FORMULA;group|
                                    (SPADCALL |form| (QREFELT $ 50)) $))
                                  (#2#
                                   (SEQ
                                    (LETT |tmp|
                                          (|FORMULA;formatFormula|
                                           (|SPADfirst| |args|) (QREFELT $ 9)
                                           $))
                                    (COND
                                     ((SPADCALL |tmp| "" (QREFELT $ 55))
                                      (LETT |form|
                                            (SPADCALL |form|
                                                      (LIST " presup " |tmp|)
                                                      (QREFELT $ 56)))))
                                    (LETT |args| (CDR |args|))
                                    (EXIT
                                     (COND
                                      ((NULL |args|)
                                       (|FORMULA;group|
                                        (SPADCALL |form| (QREFELT $ 50)) $))
                                      (#2#
                                       (SEQ
                                        (LETT |tmp|
                                              (|FORMULA;formatFormula|
                                               (|SPADfirst| |args|)
                                               (QREFELT $ 9) $))
                                        (COND
                                         ((SPADCALL |tmp| "" (QREFELT $ 55))
                                          (LETT |form|
                                                (SPADCALL |form|
                                                          (LIST " presub "
                                                                |tmp|)
                                                          (QREFELT $ 56)))))
                                        (EXIT
                                         (|FORMULA;group|
                                          (SPADCALL |form| (QREFELT $ 50))
                                          $))))))))))))))))))))
                 ((EQUAL |op| "MATRIX")
                  (|FORMULA;formatMatrix| (CDR |args|) $))
                 (#2#
                  (SPADCALL (LIST "not done yet for " |op|) (QREFELT $ 50))))))) 

(SDEFUN |FORMULA;formatPlex|
        ((|op| |String|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|s| (|String|)) (|hold| (|String|)) (|n| (|Integer|))
          (|opPrec| (|Integer|)) (|p| (|Integer|)))
         (SEQ (LETT |p| (SPADCALL |op| (QREFELT $ 18) (QREFELT $ 57)))
              (EXIT
               (COND
                ((< |p| 1)
                 (|error| "unknown Script Formula Formatter unary op"))
                (#1='T
                 (SEQ
                  (LETT |opPrec| (SPADCALL (QREFELT $ 19) |p| (QREFELT $ 59)))
                  (LETT |n| (LENGTH |args|))
                  (COND
                   ((SPADCALL |n| 2 (QREFELT $ 60))
                    (COND
                     ((SPADCALL |n| 3 (QREFELT $ 60))
                      (EXIT (|error| "wrong number of arguments for plex"))))))
                  (LETT |s|
                        (COND ((EQUAL |op| "SIGMA") "sum")
                              ((EQUAL |op| "PI") "product")
                              ((EQUAL |op| "INTSIGN") "integral")
                              (#1# "????")))
                  (LETT |hold|
                        (|FORMULA;formatFormula| (|SPADfirst| |args|)
                         (QREFELT $ 9) $))
                  (LETT |args| (CDR |args|))
                  (COND
                   ((SPADCALL |hold| "" (QREFELT $ 55))
                    (LETT |s|
                          (SPADCALL
                           (LIST |s| " from"
                                 (|FORMULA;group|
                                  (SPADCALL (LIST "\\displaystyle " |hold|)
                                            (QREFELT $ 50))
                                  $))
                           (QREFELT $ 50)))))
                  (COND
                   ((NULL (NULL (CDR |args|)))
                    (SEQ
                     (LETT |hold|
                           (|FORMULA;formatFormula| (|SPADfirst| |args|)
                            (QREFELT $ 9) $))
                     (COND
                      ((SPADCALL |hold| "" (QREFELT $ 55))
                       (LETT |s|
                             (SPADCALL
                              (LIST |s| " to"
                                    (|FORMULA;group|
                                     (SPADCALL (LIST "\\displaystyle " |hold|)
                                               (QREFELT $ 50))
                                     $))
                              (QREFELT $ 50)))))
                     (EXIT (LETT |args| (CDR |args|))))))
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| " "
                               (|FORMULA;formatFormula| (|SPADfirst| |args|)
                                (QREFELT $ 9) $))
                         (QREFELT $ 50)))
                  (COND
                   ((< |opPrec| |prec|)
                    (LETT |s| (|FORMULA;parenthesize| |s| $))))
                  (EXIT (|FORMULA;group| |s| $))))))))) 

(SDEFUN |FORMULA;formatMatrix| ((|args| |List| (|OutputForm|)) ($ |String|))
        (|FORMULA;group|
         (|FORMULA;addBrackets|
          (|FORMULA;formatNary| " habove " |args| (QREFELT $ 9) $) $)
         $)) 

(SDEFUN |FORMULA;formatFunction|
        ((|op| |String|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (|FORMULA;group|
         (SPADCALL
          (LIST |op| " "
                (|FORMULA;parenthesize|
                 (|FORMULA;formatNary| "," |args| (QREFELT $ 9) $) $))
          (QREFELT $ 50))
         $)) 

(SDEFUN |FORMULA;formatNullary| ((|op| |String|) ($ |String|))
        (COND ((EQUAL |op| "NOTHING") "")
              ('T
               (|FORMULA;group| (SPADCALL (LIST |op| "()") (QREFELT $ 50)) $)))) 

(SDEFUN |FORMULA;formatUnary|
        ((|op| |String|) (|arg| |OutputForm|) (|prec| |Integer|) ($ |String|))
        (SPROG ((|s| (|String|)) (|opPrec| (|Integer|)) (|p| (|Integer|)))
               (SEQ (LETT |p| (SPADCALL |op| (QREFELT $ 11) (QREFELT $ 57)))
                    (EXIT
                     (COND
                      ((< |p| 1)
                       (|error| "unknown Script Formula Formatter unary op"))
                      (#1='T
                       (SEQ
                        (LETT |opPrec|
                              (SPADCALL (QREFELT $ 12) |p| (QREFELT $ 59)))
                        (LETT |s|
                              (SPADCALL
                               (LIST |op|
                                     (|FORMULA;formatFormula| |arg| |opPrec|
                                      $))
                               (QREFELT $ 50)))
                        (EXIT
                         (COND
                          ((< |opPrec| |prec|)
                           (|FORMULA;group| (|FORMULA;parenthesize| |s| $) $))
                          ((EQUAL |op| "-") |s|)
                          (#1# (|FORMULA;group| |s| $))))))))))) 

(SDEFUN |FORMULA;formatBinary|
        ((|op| |String|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG ((|s| (|String|)) (|opPrec| (|Integer|)) (|p| (|Integer|)))
               (SEQ (LETT |p| (SPADCALL |op| (QREFELT $ 13) (QREFELT $ 57)))
                    (EXIT
                     (COND
                      ((< |p| 1)
                       (|error| "unknown Script Formula Formatter binary op"))
                      (#1='T
                       (SEQ
                        (LETT |op|
                              (COND ((EQUAL |op| "^") " sup ")
                                    ((OR (EQUAL |op| "/") (EQUAL |op| "OVER"))
                                     " over ")
                                    (#1# |op|)))
                        (LETT |opPrec|
                              (SPADCALL (QREFELT $ 14) |p| (QREFELT $ 59)))
                        (LETT |s|
                              (|FORMULA;formatFormula| (|SPADfirst| |args|)
                               |opPrec| $))
                        (LETT |s|
                              (SPADCALL
                               (LIST |s| |op|
                                     (|FORMULA;formatFormula|
                                      (|SPADfirst| (CDR |args|)) |opPrec| $))
                               (QREFELT $ 50)))
                        (EXIT
                         (|FORMULA;group|
                          (COND
                           ((OR (EQUAL |op| " over ")
                                (NULL (< |opPrec| |prec|)))
                            |s|)
                           ('T (|FORMULA;parenthesize| |s| $)))
                          $))))))))) 

(SDEFUN |FORMULA;formatNary|
        ((|op| |String|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (|FORMULA;group| (|FORMULA;formatNaryNoGroup| |op| |args| |prec| $) $)) 

(SDEFUN |FORMULA;formatNaryNoGroup|
        ((|op| |String|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|s| (|String|)) (|l| (|List| (|String|))) (#1=#:G505 NIL) (|a| NIL)
          (|opPrec| (|Integer|)) (|p| (|Integer|)))
         (SEQ
          (COND ((NULL |args|) "")
                (#2='T
                 (SEQ (LETT |p| (SPADCALL |op| (QREFELT $ 15) (QREFELT $ 57)))
                      (EXIT
                       (COND
                        ((< |p| 1)
                         (|error| "unknown Script Formula Formatter nary op"))
                        (#2#
                         (SEQ
                          (LETT |op|
                                (COND ((EQUAL |op| ",") ", @@ ")
                                      ((EQUAL |op| ";") "; @@ ")
                                      ((OR (EQUAL |op| "*") (EQUAL |op| " "))
                                       (QREFELT $ 7))
                                      ((EQUAL |op| "ROW") " here ")
                                      (#2# |op|)))
                          (LETT |l| NIL)
                          (LETT |opPrec|
                                (SPADCALL (QREFELT $ 16) |p| (QREFELT $ 59)))
                          (SEQ (LETT |a| NIL) (LETT #1# |args|) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |a| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |l|
                                       (CONS |op|
                                             (CONS
                                              (|FORMULA;formatFormula| |a|
                                               |opPrec| $)
                                              |l|)))))
                               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                          (LETT |s|
                                (SPADCALL (REVERSE (CDR |l|)) (QREFELT $ 50)))
                          (EXIT
                           (COND
                            ((< |opPrec| |prec|)
                             (|FORMULA;parenthesize| |s| $))
                            (#2# |s|))))))))))))) 

(SDEFUN |FORMULA;formatFormula|
        ((|expr| |OutputForm|) (|prec| |Integer|) ($ |String|))
        (SPROG
         ((|op| #1=(|String|)) (|nargs| (|Integer|))
          (|args| (|List| (|OutputForm|))) (|opf| (|OutputForm|))
          (|i| (|Integer|)) (|str| #1#))
         (SEQ
          (COND
           ((SPADCALL |expr| (QREFELT $ 61))
            (SEQ (LETT |str| (|FORMULA;stringify| |expr| $))
                 (EXIT
                  (COND
                   ((SPADCALL |expr| (QREFELT $ 62))
                    (SEQ (LETT |i| (SPADCALL |expr| (QREFELT $ 63)))
                         (EXIT
                          (COND
                           ((OR (< |i| 0) (> |i| 9)) (|FORMULA;group| |str| $))
                           ('T |str|)))))
                   (#2='T
                    (SEQ
                     (LETT |i| (SPADCALL |str| (QREFELT $ 21) (QREFELT $ 57)))
                     (EXIT
                      (COND
                       ((> |i| 0) (SPADCALL (QREFELT $ 22) |i| (QREFELT $ 64)))
                       (#2# |str|)))))))))
           (#2#
            (SEQ (LETT |opf| (SPADCALL |expr| (QREFELT $ 65)))
                 (LETT |op| (|FORMULA;stringify| |opf| $))
                 (LETT |args| (SPADCALL |expr| (QREFELT $ 66)))
                 (LETT |nargs| (LENGTH |args|))
                 (EXIT
                  (COND
                   ((SPADCALL |op| (QREFELT $ 20) (QREFELT $ 67))
                    (|FORMULA;formatSpecial| |op| |args| |prec| $))
                   ((SPADCALL |op| (QREFELT $ 18) (QREFELT $ 67))
                    (|FORMULA;formatPlex| |op| |args| |prec| $))
                   ((EQL 0 |nargs|) (|FORMULA;formatNullary| |op| $))
                   (#2#
                    (SEQ
                     (COND
                      ((EQL 1 |nargs|)
                       (COND
                        ((SPADCALL |op| (QREFELT $ 11) (QREFELT $ 67))
                         (EXIT
                          (|FORMULA;formatUnary| |op| (|SPADfirst| |args|)
                           |prec| $))))))
                     (COND
                      ((EQL 2 |nargs|)
                       (COND
                        ((SPADCALL |op| (QREFELT $ 13) (QREFELT $ 67))
                         (EXIT
                          (|FORMULA;formatBinary| |op| |args| |prec| $))))))
                     (EXIT
                      (COND
                       ((SPADCALL |op| (QREFELT $ 17) (QREFELT $ 67))
                        (|FORMULA;formatNaryNoGroup| |op| |args| |prec| $))
                       ((SPADCALL |op| (QREFELT $ 15) (QREFELT $ 67))
                        (|FORMULA;formatNary| |op| |args| |prec| $))
                       (#2#
                        (SEQ
                         (LETT |op|
                               (|FORMULA;formatFormula| |opf| (QREFELT $ 9) $))
                         (EXIT
                          (|FORMULA;formatFunction| |op| |args| |prec|
                           $)))))))))))))))) 

(DECLAIM (NOTINLINE |ScriptFormulaFormat;|)) 

(DEFUN |ScriptFormulaFormat| ()
  (SPROG NIL
         (PROG (#1=#:G520)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ScriptFormulaFormat|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ScriptFormulaFormat|
                             (LIST
                              (CONS NIL (CONS 1 (|ScriptFormulaFormat;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|ScriptFormulaFormat|)))))))))) 

(DEFUN |ScriptFormulaFormat;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ScriptFormulaFormat|))
          (LETT $ (GETREFV 70))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ScriptFormulaFormat| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |prolog| (|List| (|String|)))
                              (|:| |formula| (|List| (|String|)))
                              (|:| |epilog| (|List| (|String|)))))
          (QSETREFV $ 7 " @@ ")
          (QSETREFV $ 8 1000000)
          (QSETREFV $ 9 0)
          (QSETREFV $ 10 " <>[](){}+*=,-%")
          (QSETREFV $ 11 (LIST #1="-"))
          (QSETREFV $ 12 '(700))
          (QSETREFV $ 13 (LIST "+->" "|" "^" "/" "<" ">" "=" "OVER"))
          (QSETREFV $ 14 (LIST 0 0 900 700 400 400 400 700))
          (QSETREFV $ 15
                    (LIST #1# "+" "*" (QREFELT $ 7) "," ";" " " "ROW" ""
                          " habove " " here " " labove "))
          (QSETREFV $ 16 (LIST 700 700 800 800 110 110 0 0 0 0 0 0))
          (QSETREFV $ 17 NIL)
          (QSETREFV $ 18 (LIST "SIGMA" "PI" "INTSIGN"))
          (QSETREFV $ 19 '(700 800 700))
          (QSETREFV $ 20
                    (LIST "MATRIX" "BRACKET" "BRACE" "CONCATB" "AGGLST"
                          "CONCAT" "OVERBAR" "ROOT" "SUB" "SUPERSUB" "ZAG"
                          "AGGSET" "SC" "PAREN" "PRIME"))
          (QSETREFV $ 21 (LIST "5" "..."))
          (QSETREFV $ 22 (LIST " alpha " " ellipsis "))
          $))) 

(MAKEPROP '|ScriptFormulaFormat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| '|blank| '|maxPrec| '|minPrec|
              '|splitChars| '|unaryOps| '|unaryPrecs| '|binaryOps|
              '|binaryPrecs| '|naryOps| '|naryPrecs| '|naryNGOps| '|plexOps|
              '|plexPrecs| '|specialOps| '|specialStrings|
              '|specialStringsInFormula| |FORMULA;new;$;1| (|OutputForm|)
              (|OutputFormTools|) (0 . |precondition|) |FORMULA;coerce;Of$;2|
              (|List| 45) (5 . |concat|) (|Integer|) |FORMULA;convert;OfI$;3|
              (|Void|) (11 . |void|) |FORMULA;display;$IV;4|
              |FORMULA;display;$V;5| |FORMULA;prologue;$L;6|
              |FORMULA;formula;$L;7| |FORMULA;epilogue;$L;8|
              |FORMULA;setPrologue!;$2L;9| |FORMULA;setFormula!;$2L;10|
              |FORMULA;setEpilogue!;$2L;11| (15 . |coerce|)
              |FORMULA;coerce;$Of;12| (|Character|) (|String|) (20 . |elt|)
              (26 . |setelt!|) (|List| $) (33 . |split|) (39 . |concat|)
              (44 . |empty|) (|List| 24) (48 . |second|) (|Boolean|) (53 . ~=)
              (59 . |append|) (65 . |position|) (|List| 30) (71 . |elt|)
              (77 . ~=) (83 . |atom?|) (88 . |integer?|) (93 . |integer|)
              (98 . |elt|) (104 . |operator|) (109 . |arguments|)
              (114 . |member?|) (|SingleInteger|) (|HashState|))
           '#(~= 120 |setPrologue!| 126 |setFormula!| 132 |setEpilogue!| 138
              |prologue| 144 |new| 149 |latex| 153 |hashUpdate!| 158 |hash| 164
              |formula| 169 |epilogue| 174 |display| 179 |convert| 190 |coerce|
              196 = 206)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 24))
                        (|makeByteWordVec2| 69
                                            '(1 25 24 24 26 2 28 0 0 0 29 0 32
                                              0 33 1 28 24 0 42 2 45 44 0 30 46
                                              3 45 44 0 30 44 47 2 45 48 0 44
                                              49 1 45 0 48 50 0 24 0 51 1 52 24
                                              0 53 2 45 54 0 0 55 2 28 0 0 0 56
                                              2 28 30 45 0 57 2 58 30 0 30 59 2
                                              30 54 0 0 60 1 25 54 24 61 1 25
                                              54 24 62 1 25 30 24 63 2 28 45 0
                                              30 64 1 25 24 24 65 1 25 52 24 66
                                              2 28 54 45 0 67 2 0 54 0 0 1 2 0
                                              28 0 28 39 2 0 28 0 28 40 2 0 28
                                              0 28 41 1 0 28 0 36 0 0 0 23 1 0
                                              45 0 1 2 0 69 69 0 1 1 0 68 0 1 1
                                              0 28 0 37 1 0 28 0 38 1 0 32 0 35
                                              2 0 32 0 30 34 2 0 0 24 30 31 1 0
                                              0 24 27 1 0 24 0 43 2 0 54 0 0
                                              1)))))
           '|lookupComplete|)) 

(MAKEPROP '|ScriptFormulaFormat| 'NILADIC T) 
