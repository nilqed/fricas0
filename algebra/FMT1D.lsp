
(SDEFUN |FMT1D;coerce;%Of;1| ((|x| (%)) (% (|OutputForm|)))
        (|coerceRe2E| |x|
                      (ELT
                       (|Record| (|:| |prolog| (|OutputBox|))
                                 (|:| |fmt| (|OutputBox|))
                                 (|:| |epilog| (|OutputBox|)))
                       0))) 

(SDEFUN |FMT1D;defaultPrologue;SOb;2| ((|label| (|String|)) (% (|OutputBox|)))
        (SPADCALL (QREFELT % 9))) 

(SDEFUN |FMT1D;defaultEpilogue;SOb;3| ((|label| (|String|)) (% (|OutputBox|)))
        (SPADCALL (QREFELT % 9))) 

(SDEFUN |FMT1D;fricasEscapeString| ((|s| (|String|)) (% (|String|)))
        (SPROG
         ((|str| (|String|)) (|esc| (|String|)) (|n| (|Integer|))
          (|p| (|Integer|)) (|cc| (|CharacterClass|)))
         (SEQ (LETT |cc| (SPADCALL "\"_" (QREFELT % 14)))
              (LETT |p| (SPADCALL |cc| |s| 1 (QREFELT % 16)))
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
                                                    (QREFELT % 16)))
                                    0))
                                  (GO G191)))
                                (SEQ
                                 (LETT |str|
                                       (STRCONC |str|
                                                (SPADCALL |s|
                                                          (SPADCALL |n|
                                                                    (- |p| 1)
                                                                    (QREFELT %
                                                                             18))
                                                          (QREFELT % 19))))
                                 (LETT |n| (+ |p| 1))
                                 (LETT |esc|
                                       (SPADCALL "_"
                                                 (SPADCALL |s| |p|
                                                           (QREFELT % 21))
                                                 (QREFELT % 22)))
                                 (EXIT (LETT |str| (STRCONC |str| |esc|))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (STRCONC |str|
                                     (SPADCALL |s|
                                               (SPADCALL |n| (QCSIZE |s|)
                                                         (QREFELT % 18))
                                               (QREFELT % 19))))))))))) 

(SDEFUN |FMT1D;formatFloat;SOb;5| ((|s| (|String|)) (% (|OutputBox|)))
        (SPADCALL (SPADCALL (|STR_to_CHAR| "_") |s| (QREFELT % 24))
                  (QREFELT % 25))) 

(SDEFUN |FMT1D;formatString;SOb;6| ((|s| (|String|)) (% (|OutputBox|)))
        (SEQ
         (COND
          ((> (QCSIZE |s|) 1)
           (COND
            ((|eql_SI| (SPADCALL |s| 1 (QREFELT % 21)) (|STR_to_CHAR| "\""))
             (COND
              ((|eql_SI| (SPADCALL |s| (QCSIZE |s|) (QREFELT % 21))
                         (|STR_to_CHAR| "\""))
               (EXIT
                (SPADCALL "\"" "\""
                          (SPADCALL
                           (|FMT1D;fricasEscapeString|
                            (SPADCALL |s|
                                      (SPADCALL 2 (- (QCSIZE |s|) 1)
                                                (QREFELT % 18))
                                      (QREFELT % 19))
                            %)
                           (QREFELT % 25))
                          (QREFELT % 27)))))))))
         (EXIT (SPADCALL (|FMT1D;fricasEscapeString| |s| %) (QREFELT % 25))))) 

(SDEFUN |FMT1D;formatSymbol;SOb;7| ((|s| (|String|)) (% (|OutputBox|)))
        (SPADCALL |s| (QREFELT % 25))) 

(SDEFUN |FMT1D;formatFunctionSymbol;SOb;8| ((|s| (|String|)) (% (|OutputBox|)))
        (SPADCALL |s| (QREFELT % 25))) 

(SDEFUN |FMT1D;parenthesize;2S2Ob;9|
        ((|left| #1=(|String|)) (|right| #1#) (|b| (|OutputBox|))
         (% (|OutputBox|)))
        (SPADCALL
         (LIST (SPADCALL |left| (QREFELT % 25)) |b|
               (SPADCALL |right| (QREFELT % 25)))
         (QREFELT % 32))) 

(SDEFUN |FMT1D;substitute|
        ((|x| (|OutputForm|)) (|y| (|OutputForm|)) (|z| (|OutputForm|))
         (% (|OutputForm|)))
        (SPROG
         ((|args| (|List| (|OutputForm|))) (#1=#:G55 NIL) (|a| NIL)
          (#2=#:G54 NIL))
         (SEQ
          (COND ((SPADCALL |x| |z| (QREFELT % 34)) |y|)
                ((SPADCALL |z| (QREFELT % 36)) |z|)
                ('T
                 (SEQ
                  (LETT |args|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |a| NIL)
                              (LETT #1# (SPADCALL |z| (QREFELT % 38))) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |a| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (|FMT1D;substitute| |x| |y| |a| %)
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))
                  (EXIT
                   (SPADCALL
                    (|FMT1D;substitute| |x| |y| (SPADCALL |z| (QREFELT % 39))
                     %)
                    |args| (QREFELT % 40))))))))) 

(SDEFUN |FMT1D;getDExpression| ((|e| (|OutputForm|)) (% (|OutputForm|)))
        (SPROG
         ((|args2| #1=(|List| (|OutputForm|))) (|op2| #2=(|OutputForm|))
          (|args| #1#) (|op| #2#))
         (SEQ
          (COND ((SPADCALL |e| (QREFELT % 36)) (SPADCALL (QREFELT % 41)))
                (#3='T
                 (SEQ (LETT |op| (SPADCALL |e| (QREFELT % 39)))
                      (COND
                       ((NULL (SPADCALL |op| '* (QREFELT % 43)))
                        (EXIT (SPADCALL (QREFELT % 41)))))
                      (LETT |args| (SPADCALL |e| (QREFELT % 38)))
                      (EXIT
                       (COND
                        ((SPADCALL (LENGTH |args|) 2 (QREFELT % 45))
                         (SPADCALL (QREFELT % 41)))
                        (#3#
                         (SEQ
                          (LETT |op2|
                                (SPADCALL (SPADCALL |args| 2 (QREFELT % 46))
                                          (QREFELT % 39)))
                          (COND
                           ((NULL (SPADCALL |op2| 'CONCAT (QREFELT % 43)))
                            (EXIT (SPADCALL (QREFELT % 41)))))
                          (LETT |args2|
                                (SPADCALL (SPADCALL |args| 2 (QREFELT % 46))
                                          (QREFELT % 38)))
                          (COND
                           ((OR (SPADCALL (LENGTH |args2|) 2 (QREFELT % 45))
                                (NULL
                                 (SPADCALL (|SPADfirst| |args2|) '|d|
                                           (QREFELT % 43))))
                            (EXIT (SPADCALL (QREFELT % 41)))))
                          (EXIT (SPADCALL |args2| 2 (QREFELT % 46))))))))))))) 

(SDEFUN |FMT1D;integral;IM;12|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SEQ (CONS #'|FMT1D;integral;IM;12!0| %))) 

(SDEFUN |FMT1D;integral;IM;12!0| ((|prec| NIL) (|args| NIL) (% NIL))
        (SPROG
         ((|b2| NIL) (|ba| NIL) (|a| NIL) (|bx| NIL) (|x| NIL) (#1=#:G72 NIL)
          (|lb| NIL) (|bu| NIL) (|bl| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |bl|
                  (SPADCALL
                   (SPADCALL |args| (|spadConstant| % 47) (QREFELT % 46))
                   (SPADCALL (QREFELT % 48)) (QREFELT % 49)))
            (LETT |bu|
                  (SPADCALL (SPADCALL |args| 2 (QREFELT % 46))
                            (SPADCALL (QREFELT % 48)) (QREFELT % 49)))
            (EXIT
             (COND
              ((SPADCALL |bu| (QREFELT % 50))
               (SEQ
                (LETT |lb|
                      (LIST
                       (SPADCALL (SPADCALL |args| 3 (QREFELT % 46))
                                 (SPADCALL (QREFELT % 48)) (QREFELT % 49))))
                (COND
                 ((NULL (SPADCALL |bl| (QREFELT % 50)))
                  (LETT |lb| (SPADCALL |lb| |bl| (QREFELT % 52)))))
                (EXIT
                 (PROGN
                  (LETT #1#
                        (SPADCALL (SPADCALL "int" (QREFELT % 25)) |lb|
                                  (QREFELT % 53)))
                  (GO #2=#:G71)))))
              ('T
               (SEQ (LETT |b2| |bu|)
                    (LETT |x|
                          (|FMT1D;getDExpression|
                           (SPADCALL |args| 3 (QREFELT % 46)) %))
                    (LETT |ba|
                          (SPADCALL (SPADCALL |args| 3 (QREFELT % 46))
                                    (SPADCALL (QREFELT % 48)) (QREFELT % 49)))
                    (COND
                     ((SPADCALL |x| (SPADCALL (QREFELT % 41)) (QREFELT % 54))
                      (SEQ
                       (LETT |bx|
                             (SPADCALL |x| (SPADCALL (QREFELT % 48))
                                       (QREFELT % 49)))
                       (LETT |a|
                             (SPADCALL
                              (SPADCALL (SPADCALL |args| 3 (QREFELT % 46))
                                        (QREFELT % 38))
                              (QREFELT % 55)))
                       (EXIT
                        (COND
                         ((SPADCALL |bl| (QREFELT % 50))
                          (LETT |ba|
                                (SPADCALL
                                 (|FMT1D;substitute| |x|
                                  (SPADCALL |args| 2 (QREFELT % 46)) |a| %)
                                 (SPADCALL (QREFELT % 48)) (QREFELT % 49))))
                         ('T
                          (SEQ
                           (LETT |ba|
                                 (SPADCALL |a| (SPADCALL (QREFELT % 48))
                                           (QREFELT % 49)))
                           (EXIT
                            (LETT |b2|
                                  (SPADCALL
                                   (LIST |bx| (SPADCALL "=" (QREFELT % 25))
                                         |bl| (SPADCALL ".." (QREFELT % 25))
                                         |bu|)
                                   (QREFELT % 32)))))))))))
                    (EXIT
                     (SPADCALL (SPADCALL "integral" (QREFELT % 25))
                               (LIST |ba| |b2|) (QREFELT % 53)))))))))
          #2# (EXIT #1#)))) 

(SDEFUN |FMT1D;operatorWithLimits|
        ((|s| (|String|)) (|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (SEQ (CONS #'|FMT1D;operatorWithLimits!0| (VECTOR |s| %))))) 

(SDEFUN |FMT1D;operatorWithLimits!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |s|)
          (LETT % (QREFELT $$ 1))
          (LETT |s| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|b2| NIL) (|ba| NIL) (|bu| NIL) (|bl| NIL))
                   (SEQ
                    (LETT |bl|
                          (SPADCALL
                           (SPADCALL |args| (|spadConstant| % 47)
                                     (QREFELT % 46))
                           (SPADCALL (QREFELT % 48)) (QREFELT % 49)))
                    (LETT |ba|
                          (SPADCALL (SPADCALL |args| 2 (QREFELT % 46))
                                    (SPADCALL (QREFELT % 48)) (QREFELT % 49)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |args| (QREFELT % 58)) 2
                                 (QREFELT % 59))
                       (COND
                        ((SPADCALL |bl| (QREFELT % 50))
                         (SPADCALL (SPADCALL |s| (QREFELT % 25)) (LIST |ba|)
                                   (QREFELT % 53)))
                        ('T
                         (SPADCALL (SPADCALL |s| (QREFELT % 25))
                                   (LIST |ba| |bl|) (QREFELT % 53)))))
                      ('T
                       (SEQ (LETT |bu| |ba|)
                            (LETT |ba|
                                  (SPADCALL (SPADCALL |args| 3 (QREFELT % 46))
                                            (SPADCALL (QREFELT % 48))
                                            (QREFELT % 49)))
                            (LETT |b2|
                                  (SPADCALL
                                   (LIST |bl| (SPADCALL " .. " (QREFELT % 25))
                                         |bu|)
                                   (QREFELT % 32)))
                            (EXIT
                             (SPADCALL (SPADCALL |s| (QREFELT % 25))
                                       (LIST |ba| |b2|)
                                       (QREFELT % 53))))))))))))) 

(SDEFUN |FMT1D;sum;IM;14|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (|FMT1D;operatorWithLimits| "sum" |p| %)) 

(SDEFUN |FMT1D;product;IM;15|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (|FMT1D;operatorWithLimits| "product" |p| %)) 

(SDEFUN |FMT1D;theMap;ILOb;16|
        ((|prec| (|Integer|)) (|args| (|List| (|OutputForm|)))
         (% (|OutputBox|)))
        (SPROG
         ((|p2| (|Integer|)) (|p1| (|Integer|)) (|s| (|String|))
          (|b| (|OutputBox|)) (|a| (|OutputForm|)))
         (SEQ (LETT |a| (|SPADfirst| |args|))
              (LETT |s|
                    (SEQ
                     (COND
                      ((SPADCALL |a| (QREFELT % 36))
                       (COND
                        ((NULL (SPADCALL |a| (QREFELT % 62)))
                         (COND
                          ((NULL (SPADCALL |a| (QREFELT % 63)))
                           (EXIT ";?;")))))))
                     (LETT |b|
                           (SPADCALL |a| (SPADCALL (QREFELT % 48))
                                     (QREFELT % 49)))
                     (EXIT (|SPADfirst| (SPADCALL |b| (QREFELT % 65))))))
              (LETT |p1| (SPADCALL (|STR_to_CHAR| ";") |s| (QREFELT % 66)))
              (LETT |p2|
                    (SPADCALL (|STR_to_CHAR| ";") |s| (+ |p1| 1)
                              (QREFELT % 67)))
              (EXIT
               (SPADCALL "theMap(" ")"
                         (SPADCALL
                          (SPADCALL |s|
                                    (SPADCALL (+ |p1| 1) (- |p2| 1)
                                              (QREFELT % 18))
                                    (QREFELT % 19))
                          (QREFELT % 25))
                         (QREFELT % 27)))))) 

(SDEFUN |FMT1D;overbar;I2M;17|
        ((|p| #1=(|Integer|))
         (|hh| (|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (CONS #'|FMT1D;overbar;I2M;17!0| (VECTOR |hh| |p| %)))) 

(SDEFUN |FMT1D;overbar;I2M;17!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |p| |hh|)
          (LETT % (QREFELT $$ 2))
          (LETT |p| (QREFELT $$ 1))
          (LETT |hh| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL "overbar" (QREFELT % 25))
                      (LIST (SPADCALL |p| |args| |hh|)) (QREFELT % 53)))))) 

(SDEFUN |FMT1D;box;2M;18|
        ((|hh| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (CONS #'|FMT1D;box;2M;18!0| (VECTOR |hh| %)))) 

(SDEFUN |FMT1D;box;2M;18!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |hh|)
          (LETT % (QREFELT $$ 1))
          (LETT |hh| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL "box" (QREFELT % 25))
                      (LIST
                       (SPADCALL |prec|
                                 (LIST
                                  (SPADCALL |args| (|spadConstant| % 47)
                                            (QREFELT % 46)))
                                 |hh|))
                      (QREFELT % 53)))))) 

(SDEFUN |FMT1D;nthRoot;I3M;19|
        ((|p| #1=(|Integer|))
         (|h1| #2=(|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (|h2| #2#)
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|FMT1D;nthRoot;I3M;19!0| (VECTOR |h2| |h1| % |p|))))) 

(SDEFUN |FMT1D;nthRoot;I3M;19!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (|p| % |h1| |h2|)
          (LETT |p| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |h1| (QREFELT $$ 1))
          (LETT |h2| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|bx| NIL))
                   (SEQ
                    (LETT |bx|
                          (SPADCALL |p|
                                    (LIST
                                     (SPADCALL |args| (|spadConstant| % 47)
                                               (QREFELT % 46)))
                                    |h1|))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |args| (QREFELT % 58))
                                 (QREFELT % 71))
                       (SPADCALL (SPADCALL "sqrt" (QREFELT % 25)) (LIST |bx|)
                                 (QREFELT % 53)))
                      ('T
                       (SPADCALL (SPADCALL "nthRoot" (QREFELT % 25))
                                 (LIST |bx|
                                       (SPADCALL |p|
                                                 (LIST
                                                  (SPADCALL |args| 2
                                                            (QREFELT % 46)))
                                                 |h2|))
                                 (QREFELT % 53))))))))))) 

(SDEFUN |FMT1D;emptyArgument?| ((|a| (|OutputForm|)) (% (|Boolean|)))
        (COND
         ((SPADCALL |a| (QREFELT % 36))
          (COND
           ((SPADCALL |a| (QREFELT % 62))
            (COND ((EQUAL (SPADCALL |a| (QREFELT % 73)) " ") 'T)
                  (#1='T (EQUAL (SPADCALL |a| (QREFELT % 73)) ""))))
           (#1# NIL)))
         (#1#
          (SPADCALL (SPADCALL |a| (QREFELT % 39)) 'NOTHING (QREFELT % 43))))) 

(SDEFUN |FMT1D;scripts;IM;21|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SEQ (CONS #'|FMT1D;scripts;IM;21!0| %))) 

(SDEFUN |FMT1D;scripts;IM;21!0| ((|prec| NIL) (|args| NIL) (% NIL))
        (SPROG ((|bx| NIL) (#1=#:G109 NIL) (|a| NIL) (|b1| NIL))
               (SEQ
                (LETT |b1|
                      (SPADCALL (SPADCALL |args| (QREFELT % 55))
                                (SPADCALL (QREFELT % 48)) (QREFELT % 49)))
                (LETT |args| (SPADCALL |args| (QREFELT % 74)))
                (EXIT
                 (COND ((SPADCALL |args| (QREFELT % 75)) |b1|)
                       ('T
                        (SEQ
                         (LETT |bx|
                               (SPADCALL (SPADCALL |args| (QREFELT % 55))
                                         (SPADCALL (QREFELT % 48))
                                         (QREFELT % 49)))
                         (SEQ (LETT |a| NIL)
                              (LETT #1# (SPADCALL |args| (QREFELT % 74))) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |a| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((|FMT1D;emptyArgument?| |a| %)
                                  (LETT |bx|
                                        (SPADCALL
                                         (LIST |bx|
                                               (SPADCALL ", empty()$OutputForm"
                                                         (QREFELT % 25)))
                                         (QREFELT % 32))))
                                 ('T
                                  (LETT |bx|
                                        (SPADCALL
                                         (LIST |bx|
                                               (SPADCALL ", " (QREFELT % 25))
                                               (SPADCALL |a|
                                                         (SPADCALL
                                                          (QREFELT % 48))
                                                         (QREFELT % 49)))
                                         (QREFELT % 32)))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (SPADCALL (SPADCALL "scripts" (QREFELT % 25))
                                    (LIST |b1|
                                          (SPADCALL "[" "]" |bx|
                                                    (QREFELT % 27)))
                                    (QREFELT % 53)))))))))) 

(SDEFUN |FMT1D;subscript;IM;22|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SEQ (CONS #'|FMT1D;subscript;IM;22!0| %))) 

(SDEFUN |FMT1D;subscript;IM;22!0| ((|prec| NIL) (|args| NIL) (% NIL))
        (SPROG ((|b2| NIL) (|b1| NIL))
               (SEQ
                (LETT |b1|
                      (SPADCALL
                       (SPADCALL |args| (|spadConstant| % 47) (QREFELT % 46))
                       (SPADCALL (QREFELT % 48)) (QREFELT % 49)))
                (LETT |b2|
                      (SPADCALL (SPADCALL |args| 2 (QREFELT % 46))
                                (SPADCALL (QREFELT % 48)) (QREFELT % 49)))
                (EXIT
                 (SPADCALL (SPADCALL "subscript" (QREFELT % 25))
                           (LIST |b1| (SPADCALL "[" "]" |b2| (QREFELT % 27)))
                           (QREFELT % 53)))))) 

(SDEFUN |FMT1D;altsupersub;IM;23|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SEQ (CONS #'|FMT1D;altsupersub;IM;23!0| %))) 

(SDEFUN |FMT1D;altsupersub;IM;23!0| ((|prec| NIL) (|args| NIL) (% NIL))
        (SPROG ((|bx| NIL) (#1=#:G120 NIL) (|a| NIL) (|b1| NIL))
               (SEQ
                (LETT |b1|
                      (SPADCALL (SPADCALL |args| (QREFELT % 55))
                                (SPADCALL (QREFELT % 48)) (QREFELT % 49)))
                (LETT |args| (SPADCALL |args| (QREFELT % 74)))
                (EXIT
                 (COND ((SPADCALL |args| (QREFELT % 75)) |b1|)
                       ('T
                        (SEQ
                         (LETT |bx|
                               (SPADCALL (SPADCALL |args| (QREFELT % 55))
                                         (SPADCALL (QREFELT % 48))
                                         (QREFELT % 49)))
                         (SEQ (LETT |a| NIL)
                              (LETT #1# (SPADCALL |args| (QREFELT % 74))) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |a| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((|FMT1D;emptyArgument?| |a| %)
                                  (LETT |bx|
                                        (SPADCALL
                                         (LIST |bx|
                                               (SPADCALL ", empty()$OutputForm"
                                                         (QREFELT % 25)))
                                         (QREFELT % 32))))
                                 ('T
                                  (LETT |bx|
                                        (SPADCALL
                                         (LIST |bx|
                                               (SPADCALL ", " (QREFELT % 25))
                                               (SPADCALL |a|
                                                         (SPADCALL
                                                          (QREFELT % 48))
                                                         (QREFELT % 49)))
                                         (QREFELT % 32)))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (SPADCALL (SPADCALL "supersub" (QREFELT % 25))
                                    (LIST |b1|
                                          (SPADCALL "[" "]" |bx|
                                                    (QREFELT % 27)))
                                    (QREFELT % 53)))))))))) 

(SDEFUN |FMT1D;prime;IM;24|
        ((|p| (|Integer|))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL (SEQ (CONS #'|FMT1D;prime;IM;24!0| (VECTOR |p| %))))) 

(SDEFUN |FMT1D;prime;IM;24!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |p|)
          (LETT % (QREFELT $$ 1))
          (LETT |p| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|b2| NIL) (|n| NIL) (|b1| NIL))
                   (SEQ
                    (LETT |b1|
                          (SPADCALL
                           (SPADCALL |args| (|spadConstant| % 47)
                                     (QREFELT % 46))
                           (SPADCALL |p| (|spadConstant| % 47) (QREFELT % 79))
                           (QREFELT % 49)))
                    (LETT |n|
                          (SPADCALL (SPADCALL |args| 2 (QREFELT % 46))
                                    (QREFELT % 80)))
                    (EXIT
                     (COND
                      ((SPADCALL |n| (|spadConstant| % 81) (QREFELT % 83))
                       (|error| "error in PRIME expression"))
                      ('T
                       (SEQ
                        (LETT |b2|
                              (SPADCALL (SPADCALL |n| (QREFELT % 84))
                                        (QREFELT % 25)))
                        (EXIT
                         (SPADCALL (SPADCALL "prime" (QREFELT % 25))
                                   (LIST |b1| |b2|) (QREFELT % 53))))))))))))) 

(SDEFUN |FMT1D;power;I3M;25|
        ((|p| #1=(|Integer|))
         (|h1| #2=(|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (|h2| #2#)
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ (CONS #'|FMT1D;power;I3M;25!0| (VECTOR |h2| |h1| % |p|))))) 

(SDEFUN |FMT1D;power;I3M;25!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (|p| % |h1| |h2|)
          (LETT |p| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |h1| (QREFELT $$ 1))
          (LETT |h2| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|b2| NIL) (|b1| NIL))
                   (SEQ
                    (LETT |b1|
                          (SPADCALL
                           (SPADCALL |p| (|spadConstant| % 47) (QREFELT % 79))
                           (LIST
                            (SPADCALL |args| (|spadConstant| % 47)
                                      (QREFELT % 46)))
                           |h1|))
                    (LETT |b2|
                          (SPADCALL
                           (SPADCALL |p| (|spadConstant| % 47) (QREFELT % 79))
                           (LIST (SPADCALL |args| 2 (QREFELT % 46))) |h2|))
                    (EXIT
                     (SPADCALL (SPADCALL |p| |prec| (QREFELT % 83))
                               (SPADCALL
                                (LIST |b1| (SPADCALL "^" (QREFELT % 25)) |b2|)
                                (QREFELT % 32))
                               (QREFELT % 86))))))))) 

(SDEFUN |FMT1D;fraction;I3M;26|
        ((|p| #1=(|Integer|))
         (|h1| #2=(|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (|h2| #2#)
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|FMT1D;fraction;I3M;26!0| (VECTOR |h2| |h1| % |p|))))) 

(SDEFUN |FMT1D;fraction;I3M;26!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (|p| % |h1| |h2|)
          (LETT |p| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |h1| (QREFELT $$ 1))
          (LETT |h2| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|b2| NIL) (|b1| NIL))
                   (SEQ
                    (LETT |b1|
                          (SPADCALL
                           (SPADCALL |p| (|spadConstant| % 47) (QREFELT % 79))
                           (LIST
                            (SPADCALL |args| (|spadConstant| % 47)
                                      (QREFELT % 46)))
                           |h1|))
                    (LETT |b2|
                          (SPADCALL
                           (SPADCALL |p| (|spadConstant| % 47) (QREFELT % 79))
                           (LIST (SPADCALL |args| 2 (QREFELT % 46))) |h2|))
                    (EXIT
                     (SPADCALL (SPADCALL |p| |prec| (QREFELT % 83))
                               (SPADCALL
                                (LIST |b1| (SPADCALL "/" (QREFELT % 25)) |b2|)
                                (QREFELT % 32))
                               (QREFELT % 86))))))))) 

(SDEFUN |FMT1D;slash;I3M;27|
        ((|p| #1=(|Integer|))
         (|h1| #2=(|Mapping| (|OutputBox|) #1# (|List| (|OutputForm|))))
         (|h2| #2#)
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPADCALL |p| |h1| |h2| (QREFELT % 88))) 

(SDEFUN |FMT1D;binomial;ILOb;28|
        ((|prec| (|Integer|)) (|args| (|List| (|OutputForm|)))
         (% (|OutputBox|)))
        (SPROG ((|b2| #1=(|OutputBox|)) (|b1| #1#))
               (SEQ
                (LETT |b1|
                      (SPADCALL (SPADCALL |args| 1 (QREFELT % 46))
                                (SPADCALL (QREFELT % 48)) (QREFELT % 49)))
                (LETT |b2|
                      (SPADCALL (SPADCALL |args| 2 (QREFELT % 46))
                                (SPADCALL (QREFELT % 48)) (QREFELT % 49)))
                (EXIT
                 (SPADCALL (SPADCALL "binomial" (QREFELT % 25))
                           (LIST |b1| |b2|) (QREFELT % 53)))))) 

(SDEFUN |FMT1D;zag;ILOb;29|
        ((|prec| (|Integer|)) (|args| (|List| (|OutputForm|)))
         (% (|OutputBox|)))
        (SPROG ((|b2| #1=(|OutputBox|)) (|b1| #1#))
               (SEQ
                (LETT |b1|
                      (SPADCALL (SPADCALL |args| 1 (QREFELT % 46))
                                (SPADCALL (QREFELT % 48)) (QREFELT % 49)))
                (LETT |b2|
                      (SPADCALL (SPADCALL |args| 2 (QREFELT % 46))
                                (SPADCALL (QREFELT % 48)) (QREFELT % 49)))
                (EXIT
                 (SPADCALL (SPADCALL "zag" (QREFELT % 25)) (LIST |b1| |b2|)
                           (QREFELT % 53)))))) 

(SDEFUN |FMT1D;vconcat;2M;30|
        ((|h| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPADCALL "vconcat[" "]"
                  (SPADCALL ", " (SPADCALL (QREFELT % 92))
                            (SPADCALL (SPADCALL (QREFELT % 48)) (QREFELT % 93))
                            (QREFELT % 94))
                  (QREFELT % 95))) 

(SDEFUN |FMT1D;pile;2M;31|
        ((|h| (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPADCALL "pile[" "]"
                  (SPADCALL ", " (SPADCALL (QREFELT % 92))
                            (SPADCALL (SPADCALL (QREFELT % 48)) (QREFELT % 93))
                            (QREFELT % 94))
                  (QREFELT % 95))) 

(SDEFUN |FMT1D;matrix;2SM;32|
        ((|left| #1=(|String|)) (|right| #1#)
         (% (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|FMT1D;matrix;2SM;32!0| (VECTOR |right| |left| %))))) 

(SDEFUN |FMT1D;matrix;2SM;32!0| ((|prec| NIL) (|args| NIL) ($$ NIL))
        (PROG (% |left| |right|)
          (LETT % (QREFELT $$ 2))
          (LETT |left| (QREFELT $$ 1))
          (LETT |right| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|entries| NIL))
                   (SEQ
                    (LETT |entries|
                          (SPADCALL |prec| (SPADCALL |args| (QREFELT % 74))
                                    (SPADCALL ", " (SPADCALL (QREFELT % 92))
                                              (SPADCALL
                                               (SPADCALL (QREFELT % 48))
                                               (QREFELT % 93))
                                              (QREFELT % 94))))
                    (EXIT
                     (SPADCALL (SPADCALL "matrix" |left| (QREFELT % 98))
                               |right| |entries| (QREFELT % 27))))))))) 

(SDEFUN |FMT1D;setOperatorHandlers!|
        ((|oh|
          (|OperatorHandlers|
           (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|)))))
         (%
          (|OperatorHandlers|
           (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))))
        (SPROG ((#1=#:G515 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SPADCALL |oh| 0 "NOTHING" (SPADCALL (QREFELT % 100))
                            (QREFELT % 102))
                  (SPADCALL |oh| 0 "%pi" (SPADCALL "%pi" (QREFELT % 103))
                            (QREFELT % 102))
                  (SPADCALL |oh| 0 "%e" (SPADCALL "%e" (QREFELT % 103))
                            (QREFELT % 102))
                  (SPADCALL |oh| 0 "%i" (SPADCALL "%i" (QREFELT % 103))
                            (QREFELT % 102))
                  (SPADCALL |oh| 0 "%Infinity"
                            (SPADCALL "%Infinity" (QREFELT % 103))
                            (QREFELT % 102))
                  (SPADCALL |oh| 0 "infinity"
                            (SPADCALL "%Infinity" (QREFELT % 103))
                            (QREFELT % 102))
                  (SPADCALL |oh| 0 "..." (SPADCALL "..." (QREFELT % 103))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "cos"
                            (SPADCALL "cos" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "cot"
                            (SPADCALL "cot" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "csc"
                            (SPADCALL "csc" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "log"
                            (SPADCALL "log" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "sec"
                            (SPADCALL "sec" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "sin"
                            (SPADCALL "sin" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "tan"
                            (SPADCALL "tan" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "cosh"
                            (SPADCALL "cosh" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "coth"
                            (SPADCALL "coth" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "csch"
                            (SPADCALL "csch" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "sech"
                            (SPADCALL "sech" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "sinh"
                            (SPADCALL "sinh" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "tanh"
                            (SPADCALL "tanh" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "acos"
                            (SPADCALL "acos" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "asin"
                            (SPADCALL "asin" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "atan"
                            (SPADCALL "atan" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "erf"
                            (SPADCALL "erf" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "Gamma"
                            (SPADCALL "Gamma" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 104))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "-"
                            (SPADCALL "-" 710 (SPADCALL 715 (QREFELT % 93))
                                      (QREFELT % 105))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "not"
                            (SPADCALL "not " 710 (SPADCALL 715 (QREFELT % 93))
                                      (QREFELT % 105))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "QUOTE"
                            (SPADCALL "quote" (SPADCALL (QREFELT % 92))
                                      (SPADCALL #2="(" #3=")"
                                                (SPADCALL
                                                 (SPADCALL (QREFELT % 48))
                                                 (QREFELT % 93))
                                                (QREFELT % 95))
                                      (QREFELT % 105))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "OVERBAR"
                            (SPADCALL (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 69))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "BOX"
                            (SPADCALL
                             (SPADCALL (SPADCALL (QREFELT % 48))
                                       (QREFELT % 93))
                             (QREFELT % 70))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "Aleph"
                            (SPADCALL "Aleph" (SPADCALL (QREFELT % 92))
                                      (SPADCALL #2# #3#
                                                (SPADCALL
                                                 (SPADCALL (QREFELT % 48))
                                                 (QREFELT % 93))
                                                (QREFELT % 95))
                                      (QREFELT % 105))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "BRACE"
                            (SPADCALL "set" (SPADCALL (QREFELT % 92))
                                      (SPADCALL "[" "]"
                                                (SPADCALL
                                                 (SPADCALL (QREFELT % 48))
                                                 (QREFELT % 93))
                                                (QREFELT % 95))
                                      (QREFELT % 105))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "BRACKET"
                            (SPADCALL "[" "]"
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 95))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "PAREN"
                            (SPADCALL "(" ")"
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 95))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "ROOT"
                            (SPADCALL "sqrt" (SPADCALL (QREFELT % 92))
                                      (SPADCALL #2# #3#
                                                (SPADCALL
                                                 (SPADCALL (QREFELT % 48))
                                                 (QREFELT % 93))
                                                (QREFELT % 95))
                                      (QREFELT % 105))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "SEGMENT"
                            (SPADCALL "" " .. " (SPADCALL 990 (QREFELT % 93))
                                      (QREFELT % 95))
                            (QREFELT % 102))
                  (SPADCALL |oh| 1 "STRING"
                            (SPADCALL "\"" "\""
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 95))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "rem"
                            (SPADCALL " rem " 810 (SPADCALL 811 (QREFELT % 93))
                                      (SPADCALL 811 (QREFELT % 93))
                                      (QREFELT % 106))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "quo"
                            (SPADCALL " quo " 810 (SPADCALL 811 (QREFELT % 93))
                                      (SPADCALL 811 (QREFELT % 93))
                                      (QREFELT % 106))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "exquo"
                            (SPADCALL " exquo " 810
                                      (SPADCALL 811 (QREFELT % 93))
                                      (SPADCALL 811 (QREFELT % 93))
                                      (QREFELT % 106))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "^"
                            (SPADCALL 950 (SPADCALL 960 (QREFELT % 93))
                                      (SPADCALL 960 (QREFELT % 93))
                                      (QREFELT % 87))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "/"
                            (SPADCALL 910 (SPADCALL 910 (QREFELT % 93))
                                      (SPADCALL 910 (QREFELT % 93))
                                      (QREFELT % 88))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "OVER"
                            (SPADCALL 910 (SPADCALL 910 (QREFELT % 93))
                                      (SPADCALL 910 (QREFELT % 93))
                                      (QREFELT % 88))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "SLASH"
                            (SPADCALL 910 (SPADCALL 910 (QREFELT % 93))
                                      (SPADCALL 910 (QREFELT % 93))
                                      (QREFELT % 89))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "ZAG" (ELT % 91) (QREFELT % 102))
                  (SPADCALL |oh| 2 "BINOMIAL" (ELT % 90) (QREFELT % 102))
                  (SPADCALL |oh| 2 "PRIME"
                            (SPADCALL (SPADCALL (QREFELT % 92)) (QREFELT % 85))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "ROOT"
                            (SPADCALL 970
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 72))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "SUB" (SPADCALL 950 (QREFELT % 77))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "SEGMENT"
                            (SPADCALL " .. " 100 (SPADCALL 100 (QREFELT % 93))
                                      (SPADCALL 100 (QREFELT % 93))
                                      (QREFELT % 106))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "TENSOR"
                            (SPADCALL "tensor" (SPADCALL (QREFELT % 92))
                                      (SPADCALL #4="(" #5=")"
                                                (SPADCALL #6=", "
                                                          (SPADCALL
                                                           (QREFELT % 92))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (QREFELT % 48))
                                                           (QREFELT % 93))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (QREFELT % 48))
                                                           (QREFELT % 93))
                                                          (QREFELT % 106))
                                                (QREFELT % 95))
                                      (QREFELT % 105))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "EQUATNUM"
                            (SPADCALL "\\EQUATNUM" (SPADCALL (QREFELT % 92))
                                      (SPADCALL #4# #5#
                                                (SPADCALL #6#
                                                          (SPADCALL
                                                           (QREFELT % 92))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (QREFELT % 48))
                                                           (QREFELT % 93))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (QREFELT % 48))
                                                           (QREFELT % 93))
                                                          (QREFELT % 106))
                                                (QREFELT % 95))
                                      (QREFELT % 105))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "OVERLABEL"
                            (SPADCALL "\\OVERLABEL" (SPADCALL (QREFELT % 92))
                                      (SPADCALL #4# #5#
                                                (SPADCALL #6#
                                                          (SPADCALL
                                                           (QREFELT % 92))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (QREFELT % 48))
                                                           (QREFELT % 93))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (QREFELT % 48))
                                                           (QREFELT % 93))
                                                          (QREFELT % 106))
                                                (QREFELT % 95))
                                      (QREFELT % 105))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "=="
                            (SPADCALL "==" 400 (SPADCALL 401 (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "="
                            (SPADCALL "=" 400 (SPADCALL 400 (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "~="
                            (SPADCALL "~= " 400 (SPADCALL 400 (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "<"
                            (SPADCALL "<" 400 (SPADCALL 400 (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 ">"
                            (SPADCALL ">" 400 (SPADCALL 400 (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "<="
                            (SPADCALL "<=" 400 (SPADCALL 400 (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 ">="
                            (SPADCALL ">=" 400 (SPADCALL 400 (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "and"
                            (SPADCALL " and " 300 (SPADCALL 300 (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "or"
                            (SPADCALL " or " 200 (SPADCALL 200 (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "LET"
                            (SPADCALL ":=" 125 (SPADCALL 125 (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "->"
                            (SPADCALL "->" 1001 (SPADCALL 1001 (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "~>"
                            (SPADCALL " ~> " 100 (SPADCALL 100 (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "+->"
                            (SPADCALL " +-> " 100 (SPADCALL 100 (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "|"
                            (SPADCALL " | " 100 (SPADCALL 100 (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "SIGMA" (SPADCALL 750 (QREFELT % 60))
                            (QREFELT % 102))
                  (SPADCALL |oh| 2 "PI" (SPADCALL 750 (QREFELT % 61))
                            (QREFELT % 102))
                  (SPADCALL |oh| 3 "SIGMA2" (SPADCALL 750 (QREFELT % 60))
                            (QREFELT % 102))
                  (SPADCALL |oh| 3 "PI2" (SPADCALL 750 (QREFELT % 61))
                            (QREFELT % 102))
                  (SPADCALL |oh| 3 "INTSIGN" (SPADCALL 700 (QREFELT % 57))
                            (QREFELT % 102))
                  (SPADCALL |oh| -1 "+"
                            (SPADCALL "+" "-" 700 (SPADCALL 700 (QREFELT % 93))
                                      (QREFELT % 107))
                            (QREFELT % 102))
                  (SPADCALL |oh| -1 "-"
                            (SPADCALL "+" "-" 700 (SPADCALL 700 (QREFELT % 93))
                                      (QREFELT % 107))
                            (QREFELT % 102))
                  (SPADCALL |oh| -1 "*"
                            (SPADCALL "*" 800 (SPADCALL 800 (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| -1 "AGGLST"
                            (SPADCALL ", " (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| -1 "AGGSET"
                            (SPADCALL "; " (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| -1 "CONCAT"
                            (SPADCALL "" (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| -1 "CONCATB"
                            (SPADCALL " " (SPADCALL (QREFELT % 92))
                                      (SPADCALL (SPADCALL (QREFELT % 48))
                                                (QREFELT % 93))
                                      (QREFELT % 94))
                            (QREFELT % 102))
                  (SPADCALL |oh| -1 "ALTSUPERSUB" (SPADCALL 900 (QREFELT % 78))
                            (QREFELT % 102))
                  (SPADCALL |oh| -1 "SUPERSUB" (SPADCALL 900 (QREFELT % 76))
                            (QREFELT % 102))
                  (SPADCALL |oh| -1 "SC"
                            (SPADCALL
                             (SPADCALL (SPADCALL (QREFELT % 48))
                                       (QREFELT % 93))
                             (QREFELT % 97))
                            (QREFELT % 102))
                  (SPADCALL |oh| -1 "VCONCAT"
                            (SPADCALL
                             (SPADCALL (SPADCALL (QREFELT % 48))
                                       (QREFELT % 93))
                             (QREFELT % 96))
                            (QREFELT % 102))
                  (SPADCALL |oh| -1 "ROW"
                            (SPADCALL "[" "]"
                                      (SPADCALL ", " (SPADCALL (QREFELT % 92))
                                                (SPADCALL
                                                 (SPADCALL (QREFELT % 48))
                                                 (QREFELT % 93))
                                                (QREFELT % 94))
                                      (QREFELT % 95))
                            (QREFELT % 102))
                  (SPADCALL |oh| -1 "MATRIX" (SPADCALL "[" "]" (QREFELT % 99))
                            (QREFELT % 102))
                  (SPADCALL |oh| -1 "theMap" (ELT % 68) (QREFELT % 102))
                  (EXIT (PROGN (LETT #1# |oh|) (GO #7=#:G514)))))
                #7# (EXIT #1#)))) 

(SDEFUN |FMT1D;operatorHandlers;Oh;34|
        ((%
          (|OperatorHandlers|
           (|Mapping| (|OutputBox|) (|Integer|) (|List| (|OutputForm|))))))
        (QREFELT % 109)) 

(DECLAIM (NOTINLINE |Format1D;|)) 

(DEFUN |Format1D;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Format1D|))
          (LETT % (GETREFV 111))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Format1D| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 109
                    (|FMT1D;setOperatorHandlers!| (SPADCALL (QREFELT % 108))
                     %))
          %))) 

(DEFUN |Format1D| ()
  (SPROG NIL
         (PROG (#1=#:G518)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Format1D|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Format1D|
                             (LIST (CONS NIL (CONS 1 (|Format1D;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Format1D|)))))))))) 

(MAKEPROP '|Format1D| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|OutputForm|) |FMT1D;coerce;%Of;1|
              (|OutputBox|) (0 . |empty|) (|String|)
              |FMT1D;defaultPrologue;SOb;2| |FMT1D;defaultEpilogue;SOb;3|
              (|CharacterClass|) (4 . |charClass|) (|Integer|) (9 . |position|)
              (|UniversalSegment| 15) (16 . SEGMENT) (22 . |elt|) (|Character|)
              (28 . |elt|) (34 . |concat|) (40 . |char|) (45 . |remove|)
              (51 . |box|) |FMT1D;formatFloat;SOb;5|
              |FMT1D;parenthesize;2S2Ob;9| |FMT1D;formatString;SOb;6|
              |FMT1D;formatSymbol;SOb;7| |FMT1D;formatFunctionSymbol;SOb;8|
              (|List| %) (56 . |hconcat|) (|Boolean|) (61 . =)
              (|OutputFormTools|) (67 . |atom?|) (|List| 6) (72 . |arguments|)
              (77 . |operator|) (82 . |elt|) (88 . |empty|) (|Symbol|)
              (92 . |is_symbol?|) (|NonNegativeInteger|) (98 . ~=)
              (104 . |elt|) (110 . |One|) (114 . |minPrecedence|)
              (118 . |formatExpression|) (124 . |empty?|) (|List| 8)
              (129 . |concat|) (135 . |formatFunction|) (141 . ~=)
              (147 . |first|) (|Mapping| 8 15 37) |FMT1D;integral;IM;12|
              (152 . |#|) (157 . =) |FMT1D;sum;IM;14| |FMT1D;product;IM;15|
              (163 . |string?|) (168 . |symbol?|) (|List| 10) (173 . |lines|)
              (178 . |position|) (184 . |position|) |FMT1D;theMap;ILOb;16|
              |FMT1D;overbar;I2M;17| |FMT1D;box;2M;18| (191 . |one?|)
              |FMT1D;nthRoot;I3M;19| (196 . |string|) (201 . |rest|)
              (206 . |empty?|) |FMT1D;scripts;IM;21| |FMT1D;subscript;IM;22|
              |FMT1D;altsupersub;IM;23| (211 . +) (217 . |numberOfPrimes|)
              (222 . |Zero|) (226 . |Zero|) (230 . <) (236 . |convert|)
              |FMT1D;prime;IM;24| (241 . |parenthesizeIf|) |FMT1D;power;I3M;25|
              |FMT1D;fraction;I3M;26| |FMT1D;slash;I3M;27|
              |FMT1D;binomial;ILOb;28| |FMT1D;zag;ILOb;29|
              (247 . |maxPrecedence|) (251 . |formatExpression|) (256 . |nary|)
              (263 . |bracket|) |FMT1D;vconcat;2M;30| |FMT1D;pile;2M;31|
              (270 . |concat|) |FMT1D;matrix;2SM;32| (276 . |nothing|)
              (|OperatorHandlers| 56) (280 . |setHandler!|)
              (288 . |formatConstant|) (293 . |function|) (300 . |prefix|)
              (307 . |infix|) (315 . |naryPlus|) (323 . |new|) '|operatorData|
              |FMT1D;operatorHandlers;Oh;34|)
           '#(|zag| 327 |vconcat| 333 |theMap| 338 |sum| 344 |subscript| 349
              |slash| 354 |scripts| 361 |product| 366 |prime| 371 |prefix| 376
              |precedence| 383 |power| 389 |pile| 396 |parenthesizeIf| 401
              |parenthesize| 407 |overbar| 414 |operatorHandlers| 420
              |numberOfPrimes| 424 |nthRoot| 429 |nothing| 436 |naryPlus| 440
              |nary| 448 |minPrecedence| 455 |maxPrecedence| 459 |matrix| 463
              |integral| 469 |infix| 474 |function| 482 |fraction| 489
              |formatSymbol| 496 |formatString| 501 |formatInteger| 506
              |formatFunctionSymbol| 511 |formatFunction| 516 |formatFloat| 522
              |formatExpression| 527 |formatConstant| 543 |defaultPrologue| 548
              |defaultEpilogue| 553 |coerce| 558 |bracket| 563 |box| 570
              |binomial| 575 |binary| 581 |altsupersub| 587)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0))
                 (CONS '#(|FormatterCategory&| NIL)
                       (CONS '#((|FormatterCategory|) (|CoercibleTo| 6))
                             (|makeByteWordVec2| 110
                                                 '(0 8 0 9 1 13 0 10 14 3 10 15
                                                   13 0 15 16 2 17 0 15 15 18 2
                                                   10 0 0 17 19 2 10 20 0 15 21
                                                   2 10 0 0 20 22 1 20 0 10 23
                                                   2 10 0 20 0 24 1 8 0 10 25 1
                                                   8 0 31 32 2 6 33 0 0 34 1 35
                                                   33 6 36 1 35 37 6 38 1 35 6
                                                   6 39 2 6 0 0 31 40 0 6 0 41
                                                   2 35 33 6 42 43 2 44 33 0 0
                                                   45 2 37 6 0 15 46 0 15 0 47
                                                   0 0 15 48 2 0 8 6 15 49 1 8
                                                   33 0 50 2 51 0 0 8 52 2 0 8
                                                   8 51 53 2 6 33 0 0 54 1 37 6
                                                   0 55 1 37 44 0 58 2 44 33 0
                                                   0 59 1 35 33 6 62 1 35 33 6
                                                   63 1 8 64 0 65 2 10 15 20 0
                                                   66 3 10 15 20 0 15 67 1 15
                                                   33 0 71 1 35 10 6 73 1 37 0
                                                   0 74 1 37 33 0 75 2 15 0 0 0
                                                   79 1 0 15 6 80 0 44 0 81 0
                                                   15 0 82 2 15 33 0 0 83 1 15
                                                   10 0 84 2 0 8 33 8 86 0 0 15
                                                   92 1 0 56 15 93 3 0 56 10 15
                                                   56 94 3 0 56 10 10 56 95 2
                                                   10 0 0 0 98 0 0 56 100 4 101
                                                   56 0 15 10 56 102 1 0 56 10
                                                   103 3 0 56 10 15 56 104 3 0
                                                   56 10 15 56 105 4 0 56 10 15
                                                   56 56 106 4 0 56 10 10 15 56
                                                   107 0 101 0 108 2 0 8 15 37
                                                   91 1 0 56 56 96 2 0 8 15 37
                                                   68 1 0 56 15 60 1 0 56 15 77
                                                   3 0 56 15 56 56 89 1 0 56 15
                                                   76 1 0 56 15 61 1 0 56 15 85
                                                   3 0 56 10 15 56 105 2 0 56
                                                   15 56 1 3 0 56 15 56 56 87 1
                                                   0 56 56 97 2 0 8 33 8 86 3 0
                                                   8 10 10 8 27 2 0 56 15 56 69
                                                   0 0 101 110 1 0 15 6 80 3 0
                                                   56 15 56 56 72 0 0 56 100 4
                                                   0 56 10 10 15 56 107 3 0 56
                                                   10 15 56 94 0 0 15 48 0 0 15
                                                   92 2 0 56 10 10 99 1 0 56 15
                                                   57 4 0 56 10 15 56 56 106 3
                                                   0 56 10 15 56 104 3 0 56 15
                                                   56 56 88 1 0 8 10 29 1 0 8
                                                   10 28 1 0 8 15 1 1 0 8 10 30
                                                   2 0 8 8 51 53 1 0 8 10 26 2
                                                   0 8 6 15 49 1 0 8 6 1 1 0 56
                                                   15 93 1 0 56 10 103 1 0 8 10
                                                   11 1 0 8 10 12 1 0 6 0 7 3 0
                                                   56 10 10 56 95 1 0 56 56 70
                                                   2 0 8 15 37 90 2 0 56 56 56
                                                   1 1 0 56 15 78)))))
           '|lookupComplete|)) 
