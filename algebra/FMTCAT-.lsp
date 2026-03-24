
(PUT '|FMTCAT-;minPrecedence;I;1| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |FMTCAT-;minPrecedence;I;1| ((% (|Integer|))) 0) 

(PUT '|FMTCAT-;maxPrecedence;I;2| '|SPADreplace| '(XLAM NIL 10000)) 

(SDEFUN |FMTCAT-;maxPrecedence;I;2| ((% (|Integer|))) 10000) 

(SDEFUN |FMTCAT-;numberOfPrimes;OfI;3| ((|a2| (|OutputForm|)) (% (|Integer|)))
        (SPROG
         ((|aa2| (|List| (|OutputForm|))) (|o2| (|String|))
          (|opex| (|OutputForm|)) (#1=#:G52 NIL) (#2=#:G53 NIL) (|i| NIL)
          (|n| (|NonNegativeInteger|)) (|s2| (|String|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |a2| (QREFELT % 13))
             (COND
              ((NULL (SPADCALL |a2| (QREFELT % 14)))
               (PROGN (LETT #1# -1) (GO #3=#:G51)))
              ('T
               (SEQ (LETT |s2| (SPADCALL |a2| (QREFELT % 16)))
                    (LETT |n| (QCSIZE |s2|))
                    (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |s2| |i| (QREFELT % 18))
                                       (|STR_to_CHAR| ",") (QREFELT % 19))
                             (PROGN (LETT #1# -1) (GO #3#))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (PROGN (LETT #1# |n|) (GO #3#)))))))
            ('T
             (SEQ (LETT |opex| (SPADCALL |a2| (QREFELT % 20)))
                  (COND ((NULL (SPADCALL |opex| (QREFELT % 21))) (EXIT -1)))
                  (LETT |o2|
                        (SPADCALL (SPADCALL |opex| (QREFELT % 23))
                                  (QREFELT % 24)))
                  (EXIT
                   (COND
                    ((OR (SPADCALL |o2| "PAREN" (QREFELT % 25))
                         (OR
                          (>
                           (LENGTH (LETT |aa2| (SPADCALL |a2| (QREFELT % 27))))
                           1)
                          (NULL
                           (SPADCALL (|SPADfirst| |aa2|) (QREFELT % 14)))))
                     -1)
                    ('T
                     (SPADCALL (SPADCALL (|SPADfirst| |aa2|) (QREFELT % 16))
                               (QREFELT % 30)))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |FMTCAT-;float?| ((|s| (|String|)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G83 NIL) (|i| (|Integer|)) (#2=#:G81 NIL) (#3=#:G82 NIL)
          (|n| (|NonNegativeInteger|)) (#4=#:G84 NIL) (|d| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((ZEROP
              (LETT |d| (SPADCALL (|STR_to_CHAR| ".") |s| (QREFELT % 33))))
             NIL)
            (#5='T
             (SEQ
              (SEQ (LETT |i| 1) (LETT #4# (- |d| 1)) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |s| |i| (QREFELT % 18))
                                  (QREFELT % 34)))
                       (PROGN (LETT #1# NIL) (GO #6=#:G80))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |i| (+ |d| 1)) (LETT |n| (QCSIZE |s|))
              (LETT |s| (COPY-SEQ |s|))
              (SEQ G190 (COND ((NULL (<= |i| |n|)) (GO G191)))
                   (SEQ
                    (COND
                     ((|eql_SI| (SPADCALL |s| |i| (QREFELT % 18))
                                (|STR_to_CHAR| "_"))
                      (SEQ
                       (SPADCALL |s| |i| (SPADCALL (QREFELT % 35))
                                 (QREFELT % 36))
                       (EXIT (LETT |i| (+ |i| 1))))))
                    (EXIT (LETT |i| (+ |i| 1))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |i| (+ |d| 1))
              (SEQ
               (EXIT
                (SEQ G190 (COND ((NULL (<= |i| |n|)) (GO G191)))
                     (SEQ
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |s| |i| (QREFELT % 18))
                                   (QREFELT % 34)))
                        (COND
                         ((NULL
                           (|eql_SI| (SPADCALL |s| |i| (QREFELT % 18))
                                     (SPADCALL (QREFELT % 35))))
                          (PROGN (LETT #3# |$NoValue|) (GO #7=#:G68))))))
                      (EXIT (LETT |i| (+ |i| 1))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #7# (EXIT #3#))
              (EXIT
               (COND ((> |i| |n|) (PROGN (LETT #1# 'T) (GO #6#)))
                     ((SPADCALL (SPADCALL |s| |i| (QREFELT % 18))
                                (|STR_to_CHAR| "E") (QREFELT % 19))
                      NIL)
                     (#5#
                      (SEQ
                       (SEQ
                        (EXIT
                         (SEQ G190 (COND ((NULL (< |i| |n|)) (GO G191)))
                              (SEQ (LETT |i| (+ |i| 1))
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |s| |i| (QREFELT % 18))
                                       (SPADCALL (QREFELT % 35))
                                       (QREFELT % 19))
                                      (PROGN (LETT #2# 1) (GO #8=#:G71))))))
                              NIL (GO G190) G191 (EXIT NIL)))
                        #8# (EXIT #2#))
                       (COND
                        ((|eql_SI| (SPADCALL |s| |i| (QREFELT % 18))
                                   (|STR_to_CHAR| "-"))
                         (LETT |i| (+ |i| 1))))
                       (SEQ G190 (COND ((NULL (<= |i| |n|)) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL (SPADCALL |s| |i| (QREFELT % 18))
                                          (QREFELT % 34))
                                (LETT |i| (+ |i| 1)))
                               ('T (PROGN (LETT #1# NIL) (GO #6#))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT (PROGN (LETT #1# 'T) (GO #6#)))))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |FMTCAT-;formatInteger;IOb;5| ((|n| (|Integer|)) (% (|OutputBox|)))
        (SPADCALL (STRINGIMAGE |n|) (QREFELT % 38))) 

(SDEFUN |FMTCAT-;formatFloat;SOb;6| ((|s| (|String|)) (% (|OutputBox|)))
        (SPADCALL |s| (QREFELT % 38))) 

(SDEFUN |FMTCAT-;formatString;SOb;7| ((|s| (|String|)) (% (|OutputBox|)))
        (SPADCALL |s| (QREFELT % 38))) 

(SDEFUN |FMTCAT-;formatSymbol;SOb;8| ((|s| (|String|)) (% (|OutputBox|)))
        (SPADCALL |s| (QREFELT % 38))) 

(SDEFUN |FMTCAT-;formatFunctionSymbol;SOb;9|
        ((|s| (|String|)) (% (|OutputBox|))) (SPADCALL |s| (QREFELT % 38))) 

(SDEFUN |FMTCAT-;formatFunction;ObLOb;10|
        ((|b| (|OutputBox|)) (|lb| (|List| (|OutputBox|))) (% (|OutputBox|)))
        (SPROG ((|bx| (|OutputBox|)) (#1=#:G95 NIL) (|x| NIL))
               (SEQ
                (COND
                 ((NULL |lb|)
                  (SPADCALL
                   (LIST |b|
                         (SPADCALL "(" ")" (SPADCALL (QREFELT % 44))
                                   (QREFELT % 45)))
                   (QREFELT % 47)))
                 ('T
                  (SEQ (LETT |bx| (|SPADfirst| |lb|))
                       (SEQ (LETT |x| NIL) (LETT #1# (CDR |lb|)) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |bx|
                                    (SPADCALL
                                     (LIST |bx| (SPADCALL ", " (QREFELT % 38))
                                           |x|)
                                     (QREFELT % 47)))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL
                         (LIST |b| (SPADCALL "(" ")" |bx| (QREFELT % 45)))
                         (QREFELT % 47))))))))) 

(SDEFUN |FMTCAT-;parenthesizeIf;B2Ob;11|
        ((|needParen?| (|Boolean|)) (|bx| (|OutputBox|)) (% (|OutputBox|)))
        (COND (|needParen?| (SPADCALL "(" ")" |bx| (QREFELT % 45))) ('T |bx|))) 

(SDEFUN |FMTCAT-;formatExpression;OfIOb;12|
        ((|expr| (|OutputForm|)) (|prec| (|Integer|)) (% (|OutputBox|)))
        (SPROG
         ((|bargs| (|List| (|OutputBox|))) (#1=#:G116 NIL) (|a| NIL)
          (#2=#:G115 NIL) (|op| #3=(|String|)) (|nargs| (|Integer|))
          (#4=#:G114 NIL) (#5=#:G113 NIL) (|args| (|List| (|OutputForm|)))
          (|opex| (|OutputForm|)) (|str| #3#) (|s| (|String|))
          (|operatorData|
           (|OperatorHandlers|
            (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))))
         (SEQ (LETT |operatorData| (SPADCALL (QREFELT % 53)))
              (EXIT
               (COND
                ((SPADCALL |expr| (QREFELT % 13))
                 (COND
                  ((SPADCALL |expr| (QREFELT % 54))
                   (SPADCALL (SPADCALL |expr| (QREFELT % 55)) (QREFELT % 56)))
                  ((SPADCALL |expr| (QREFELT % 14))
                   (SEQ (LETT |s| (SPADCALL |expr| (QREFELT % 16)))
                        (EXIT
                         (COND
                          ((|FMTCAT-;float?| |s| %)
                           (SPADCALL |s| (QREFELT % 57)))
                          (#6='T (SPADCALL |s| (QREFELT % 58)))))))
                  ((NULL (SPADCALL |expr| (QREFELT % 21)))
                   (SPADCALL "[[BAD OUTPUTFORM]]" (QREFELT % 38)))
                  ('T
                   (SEQ
                    (LETT |str|
                          (SPADCALL (SPADCALL |expr| (QREFELT % 23))
                                    (QREFELT % 24)))
                    (EXIT
                     (COND
                      ((SPADCALL |operatorData| 0 |str| (QREFELT % 59))
                       (SPADCALL |prec| NIL
                                 (SPADCALL |operatorData| 0 |str|
                                           (QREFELT % 60))))
                      (#6# (SPADCALL |str| (QREFELT % 61)))))))))
                (#6#
                 (SEQ (LETT |opex| (SPADCALL |expr| (QREFELT % 20)))
                      (LETT |args| (SPADCALL |expr| (QREFELT % 27)))
                      (COND
                       ((NULL (SPADCALL |opex| (QREFELT % 21)))
                        (EXIT
                         (SEQ
                          (LETT |bargs|
                                (PROGN
                                 (LETT #5# NIL)
                                 (SEQ (LETT |a| NIL) (LETT #4# |args|) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN (LETT |a| (CAR #4#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #5#
                                              (CONS
                                               (SPADCALL |a| (QREFELT % 62))
                                               #5#))))
                                      (LETT #4# (CDR #4#)) (GO G190) G191
                                      (EXIT (NREVERSE #5#)))))
                          (EXIT
                           (SPADCALL
                            (SPADCALL |opex| (SPADCALL (QREFELT % 63))
                                      (QREFELT % 64))
                            |bargs| (QREFELT % 65)))))))
                      (LETT |nargs| (LENGTH |args|))
                      (LETT |op|
                            (SPADCALL (SPADCALL |opex| (QREFELT % 23))
                                      (QREFELT % 24)))
                      (EXIT
                       (COND
                        ((SPADCALL |operatorData| |nargs| |op| (QREFELT % 59))
                         (SPADCALL |prec| |args|
                                   (SPADCALL |operatorData| |nargs| |op|
                                             (QREFELT % 60))))
                        ((SPADCALL |operatorData| -1 |op| (QREFELT % 59))
                         (SPADCALL |prec| |args|
                                   (SPADCALL |operatorData| -1 |op|
                                             (QREFELT % 60))))
                        (#6#
                         (SEQ
                          (LETT |bargs|
                                (PROGN
                                 (LETT #2# NIL)
                                 (SEQ (LETT |a| NIL) (LETT #1# |args|) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN (LETT |a| (CAR #1#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (SPADCALL |a| (QREFELT % 62))
                                               #2#))))
                                      (LETT #1# (CDR #1#)) (GO G190) G191
                                      (EXIT (NREVERSE #2#)))))
                          (EXIT
                           (SPADCALL (SPADCALL |op| (QREFELT % 66)) |bargs|
                                     (QREFELT % 65)))))))))))))) 

(SDEFUN |FMTCAT-;formatExpression;OfOb;13|
        ((|expr| (|OutputForm|)) (% (|OutputBox|)))
        (SPADCALL |expr| (SPADCALL (QREFELT % 63)) (QREFELT % 64))) 

(SDEFUN |FMTCAT-;nothing;M;14|
        ((% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (CONS #'|FMTCAT-;nothing;M;14!0| %)) 

(SDEFUN |FMTCAT-;nothing;M;14!0| ((|prec| NIL) (|args| NIL) (% NIL))
        (SPADCALL (QREFELT % 44))) 

(SDEFUN |FMTCAT-;formatConstant;SM;15|
        ((|op| (|String|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (CONS #'|FMTCAT-;formatConstant;SM;15!0| (VECTOR % |op|)))) 

(SDEFUN |FMTCAT-;formatConstant;SM;15!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (|op| %)
          (LETT |op| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |op| (QREFELT % 38)))))) 

(SDEFUN |FMTCAT-;formatExpression;IM;16|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (CONS #'|FMTCAT-;formatExpression;IM;16!0| (VECTOR |p| %)))) 

(SDEFUN |FMTCAT-;formatExpression;IM;16!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |p|)
          (LETT % (QREFELT $$ 1))
          (LETT |p| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |args| (QREFELT % 71)) |p| (QREFELT % 64)))))) 

(SDEFUN |FMTCAT-;precedence;I2M;17|
        ((|p| (|Integer|))
         (|h| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (CONS #'|FMTCAT-;precedence;I2M;17!0| (VECTOR |h| |p|)))) 

(SDEFUN |FMTCAT-;precedence;I2M;17!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (|p| |h|)
          (LETT |p| (QREFELT $$ 1))
          (LETT |h| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |p| |args| |h|))))) 

(SDEFUN |FMTCAT-;bracket;2S2M;18|
        ((|left| (|String|)) (|right| (|String|))
         (|h| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (CONS #'|FMTCAT-;bracket;2S2M;18!0|
                     (VECTOR % |h| |right| |left|)))) 

(SDEFUN |FMTCAT-;bracket;2S2M;18!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (|left| |right| |h| %)
          (LETT |left| (QREFELT $$ 3))
          (LETT |right| (QREFELT $$ 2))
          (LETT |h| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |left| |right| (SPADCALL |prec| |args| |h|)
                      (QREFELT % 45)))))) 

(SDEFUN |FMTCAT-;prefix;SI2M;19|
        ((|op| (|String|)) (|p| (|Integer|))
         (|hh| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (CONS #'|FMTCAT-;prefix;SI2M;19!0| (VECTOR |hh| |op| % |p|)))) 

(SDEFUN |FMTCAT-;prefix;SI2M;19!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (|p| % |op| |hh|)
          (LETT |p| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |op| (QREFELT $$ 1))
          (LETT |hh| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |p| |prec| (QREFELT % 75))
                      (SPADCALL
                       (LIST (SPADCALL |op| (QREFELT % 38))
                             (SPADCALL |prec| |args| |hh|))
                       (QREFELT % 47))
                      (QREFELT % 76)))))) 

(SDEFUN |FMTCAT-;function;SI2M;20|
        ((|op| (|String|)) (|p| (|Integer|))
         (|hh| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPADCALL |op| |p| (SPADCALL "(" ")" |hh| (QREFELT % 78))
                  (QREFELT % 79))) 

(SDEFUN |FMTCAT-;infix;SI3M;21|
        ((|op| (|String|)) (|p| (|Integer|))
         (|h1| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (|h2| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|FMTCAT-;infix;SI3M;21!0|
                      (VECTOR |op| |p| |h2| |h1| %))))) 

(SDEFUN |FMTCAT-;infix;SI3M;21!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |h1| |h2| |p| |op|)
          (LETT % (QREFELT $$ 4))
          (LETT |h1| (QREFELT $$ 3))
          (LETT |h2| (QREFELT $$ 2))
          (LETT |p| (QREFELT $$ 1))
          (LETT |op| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|b2| NIL) (|b1| NIL))
                   (SEQ
                    (LETT |b1|
                          (SPADCALL |prec|
                                    (LIST
                                     (SPADCALL |args| (|spadConstant| % 81)
                                               (QREFELT % 82)))
                                    |h1|))
                    (LETT |b2|
                          (SPADCALL |prec|
                                    (LIST (SPADCALL |args| 2 (QREFELT % 82)))
                                    |h2|))
                    (EXIT
                     (SPADCALL (SPADCALL |p| |prec| (QREFELT % 75))
                               (SPADCALL
                                (LIST |b1| (SPADCALL |op| (QREFELT % 38)) |b2|)
                                (QREFELT % 47))
                               (QREFELT % 76))))))))) 

(SDEFUN |FMTCAT-;binary;3M;22|
        ((|h1| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (|h2| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPADCALL "" (SPADCALL (QREFELT % 84)) |h1| |h2| (QREFELT % 85))) 

(SDEFUN |FMTCAT-;nary;SI2M;23|
        ((|sep| (|String|)) (|p| (|Integer|))
         (|hh| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|FMTCAT-;nary;SI2M;23!0| (VECTOR |hh| |p| |sep| %))))) 

(SDEFUN |FMTCAT-;nary;SI2M;23!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |sep| |p| |hh|)
          (LETT % (QREFELT $$ 3))
          (LETT |sep| (QREFELT $$ 2))
          (LETT |p| (QREFELT $$ 1))
          (LETT |hh| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|l| NIL) (#1=#:G152 NIL) (|a| NIL) (|sepbox| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |args| (QREFELT % 87))
                      (SPADCALL "" (QREFELT % 38)))
                     ('T
                      (SEQ (LETT |sepbox| (SPADCALL |sep| (QREFELT % 38)))
                           (LETT |l|
                                 (LIST
                                  (SPADCALL |p|
                                            (LIST
                                             (SPADCALL |args| (QREFELT % 71)))
                                            |hh|)))
                           (SEQ (LETT |a| NIL)
                                (LETT #1# (SPADCALL |args| (QREFELT % 88)))
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |a| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |l|
                                        (SPADCALL
                                         (SPADCALL |prec| (LIST |a|) |hh|)
                                         (SPADCALL |sepbox| |l| (QREFELT % 89))
                                         (QREFELT % 89)))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (SPADCALL (SPADCALL |p| |prec| (QREFELT % 75))
                                      (SPADCALL (SPADCALL |l| (QREFELT % 90))
                                                (QREFELT % 47))
                                      (QREFELT % 76)))))))))))) 

(SDEFUN |FMTCAT-;unaryMinus?| ((|a| (|OutputForm|)) (% (|Boolean|)))
        (SPROG ((|opa| (|OutputForm|)))
               (SEQ
                (COND ((SPADCALL |a| (QREFELT % 13)) NIL)
                      (#1='T
                       (SEQ (LETT |opa| (SPADCALL |a| (QREFELT % 20)))
                            (COND
                             ((NULL (SPADCALL |opa| (QREFELT % 21)))
                              (EXIT NIL)))
                            (EXIT
                             (COND
                              ((EQUAL
                                (SPADCALL (SPADCALL |opa| (QREFELT % 23))
                                          (QREFELT % 24))
                                "-")
                               (EQL (LENGTH (SPADCALL |a| (QREFELT % 27))) 1))
                              (#1# NIL))))))))) 

(SDEFUN |FMTCAT-;naryPlus;2SI2M;25|
        ((|plus| (|String|)) (|minus| (|String|)) (|p| (|Integer|))
         (|hh| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|FMTCAT-;naryPlus;2SI2M;25!0|
                      (VECTOR |plus| |minus| |hh| |p| %))))) 

(SDEFUN |FMTCAT-;naryPlus;2SI2M;25!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |p| |hh| |minus| |plus|)
          (LETT % (QREFELT $$ 4))
          (LETT |p| (QREFELT $$ 3))
          (LETT |hh| (QREFELT $$ 2))
          (LETT |minus| (QREFELT $$ 1))
          (LETT |plus| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|l| NIL) (|sep| NIL) (|a| NIL) (#1=#:G166 NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |args| (QREFELT % 87))
                      (SPADCALL (QREFELT % 44)))
                     ('T
                      (SEQ
                       (LETT |l|
                             (LIST
                              (SPADCALL |p|
                                        (LIST (SPADCALL |args| (QREFELT % 71)))
                                        |hh|)))
                       (SEQ (LETT |a| NIL)
                            (LETT #1# (SPADCALL |args| (QREFELT % 88))) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (COND
                              ((|FMTCAT-;unaryMinus?| |a| %)
                               (SEQ
                                (LETT |sep| (SPADCALL |minus| (QREFELT % 38)))
                                (EXIT
                                 (LETT |a|
                                       (SPADCALL (SPADCALL |a| (QREFELT % 27))
                                                 (QREFELT % 71))))))
                              ('T
                               (LETT |sep| (SPADCALL |plus| (QREFELT % 38)))))
                             (EXIT
                              (LETT |l|
                                    (SPADCALL (SPADCALL |p| (LIST |a|) |hh|)
                                              (SPADCALL |sep| |l|
                                                        (QREFELT % 89))
                                              (QREFELT % 89)))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL (SPADCALL |p| |prec| (QREFELT % 75))
                                  (SPADCALL (SPADCALL |l| (QREFELT % 90))
                                            (QREFELT % 47))
                                  (QREFELT % 76)))))))))))) 

(DECLAIM (NOTINLINE |FormatterCategory&;|)) 

(DEFUN |FormatterCategory&| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FormatterCategory&| DV$1))
          (LETT % (GETREFV 93))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|FormatterCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|)
              |FMTCAT-;minPrecedence;I;1| |FMTCAT-;maxPrecedence;I;2|
              (|Boolean|) (|OutputForm|) (|OutputFormTools|) (0 . |atom?|)
              (5 . |string?|) (|String|) (10 . |string|) (|Character|)
              (15 . |elt|) (21 . ~=) (27 . |operator|) (32 . |symbol?|)
              (|Symbol|) (37 . |symbol|) (42 . |string|) (47 . ~=) (|List| 11)
              (53 . |arguments|) (|PositiveInteger|) (|NumberFormats|)
              (58 . |ScanRoman|) |FMTCAT-;numberOfPrimes;OfI;3| (63 . |char|)
              (68 . |position|) (74 . |digit?|) (79 . |space|) (83 . |setelt!|)
              (|OutputBox|) (90 . |box|) |FMTCAT-;formatInteger;IOb;5|
              |FMTCAT-;formatFloat;SOb;6| |FMTCAT-;formatString;SOb;7|
              |FMTCAT-;formatSymbol;SOb;8| |FMTCAT-;formatFunctionSymbol;SOb;9|
              (95 . |empty|) (99 . |parenthesize|) (|List| %) (106 . |hconcat|)
              (|List| 37) |FMTCAT-;formatFunction;ObLOb;10|
              |FMTCAT-;parenthesizeIf;B2Ob;11| (|Mapping| 37 7 26)
              (|OperatorHandlers| 51) (111 . |operatorHandlers|)
              (115 . |integer?|) (120 . |integer|) (125 . |formatInteger|)
              (130 . |formatFloat|) (135 . |formatString|)
              (140 . |knownHandler?|) (147 . |handler|) (154 . |formatSymbol|)
              (159 . |formatExpression|) (164 . |minPrecedence|)
              (168 . |formatExpression|) (174 . |formatFunction|)
              (180 . |formatFunctionSymbol|)
              |FMTCAT-;formatExpression;OfIOb;12|
              |FMTCAT-;formatExpression;OfOb;13| |FMTCAT-;nothing;M;14|
              |FMTCAT-;formatConstant;SM;15| (185 . |first|)
              |FMTCAT-;formatExpression;IM;16| |FMTCAT-;precedence;I2M;17|
              |FMTCAT-;bracket;2S2M;18| (190 . <) (196 . |parenthesizeIf|)
              |FMTCAT-;prefix;SI2M;19| (202 . |bracket|) (209 . |prefix|)
              |FMTCAT-;function;SI2M;20| (216 . |One|) (220 . |elt|)
              |FMTCAT-;infix;SI3M;21| (226 . |maxPrecedence|) (230 . |infix|)
              |FMTCAT-;binary;3M;22| (238 . |empty?|) (243 . |rest|)
              (248 . |cons|) (254 . |reverse!|) |FMTCAT-;nary;SI2M;23|
              |FMTCAT-;naryPlus;2SI2M;25|)
           '#(|prefix| 259 |precedence| 266 |parenthesizeIf| 272
              |numberOfPrimes| 278 |nothing| 283 |naryPlus| 287 |nary| 295
              |minPrecedence| 302 |maxPrecedence| 306 |infix| 310 |function|
              318 |formatSymbol| 325 |formatString| 330 |formatInteger| 335
              |formatFunctionSymbol| 340 |formatFunction| 345 |formatFloat| 351
              |formatExpression| 356 |formatConstant| 372 |bracket| 377
              |binary| 384)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|numberOfPrimes| ((|Integer|) (|OutputForm|)))
                                T)
                              '((|naryPlus|
                                 ((|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))
                                  (|String|) (|String|) (|Integer|)
                                  (|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))))
                                T)
                              '((|nary|
                                 ((|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))
                                  (|String|) (|Integer|)
                                  (|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))))
                                T)
                              '((|infix|
                                 ((|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))
                                  (|String|) (|Integer|)
                                  (|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))
                                  (|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))))
                                T)
                              '((|binary|
                                 ((|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))
                                  (|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))
                                  (|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))))
                                T)
                              '((|function|
                                 ((|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))
                                  (|String|) (|Integer|)
                                  (|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))))
                                T)
                              '((|prefix|
                                 ((|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))
                                  (|String|) (|Integer|)
                                  (|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))))
                                T)
                              '((|bracket|
                                 ((|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))
                                  (|String|) (|String|)
                                  (|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))))
                                T)
                              '((|precedence|
                                 ((|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))
                                  (|Integer|)
                                  (|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))))
                                T)
                              '((|formatExpression|
                                 ((|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))
                                  (|Integer|)))
                                T)
                              '((|formatConstant|
                                 ((|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))
                                  (|String|)))
                                T)
                              '((|nothing|
                                 ((|Mapping| (|OutputBox|) (|Integer|)
                                             (|List| (|OutputForm|)))))
                                T)
                              '((|parenthesizeIf|
                                 ((|OutputBox|) (|Boolean|) (|OutputBox|)))
                                T)
                              '((|formatFunction|
                                 ((|OutputBox|) (|OutputBox|)
                                  (|List| (|OutputBox|))))
                                T)
                              '((|formatFunctionSymbol|
                                 ((|OutputBox|) (|String|)))
                                T)
                              '((|formatSymbol| ((|OutputBox|) (|String|))) T)
                              '((|formatString| ((|OutputBox|) (|String|))) T)
                              '((|formatFloat| ((|OutputBox|) (|String|))) T)
                              '((|formatInteger| ((|OutputBox|) (|Integer|)))
                                T)
                              '((|formatExpression|
                                 ((|OutputBox|) (|OutputForm|)))
                                T)
                              '((|formatExpression|
                                 ((|OutputBox|) (|OutputForm|) (|Integer|)))
                                T)
                              '((|maxPrecedence| ((|Integer|))) T)
                              '((|minPrecedence| ((|Integer|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 92
                                            '(1 12 10 11 13 1 12 10 11 14 1 12
                                              15 11 16 2 15 17 0 7 18 2 17 10 0
                                              0 19 1 12 11 11 20 1 12 10 11 21
                                              1 12 22 11 23 1 22 15 0 24 2 15
                                              10 0 0 25 1 12 26 11 27 1 29 28
                                              15 30 1 17 0 15 32 2 15 7 17 0 33
                                              1 17 10 0 34 0 17 0 35 3 15 17 0
                                              7 17 36 1 37 0 15 38 0 37 0 44 3
                                              6 37 15 15 37 45 1 37 0 46 47 0 6
                                              52 53 1 12 10 11 54 1 12 7 11 55
                                              1 6 37 7 56 1 6 37 15 57 1 6 37
                                              15 58 3 52 10 0 7 15 59 3 52 51 0
                                              7 15 60 1 6 37 15 61 1 6 37 11 62
                                              0 6 7 63 2 6 37 11 7 64 2 6 37 37
                                              48 65 1 6 37 15 66 1 26 11 0 71 2
                                              7 10 0 0 75 2 6 37 10 37 76 3 6
                                              51 15 15 51 78 3 6 51 15 7 51 79
                                              0 7 0 81 2 26 11 0 7 82 0 6 7 84
                                              4 6 51 15 7 51 51 85 1 26 10 0 87
                                              1 26 0 0 88 2 48 0 37 0 89 1 48 0
                                              0 90 3 0 51 15 7 51 77 2 0 51 7
                                              51 73 2 0 37 10 37 50 1 0 7 11 31
                                              0 0 51 69 4 0 51 15 15 7 51 92 3
                                              0 51 15 7 51 91 0 0 7 8 0 0 7 9 4
                                              0 51 15 7 51 51 83 3 0 51 15 7 51
                                              80 1 0 37 15 42 1 0 37 15 41 1 0
                                              37 7 39 1 0 37 15 43 2 0 37 37 48
                                              49 1 0 37 15 40 2 0 37 11 7 67 1
                                              0 37 11 68 1 0 51 7 72 1 0 51 15
                                              70 3 0 51 15 15 51 74 2 0 51 51
                                              51 86)))))
           '|lookupComplete|)) 
