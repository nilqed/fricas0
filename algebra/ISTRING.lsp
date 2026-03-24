
(PUT '|ISTRING;new;NniC%;1| '|SPADreplace| '|make_string_code|) 

(SDEFUN |ISTRING;new;NniC%;1|
        ((|n| (|NonNegativeInteger|)) (|c| (|Character|)) (% (%)))
        (|make_string_code| |n| |c|)) 

(PUT '|ISTRING;empty;%;2| '|SPADreplace| '(XLAM NIL (|filler_spaces| 0))) 

(SDEFUN |ISTRING;empty;%;2| ((% (%))) (|filler_spaces| 0)) 

(SDEFUN |ISTRING;empty?;%B;3| ((|s| (%)) (% (|Boolean|))) (EQL (QCSIZE |s|) 0)) 

(PUT '|ISTRING;#;%Nni;4| '|SPADreplace| 'QCSIZE) 

(SDEFUN |ISTRING;#;%Nni;4| ((|s| (%)) (% (|NonNegativeInteger|))) (QCSIZE |s|)) 

(PUT '|ISTRING;=;2%B;5| '|SPADreplace| 'EQUAL) 

(SDEFUN |ISTRING;=;2%B;5| ((|s| (%)) (|t| (%)) (% (|Boolean|))) (EQUAL |s| |t|)) 

(PUT '|ISTRING;<;2%B;6| '|SPADreplace| '(XLAM (|s| |t|) (CGREATERP |t| |s|))) 

(SDEFUN |ISTRING;<;2%B;6| ((|s| (%)) (|t| (%)) (% (|Boolean|)))
        (CGREATERP |t| |s|)) 

(PUT '|ISTRING;concat;3%;7| '|SPADreplace| 'STRCONC) 

(SDEFUN |ISTRING;concat;3%;7| ((|s| (%)) (|t| (%)) (% (%))) (STRCONC |s| |t|)) 

(PUT '|ISTRING;copy;2%;8| '|SPADreplace| 'COPY-SEQ) 

(SDEFUN |ISTRING;copy;2%;8| ((|s| (%)) (% (%))) (COPY-SEQ |s|)) 

(SDEFUN |ISTRING;insert;2%I%;9| ((|s| (%)) (|t| (%)) (|i| (|Integer|)) (% (%)))
        (SPADCALL
         (SPADCALL
          (SPADCALL |s| (SPADCALL (QREFELT % 6) (- |i| 1) (QREFELT % 20))
                    (QREFELT % 21))
          |t| (QREFELT % 16))
         (SPADCALL |s| (SPADCALL |i| (QREFELT % 22)) (QREFELT % 21))
         (QREFELT % 16))) 

(SDEFUN |ISTRING;coerce;%Of;10| ((|s| (%)) (% (|OutputForm|)))
        (SPADCALL |s| (QREFELT % 26))) 

(SDEFUN |ISTRING;minIndex;%I;11| ((|s| (%)) (% (|Integer|))) (QREFELT % 6)) 

(SDEFUN |ISTRING;upperCase!;2%;12| ((|s| (%)) (% (%)))
        (SPADCALL (ELT % 31) |s| (QREFELT % 33))) 

(SDEFUN |ISTRING;lowerCase!;2%;13| ((|s| (%)) (% (%)))
        (SPADCALL (ELT % 36) |s| (QREFELT % 33))) 

(SDEFUN |ISTRING;replace;%Us2%;14|
        ((|s| (%)) (|sg| (|UniversalSegment| (|Integer|))) (|t| (%)) (% (%)))
        (SPROG
         ((|k| NIL) (#1=#:G999 NIL) (|i| NIL) (#2=#:G998 NIL) (#3=#:G997 NIL)
          (|r| (%)) (#4=#:G988 NIL) (|h| (|Integer|))
          (|n| #5=(|NonNegativeInteger|)) (|m| #5#) (|l| (|Integer|)))
         (SEQ (LETT |l| (- (SPADCALL |sg| (QREFELT % 38)) (QREFELT % 6)))
              (LETT |m| (SPADCALL |s| (QREFELT % 13)))
              (LETT |n| (SPADCALL |t| (QREFELT % 13)))
              (LETT |h|
                    (COND
                     ((SPADCALL |sg| (QREFELT % 39))
                      (- (SPADCALL |sg| (QREFELT % 40)) (QREFELT % 6)))
                     ('T (- (SPADCALL |s| (QREFELT % 41)) (QREFELT % 6)))))
              (COND
               ((OR (OR (< |l| 0) (>= |h| |m|)) (< |h| (- |l| 1)))
                (EXIT (|error| "index out of range"))))
              (LETT |r|
                    (SPADCALL
                     (PROG1 (LETT #4# (+ (- |m| (+ (- |h| |l|) 1)) |n|))
                       (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #4#))
                     (SPADCALL (QREFELT % 42)) (QREFELT % 9)))
              (SEQ (LETT |i| 0) (LETT #3# (- |l| 1)) (LETT |k| 0) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (EXIT (STR_SETELT |r| |k| (STR_ELT |s| |i|))))
                   (LETT |k| (PROG1 (|inc_SI| |k|) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 0) (LETT #2# (- |n| 1)) (LETT |k| |k|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (EXIT (STR_SETELT |r| |k| (STR_ELT |t| |i|))))
                   (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| (+ |h| 1)) (LETT #1# (- |m| 1)) (LETT |k| |k|)
                   G190 (COND ((> |i| #1#) (GO G191)))
                   (SEQ (EXIT (STR_SETELT |r| |k| (STR_ELT |s| |i|))))
                   (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |ISTRING;qsetelt!;%I2C;15|
        ((|s| (%)) (|i| (|Integer|)) (|c| #1=(|Character|)) (% #1#))
        (STR_SETELT |s| (- |i| (QREFELT % 6)) |c|)) 

(SDEFUN |ISTRING;setelt!;%I2C;16|
        ((|s| (%)) (|i| (|Integer|)) (|c| #1=(|Character|)) (% #1#))
        (COND
         ((OR (< |i| (QREFELT % 6)) (> |i| (SPADCALL |s| (QREFELT % 41))))
          (|error| "index out of range"))
         ('T (STR_SETELT |s| (- |i| (QREFELT % 6)) |c|)))) 

(SDEFUN |ISTRING;substring?;2%IB;17|
        ((|part| (%)) (|whole| (%)) (|startpos| (|Integer|)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G1011 NIL) (#2=#:G1012 NIL) (#3=#:G1013 NIL) (|ip| NIL)
          (|iw| NIL) (|nw| (|Integer|)) (|np| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |np| (QCSIZE |part|)) (LETT |nw| (QCSIZE |whole|))
                (LETT |startpos| (- |startpos| (QREFELT % 6)))
                (EXIT
                 (COND ((< |startpos| 0) (|error| "index out of bounds"))
                       ((> |np| (- |nw| |startpos|)) NIL)
                       ('T
                        (SEQ
                         (SEQ
                          (EXIT
                           (SEQ (LETT |iw| |startpos|) (LETT |ip| 0)
                                (LETT #3# (- |np| 1)) G190
                                (COND ((|greater_SI| |ip| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((NULL
                                     (|eql_SI| (STR_ELT |part| |ip|)
                                               (STR_ELT |whole| |iw|)))
                                    (PROGN
                                     (LETT #1#
                                           (PROGN
                                            (LETT #2# NIL)
                                            (GO #4=#:G1010)))
                                     (GO #5=#:G1006))))))
                                (LETT |ip|
                                      (PROG1 (|inc_SI| |ip|)
                                        (LETT |iw| (+ |iw| 1))))
                                (GO G190) G191 (EXIT NIL)))
                          #5# (EXIT #1#))
                         (EXIT 'T)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |ISTRING;position;2%2I;18|
        ((|s| (%)) (|t| (%)) (|startpos| #1=(|Integer|)) (% #1#))
        (SPROG ((|r| (|None|)))
               (SEQ (LETT |startpos| (- |startpos| (QREFELT % 6)))
                    (EXIT
                     (COND ((< |startpos| 0) (|error| "index out of bounds"))
                           ((>= |startpos| (QCSIZE |t|)) (- (QREFELT % 6) 1))
                           (#2='T
                            (SEQ (LETT |r| (STRPOS |s| |t| |startpos| NIL))
                                 (EXIT
                                  (COND ((EQ |r| NIL) (- (QREFELT % 6) 1))
                                        (#2# (+ |r| (QREFELT % 6)))))))))))) 

(SDEFUN |ISTRING;position;C%2I;19|
        ((|c| (|Character|)) (|t| (%)) (|startpos| #1=(|Integer|)) (% #1#))
        (SPROG ((#2=#:G1025 NIL) (#3=#:G1026 NIL) (|r| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |startpos| (- |startpos| (QREFELT % 6)))
                      (EXIT
                       (COND ((< |startpos| 0) (|error| "index out of bounds"))
                             ((>= |startpos| (QCSIZE |t|)) (- (QREFELT % 6) 1))
                             ('T
                              (SEQ
                               (SEQ (LETT |r| |startpos|)
                                    (LETT #3# (|sub_SI| (QCSIZE |t|) 1)) G190
                                    (COND ((> |r| #3#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((|eql_SI| (STR_ELT |t| |r|) |c|)
                                        (PROGN
                                         (LETT #2# (+ |r| (QREFELT % 6)))
                                         (GO #4=#:G1024))))))
                                    (LETT |r| (+ |r| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (- (QREFELT % 6) 1))))))))
                #4# (EXIT #2#)))) 

(SDEFUN |ISTRING;position;Cc%2I;20|
        ((|cc| (|CharacterClass|)) (|t| (%)) (|startpos| #1=(|Integer|))
         (% #1#))
        (SPROG ((#2=#:G1034 NIL) (#3=#:G1035 NIL) (|r| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |startpos| (- |startpos| (QREFELT % 6)))
                      (EXIT
                       (COND ((< |startpos| 0) (|error| "index out of bounds"))
                             ((>= |startpos| (QCSIZE |t|)) (- (QREFELT % 6) 1))
                             ('T
                              (SEQ
                               (SEQ (LETT |r| |startpos|)
                                    (LETT #3# (|sub_SI| (QCSIZE |t|) 1)) G190
                                    (COND ((> |r| #3#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL (STR_ELT |t| |r|) |cc|
                                                  (QREFELT % 49))
                                        (PROGN
                                         (LETT #2# (+ |r| (QREFELT % 6)))
                                         (GO #4=#:G1033))))))
                                    (LETT |r| (+ |r| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (- (QREFELT % 6) 1))))))))
                #4# (EXIT #2#)))) 

(SDEFUN |ISTRING;suffix?;2%B;21| ((|s| (%)) (|t| (%)) (% (|Boolean|)))
        (SPROG ((|n| #1=(|Integer|)) (|m| #1#))
               (SEQ (LETT |m| (SPADCALL |s| (QREFELT % 41)))
                    (LETT |n| (SPADCALL |t| (QREFELT % 41)))
                    (EXIT
                     (COND ((> |m| |n|) NIL)
                           ('T
                            (SPADCALL |s| |t| (- (+ (QREFELT % 6) |n|) |m|)
                                      (QREFELT % 46)))))))) 

(SDEFUN |ISTRING;split;%CL;22| ((|s| (%)) (|c| (|Character|)) (% (|List| %)))
        (SPROG
         ((|l| (|List| %)) (#1=#:G1048 NIL) (|i| NIL) (|j| (|Integer|))
          (#2=#:G1047 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| (SPADCALL |s| (QREFELT % 41)))
              (SEQ (LETT |i| (QREFELT % 6)) (LETT #2# |n|) G190
                   (COND
                    ((OR (> |i| #2#)
                         (NULL
                          (|eql_SI| (SPADCALL |s| |i| (QREFELT % 52)) |c|)))
                     (GO G191)))
                   (SEQ (EXIT 0)) (LETT |i| (+ |i| 1)) (GO G190) G191
                   (EXIT NIL))
              (LETT |l| (SPADCALL (QREFELT % 54)))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((<= |i| |n|)
                        (>= (LETT |j| (SPADCALL |c| |s| |i| (QREFELT % 48)))
                            (QREFELT % 6)))
                       ('T NIL)))
                     (GO G191)))
                   (SEQ
                    (LETT |l|
                          (SPADCALL
                           (SPADCALL |s|
                                     (SPADCALL |i| (- |j| 1) (QREFELT % 20))
                                     (QREFELT % 21))
                           |l| (QREFELT % 55)))
                    (EXIT
                     (SEQ (LETT |i| |j|) (LETT #1# |n|) G190
                          (COND
                           ((OR (> |i| #1#)
                                (NULL
                                 (|eql_SI| (SPADCALL |s| |i| (QREFELT % 52))
                                           |c|)))
                            (GO G191)))
                          (SEQ (EXIT 0)) (LETT |i| (+ |i| 1)) (GO G190) G191
                          (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((<= |i| |n|)
                (LETT |l|
                      (SPADCALL
                       (SPADCALL |s| (SPADCALL |i| |n| (QREFELT % 20))
                                 (QREFELT % 21))
                       |l| (QREFELT % 55)))))
              (EXIT (SPADCALL |l| (QREFELT % 56)))))) 

(SDEFUN |ISTRING;split;%CcL;23|
        ((|s| (%)) (|cc| (|CharacterClass|)) (% (|List| %)))
        (SPROG
         ((|l| (|List| %)) (#1=#:G1059 NIL) (|i| NIL) (|j| (|Integer|))
          (#2=#:G1058 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| (SPADCALL |s| (QREFELT % 41)))
              (SEQ (LETT |i| (QREFELT % 6)) (LETT #2# |n|) G190
                   (COND
                    ((OR (> |i| #2#)
                         (NULL
                          (SPADCALL (SPADCALL |s| |i| (QREFELT % 52)) |cc|
                                    (QREFELT % 49))))
                     (GO G191)))
                   (SEQ (EXIT 0)) (LETT |i| (+ |i| 1)) (GO G190) G191
                   (EXIT NIL))
              (LETT |l| (SPADCALL (QREFELT % 54)))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((<= |i| |n|)
                        (>= (LETT |j| (SPADCALL |cc| |s| |i| (QREFELT % 50)))
                            (QREFELT % 6)))
                       ('T NIL)))
                     (GO G191)))
                   (SEQ
                    (LETT |l|
                          (SPADCALL
                           (SPADCALL |s|
                                     (SPADCALL |i| (- |j| 1) (QREFELT % 20))
                                     (QREFELT % 21))
                           |l| (QREFELT % 55)))
                    (EXIT
                     (SEQ (LETT |i| |j|) (LETT #1# |n|) G190
                          (COND
                           ((OR (> |i| #1#)
                                (NULL
                                 (SPADCALL (SPADCALL |s| |i| (QREFELT % 52))
                                           |cc| (QREFELT % 49))))
                            (GO G191)))
                          (SEQ (EXIT 0)) (LETT |i| (+ |i| 1)) (GO G190) G191
                          (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((<= |i| |n|)
                (LETT |l|
                      (SPADCALL
                       (SPADCALL |s| (SPADCALL |i| |n| (QREFELT % 20))
                                 (QREFELT % 21))
                       |l| (QREFELT % 55)))))
              (EXIT (SPADCALL |l| (QREFELT % 56)))))) 

(SDEFUN |ISTRING;leftTrim;%Cc%;24|
        ((|s| (%)) (|cc| (|CharacterClass|)) (% (%)))
        (SPROG ((#1=#:G1064 NIL) (|i| NIL) (|n| (|Integer|)))
               (SEQ (LETT |n| (SPADCALL |s| (QREFELT % 41)))
                    (SEQ (LETT |i| (QREFELT % 6)) (LETT #1# |n|) G190
                         (COND
                          ((OR (> |i| #1#)
                               (NULL
                                (SPADCALL (SPADCALL |s| |i| (QREFELT % 52))
                                          |cc| (QREFELT % 49))))
                           (GO G191)))
                         (SEQ (EXIT 0)) (LETT |i| (+ |i| 1)) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (SPADCALL |s| (SPADCALL |i| |n| (QREFELT % 20))
                               (QREFELT % 21)))))) 

(SDEFUN |ISTRING;rightTrim;%Cc%;25|
        ((|s| (%)) (|cc| (|CharacterClass|)) (% (%)))
        (SPROG ((#1=#:G1069 NIL) (|j| NIL))
               (SEQ
                (SEQ (LETT |j| (SPADCALL |s| (QREFELT % 41)))
                     (LETT #1# (QREFELT % 6)) G190
                     (COND
                      ((OR (< |j| #1#)
                           (NULL
                            (SPADCALL (SPADCALL |s| |j| (QREFELT % 52)) |cc|
                                      (QREFELT % 49))))
                       (GO G191)))
                     (SEQ (EXIT 0)) (LETT |j| (+ |j| -1)) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SPADCALL |s|
                           (SPADCALL (SPADCALL |s| (QREFELT % 28)) |j|
                                     (QREFELT % 20))
                           (QREFELT % 21)))))) 

(SDEFUN |ISTRING;concat;L%;26| ((|l| (|List| %)) (% (%)))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G1079 NIL) (|s| NIL) (|t| (%))
          (#2=#:G1071 NIL) (#3=#:G1070 #4=(|NonNegativeInteger|))
          (#5=#:G1072 #4#) (#6=#:G1078 NIL))
         (SEQ
          (LETT |t|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |s| NIL) (LETT #6# |l|) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |s| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #5# (SPADCALL |s| (QREFELT % 13)))
                          (COND (#2# (LETT #3# (+ #3# #5#)))
                                ('T (PROGN (LETT #3# #5#) (LETT #2# 'T)))))))
                       (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                  (COND (#2# #3#) ('T 0)))
                 (SPADCALL (QREFELT % 42)) (QREFELT % 9)))
          (LETT |i| (QREFELT % 6))
          (SEQ (LETT |s| NIL) (LETT #1# |l|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (SPADCALL |t| |s| |i| (QREFELT % 62))
                    (EXIT (LETT |i| (+ |i| (SPADCALL |s| (QREFELT % 13))))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT |t|)))) 

(SDEFUN |ISTRING;copyInto!;2%I%;27|
        ((|y| (%)) (|x| (%)) (|s| (|Integer|)) (% (%)))
        (SPROG ((|n| #1=(|NonNegativeInteger|)) (|m| #1#))
               (SEQ (LETT |m| (SPADCALL |x| (QREFELT % 13)))
                    (LETT |n| (SPADCALL |y| (QREFELT % 13)))
                    (LETT |s| (- |s| (QREFELT % 6)))
                    (COND
                     ((OR (< |s| 0) (> (+ |s| |m|) |n|))
                      (EXIT (|error| "index out of range"))))
                    (RPLACSTR |y| |s| |m| |x| 0 |m|) (EXIT |y|)))) 

(SDEFUN |ISTRING;join;%L%;28| ((|sep| (%)) (|l| (|List| %)) (% (%)))
        (SPROG
         ((|i| (|NonNegativeInteger|)) (|t| (%)) (#1=#:G1093 NIL) (|s| NIL)
          (#2=#:G1084 NIL) (#3=#:G1083 #4=(|NonNegativeInteger|))
          (#5=#:G1085 #4#) (#6=#:G1092 NIL) (|lensep| #4#))
         (SEQ
          (COND ((SPADCALL |l| (QREFELT % 64)) (SPADCALL (QREFELT % 10)))
                (#7='T
                 (SEQ (LETT |lensep| (SPADCALL |sep| (QREFELT % 13)))
                      (LETT |t|
                            (SPADCALL
                             (+
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |s| NIL) (LETT #6# |l|) G190
                                    (COND
                                     ((OR (ATOM #6#)
                                          (PROGN (LETT |s| (CAR #6#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #5# (SPADCALL |s| (QREFELT % 13)))
                                       (COND (#2# (LETT #3# (+ #3# #5#)))
                                             ('T
                                              (PROGN
                                               (LETT #3# #5#)
                                               (LETT #2# 'T)))))))
                                    (LETT #6# (CDR #6#)) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#2# #3#) (#7# 0)))
                              (*
                               (SPADCALL (SPADCALL |l| (QREFELT % 65))
                                         (QREFELT % 66))
                               |lensep|))
                             (SPADCALL (QREFELT % 42)) (QREFELT % 9)))
                      (LETT |t|
                            (SPADCALL |t| (SPADCALL |l| (QREFELT % 67)) 1
                                      (QREFELT % 62)))
                      (LETT |i|
                            (+ 1
                               (SPADCALL (SPADCALL |l| (QREFELT % 67))
                                         (QREFELT % 13))))
                      (SEQ (LETT |s| NIL)
                           (LETT #1# (SPADCALL |l| (QREFELT % 65))) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |t| (SPADCALL |t| |sep| |i| (QREFELT % 62)))
                            (LETT |i| (+ |i| |lensep|))
                            (LETT |t| (SPADCALL |t| |s| |i| (QREFELT % 62)))
                            (EXIT
                             (LETT |i| (+ |i| (SPADCALL |s| (QREFELT % 13))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |t|))))))) 

(SDEFUN |ISTRING;qelt;%IC;29| ((|s| (%)) (|i| (|Integer|)) (% (|Character|)))
        (STR_ELT |s| (- |i| (QREFELT % 6)))) 

(SDEFUN |ISTRING;elt;%IC;30| ((|s| (%)) (|i| (|Integer|)) (% (|Character|)))
        (COND
         ((OR (< |i| (QREFELT % 6)) (> |i| (SPADCALL |s| (QREFELT % 41))))
          (|error| "index out of range"))
         ('T (STR_ELT |s| (- |i| (QREFELT % 6)))))) 

(SDEFUN |ISTRING;elt;%Us%;31|
        ((|s| (%)) (|sg| (|UniversalSegment| (|Integer|))) (% (%)))
        (SPROG ((|h| #1=(|Integer|)) (|l| #1#))
               (SEQ (LETT |l| (- (SPADCALL |sg| (QREFELT % 38)) (QREFELT % 6)))
                    (LETT |h|
                          (COND
                           ((SPADCALL |sg| (QREFELT % 39))
                            (- (SPADCALL |sg| (QREFELT % 40)) (QREFELT % 6)))
                           ('T
                            (- (SPADCALL |s| (QREFELT % 41)) (QREFELT % 6)))))
                    (COND
                     ((OR (< |l| 0) (>= |h| (SPADCALL |s| (QREFELT % 13))))
                      (EXIT (|error| "index out of bounds"))))
                    (EXIT (SUBSTRING |s| |l| (MAX 0 (+ (- |h| |l|) 1))))))) 

(SDEFUN |ISTRING;hashUpdate!;Hs%Hs;32|
        ((|hs| #1=(|HashState|)) (|s| (%)) (% #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(SDEFUN |ISTRING;match?;2%CB;33|
        ((|pattern| (%)) (|target| (%)) (|dontcare| (|Character|))
         (% (|Boolean|)))
        (SPROG
         ((|q| (|NonNegativeInteger|)) (#1=#:G1109 NIL)
          (|p| #2=(|NonNegativeInteger|)) (|i| #2#) (#3=#:G1118 NIL)
          (#4=#:G1108 NIL) (|s| (%)) (#5=#:G1106 NIL) (#6=#:G1103 NIL)
          (|m| (|Integer|)) (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |pattern| (QREFELT % 41)))
                (LETT |p|
                      (PROG1
                          (LETT #6#
                                (SPADCALL |dontcare| |pattern|
                                          (LETT |m|
                                                (SPADCALL |pattern|
                                                          (QREFELT % 28)))
                                          (QREFELT % 48)))
                        (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #6#)))
                (EXIT
                 (COND
                  ((EQL |p| (- |m| 1))
                   (SPADCALL |pattern| |target| (QREFELT % 14)))
                  ('T
                   (SEQ
                    (COND
                     ((SPADCALL |p| |m| (QREFELT % 72))
                      (COND
                       ((NULL
                         (SPADCALL
                          (SPADCALL |pattern|
                                    (SPADCALL |m| (- |p| 1) (QREFELT % 20))
                                    (QREFELT % 21))
                          |target| (QREFELT % 73)))
                        (EXIT NIL)))))
                    (LETT |i| |p|)
                    (LETT |q|
                          (PROG1
                              (LETT #5#
                                    (SPADCALL |dontcare| |pattern| (+ |p| 1)
                                              (QREFELT % 48)))
                            (|check_subtype2| (>= #5# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #5#)))
                    (SEQ G190
                         (COND
                          ((NULL (SPADCALL |q| (- |m| 1) (QREFELT % 72)))
                           (GO G191)))
                         (SEQ
                          (LETT |s|
                                (SPADCALL |pattern|
                                          (SPADCALL (+ |p| 1) (- |q| 1)
                                                    (QREFELT % 20))
                                          (QREFELT % 21)))
                          (LETT |i|
                                (PROG1
                                    (LETT #4#
                                          (SPADCALL |s| |target| |i|
                                                    (QREFELT % 47)))
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                          (EXIT
                           (COND
                            ((EQL |i| (- |m| 1))
                             (PROGN (LETT #3# NIL) (GO #7=#:G1117)))
                            ('T
                             (SEQ
                              (LETT |i| (+ |i| (SPADCALL |s| (QREFELT % 13))))
                              (LETT |p| |q|)
                              (EXIT
                               (LETT |q|
                                     (PROG1
                                         (LETT #1#
                                               (SPADCALL |dontcare| |pattern|
                                                         (+ |q| 1)
                                                         (QREFELT % 48)))
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|)
                                                         #1#)))))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (COND
                     ((SPADCALL |p| |n| (QREFELT % 72))
                      (COND
                       ((NULL
                         (SPADCALL
                          (SPADCALL |pattern|
                                    (SPADCALL (+ |p| 1) |n| (QREFELT % 20))
                                    (QREFELT % 21))
                          |target| (QREFELT % 51)))
                        (EXIT NIL)))))
                    (EXIT 'T)))))))
          #7# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |IndexedString;|)) 

(DEFUN |IndexedString;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G1125 NIL) (#2=#:G1126 NIL) (#3=#:G1127 NIL) (% NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT |dv$| (LIST '|IndexedString| DV$1))
    (LETT % (GETREFV 86))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Character|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Character|)
                                                       '(|Hashable|))
                                        (|HasCategory| (|Character|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Character|)
                                                       '(|BasicType|))
                                        (LETT #3#
                                              (|HasCategory| (|Character|)
                                                             '(|Comparable|)))
                                        (OR #3#
                                            (|HasCategory| (|Character|)
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| (|Character|)
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| (|Character|)
                                                        '(|Evalable|
                                                          (|Character|)))
                                         #2#)
                                        (OR #3#
                                            (|HasCategory| (|Character|)
                                                           '(|OrderedSet|))
                                            #2#)
                                        (OR
                                         (|HasCategory| (|Character|)
                                                        '(|BasicType|))
                                         #3#
                                         (|HasCategory| (|Character|)
                                                        '(|Hashable|))
                                         (|HasCategory| (|Character|)
                                                        '(|OrderedSet|))
                                         #2#)
                                        (LETT #1#
                                              (|HasCategory| (|Character|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #1# #3#
                                            (|HasCategory| (|Character|)
                                                           '(|OrderedSet|))
                                            #2#)))))
    (|haddProp| |$ConstructorCache| '|IndexedString| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 8192))
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 16384))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Character|) '(|BasicType|))
         (|augmentPredVector| % 32768))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 65536))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|HasCategory| (|Character|) '(|OrderedSet|))
         (|augmentPredVector| % 131072))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Character|) '(|OrderedSet|))
         (|augmentPredVector| % 262144))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #3#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Character|) '(|OrderedSet|))))
     (|augmentPredVector| % 524288))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #3#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Character|) '(|OrderedSet|)))
         #2#)
     (|augmentPredVector| % 1048576))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #3#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Character|) '(|OrderedSet|)))
         #1#)
     (|augmentPredVector| % 2097152))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Character|) '(|Hashable|))
         (|augmentPredVector| % 4194304))
    (AND
     (OR
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Character|) '(|BasicType|)))
      (AND (|HasCategory| % '(|finiteAggregate|)) #3#)
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Character|) '(|Hashable|)))
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Character|) '(|OrderedSet|)))
      #2#)
     (|augmentPredVector| % 8388608))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |IndexedString| (#1=#:G1128)
  (SPROG NIL
         (PROG (#2=#:G1129)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IndexedString|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|IndexedString;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedString|)))))))))) 

(MAKEPROP '|IndexedString| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (|Character|) |ISTRING;new;NniC%;1| |ISTRING;empty;%;2|
              (|Boolean|) |ISTRING;empty?;%B;3| |ISTRING;#;%Nni;4|
              |ISTRING;=;2%B;5| |ISTRING;<;2%B;6| |ISTRING;concat;3%;7|
              |ISTRING;copy;2%;8| (|Integer|) (|UniversalSegment| 18)
              (0 . SEGMENT) |ISTRING;elt;%Us%;31| (6 . SEGMENT)
              |ISTRING;insert;2%I%;9| (|String|) (|OutputForm|)
              (11 . |outputForm|) |ISTRING;coerce;%Of;10|
              |ISTRING;minIndex;%I;11| (|CharacterClass|) (16 . |upperCase|)
              (20 . |upperCase|) (|Mapping| 8 8) (25 . |map!|)
              |ISTRING;upperCase!;2%;12| (31 . |lowerCase|) (35 . |lowerCase|)
              |ISTRING;lowerCase!;2%;13| (40 . |low|) (45 . |hasHi|)
              (50 . |high|) (55 . |maxIndex|) (60 . |space|)
              |ISTRING;replace;%Us2%;14| |ISTRING;qsetelt!;%I2C;15|
              |ISTRING;setelt!;%I2C;16| |ISTRING;substring?;2%IB;17|
              |ISTRING;position;2%2I;18| |ISTRING;position;C%2I;19|
              (64 . |member?|) |ISTRING;position;Cc%2I;20|
              |ISTRING;suffix?;2%B;21| |ISTRING;elt;%IC;30| (|List| $$)
              (70 . |empty|) (74 . |concat|) (80 . |reverse!|) (|List| %)
              |ISTRING;split;%CL;22| |ISTRING;split;%CcL;23|
              |ISTRING;leftTrim;%Cc%;24| |ISTRING;rightTrim;%Cc%;25|
              |ISTRING;copyInto!;2%I%;27| |ISTRING;concat;L%;26|
              (85 . |empty?|) (90 . |rest|) (95 . |#|) (100 . |first|)
              |ISTRING;join;%L%;28| |ISTRING;qelt;%IC;29| (|HashState|)
              |ISTRING;hashUpdate!;Hs%Hs;32| (105 . ~=) (111 . |prefix?|)
              |ISTRING;match?;2%CB;33| (|List| 8) (|List| 18)
              (|Union| 8 '"failed") (|Mapping| 11 8) (|Mapping| 8 8 8)
              (|Mapping| 11 8 8) (|SingleInteger|) (|Equation| 8) (|List| 82)
              (|Void|) (|InputForm|))
           '#(~= 117 |upperCase!| 123 |upperCase| 128 |trim| 133 |swap!| 145
              |suffix?| 152 |substring?| 158 |split| 165 |sorted?| 177 |sort!|
              188 |sort| 199 |smaller?| 210 |size?| 216 |setelt!| 222 |select|
              236 |sample| 242 |rightTrim| 246 |reverse!| 258 |reverse| 263
              |replace| 268 |removeDuplicates| 275 |remove| 280 |reduce| 292
              |qsetelt!| 313 |qelt| 320 |prefix?| 326 |position| 332 |parts|
              365 |new| 370 |more?| 376 |minIndex| 382 |min| 387 |merge| 398
              |members| 411 |member?| 416 |maxIndex| 422 |max| 427 |match?| 444
              |map!| 451 |map| 457 |lowerCase!| 470 |lowerCase| 475 |less?| 480
              |leftTrim| 486 |latex| 498 |join| 503 |insert| 509 |indices| 523
              |index?| 528 |hashUpdate!| 534 |hash| 540 |first| 545 |find| 556
              |fill!| 562 |every?| 568 |eval| 574 |eq?| 600 |entry?| 606
              |entries| 612 |empty?| 617 |empty| 622 |elt| 626 |delete| 651
              |count| 663 |copyInto!| 675 |copy| 682 |convert| 687 |construct|
              692 |concat| 697 |coerce| 720 |any?| 730 >= 736 > 742 = 748 <=
              754 < 760 |#| 766)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 1 0 0 7 0 2 10 9 0 0 3 11 1 13 9 0 0
                                  0 0 0))
            (CONS
             '#(|StringAggregate&| |OneDimensionalArrayAggregate&| NIL
                |LinearAggregate&| |OrderedSet&| |Collection&|
                |IndexedAggregate&| NIL |HomogeneousAggregate&| |Hashable&|
                |SetCategory&| |Evalable&| |EltableAggregate&| |Aggregate&| NIL
                |BasicType&| |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL
                NIL NIL)
             (CONS
              '#((|StringAggregate|) (|OneDimensionalArrayAggregate| 8)
                 (|FiniteLinearAggregate| 8) (|LinearAggregate| 8)
                 (|OrderedSet|) (|Collection| 8) (|IndexedAggregate| 18 8)
                 (|Comparable|) (|HomogeneousAggregate| 8) (|Hashable|)
                 (|SetCategory|) (|Evalable| 8) (|EltableAggregate| 18 8)
                 (|Aggregate|) (|ConvertibleTo| 85) (|BasicType|)
                 (|PartialOrder|) (|CoercibleTo| 25) (|InnerEvalable| 8 8)
                 (|Eltable| 18 8) (|Type|) (|Eltable| 19 $$)
                 (|finiteAggregate|) (|shallowlyMutable|))
              (|makeByteWordVec2| 85
                                  '(2 19 0 18 18 20 1 19 0 18 22 1 25 0 24 26 0
                                    29 0 30 1 8 0 0 31 2 0 0 32 0 33 0 29 0 35
                                    1 8 0 0 36 1 19 18 0 38 1 19 11 0 39 1 19
                                    18 0 40 1 0 18 0 41 0 8 0 42 2 29 11 8 0 49
                                    0 53 0 54 2 53 0 2 0 55 1 53 0 0 56 1 53 11
                                    0 64 1 53 0 0 65 1 53 7 0 66 1 53 2 0 67 2
                                    18 11 0 0 72 2 0 11 0 0 73 2 24 11 0 0 1 1
                                    0 0 0 34 1 0 0 0 1 2 0 0 0 29 1 2 16 0 0 8
                                    1 3 14 84 0 18 18 1 2 0 11 0 0 51 3 0 11 0
                                    0 18 46 2 0 57 0 8 58 2 0 57 0 29 59 1 19
                                    11 0 1 2 15 11 80 0 1 2 17 0 80 0 1 1 18 0
                                    0 1 1 19 0 0 1 2 15 0 80 0 1 2 20 11 0 0 1
                                    2 0 11 0 7 1 3 14 8 0 18 8 45 3 14 8 0 19 8
                                    1 2 15 0 78 0 1 0 0 0 1 2 0 0 0 29 61 2 16
                                    0 0 8 1 1 17 0 0 1 1 15 0 0 1 3 0 0 0 19 0
                                    43 1 16 0 0 1 2 16 0 8 0 1 2 15 0 78 0 1 4
                                    16 8 79 0 8 8 1 3 15 8 79 0 8 1 2 15 8 79 0
                                    1 3 14 8 0 18 8 44 2 0 8 0 18 69 2 0 11 0 0
                                    73 3 0 18 0 0 18 47 3 0 18 29 0 18 50 3 16
                                    18 8 0 18 48 2 16 18 8 0 1 2 15 18 78 0 1 1
                                    15 75 0 1 2 0 0 7 8 9 2 0 11 0 7 1 1 4 18 0
                                    28 1 19 8 0 1 2 19 0 0 0 1 2 19 0 0 0 1 3
                                    15 0 80 0 0 1 1 15 75 0 1 2 16 11 8 0 1 1 4
                                    18 0 41 1 19 8 0 1 2 19 0 0 0 1 2 15 8 80 0
                                    1 3 0 11 0 0 8 74 2 14 0 32 0 33 2 0 0 32 0
                                    1 3 0 0 79 0 0 1 1 0 0 0 37 1 0 0 0 1 2 0
                                    11 0 7 1 2 0 0 0 29 60 2 16 0 0 8 1 1 21 24
                                    0 1 2 0 0 0 57 68 3 0 0 8 0 18 1 3 0 0 0 0
                                    18 23 1 0 76 0 1 2 0 11 18 0 1 2 23 70 70 0
                                    71 1 23 81 0 1 2 0 0 0 7 1 1 4 8 0 1 2 0 77
                                    78 0 1 2 14 0 0 8 1 2 15 11 78 0 1 2 9 0 0
                                    82 1 2 9 0 0 83 1 3 9 0 0 75 75 1 3 9 0 0 8
                                    8 1 2 0 11 0 0 1 2 16 11 8 0 1 1 0 75 0 1 1
                                    0 11 0 12 0 0 0 10 2 0 8 0 18 52 3 0 8 0 18
                                    8 1 2 0 0 0 19 21 2 0 0 0 0 1 2 0 0 0 19 1
                                    2 0 0 0 18 1 2 16 7 8 0 1 2 15 7 78 0 1 3
                                    17 0 0 0 18 62 1 0 0 0 17 1 3 85 0 1 1 0 0
                                    75 1 2 0 0 8 0 1 2 0 0 0 8 1 1 0 0 57 63 2
                                    0 0 0 0 16 1 0 0 8 1 1 22 25 0 27 2 15 11
                                    78 0 1 2 19 11 0 0 1 2 19 11 0 0 1 2 24 11
                                    0 0 14 2 19 11 0 0 1 2 19 11 0 0 15 1 15 7
                                    0 13)))))
           '|lookupComplete|)) 
