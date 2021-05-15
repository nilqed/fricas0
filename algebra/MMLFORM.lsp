
(SDEFUN |MMLFORM;coerce;OfS;1| ((|expr| |OutputForm|) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ
                (LETT |s|
                      (|MMLFORM;postcondition|
                       (|MMLFORM;formatExpr| (SPADCALL |expr| (QREFELT $ 23))
                        (QREFELT $ 8) $)
                       $))
                (EXIT |s|)))) 

(PUT '|MMLFORM;sayExpr| '|SPADreplace| '|sayMathML|) 

(SDEFUN |MMLFORM;sayExpr| ((|s| |String|) ($ |Void|)) (|sayMathML| |s|)) 

(SDEFUN |MMLFORM;coerceS;OfS;3| ((|expr| |OutputForm|) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ
                (LETT |s|
                      (|MMLFORM;postcondition|
                       (|MMLFORM;formatExpr| (SPADCALL |expr| (QREFELT $ 23))
                        (QREFELT $ 8) $)
                       $))
                (|MMLFORM;sayExpr|
                 "<math xmlns=\"http://www.w3.org/1998/Math/MathML\" mathsize=\"big\" display=\"block\">"
                 $)
                (|MMLFORM;displayElt| |s| $) (|MMLFORM;sayExpr| "</math>" $)
                (EXIT |s|)))) 

(SDEFUN |MMLFORM;coerceL;OfS;4| ((|expr| |OutputForm|) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ
                (LETT |s|
                      (|MMLFORM;postcondition|
                       (|MMLFORM;formatExpr| (SPADCALL |expr| (QREFELT $ 23))
                        (QREFELT $ 8) $)
                       $))
                (|MMLFORM;sayExpr|
                 "<math xmlns=\"http://www.w3.org/1998/Math/MathML\" mathsize=\"big\" display=\"block\">"
                 $)
                (|MMLFORM;sayExpr| |s| $) (|MMLFORM;sayExpr| "</math>" $)
                (EXIT |s|)))) 

(SDEFUN |MMLFORM;display;SV;5| ((|mathml| |String|) ($ |Void|))
        (SEQ
         (|MMLFORM;sayExpr|
          "<math xmlns=\"http://www.w3.org/1998/Math/MathML\" mathsize=\"big\" display=\"block\">"
          $)
         (|MMLFORM;sayExpr| |mathml| $) (|MMLFORM;sayExpr| "</math>" $)
         (EXIT (SPADCALL (QREFELT $ 29))))) 

(SDEFUN |MMLFORM;exprex;OfS;6| ((|expr| |OutputForm|) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|s1| #1=(|String|)) (#2=#:G464 NIL) (|a| NIL)
          (|nargs| (|Integer|)) (|args| (|List| (|OutputForm|))) (|sop| #1#)
          (|op| (|OutputForm|)))
         (SEQ (LETT |expr| (SPADCALL |expr| (QREFELT $ 23)))
              (COND
               ((OR (SPADCALL |expr| (QREFELT $ 32))
                    (EQUAL (|MMLFORM;stringify| |expr| $) "NOTHING"))
                (EXIT
                 (SPADCALL (LIST "{" (|MMLFORM;stringify| |expr| $) "}")
                           (QREFELT $ 34)))))
              (LETT |op| (SPADCALL |expr| (QREFELT $ 35)))
              (LETT |sop| (SPADCALL |op| (QREFELT $ 36)))
              (LETT |args| (SPADCALL |expr| (QREFELT $ 38)))
              (LETT |nargs| (LENGTH |args|))
              (LETT |s| (SPADCALL (LIST "{" |sop|) (QREFELT $ 34)))
              (COND
               ((> |nargs| 0)
                (SEQ (LETT |a| NIL) (LETT #2# |args|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |s1| (SPADCALL |a| (QREFELT $ 36)))
                          (EXIT
                           (LETT |s|
                                 (SPADCALL (LIST |s| |s1|) (QREFELT $ 34)))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
              (EXIT (LETT |s| (SPADCALL (LIST |s| "}") (QREFELT $ 34))))))) 

(SDEFUN |MMLFORM;displayElt| ((|mathML| |String|) ($ |Void|))
        (SPROG
         ((|u| (|UniversalSegment| (|Integer|))) (|enT| (|Integer|))
          (|enE| (|Integer|)) (|name| (|String|)) (|length| (|Integer|))
          (|end| (|Integer|)))
         (SEQ (LETT |end| (QCSIZE |mathML|)) (LETT |length| 60)
              (LETT |name| (|MMLFORM;eltName| 1 |mathML| $))
              (LETT |enE|
                    (|MMLFORM;eltLimit| |name| (+ 2 (QCSIZE |name|)) |mathML|
                     $))
              (COND
               ((< |enE| |length|)
                (SEQ (LETT |u| (SPADCALL 1 |enE| (QREFELT $ 41)))
                     (EXIT
                      (SPADCALL (SPADCALL |mathML| |u| (QREFELT $ 42))
                                (QREFELT $ 44)))))
               ('T
                (SEQ (LETT |enT| (|MMLFORM;tagEnd| |name| 1 |mathML| $))
                     (LETT |u| (SPADCALL 1 |enT| (QREFELT $ 41)))
                     (SPADCALL (SPADCALL |mathML| |u| (QREFELT $ 42))
                               (QREFELT $ 44))
                     (LETT |u|
                           (SPADCALL (+ |enT| 1)
                                     (- (- |enE| (QCSIZE |name|)) 3)
                                     (QREFELT $ 41)))
                     (|MMLFORM;displayElt|
                      (SPADCALL |mathML| |u| (QREFELT $ 42)) $)
                     (LETT |u|
                           (SPADCALL (- (- |enE| (QCSIZE |name|)) 2) |enE|
                                     (QREFELT $ 41)))
                     (EXIT
                      (SPADCALL (SPADCALL |mathML| |u| (QREFELT $ 42))
                                (QREFELT $ 44))))))
              (COND
               ((> |end| |enE|)
                (SEQ (LETT |u| (SPADCALL (+ |enE| 1) |end| (QREFELT $ 41)))
                     (EXIT
                      (|MMLFORM;displayElt|
                       (SPADCALL |mathML| |u| (QREFELT $ 42)) $)))))
              (EXIT (SPADCALL (QREFELT $ 29)))))) 

(SDEFUN |MMLFORM;eltName| ((|pos| |Integer|) (|mathML| |String|) ($ |String|))
        (SPROG
         ((|name| (|String|)) (|u| (|UniversalSegment| (|Integer|)))
          (|i| (|Integer|)))
         (SEQ (LETT |i| (+ |pos| 1))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL (SPADCALL |mathML| |i| (QREFELT $ 46))
                                (|spadConstant| $ 48) (QREFELT $ 49)))
                     (GO G191)))
                   (SEQ (EXIT (LETT |i| (+ |i| 1)))) NIL (GO G190) G191
                   (EXIT NIL))
              (LETT |u| (SPADCALL (+ |pos| 1) (- |i| 1) (QREFELT $ 41)))
              (EXIT (LETT |name| (SPADCALL |mathML| |u| (QREFELT $ 42))))))) 

(SDEFUN |MMLFORM;eltLimit|
        ((|name| |String|) (|pos| . #1=(|Integer|)) (|mathML| |String|)
         ($ |Integer|))
        (SPROG
         ((|pI| #1#) (|level| (|Integer|)) (|endI| #2=(|Integer|))
          (|startI| #2#) (|endS| #3=(|String|)) (|startS| #3#))
         (SEQ (LETT |pI| |pos|)
              (LETT |startS| (SPADCALL (LIST "<" |name|) (QREFELT $ 34)))
              (LETT |endS| (SPADCALL (LIST "</" |name| ">") (QREFELT $ 34)))
              (LETT |level| 1)
              (SEQ G190 (COND ((NULL (> |level| 0)) (GO G191)))
                   (SEQ
                    (LETT |startI|
                          (SPADCALL |startS| |mathML| |pI| (QREFELT $ 50)))
                    (LETT |endI|
                          (SPADCALL |endS| |mathML| |pI| (QREFELT $ 50)))
                    (EXIT
                     (COND
                      ((OR (EQL |startI| 0) (NULL (< |startI| |endI|)))
                       (SEQ (LETT |level| (- |level| 1))
                            (EXIT
                             (LETT |pI|
                                   (|MMLFORM;tagEnd| |name| |endI| |mathML|
                                    $)))))
                      ('T
                       (SEQ (LETT |level| (+ |level| 1))
                            (EXIT
                             (LETT |pI|
                                   (|MMLFORM;tagEnd| |name| |startI| |mathML|
                                    $))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |pI|)))) 

(SDEFUN |MMLFORM;tagEnd|
        ((|name| |String|) (|pos| . #1=(|Integer|)) (|mathML| |String|)
         ($ |Integer|))
        (SPROG ((|u| (|UniversalSegment| (|Integer|))) (|pI| #1#))
               (SEQ (LETT |pI| |pos|)
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL (SPADCALL |mathML| |pI| (QREFELT $ 46))
                                      (|STR_to_CHAR| ">") (QREFELT $ 51)))
                           (GO G191)))
                         (SEQ (EXIT (LETT |pI| (+ |pI| 1)))) NIL (GO G190) G191
                         (EXIT NIL))
                    (LETT |u| (SPADCALL |pos| |pI| (QREFELT $ 41)))
                    (EXIT |pI|)))) 

(SDEFUN |MMLFORM;ungroup| ((|str| |String|) ($ |String|))
        (SPROG
         ((|u| #1=(|UniversalSegment| (|Integer|))) (|u2| #1#) (|u1| #1#)
          (|rrow| (|String|)) (|lrow| (|String|)) (|len| (|Integer|)))
         (SEQ (LETT |len| (QCSIZE |str|))
              (EXIT
               (COND ((< |len| 14) |str|)
                     ('T
                      (SEQ (LETT |lrow| "<mrow>") (LETT |rrow| "</mrow>")
                           (LETT |u1| (SPADCALL 1 6 (QREFELT $ 41)))
                           (LETT |u2|
                                 (SPADCALL (- |len| 6) |len| (QREFELT $ 41)))
                           (COND
                            ((EQUAL (SPADCALL |str| |u1| (QREFELT $ 42))
                                    |lrow|)
                             (COND
                              ((EQUAL (SPADCALL |str| |u2| (QREFELT $ 42))
                                      |rrow|)
                               (SEQ
                                (LETT |u|
                                      (SPADCALL 7 (- |len| 7) (QREFELT $ 41)))
                                (EXIT
                                 (LETT |str|
                                       (SPADCALL |str| |u|
                                                 (QREFELT $ 42)))))))))
                           (EXIT |str|)))))))) 

(SDEFUN |MMLFORM;postcondition| ((|str| |String|) ($ |String|))
        (SPROG
         ((|uend| #1=(|UniversalSegment| (|Integer|))) (|ustart| #1#)
          (|pos| (|Integer|)) (|plusminus| (|String|)) (|len| (|Integer|)))
         (SEQ (LETT |len| (QCSIZE |str|))
              (LETT |plusminus| "<mo>+</mo><mo>-</mo>")
              (LETT |pos| (SPADCALL |plusminus| |str| 1 (QREFELT $ 50)))
              (COND
               ((> |pos| 0)
                (SEQ (LETT |ustart| (SPADCALL 1 (- |pos| 1) (QREFELT $ 41)))
                     (LETT |uend| (SPADCALL (+ |pos| 20) |len| (QREFELT $ 41)))
                     (LETT |str|
                           (SPADCALL
                            (LIST (SPADCALL |str| |ustart| (QREFELT $ 42))
                                  "<mo>-</mo>"
                                  (SPADCALL |str| |uend| (QREFELT $ 42)))
                            (QREFELT $ 34)))
                     (EXIT
                      (COND
                       ((< |pos| (- |len| 18))
                        (LETT |str| (|MMLFORM;postcondition| |str| $))))))))
              (EXIT |str|)))) 

(PUT '|MMLFORM;stringify| '|SPADreplace| '|mathObject2String|) 

(SDEFUN |MMLFORM;stringify| ((|expr| |OutputForm|) ($ |String|))
        (|mathObject2String| |expr|)) 

(SDEFUN |MMLFORM;optionalWrap| ((|expr| |OutputForm|) ($ |String|))
        (SPROG ((|tmp| (|String|)))
               (SEQ (LETT |tmp| (|MMLFORM;formatExpr| |expr| (QREFELT $ 8) $))
                    (COND
                     ((OR (EQUAL |tmp| "") (EQUAL |tmp| " "))
                      (EXIT "<none/>")))
                    (EXIT
                     (SPADCALL (LIST "<mrow>" |tmp| "</mrow>")
                               (QREFELT $ 34)))))) 

(SDEFUN |MMLFORM;group| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "<mrow>" |str| "</mrow>") (QREFELT $ 34))) 

(SDEFUN |MMLFORM;addBraces| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "<mo>{</mo>" |str| "<mo>}</mo>") (QREFELT $ 34))) 

(SDEFUN |MMLFORM;addBrackets| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "<mo>[</mo>" |str| "<mo>]</mo>") (QREFELT $ 34))) 

(SDEFUN |MMLFORM;parenthesize| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "<mo>(</mo>" |str| "<mo>)</mo>") (QREFELT $ 34))) 

(SDEFUN |MMLFORM;formatSpecial|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|tmp| (|String|)) (|base| (|String|)) (|tmp3| #1=(|String|))
          (|tmp2| #1#) (|tmp1| #1#) (|n| (|NonNegativeInteger|))
          (#2=#:G540 NIL) (|u| NIL) (#3=#:G539 NIL) (|prescript| (|Boolean|)))
         (SEQ (LETT |prescript| NIL)
              (EXIT
               (COND ((EQUAL |op| '|theMap|) "<mtext>theMap(...)</mtext>")
                     ((EQUAL |op| 'AGGLST)
                      (|MMLFORM;formatNary| '|,| "" 0 |args| |prec| $))
                     ((EQUAL |op| 'AGGSET)
                      (|MMLFORM;formatNary| '|;| "" 0 |args| |prec| $))
                     ((EQUAL |op| 'TAG)
                      (|MMLFORM;group|
                       (SPADCALL
                        (LIST
                         (|MMLFORM;formatExpr| (|SPADfirst| |args|) |prec| $)
                         "<mo>&#x02192;</mo>"
                         (|MMLFORM;formatExpr| (SPADCALL |args| (QREFELT $ 52))
                          |prec| $))
                        (QREFELT $ 34))
                       $))
                     ((EQUAL |op| 'SLASH)
                      (|MMLFORM;group|
                       (SPADCALL
                        (LIST
                         (|MMLFORM;formatExpr| (|SPADfirst| |args|) |prec| $)
                         "<mo>/</mo>"
                         (|MMLFORM;formatExpr| (SPADCALL |args| (QREFELT $ 52))
                          |prec| $))
                        (QREFELT $ 34))
                       $))
                     ((EQUAL |op| 'VCONCAT)
                      (|MMLFORM;group|
                       (SPADCALL
                        (LIST "<mtable><mtr>"
                              (SPADCALL
                               (PROGN
                                (LETT #3# NIL)
                                (SEQ (LETT |u| NIL) (LETT #2# |args|) G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN (LETT |u| (CAR #2#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #3#
                                             (CONS
                                              (SPADCALL
                                               (LIST "<mtd>"
                                                     (|MMLFORM;formatExpr| |u|
                                                      (QREFELT $ 8) $)
                                                     "</mtd>")
                                               (QREFELT $ 34))
                                              #3#))))
                                     (LETT #2# (CDR #2#)) (GO G190) G191
                                     (EXIT (NREVERSE #3#))))
                               (QREFELT $ 34))
                              "</mtr></mtable>")
                        (QREFELT $ 34))
                       $))
                     ((EQUAL |op| 'CONCATB)
                      (|MMLFORM;formatNary| 'STRSEP " " 0 |args| (QREFELT $ 8)
                       $))
                     ((EQUAL |op| 'CONCAT)
                      (|MMLFORM;formatNary| 'STRSEP "" 0 |args| (QREFELT $ 8)
                       $))
                     ((EQUAL |op| 'QUOTE)
                      (|MMLFORM;group|
                       (STRCONC "<mo>'</mo>"
                                (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                                 (QREFELT $ 8) $))
                       $))
                     ((EQUAL |op| 'BRACKET)
                      (|MMLFORM;group|
                       (|MMLFORM;addBrackets|
                        (|MMLFORM;ungroup|
                         (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                          (QREFELT $ 8) $)
                         $)
                        $)
                       $))
                     ((EQUAL |op| 'BRACE)
                      (|MMLFORM;group|
                       (|MMLFORM;addBraces|
                        (|MMLFORM;ungroup|
                         (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                          (QREFELT $ 8) $)
                         $)
                        $)
                       $))
                     ((EQUAL |op| 'PAREN)
                      (|MMLFORM;group|
                       (|MMLFORM;parenthesize|
                        (|MMLFORM;ungroup|
                         (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                          (QREFELT $ 8) $)
                         $)
                        $)
                       $))
                     ((EQUAL |op| 'PRIME)
                      (|MMLFORM;formatPrime| |args| |prec| $))
                     ((EQUAL |op| 'OVERBAR)
                      (COND ((NULL |args|) "")
                            (#4='T
                             (|MMLFORM;group|
                              (SPADCALL
                               (LIST "<mover accent='true'><mrow>"
                                     (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                                      (QREFELT $ 8) $)
                                     "</mrow><mo stretchy='true'>&#x000AF;</mo></mover>")
                               (QREFELT $ 34))
                              $))))
                     ((EQUAL |op| 'ROOT)
                      (COND ((NULL |args|) "")
                            (#4#
                             (SEQ
                              (LETT |tmp|
                                    (|MMLFORM;group|
                                     (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                                      (QREFELT $ 8) $)
                                     $))
                              (EXIT
                               (COND
                                ((NULL (CDR |args|))
                                 (SPADCALL (LIST "<msqrt>" |tmp| "</msqrt>")
                                           (QREFELT $ 34)))
                                (#4#
                                 (|MMLFORM;group|
                                  (SPADCALL
                                   (LIST "<mroot><mrow>" |tmp| "</mrow>"
                                         (|MMLFORM;formatExpr|
                                          (|SPADfirst| (CDR |args|))
                                          (QREFELT $ 8) $)
                                         "</mroot>")
                                   (QREFELT $ 34))
                                  $))))))))
                     ((EQUAL |op| 'SEGMENT)
                      (SEQ
                       (LETT |tmp|
                             (SPADCALL
                              (LIST
                               (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                                (QREFELT $ 8) $)
                               "<mo>..</mo>")
                              (QREFELT $ 34)))
                       (EXIT
                        (|MMLFORM;group|
                         (COND ((NULL (CDR |args|)) |tmp|)
                               (#4#
                                (SPADCALL
                                 (LIST |tmp|
                                       (|MMLFORM;formatExpr|
                                        (|SPADfirst| (CDR |args|))
                                        (QREFELT $ 8) $))
                                 (QREFELT $ 34))))
                         $))))
                     ((EQUAL |op| 'SUB)
                      (|MMLFORM;group|
                       (SPADCALL
                        (LIST "<msub>"
                              (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                               (QREFELT $ 8) $)
                              (|MMLFORM;formatSpecial| 'AGGLST (CDR |args|)
                               (QREFELT $ 8) $)
                              "</msub>")
                        (QREFELT $ 34))
                       $))
                     ((EQUAL |op| 'SUPERSUB)
                      (SEQ
                       (LETT |base|
                             (SPADCALL
                              (LIST "<mrow>"
                                    (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                                     (QREFELT $ 8) $)
                                    "</mrow>")
                              (QREFELT $ 34)))
                       (LETT |args| (CDR |args|)) (LETT |n| (LENGTH |args|))
                       (EXIT
                        (COND
                         ((> |n| 4)
                          (|error|
                           "multiscript object has more than 4 scripts"))
                         (#4#
                          (SEQ
                           (LETT |tmp1|
                                 (|MMLFORM;optionalWrap|
                                  (SPADCALL |args| 1 (QREFELT $ 53)) $))
                           (EXIT
                            (COND
                             ((EQL |n| 1)
                              (SPADCALL (LIST "<msub>" |base| |tmp1| "</msub>")
                                        (QREFELT $ 34)))
                             (#4#
                              (SEQ
                               (LETT |tmp2|
                                     (|MMLFORM;optionalWrap|
                                      (SPADCALL |args| 2 (QREFELT $ 53)) $))
                               (EXIT
                                (COND
                                 ((EQL |n| 2)
                                  (SPADCALL
                                   (LIST "<msubsup>" |base| |tmp1| |tmp2|
                                         "</msubsup>")
                                   (QREFELT $ 34)))
                                 (#4#
                                  (SEQ
                                   (LETT |tmp3|
                                         (|MMLFORM;optionalWrap|
                                          (SPADCALL |args| 3 (QREFELT $ 53))
                                          $))
                                   (LETT |base|
                                         (SPADCALL
                                          (LIST "<mmultiscripts>" |base| |tmp1|
                                                |tmp2| "<mprescripts/>" |tmp3|)
                                          (QREFELT $ 34)))
                                   (EXIT
                                    (COND
                                     ((EQL |n| 3)
                                      (SPADCALL
                                       (LIST |base| "<none/></mmultiscripts>")
                                       (QREFELT $ 34)))
                                     (#4#
                                      (SPADCALL
                                       (LIST |base|
                                             (|MMLFORM;optionalWrap|
                                              (SPADCALL |args| 4
                                                        (QREFELT $ 53))
                                              $)
                                             "</mmultiscripts>")
                                       (QREFELT $ 34)))))))))))))))))))
                     ((EQUAL |op| 'SC)
                      (COND ((NULL |args|) "")
                            (#4#
                             (SEQ
                              (LETT |tmp|
                                    (|MMLFORM;formatNaryNoGroup| 'STRSEP
                                     "</mtd></mtr><mtr><mtd>" 800 |args|
                                     (QREFELT $ 8) $))
                              (EXIT
                               (|MMLFORM;group|
                                (SPADCALL
                                 (LIST "<mtable><mtr><mtd>" |tmp|
                                       "</mtd></mtr></mtable>")
                                 (QREFELT $ 34))
                                $))))))
                     ((EQUAL |op| 'MATRIX)
                      (|MMLFORM;formatMatrix| (CDR |args|) $))
                     ((EQUAL |op| 'BOX)
                      (COND ((NULL |args|) "")
                            (#4#
                             (SEQ
                              (LETT |tmp|
                                    (|MMLFORM;formatNaryNoGroup| 'STRSEP "" 0
                                     |args| (QREFELT $ 8) $))
                              (EXIT
                               (|MMLFORM;group|
                                (SPADCALL
                                 (LIST "<mtable frame=\"solid\"><mtr><mtd>"
                                       |tmp| "</mtd></mtr></mtable>")
                                 (QREFELT $ 34))
                                $))))))
                     ((EQUAL |op| 'EQUATNUM)
                      (SPADCALL
                       (LIST "<mtable><mtr><mtd>"
                             (|MMLFORM;formatExpr|
                              (SPADCALL |args| 1 (QREFELT $ 53)) (QREFELT $ 8)
                              $)
                             "</mtd><mtd style=\"padding-left: 50px;\">"
                             (|MMLFORM;formatExpr|
                              (SPADCALL |args| 2 (QREFELT $ 53)) (QREFELT $ 8)
                              $)
                             "</mtd></mtr></mtable>")
                       (QREFELT $ 34)))
                     ((EQUAL |op| 'BINOMIAL)
                      (SPADCALL
                       (LIST "<mrow><mo stretchy=\"true\">(</mo>"
                             "<mfrac linethickness=\"0\">"
                             (|MMLFORM;formatExpr|
                              (SPADCALL |args| 1 (QREFELT $ 53)) (QREFELT $ 8)
                              $)
                             (|MMLFORM;formatExpr|
                              (SPADCALL |args| 2 (QREFELT $ 53)) (QREFELT $ 8)
                              $)
                             "</mfrac><mo>)</mo></mrow>")
                       (QREFELT $ 34)))
                     ((EQUAL |op| 'NOTHING) "<none/>")
                     ((EQUAL |op| 'ZAG)
                      (SPADCALL
                       (LIST
                        "<mtable><mtr><mtd style=\"border-right: solid 1px black;"
                        " border-bottom: solid 1px black; padding-right: 2px;"
                        " padding-left: 2px;\">"
                        (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                         (QREFELT $ 8) $)
                        "</mtd></mtr><mtr><mtd style=\"border-left: solid 1px black;"
                        " padding-left: 2px; padding-right: 2px;\">"
                        (|MMLFORM;formatExpr| (|SPADfirst| (CDR |args|))
                         (QREFELT $ 8) $)
                        "</mtd></mtr></mtable>")
                       (QREFELT $ 34)))
                     (#4#
                      (SPADCALL
                       (LIST "<mtext>not done yet for: "
                             (SPADCALL |op| (QREFELT $ 55)) "</mtext>")
                       (QREFELT $ 34)))))))) 

(SDEFUN |MMLFORM;formatPrime|
        ((|args| |List| (|OutputForm|)) (|prec| |Integer|) ($ |String|))
        (SPROG
         ((|arg2| (|OutputForm|)) (|s| (|String|)) (|commaTest| (|String|))
          (#1=#:G548 NIL) (|i| NIL) (|commaS| (|String|)))
         (SEQ (LETT |arg2| (SPADCALL |args| (QREFELT $ 52)))
              (COND
               ((SPADCALL |arg2| (QREFELT $ 56))
                (SEQ (LETT |commaS| (SPADCALL |arg2| (QREFELT $ 57)))
                     (LETT |commaTest| ",")
                     (EXIT
                      (COND
                       ((> (SPADCALL |commaTest| |commaS| 1 (QREFELT $ 50)) 0)
                        (SEQ (LETT |s| "<mo>&#x02032;</mo>")
                             (SEQ (LETT |i| 2) (LETT #1# (QCSIZE |commaS|))
                                  G190
                                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                                  (SEQ
                                   (LETT |commaTest|
                                         (SPADCALL |commaTest| ","
                                                   (QREFELT $ 58)))
                                   (EXIT
                                    (LETT |s|
                                          (SPADCALL |s| "<mo>&#x02032;</mo>"
                                                    (QREFELT $ 58)))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT
                              (COND
                               ((EQUAL |commaS| |commaTest|)
                                (LETT |arg2|
                                      (SPADCALL |s| (QREFELT $ 59)))))))))))))
              (EXIT
               (|MMLFORM;formatSpecial| 'SUPERSUB
                (LIST (|SPADfirst| |args|) (SPADCALL (QREFELT $ 60)) |arg2|)
                |prec| $))))) 

(SDEFUN |MMLFORM;formatPlex|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|s| (|String|)) (|t1| #1=(|String|)) (|t2| (|String|)) (|body| #1#)
          (|ops| (|String|)) (|n| (|Integer|)) (|opPrec| (|Integer|))
          (|p| (|Integer|)))
         (SEQ (LETT |p| (SPADCALL |op| (QREFELT $ 16) (QREFELT $ 62)))
              (EXIT
               (COND ((< |p| 1) (|error| "unknown plex op"))
                     (#2='T
                      (SEQ
                       (LETT |opPrec|
                             (SPADCALL (QREFELT $ 17) |p| (QREFELT $ 64)))
                       (LETT |n| (LENGTH |args|))
                       (COND
                        ((SPADCALL |n| 2 (QREFELT $ 65))
                         (COND
                          ((SPADCALL |n| 3 (QREFELT $ 65))
                           (EXIT
                            (|error| "wrong number of arguments for plex"))))))
                       (LETT |ops|
                             (COND
                              ((EQUAL |op| 'SIGMA)
                               (COND ((EQL |n| 2) "&Sum;")
                                     (#2#
                                      (|error|
                                       "wrong number of arguments for plex"))))
                              ((EQUAL |op| 'SIGMA2)
                               (COND ((EQL |n| 3) "&Sum;")
                                     (#2#
                                      (|error|
                                       "wrong number of arguments for plex"))))
                              ((EQUAL |op| 'PI)
                               (COND ((EQL |n| 2) "&Pi;")
                                     (#2#
                                      (|error|
                                       "wrong number of arguments for plex"))))
                              ((EQUAL |op| 'PI2)
                               (COND ((EQL |n| 3) "&Pi;")
                                     (#2#
                                      (|error|
                                       "wrong number of arguments for plex"))))
                              ((EQUAL |op| 'INTSIGN)
                               (COND ((EQL |n| 3) "&int;")
                                     (#2#
                                      (|error|
                                       "wrong number of arguments for plex"))))
                              (#2#
                               (|error|
                                (SPADCALL "Unexpected plex op:"
                                          (SPADCALL |op| (QREFELT $ 55))
                                          (QREFELT $ 58))))))
                       (LETT |body|
                             (COND
                              ((EQUAL |op| 'INTSIGN)
                               (|MMLFORM;formatExpr|
                                (SPADCALL |args| 3 (QREFELT $ 53))
                                (QREFELT $ 8) $))
                              (#2#
                               (|MMLFORM;formatExpr|
                                (SPADCALL |args| |n| (QREFELT $ 53)) |opPrec|
                                $))))
                       (LETT |t2|
                             (COND
                              ((EQL |n| 3)
                               (|MMLFORM;formatExpr|
                                (SPADCALL |args| 2 (QREFELT $ 53))
                                (QREFELT $ 8) $))
                              (#2# "<none/>")))
                       (LETT |t1|
                             (|MMLFORM;formatExpr|
                              (SPADCALL |args| 1 (QREFELT $ 53)) (QREFELT $ 8)
                              $))
                       (LETT |s|
                             (SPADCALL
                              (LIST "<munderover><mo>" |ops| "</mo>" |t1| |t2|
                                    "</munderover>" |body|)
                              (QREFELT $ 34)))
                       (COND
                        ((< |opPrec| |prec|)
                         (LETT |s| (|MMLFORM;parenthesize| |s| $))))
                       (EXIT (|MMLFORM;group| |s| $))))))))) 

(SDEFUN |MMLFORM;formatMatrix| ((|args| |List| (|OutputForm|)) ($ |String|))
        (|MMLFORM;group|
         (|MMLFORM;addBrackets|
          (SPADCALL
           (LIST "<mtable><mtr><mtd>"
                 (|MMLFORM;formatNaryNoGroup| 'STRSEP "</mtd></mtr><mtr><mtd>"
                  0 |args| (QREFELT $ 8) $)
                 "</mtd></mtr></mtable>")
           (QREFELT $ 34))
          $)
         $)) 

(SDEFUN |MMLFORM;formatFunction|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG ((|ops| (|String|)))
               (SEQ (LETT |ops| (|MMLFORM;formatExpr| |op| (QREFELT $ 8) $))
                    (EXIT
                     (|MMLFORM;group|
                      (SPADCALL
                       (LIST "<mo>" |ops| "</mo>"
                             (|MMLFORM;parenthesize|
                              (|MMLFORM;formatNary| '|,| "" 0 |args|
                               (QREFELT $ 8) $)
                              $))
                       (QREFELT $ 34))
                      $))))) 

(SDEFUN |MMLFORM;formatNullary| ((|op| |Symbol|) ($ |String|))
        (COND ((EQUAL |op| 'NOTHING) "")
              ('T
               (|MMLFORM;group|
                (SPADCALL
                 (LIST "<mo>" (SPADCALL |op| (QREFELT $ 55))
                       "</mo><mo>(</mo><mo>)</mo>")
                 (QREFELT $ 34))
                $)))) 

(SDEFUN |MMLFORM;formatUnary|
        ((|op| |Symbol|) (|arg| |OutputForm|) (|prec| |Integer|) ($ |String|))
        (SPROG ((|s| (|String|)) (|opPrec| (|Integer|)) (|p| (|Integer|)))
               (SEQ (LETT |p| (SPADCALL |op| (QREFELT $ 9) (QREFELT $ 62)))
                    (EXIT
                     (COND ((< |p| 1) (|error| "unknown unary op"))
                           (#1='T
                            (SEQ
                             (LETT |opPrec|
                                   (SPADCALL (QREFELT $ 10) |p|
                                             (QREFELT $ 64)))
                             (LETT |s|
                                   (SPADCALL
                                    (LIST "<mo>" (SPADCALL |op| (QREFELT $ 55))
                                          "</mo>"
                                          (|MMLFORM;formatExpr| |arg| |opPrec|
                                           $))
                                    (QREFELT $ 34)))
                             (EXIT
                              (COND
                               ((< |opPrec| |prec|)
                                (|MMLFORM;group| (|MMLFORM;parenthesize| |s| $)
                                 $))
                               ((EQUAL |op| '-) |s|)
                               (#1# (|MMLFORM;group| |s| $))))))))))) 

(SDEFUN |MMLFORM;formatBinary|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|s| (|String|)) (|ops| (|String|)) (|s2| #1=(|String|)) (|s1| #1#)
          (|opPrec| (|Integer|)) (|p| (|Integer|)))
         (SEQ (LETT |p| (SPADCALL |op| (QREFELT $ 11) (QREFELT $ 62)))
              (EXIT
               (COND ((< |p| 1) (|error| "unknown binary op"))
                     (#2='T
                      (SEQ
                       (LETT |opPrec|
                             (SPADCALL (QREFELT $ 12) |p| (QREFELT $ 64)))
                       (LETT |s1|
                             (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                              |opPrec| $))
                       (LETT |s2|
                             (|MMLFORM;formatExpr| (|SPADfirst| (CDR |args|))
                              |opPrec| $))
                       (LETT |s|
                             (COND
                              ((EQUAL |op| '^)
                               (SPADCALL
                                (LIST "<msup><mrow>" |s1| "</mrow><mrow>" |s2|
                                      "</mrow></msup>")
                                (QREFELT $ 34)))
                              ((EQUAL |op| '/)
                               (SPADCALL
                                (LIST "<mfrac><mrow>" |s1| "</mrow><mrow>" |s2|
                                      "</mrow></mfrac>")
                                (QREFELT $ 34)))
                              (#2#
                               (COND
                                ((EQUAL |op| 'OVER)
                                 (SPADCALL
                                  (LIST "<mfrac><mrow>" |s1| "</mrow><mrow>"
                                        |s2| "</mrow></mfrac>")
                                  (QREFELT $ 34)))
                                (#2#
                                 (SEQ
                                  (LETT |ops|
                                        (COND ((EQUAL |op| 'LET) ":=")
                                              ((EQUAL |op| '<) "&lt;")
                                              ((EQUAL |op| '<=) "&lt;=")
                                              (#2#
                                               (SPADCALL |op|
                                                         (QREFELT $ 55)))))
                                  (EXIT
                                   (SPADCALL
                                    (LIST "<mrow>" |s1| "</mrow><mo>" |ops|
                                          "</mo><mrow>" |s2| "</mrow>")
                                    (QREFELT $ 34)))))))))
                       (EXIT
                        (|MMLFORM;group|
                         (COND
                          ((OR (OR (EQUAL |op| '/) (EQUAL |op| 'OVER))
                               (NULL (< |opPrec| |prec|)))
                           |s|)
                          ('T (|MMLFORM;parenthesize| |s| $)))
                         $))))))))) 

(SDEFUN |MMLFORM;formatNary|
        ((|op| |Symbol|) (|sep| |String|) (|opprec| |Integer|)
         (|args| |List| (|OutputForm|)) (|prec| |Integer|) ($ |String|))
        (|MMLFORM;group|
         (|MMLFORM;formatNaryNoGroup| |op| |sep| |opprec| |args| |prec| $) $)) 

(SDEFUN |MMLFORM;formatNaryNoGroup|
        ((|op| |Symbol|) (|sep| |String|) (|opprec| |Integer|)
         (|args| |List| (|OutputForm|)) (|prec| |Integer|) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|l| (|List| (|String|))) (#1=#:G586 NIL) (|a| NIL)
          (|opPrec| (|Integer|)) (|ops| (|String|)) (|p| (|Integer|)))
         (SEQ
          (COND ((NULL |args|) "")
                (#2='T
                 (SEQ (LETT |p| (SPADCALL |op| (QREFELT $ 13) (QREFELT $ 62)))
                      (EXIT
                       (COND ((< |p| 1) (|error| "unknown nary op"))
                             (#2#
                              (SEQ
                               (LETT |ops|
                                     (COND ((EQUAL |op| 'STRSEP) |sep|)
                                           ((EQUAL |op| '*)
                                            "<mo>&#x02062;</mo>")
                                           (#2#
                                            (COND
                                             ((EQUAL |op| 'ROW) "</mtd><mtd>")
                                             ((EQUAL |op| 'TENSOR)
                                              "<mo>&#x02297;</mo>")
                                             (#2#
                                              (SPADCALL
                                               (LIST "<mo>"
                                                     (SPADCALL |op|
                                                               (QREFELT $ 55))
                                                     "</mo>")
                                               (QREFELT $ 34)))))))
                               (LETT |l| NIL)
                               (LETT |opPrec|
                                     (COND ((EQUAL |op| 'STRSEP) |opprec|)
                                           (#2#
                                            (SPADCALL (QREFELT $ 14) |p|
                                                      (QREFELT $ 64)))))
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
                                                   (|MMLFORM;formatExpr| |a|
                                                    |opPrec| $)
                                                   |l|)))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT NIL))
                               (LETT |s|
                                     (SPADCALL (REVERSE (CDR |l|))
                                               (QREFELT $ 34)))
                               (EXIT
                                (COND
                                 ((< |opPrec| |prec|)
                                  (|MMLFORM;parenthesize| |s| $))
                                 (#2# |s|))))))))))))) 

(SDEFUN |MMLFORM;formatExpr|
        ((|expr| |OutputForm|) (|prec| |Integer|) ($ |String|))
        (SPROG
         ((|op| (|Symbol|)) (|nargs| (|Integer|))
          (|args| (|List| (|OutputForm|))) (|opf| (|OutputForm|))
          (|i| (|Integer|)) (|nstr| (|String|)) (|str| (|String|))
          (|len| (|Integer|)) (|intSplitLen| (|Integer|)))
         (SEQ (LETT |intSplitLen| 20)
              (EXIT
               (COND
                ((SPADCALL |expr| (QREFELT $ 32))
                 (SEQ (LETT |str| (|MMLFORM;stringify| |expr| $))
                      (LETT |len| (QCSIZE |str|))
                      (EXIT
                       (COND
                        ((SPADCALL |expr| (QREFELT $ 66))
                         (SEQ (LETT |i| (SPADCALL |expr| (QREFELT $ 67)))
                              (EXIT
                               (COND
                                ((OR (< |i| 0) (> |i| 9))
                                 (|MMLFORM;group|
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
                                                                               41))
                                                                    (QREFELT $
                                                                             42)))
                                                    (QREFELT $ 34)))
                                             (EXIT
                                              (LETT |str|
                                                    (SPADCALL |str|
                                                              (SPADCALL
                                                               (+ |intSplitLen|
                                                                  1)
                                                               (QREFELT $ 68))
                                                              (QREFELT $
                                                                       42)))))
                                            NIL (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |nstr| (QREFELT $ 69))
                                          (SPADCALL (LIST "<mn>" |str| "</mn>")
                                                    (QREFELT $ 34)))
                                         (#1='T
                                          (SEQ
                                           (LETT |nstr|
                                                 (COND
                                                  ((SPADCALL |str|
                                                             (QREFELT $ 69))
                                                   |nstr|)
                                                  (#1#
                                                   (SPADCALL
                                                    (LIST |nstr| " " |str|)
                                                    (QREFELT $ 34)))))
                                           (EXIT
                                            (SPADCALL
                                             (LIST "<mn>"
                                                   (SPADCALL |nstr|
                                                             (SPADCALL 2
                                                                       (QREFELT
                                                                        $ 68))
                                                             (QREFELT $ 42))
                                                   "</mn>")
                                             (QREFELT $ 34))))))))
                                  $))
                                ('T
                                 (SPADCALL (LIST "<mn>" |str| "</mn>")
                                           (QREFELT $ 34)))))))
                        ((EQUAL |str| "%pi") "<mi>&#x003C0;</mi>")
                        ((EQUAL |str| "%e") "<mi>&#x02147;</mi>")
                        ((EQUAL |str| "%i") "<mi>&#x02148;</mi>")
                        (#1#
                         (SEQ
                          (COND
                           ((> |len| 0)
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 46))
                                        (|STR_to_CHAR| "%"))
                              (EXIT
                               (SPADCALL (LIST "<mi>" |str| "</mi>")
                                         (QREFELT $ 34)))))))
                          (COND
                           ((> |len| 1)
                            (COND
                             ((SPADCALL (SPADCALL |str| 1 (QREFELT $ 46))
                                        (QREFELT $ 70))
                              (EXIT
                               (SPADCALL (LIST "<mn>" |str| "</mn>")
                                         (QREFELT $ 34)))))))
                          (COND
                           ((> |len| 0)
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 46))
                                        (|STR_to_CHAR| "\""))
                              (EXIT
                               (SPADCALL (LIST "<mtext>" |str| "</mtext>")
                                         (QREFELT $ 34)))))))
                          (COND
                           ((EQL |len| 1)
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 46))
                                        (|STR_to_CHAR| " "))
                              (EXIT " ")))))
                          (COND
                           ((SPADCALL |expr| (QREFELT $ 71))
                            (SEQ (LETT |op| (SPADCALL |expr| (QREFELT $ 72)))
                                 (LETT |i|
                                       (SPADCALL |op| (QREFELT $ 19)
                                                 (QREFELT $ 62)))
                                 (EXIT
                                  (COND
                                   ((> |i| 0)
                                    (SPADCALL (QREFELT $ 20) |i|
                                              (QREFELT $ 74))))))))
                          (LETT |i|
                                (SPADCALL (|STR_to_CHAR| " ") |str|
                                          (QREFELT $ 76)))
                          (EXIT
                           (COND
                            ((> |i| 0)
                             (SPADCALL (LIST "<mtext>" |str| "</mtext>")
                                       (QREFELT $ 34)))
                            (#1#
                             (SPADCALL (LIST "<mi>" |str| "</mi>")
                                       (QREFELT $ 34)))))))))))
                (#1#
                 (SEQ (LETT |opf| (SPADCALL |expr| (QREFELT $ 35)))
                      (LETT |args| (SPADCALL |expr| (QREFELT $ 38)))
                      (LETT |nargs| (LENGTH |args|))
                      (EXIT
                       (COND
                        ((SPADCALL |opf| (QREFELT $ 71))
                         (SEQ (LETT |op| (SPADCALL |opf| (QREFELT $ 72)))
                              (EXIT
                               (COND
                                ((SPADCALL |op| (QREFELT $ 18) (QREFELT $ 77))
                                 (|MMLFORM;formatSpecial| |op| |args| |prec|
                                  $))
                                ((SPADCALL |op| (QREFELT $ 16) (QREFELT $ 77))
                                 (|MMLFORM;formatPlex| |op| |args| |prec| $))
                                ((EQL 0 |nargs|)
                                 (|MMLFORM;formatNullary| |op| $))
                                (#1#
                                 (SEQ
                                  (COND
                                   ((EQL 1 |nargs|)
                                    (COND
                                     ((SPADCALL |op| (QREFELT $ 9)
                                                (QREFELT $ 77))
                                      (EXIT
                                       (|MMLFORM;formatUnary| |op|
                                        (|SPADfirst| |args|) |prec| $))))))
                                  (COND
                                   ((EQL 2 |nargs|)
                                    (COND
                                     ((SPADCALL |op| (QREFELT $ 11)
                                                (QREFELT $ 77))
                                      (EXIT
                                       (|MMLFORM;formatBinary| |op| |args|
                                        |prec| $))))))
                                  (EXIT
                                   (COND
                                    ((SPADCALL |op| (QREFELT $ 15)
                                               (QREFELT $ 77))
                                     (|MMLFORM;formatNaryNoGroup| |op| "" 0
                                      |args| |prec| $))
                                    ((SPADCALL |op| (QREFELT $ 13)
                                               (QREFELT $ 77))
                                     (|MMLFORM;formatNary| |op| "" 0 |args|
                                      |prec| $))
                                    (#1#
                                     (|MMLFORM;formatFunction| |opf| |args|
                                      |prec| $))))))))))
                        (#1#
                         (|MMLFORM;formatFunction| |opf| |args| |prec|
                          $))))))))))) 

(DECLAIM (NOTINLINE |MathMLFormat;|)) 

(DEFUN |MathMLFormat| ()
  (SPROG NIL
         (PROG (#1=#:G617)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|MathMLFormat|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|MathMLFormat|
                             (LIST (CONS NIL (CONS 1 (|MathMLFormat;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|MathMLFormat|)))))))))) 

(DEFUN |MathMLFormat;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|MathMLFormat|))
          (LETT $ (GETREFV 80))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|MathMLFormat| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 " \\  ")
          (QSETREFV $ 7 1000000)
          (QSETREFV $ 8 0)
          (QSETREFV $ 9 '(-))
          (QSETREFV $ 10 '(710))
          (QSETREFV $ 11 '(+-> |\|| ^ / = ~= < <= > >= OVER LET))
          (QSETREFV $ 12 (LIST 0 0 900 700 400 400 400 400 400 400 700 125))
          (QSETREFV $ 13 '(- + * |,| |;| ROW STRSEP TENSOR))
          (QSETREFV $ 14 (LIST 700 700 800 110 110 0 0 850))
          (QSETREFV $ 15 '(ROW))
          (QSETREFV $ 16 '(SIGMA SIGMA2 PI PI2 INTSIGN))
          (QSETREFV $ 17 '(750 750 750 750 700))
          (QSETREFV $ 18
                    '(MATRIX BRACKET BRACE CONCATB VCONCAT AGGLST CONCAT
                      OVERBAR ROOT SUB TAG SUPERSUB ZAG AGGSET SC PAREN SEGMENT
                      QUOTE |theMap| SLASH PRIME BOX EQUATNUM BINOMIAL
                      NOTHING))
          (QSETREFV $ 19
                    '(|cos| |cot| |csc| |log| |sec| |sin| |tan| |cosh| |coth|
                      |csch| |sech| |sinh| |tanh| |acos| |asin| |atan| |erf|
                      |...| $ |infinity| |Gamma|))
          (QSETREFV $ 20
                    (LIST "<mo>cos</mo>" "<mo>cot</mo>" "<mo>csc</mo>"
                          "<mo>log</mo>" "<mo>sec</mo>" "<mo>sin</mo>"
                          "<mo>tan</mo>" "<mo>cosh</mo>" "<mo>coth</mo>"
                          "<mo>csch</mo>" "<mo>sech</mo>" "<mo>sinh</mo>"
                          "<mo>tanh</mo>" "<mo>arccos</mo>" "<mo>arcsin</mo>"
                          "<mo>arctan</mo>" "<mo>erf</mo>" "<mo>&#x2026;</mo>"
                          "<mo>$</mo>" "<mo>&#x221E;</mo>"
                          "<mo>&#x0413;</mo>"))
          $))) 

(MAKEPROP '|MathMLFormat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|blank| '|maxPrec| '|minPrec|
              '|unaryOps| '|unaryPrecs| '|binaryOps| '|binaryPrecs| '|naryOps|
              '|naryPrecs| '|naryNGOps| '|plexOps| '|plexPrecs| '|specialOps|
              '|specialStrings| '|specialStringsInMML| (|OutputForm|)
              (|OutputFormTools|) (0 . |precondition|) (|String|)
              |MMLFORM;coerce;OfS;1| |MMLFORM;coerceS;OfS;3|
              |MMLFORM;coerceL;OfS;4| (|Void|) (5 . |void|)
              |MMLFORM;display;SV;5| (|Boolean|) (9 . |atom?|) (|List| $)
              (14 . |concat|) (19 . |operator|) |MMLFORM;exprex;OfS;6|
              (|List| 21) (24 . |arguments|) (|Integer|)
              (|UniversalSegment| 39) (29 . |segment|) (35 . |elt|)
              (|DisplayPackage|) (41 . |say|) (|Character|) (46 . |elt|)
              (|CharacterClass|) (52 . |lowerCase|) (56 . |member?|)
              (62 . |position|) (69 . ~=) (75 . |second|) (80 . |elt|)
              (|Symbol|) (86 . |string|) (91 . |string?|) (96 . |string|)
              (101 . |elt|) (107 . |message|) (112 . |empty|) (|List| 54)
              (116 . |position|) (|List| 39) (122 . |elt|) (128 . ~=)
              (134 . |integer?|) (139 . |integer|) (144 . |segment|)
              (149 . |empty?|) (154 . |digit?|) (159 . |symbol?|)
              (164 . |symbol|) (|List| 24) (169 . |elt|) (175 . |char|)
              (180 . |position|) (186 . |member?|) (|SingleInteger|)
              (|HashState|))
           '#(~= 192 |latex| 198 |hashUpdate!| 203 |hash| 209 |exprex| 214
              |display| 219 |coerceS| 224 |coerceL| 229 |coerce| 234 = 244)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 21))
                        (|makeByteWordVec2| 79
                                            '(1 22 21 21 23 0 28 0 29 1 22 31
                                              21 32 1 24 0 33 34 1 22 21 21 35
                                              1 22 37 21 38 2 40 0 39 39 41 2
                                              24 0 0 40 42 1 43 28 24 44 2 24
                                              45 0 39 46 0 47 0 48 2 47 31 45 0
                                              49 3 24 39 0 0 39 50 2 45 31 0 0
                                              51 1 37 21 0 52 2 37 21 0 39 53 1
                                              54 24 0 55 1 22 31 21 56 1 22 24
                                              21 57 2 24 0 0 0 58 1 21 0 24 59
                                              0 21 0 60 2 61 39 54 0 62 2 63 39
                                              0 39 64 2 39 31 0 0 65 1 22 31 21
                                              66 1 22 39 21 67 1 40 0 39 68 1
                                              24 31 0 69 1 45 31 0 70 1 22 31
                                              21 71 1 22 54 21 72 2 73 24 0 39
                                              74 1 45 0 24 75 2 24 39 45 0 76 2
                                              61 31 54 0 77 2 0 31 0 0 1 1 0 24
                                              0 1 2 0 79 79 0 1 1 0 78 0 1 1 0
                                              24 21 36 1 0 28 24 30 1 0 24 21
                                              26 1 0 24 21 27 1 0 24 21 25 1 0
                                              21 0 1 2 0 31 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|MathMLFormat| 'NILADIC T) 
