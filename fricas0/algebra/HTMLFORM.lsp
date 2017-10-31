
(SDEFUN |HTMLFORM;coerce;OfS;1| ((|expr| |OutputForm|) ($ |String|))
        (SEQ
         (|HTMLFORM;outputTree|
          (|HTMLFORM;formatHtml| (SPADCALL |expr| (QREFELT $ 24)) (QREFELT $ 8)
           $)
          $)
         (EXIT " "))) 

(SDEFUN |HTMLFORM;coerceS;OfS;2| ((|expr| |OutputForm|) ($ |String|))
        (SEQ
         (|HTMLFORM;outputTree|
          (|HTMLFORM;formatHtml| (SPADCALL |expr| (QREFELT $ 24)) (QREFELT $ 8)
           $)
          $)
         (EXIT " "))) 

(SDEFUN |HTMLFORM;coerceL;OfS;3| ((|expr| |OutputForm|) ($ |String|))
        (SEQ
         (|HTMLFORM;outputTree|
          (|HTMLFORM;formatHtml| (SPADCALL |expr| (QREFELT $ 24)) (QREFELT $ 8)
           $)
          $)
         (EXIT " "))) 

(SDEFUN |HTMLFORM;display;SV;4| ((|html| |String|) ($ |Void|))
        (SEQ (|sayHtml| |html|) (EXIT (SPADCALL (QREFELT $ 30))))) 

(SDEFUN |HTMLFORM;newNode|
        ((|tag| |String|) (|node| |Tree| (|String|)) ($ |Tree| (|String|)))
        (SPROG ((|t| (|Tree| (|String|))))
               (SEQ
                (LETT |t| (SPADCALL (|String|) (LIST |node|) (QREFELT $ 34))
                      |HTMLFORM;newNode|)
                (SPADCALL |t| |tag| (QREFELT $ 35)) (EXIT |t|)))) 

(SDEFUN |HTMLFORM;newNodes|
        ((|tag| |String|) (|nodes| |List| (|Tree| (|String|)))
         ($ |Tree| (|String|)))
        (SPROG ((|t| (|Tree| (|String|))))
               (SEQ
                (LETT |t| (SPADCALL (|String|) |nodes| (QREFELT $ 34))
                      |HTMLFORM;newNodes|)
                (SPADCALL |t| |tag| (QREFELT $ 35)) (EXIT |t|)))) 

(SDEFUN |HTMLFORM;notTable?| ((|node| |Tree| (|String|)) ($ |Boolean|))
        (SPROG
         ((#1=#:G803 NIL) (#2=#:G804 NIL) (|a| NIL)
          (|c| (|List| (|Tree| (|String|)))))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL |node| (QREFELT $ 37))
                 (SPADCALL |node| (QREFELT $ 38)))
             'T)
            ((SPADCALL "table" (SPADCALL |node| (QREFELT $ 39)) (QREFELT $ 40))
             NIL)
            ('T
             (SEQ
              (LETT |c| (SPADCALL |node| (QREFELT $ 41))
                    . #3=(|HTMLFORM;notTable?|))
              (SEQ (LETT |a| NIL . #3#) (LETT #2# |c| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (|HTMLFORM;notTable?| |a| $))
                       (PROGN (LETT #1# NIL . #3#) (GO #4=#:G802))))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT 'T)))))
          #4# (EXIT #1#)))) 

(SDEFUN |HTMLFORM;argsToString| ((|args| |List| (|OutputForm|)) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|s1| #1=(|String|)) (#2=#:G813 NIL) (|a| NIL)
          (|sop| #1#))
         (SEQ
          (LETT |sop| (SPADCALL (|SPADfirst| |args|) (QREFELT $ 42))
                . #3=(|HTMLFORM;argsToString|))
          (LETT |args| (CDR |args|) . #3#)
          (LETT |s| (SPADCALL (LIST "{" |sop|) (QREFELT $ 43)) . #3#)
          (SEQ (LETT |a| NIL . #3#) (LETT #2# |args| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |s1| (SPADCALL |a| (QREFELT $ 42)) . #3#)
                    (EXIT
                     (LETT |s| (SPADCALL (LIST |s| |s1|) (QREFELT $ 43))
                           . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (LETT |s| (SPADCALL (LIST |s| "}") (QREFELT $ 43)) . #3#))))) 

(SDEFUN |HTMLFORM;exprex;OfS;9| ((|expr| |OutputForm|) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|s1| #1=(|String|)) (#2=#:G820 NIL) (|a| NIL)
          (|nargs| (|Integer|)) (|args| (|List| (|OutputForm|))) (|sop| #1#)
          (|op| (|OutputForm|)))
         (SEQ
          (LETT |expr| (SPADCALL |expr| (QREFELT $ 24))
                . #3=(|HTMLFORM;exprex;OfS;9|))
          (COND
           ((OR (SPADCALL |expr| (QREFELT $ 44))
                (EQUAL (|HTMLFORM;stringify| |expr| $) "NOTHING"))
            (EXIT
             (SPADCALL (LIST "{" (|HTMLFORM;stringify| |expr| $) "}")
                       (QREFELT $ 43)))))
          (LETT |op| (SPADCALL |expr| (QREFELT $ 45)) . #3#)
          (LETT |sop| (SPADCALL |op| (QREFELT $ 42)) . #3#)
          (LETT |args| (SPADCALL |expr| (QREFELT $ 47)) . #3#)
          (LETT |nargs| (LENGTH |args|) . #3#)
          (LETT |s| (SPADCALL (LIST "{" |sop|) (QREFELT $ 43)) . #3#)
          (COND
           ((SPADCALL |nargs| 0 (QREFELT $ 49))
            (SEQ (LETT |a| NIL . #3#) (LETT #2# |args| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ (LETT |s1| (SPADCALL |a| (QREFELT $ 42)) . #3#)
                      (EXIT
                       (LETT |s| (SPADCALL (LIST |s| |s1|) (QREFELT $ 43))
                             . #3#)))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))))
          (EXIT (LETT |s| (SPADCALL (LIST |s| "}") (QREFELT $ 43)) . #3#))))) 

(SDEFUN |HTMLFORM;atomize| ((|expr| |OutputForm|) ($ |List| (|OutputForm|)))
        (SPROG
         ((|le| (|List| (|OutputForm|))) (#1=#:G826 NIL) (|a| NIL)
          (|letmp| (|List| (|OutputForm|))))
         (SEQ (LETT |le| NIL . #2=(|HTMLFORM;atomize|))
              (COND
               ((OR (SPADCALL |expr| (QREFELT $ 44))
                    (EQUAL (|HTMLFORM;stringify| |expr| $) "NOTHING"))
                (EXIT
                 (LETT |le|
                       (SPADCALL |le| (SPADCALL |expr| (QREFELT $ 50))
                                 (QREFELT $ 51))
                       . #2#))))
              (LETT |letmp|
                    (CONS (SPADCALL |expr| (QREFELT $ 45))
                          (SPADCALL |expr| (QREFELT $ 47)))
                    . #2#)
              (SEQ (LETT |a| NIL . #2#) (LETT #1# |letmp| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |le|
                           (SPADCALL |le| (|HTMLFORM;atomize| |a| $)
                                     (QREFELT $ 51))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |le|)))) 

(SDEFUN |HTMLFORM;outputTree| ((|t| |Tree| (|String|)) ($ |Void|))
        (SPROG
         ((#1=#:G860 NIL) (|c1| NIL) (#2=#:G855 NIL) (|s| (|String|))
          (#3=#:G859 NIL) (|allString| #4=(|Boolean|)) (#5=#:G858 NIL)
          (|b| (|List| (|Boolean|))) (#6=#:G857 NIL) (#7=#:G856 NIL)
          (|enableGrid| (|Boolean|)) (|c| (|List| (|Tree| (|String|))))
          (|tagName| (|String|)) (|tagPos| (|Integer|)) (|endWithPlus| #4#))
         (SEQ
          (EXIT
           (SEQ (LETT |endWithPlus| NIL . #8=(|HTMLFORM;outputTree|))
                (COND
                 ((SPADCALL |t| (QREFELT $ 37))
                  (PROGN
                   (LETT #2# (SPADCALL (QREFELT $ 30)) . #8#)
                   (GO #9=#:G854))))
                (COND
                 ((SPADCALL |t| (QREFELT $ 38))
                  (SEQ (|sayHtml| (SPADCALL |t| (QREFELT $ 39)))
                       (EXIT
                        (PROGN
                         (LETT #2# (SPADCALL (QREFELT $ 30)) . #8#)
                         (GO #9#))))))
                (LETT |tagName| (COPY-SEQ (SPADCALL |t| (QREFELT $ 39))) . #8#)
                (LETT |tagPos|
                      (SPADCALL (|STR_to_CHAR| " ") |tagName| 1 (QREFELT $ 53))
                      . #8#)
                (COND
                 ((SPADCALL |tagPos| 1 (QREFELT $ 49))
                  (LETT |tagName|
                        (SPADCALL
                         (SPADCALL |tagName| (|STR_to_CHAR| " ")
                                   (QREFELT $ 54))
                         1 (QREFELT $ 56))
                        . #8#)))
                (COND
                 ((SPADCALL (SPADCALL |t| (QREFELT $ 39)) "" (QREFELT $ 57))
                  (|sayHtml|
                   (SPADCALL (LIST "<" (SPADCALL |t| (QREFELT $ 39)) ">")
                             (QREFELT $ 43)))))
                (LETT |c| (SPADCALL |t| (QREFELT $ 41)) . #8#)
                (LETT |enableGrid|
                      (COND
                       ((SPADCALL (LENGTH |c|) 1 (QREFELT $ 49))
                        (NULL (|HTMLFORM;notTable?| |t| $)))
                       ('T NIL))
                      . #8#)
                (COND
                 (|enableGrid|
                  (SEQ
                   (COND
                    ((EQUAL |tagName| "table") (LETT |enableGrid| NIL . #8#)))
                   (EXIT
                    (COND
                     ((EQUAL |tagName| "tr")
                      (LETT |enableGrid| NIL . #8#)))))))
                (LETT |b|
                      (PROGN
                       (LETT #7# NIL . #8#)
                       (SEQ (LETT |c1| NIL . #8#) (LETT #6# |c| . #8#) G190
                            (COND
                             ((OR (ATOM #6#)
                                  (PROGN (LETT |c1| (CAR #6#) . #8#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #7#
                                    (CONS (SPADCALL |c1| (QREFELT $ 38)) #7#)
                                    . #8#)))
                            (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                            (EXIT (NREVERSE #7#))))
                      . #8#)
                (LETT |allString| 'T . #8#)
                (SEQ (LETT |c1| NIL . #8#) (LETT #5# |c| . #8#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |c1| (CAR #5#) . #8#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((NULL (SPADCALL |c1| (QREFELT $ 38)))
                         (LETT |allString| NIL . #8#)))))
                     (LETT #5# (CDR #5#) . #8#) (GO G190) G191 (EXIT NIL))
                (COND
                 (|allString|
                  (SEQ (LETT |s| "" . #8#)
                       (SEQ (LETT |c1| NIL . #8#) (LETT #3# |c| . #8#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |c1| (CAR #3#) . #8#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |s|
                                    (STRCONC |s|
                                             (SPADCALL |c1| (QREFELT $ 39)))
                                    . #8#)))
                            (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                            (EXIT NIL))
                       (|sayHtml| |s|)
                       (COND
                        ((SPADCALL (SPADCALL |t| (QREFELT $ 39)) ""
                                   (QREFELT $ 57))
                         (|sayHtml|
                          (SPADCALL (LIST "</" |tagName| ">")
                                    (QREFELT $ 43)))))
                       (EXIT
                        (PROGN
                         (LETT #2# (SPADCALL (QREFELT $ 30)) . #8#)
                         (GO #9#))))))
                (COND
                 (|enableGrid|
                  (SEQ (|sayHtml| "<table border='0'>")
                       (EXIT (|sayHtml| "<tr>")))))
                (SEQ (LETT |c1| NIL . #8#) (LETT #1# |c| . #8#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |c1| (CAR #1#) . #8#) NIL))
                       (GO G191)))
                     (SEQ (COND (|enableGrid| (|sayHtml| "<td>")))
                          (|HTMLFORM;outputTree| |c1| $)
                          (EXIT (COND (|enableGrid| (|sayHtml| "</td>")))))
                     (LETT #1# (CDR #1#) . #8#) (GO G190) G191 (EXIT NIL))
                (COND
                 (|enableGrid|
                  (SEQ (|sayHtml| "</tr>") (EXIT (|sayHtml| "</table>")))))
                (COND
                 ((SPADCALL (SPADCALL |t| (QREFELT $ 39)) "" (QREFELT $ 57))
                  (|sayHtml|
                   (SPADCALL (LIST "</" |tagName| ">") (QREFELT $ 43)))))
                (EXIT (SPADCALL (QREFELT $ 30)))))
          #9# (EXIT #2#)))) 

(PUT '|HTMLFORM;stringify| '|SPADreplace| '|mathObject2String|) 

(SDEFUN |HTMLFORM;stringify| ((|expr| |OutputForm|) ($ |String|))
        (|mathObject2String| |expr|)) 

(SDEFUN |HTMLFORM;formatSC|
        ((|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |Tree| (|String|)))
        (SPROG
         ((|row| (|Tree| (|String|))) (|cells| (|List| (|Tree| (|String|))))
          (#1=#:G867 NIL) (|a| NIL) (#2=#:G866 NIL))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatSC: "
                       (SPADCALL
                        (LIST " args=" (|HTMLFORM;argsToString| |args| $)
                              " prec=" (STRINGIMAGE |prec|))
                        (QREFELT $ 43))
                       (QREFELT $ 58)))))
          (EXIT
           (COND ((NULL |args|) (SPADCALL "" (QREFELT $ 59)))
                 ('T
                  (SEQ
                   (LETT |cells|
                         (PROGN
                          (LETT #2# NIL . #3=(|HTMLFORM;formatSC|))
                          (SEQ (LETT |a| NIL . #3#) (LETT #1# |args| . #3#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (|HTMLFORM;newNode|
                                         "td id='sc' style='border-bottom-style:solid'"
                                         (|HTMLFORM;formatHtml| |a| |prec| $)
                                         $)
                                        #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         . #3#)
                   (LETT |row| (|HTMLFORM;newNodes| "tr id='sc'" |cells| $)
                         . #3#)
                   (EXIT
                    (|HTMLFORM;newNode| "table border='0' id='sc'" |row|
                     $))))))))) 

(SDEFUN |HTMLFORM;buildOverbar|
        ((|content| |Tree| (|String|)) ($ |Tree| (|String|)))
        (SPROG ((|row| #1=(|Tree| (|String|))) (|cell| #1#))
               (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildOverbar")))
                    (LETT |cell|
                          (|HTMLFORM;newNode|
                           "td id='overbar' style='border-top-style:solid'"
                           |content| $)
                          . #2=(|HTMLFORM;buildOverbar|))
                    (LETT |row| (|HTMLFORM;newNode| "tr id='overbar'" |cell| $)
                          . #2#)
                    (EXIT
                     (|HTMLFORM;newNode| "table border='0' id='overbar'" |row|
                      $))))) 

(SDEFUN |HTMLFORM;buildRoot|
        ((|content| |Tree| (|String|)) ($ |Tree| (|String|)))
        (SPROG
         ((|row| (|Tree| (|String|))) (|cell2| #1=(|Tree| (|String|)))
          (|cell1| #1#) (#2=#:G873 NIL))
         (SEQ
          (EXIT
           (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildRoot")))
                (COND
                 ((SPADCALL |content| (QREFELT $ 38))
                  (PROGN
                   (LETT #2#
                         (|HTMLFORM;newNodes| ""
                          (LIST (SPADCALL "&radic;" (QREFELT $ 59)) |content|)
                          $)
                         . #3=(|HTMLFORM;buildRoot|))
                   (GO #4=#:G872))))
                (LETT |cell1|
                      (|HTMLFORM;newNode| "td id='root'"
                       (SPADCALL "&radic;" (QREFELT $ 59)) $)
                      . #3#)
                (LETT |cell2|
                      (|HTMLFORM;newNode|
                       "td id='root' style='border-top-style:solid'" |content|
                       $)
                      . #3#)
                (LETT |row|
                      (|HTMLFORM;newNodes| "tr id='root'"
                       (LIST |cell1| |cell2|) $)
                      . #3#)
                (EXIT
                 (|HTMLFORM;newNode| "table border='0' id='root'" |row| $))))
          #4# (EXIT #2#)))) 

(SDEFUN |HTMLFORM;buildNRoot|
        ((|content| |Tree| (|String|)) (|nth| |Tree| (|String|))
         ($ |Tree| (|String|)))
        (SPROG
         ((|row| #1=(|Tree| (|String|))) (|cell2| #2=(|Tree| (|String|)))
          (|cell1| #1#) (#3=#:G877 NIL) (|power| #2#))
         (SEQ
          (EXIT
           (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildNRoot")))
                (LETT |power| (|HTMLFORM;newNode| "sup" |nth| $)
                      . #4=(|HTMLFORM;buildNRoot|))
                (COND
                 ((SPADCALL |content| (QREFELT $ 38))
                  (PROGN
                   (LETT #3#
                         (|HTMLFORM;newNodes| ""
                          (LIST |power| (SPADCALL "&radic;" (QREFELT $ 59))
                                |content|)
                          $)
                         . #4#)
                   (GO #5=#:G876))))
                (LETT |cell1|
                      (|HTMLFORM;newNodes| "td id='nroot'"
                       (LIST |power| (SPADCALL "&radic;" (QREFELT $ 59))) $)
                      . #4#)
                (LETT |cell2|
                      (|HTMLFORM;newNode|
                       "td id='nroot' style='border-top-style:solid'" |content|
                       $)
                      . #4#)
                (LETT |row|
                      (|HTMLFORM;newNodes| "tr id='nroot'"
                       (LIST |cell1| |cell2|) $)
                      . #4#)
                (EXIT
                 (|HTMLFORM;newNode| "table border='0' id='nroot'" |row| $))))
          #5# (EXIT #3#)))) 

(SDEFUN |HTMLFORM;formatSpecial|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |Tree| (|String|)))
        (SPROG
         ((|tmp| (|Tree| (|String|))) (#1=#:G913 NIL) (|u| NIL) (#2=#:G912 NIL)
          (|prescript| (|Boolean|)))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL
              (LIST "formatSpecial: " "op=" (SPADCALL |op| (QREFELT $ 61))
                    " args=" (|HTMLFORM;argsToString| |args| $) " prec="
                    (STRINGIMAGE |prec|))
              (QREFELT $ 43)))))
          (LETT |prescript| NIL . #3=(|HTMLFORM;formatSpecial|))
          (EXIT
           (COND
            ((EQUAL |op| '|theMap|) (SPADCALL "theMap(...)" (QREFELT $ 59)))
            ((EQUAL |op| 'AGGLST) (|HTMLFORM;formatNary| "," |args| |prec| $))
            ((EQUAL |op| 'AGGSET) (|HTMLFORM;formatNary| ";" |args| |prec| $))
            ((EQUAL |op| 'TAG)
             (|HTMLFORM;newNodes| ""
              (LIST (|HTMLFORM;formatHtml| (|SPADfirst| |args|) |prec| $)
                    (SPADCALL "&#x02192;" (QREFELT $ 59))
                    (|HTMLFORM;formatHtml| (SPADCALL |args| (QREFELT $ 62))
                     |prec| $))
              $))
            ((EQUAL |op| 'SLASH)
             (|HTMLFORM;newNodes| ""
              (LIST (|HTMLFORM;formatHtml| (|SPADfirst| |args|) |prec| $)
                    (SPADCALL "/" (QREFELT $ 59))
                    (|HTMLFORM;formatHtml| (SPADCALL |args| (QREFELT $ 62))
                     |prec| $))
              $))
            ((EQUAL |op| 'VCONCAT)
             (|HTMLFORM;newNodes| "table"
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |u| NIL . #3#) (LETT #1# |args| . #3#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (|HTMLFORM;newNode| "td"
                              (|HTMLFORM;formatHtml| |u| (QREFELT $ 8) $) $)
                             #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))
              $))
            ((EQUAL |op| 'CONCATB) (|HTMLFORM;formatNary| " " |args| |prec| $))
            ((EQUAL |op| 'CONCAT)
             (|HTMLFORM;formatNary| "" |args| (QREFELT $ 8) $))
            ((EQUAL |op| 'QUOTE)
             (|HTMLFORM;newNodes| ""
              (LIST (SPADCALL "'" (QREFELT $ 59))
                    (|HTMLFORM;formatHtml| (|SPADfirst| |args|) (QREFELT $ 8)
                     $))
              $))
            ((EQUAL |op| 'BRACKET)
             (|HTMLFORM;newNodes| ""
              (LIST (SPADCALL "[" (QREFELT $ 59))
                    (|HTMLFORM;formatHtml| (|SPADfirst| |args|) (QREFELT $ 8)
                     $)
                    (SPADCALL "]" (QREFELT $ 59)))
              $))
            ((EQUAL |op| 'BRACE)
             (|HTMLFORM;newNodes| ""
              (LIST (SPADCALL "{" (QREFELT $ 59))
                    (|HTMLFORM;formatHtml| (|SPADfirst| |args|) (QREFELT $ 8)
                     $)
                    (SPADCALL "}" (QREFELT $ 59)))
              $))
            ((EQUAL |op| 'PAREN)
             (|HTMLFORM;newNodes| ""
              (LIST (SPADCALL "(" (QREFELT $ 59))
                    (|HTMLFORM;formatHtml| (|SPADfirst| |args|) (QREFELT $ 8)
                     $)
                    (SPADCALL ")" (QREFELT $ 59)))
              $))
            ((EQUAL |op| 'OVERBAR)
             (COND ((NULL |args|) (SPADCALL "" (QREFELT $ 59)))
                   (#4='T
                    (|HTMLFORM;buildOverbar|
                     (|HTMLFORM;formatHtml| (|SPADfirst| |args|) (QREFELT $ 8)
                      $)
                     $))))
            (#4#
             (SEQ
              (COND
               ((EQUAL |op| 'ROOT)
                (COND
                 ((< (LENGTH |args|) 1) (EXIT (SPADCALL "" (QREFELT $ 59)))))))
              (COND
               ((EQUAL |op| 'ROOT)
                (COND
                 ((EQL (LENGTH |args|) 1)
                  (EXIT
                   (|HTMLFORM;buildRoot|
                    (|HTMLFORM;formatHtml| (|SPADfirst| |args|) (QREFELT $ 8)
                     $)
                    $))))))
              (COND
               ((EQUAL |op| 'ROOT)
                (COND
                 ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 49))
                  (EXIT
                   (|HTMLFORM;buildNRoot|
                    (|HTMLFORM;formatHtml| (|SPADfirst| |args|) (QREFELT $ 8)
                     $)
                    (|HTMLFORM;formatHtml| (SPADCALL |args| (QREFELT $ 62))
                     (QREFELT $ 8) $)
                    $))))))
              (EXIT
               (COND
                ((EQUAL |op| 'SEGMENT)
                 (SEQ
                  (LETT |tmp|
                        (|HTMLFORM;newNodes| ""
                         (LIST
                          (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                           (QREFELT $ 8) $)
                          (SPADCALL ".." (QREFELT $ 59)))
                         $)
                        . #3#)
                  (EXIT
                   (COND ((NULL (CDR |args|)) |tmp|)
                         (#4#
                          (|HTMLFORM;newNodes| ""
                           (LIST |tmp|
                                 (|HTMLFORM;formatHtml|
                                  (|SPADfirst| (CDR |args|)) (QREFELT $ 8) $))
                           $))))))
                ((EQUAL |op| 'SC) (|HTMLFORM;formatSC| |args| (QREFELT $ 8) $))
                ((EQUAL |op| 'MATRIX) (|HTMLFORM;formatMatrix| (CDR |args|) $))
                ((EQUAL |op| 'ZAG)
                 (|HTMLFORM;newNodes| ""
                  (LIST (SPADCALL " \\zag{" (QREFELT $ 59))
                        (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                         (QREFELT $ 8) $)
                        (SPADCALL "}{" (QREFELT $ 59))
                        (|HTMLFORM;formatHtml| (|SPADfirst| (CDR |args|))
                         (QREFELT $ 8) $)
                        (SPADCALL "}" (QREFELT $ 59)))
                  $))
                (#4#
                 (SPADCALL
                  (SPADCALL "formatSpecial not implemented: "
                            (SPADCALL |op| (QREFELT $ 61)) (QREFELT $ 58))
                  (QREFELT $ 59)))))))))))) 

(SDEFUN |HTMLFORM;formatSuperSub|
        ((|expr| |OutputForm|) (|args| |List| (|OutputForm|))
         (|opPrec| |Integer|) ($ |Tree| (|String|)))
        (SPROG
         ((|res| (|Tree| (|String|))) (|commaTest| (|String|))
          (|ndiffs| (|Integer|)) (|commaS| #1=(|String|)) (|bvarS| #1#)
          (|funcS| #1#) (|var| (|OutputForm|)) (|op| #1#)
          (|atomE| (|List| (|OutputForm|))))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatSuperSub: "
                       (SPADCALL
                        (LIST "expr=" (|HTMLFORM;stringify| |expr| $) " args="
                              (|HTMLFORM;argsToString| |args| $) " prec="
                              (STRINGIMAGE |opPrec|))
                        (QREFELT $ 43))
                       (QREFELT $ 58)))))
          (LETT |atomE| (|HTMLFORM;atomize| |expr| $)
                . #2=(|HTMLFORM;formatSuperSub|))
          (LETT |op| (|HTMLFORM;stringify| (|SPADfirst| |atomE|) $) . #2#)
          (EXIT
           (COND
            ((SPADCALL |op| "SUPERSUB" (QREFELT $ 57))
             (SPADCALL "Mistake in formatSuperSub: no SUPERSUB"
                       (QREFELT $ 59)))
            ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 63))
             (SPADCALL "Mistake in SuperSub: #args <> 1" (QREFELT $ 59)))
            ('T
             (SEQ (LETT |var| (|SPADfirst| |args|) . #2#)
                  (LETT |funcS|
                        (|HTMLFORM;stringify| (|SPADfirst| (CDR |atomE|)) $)
                        . #2#)
                  (LETT |bvarS| (|HTMLFORM;stringify| (|SPADfirst| |args|) $)
                        . #2#)
                  (LETT |commaS|
                        (|HTMLFORM;stringify|
                         (|SPADfirst| (CDR (CDR (CDR |atomE|)))) $)
                        . #2#)
                  (LETT |commaTest| "," . #2#) (LETT |ndiffs| 0 . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL
                           (SPADCALL |commaTest| |commaS| 1 (QREFELT $ 64)) 0
                           (QREFELT $ 49)))
                         (GO G191)))
                       (SEQ (LETT |ndiffs| (+ |ndiffs| 1) . #2#)
                            (EXIT
                             (LETT |commaTest|
                                   (SPADCALL |commaTest| "," (QREFELT $ 58))
                                   . #2#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |res|
                        (|HTMLFORM;newNodes| ""
                         (LIST
                          (SPADCALL
                           (SPADCALL "&#x02146;"
                                     (SPADCALL (STRINGIMAGE |ndiffs|)
                                               (SPADCALL ""
                                                         (SPADCALL |funcS|
                                                                   "&#x02146;"
                                                                   (QREFELT $
                                                                            58))
                                                         (QREFELT $ 58))
                                               (QREFELT $ 58))
                                     (QREFELT $ 58))
                           (QREFELT $ 59))
                          (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                           (QREFELT $ 8) $)
                          (SPADCALL
                           (SPADCALL ""
                                     (SPADCALL (STRINGIMAGE |ndiffs|)
                                               "&#x02061;" (QREFELT $ 58))
                                     (QREFELT $ 58))
                           (QREFELT $ 59))
                          (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                           (QREFELT $ 8) $)
                          (SPADCALL ")" (QREFELT $ 59)))
                         $)
                        . #2#)
                  (EXIT |res|)))))))) 

(SDEFUN |HTMLFORM;buildPlex3|
        ((|main| |Tree| (|String|)) (|supsc| |Tree| (|String|))
         (|op| |Tree| (|String|)) (|subsc| |Tree| (|String|))
         ($ |Tree| (|String|)))
        (SPROG
         ((|rows| (|List| #1=(|Tree| (|String|)))) (|m| #1#) (|ssub| #1#)
          (|sop| #1#) (|ssup| #1#))
         (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildPlex")))
              (LETT |ssup| (|HTMLFORM;newNode| "td id='plex'" |supsc| $)
                    . #2=(|HTMLFORM;buildPlex3|))
              (LETT |sop| (|HTMLFORM;newNode| "td id='plex'" |op| $) . #2#)
              (LETT |ssub| (|HTMLFORM;newNode| "td id='plex'" |subsc| $) . #2#)
              (LETT |m|
                    (|HTMLFORM;newNode| "td rowspan='3' id='plex'" |main| $)
                    . #2#)
              (LETT |rows|
                    (LIST
                     (|HTMLFORM;newNodes| "tr id='plex'" (LIST |ssup| |m|) $)
                     (|HTMLFORM;newNode| "tr id='plex'" |sop| $)
                     (|HTMLFORM;newNode| "tr id='plex'" |ssub| $))
                    . #2#)
              (EXIT
               (|HTMLFORM;newNodes| "table border='0' id='plex'" |rows| $))))) 

(SDEFUN |HTMLFORM;buildPlex2|
        ((|main| |Tree| (|String|)) (|supsc| |Tree| (|String|))
         (|op| |Tree| (|String|)) ($ |Tree| (|String|)))
        (SPROG
         ((|rows| (|List| #1=(|Tree| (|String|)))) (|m| #1#) (|sop| #1#)
          (|ssup| #1#))
         (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildPlex")))
              (LETT |ssup| (|HTMLFORM;newNode| "td id='plex'" |supsc| $)
                    . #2=(|HTMLFORM;buildPlex2|))
              (LETT |sop| (|HTMLFORM;newNode| "td id='plex'" |op| $) . #2#)
              (LETT |m|
                    (|HTMLFORM;newNode| "td rowspan='2' id='plex'" |main| $)
                    . #2#)
              (LETT |rows|
                    (LIST
                     (|HTMLFORM;newNodes| "tr id='plex'" (LIST |sop| |m|) $)
                     (|HTMLFORM;newNode| "tr id='plex'" |ssup| $))
                    . #2#)
              (EXIT
               (|HTMLFORM;newNodes| "table border='0' id='plex'" |rows| $))))) 

(SDEFUN |HTMLFORM;formatIntSign|
        ((|args| |List| (|OutputForm|)) (|opPrec| |Integer|)
         ($ |Tree| (|String|)))
        (SEQ
         (COND
          ((QREFELT $ 21)
           (|sayHtml|
            (SPADCALL "formatIntSign: "
                      (SPADCALL
                       (LIST " args=" (|HTMLFORM;argsToString| |args| $)
                             " prec=" (STRINGIMAGE |opPrec|))
                       (QREFELT $ 43))
                      (QREFELT $ 58)))))
         (EXIT
          (COND
           ((EQUAL (|HTMLFORM;stringify| (|SPADfirst| |args|) $) "NOTHING")
            (|HTMLFORM;buildPlex2|
             (|HTMLFORM;formatHtml| (SPADCALL |args| 3 (QREFELT $ 65)) |opPrec|
              $)
             (SPADCALL "&int;" (QREFELT $ 59))
             (|HTMLFORM;formatHtml| (SPADCALL |args| 2 (QREFELT $ 65)) |opPrec|
              $)
             $))
           ('T
            (|HTMLFORM;buildPlex3|
             (|HTMLFORM;formatHtml| (|SPADfirst| |args|) |opPrec| $)
             (|HTMLFORM;formatHtml| (SPADCALL |args| 3 (QREFELT $ 65)) |opPrec|
              $)
             (SPADCALL "&int;" (QREFELT $ 59))
             (|HTMLFORM;formatHtml| (SPADCALL |args| 2 (QREFELT $ 65)) |opPrec|
              $)
             $)))))) 

(SDEFUN |HTMLFORM;formatPlex|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |Tree| (|String|)))
        (SPROG
         ((#1=#:G941 NIL) (|s| (|Tree| (|String|))) (|checkarg| (|Boolean|))
          (|n| (|Integer|)) (|opPrec| (|Integer|)) (|p| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((QREFELT $ 21)
              (|sayHtml|
               (SPADCALL "formatPlex: "
                         (SPADCALL
                          (LIST "op=" (SPADCALL |op| (QREFELT $ 61)) " args="
                                (|HTMLFORM;argsToString| |args| $) " prec="
                                (STRINGIMAGE |prec|))
                          (QREFELT $ 43))
                         (QREFELT $ 58)))))
            (LETT |checkarg| NIL . #2=(|HTMLFORM;formatPlex|))
            (LETT |p| (SPADCALL |op| (QREFELT $ 16) (QREFELT $ 67)) . #2#)
            (EXIT
             (COND ((< |p| 1) (|error| "unknown plex op"))
                   ((EQUAL |op| 'INTSIGN)
                    (|HTMLFORM;formatIntSign| |args| (QREFELT $ 8) $))
                   (#3='T
                    (SEQ
                     (LETT |opPrec|
                           (SPADCALL (QREFELT $ 17) |p| (QREFELT $ 69)) . #2#)
                     (LETT |n| (LENGTH |args|) . #2#)
                     (COND
                      ((SPADCALL |n| 2 (QREFELT $ 63))
                       (COND
                        ((SPADCALL |n| 3 (QREFELT $ 63))
                         (EXIT
                          (|error| "wrong number of arguments for plex"))))))
                     (LETT |s|
                           (COND
                            ((OR (EQUAL |op| 'SIGMA) (EQUAL |op| 'SIGMA2))
                             (SEQ (LETT |checkarg| 'T . #2#)
                                  (EXIT
                                   (SPADCALL "&#x02211;" (QREFELT $ 59)))))
                            ((OR (EQUAL |op| 'PI) (EQUAL |op| 'PI2))
                             (SEQ (LETT |checkarg| 'T . #2#)
                                  (EXIT
                                   (SPADCALL "&#x0220F;" (QREFELT $ 59)))))
                            ((EQUAL |op| 'INTSIGN)
                             (SPADCALL "&#x0222B;" (QREFELT $ 59)))
                            (#3#
                             (SPADCALL
                              (SPADCALL "formatPlex: unexpected op:"
                                        (SPADCALL |op| (QREFELT $ 61))
                                        (QREFELT $ 58))
                              (QREFELT $ 59))))
                           . #2#)
                     (COND
                      ((EQL |n| 2)
                       (PROGN
                        (LETT #1#
                              (|HTMLFORM;buildPlex2|
                               (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                                (QREFELT $ 8) $)
                               (|HTMLFORM;formatHtml|
                                (SPADCALL |args| 2 (QREFELT $ 65))
                                (QREFELT $ 8) $)
                               |s| $)
                              . #2#)
                        (GO #4=#:G940))))
                     (EXIT
                      (|HTMLFORM;buildPlex3|
                       (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                        (QREFELT $ 8) $)
                       (|HTMLFORM;formatHtml|
                        (SPADCALL |args| 2 (QREFELT $ 65)) (QREFELT $ 8) $)
                       |s|
                       (|HTMLFORM;formatHtml|
                        (SPADCALL |args| 3 (QREFELT $ 65)) (QREFELT $ 8) $)
                       $))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |HTMLFORM;formatMatrixRow|
        ((|op| |String|) (|arg| |OutputForm|) (|prec| |Integer|)
         (|y| |Integer|) (|h| |Integer|) ($ |List| (|Tree| (|String|))))
        (SPROG
         ((|cells| (|List| (|Tree| (|String|)))) (|attrib| (|String|))
          (#1=#:G947 NIL) (|x| NIL) (|w| (|Integer|))
          (|args| (|List| (|OutputForm|))))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatMatrixRow: "
                       (SPADCALL
                        (LIST "op=" |op| " args="
                              (|HTMLFORM;stringify| |arg| $) " prec="
                              (STRINGIMAGE |prec|))
                        (QREFELT $ 43))
                       (QREFELT $ 58)))))
          (EXIT
           (COND
            ((SPADCALL |arg| (QREFELT $ 44))
             (LIST
              (SPADCALL "formatMatrixRow does not contain row"
                        (QREFELT $ 59))))
            ('T
             (SEQ
              (LETT |args| (SPADCALL |arg| (QREFELT $ 47))
                    . #2=(|HTMLFORM;formatMatrixRow|))
              (LETT |w| (LENGTH |args|) . #2#) (LETT |cells| NIL . #2#)
              (SEQ (LETT |x| 1 . #2#) (LETT #1# |w| . #2#) G190
                   (COND ((|greater_SI| |x| #1#) (GO G191)))
                   (SEQ (LETT |attrib| "td id='mat'" . #2#)
                        (COND
                         ((EQL |x| 1) (LETT |attrib| "td id='matl'" . #2#)))
                        (COND
                         ((EQL |x| |w|) (LETT |attrib| "td id='matr'" . #2#)))
                        (COND
                         ((EQL |y| 1) (LETT |attrib| "td id='matt'" . #2#)))
                        (COND
                         ((EQL |y| |h|) (LETT |attrib| "td id='matb'" . #2#)))
                        (COND
                         ((EQL |x| 1)
                          (COND
                           ((EQL |y| 1)
                            (LETT |attrib| "td id='matlt'" . #2#)))))
                        (COND
                         ((EQL |x| 1)
                          (COND
                           ((EQL |y| |h|)
                            (LETT |attrib| "td id='matlb'" . #2#)))))
                        (COND
                         ((EQL |x| |w|)
                          (COND
                           ((EQL |y| 1)
                            (LETT |attrib| "td id='matrt'" . #2#)))))
                        (COND
                         ((EQL |x| |w|)
                          (COND
                           ((EQL |y| |h|)
                            (LETT |attrib| "td id='matrb'" . #2#)))))
                        (EXIT
                         (LETT |cells|
                               (SPADCALL |cells|
                                         (LIST
                                          (|HTMLFORM;newNode| |attrib|
                                           (|HTMLFORM;formatHtml|
                                            (SPADCALL |args| |x|
                                                      (QREFELT $ 65))
                                            |prec| $)
                                           $))
                                         (QREFELT $ 71))
                               . #2#)))
                   (LETT |x| (|inc_SI| |x|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |cells|)))))))) 

(SDEFUN |HTMLFORM;formatMatrixContent|
        ((|op| |String|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |List| (|Tree| (|String|))))
        (SPROG
         ((|rows| (|List| (|Tree| (|String|)))) (|y| (|Integer|))
          (#1=#:G952 NIL) (|e| NIL) (#2=#:G951 NIL))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatMatrixContent: "
                       (SPADCALL
                        (LIST "op=" |op| " args="
                              (|HTMLFORM;argsToString| |args| $) " prec="
                              (STRINGIMAGE |prec|))
                        (QREFELT $ 43))
                       (QREFELT $ 58)))))
          (LETT |y| 0 . #3=(|HTMLFORM;formatMatrixContent|))
          (LETT |rows|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |e| NIL . #3#) (LETT #1# |args| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (|HTMLFORM;newNodes| "tr id='mat'"
                                (|HTMLFORM;formatMatrixRow| "ROW" |e| |prec|
                                 (LETT |y| (+ |y| 1) . #3#) (LENGTH |args|) $)
                                $)
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT |rows|)))) 

(SDEFUN |HTMLFORM;formatMatrix|
        ((|args| |List| (|OutputForm|)) ($ |Tree| (|String|)))
        (SEQ
         (COND
          ((QREFELT $ 21)
           (|sayHtml|
            (SPADCALL "formatMatrix: "
                      (SPADCALL
                       (LIST "args=" (|HTMLFORM;argsToString| |args| $))
                       (QREFELT $ 43))
                      (QREFELT $ 58)))))
         (EXIT
          (|HTMLFORM;newNodes| "table border='1' id='mat'"
           (|HTMLFORM;formatMatrixContent| "MATRIX" |args| (QREFELT $ 8) $)
           $)))) 

(SDEFUN |HTMLFORM;buildColumnTable|
        ((|elements| |List| (|Tree| (|String|))) ($ |Tree| (|String|)))
        (SPROG
         ((|rows| (|List| (|Tree| (|String|)))) (#1=#:G962 NIL) (|i| NIL)
          (#2=#:G961 NIL) (|cells| (|List| (|Tree| (|String|))))
          (#3=#:G960 NIL) (|j| NIL) (#4=#:G959 NIL))
         (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildColumnTable")))
              (LETT |cells|
                    (PROGN
                     (LETT #4# NIL . #5=(|HTMLFORM;buildColumnTable|))
                     (SEQ (LETT |j| NIL . #5#) (LETT #3# |elements| . #5#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |j| (CAR #3#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (|HTMLFORM;newNode| "td id='col'" |j| $)
                                   #4#)
                                  . #5#)))
                          (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #5#)
              (LETT |rows|
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |i| NIL . #5#) (LETT #1# |cells| . #5#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |i| (CAR #1#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (|HTMLFORM;newNode| "tr id='col'" |i| $)
                                   #2#)
                                  . #5#)))
                          (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #5#)
              (EXIT
               (|HTMLFORM;newNodes| "table border='0' id='col'" |rows| $))))) 

(SDEFUN |HTMLFORM;buildSuperscript|
        ((|main| |Tree| (|String|)) (|super| |Tree| (|String|))
         ($ |Tree| (|String|)))
        (SPROG
         ((|rows| (|List| #1=(|Tree| (|String|)))) (|e| #1#) (|su| #1#)
          (|m| #1#))
         (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildSuperscript")))
              (EXIT
               (COND
                ((|HTMLFORM;notTable?| |super| $)
                 (|HTMLFORM;newNodes| ""
                  (LIST |main| (|HTMLFORM;newNode| "sup" |super| $)) $))
                ('T
                 (SEQ
                  (LETT |m|
                        (|HTMLFORM;newNode| "td rowspan='2' id='sup'" |main| $)
                        . #2=(|HTMLFORM;buildSuperscript|))
                  (LETT |su| (|HTMLFORM;newNode| "td id='sup'" |super| $)
                        . #2#)
                  (LETT |e|
                        (|HTMLFORM;newNode| "td id='sup'"
                         (SPADCALL "&nbsp;" (QREFELT $ 59)) $)
                        . #2#)
                  (LETT |rows|
                        (LIST
                         (|HTMLFORM;newNodes| "tr id='sup'" (LIST |m| |su|) $)
                         (|HTMLFORM;newNode| "tr id='sup'" |e| $))
                        . #2#)
                  (EXIT
                   (|HTMLFORM;newNodes| "table border='0' id='sup'" |rows|
                    $))))))))) 

(SDEFUN |HTMLFORM;buildSubscript|
        ((|main| |Tree| (|String|)) (|subsc| |Tree| (|String|))
         ($ |Tree| (|String|)))
        (SPROG
         ((|rows| (|List| #1=(|Tree| (|String|)))) (|e| #1#) (|su| #1#)
          (|m| #1#))
         (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildSubscript")))
              (EXIT
               (COND
                ((|HTMLFORM;notTable?| |subsc| $)
                 (|HTMLFORM;newNodes| ""
                  (LIST |main| (|HTMLFORM;newNode| "sub" |subsc| $)) $))
                ('T
                 (SEQ
                  (LETT |m|
                        (|HTMLFORM;newNode| "td rowspan='2' id='sub'" |main| $)
                        . #2=(|HTMLFORM;buildSubscript|))
                  (LETT |su| (|HTMLFORM;newNode| "td id='sub'" |subsc| $)
                        . #2#)
                  (LETT |e|
                        (|HTMLFORM;newNode| "td id='sub'"
                         (SPADCALL "&nbsp;" (QREFELT $ 59)) $)
                        . #2#)
                  (LETT |rows|
                        (LIST
                         (|HTMLFORM;newNodes| "tr id='sub'" (LIST |m| |e|) $)
                         (|HTMLFORM;newNode| "tr id='sub'" |su| $))
                        . #2#)
                  (EXIT
                   (|HTMLFORM;newNodes| "table border='0' id='sub'" |rows|
                    $))))))))) 

(SDEFUN |HTMLFORM;formatSub|
        ((|expr| |OutputForm|) (|args| |List| (|OutputForm|))
         (|opPrec| |Integer|) ($ |Tree| (|String|)))
        (SPROG
         ((#1=#:G980 NIL) (#2=#:G982 NIL) (|e| NIL) (#3=#:G981 NIL)
          (|op| (|String|)) (|atomE| (|List| (|OutputForm|))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((QREFELT $ 21)
              (|sayHtml|
               (SPADCALL "formatSub: "
                         (SPADCALL
                          (LIST "expr=" (|HTMLFORM;stringify| |expr| $)
                                " args=" (|HTMLFORM;argsToString| |args| $)
                                " prec=" (STRINGIMAGE |opPrec|))
                          (QREFELT $ 43))
                         (QREFELT $ 58)))))
            (LETT |atomE| (|HTMLFORM;atomize| |expr| $)
                  . #4=(|HTMLFORM;formatSub|))
            (COND
             ((NULL |atomE|)
              (SEQ
               (COND ((QREFELT $ 21) (|sayHtml| "formatSub: expr = empty")))
               (EXIT
                (PROGN
                 (LETT #1# (SPADCALL "formatSub: expr = empty" (QREFELT $ 59))
                       . #4#)
                 (GO #5=#:G979))))))
            (LETT |op| (|HTMLFORM;stringify| (|SPADfirst| |atomE|) $) . #4#)
            (EXIT
             (COND
              ((SPADCALL |op| "SUB" (QREFELT $ 57))
               (SEQ (COND ((QREFELT $ 21) (|sayHtml| "formatSub: expr~=SUB")))
                    (EXIT (SPADCALL "formatSub: expr~=SUB" (QREFELT $ 59)))))
              ('T
               (SEQ
                (COND
                 ((< (LENGTH |args|) 2)
                  (SEQ
                   (COND
                    ((QREFELT $ 21)
                     (|sayHtml|
                      (STRCONC "formatSub: num args="
                               (STRINGIMAGE (LENGTH |args|))))))
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (STRCONC "formatSub: num args="
                                     (STRINGIMAGE (LENGTH |args|)))
                            (QREFELT $ 59))
                           . #4#)
                     (GO #5#))))))
                (COND
                 ((SPADCALL (LENGTH |args|) 2 (QREFELT $ 49))
                  (SEQ
                   (COND
                    ((QREFELT $ 21)
                     (|sayHtml|
                      (STRCONC "formatSub: num args="
                               (STRINGIMAGE (LENGTH |args|))))))
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (|HTMLFORM;buildSubscript|
                            (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                             |opPrec| $)
                            (|HTMLFORM;newNodes| ""
                             (PROGN
                              (LETT #3# NIL . #4#)
                              (SEQ (LETT |e| NIL . #4#)
                                   (LETT #2# (CDR |args|) . #4#) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN
                                          (LETT |e| (CAR #2#) . #4#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #3#
                                           (CONS
                                            (|HTMLFORM;formatHtml| |e| |opPrec|
                                             $)
                                            #3#)
                                           . #4#)))
                                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                   (EXIT (NREVERSE #3#))))
                             $)
                            $)
                           . #4#)
                     (GO #5#))))))
                (EXIT
                 (|HTMLFORM;buildSubscript|
                  (|HTMLFORM;formatHtml| (|SPADfirst| |args|) |opPrec| $)
                  (|HTMLFORM;formatHtml| (SPADCALL |args| 2 (QREFELT $ 65))
                   |opPrec| $)
                  $))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |HTMLFORM;formatFunction|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |Tree| (|String|)))
        (SPROG ((|op1| (|Tree| (|String|))))
               (SEQ
                (LETT |op1| (|HTMLFORM;formatHtml| |op| (QREFELT $ 8) $)
                      |HTMLFORM;formatFunction|)
                (COND
                 ((QREFELT $ 21)
                  (|sayHtml|
                   (SPADCALL "formatFunction: "
                             (SPADCALL
                              (LIST "args=" (|HTMLFORM;argsToString| |args| $)
                                    " prec=" (STRINGIMAGE |prec|))
                              (QREFELT $ 43))
                             (QREFELT $ 58)))))
                (EXIT
                 (|HTMLFORM;newNodes| ""
                  (LIST |op1| (SPADCALL "(" (QREFELT $ 59))
                        (|HTMLFORM;formatNary| "," |args| (QREFELT $ 8) $)
                        (SPADCALL ")" (QREFELT $ 59)))
                  $))))) 

(SDEFUN |HTMLFORM;formatNullary| ((|op| |Symbol|) ($ |Tree| (|String|)))
        (SPROG ((|res| (|String|)))
               (SEQ
                (LETT |res|
                      (SPADCALL (SPADCALL |op| (QREFELT $ 61)) "()"
                                (QREFELT $ 58))
                      |HTMLFORM;formatNullary|)
                (COND
                 ((QREFELT $ 21)
                  (|sayHtml| (STRCONC "formatNullary: op=" |res|))))
                (EXIT
                 (COND ((EQUAL |op| 'NOTHING) (SPADCALL (QREFELT $ 72)))
                       ('T (SPADCALL |res| (QREFELT $ 59)))))))) 

(SDEFUN |HTMLFORM;formatUnary|
        ((|op| |Symbol|) (|arg| |OutputForm|) (|prec| |Integer|)
         ($ |Tree| (|String|)))
        (SPROG
         ((|s| (|Tree| (|String|))) (|opPrec| (|Integer|)) (|p| (|Integer|)))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatUnary: "
                       (SPADCALL
                        (LIST "op=" (SPADCALL |op| (QREFELT $ 61)) " arg="
                              (|HTMLFORM;stringify| |arg| $) " prec="
                              (STRINGIMAGE |prec|))
                        (QREFELT $ 43))
                       (QREFELT $ 58)))))
          (LETT |p| (SPADCALL |op| (QREFELT $ 9) (QREFELT $ 67))
                . #1=(|HTMLFORM;formatUnary|))
          (EXIT
           (COND ((< |p| 1) (|error| "unknown unary op"))
                 (#2='T
                  (SEQ
                   (LETT |opPrec| (SPADCALL (QREFELT $ 10) |p| (QREFELT $ 69))
                         . #1#)
                   (LETT |s|
                         (|HTMLFORM;newNodes| ""
                          (LIST
                           (SPADCALL (SPADCALL |op| (QREFELT $ 61))
                                     (QREFELT $ 59))
                           (|HTMLFORM;formatHtml| |arg| |opPrec| $))
                          $)
                         . #1#)
                   (EXIT
                    (COND
                     ((< |opPrec| |prec|)
                      (|HTMLFORM;newNodes| ""
                       (LIST (SPADCALL "(" (QREFELT $ 59)) |s|
                             (SPADCALL ")" (QREFELT $ 59)))
                       $))
                     (#2# |s|)))))))))) 

(SDEFUN |HTMLFORM;buildOver|
        ((|top| |Tree| (|String|)) (|bottom| |Tree| (|String|))
         ($ |Tree| (|String|)))
        (SPROG
         ((|rows| (|List| #1=(|Tree| (|String|)))) (|bottomCell| #1#)
          (|topCell| #1#))
         (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildOver")))
              (LETT |topCell| (|HTMLFORM;newNode| "td" |top| $)
                    . #2=(|HTMLFORM;buildOver|))
              (LETT |bottomCell|
                    (|HTMLFORM;newNode| "td style='border-top-style:solid'"
                     |bottom| $)
                    . #2#)
              (LETT |rows|
                    (LIST (|HTMLFORM;newNode| "tr id='col'" |topCell| $)
                          (|HTMLFORM;newNode| "tr id='col'" |bottomCell| $))
                    . #2#)
              (EXIT
               (|HTMLFORM;newNodes| "table border='0' id='col'" |rows| $))))) 

(SDEFUN |HTMLFORM;formatBinary|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |Tree| (|String|)))
        (SPROG
         ((|aux| (|Tree| (|String|))) (|s2| #1=(|Tree| (|String|))) (|s1| #1#)
          (|opPrec| (|Integer|)) (|p| (|Integer|)))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatBinary: "
                       (SPADCALL
                        (LIST "op=" (SPADCALL |op| (QREFELT $ 61)) " args="
                              (|HTMLFORM;argsToString| |args| $) " prec="
                              (STRINGIMAGE |prec|))
                        (QREFELT $ 43))
                       (QREFELT $ 58)))))
          (LETT |p| (SPADCALL |op| (QREFELT $ 11) (QREFELT $ 67))
                . #2=(|HTMLFORM;formatBinary|))
          (EXIT
           (COND ((< |p| 1) (|error| "unknown binary op"))
                 (#3='T
                  (SEQ
                   (LETT |opPrec| (SPADCALL (QREFELT $ 12) |p| (QREFELT $ 69))
                         . #2#)
                   (LETT |s1|
                         (|HTMLFORM;formatHtml| (|SPADfirst| |args|) |opPrec|
                          $)
                         . #2#)
                   (LETT |s2|
                         (|HTMLFORM;formatHtml| (|SPADfirst| (CDR |args|))
                          |opPrec| $)
                         . #2#)
                   (LETT |aux|
                         (COND
                          ((EQUAL |op| '|\||)
                           (|HTMLFORM;newNodes| ""
                            (LIST |s1|
                                  (SPADCALL (SPADCALL |op| (QREFELT $ 61))
                                            (QREFELT $ 59))
                                  |s2|)
                            $))
                          ((EQUAL |op| '^)
                           (|HTMLFORM;buildSuperscript| |s1| |s2| $))
                          ((EQUAL |op| '/)
                           (|HTMLFORM;newNodes| ""
                            (LIST |s1|
                                  (SPADCALL (SPADCALL |op| (QREFELT $ 61))
                                            (QREFELT $ 59))
                                  |s2|)
                            $))
                          ((EQUAL |op| 'OVER)
                           (|HTMLFORM;buildOver| |s1| |s2| $))
                          ((EQUAL |op| '+->)
                           (|HTMLFORM;newNodes| ""
                            (LIST |s1|
                                  (SPADCALL "|&mdash;&rsaquo;" (QREFELT $ 59))
                                  |s2|)
                            $))
                          (#3#
                           (|HTMLFORM;newNodes| ""
                            (LIST |s1|
                                  (SPADCALL (SPADCALL |op| (QREFELT $ 61))
                                            (QREFELT $ 59))
                                  |s2|)
                            $)))
                         . #2#)
                   (EXIT
                    (COND
                     ((OR (EQUAL |op| 'OVER) (NULL (< |opPrec| |prec|))) |aux|)
                     ('T
                      (|HTMLFORM;newNodes| ""
                       (LIST (SPADCALL "(" (QREFELT $ 59)) |aux|
                             (SPADCALL ")" (QREFELT $ 59)))
                       $))))))))))) 

(SDEFUN |HTMLFORM;buildZag|
        ((|top| |Tree| (|String|)) (|lowerLeft| |Tree| (|String|))
         (|lowerRight| |Tree| (|String|)) ($ |Tree| (|String|)))
        (SPROG
         ((|row2| #1=(|Tree| (|String|))) (|row1| #1#)
          (|cellLowerRight| #2=(|Tree| (|String|))) (|cellLowerLeft| #1#)
          (|cellTop| #2#))
         (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildZag")))
              (LETT |cellTop|
                    (|HTMLFORM;newNode|
                     "td colspan='2' id='zag' style='border-bottom-style:solid'"
                     |top| $)
                    . #3=(|HTMLFORM;buildZag|))
              (LETT |cellLowerLeft|
                    (|HTMLFORM;newNodes| "td id='zag'"
                     (LIST |lowerLeft| (SPADCALL "+" (QREFELT $ 59))) $)
                    . #3#)
              (LETT |cellLowerRight|
                    (|HTMLFORM;newNode| "td id='zag'" |lowerRight| $) . #3#)
              (LETT |row1|
                    (|HTMLFORM;newNodes| "tr id='zag'" (LIST |cellTop|) $)
                    . #3#)
              (LETT |row2|
                    (|HTMLFORM;newNodes| "tr id='zag'"
                     (LIST |cellLowerLeft| |cellLowerRight|) $)
                    . #3#)
              (EXIT
               (|HTMLFORM;newNodes| "table border='0' id='zag'"
                (LIST |row1| |row2|) $))))) 

(SDEFUN |HTMLFORM;formatZag|
        ((|args| |List| (|OutputForm|)) (|nestLevel| |Integer|)
         ($ |Tree| (|String|)))
        (SPROG ((|fontAttrib| (|String|)) (|tmpZag| (|List| (|OutputForm|))))
               (SEQ
                (COND
                 ((QREFELT $ 21)
                  (|sayHtml|
                   (SPADCALL "formatZag: "
                             (SPADCALL
                              (LIST "args=" (|HTMLFORM;argsToString| |args| $))
                              (QREFELT $ 43))
                             (QREFELT $ 58)))))
                (EXIT
                 (COND
                  ((SPADCALL (|SPADfirst| |args|) '|...| (QREFELT $ 73))
                   (SPADCALL "&#x2026;" (QREFELT $ 59)))
                  ((NULL (SPADCALL (|SPADfirst| |args|) 'ZAG (QREFELT $ 74)))
                   (SPADCALL
                    (SPADCALL
                     "formatZag: Last argument in ZAG construct unknown operator: "
                     (|HTMLFORM;stringify| (|SPADfirst| |args|) $)
                     (QREFELT $ 58))
                    (QREFELT $ 59)))
                  ('T
                   (SEQ
                    (LETT |tmpZag|
                          (SPADCALL (|SPADfirst| |args|) (QREFELT $ 47))
                          . #1=(|HTMLFORM;formatZag|))
                    (LETT |fontAttrib|
                          (COND
                           ((< |nestLevel| 2) "span style='font-size:16px'")
                           ((EQL |nestLevel| 2) "span style='font-size:14px'")
                           ((EQL |nestLevel| 3) "span style='font-size:12px'")
                           ((EQL |nestLevel| 4) "span style='font-size:10px'")
                           (#2='T "span style='font-size:9px'"))
                          . #1#)
                    (EXIT
                     (COND
                      ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 76))
                       (|HTMLFORM;newNode| |fontAttrib|
                        (|HTMLFORM;buildZag|
                         (|HTMLFORM;formatHtml| (|SPADfirst| |tmpZag|)
                          (QREFELT $ 8) $)
                         (|HTMLFORM;formatHtml| (|SPADfirst| (CDR |tmpZag|))
                          (QREFELT $ 8) $)
                         (|HTMLFORM;formatZag| (CDR |args|) (+ |nestLevel| 1)
                          $)
                         $)
                        $))
                      (#2#
                       (|HTMLFORM;newNode| |fontAttrib|
                        (|HTMLFORM;buildOver|
                         (|HTMLFORM;formatHtml| (|SPADfirst| |tmpZag|)
                          (QREFELT $ 8) $)
                         (|HTMLFORM;formatHtml| (|SPADfirst| (CDR |tmpZag|))
                          (QREFELT $ 8) $)
                         $)
                        $))))))))))) 

(SDEFUN |HTMLFORM;formatNary|
        ((|op| |String|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |Tree| (|String|)))
        (SEQ
         (COND
          ((QREFELT $ 21)
           (|sayHtml|
            (SPADCALL "formatNary: "
                      (SPADCALL
                       (LIST "op=" |op| " args="
                             (|HTMLFORM;argsToString| |args| $) " prec="
                             (STRINGIMAGE |prec|))
                       (QREFELT $ 43))
                      (QREFELT $ 58)))))
         (EXIT (|HTMLFORM;formatNaryNoGroup| |op| |args| |prec| $)))) 

(SDEFUN |HTMLFORM;formatNaryNoGroup|
        ((|op| |String|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |Tree| (|String|)))
        (SPROG
         ((|tags| (|List| (|Tree| (|String|)))) (#1=#:G1019 NIL) (|a| NIL)
          (|count| (|Integer|)) (|opPrec| (|Integer|))
          (|l| (|Tree| (|String|))) (|tmpS| (|String|)) (|p| (|Integer|))
          (|checkargs| (|Boolean|)))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatNaryNoGroup: "
                       (SPADCALL
                        (LIST "op=" |op| " args="
                              (|HTMLFORM;argsToString| |args| $) " prec="
                              (STRINGIMAGE |prec|))
                        (QREFELT $ 43))
                       (QREFELT $ 58)))))
          (LETT |checkargs| NIL . #2=(|HTMLFORM;formatNaryNoGroup|))
          (EXIT
           (COND ((NULL |args|) (SPADCALL (QREFELT $ 72)))
                 (#3='T
                  (SEQ
                   (LETT |p| (SPADCALL |op| (QREFELT $ 13) (QREFELT $ 77))
                         . #2#)
                   (EXIT
                    (COND ((< |p| 1) (|error| "unknown nary op"))
                          (#3#
                           (SEQ
                            (COND
                             ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 49))
                              (COND
                               ((SPADCALL
                                 (SPADCALL "ZAG"
                                           (|HTMLFORM;stringify|
                                            (|SPADfirst| (CDR |args|)) $)
                                           1 (QREFELT $ 64))
                                 0 (QREFELT $ 49))
                                (EXIT
                                 (SEQ
                                  (LETT |tmpS|
                                        (|HTMLFORM;stringify|
                                         (|SPADfirst| |args|) $)
                                        . #2#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL "ZAG" |tmpS| 1 (QREFELT $ 64))
                                      0 (QREFELT $ 49))
                                     (|HTMLFORM;formatZag| |args| 1 $))
                                    (#3#
                                     (|HTMLFORM;newNodes| ""
                                      (LIST
                                       (|HTMLFORM;formatHtml|
                                        (|SPADfirst| |args|) (QREFELT $ 8) $)
                                       (SPADCALL "+" (QREFELT $ 59))
                                       (|HTMLFORM;formatZag| (CDR |args|) 1 $))
                                      $))))))))))
                            (LETT |l| (SPADCALL (QREFELT $ 72)) . #2#)
                            (EXIT
                             (COND ((NULL |args|) |l|)
                                   (#3#
                                    (SEQ
                                     (LETT |opPrec|
                                           (SPADCALL (QREFELT $ 14) |p|
                                                     (QREFELT $ 69))
                                           . #2#)
                                     (LETT |count| 1 . #2#)
                                     (COND
                                      ((< |opPrec| |prec|)
                                       (LETT |tags|
                                             (LIST
                                              (SPADCALL "(" (QREFELT $ 59))
                                              (|HTMLFORM;formatHtml|
                                               (SPADCALL |args| 1
                                                         (QREFELT $ 65))
                                               |opPrec| $))
                                             . #2#)))
                                     (COND
                                      ((>= |opPrec| |prec|)
                                       (LETT |tags|
                                             (LIST
                                              (|HTMLFORM;formatHtml|
                                               (SPADCALL |args| 1
                                                         (QREFELT $ 65))
                                               |opPrec| $))
                                             . #2#)))
                                     (SEQ (LETT |a| NIL . #2#)
                                          (LETT #1# (CDR |args|) . #2#) G190
                                          (COND
                                           ((OR (ATOM #1#)
                                                (PROGN
                                                 (LETT |a| (CAR #1#) . #2#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (COND
                                            ((OR
                                              (SPADCALL |op| "+"
                                                        (QREFELT $ 57))
                                              (NULL
                                               (SPADCALL |a| '-
                                                         (QREFELT $ 74))))
                                             (LETT |tags|
                                                   (SPADCALL |tags|
                                                             (LIST
                                                              (SPADCALL |op|
                                                                        (QREFELT
                                                                         $
                                                                         59)))
                                                             (QREFELT $ 71))
                                                   . #2#)))
                                           (EXIT
                                            (LETT |tags|
                                                  (SPADCALL |tags|
                                                            (LIST
                                                             (|HTMLFORM;formatHtml|
                                                              |a| |opPrec| $))
                                                            (QREFELT $ 71))
                                                  . #2#)))
                                          (LETT #1# (CDR #1#) . #2#) (GO G190)
                                          G191 (EXIT NIL))
                                     (COND
                                      ((< |opPrec| |prec|)
                                       (LETT |tags|
                                             (SPADCALL |tags|
                                                       (LIST
                                                        (SPADCALL ")"
                                                                  (QREFELT $
                                                                           59)))
                                                       (QREFELT $ 71))
                                             . #2#)))
                                     (EXIT
                                      (|HTMLFORM;newNodes| "" |tags|
                                       $))))))))))))))))) 

(SDEFUN |HTMLFORM;formatHtml|
        ((|expr| |OutputForm|) (|prec| |Integer|) ($ |Tree| (|String|)))
        (SPROG
         ((|op| (|Symbol|)) (|nargs| (|Integer|))
          (|args| (|List| (|OutputForm|))) (|opf| (|OutputForm|))
          (|str| (|String|)) (#1=#:G1034 NIL) (|i| (|Integer|))
          (|intSplitLen| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((QREFELT $ 21)
              (|sayHtml|
               (SPADCALL "formatHtml: "
                         (SPADCALL
                          (LIST "arg="
                                (|HTMLFORM;argsToString| (LIST |expr|) $)
                                " prec=" (STRINGIMAGE |prec|))
                          (QREFELT $ 43))
                         (QREFELT $ 58)))))
            (LETT |intSplitLen| 20 . #2=(|HTMLFORM;formatHtml|))
            (EXIT
             (COND
              ((SPADCALL |expr| (QREFELT $ 44))
               (SEQ
                (COND
                 ((QREFELT $ 21)
                  (|sayHtml|
                   (SPADCALL "formatHtml atom: "
                             (SPADCALL
                              (LIST "expr=" (|HTMLFORM;stringify| |expr| $)
                                    " prec=" (STRINGIMAGE |prec|))
                              (QREFELT $ 43))
                             (QREFELT $ 58)))))
                (COND
                 ((SPADCALL |expr| (QREFELT $ 78))
                  (SEQ (LETT |op| (SPADCALL |expr| (QREFELT $ 79)) . #2#)
                       (LETT |i| (SPADCALL |op| (QREFELT $ 19) (QREFELT $ 67))
                             . #2#)
                       (EXIT
                        (COND
                         ((SPADCALL |i| 0 (QREFELT $ 49))
                          (PROGN
                           (LETT #1#
                                 (SPADCALL
                                  (SPADCALL (QREFELT $ 20) |i| (QREFELT $ 56))
                                  (QREFELT $ 59))
                                 . #2#)
                           (GO #3=#:G1033))))))))
                (LETT |str| (|HTMLFORM;stringify| |expr| $) . #2#)
                (EXIT (SPADCALL |str| (QREFELT $ 59)))))
              (#4='T
               (SEQ (LETT |opf| (SPADCALL |expr| (QREFELT $ 45)) . #2#)
                    (LETT |args| (SPADCALL |expr| (QREFELT $ 47)) . #2#)
                    (LETT |nargs| (LENGTH |args|) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |opf| (QREFELT $ 78))
                       (SEQ (LETT |op| (SPADCALL |opf| (QREFELT $ 79)) . #2#)
                            (EXIT
                             (COND
                              ((EQUAL |op| 'SUPERSUB)
                               (|HTMLFORM;formatSuperSub| |opf| |args|
                                (QREFELT $ 8) $))
                              ((EQUAL |op| 'SUB)
                               (|HTMLFORM;formatSub| |opf| |args| (QREFELT $ 8)
                                $))
                              ((SPADCALL |op| (QREFELT $ 18) (QREFELT $ 80))
                               (|HTMLFORM;formatSpecial| |op| |args| |prec| $))
                              ((SPADCALL |op| (QREFELT $ 16) (QREFELT $ 80))
                               (|HTMLFORM;formatPlex| |op| |args| |prec| $))
                              ((EQL 0 |nargs|)
                               (|HTMLFORM;formatNullary| |op| $))
                              (#4#
                               (SEQ
                                (COND
                                 ((EQL 1 |nargs|)
                                  (COND
                                   ((SPADCALL |op| (QREFELT $ 9)
                                              (QREFELT $ 80))
                                    (EXIT
                                     (|HTMLFORM;formatUnary| |op|
                                      (|SPADfirst| |args|) |prec| $))))))
                                (COND
                                 ((EQL 2 |nargs|)
                                  (COND
                                   ((SPADCALL |op| (QREFELT $ 11)
                                              (QREFELT $ 80))
                                    (EXIT
                                     (|HTMLFORM;formatBinary| |op| |args|
                                      |prec| $))))))
                                (EXIT
                                 (COND
                                  ((SPADCALL |op| (QREFELT $ 15)
                                             (QREFELT $ 80))
                                   (|HTMLFORM;formatNaryNoGroup|
                                    (SPADCALL |op| (QREFELT $ 61)) |args|
                                    |prec| $))
                                  ((SPADCALL (SPADCALL |op| (QREFELT $ 61))
                                             (QREFELT $ 13) (QREFELT $ 81))
                                   (|HTMLFORM;formatNary|
                                    (SPADCALL |op| (QREFELT $ 61)) |args|
                                    |prec| $))
                                  (#4#
                                   (|HTMLFORM;formatFunction| |opf| |args|
                                    |prec| $))))))))))
                      (#4#
                       (|HTMLFORM;formatFunction| |opf| |args| |prec|
                        $))))))))))
          #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |HTMLFormat;|)) 

(DEFUN |HTMLFormat| ()
  (SPROG NIL
         (PROG (#1=#:G1036)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|HTMLFormat|)
                    . #2=(|HTMLFormat|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|HTMLFormat|
                             (LIST (CONS NIL (CONS 1 (|HTMLFormat;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|HTMLFormat|)))))))))) 

(DEFUN |HTMLFormat;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|HTMLFormat|) . #1=(|HTMLFormat|))
          (LETT $ (GETREFV 84) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|HTMLFormat| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 " \\  ")
          (QSETREFV $ 7 1000000)
          (QSETREFV $ 8 0)
          (QSETREFV $ 9 '(-))
          (QSETREFV $ 10 '(700))
          (QSETREFV $ 11 '(+-> |\|| ^ / < > = OVER))
          (QSETREFV $ 12 (LIST 0 0 900 700 400 400 400 700))
          (QSETREFV $ 13
                    (LIST "-" "+" "*" (QREFELT $ 6) "," ";" " " "ROW" ""
                          " \\cr " "&" "/\\" "\\/"))
          (QSETREFV $ 14 (LIST 700 700 800 800 110 110 0 0 0 0 0 600 600))
          (QSETREFV $ 15 '(ROW &))
          (QSETREFV $ 16 '(SIGMA SIGMA2 PI PI2 INTSIGN))
          (QSETREFV $ 17 '(700 800 700 800 700))
          (QSETREFV $ 18
                    '(MATRIX BRACKET BRACE CONCATB VCONCAT AGGLST CONCAT
                      OVERBAR ROOT SUB TAG SUPERSUB ZAG AGGSET SC PAREN SEGMENT
                      QUOTE |theMap| SLASH))
          (QSETREFV $ 19
                    '(|cos| |cot| |csc| |log| |sec| |sin| |tan| |cosh| |coth|
                      |csch| |sech| |sinh| |tanh| |acos| |asin| |atan| |erf|
                      |...| $ |infinity| |Gamma| |%pi| |%e| |%i|))
          (QSETREFV $ 20
                    (LIST "cos" "cot" "csc" "log" "sec" "sin" "tan" "cosh"
                          "coth" "csch" "sech" "sinh" "tanh" "arccos" "arcsin"
                          "arctan" "erf" "&#x2026;" "$" "&#x221E;" "&#x0413;"
                          "&#x003C0;" "&#x02147;" "&#x02148;"))
          (QSETREFV $ 21 NIL)
          $))) 

(MAKEPROP '|HTMLFormat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|blank| '|maxPrec| '|minPrec|
              '|unaryOps| '|unaryPrecs| '|binaryOps| '|binaryPrecs| '|naryOps|
              '|naryPrecs| '|naryNGOps| '|plexOps| '|plexPrecs| '|specialOps|
              '|specialStrings| '|specialStringsInHTML| '|debug| (|OutputForm|)
              (|OutputFormTools|) (0 . |precondition|) (|String|)
              |HTMLFORM;coerce;OfS;1| |HTMLFORM;coerceS;OfS;2|
              |HTMLFORM;coerceL;OfS;3| (|Void|) (5 . |void|)
              |HTMLFORM;display;SV;4| (|List| $) (|Tree| 25) (9 . |tree|)
              (15 . |setvalue!|) (|Boolean|) (21 . |empty?|) (26 . |leaf?|)
              (31 . |value|) (36 . |prefix?|) (42 . |children|)
              |HTMLFORM;exprex;OfS;9| (47 . |concat|) (52 . |atom?|)
              (57 . |operator|) (|List| 22) (62 . |arguments|) (|Integer|)
              (67 . >) (73 . |list|) (78 . |append|) (|Character|)
              (84 . |position|) (91 . |split|) (|List| 25) (97 . |elt|)
              (103 . ~=) (109 . |elt|) (115 . |tree|) (|Symbol|)
              (120 . |string|) (125 . |second|) (130 . ~=) (136 . |position|)
              (143 . |elt|) (|List| 60) (149 . |position|) (|List| 48)
              (155 . |elt|) (|List| 33) (161 . |append|) (167 . |empty|)
              (171 . |is_symbol?|) (177 . |has_op?|) (|NonNegativeInteger|)
              (183 . >) (189 . |position|) (195 . |symbol?|) (200 . |symbol|)
              (205 . |member?|) (211 . |member?|) (|SingleInteger|)
              (|HashState|))
           '#(~= 217 |latex| 223 |hashUpdate!| 228 |hash| 234 |exprex| 239
              |display| 244 |coerceS| 249 |coerceL| 254 |coerce| 259 = 269)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 22))
                        (|makeByteWordVec2| 83
                                            '(1 23 22 22 24 0 29 0 30 2 33 0 25
                                              32 34 2 33 25 0 25 35 1 33 36 0
                                              37 1 33 36 0 38 1 33 25 0 39 2 25
                                              36 0 0 40 1 33 32 0 41 1 25 0 32
                                              43 1 23 36 22 44 1 23 22 22 45 1
                                              23 46 22 47 2 48 36 0 0 49 1 46 0
                                              22 50 2 46 0 0 0 51 3 25 48 52 0
                                              48 53 2 25 32 0 52 54 2 55 25 0
                                              48 56 2 25 36 0 0 57 2 25 0 0 0
                                              58 1 33 0 25 59 1 60 25 0 61 1 46
                                              22 0 62 2 48 36 0 0 63 3 25 48 0
                                              0 48 64 2 46 22 0 48 65 2 66 48
                                              60 0 67 2 68 48 0 48 69 2 70 0 0
                                              0 71 0 33 0 72 2 23 36 22 60 73 2
                                              23 36 22 60 74 2 75 36 0 0 76 2
                                              55 48 25 0 77 1 23 36 22 78 1 23
                                              60 22 79 2 66 36 60 0 80 2 55 36
                                              25 0 81 2 0 36 0 0 1 1 0 25 0 1 2
                                              0 83 83 0 1 1 0 82 0 1 1 0 25 22
                                              42 1 0 29 25 31 1 0 25 22 27 1 0
                                              25 22 28 1 0 25 22 26 1 0 22 0 1
                                              2 0 36 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|HTMLFormat| 'NILADIC T) 
