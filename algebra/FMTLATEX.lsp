
(SDEFUN |FMTLATEX;coerce;%Of;1| ((|x| (%)) (% (|OutputForm|)))
        (|coerceRe2E| |x|
                      (ELT
                       (|Record| (|:| |prolog| (|OutputBox|))
                                 (|:| |fmt| (|OutputBox|))
                                 (|:| |epilog| (|OutputBox|)))
                       0))) 

(SDEFUN |FMTLATEX;defaultPrologue;SOb;2|
        ((|label| (|String|)) (% (|OutputBox|)))
        (SPADCALL
         (SPADCALL (LIST "\\begin{fricasmath}{" |label| "}") (QREFELT % 10))
         (QREFELT % 12))) 

(SDEFUN |FMTLATEX;defaultEpilogue;SOb;3|
        ((|label| (|String|)) (% (|OutputBox|)))
        (SPADCALL "\\end{fricasmath}" (QREFELT % 12))) 

(SDEFUN |FMTLATEX;parenthesize;2S2Ob;4|
        ((|left| #1=(|String|)) (|right| #1#) (|b| (|OutputBox|))
         (% (|OutputBox|)))
        (SEQ
         (COND
          ((EQUAL |left| "(")
           (COND
            ((EQUAL |right| ")")
             (SEQ (LETT |left| "\\PAREN{") (EXIT (LETT |right| "}")))))))
         (EXIT
          (SPADCALL
           (LIST (SPADCALL |left| (QREFELT % 12)) |b|
                 (SPADCALL |right| (QREFELT % 12)))
           (QREFELT % 15))))) 

(SDEFUN |FMTLATEX;texEscapeString| ((|s| (|String|)) (% (|String|)))
        (SPROG
         ((|str| (|String|)) (|n| (|Integer|)) (|p| (|Integer|))
          (|cc| (|CharacterClass|)))
         (SEQ (LETT |cc| (SPADCALL " \\{}$^_%~#&" (QREFELT % 18)))
              (LETT |p| (SPADCALL |cc| |s| 1 (QREFELT % 20)))
              (EXIT
               (COND ((ZEROP |p|) |s|)
                     ('T
                      (SEQ (LETT |str| "") (LETT |n| 1)
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (>
                                    (LETT |p|
                                          (SPADCALL |cc| |s| |n|
                                                    (QREFELT % 20)))
                                    0))
                                  (GO G191)))
                                (SEQ
                                 (LETT |str|
                                       (STRCONC |str|
                                                (SPADCALL |s|
                                                          (SPADCALL |n|
                                                                    (- |p| 1)
                                                                    (QREFELT %
                                                                             22))
                                                          (QREFELT % 23))))
                                 (LETT |n| (+ |p| 1))
                                 (EXIT
                                  (LETT |str|
                                        (STRCONC |str|
                                                 (SPADCALL "\\"
                                                           (SPADCALL |s| |p|
                                                                     (QREFELT %
                                                                              25))
                                                           (QREFELT % 26))))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (STRCONC |str|
                                     (SPADCALL |s|
                                               (SPADCALL |n| (QCSIZE |s|)
                                                         (QREFELT % 22))
                                               (QREFELT % 23))))))))))) 

(SDEFUN |FMTLATEX;braceBox| ((|b| (|OutputBox|)) (% (|OutputBox|)))
        (SPADCALL "{" "}" |b| (QREFELT % 16))) 

(SDEFUN |FMTLATEX;tex1|
        ((|cmd| (|String|)) (|b| (|OutputBox|)) (% (|OutputBox|)))
        (SPADCALL
         (LIST (SPADCALL |cmd| (QREFELT % 12)) (|FMTLATEX;braceBox| |b| %))
         (QREFELT % 15))) 

(SDEFUN |FMTLATEX;tex1Escape|
        ((|cmd| (|String|)) (|s| (|String|)) (% (|OutputBox|)))
        (|FMTLATEX;tex1| |cmd|
         (SPADCALL (|FMTLATEX;texEscapeString| |s| %) (QREFELT % 12)) %)) 

(SDEFUN |FMTLATEX;tex2|
        ((|cmd| (|String|)) (|b1| (|OutputBox|)) (|b2| (|OutputBox|))
         (% (|OutputBox|)))
        (SPADCALL
         (LIST (|FMTLATEX;tex1| |cmd| |b1| %) (|FMTLATEX;braceBox| |b2| %))
         (QREFELT % 15))) 

(SDEFUN |FMTLATEX;formatFloat;SOb;10| ((|s| (|String|)) (% (|OutputBox|)))
        (SPADCALL (SPADCALL (|STR_to_CHAR| "_") |s| (QREFELT % 28))
                  (QREFELT % 12))) 

(SDEFUN |FMTLATEX;formatString;SOb;11| ((|s| (|String|)) (% (|OutputBox|)))
        (|FMTLATEX;tex1Escape| "\\STRING" |s| %)) 

(SDEFUN |FMTLATEX;formatSymbol;SOb;12| ((|s| (|String|)) (% (|OutputBox|)))
        (|FMTLATEX;tex1Escape| "\\SYMBOL" |s| %)) 

(SDEFUN |FMTLATEX;formatFunctionSymbol;SOb;13|
        ((|s| (|String|)) (% (|OutputBox|)))
        (|FMTLATEX;tex1Escape| "\\FUN" |s| %)) 

(SDEFUN |FMTLATEX;formatFunction;ObLOb;14|
        ((|b| #1=(|OutputBox|)) (|lb| (|List| #1#)) (% (|OutputBox|)))
        (SPROG ((|bx| (|OutputBox|)) (#2=#:G48 NIL) (|a| NIL))
               (SEQ
                (COND
                 ((NULL |lb|)
                  (SPADCALL
                   (LIST |b|
                         (SPADCALL "(" ")" (SPADCALL (QREFELT % 33))
                                   (QREFELT % 16)))
                   (QREFELT % 15)))
                 ('T
                  (SEQ (LETT |bx| (|SPADfirst| |lb|))
                       (SEQ (LETT |a| NIL) (LETT #2# (CDR |lb|)) G190
                            (COND
                             ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |bx|
                                    (SPADCALL
                                     (LIST |bx| (SPADCALL ", " (QREFELT % 12))
                                           |a|)
                                     (QREFELT % 15)))))
                            (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL
                         (LIST (SPADCALL "\\FUNCTION{" (QREFELT % 12)) |b|
                               (SPADCALL "}{" (QREFELT % 12)) |bx|
                               (SPADCALL "}" (QREFELT % 12)))
                         (QREFELT % 15))))))))) 

(SDEFUN |FMTLATEX;function;SI2M;15|
        ((|op| (|String|)) (|p| #1=(|Integer|))
         (|hh| (|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|FMTLATEX;function;SI2M;15!0| (VECTOR |op| |p| %))))) 

(SDEFUN |FMTLATEX;function;SI2M;15!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |p| |op|)
          (LETT % (QREFELT $$ 2))
          (LETT |p| (QREFELT $$ 1))
          (LETT |op| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|bargs| NIL) (#1=#:G54 NIL) (|a| NIL) (#2=#:G53 NIL))
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
                                        (CONS (SPADCALL |a| (QREFELT % 36))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#)))))
                    (EXIT
                     (SPADCALL (SPADCALL |p| |prec| (QREFELT % 38))
                               (SPADCALL (SPADCALL |op| (QREFELT % 12)) |bargs|
                                         (QREFELT % 35))
                               (QREFELT % 39))))))))) 

(SDEFUN |FMTLATEX;integralArgument| ((|a| (|OutputForm|)) (% (|OutputForm|)))
        (SPROG
         ((|op3| (|OutputForm|)) (|op2| #1=(|OutputForm|))
          (|args| (|List| (|OutputForm|))) (|op| #1#))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT % 43)) |a|)
                (#2='T
                 (SEQ (LETT |op| (SPADCALL |a| (QREFELT % 44)))
                      (COND
                       ((NULL (SPADCALL |op| '* (QREFELT % 46))) (EXIT |a|)))
                      (LETT |args| (SPADCALL |a| (QREFELT % 48)))
                      (EXIT
                       (COND ((SPADCALL (LENGTH |args|) 2 (QREFELT % 50)) |a|)
                             (#2#
                              (SEQ
                               (LETT |op2|
                                     (SPADCALL
                                      (SPADCALL |args| 2 (QREFELT % 51))
                                      (QREFELT % 44)))
                               (COND
                                ((NULL (SPADCALL |op2| 'CONCAT (QREFELT % 46)))
                                 (EXIT |a|)))
                               (LETT |op3|
                                     (|SPADfirst|
                                      (SPADCALL
                                       (SPADCALL |args| 2 (QREFELT % 51))
                                       (QREFELT % 48))))
                               (COND
                                ((NULL (SPADCALL |op3| '|d| (QREFELT % 46)))
                                 (EXIT |a|)))
                               (EXIT
                                (SPADCALL (SPADCALL 'INTSEP (QREFELT % 52))
                                          (LIST
                                           (SPADCALL |args| 1 (QREFELT % 51))
                                           (SPADCALL |args| 2 (QREFELT % 51)))
                                          (QREFELT % 53))))))))))))) 

(SDEFUN |FMTLATEX;integral;IM;17|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (SEQ (CONS #'|FMTLATEX;integral;IM;17!0| (VECTOR |p| %))))) 

(SDEFUN |FMTLATEX;integral;IM;17!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |p|)
          (LETT % (QREFELT $$ 1))
          (LETT |p| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|bu| NIL) (|bl| NIL) (|ba| NIL) (|a| NIL))
                   (SEQ
                    (LETT |bl|
                          (SPADCALL
                           (SPADCALL |args| (|spadConstant| % 54)
                                     (QREFELT % 51))
                           (SPADCALL (QREFELT % 55)) (QREFELT % 56)))
                    (LETT |bu|
                          (SPADCALL (SPADCALL |args| 2 (QREFELT % 51))
                                    (SPADCALL (QREFELT % 55)) (QREFELT % 56)))
                    (LETT |a|
                          (|FMTLATEX;integralArgument|
                           (SPADCALL |args| 3 (QREFELT % 51)) %))
                    (LETT |ba|
                          (SPADCALL |a| (SPADCALL (QREFELT % 55))
                                    (QREFELT % 56)))
                    (COND
                     ((NULL (SPADCALL |bl| (QREFELT % 57)))
                      (LETT |bl| (SPADCALL "_{" "}" |bl| (QREFELT % 16)))))
                    (COND
                     ((NULL (SPADCALL |bu| (QREFELT % 57)))
                      (LETT |bu| (SPADCALL "^{" "}" |bu| (QREFELT % 16)))))
                    (EXIT
                     (SPADCALL (SPADCALL |p| |prec| (QREFELT % 38))
                               (SPADCALL
                                (LIST (SPADCALL "\\int" (QREFELT % 12)) |bl|
                                      |bu| (|FMTLATEX;braceBox| |ba| %))
                                (QREFELT % 15))
                               (QREFELT % 39))))))))) 

(SDEFUN |FMTLATEX;operatorWithLimits|
        ((|s| (|String|)) (|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|FMTLATEX;operatorWithLimits!0| (VECTOR |s| |p| %))))) 

(SDEFUN |FMTLATEX;operatorWithLimits!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |p| |s|)
          (LETT % (QREFELT $$ 2))
          (LETT |p| (QREFELT $$ 1))
          (LETT |s| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|bu| NIL) (|bl| NIL) (|ba| NIL))
                   (SEQ
                    (LETT |bl|
                          (SPADCALL
                           (SPADCALL |args| (|spadConstant| % 54)
                                     (QREFELT % 51))
                           (SPADCALL (QREFELT % 55)) (QREFELT % 56)))
                    (LETT |bu| (SPADCALL (QREFELT % 33)))
                    (LETT |ba|
                          (SPADCALL (SPADCALL |args| 2 (QREFELT % 51))
                                    (SPADCALL (QREFELT % 55)) (QREFELT % 56)))
                    (COND
                     ((SPADCALL (SPADCALL |args| (QREFELT % 59)) 3
                                (QREFELT % 60))
                      (SEQ (LETT |bu| |ba|)
                           (EXIT
                            (LETT |ba|
                                  (SPADCALL (SPADCALL |args| 3 (QREFELT % 51))
                                            |p| (QREFELT % 56)))))))
                    (COND
                     ((NULL (SPADCALL |bl| (QREFELT % 57)))
                      (LETT |bl| (SPADCALL "_{" "}" |bl| (QREFELT % 16)))))
                    (COND
                     ((NULL (SPADCALL |bu| (QREFELT % 57)))
                      (LETT |bu| (SPADCALL "^{" "}" |bu| (QREFELT % 16)))))
                    (EXIT
                     (SPADCALL (SPADCALL |p| |prec| (QREFELT % 38))
                               (SPADCALL
                                (LIST (SPADCALL |s| (QREFELT % 12)) |bl| |bu|
                                      (|FMTLATEX;braceBox| |ba| %))
                                (QREFELT % 15))
                               (QREFELT % 39))))))))) 

(SDEFUN |FMTLATEX;sum;IM;19|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (|FMTLATEX;operatorWithLimits| "\\sum" |p| %)) 

(SDEFUN |FMTLATEX;product;IM;20|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (|FMTLATEX;operatorWithLimits| "\\prod" |p| %)) 

(SDEFUN |FMTLATEX;theMap;ILOb;21|
        ((|prec| (|Integer|)) (|args| (|List| (|OutputForm|)))
         (% (|OutputBox|)))
        (SPROG
         ((|p2| (|Integer|)) (|p1| (|Integer|)) (|s| (|String|))
          (|b| (|OutputBox|)) (|a| (|OutputForm|)))
         (SEQ (LETT |a| (|SPADfirst| |args|))
              (LETT |s|
                    (SEQ
                     (COND
                      ((SPADCALL |a| (QREFELT % 43))
                       (COND
                        ((NULL (SPADCALL |a| (QREFELT % 63)))
                         (COND
                          ((NULL (SPADCALL |a| (QREFELT % 64)))
                           (EXIT ";?;")))))))
                     (LETT |b|
                           (SPADCALL |a| (SPADCALL (QREFELT % 55))
                                     (QREFELT % 56)))
                     (EXIT (|SPADfirst| (SPADCALL |b| (QREFELT % 66))))))
              (LETT |p1| (SPADCALL (|STR_to_CHAR| ";") |s| (QREFELT % 67)))
              (LETT |p2|
                    (SPADCALL (|STR_to_CHAR| ";") |s| (+ |p1| 1)
                              (QREFELT % 68)))
              (EXIT
               (|FMTLATEX;tex1| "\\theMap"
                (SPADCALL
                 (SPADCALL |s| (SPADCALL (+ |p1| 1) (- |p2| 1) (QREFELT % 22))
                           (QREFELT % 23))
                 (QREFELT % 12))
                %))))) 

(SDEFUN |FMTLATEX;overbar;I2M;22|
        ((|p| #1=(|Integer|))
         (|hh| (|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (CONS #'|FMTLATEX;overbar;I2M;22!0| (VECTOR |hh| % |p|)))) 

(SDEFUN |FMTLATEX;overbar;I2M;22!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (|p| % |hh|)
          (LETT |p| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |hh| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |p| |prec| (QREFELT % 38))
                      (|FMTLATEX;tex1| "\\overline" (SPADCALL |p| |args| |hh|)
                       %)
                      (QREFELT % 39)))))) 

(SDEFUN |FMTLATEX;box;2M;23|
        ((|hh| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (CONS #'|FMTLATEX;box;2M;23!0| (VECTOR |hh| %)))) 

(SDEFUN |FMTLATEX;box;2M;23!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |hh|)
          (LETT % (QREFELT $$ 1))
          (LETT |hh| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|FMTLATEX;tex1| "\\BOX"
             (SPADCALL |prec|
                       (LIST
                        (SPADCALL |args| (|spadConstant| % 54) (QREFELT % 51)))
                       |hh|)
             %))))) 

(SDEFUN |FMTLATEX;nthRoot;I3M;24|
        ((|p| #1=(|Integer|))
         (|h1| #2=(|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (|h2| #2#)
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|FMTLATEX;nthRoot;I3M;24!0| (VECTOR |h2| |h1| % |p|))))) 

(SDEFUN |FMTLATEX;nthRoot;I3M;24!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (|p| % |h1| |h2|)
          (LETT |p| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |h1| (QREFELT $$ 1))
          (LETT |h2| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|bn| NIL) (|bx| NIL))
                   (SEQ
                    (LETT |bx|
                          (SPADCALL |p|
                                    (LIST
                                     (SPADCALL |args| (|spadConstant| % 54)
                                               (QREFELT % 51)))
                                    (SPADCALL "{" "}" |h1| (QREFELT % 72))))
                    (LETT |bn| (SPADCALL (QREFELT % 33)))
                    (COND
                     ((SPADCALL (SPADCALL |args| (QREFELT % 59))
                                (|spadConstant| % 54) (QREFELT % 73))
                      (LETT |bn|
                            (SPADCALL |p|
                                      (LIST (SPADCALL |args| 2 (QREFELT % 51)))
                                      (SPADCALL "[" "]" |h2|
                                                (QREFELT % 72))))))
                    (EXIT
                     (SPADCALL (SPADCALL |p| |prec| (QREFELT % 38))
                               (SPADCALL
                                (LIST (SPADCALL "\\sqrt" (QREFELT % 12)) |bn|
                                      |bx|)
                                (QREFELT % 15))
                               (QREFELT % 39))))))))) 

(SDEFUN |FMTLATEX;scripts;IM;25|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (SEQ (CONS #'|FMTLATEX;scripts;IM;25!0| (VECTOR |p| %))))) 

(SDEFUN |FMTLATEX;scripts;IM;25!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |p|)
          (LETT % (QREFELT $$ 1))
          (LETT |p| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|b| NIL) (|a| NIL) (|i| NIL))
                   (SEQ
                    (LETT |b|
                          (|FMTLATEX;tex1| "\\SCRIPTS"
                           (SPADCALL (SPADCALL |args| (QREFELT % 75)) |p|
                                     (QREFELT % 56))
                           %))
                    (LETT |args| (SPADCALL |args| (QREFELT % 76)))
                    (SEQ (LETT |i| (|spadConstant| % 78)) G190
                         (COND ((|greater_SI| |i| 4) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |args| (QREFELT % 80))
                             (LETT |b|
                                   (SPADCALL
                                    (LIST |b| (SPADCALL "{}" (QREFELT % 12)))
                                    (QREFELT % 15))))
                            ('T
                             (SEQ (LETT |a| (SPADCALL |args| (QREFELT % 75)))
                                  (LETT |args|
                                        (SPADCALL |args| (QREFELT % 76)))
                                  (COND
                                   ((SPADCALL |a| (QREFELT % 63))
                                    (COND
                                     ((SPADCALL (SPADCALL |a| (QREFELT % 81))
                                                " " (QREFELT % 82))
                                      (EXIT
                                       (LETT |b|
                                             (SPADCALL
                                              (LIST |b|
                                                    (SPADCALL "{}"
                                                              (QREFELT % 12)))
                                              (QREFELT % 15))))))))
                                  (EXIT
                                   (LETT |b|
                                         (SPADCALL
                                          (LIST |b|
                                                (SPADCALL "{" (QREFELT % 12))
                                                (SPADCALL |a|
                                                          (SPADCALL
                                                           (QREFELT % 55))
                                                          (QREFELT % 56))
                                                (SPADCALL "}" (QREFELT % 12)))
                                          (QREFELT % 15)))))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL (SPADCALL |p| |prec| (QREFELT % 38)) |b|
                               (QREFELT % 39))))))))) 

(SDEFUN |FMTLATEX;subscript;IM;26|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (SEQ (CONS #'|FMTLATEX;subscript;IM;26!0| (VECTOR |p| %))))) 

(SDEFUN |FMTLATEX;subscript;IM;26!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |p|)
          (LETT % (QREFELT $$ 1))
          (LETT |p| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|b2| NIL) (|b1| NIL))
                   (SEQ
                    (LETT |b1|
                          (SPADCALL
                           (SPADCALL |args| (|spadConstant| % 54)
                                     (QREFELT % 51))
                           (SPADCALL |p| (|spadConstant| % 54) (QREFELT % 84))
                           (QREFELT % 56)))
                    (LETT |b2|
                          (SPADCALL (SPADCALL |args| 2 (QREFELT % 51))
                                    (SPADCALL (QREFELT % 55)) (QREFELT % 56)))
                    (EXIT
                     (SPADCALL (SPADCALL |p| |prec| (QREFELT % 38))
                               (|FMTLATEX;tex2| "\\SUB" |b1| |b2| %)
                               (QREFELT % 39))))))))) 

(SDEFUN |FMTLATEX;altsupersub;IM;27|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ (CONS #'|FMTLATEX;altsupersub;IM;27!0| (VECTOR |p| %))))) 

(SDEFUN |FMTLATEX;altsupersub;IM;27!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |p|)
          (LETT % (QREFELT $$ 1))
          (LETT |p| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|b2| NIL) (|lb| NIL) (|o| NIL) (#1=#:G118 NIL) (|a| NIL)
              (|i| NIL) (|b1| NIL))
             (SEQ
              (LETT |b1|
                    (SPADCALL (SPADCALL |args| (QREFELT % 75)) |p|
                              (QREFELT % 56)))
              (LETT |lb| (SPADCALL (QREFELT % 86)))
              (SEQ (LETT |i| (|spadConstant| % 78)) (LETT |a| NIL)
                   (LETT #1# (SPADCALL |args| (QREFELT % 76))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (COND ((SPADCALL |i| (QREFELT % 87)) "_") ('T "^")))
                    (EXIT
                     (LETT |lb|
                           (SPADCALL
                            (|FMTLATEX;tex1| |o|
                             (SPADCALL |a| (SPADCALL (QREFELT % 55))
                                       (QREFELT % 56))
                             %)
                            |lb| (QREFELT % 88)))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |b2|
                    (SPADCALL (SPADCALL |lb| (QREFELT % 89)) (QREFELT % 15)))
              (EXIT
               (SPADCALL (SPADCALL |p| |prec| (QREFELT % 38))
                         (|FMTLATEX;tex2| "\\ALTSUPERSUB" |b1| |b2| %)
                         (QREFELT % 39))))))))) 

(SDEFUN |FMTLATEX;prime;IM;28|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (SEQ (CONS #'|FMTLATEX;prime;IM;28!0| (VECTOR |p| %))))) 

(SDEFUN |FMTLATEX;prime;IM;28!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |p|)
          (LETT % (QREFELT $$ 1))
          (LETT |p| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|b2| NIL) (|b1| NIL))
                   (SEQ
                    (LETT |b1|
                          (SPADCALL
                           (SPADCALL |args| (|spadConstant| % 54)
                                     (QREFELT % 51))
                           (SPADCALL |p| (|spadConstant| % 54) (QREFELT % 84))
                           (QREFELT % 56)))
                    (LETT |b2|
                          (SPADCALL (SPADCALL |args| 2 (QREFELT % 51))
                                    (SPADCALL (QREFELT % 55)) (QREFELT % 56)))
                    (EXIT
                     (SPADCALL (SPADCALL |p| |prec| (QREFELT % 38))
                               (|FMTLATEX;tex2| "\\PRIME" |b1| |b2| %)
                               (QREFELT % 39))))))))) 

(SDEFUN |FMTLATEX;aux2|
        ((|s| (|String|)) (|p| (|Integer|))
         (|h1| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (|h2| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (CONS #'|FMTLATEX;aux2!0| (VECTOR |h2| |h1| |s| % |p|)))) 

(SDEFUN |FMTLATEX;aux2!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (|p| % |s| |h1| |h2|)
          (LETT |p| (QREFELT $$ 4))
          (LETT % (QREFELT $$ 3))
          (LETT |s| (QREFELT $$ 2))
          (LETT |h1| (QREFELT $$ 1))
          (LETT |h2| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |p| |prec| (QREFELT % 38))
                      (|FMTLATEX;tex2| |s|
                       (SPADCALL |p|
                                 (LIST
                                  (SPADCALL |args| (|spadConstant| % 54)
                                            (QREFELT % 51)))
                                 |h1|)
                       (SPADCALL |p| (LIST (SPADCALL |args| 2 (QREFELT % 51)))
                                 |h2|)
                       %)
                      (QREFELT % 39)))))) 

(SDEFUN |FMTLATEX;power;I3M;30|
        ((|p| #1=(|Integer|))
         (|h1| #2=(|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (|h2| #2#)
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (|FMTLATEX;aux2| "\\SUPER" |p| |h1| |h2| %)) 

(SDEFUN |FMTLATEX;fraction;I3M;31|
        ((|p| #1=(|Integer|))
         (|h1| #2=(|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (|h2| #2#)
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (|FMTLATEX;aux2| "\\frac" |p| |h1| |h2| %)) 

(SDEFUN |FMTLATEX;slash;I3M;32|
        ((|p| #1=(|Integer|))
         (|h1| #2=(|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (|h2| #2#)
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (|FMTLATEX;aux2| "\\SLASH" |p| |h1| |h2| %)) 

(SDEFUN |FMTLATEX;binomial;ILOb;33|
        ((|prec| (|Integer|)) (|args| (|List| (|OutputForm|)))
         (% (|OutputBox|)))
        (SPROG ((|b2| #1=(|OutputBox|)) (|b1| #1#))
               (SEQ
                (LETT |b1|
                      (SPADCALL (SPADCALL |args| 1 (QREFELT % 51))
                                (SPADCALL (QREFELT % 55)) (QREFELT % 56)))
                (LETT |b2|
                      (SPADCALL (SPADCALL |args| 2 (QREFELT % 51))
                                (SPADCALL (QREFELT % 55)) (QREFELT % 56)))
                (EXIT (|FMTLATEX;tex2| "\\binom" |b1| |b2| %))))) 

(SDEFUN |FMTLATEX;zag;ILOb;34|
        ((|prec| (|Integer|)) (|args| (|List| (|OutputForm|)))
         (% (|OutputBox|)))
        (SPROG ((|b2| #1=(|OutputBox|)) (|b1| #1#))
               (SEQ
                (LETT |b1|
                      (SPADCALL (SPADCALL |args| 1 (QREFELT % 51))
                                (SPADCALL (QREFELT % 55)) (QREFELT % 56)))
                (LETT |b2|
                      (SPADCALL (SPADCALL |args| 2 (QREFELT % 51))
                                (SPADCALL (QREFELT % 55)) (QREFELT % 56)))
                (EXIT (|FMTLATEX;tex2| "\\ZAG" |b1| |b2| %))))) 

(SDEFUN |FMTLATEX;environment;3S2M;35|
        ((|env| (|String|)) (|x| (|String|)) (|sep| (|String|))
         (|h| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|FMTLATEX;environment;3S2M;35!0|
                      (VECTOR |h| |sep| |x| |env| %))))) 

(SDEFUN |FMTLATEX;environment;3S2M;35!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |env| |x| |sep| |h|)
          (LETT % (QREFELT $$ 4))
          (LETT |env| (QREFELT $$ 3))
          (LETT |x| (QREFELT $$ 2))
          (LETT |sep| (QREFELT $$ 1))
          (LETT |h| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|entries| NIL) (|e| NIL) (|b| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |args| (QREFELT % 80))
                      (SPADCALL (QREFELT % 33)))
                     ('T
                      (SEQ
                       (LETT |b|
                             (SPADCALL
                              (SPADCALL (LIST "\\begin{" |env| "}" |x|)
                                        (QREFELT % 10))
                              (QREFELT % 12)))
                       (LETT |e|
                             (SPADCALL
                              (SPADCALL (LIST "\\end{" |env| "}")
                                        (QREFELT % 10))
                              (QREFELT % 12)))
                       (LETT |entries|
                             (SPADCALL (SPADCALL (QREFELT % 55)) |args|
                                       (SPADCALL |sep|
                                                 (SPADCALL (QREFELT % 55)) |h|
                                                 (QREFELT % 97))))
                       (EXIT
                        (SPADCALL (LIST |b| |entries| |e|)
                                  (QREFELT % 15)))))))))))) 

(SDEFUN |FMTLATEX;vconcat;2M;36|
        ((|h| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPADCALL "VCONCAT" "" "\\\\" |h| (QREFELT % 98))) 

(SDEFUN |FMTLATEX;pile;2M;37|
        ((|h| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPADCALL "PILE" "" "\\\\" |h| (QREFELT % 98))) 

(SDEFUN |FMTLATEX;matrix;2SM;38|
        ((|left| #1=(|String|)) (|right| #1#)
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SEQ (CONS #'|FMTLATEX;matrix;2SM;38!0| %))) 

(SDEFUN |FMTLATEX;matrix;2SM;38!0| ((|prec| NIL) (|args| NIL) (% NIL))
        (SPROG ((|n| NIL))
               (SEQ
                (LETT |n|
                      (SPADCALL
                       (LIST "{"
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |args| (QREFELT % 76))
                                          (QREFELT % 75))
                                (QREFELT % 48))
                               (QREFELT % 59))
                              (QREFELT % 101))
                             "}")
                       (QREFELT % 10)))
                (EXIT
                 (SPADCALL (SPADCALL (QREFELT % 55))
                           (SPADCALL |args| (QREFELT % 76))
                           (SPADCALL "MATRIX" |n| "\\\\"
                                     (SPADCALL (SPADCALL (QREFELT % 55))
                                               (QREFELT % 102))
                                     (QREFELT % 98))))))) 

(SDEFUN |FMTLATEX;setOperatorHandlers!|
        ((|oh|
          (|OperatorHandlers|
           (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
         (%
          (|OperatorHandlers|
           (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))))
        (SPROG ((#1=#:G538 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SPADCALL |oh| 0 "NOTHING" (SPADCALL (QREFELT % 104))
                            (QREFELT % 106))
                  (SPADCALL |oh| 0 "%pi" (SPADCALL "\\pi " (QREFELT % 107))
                            (QREFELT % 106))
                  (SPADCALL |oh| 0 "%e" (SPADCALL "\\EulerE " (QREFELT % 107))
                            (QREFELT % 106))
                  (SPADCALL |oh| 0 "%i"
                            (SPADCALL "\\ImaginaryI " (QREFELT % 107))
                            (QREFELT % 106))
                  (SPADCALL |oh| 0 "%Infinity"
                            (SPADCALL "\\infty " (QREFELT % 107))
                            (QREFELT % 106))
                  (SPADCALL |oh| 0 "infinity"
                            (SPADCALL "\\infty " (QREFELT % 107))
                            (QREFELT % 106))
                  (SPADCALL |oh| 0 "..." (SPADCALL "\\ldots " (QREFELT % 107))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "cos"
                            (SPADCALL "\\cos" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "cot"
                            (SPADCALL "\\cot" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "csc"
                            (SPADCALL "\\csc" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "log"
                            (SPADCALL "\\log" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "sec"
                            (SPADCALL "\\sec" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "sin"
                            (SPADCALL "\\sin" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "tan"
                            (SPADCALL "\\tan" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "cosh"
                            (SPADCALL "\\cosh" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "coth"
                            (SPADCALL "\\coth" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "csch"
                            (SPADCALL "\\csch" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "sech"
                            (SPADCALL "\\sech" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "sinh"
                            (SPADCALL "\\sinh" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "tanh"
                            (SPADCALL "\\tanh" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "acos"
                            (SPADCALL "\\arccos" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "asin"
                            (SPADCALL "\\arcsin" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "atan"
                            (SPADCALL "\\arctan" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "erf"
                            (SPADCALL "\\erf" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "Gamma"
                            (SPADCALL "\\Gamma" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 41))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "-"
                            (SPADCALL "-" 710 (SPADCALL 715 (QREFELT % 102))
                                      (QREFELT % 109))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "not"
                            (SPADCALL "\\lnot " 710
                                      (SPADCALL 715 (QREFELT % 102))
                                      (QREFELT % 109))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "QUOTE"
                            (SPADCALL "\\QUOTE{" "}"
                                      (SPADCALL 990 (QREFELT % 102))
                                      (QREFELT % 72))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "OVERBAR"
                            (SPADCALL (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 70))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "BOX"
                            (SPADCALL
                             (SPADCALL (SPADCALL (QREFELT % 55))
                                       (QREFELT % 102))
                             (QREFELT % 71))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "Aleph"
                            (SPADCALL "\\SUB{\\aleph}{" "}"
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 72))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "BRACE"
                            (SPADCALL "\\BRACE{" "}"
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 72))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "BRACKET"
                            (SPADCALL "\\BRACKET{" "}"
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 72))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "PAREN"
                            (SPADCALL "\\PAREN{" "}"
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 72))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "ROOT"
                            (SPADCALL "\\sqrt{" "}"
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 72))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "SEGMENT"
                            (SPADCALL "\\SEGMENTi{" "}"
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 72))
                            (QREFELT % 106))
                  (SPADCALL |oh| 1 "STRING"
                            (SPADCALL "\\STRING{" "}"
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 72))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "rem"
                            (SPADCALL "" 810
                                      (SPADCALL "\\REM{" "}"
                                                (SPADCALL 811 (QREFELT % 102))
                                                (QREFELT % 72))
                                      (SPADCALL #2="{" #3="}"
                                                (SPADCALL 811 (QREFELT % 102))
                                                (QREFELT % 72))
                                      (QREFELT % 110))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "quo"
                            (SPADCALL "" 810
                                      (SPADCALL "\\QUO{" "}"
                                                (SPADCALL 811 (QREFELT % 102))
                                                (QREFELT % 72))
                                      (SPADCALL #2# #3#
                                                (SPADCALL 811 (QREFELT % 102))
                                                (QREFELT % 72))
                                      (QREFELT % 110))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "exquo"
                            (SPADCALL "" 810
                                      (SPADCALL "\\EXQUO{" "}"
                                                (SPADCALL 811 (QREFELT % 102))
                                                (QREFELT % 72))
                                      (SPADCALL #2# #3#
                                                (SPADCALL 811 (QREFELT % 102))
                                                (QREFELT % 72))
                                      (QREFELT % 110))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "^"
                            (SPADCALL 950 (SPADCALL 960 (QREFELT % 102))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 92))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "/"
                            (SPADCALL 910
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 93))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "OVER"
                            (SPADCALL 910
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 93))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "SLASH"
                            (SPADCALL 880 (SPADCALL 881 (QREFELT % 102))
                                      (SPADCALL 882 (QREFELT % 102))
                                      (QREFELT % 94))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "ZAG" (ELT % 96) (QREFELT % 106))
                  (SPADCALL |oh| 2 "BINOMIAL" (ELT % 95) (QREFELT % 106))
                  (SPADCALL |oh| 2 "PRIME" (SPADCALL 950 (QREFELT % 91))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "ROOT"
                            (SPADCALL 970
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 74))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "SUB" (SPADCALL 950 (QREFELT % 85))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "SEGMENT"
                            (SPADCALL "\\SEGMENTii" 100
                                      (SPADCALL
                                       (SPADCALL #2# #3#
                                                 (SPADCALL 100 (QREFELT % 102))
                                                 (QREFELT % 72))
                                       (SPADCALL #2# #3#
                                                 (SPADCALL 100 (QREFELT % 102))
                                                 (QREFELT % 72))
                                       (QREFELT % 111))
                                      (QREFELT % 109))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "TENSOR"
                            (SPADCALL "\\otimes " 850
                                      (SPADCALL 850 (QREFELT % 102))
                                      (SPADCALL 850 (QREFELT % 102))
                                      (QREFELT % 110))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "EQUATNUM"
                            (SPADCALL "\\EQUATNUM" (SPADCALL (QREFELT % 108))
                                      (SPADCALL
                                       (SPADCALL #2# #3#
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT % 55))
                                                  (QREFELT % 102))
                                                 (QREFELT % 72))
                                       (SPADCALL #2# #3#
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT % 55))
                                                  (QREFELT % 102))
                                                 (QREFELT % 72))
                                       (QREFELT % 111))
                                      (QREFELT % 109))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "OVERLABEL"
                            (SPADCALL "\\OVERLABEL" (SPADCALL (QREFELT % 108))
                                      (SPADCALL
                                       (SPADCALL #2# #3#
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT % 55))
                                                  (QREFELT % 102))
                                                 (QREFELT % 72))
                                       (SPADCALL #2# #3#
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT % 55))
                                                  (QREFELT % 102))
                                                 (QREFELT % 72))
                                       (QREFELT % 111))
                                      (QREFELT % 109))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "=="
                            (SPADCALL "==" 400 (SPADCALL 401 (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "="
                            (SPADCALL "=" 400 (SPADCALL 400 (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "~="
                            (SPADCALL "\\ne " 400
                                      (SPADCALL 400 (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "<"
                            (SPADCALL "<" 400 (SPADCALL 400 (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 ">"
                            (SPADCALL ">" 400 (SPADCALL 400 (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "<="
                            (SPADCALL "\\leq " 400
                                      (SPADCALL 400 (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 ">="
                            (SPADCALL "\\geq " 400
                                      (SPADCALL 400 (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "and"
                            (SPADCALL "\\land " 300
                                      (SPADCALL 300 (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "or"
                            (SPADCALL "\\lor " 200
                                      (SPADCALL 200 (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "LET"
                            (SPADCALL "\\coloneqq " 125
                                      (SPADCALL 125 (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "->"
                            (SPADCALL "\\to " 1001
                                      (SPADCALL 1001 (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "~>"
                            (SPADCALL "\\leadsto " 100
                                      (SPADCALL 100 (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "+->"
                            (SPADCALL "\\mapsto " 100
                                      (SPADCALL 100 (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "|"
                            (SPADCALL "\\mid " 100
                                      (SPADCALL 100 (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "SIGMA" (SPADCALL 750 (QREFELT % 61))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "PI" (SPADCALL 750 (QREFELT % 62))
                            (QREFELT % 106))
                  (SPADCALL |oh| 3 "SIGMA2" (SPADCALL 750 (QREFELT % 61))
                            (QREFELT % 106))
                  (SPADCALL |oh| 3 "PI2" (SPADCALL 750 (QREFELT % 62))
                            (QREFELT % 106))
                  (SPADCALL |oh| 3 "INTSIGN" (SPADCALL 700 (QREFELT % 58))
                            (QREFELT % 106))
                  (SPADCALL |oh| 2 "INTSEP"
                            (SPADCALL "\\, " (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 110))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "+"
                            (SPADCALL "+" "-" 700
                                      (SPADCALL 700 (QREFELT % 102))
                                      (QREFELT % 112))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "-"
                            (SPADCALL "+" "-" 700
                                      (SPADCALL 700 (QREFELT % 102))
                                      (QREFELT % 112))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "*"
                            (SPADCALL "\\TIMES " 800
                                      (SPADCALL 800 (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "AGGLST"
                            (SPADCALL "\\COMMA " (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "AGGSET"
                            (SPADCALL "\\SEMICOLON " (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "CONCAT"
                            (SPADCALL "" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "CONCATB"
                            (SPADCALL "\\ " (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "ALTSUPERSUB" (SPADCALL 900 (QREFELT % 90))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "SUPERSUB" (SPADCALL 900 (QREFELT % 83))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "SC"
                            (SPADCALL
                             (SPADCALL (SPADCALL (QREFELT % 55))
                                       (QREFELT % 102))
                             (QREFELT % 100))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "VCONCAT"
                            (SPADCALL
                             (SPADCALL (SPADCALL (QREFELT % 55))
                                       (QREFELT % 102))
                             (QREFELT % 99))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "ROW"
                            (SPADCALL "&" (SPADCALL (QREFELT % 108))
                                      (SPADCALL (SPADCALL (QREFELT % 55))
                                                (QREFELT % 102))
                                      (QREFELT % 97))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "MATRIX" (SPADCALL "[" "]" (QREFELT % 103))
                            (QREFELT % 106))
                  (SPADCALL |oh| -1 "theMap" (ELT % 69) (QREFELT % 106))
                  (EXIT (PROGN (LETT #1# |oh|) (GO #4=#:G537)))))
                #4# (EXIT #1#)))) 

(SDEFUN |FMTLATEX;operatorHandlers;Oh;40|
        ((%
          (|OperatorHandlers|
           (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))))
        (QREFELT % 114)) 

(DECLAIM (NOTINLINE |FormatLaTeX;|)) 

(DEFUN |FormatLaTeX;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FormatLaTeX|))
          (LETT % (GETREFV 116))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FormatLaTeX| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 114
                    (|FMTLATEX;setOperatorHandlers!| (SPADCALL (QREFELT % 113))
                     %))
          %))) 

(DEFUN |FormatLaTeX| ()
  (SPROG NIL
         (PROG (#1=#:G541)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FormatLaTeX|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FormatLaTeX|
                             (LIST (CONS NIL (CONS 1 (|FormatLaTeX;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|FormatLaTeX|)))))))))) 

(MAKEPROP '|FormatLaTeX| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|OutputForm|) |FMTLATEX;coerce;%Of;1|
              (|List| %) (|String|) (0 . |concat|) (|OutputBox|) (5 . |box|)
              |FMTLATEX;defaultPrologue;SOb;2| |FMTLATEX;defaultEpilogue;SOb;3|
              (10 . |hconcat|) |FMTLATEX;parenthesize;2S2Ob;4|
              (|CharacterClass|) (15 . |charClass|) (|Integer|)
              (20 . |position|) (|UniversalSegment| 19) (27 . SEGMENT)
              (33 . |elt|) (|Character|) (39 . |elt|) (45 . |concat|)
              (51 . |char|) (56 . |remove|) |FMTLATEX;formatFloat;SOb;10|
              |FMTLATEX;formatString;SOb;11| |FMTLATEX;formatSymbol;SOb;12|
              |FMTLATEX;formatFunctionSymbol;SOb;13| (62 . |empty|) (|List| 11)
              |FMTLATEX;formatFunction;ObLOb;14| (66 . |formatExpression|)
              (|Boolean|) (71 . <) (77 . |parenthesizeIf|) (|Mapping| 11 19 47)
              |FMTLATEX;function;SI2M;15| (|OutputFormTools|) (83 . |atom?|)
              (88 . |operator|) (|Symbol|) (93 . |is_symbol?|) (|List| 6)
              (99 . |arguments|) (|NonNegativeInteger|) (104 . ~=)
              (110 . |elt|) (116 . |coerce|) (121 . |elt|) (127 . |One|)
              (131 . |minPrecedence|) (135 . |formatExpression|)
              (141 . |empty?|) |FMTLATEX;integral;IM;17| (146 . |#|) (151 . =)
              |FMTLATEX;sum;IM;19| |FMTLATEX;product;IM;20| (157 . |string?|)
              (162 . |symbol?|) (|List| 9) (167 . |lines|) (172 . |position|)
              (178 . |position|) |FMTLATEX;theMap;ILOb;21|
              |FMTLATEX;overbar;I2M;22| |FMTLATEX;box;2M;23| (185 . |bracket|)
              (192 . >) |FMTLATEX;nthRoot;I3M;24| (198 . |first|)
              (203 . |rest|) (|SingleInteger|) (208 . |One|) (212 . |One|)
              (216 . |empty?|) (221 . |string|) (226 . =)
              |FMTLATEX;scripts;IM;25| (232 . +) |FMTLATEX;subscript;IM;26|
              (238 . |empty|) (242 . |odd?|) (247 . |cons|) (253 . |reverse!|)
              |FMTLATEX;altsupersub;IM;27| |FMTLATEX;prime;IM;28|
              |FMTLATEX;power;I3M;30| |FMTLATEX;fraction;I3M;31|
              |FMTLATEX;slash;I3M;32| |FMTLATEX;binomial;ILOb;33|
              |FMTLATEX;zag;ILOb;34| (258 . |nary|)
              |FMTLATEX;environment;3S2M;35| |FMTLATEX;vconcat;2M;36|
              |FMTLATEX;pile;2M;37| (265 . |convert|)
              (270 . |formatExpression|) |FMTLATEX;matrix;2SM;38|
              (275 . |nothing|) (|OperatorHandlers| 40) (279 . |setHandler!|)
              (287 . |formatConstant|) (292 . |maxPrecedence|) (296 . |prefix|)
              (303 . |infix|) (311 . |binary|) (317 . |naryPlus|) (325 . |new|)
              '|operatorData| |FMTLATEX;operatorHandlers;Oh;40|)
           '#(|zag| 329 |vconcat| 335 |theMap| 340 |sum| 346 |subscript| 351
              |slash| 356 |scripts| 363 |product| 368 |prime| 373 |prefix| 378
              |precedence| 385 |power| 391 |pile| 398 |parenthesizeIf| 403
              |parenthesize| 409 |overbar| 416 |operatorHandlers| 422
              |numberOfPrimes| 426 |nthRoot| 431 |nothing| 438 |naryPlus| 442
              |nary| 450 |minPrecedence| 457 |maxPrecedence| 461 |matrix| 465
              |integral| 471 |infix| 476 |function| 484 |fraction| 491
              |formatSymbol| 498 |formatString| 503 |formatInteger| 508
              |formatFunctionSymbol| 513 |formatFunction| 518 |formatFloat| 524
              |formatExpression| 529 |formatConstant| 545 |environment| 550
              |defaultPrologue| 558 |defaultEpilogue| 563 |coerce| 568
              |bracket| 573 |box| 580 |binomial| 585 |binary| 591 |altsupersub|
              597)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0))
                 (CONS '#(|FormatterCategory&| NIL)
                       (CONS '#((|FormatterCategory|) (|CoercibleTo| 6))
                             (|makeByteWordVec2| 115
                                                 '(1 9 0 8 10 1 11 0 9 12 1 11
                                                   0 8 15 1 17 0 9 18 3 9 19 17
                                                   0 19 20 2 21 0 19 19 22 2 9
                                                   0 0 21 23 2 9 24 0 19 25 2 9
                                                   0 0 24 26 1 24 0 9 27 2 9 0
                                                   24 0 28 0 11 0 33 1 0 11 6
                                                   36 2 19 37 0 0 38 2 0 11 37
                                                   11 39 1 42 37 6 43 1 42 6 6
                                                   44 2 42 37 6 45 46 1 42 47 6
                                                   48 2 49 37 0 0 50 2 47 6 0
                                                   19 51 1 45 6 0 52 2 6 0 0 8
                                                   53 0 19 0 54 0 0 19 55 2 0
                                                   11 6 19 56 1 11 37 0 57 1 47
                                                   49 0 59 2 49 37 0 0 60 1 42
                                                   37 6 63 1 42 37 6 64 1 11 65
                                                   0 66 2 9 19 24 0 67 3 9 19
                                                   24 0 19 68 3 0 40 9 9 40 72
                                                   2 19 37 0 0 73 1 47 6 0 75 1
                                                   47 0 0 76 0 77 0 78 0 49 0
                                                   79 1 47 37 0 80 1 42 9 6 81
                                                   2 9 37 0 0 82 2 19 0 0 0 84
                                                   0 34 0 86 1 19 37 0 87 2 34
                                                   0 11 0 88 1 34 0 0 89 3 0 40
                                                   9 19 40 97 1 19 9 0 101 1 0
                                                   40 19 102 0 0 40 104 4 105
                                                   40 0 19 9 40 106 1 0 40 9
                                                   107 0 0 19 108 3 0 40 9 19
                                                   40 109 4 0 40 9 19 40 40 110
                                                   2 0 40 40 40 111 4 0 40 9 9
                                                   19 40 112 0 105 0 113 2 0 11
                                                   19 47 96 1 0 40 40 99 2 0 11
                                                   19 47 69 1 0 40 19 61 1 0 40
                                                   19 85 3 0 40 19 40 40 94 1 0
                                                   40 19 83 1 0 40 19 62 1 0 40
                                                   19 91 3 0 40 9 19 40 109 2 0
                                                   40 19 40 1 3 0 40 19 40 40
                                                   92 1 0 40 40 100 2 0 11 37
                                                   11 39 3 0 11 9 9 11 16 2 0
                                                   40 19 40 70 0 0 105 115 1 0
                                                   19 6 1 3 0 40 19 40 40 74 0
                                                   0 40 104 4 0 40 9 9 19 40
                                                   112 3 0 40 9 19 40 97 0 0 19
                                                   55 0 0 19 108 2 0 40 9 9 103
                                                   1 0 40 19 58 4 0 40 9 19 40
                                                   40 110 3 0 40 9 19 40 41 3 0
                                                   40 19 40 40 93 1 0 11 9 31 1
                                                   0 11 9 30 1 0 11 19 1 1 0 11
                                                   9 32 2 0 11 11 34 35 1 0 11
                                                   9 29 2 0 11 6 19 56 1 0 11 6
                                                   36 1 0 40 19 102 1 0 40 9
                                                   107 4 0 40 9 9 9 40 98 1 0
                                                   11 9 13 1 0 11 9 14 1 0 6 0
                                                   7 3 0 40 9 9 40 72 1 0 40 40
                                                   71 2 0 11 19 47 95 2 0 40 40
                                                   40 111 1 0 40 19 90)))))
           '|lookupComplete|)) 
