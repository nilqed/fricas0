
(PUT '|ISTRING;new;NniC$;1| '|SPADreplace| '|make_full_CVEC|) 

(SDEFUN |ISTRING;new;NniC$;1|
        ((|n| |NonNegativeInteger|) (|c| |Character|) ($ $))
        (|make_full_CVEC| |n| |c|)) 

(PUT '|ISTRING;empty;$;2| '|SPADreplace| '(XLAM NIL (|make_full_CVEC| 0))) 

(SDEFUN |ISTRING;empty;$;2| (($ $)) (|make_full_CVEC| 0)) 

(SDEFUN |ISTRING;empty?;$B;3| ((|s| $) ($ |Boolean|)) (EQL (QCSIZE |s|) 0)) 

(PUT '|ISTRING;#;$Nni;4| '|SPADreplace| 'QCSIZE) 

(SDEFUN |ISTRING;#;$Nni;4| ((|s| $) ($ |NonNegativeInteger|)) (QCSIZE |s|)) 

(PUT '|ISTRING;=;2$B;5| '|SPADreplace| 'EQUAL) 

(SDEFUN |ISTRING;=;2$B;5| ((|s| $) (|t| $) ($ |Boolean|)) (EQUAL |s| |t|)) 

(PUT '|ISTRING;<;2$B;6| '|SPADreplace| '(XLAM (|s| |t|) (CGREATERP |t| |s|))) 

(SDEFUN |ISTRING;<;2$B;6| ((|s| $) (|t| $) ($ |Boolean|)) (CGREATERP |t| |s|)) 

(PUT '|ISTRING;concat;3$;7| '|SPADreplace| 'STRCONC) 

(SDEFUN |ISTRING;concat;3$;7| ((|s| $) (|t| $) ($ $)) (STRCONC |s| |t|)) 

(PUT '|ISTRING;copy;2$;8| '|SPADreplace| 'COPY-SEQ) 

(SDEFUN |ISTRING;copy;2$;8| ((|s| $) ($ $)) (COPY-SEQ |s|)) 

(SDEFUN |ISTRING;insert;2$I$;9| ((|s| $) (|t| $) (|i| |Integer|) ($ $))
        (SPADCALL
         (SPADCALL
          (SPADCALL |s| (SPADCALL (QREFELT $ 6) (- |i| 1) (QREFELT $ 20))
                    (QREFELT $ 21))
          |t| (QREFELT $ 16))
         (SPADCALL |s| (SPADCALL |i| (QREFELT $ 22)) (QREFELT $ 21))
         (QREFELT $ 16))) 

(SDEFUN |ISTRING;coerce;$Of;10| ((|s| $) ($ |OutputForm|))
        (SPADCALL |s| (QREFELT $ 26))) 

(SDEFUN |ISTRING;minIndex;$I;11| ((|s| $) ($ |Integer|)) (QREFELT $ 6)) 

(SDEFUN |ISTRING;upperCase!;2$;12| ((|s| $) ($ $))
        (SPADCALL (ELT $ 31) |s| (QREFELT $ 33))) 

(SDEFUN |ISTRING;lowerCase!;2$;13| ((|s| $) ($ $))
        (SPADCALL (ELT $ 36) |s| (QREFELT $ 33))) 

(SDEFUN |ISTRING;latex;$S;14| ((|s| $) ($ |String|))
        (STRCONC "\\mbox{``" (STRCONC |s| "''}"))) 

(SDEFUN |ISTRING;replace;$Us2$;15|
        ((|s| $) (|sg| |UniversalSegment| (|Integer|)) (|t| $) ($ $))
        (SPROG
         ((|k| NIL) (#1=#:G1902 NIL) (|i| NIL) (#2=#:G1901 NIL)
          (#3=#:G1900 NIL) (|r| ($)) (#4=#:G1894 NIL) (|h| (|Integer|))
          (|n| #5=(|NonNegativeInteger|)) (|m| #5#) (|l| (|Integer|)))
         (SEQ
          (LETT |l| (- (SPADCALL |sg| (QREFELT $ 39)) (QREFELT $ 6))
                . #6=(|ISTRING;replace;$Us2$;15|))
          (LETT |m| (SPADCALL |s| (QREFELT $ 13)) . #6#)
          (LETT |n| (SPADCALL |t| (QREFELT $ 13)) . #6#)
          (LETT |h|
                (COND
                 ((SPADCALL |sg| (QREFELT $ 40))
                  (- (SPADCALL |sg| (QREFELT $ 41)) (QREFELT $ 6)))
                 ('T (- (SPADCALL |s| (QREFELT $ 42)) (QREFELT $ 6))))
                . #6#)
          (COND
           ((OR (OR (< |l| 0) (>= |h| |m|)) (< |h| (- |l| 1)))
            (EXIT (|error| "index out of range"))))
          (LETT |r|
                (SPADCALL
                 (PROG1 (LETT #4# (+ (- |m| (+ (- |h| |l|) 1)) |n|) . #6#)
                   (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #4#))
                 (STR_ELT "   " 0) (QREFELT $ 9))
                . #6#)
          (SEQ (LETT |i| 0 . #6#) (LETT #3# (- |l| 1) . #6#) (LETT |k| 0 . #6#)
               G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ (EXIT (STR_SETELT |r| |k| (STR_ELT |s| |i|))))
               (LETT |k| (PROG1 (|inc_SI| |k|) (LETT |i| (|inc_SI| |i|) . #6#))
                     . #6#)
               (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| 0 . #6#) (LETT #2# (- |n| 1) . #6#)
               (LETT |k| |k| . #6#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (EXIT (STR_SETELT |r| |k| (STR_ELT |t| |i|))))
               (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (|inc_SI| |i|) . #6#))
                     . #6#)
               (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| (+ |h| 1) . #6#) (LETT #1# (- |m| 1) . #6#)
               (LETT |k| |k| . #6#) G190 (COND ((> |i| #1#) (GO G191)))
               (SEQ (EXIT (STR_SETELT |r| |k| (STR_ELT |s| |i|))))
               (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1) . #6#)) . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(SDEFUN |ISTRING;qsetelt!;$I2C;16|
        ((|s| $) (|i| |Integer|) (|c| . #1=(|Character|)) ($ . #1#))
        (STR_SETELT |s| (- |i| (QREFELT $ 6)) |c|)) 

(SDEFUN |ISTRING;setelt!;$I2C;17|
        ((|s| $) (|i| |Integer|) (|c| . #1=(|Character|)) ($ . #1#))
        (COND
         ((OR (< |i| (QREFELT $ 6))
              (SPADCALL |i| (SPADCALL |s| (QREFELT $ 42)) (QREFELT $ 45)))
          (|error| "index out of range"))
         ('T (STR_SETELT |s| (- |i| (QREFELT $ 6)) |c|)))) 

(SDEFUN |ISTRING;substring?;2$IB;18|
        ((|part| $) (|whole| $) (|startpos| |Integer|) ($ |Boolean|))
        (SPROG
         ((#1=#:G1913 NIL) (#2=#:G1914 NIL) (#3=#:G1915 NIL) (|ip| NIL)
          (|iw| NIL) (|nw| (|Integer|)) (|np| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |np| (QCSIZE |part|) . #4=(|ISTRING;substring?;2$IB;18|))
                (LETT |nw| (QCSIZE |whole|) . #4#)
                (LETT |startpos| (- |startpos| (QREFELT $ 6)) . #4#)
                (EXIT
                 (COND ((< |startpos| 0) (|error| "index out of bounds"))
                       ((SPADCALL |np| (- |nw| |startpos|) (QREFELT $ 45)) NIL)
                       ('T
                        (SEQ
                         (SEQ
                          (EXIT
                           (SEQ (LETT |iw| |startpos| . #4#)
                                (LETT |ip| 0 . #4#) (LETT #3# (- |np| 1) . #4#)
                                G190 (COND ((|greater_SI| |ip| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((NULL
                                     (|eql_SI| (STR_ELT |part| |ip|)
                                               (STR_ELT |whole| |iw|)))
                                    (PROGN
                                     (LETT #1#
                                           (PROGN
                                            (LETT #2# NIL . #4#)
                                            (GO #5=#:G1912))
                                           . #4#)
                                     (GO #6=#:G1908))))))
                                (LETT |ip|
                                      (PROG1 (|inc_SI| |ip|)
                                        (LETT |iw| (+ |iw| 1) . #4#))
                                      . #4#)
                                (GO G190) G191 (EXIT NIL)))
                          #6# (EXIT #1#))
                         (EXIT 'T)))))))
          #5# (EXIT #2#)))) 

(SDEFUN |ISTRING;position;2$2I;19|
        ((|s| $) (|t| $) (|startpos| . #1=(|Integer|)) ($ . #1#))
        (SPROG ((|r| (|Integer|)))
               (SEQ
                (LETT |startpos| (- |startpos| (QREFELT $ 6))
                      . #2=(|ISTRING;position;2$2I;19|))
                (EXIT
                 (COND ((< |startpos| 0) (|error| "index out of bounds"))
                       ((>= |startpos| (QCSIZE |t|)) (- (QREFELT $ 6) 1))
                       (#3='T
                        (SEQ (LETT |r| (STRPOS |s| |t| |startpos| NIL) . #2#)
                             (EXIT
                              (COND ((EQ |r| NIL) (- (QREFELT $ 6) 1))
                                    (#3# (+ |r| (QREFELT $ 6)))))))))))) 

(SDEFUN |ISTRING;position;C$2I;20|
        ((|c| |Character|) (|t| $) (|startpos| . #1=(|Integer|)) ($ . #1#))
        (SPROG ((#2=#:G1926 NIL) (#3=#:G1927 NIL) (|r| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |startpos| (- |startpos| (QREFELT $ 6))
                        . #4=(|ISTRING;position;C$2I;20|))
                  (EXIT
                   (COND ((< |startpos| 0) (|error| "index out of bounds"))
                         ((>= |startpos| (QCSIZE |t|)) (- (QREFELT $ 6) 1))
                         ('T
                          (SEQ
                           (SEQ (LETT |r| |startpos| . #4#)
                                (LETT #3# (|sub_SI| (QCSIZE |t|) 1) . #4#) G190
                                (COND ((> |r| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((|eql_SI| (STR_ELT |t| |r|) |c|)
                                    (PROGN
                                     (LETT #2# (+ |r| (QREFELT $ 6)) . #4#)
                                     (GO #5=#:G1925))))))
                                (LETT |r| (+ |r| 1) . #4#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (- (QREFELT $ 6) 1))))))))
                #5# (EXIT #2#)))) 

(SDEFUN |ISTRING;position;Cc$2I;21|
        ((|cc| |CharacterClass|) (|t| $) (|startpos| . #1=(|Integer|))
         ($ . #1#))
        (SPROG ((#2=#:G1934 NIL) (#3=#:G1935 NIL) (|r| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |startpos| (- |startpos| (QREFELT $ 6))
                        . #4=(|ISTRING;position;Cc$2I;21|))
                  (EXIT
                   (COND ((< |startpos| 0) (|error| "index out of bounds"))
                         ((>= |startpos| (QCSIZE |t|)) (- (QREFELT $ 6) 1))
                         ('T
                          (SEQ
                           (SEQ (LETT |r| |startpos| . #4#)
                                (LETT #3# (|sub_SI| (QCSIZE |t|) 1) . #4#) G190
                                (COND ((> |r| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL (STR_ELT |t| |r|) |cc|
                                              (QREFELT $ 50))
                                    (PROGN
                                     (LETT #2# (+ |r| (QREFELT $ 6)) . #4#)
                                     (GO #5=#:G1933))))))
                                (LETT |r| (+ |r| 1) . #4#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (- (QREFELT $ 6) 1))))))))
                #5# (EXIT #2#)))) 

(SDEFUN |ISTRING;suffix?;2$B;22| ((|s| $) (|t| $) ($ |Boolean|))
        (SPROG ((|n| #1=(|Integer|)) (|m| #1#))
               (SEQ
                (LETT |m| (SPADCALL |s| (QREFELT $ 42))
                      . #2=(|ISTRING;suffix?;2$B;22|))
                (LETT |n| (SPADCALL |t| (QREFELT $ 42)) . #2#)
                (EXIT
                 (COND ((SPADCALL |m| |n| (QREFELT $ 45)) NIL)
                       ('T
                        (SPADCALL |s| |t| (- (+ (QREFELT $ 6) |n|) |m|)
                                  (QREFELT $ 47)))))))) 

(SDEFUN |ISTRING;split;$CL;23| ((|s| $) (|c| |Character|) ($ |List| $))
        (SPROG
         ((|l| (|List| $)) (#1=#:G1948 NIL) (|i| NIL) (|j| (|Integer|))
          (#2=#:G1947 NIL) (|n| (|Integer|)))
         (SEQ
          (LETT |n| (SPADCALL |s| (QREFELT $ 42))
                . #3=(|ISTRING;split;$CL;23|))
          (SEQ (LETT |i| (QREFELT $ 6) . #3#) (LETT #2# |n| . #3#) G190
               (COND
                ((OR (> |i| #2#)
                     (NULL (|eql_SI| (SPADCALL |s| |i| (QREFELT $ 53)) |c|)))
                 (GO G191)))
               (SEQ (EXIT 0)) (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
               (EXIT NIL))
          (LETT |l| (SPADCALL (QREFELT $ 55)) . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| |n| (QREFELT $ 56))
                    (>= (LETT |j| (SPADCALL |c| |s| |i| (QREFELT $ 49)) . #3#)
                        (QREFELT $ 6)))
                   ('T NIL)))
                 (GO G191)))
               (SEQ
                (LETT |l|
                      (SPADCALL
                       (SPADCALL |s| (SPADCALL |i| (- |j| 1) (QREFELT $ 20))
                                 (QREFELT $ 21))
                       |l| (QREFELT $ 57))
                      . #3#)
                (EXIT
                 (SEQ (LETT |i| |j| . #3#) (LETT #1# |n| . #3#) G190
                      (COND
                       ((OR (> |i| #1#)
                            (NULL
                             (|eql_SI| (SPADCALL |s| |i| (QREFELT $ 53)) |c|)))
                        (GO G191)))
                      (SEQ (EXIT 0)) (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
                      (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL |i| |n| (QREFELT $ 56))
            (LETT |l|
                  (SPADCALL
                   (SPADCALL |s| (SPADCALL |i| |n| (QREFELT $ 20))
                             (QREFELT $ 21))
                   |l| (QREFELT $ 57))
                  . #3#)))
          (EXIT (SPADCALL |l| (QREFELT $ 58)))))) 

(SDEFUN |ISTRING;split;$CcL;24| ((|s| $) (|cc| |CharacterClass|) ($ |List| $))
        (SPROG
         ((|l| (|List| $)) (#1=#:G1956 NIL) (|i| NIL) (|j| (|Integer|))
          (#2=#:G1955 NIL) (|n| (|Integer|)))
         (SEQ
          (LETT |n| (SPADCALL |s| (QREFELT $ 42))
                . #3=(|ISTRING;split;$CcL;24|))
          (SEQ (LETT |i| (QREFELT $ 6) . #3#) (LETT #2# |n| . #3#) G190
               (COND
                ((OR (> |i| #2#)
                     (NULL
                      (SPADCALL (SPADCALL |s| |i| (QREFELT $ 53)) |cc|
                                (QREFELT $ 50))))
                 (GO G191)))
               (SEQ (EXIT 0)) (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
               (EXIT NIL))
          (LETT |l| (SPADCALL (QREFELT $ 55)) . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| |n| (QREFELT $ 56))
                    (>= (LETT |j| (SPADCALL |cc| |s| |i| (QREFELT $ 51)) . #3#)
                        (QREFELT $ 6)))
                   ('T NIL)))
                 (GO G191)))
               (SEQ
                (LETT |l|
                      (SPADCALL
                       (SPADCALL |s| (SPADCALL |i| (- |j| 1) (QREFELT $ 20))
                                 (QREFELT $ 21))
                       |l| (QREFELT $ 57))
                      . #3#)
                (EXIT
                 (SEQ (LETT |i| |j| . #3#) (LETT #1# |n| . #3#) G190
                      (COND
                       ((OR (> |i| #1#)
                            (NULL
                             (SPADCALL (SPADCALL |s| |i| (QREFELT $ 53)) |cc|
                                       (QREFELT $ 50))))
                        (GO G191)))
                      (SEQ (EXIT 0)) (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
                      (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL |i| |n| (QREFELT $ 56))
            (LETT |l|
                  (SPADCALL
                   (SPADCALL |s| (SPADCALL |i| |n| (QREFELT $ 20))
                             (QREFELT $ 21))
                   |l| (QREFELT $ 57))
                  . #3#)))
          (EXIT (SPADCALL |l| (QREFELT $ 58)))))) 

(SDEFUN |ISTRING;leftTrim;$Cc$;25| ((|s| $) (|cc| |CharacterClass|) ($ $))
        (SPROG ((#1=#:G1960 NIL) (|i| NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |s| (QREFELT $ 42))
                      . #2=(|ISTRING;leftTrim;$Cc$;25|))
                (SEQ (LETT |i| (QREFELT $ 6) . #2#) (LETT #1# |n| . #2#) G190
                     (COND
                      ((OR (> |i| #1#)
                           (NULL
                            (SPADCALL (SPADCALL |s| |i| (QREFELT $ 53)) |cc|
                                      (QREFELT $ 50))))
                       (GO G191)))
                     (SEQ (EXIT 0)) (LETT |i| (+ |i| 1) . #2#) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SPADCALL |s| (SPADCALL |i| |n| (QREFELT $ 20))
                           (QREFELT $ 21)))))) 

(SDEFUN |ISTRING;rightTrim;$Cc$;26| ((|s| $) (|cc| |CharacterClass|) ($ $))
        (SPROG ((#1=#:G1964 NIL) (|j| NIL))
               (SEQ
                (SEQ
                 (LETT |j| (SPADCALL |s| (QREFELT $ 42))
                       . #2=(|ISTRING;rightTrim;$Cc$;26|))
                 (LETT #1# (QREFELT $ 6) . #2#) G190
                 (COND
                  ((OR (< |j| #1#)
                       (NULL
                        (SPADCALL (SPADCALL |s| |j| (QREFELT $ 53)) |cc|
                                  (QREFELT $ 50))))
                   (GO G191)))
                 (SEQ (EXIT 0)) (LETT |j| (+ |j| -1) . #2#) (GO G190) G191
                 (EXIT NIL))
                (EXIT
                 (SPADCALL |s|
                           (SPADCALL (SPADCALL |s| (QREFELT $ 28)) |j|
                                     (QREFELT $ 20))
                           (QREFELT $ 21)))))) 

(SDEFUN |ISTRING;concat;L$;27| ((|l| |List| $) ($ $))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G1973 NIL) (|s| NIL) (|t| ($))
          (#2=#:G1966 NIL) (#3=#:G1965 #4=(|NonNegativeInteger|))
          (#5=#:G1967 #4#) (#6=#:G1972 NIL))
         (SEQ
          (LETT |t|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #7=(|ISTRING;concat;L$;27|))
                  (SEQ (LETT |s| NIL . #7#) (LETT #6# |l| . #7#) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |s| (CAR #6#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #5# (SPADCALL |s| (QREFELT $ 13)) . #7#)
                          (COND (#2# (LETT #3# (+ #3# #5#) . #7#))
                                ('T
                                 (PROGN
                                  (LETT #3# #5# . #7#)
                                  (LETT #2# 'T . #7#)))))))
                       (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#2# #3#) ('T 0)))
                 (STR_ELT "   " 0) (QREFELT $ 9))
                . #7#)
          (LETT |i| (QREFELT $ 6) . #7#)
          (SEQ (LETT |s| NIL . #7#) (LETT #1# |l| . #7#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #7#) NIL))
                 (GO G191)))
               (SEQ (SPADCALL |t| |s| |i| (QREFELT $ 64))
                    (EXIT
                     (LETT |i| (+ |i| (SPADCALL |s| (QREFELT $ 13))) . #7#)))
               (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |t|)))) 

(SDEFUN |ISTRING;copyInto!;2$I$;28| ((|y| $) (|x| $) (|s| |Integer|) ($ $))
        (SPROG ((|n| #1=(|NonNegativeInteger|)) (|m| #1#))
               (SEQ
                (LETT |m| (SPADCALL |x| (QREFELT $ 13))
                      . #2=(|ISTRING;copyInto!;2$I$;28|))
                (LETT |n| (SPADCALL |y| (QREFELT $ 13)) . #2#)
                (LETT |s| (- |s| (QREFELT $ 6)) . #2#)
                (COND
                 ((OR (< |s| 0) (SPADCALL (+ |s| |m|) |n| (QREFELT $ 45)))
                  (EXIT (|error| "index out of range"))))
                (RPLACSTR |y| |s| |m| |x| 0 |m|) (EXIT |y|)))) 

(SDEFUN |ISTRING;qelt;$IC;29| ((|s| $) (|i| |Integer|) ($ |Character|))
        (STR_ELT |s| (- |i| (QREFELT $ 6)))) 

(SDEFUN |ISTRING;elt;$IC;30| ((|s| $) (|i| |Integer|) ($ |Character|))
        (COND
         ((OR (< |i| (QREFELT $ 6))
              (SPADCALL |i| (SPADCALL |s| (QREFELT $ 42)) (QREFELT $ 45)))
          (|error| "index out of range"))
         ('T (STR_ELT |s| (- |i| (QREFELT $ 6)))))) 

(SDEFUN |ISTRING;elt;$Us$;31|
        ((|s| $) (|sg| |UniversalSegment| (|Integer|)) ($ $))
        (SPROG ((|h| #1=(|Integer|)) (|l| #1#))
               (SEQ
                (LETT |l| (- (SPADCALL |sg| (QREFELT $ 39)) (QREFELT $ 6))
                      . #2=(|ISTRING;elt;$Us$;31|))
                (LETT |h|
                      (COND
                       ((SPADCALL |sg| (QREFELT $ 40))
                        (- (SPADCALL |sg| (QREFELT $ 41)) (QREFELT $ 6)))
                       ('T (- (SPADCALL |s| (QREFELT $ 42)) (QREFELT $ 6))))
                      . #2#)
                (COND
                 ((OR (< |l| 0) (>= |h| (SPADCALL |s| (QREFELT $ 13))))
                  (EXIT (|error| "index out of bounds"))))
                (EXIT (SUBSTRING |s| |l| (MAX 0 (+ (- |h| |l|) 1))))))) 

(SDEFUN |ISTRING;hashUpdate!;Hs$Hs;32|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(SDEFUN |ISTRING;match?;2$CB;33|
        ((|pattern| $) (|target| $) (|dontcare| |Character|) ($ |Boolean|))
        (SPROG
         ((|q| (|NonNegativeInteger|)) (#1=#:G1991 NIL)
          (|p| #2=(|NonNegativeInteger|)) (|i| #2#) (#3=#:G2000 NIL)
          (#4=#:G1990 NIL) (|s| ($)) (#5=#:G1989 NIL) (#6=#:G1986 NIL)
          (|m| (|Integer|)) (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL |pattern| (QREFELT $ 42))
                  . #7=(|ISTRING;match?;2$CB;33|))
            (LETT |p|
                  (PROG1
                      (LETT #6#
                            (SPADCALL |dontcare| |pattern|
                                      (LETT |m|
                                            (SPADCALL |pattern| (QREFELT $ 28))
                                            . #7#)
                                      (QREFELT $ 49))
                            . #7#)
                    (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #6#))
                  . #7#)
            (EXIT
             (COND
              ((EQL |p| (- |m| 1))
               (SPADCALL |pattern| |target| (QREFELT $ 14)))
              ('T
               (SEQ
                (COND
                 ((SPADCALL |p| |m| (QREFELT $ 69))
                  (COND
                   ((NULL
                     (SPADCALL
                      (SPADCALL |pattern|
                                (SPADCALL |m| (- |p| 1) (QREFELT $ 20))
                                (QREFELT $ 21))
                      |target| (QREFELT $ 70)))
                    (EXIT NIL)))))
                (LETT |i| |p| . #7#)
                (LETT |q|
                      (PROG1
                          (LETT #5#
                                (SPADCALL |dontcare| |pattern| (+ |p| 1)
                                          (QREFELT $ 49))
                                . #7#)
                        (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #5#))
                      . #7#)
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |q| (- |m| 1) (QREFELT $ 69)))
                       (GO G191)))
                     (SEQ
                      (LETT |s|
                            (SPADCALL |pattern|
                                      (SPADCALL (+ |p| 1) (- |q| 1)
                                                (QREFELT $ 20))
                                      (QREFELT $ 21))
                            . #7#)
                      (LETT |i|
                            (PROG1
                                (LETT #4#
                                      (SPADCALL |s| |target| |i|
                                                (QREFELT $ 48))
                                      . #7#)
                              (|check_subtype2| (>= #4# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #4#))
                            . #7#)
                      (EXIT
                       (COND
                        ((EQL |i| (- |m| 1))
                         (PROGN (LETT #3# NIL . #7#) (GO #8=#:G1999)))
                        ('T
                         (SEQ
                          (LETT |i| (+ |i| (SPADCALL |s| (QREFELT $ 13)))
                                . #7#)
                          (LETT |p| |q| . #7#)
                          (EXIT
                           (LETT |q|
                                 (PROG1
                                     (LETT #1#
                                           (SPADCALL |dontcare| |pattern|
                                                     (+ |q| 1) (QREFELT $ 49))
                                           . #7#)
                                   (|check_subtype2| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                 . #7#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL |p| |n| (QREFELT $ 69))
                  (COND
                   ((NULL
                     (SPADCALL
                      (SPADCALL |pattern|
                                (SPADCALL (+ |p| 1) |n| (QREFELT $ 20))
                                (QREFELT $ 21))
                      |target| (QREFELT $ 52)))
                    (EXIT NIL)))))
                (EXIT 'T)))))))
          #8# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |IndexedString;|)) 

(DEFUN |IndexedString| (#1=#:G2010)
  (SPROG NIL
         (PROG (#2=#:G2011)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|IndexedString|)
                                               '|domainEqualList|)
                    . #3=(|IndexedString|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|IndexedString;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedString|)))))))))) 

(DEFUN |IndexedString;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G2007 NIL) (#2=#:G2008 NIL) (#3=#:G2009 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #4=(|IndexedString|))
    (LETT |dv$| (LIST '|IndexedString| DV$1) . #4#)
    (LETT $ (GETREFV 83) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Character|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Character|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Character|)
                                                       '(|BasicType|))
                                        (LETT #3#
                                              (|HasCategory| (|Character|)
                                                             '(|Comparable|))
                                              . #4#)
                                        (OR #3#
                                            (|HasCategory| (|Character|)
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| (|Character|)
                                                             '(|SetCategory|))
                                              . #4#)
                                        (AND
                                         (|HasCategory| (|Character|)
                                                        '(|Evalable|
                                                          (|Character|)))
                                         #2#)
                                        (OR
                                         (|HasCategory| (|Character|)
                                                        '(|BasicType|))
                                         #3#
                                         (|HasCategory| (|Character|)
                                                        '(|OrderedSet|))
                                         #2#)
                                        (OR #3#
                                            (|HasCategory| (|Character|)
                                                           '(|OrderedSet|))
                                            #2#)
                                        (LETT #1#
                                              (|HasCategory| (|Character|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #4#)
                                        (OR #1# #3#
                                            (|HasCategory| (|Character|)
                                                           '(|OrderedSet|))
                                            #2#)))
                    . #4#))
    (|haddProp| |$ConstructorCache| '|IndexedString| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 4096))
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 8192))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| (|Character|) '(|BasicType|))
         (|augmentPredVector| $ 16384))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 32768))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| $ '(|shallowlyMutable|))
         (|HasCategory| (|Character|) '(|OrderedSet|))
         (|augmentPredVector| $ 65536))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| (|Character|) '(|OrderedSet|))
         (|augmentPredVector| $ 131072))
    (AND
     (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #3#)
         (AND (|HasCategory| $ '(|finiteAggregate|))
              (|HasCategory| (|Character|) '(|OrderedSet|))))
     (|augmentPredVector| $ 262144))
    (AND
     (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #3#)
         (AND (|HasCategory| $ '(|finiteAggregate|))
              (|HasCategory| (|Character|) '(|OrderedSet|)))
         #2#)
     (|augmentPredVector| $ 524288))
    (AND
     (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #3#)
         (AND (|HasCategory| $ '(|finiteAggregate|))
              (|HasCategory| (|Character|) '(|OrderedSet|)))
         #1#)
     (|augmentPredVector| $ 1048576))
    (AND
     (OR
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|HasCategory| (|Character|) '(|BasicType|)))
      (AND (|HasCategory| $ '(|finiteAggregate|)) #3#)
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|HasCategory| (|Character|) '(|OrderedSet|)))
      #2#)
     (|augmentPredVector| $ 2097152))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|IndexedString| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (|Character|) |ISTRING;new;NniC$;1| |ISTRING;empty;$;2|
              (|Boolean|) |ISTRING;empty?;$B;3| |ISTRING;#;$Nni;4|
              |ISTRING;=;2$B;5| |ISTRING;<;2$B;6| |ISTRING;concat;3$;7|
              |ISTRING;copy;2$;8| (|Integer|) (|UniversalSegment| 18)
              (0 . SEGMENT) |ISTRING;elt;$Us$;31| (6 . SEGMENT)
              |ISTRING;insert;2$I$;9| (|String|) (|OutputForm|)
              (11 . |outputForm|) |ISTRING;coerce;$Of;10|
              |ISTRING;minIndex;$I;11| (|CharacterClass|) (16 . |upperCase|)
              (20 . |upperCase|) (|Mapping| 8 8) (25 . |map!|)
              |ISTRING;upperCase!;2$;12| (31 . |lowerCase|) (35 . |lowerCase|)
              |ISTRING;lowerCase!;2$;13| |ISTRING;latex;$S;14| (40 . |low|)
              (45 . |hasHi|) (50 . |high|) (55 . |maxIndex|)
              |ISTRING;replace;$Us2$;15| |ISTRING;qsetelt!;$I2C;16| (60 . >)
              |ISTRING;setelt!;$I2C;17| |ISTRING;substring?;2$IB;18|
              |ISTRING;position;2$2I;19| |ISTRING;position;C$2I;20|
              (66 . |member?|) |ISTRING;position;Cc$2I;21|
              |ISTRING;suffix?;2$B;22| |ISTRING;elt;$IC;30| (|List| $$)
              (72 . |empty|) (76 . <=) (82 . |concat|) (88 . |reverse!|)
              (|List| $) |ISTRING;split;$CL;23| |ISTRING;split;$CcL;24|
              |ISTRING;leftTrim;$Cc$;25| |ISTRING;rightTrim;$Cc$;26|
              |ISTRING;copyInto!;2$I$;28| |ISTRING;concat;L$;27|
              |ISTRING;qelt;$IC;29| (|HashState|)
              |ISTRING;hashUpdate!;Hs$Hs;32| (93 . ~=) (99 . |prefix?|)
              |ISTRING;match?;2$CB;33| (|List| 8) (|List| 74) (|Equation| 8)
              (|Mapping| 8 8 8) (|Mapping| 11 8 8) (|SingleInteger|)
              (|InputForm|) (|Mapping| 11 8) (|Void|) (|Union| 8 '"failed")
              (|List| 18))
           '#(~= 105 |upperCase!| 111 |upperCase| 116 |trim| 121 |swap!| 133
              |suffix?| 140 |substring?| 146 |split| 153 |sorted?| 165 |sort!|
              176 |sort| 187 |smaller?| 198 |size?| 204 |setelt!| 210 |select|
              224 |sample| 230 |rightTrim| 234 |reverse!| 246 |reverse| 251
              |replace| 256 |removeDuplicates| 263 |remove| 268 |reduce| 280
              |qsetelt!| 301 |qelt| 308 |prefix?| 314 |position| 320 |parts|
              353 |new| 358 |more?| 364 |minIndex| 370 |min| 375 |merge| 381
              |members| 394 |member?| 399 |maxIndex| 405 |max| 410 |match?| 416
              |map!| 423 |map| 429 |lowerCase!| 442 |lowerCase| 447 |less?| 452
              |leftTrim| 458 |latex| 470 |insert| 475 |indices| 489 |index?|
              494 |hashUpdate!| 500 |hash| 506 |first| 511 |find| 522 |fill!|
              528 |every?| 534 |eval| 540 |eq?| 566 |entry?| 572 |entries| 578
              |empty?| 583 |empty| 588 |elt| 592 |delete| 617 |count| 629
              |copyInto!| 641 |copy| 648 |convert| 653 |construct| 658 |concat|
              663 |coerce| 686 |any?| 696 >= 702 > 708 = 714 <= 720 < 726 |#|
              732)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 0 1 0 6 0 0 8 10 0 0 0 0 0 8 9 12 1
                                  2))
            (CONS
             '#(|StringAggregate&| |OneDimensionalArrayAggregate&| NIL
                |LinearAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| NIL |Aggregate&|
                |EltableAggregate&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                NIL |InnerEvalable&| |BasicType&| NIL |PartialOrder&| NIL)
             (CONS
              '#((|StringAggregate|) (|OneDimensionalArrayAggregate| 8)
                 (|FiniteLinearAggregate| 8) (|LinearAggregate| 8)
                 (|IndexedAggregate| 18 8) (|Collection| 8) (|OrderedSet|)
                 (|HomogeneousAggregate| 8) (|Comparable|) (|Aggregate|)
                 (|EltableAggregate| 18 8) (|Evalable| 8) (|SetCategory|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Eltable| 19 $$)
                 (|Type|) (|Eltable| 18 8) (|InnerEvalable| 8 8) (|BasicType|)
                 (|CoercibleTo| 25) (|PartialOrder|) (|ConvertibleTo| 78))
              (|makeByteWordVec2| 82
                                  '(2 19 0 18 18 20 1 19 0 18 22 1 25 0 24 26 0
                                    29 0 30 1 8 0 0 31 2 0 0 32 0 33 0 29 0 35
                                    1 8 0 0 36 1 19 18 0 39 1 19 11 0 40 1 19
                                    18 0 41 1 0 18 0 42 2 18 11 0 0 45 2 29 11
                                    8 0 50 0 54 0 55 2 18 11 0 0 56 2 54 0 2 0
                                    57 1 54 0 0 58 2 18 11 0 0 69 2 0 11 0 0 70
                                    2 22 11 0 0 1 1 0 0 0 34 1 0 0 0 1 2 15 0 0
                                    8 1 2 0 0 0 29 1 3 13 80 0 18 18 1 2 0 11 0
                                    0 52 3 0 11 0 0 18 47 2 0 59 0 8 60 2 0 59
                                    0 29 61 1 18 11 0 1 2 14 11 76 0 1 1 17 0 0
                                    1 2 16 0 76 0 1 1 18 0 0 1 2 14 0 76 0 1 2
                                    19 11 0 0 1 2 0 11 0 7 1 3 13 8 0 19 8 1 3
                                    13 8 0 18 8 46 2 14 0 79 0 1 0 0 0 1 2 15 0
                                    0 8 1 2 0 0 0 29 63 1 16 0 0 1 1 14 0 0 1 3
                                    0 0 0 19 0 43 1 15 0 0 1 2 15 0 8 0 1 2 14
                                    0 79 0 1 4 15 8 75 0 8 8 1 2 14 8 75 0 1 3
                                    14 8 75 0 8 1 3 13 8 0 18 8 44 2 0 8 0 18
                                    66 2 0 11 0 0 70 3 15 18 8 0 18 49 2 15 18
                                    8 0 1 2 14 18 79 0 1 3 0 18 0 0 18 48 3 0
                                    18 29 0 18 51 1 14 72 0 1 2 0 0 7 8 9 2 0
                                    11 0 7 1 1 3 18 0 28 2 18 0 0 0 1 2 18 0 0
                                    0 1 3 14 0 76 0 0 1 1 14 72 0 1 2 15 11 8 0
                                    1 1 3 18 0 42 2 18 0 0 0 1 3 0 11 0 0 8 71
                                    2 13 0 32 0 33 3 0 0 75 0 0 1 2 0 0 32 0 1
                                    1 0 0 0 37 1 0 0 0 1 2 0 11 0 7 1 2 15 0 0
                                    8 1 2 0 0 0 29 62 1 20 24 0 38 3 0 0 8 0 18
                                    1 3 0 0 0 0 18 23 1 0 82 0 1 2 0 11 18 0 1
                                    2 20 67 67 0 68 1 20 77 0 1 1 3 8 0 1 2 0 0
                                    0 7 1 2 0 81 79 0 1 2 13 0 0 8 1 2 14 11 79
                                    0 1 3 8 0 0 72 72 1 3 8 0 0 8 8 1 2 8 0 0
                                    73 1 2 8 0 0 74 1 2 0 11 0 0 1 2 15 11 8 0
                                    1 1 0 72 0 1 1 0 11 0 12 0 0 0 10 2 0 0 0 0
                                    1 2 0 0 0 19 21 2 0 8 0 18 53 3 0 8 0 18 8
                                    1 2 0 0 0 19 1 2 0 0 0 18 1 2 15 7 8 0 1 2
                                    14 7 79 0 1 3 16 0 0 0 18 64 1 0 0 0 17 1 2
                                    78 0 1 1 0 0 72 1 1 0 0 59 65 2 0 0 0 0 16
                                    2 0 0 0 8 1 2 0 0 8 0 1 1 21 25 0 27 1 0 0
                                    8 1 2 14 11 79 0 1 2 18 11 0 0 1 2 18 11 0
                                    0 1 2 22 11 0 0 14 2 18 11 0 0 1 2 18 11 0
                                    0 15 1 14 7 0 13)))))
           '|lookupComplete|)) 
