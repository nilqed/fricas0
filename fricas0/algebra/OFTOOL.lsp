
(PUT '|OFTOOL;atom?;OfB;1| '|SPADreplace| 'ATOM) 

(SDEFUN |OFTOOL;atom?;OfB;1| ((|x| |OutputForm|) ($ |Boolean|)) (ATOM |x|)) 

(PUT '|OFTOOL;integer?;OfB;2| '|SPADreplace| 'INTEGERP) 

(SDEFUN |OFTOOL;integer?;OfB;2| ((|x| |OutputForm|) ($ |Boolean|))
        (INTEGERP |x|)) 

(SDEFUN |OFTOOL;integer;OfI;3| ((|x| |OutputForm|) ($ |Integer|))
        (COND ((SPADCALL |x| (QREFELT $ 9)) |x|)
              ('T (|error| "not an integer")))) 

(PUT '|OFTOOL;symbol?;OfB;4| '|SPADreplace| 'SYMBOLP) 

(SDEFUN |OFTOOL;symbol?;OfB;4| ((|x| |OutputForm|) ($ |Boolean|)) (SYMBOLP |x|)) 

(SDEFUN |OFTOOL;symbol;OfS;5| ((|x| |OutputForm|) ($ |Symbol|))
        (COND ((SPADCALL |x| (QREFELT $ 12)) |x|)
              ('T (|error| "not a symbol")))) 

(PUT '|OFTOOL;string?;OfB;6| '|SPADreplace| 'STRINGP) 

(SDEFUN |OFTOOL;string?;OfB;6| ((|x| |OutputForm|) ($ |Boolean|)) (STRINGP |x|)) 

(SDEFUN |OFTOOL;string;OfS;7| ((|x| |OutputForm|) ($ |String|))
        (COND ((SPADCALL |x| (QREFELT $ 15)) |x|)
              ('T (|error| "not a string")))) 

(SDEFUN |OFTOOL;operator;2Of;8| ((|x| |OutputForm|) ($ |OutputForm|))
        (COND ((SPADCALL |x| (QREFELT $ 8)) (|error| "is an atom"))
              ('T (|SPADfirst| |x|)))) 

(SDEFUN |OFTOOL;arguments;OfL;9| ((|x| |OutputForm|) ($ |List| (|OutputForm|)))
        (COND ((SPADCALL |x| (QREFELT $ 8)) (|error| "is an atom"))
              ('T (CDR |x|)))) 

(SDEFUN |OFTOOL;has_op?;OfSB;10|
        ((|expr| |OutputForm|) (|op| |Symbol|) ($ |Boolean|))
        (SPROG ((|e1| (|OutputForm|)))
               (SEQ
                (COND ((SPADCALL |expr| (QREFELT $ 8)) NIL)
                      ('T
                       (SEQ
                        (LETT |e1| (|SPADfirst| |expr|)
                              |OFTOOL;has_op?;OfSB;10|)
                        (EXIT (EQ |e1| |op|)))))))) 

(SDEFUN |OFTOOL;is_symbol?;OfSB;11|
        ((|expr| |OutputForm|) (|op| |Symbol|) ($ |Boolean|))
        (COND ((NULL (SPADCALL |expr| (QREFELT $ 12))) NIL)
              ('T (EQUAL (SPADCALL |expr| (QREFELT $ 14)) |op|)))) 

(SDEFUN |OFTOOL;flaten_op|
        ((|s| |Symbol|) (|l| . #1=(|List| (|OutputForm|)))
         ($ |List| (|OutputForm|)))
        (SPROG
         ((|res| (|List| (|OutputForm|))) (|ll| (|List| #1#))
          (|t1| (|OutputForm|)) (|t| (|OutputForm|)))
         (SEQ (LETT |ll| (LIST |l|) . #2=(|OFTOOL;flaten_op|))
              (LETT |res| NIL . #2#)
              (SEQ G190 (COND ((NULL (NULL (NULL |ll|))) (GO G191)))
                   (SEQ (LETT |l| (|SPADfirst| |ll|) . #2#)
                        (LETT |ll| (CDR |ll|) . #2#)
                        (EXIT
                         (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                              (SEQ (LETT |t| (|SPADfirst| |l|) . #2#)
                                   (LETT |l| (CDR |l|) . #2#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |t| (QREFELT $ 8))
                                      (LETT |res| (CONS |t| |res|) . #2#))
                                     ('T
                                      (SEQ
                                       (LETT |t1| (SPADCALL |t| (QREFELT $ 18))
                                             . #2#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |t1| |s| (QREFELT $ 22))
                                          (SEQ
                                           (LETT |ll| (CONS |l| |ll|) . #2#)
                                           (EXIT
                                            (LETT |l|
                                                  (SPADCALL |t| (QREFELT $ 20))
                                                  . #2#))))
                                         ('T
                                          (LETT |res| (CONS |t| |res|)
                                                . #2#)))))))))
                              NIL (GO G190) G191 (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(PUT '|OFTOOL;construct;OfLOf;13| '|SPADreplace| 'CONS) 

(SDEFUN |OFTOOL;construct;OfLOf;13|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|)) ($ |OutputForm|))
        (CONS |op| |args|)) 

(SDEFUN |OFTOOL;precondition;2Of;14| ((|x| |OutputForm|) ($ |OutputForm|))
        (SPROG
         ((|a11| #1=(|OutputForm|)) (|args1| #2=(|List| (|OutputForm|)))
          (|op1| #3=(|OutputForm|)) (|op| #3#) (|a2| (|OutputForm|)) (|a1| #1#)
          (|nargs| (|List| (|OutputForm|))) (|args2| #2#)
          (|n| (|NonNegativeInteger|)) (|args| #2#) (#4=#:G839 NIL) (|arg| NIL)
          (#5=#:G838 NIL) (|xi| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 15)) |x|)
                ((SPADCALL |x| (QREFELT $ 9))
                 (SEQ
                  (LETT |xi| (SPADCALL |x| (QREFELT $ 11))
                        . #6=(|OFTOOL;precondition;2Of;14|))
                  (EXIT
                   (COND
                    ((< |xi| 0)
                     (SPADCALL (SPADCALL '- (QREFELT $ 24))
                               (LIST (SPADCALL (- |xi|) (QREFELT $ 25)))
                               (QREFELT $ 23)))
                    (#7='T |x|)))))
                ((SPADCALL |x| (QREFELT $ 8)) |x|)
                (#7#
                 (SEQ (LETT |op| (SPADCALL |x| (QREFELT $ 18)) . #6#)
                      (LETT |args| (SPADCALL |x| (QREFELT $ 20)) . #6#)
                      (COND
                       ((SPADCALL |op| '+ (QREFELT $ 22))
                        (LETT |args| (|OFTOOL;flaten_op| '+ |args| $) . #6#)))
                      (COND
                       ((SPADCALL |op| '* (QREFELT $ 22))
                        (LETT |args| (|OFTOOL;flaten_op| '* |args| $) . #6#)))
                      (LETT |args|
                            (PROGN
                             (LETT #5# NIL . #6#)
                             (SEQ (LETT |arg| NIL . #6#)
                                  (LETT #4# |args| . #6#) G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN
                                         (LETT |arg| (CAR #4#) . #6#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #5#
                                          (CONS (SPADCALL |arg| (QREFELT $ 26))
                                                #5#)
                                          . #6#)))
                                  (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                                  (EXIT (NREVERSE #5#))))
                            . #6#)
                      (EXIT
                       (COND
                        ((SPADCALL |op| '|construct| (QREFELT $ 22))
                         (SPADCALL |args| (QREFELT $ 28)))
                        (#7#
                         (SEQ (LETT |n| (LENGTH |args|) . #6#)
                              (COND
                               ((SPADCALL |op| 'SEGMENT (QREFELT $ 22))
                                (COND
                                 ((SPADCALL |n| 0 (QREFELT $ 30))
                                  (COND
                                   ((SPADCALL |n| 2 (QREFELT $ 31))
                                    (EXIT
                                     (SEQ
                                      (LETT |a1| (|SPADfirst| |args|) . #6#)
                                      (LETT |a1|
                                            (COND
                                             ((SPADCALL |a1| (QREFELT $ 8))
                                              |a1|)
                                             (#7#
                                              (SPADCALL |a1| (QREFELT $ 32))))
                                            . #6#)
                                      (EXIT
                                       (COND
                                        ((EQL |n| 2)
                                         (SEQ
                                          (LETT |a2|
                                                (SPADCALL |args| 2
                                                          (QREFELT $ 33))
                                                . #6#)
                                          (LETT |a2|
                                                (COND
                                                 ((SPADCALL |a2| (QREFELT $ 8))
                                                  |a2|)
                                                 (#7#
                                                  (SPADCALL |a2|
                                                            (QREFELT $ 32))))
                                                . #6#)
                                          (EXIT
                                           (SPADCALL |a1| |a2|
                                                     (QREFELT $ 34)))))
                                        (#7#
                                         (SPADCALL |a1|
                                                   (QREFELT $ 35)))))))))))))
                              (COND
                               ((SPADCALL |op| '- (QREFELT $ 22))
                                (COND
                                 ((EQL |n| 2)
                                  (EXIT
                                   (SEQ (LETT |a1| (|SPADfirst| |args|) . #6#)
                                        (LETT |a2|
                                              (SPADCALL |args| 2
                                                        (QREFELT $ 33))
                                              . #6#)
                                        (COND
                                         ((NULL (SPADCALL |a2| (QREFELT $ 8)))
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL |a2| (QREFELT $ 18)) '-
                                             (QREFELT $ 22))
                                            (COND
                                             ((EQL
                                               (LENGTH
                                                (LETT |args2|
                                                      (SPADCALL |a2|
                                                                (QREFELT $ 20))
                                                      . #6#))
                                               1)
                                              (EXIT
                                               (SPADCALL
                                                (SPADCALL '+ (QREFELT $ 24))
                                                (LIST |a1|
                                                      (|SPADfirst| |args2|))
                                                (QREFELT $ 23)))))))))
                                        (LETT |a2|
                                              (SPADCALL
                                               (SPADCALL '- (QREFELT $ 24))
                                               (LIST |a2|) (QREFELT $ 23))
                                              . #6#)
                                        (EXIT
                                         (SPADCALL (SPADCALL '+ (QREFELT $ 24))
                                                   (LIST |a1| |a2|)
                                                   (QREFELT $ 23)))))))))
                              (COND
                               ((SPADCALL |op| '- (QREFELT $ 22))
                                (COND
                                 ((EQL |n| 1)
                                  (EXIT
                                   (SEQ (LETT |a1| (|SPADfirst| |args|) . #6#)
                                        (COND
                                         ((NULL (SPADCALL |a1| (QREFELT $ 8)))
                                          (COND
                                           ((SPADCALL
                                             (LETT |op1|
                                                   (SPADCALL |a1|
                                                             (QREFELT $ 18))
                                                   . #6#)
                                             '- (QREFELT $ 22))
                                            (COND
                                             ((EQL
                                               (LENGTH
                                                (LETT |args1|
                                                      (SPADCALL |a1|
                                                                (QREFELT $ 20))
                                                      . #6#))
                                               1)
                                              (EXIT
                                               (|SPADfirst| |args1|))))))))
                                        (EXIT
                                         (SPADCALL |op| |args|
                                                   (QREFELT $ 23)))))))))
                              (EXIT
                               (COND
                                ((SPADCALL |op| '+ (QREFELT $ 22))
                                 (COND ((EQL |n| 1) (|SPADfirst| |args|))
                                       (#7#
                                        (SPADCALL |op|
                                                  (|OFTOOL;flaten_op| '+ |args|
                                                   $)
                                                  (QREFELT $ 23)))))
                                ((SPADCALL |op| '* (QREFELT $ 22))
                                 (SEQ (LETT |a1| (|SPADfirst| |args|) . #6#)
                                      (EXIT
                                       (COND ((EQL |n| 1) |a1|)
                                             (#7#
                                              (SEQ
                                               (COND
                                                ((NULL
                                                  (SPADCALL |a1|
                                                            (QREFELT $ 8)))
                                                 (COND
                                                  ((SPADCALL
                                                    (LETT |op1|
                                                          (SPADCALL |a1|
                                                                    (QREFELT $
                                                                             18))
                                                          . #6#)
                                                    '- (QREFELT $ 22))
                                                   (COND
                                                    ((EQL
                                                      (LENGTH
                                                       (LETT |args1|
                                                             (SPADCALL |a1|
                                                                       (QREFELT
                                                                        $ 20))
                                                             . #6#))
                                                      1)
                                                     (EXIT
                                                      (SEQ
                                                       (LETT |a11|
                                                             (|SPADfirst|
                                                              |args1|)
                                                             . #6#)
                                                       (LETT |nargs|
                                                             (SEQ
                                                              (COND
                                                               ((SPADCALL |a11|
                                                                          (QREFELT
                                                                           $
                                                                           9))
                                                                (COND
                                                                 ((EQL
                                                                   (SPADCALL
                                                                    |a11|
                                                                    (QREFELT $
                                                                             11))
                                                                   1)
                                                                  (EXIT
                                                                   (CDR
                                                                    |args|))))))
                                                              (EXIT
                                                               (CONS |a11|
                                                                     (CDR
                                                                      |args|))))
                                                             . #6#)
                                                       (EXIT
                                                        (SPADCALL
                                                         (SPADCALL |op1|
                                                                   (LIST
                                                                    (SPADCALL
                                                                     |op|
                                                                     |nargs|
                                                                     (QREFELT $
                                                                              23)))
                                                                   (QREFELT $
                                                                            23))
                                                         (QREFELT $
                                                                  26)))))))))))
                                               (EXIT
                                                (SPADCALL |op|
                                                          (|OFTOOL;flaten_op|
                                                           '* |args| $)
                                                          (QREFELT $
                                                                   23)))))))))
                                ((SPADCALL |op| '/ (QREFELT $ 22))
                                 (COND
                                  ((SPADCALL |n| 2 (QREFELT $ 36))
                                   (|error|
                                    "precodition: division must have two arguments"))
                                  (#7#
                                   (SEQ (LETT |a1| (|SPADfirst| |args|) . #6#)
                                        (LETT |a2|
                                              (SPADCALL |args| 2
                                                        (QREFELT $ 33))
                                              . #6#)
                                        (EXIT
                                         (COND
                                          ((EQUAL |$fractionDisplayType|
                                                  '|horizontal|)
                                           (SEQ
                                            (LETT |a1|
                                                  (COND
                                                   ((SPADCALL |a1|
                                                              (QREFELT $ 8))
                                                    |a1|)
                                                   (#7#
                                                    (SPADCALL |a1|
                                                              (QREFELT $ 32))))
                                                  . #6#)
                                            (LETT |a2|
                                                  (COND
                                                   ((SPADCALL |a2|
                                                              (QREFELT $ 8))
                                                    |a2|)
                                                   (#7#
                                                    (SPADCALL |a2|
                                                              (QREFELT $ 32))))
                                                  . #6#)
                                            (EXIT
                                             (SPADCALL
                                              (SPADCALL 'SLASH (QREFELT $ 24))
                                              (LIST |a1| |a2|)
                                              (QREFELT $ 23)))))
                                          (#7#
                                           (SEQ
                                            (LETT |op|
                                                  (SPADCALL 'OVER
                                                            (QREFELT $ 24))
                                                  . #6#)
                                            (COND
                                             ((NULL
                                               (SPADCALL |a1| (QREFELT $ 8)))
                                              (COND
                                               ((SPADCALL
                                                 (LETT |op1|
                                                       (SPADCALL |a1|
                                                                 (QREFELT $
                                                                          18))
                                                       . #6#)
                                                 '- (QREFELT $ 22))
                                                (COND
                                                 ((EQL
                                                   (LENGTH
                                                    (LETT |args1|
                                                          (SPADCALL |a1|
                                                                    (QREFELT $
                                                                             20))
                                                          . #6#))
                                                   1)
                                                  (EXIT
                                                   (SEQ
                                                    (LETT |a11|
                                                          (|SPADfirst| |args1|)
                                                          . #6#)
                                                    (EXIT
                                                     (SPADCALL |op1|
                                                               (LIST
                                                                (SPADCALL |op|
                                                                          (LIST
                                                                           |a11|
                                                                           |a2|)
                                                                          (QREFELT
                                                                           $
                                                                           23)))
                                                               (QREFELT $
                                                                        23)))))))))))
                                            (EXIT
                                             (SPADCALL |op| |args|
                                                       (QREFELT $ 23)))))))))))
                                (#7#
                                 (SPADCALL (SPADCALL |op| (QREFELT $ 26))
                                           |args| (QREFELT $ 23))))))))))))))) 

(DECLAIM (NOTINLINE |OutputFormTools;|)) 

(DEFUN |OutputFormTools| ()
  (SPROG NIL
         (PROG (#1=#:G841)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OutputFormTools|)
                    . #2=(|OutputFormTools|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OutputFormTools|
                             (LIST (CONS NIL (CONS 1 (|OutputFormTools;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|OutputFormTools|)))))))))) 

(DEFUN |OutputFormTools;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OutputFormTools|) . #1=(|OutputFormTools|))
          (LETT $ (GETREFV 37) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|OutputFormTools| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|OutputFormTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) (|OutputForm|)
              |OFTOOL;atom?;OfB;1| |OFTOOL;integer?;OfB;2| (|Integer|)
              |OFTOOL;integer;OfI;3| |OFTOOL;symbol?;OfB;4| (|Symbol|)
              |OFTOOL;symbol;OfS;5| |OFTOOL;string?;OfB;6| (|String|)
              |OFTOOL;string;OfS;7| |OFTOOL;operator;2Of;8| (|List| 7)
              |OFTOOL;arguments;OfL;9| |OFTOOL;has_op?;OfSB;10|
              |OFTOOL;is_symbol?;OfSB;11| |OFTOOL;construct;OfLOf;13|
              (0 . |outputForm|) (5 . |outputForm|)
              |OFTOOL;precondition;2Of;14| (|List| $) (10 . |bracket|)
              (|NonNegativeInteger|) (15 . >) (21 . <=) (27 . |paren|)
              (32 . |elt|) (38 . SEGMENT) (44 . SEGMENT) (49 . ~=))
           '#(|symbol?| 55 |symbol| 60 |string?| 65 |string| 70 |precondition|
              75 |operator| 80 |is_symbol?| 85 |integer?| 91 |integer| 96
              |has_op?| 101 |construct| 107 |atom?| 113 |arguments| 118)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 36
                                                 '(1 7 0 13 24 1 7 0 10 25 1 7
                                                   0 27 28 2 29 6 0 0 30 2 29 6
                                                   0 0 31 1 7 0 0 32 2 19 7 0
                                                   10 33 2 7 0 0 0 34 1 7 0 0
                                                   35 2 29 6 0 0 36 1 0 6 7 12
                                                   1 0 13 7 14 1 0 6 7 15 1 0
                                                   16 7 17 1 0 7 7 26 1 0 7 7
                                                   18 2 0 6 7 13 22 1 0 6 7 9 1
                                                   0 10 7 11 2 0 6 7 13 21 2 0
                                                   7 7 19 23 1 0 6 7 8 1 0 19 7
                                                   20)))))
           '|lookupComplete|)) 

(MAKEPROP '|OutputFormTools| 'NILADIC T) 
