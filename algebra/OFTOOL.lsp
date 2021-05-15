
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
                       (SEQ (LETT |e1| (|SPADfirst| |expr|))
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
         (SEQ (LETT |ll| (LIST |l|)) (LETT |res| NIL)
              (SEQ G190 (COND ((NULL (NULL (NULL |ll|))) (GO G191)))
                   (SEQ (LETT |l| (|SPADfirst| |ll|)) (LETT |ll| (CDR |ll|))
                        (EXIT
                         (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                              (SEQ (LETT |t| (|SPADfirst| |l|))
                                   (LETT |l| (CDR |l|))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |t| (QREFELT $ 8))
                                      (LETT |res| (CONS |t| |res|)))
                                     ('T
                                      (SEQ
                                       (LETT |t1|
                                             (SPADCALL |t| (QREFELT $ 18)))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |t1| |s| (QREFELT $ 22))
                                          (SEQ (LETT |ll| (CONS |l| |ll|))
                                               (EXIT
                                                (LETT |l|
                                                      (SPADCALL |t|
                                                                (QREFELT $
                                                                         20))))))
                                         ('T
                                          (LETT |res| (CONS |t| |res|))))))))))
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
          (|n| (|NonNegativeInteger|)) (|args| #2#) (#4=#:G499 NIL) (|arg| NIL)
          (#5=#:G498 NIL) (|xi| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 15)) |x|)
                ((SPADCALL |x| (QREFELT $ 9))
                 (SEQ (LETT |xi| (SPADCALL |x| (QREFELT $ 11)))
                      (EXIT
                       (COND
                        ((< |xi| 0)
                         (SPADCALL (SPADCALL '- (QREFELT $ 24))
                                   (LIST (SPADCALL (- |xi|) (QREFELT $ 25)))
                                   (QREFELT $ 23)))
                        (#6='T |x|)))))
                ((SPADCALL |x| (QREFELT $ 8)) |x|)
                (#6#
                 (SEQ (LETT |op| (SPADCALL |x| (QREFELT $ 18)))
                      (LETT |args| (SPADCALL |x| (QREFELT $ 20)))
                      (COND
                       ((SPADCALL |op| '+ (QREFELT $ 22))
                        (LETT |args| (|OFTOOL;flaten_op| '+ |args| $))))
                      (COND
                       ((SPADCALL |op| '* (QREFELT $ 22))
                        (LETT |args| (|OFTOOL;flaten_op| '* |args| $))))
                      (LETT |args|
                            (PROGN
                             (LETT #5# NIL)
                             (SEQ (LETT |arg| NIL) (LETT #4# |args|) G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN (LETT |arg| (CAR #4#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #5#
                                          (CONS (SPADCALL |arg| (QREFELT $ 26))
                                                #5#))))
                                  (LETT #4# (CDR #4#)) (GO G190) G191
                                  (EXIT (NREVERSE #5#)))))
                      (EXIT
                       (COND
                        ((SPADCALL |op| '|construct| (QREFELT $ 22))
                         (SPADCALL |args| (QREFELT $ 28)))
                        (#6#
                         (SEQ (LETT |n| (LENGTH |args|))
                              (COND
                               ((SPADCALL |op| 'SEGMENT (QREFELT $ 22))
                                (COND
                                 ((> |n| 0)
                                  (COND
                                   ((<= |n| 2)
                                    (EXIT
                                     (SEQ (LETT |a1| (|SPADfirst| |args|))
                                          (LETT |a1|
                                                (COND
                                                 ((SPADCALL |a1| (QREFELT $ 8))
                                                  |a1|)
                                                 (#6#
                                                  (SPADCALL |a1|
                                                            (QREFELT $ 29)))))
                                          (EXIT
                                           (COND
                                            ((EQL |n| 2)
                                             (SEQ
                                              (LETT |a2|
                                                    (SPADCALL |args| 2
                                                              (QREFELT $ 30)))
                                              (LETT |a2|
                                                    (COND
                                                     ((SPADCALL |a2|
                                                                (QREFELT $ 8))
                                                      |a2|)
                                                     (#6#
                                                      (SPADCALL |a2|
                                                                (QREFELT $
                                                                         29)))))
                                              (EXIT
                                               (SPADCALL |a1| |a2|
                                                         (QREFELT $ 31)))))
                                            (#6#
                                             (SPADCALL |a1|
                                                       (QREFELT $
                                                                32)))))))))))))
                              (COND
                               ((SPADCALL |op| '- (QREFELT $ 22))
                                (COND
                                 ((EQL |n| 2)
                                  (EXIT
                                   (SEQ (LETT |a1| (|SPADfirst| |args|))
                                        (LETT |a2|
                                              (SPADCALL |args| 2
                                                        (QREFELT $ 30)))
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
                                                                (QREFELT $
                                                                         20))))
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
                                               (LIST |a2|) (QREFELT $ 23)))
                                        (EXIT
                                         (SPADCALL (SPADCALL '+ (QREFELT $ 24))
                                                   (LIST |a1| |a2|)
                                                   (QREFELT $ 23)))))))))
                              (COND
                               ((SPADCALL |op| '- (QREFELT $ 22))
                                (COND
                                 ((EQL |n| 1)
                                  (EXIT
                                   (SEQ (LETT |a1| (|SPADfirst| |args|))
                                        (COND
                                         ((NULL (SPADCALL |a1| (QREFELT $ 8)))
                                          (COND
                                           ((SPADCALL
                                             (LETT |op1|
                                                   (SPADCALL |a1|
                                                             (QREFELT $ 18)))
                                             '- (QREFELT $ 22))
                                            (COND
                                             ((EQL
                                               (LENGTH
                                                (LETT |args1|
                                                      (SPADCALL |a1|
                                                                (QREFELT $
                                                                         20))))
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
                                       (#6#
                                        (SPADCALL |op|
                                                  (|OFTOOL;flaten_op| '+ |args|
                                                   $)
                                                  (QREFELT $ 23)))))
                                ((SPADCALL |op| '* (QREFELT $ 22))
                                 (SEQ (LETT |a1| (|SPADfirst| |args|))
                                      (EXIT
                                       (COND ((EQL |n| 1) |a1|)
                                             (#6#
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
                                                                             18)))
                                                    '- (QREFELT $ 22))
                                                   (COND
                                                    ((EQL
                                                      (LENGTH
                                                       (LETT |args1|
                                                             (SPADCALL |a1|
                                                                       (QREFELT
                                                                        $
                                                                        20))))
                                                      1)
                                                     (EXIT
                                                      (SEQ
                                                       (LETT |a11|
                                                             (|SPADfirst|
                                                              |args1|))
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
                                                                      |args|)))))
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
                                  ((SPADCALL |n| 2 (QREFELT $ 34))
                                   (|error|
                                    "precodition: division must have two arguments"))
                                  (#6#
                                   (SEQ (LETT |a1| (|SPADfirst| |args|))
                                        (LETT |a2|
                                              (SPADCALL |args| 2
                                                        (QREFELT $ 30)))
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
                                                   (#6#
                                                    (SPADCALL |a1|
                                                              (QREFELT $
                                                                       29)))))
                                            (LETT |a2|
                                                  (COND
                                                   ((SPADCALL |a2|
                                                              (QREFELT $ 8))
                                                    |a2|)
                                                   (#6#
                                                    (SPADCALL |a2|
                                                              (QREFELT $
                                                                       29)))))
                                            (EXIT
                                             (SPADCALL
                                              (SPADCALL 'SLASH (QREFELT $ 24))
                                              (LIST |a1| |a2|)
                                              (QREFELT $ 23)))))
                                          (#6#
                                           (SEQ
                                            (LETT |op|
                                                  (SPADCALL 'OVER
                                                            (QREFELT $ 24)))
                                            (COND
                                             ((NULL
                                               (SPADCALL |a1| (QREFELT $ 8)))
                                              (COND
                                               ((SPADCALL
                                                 (LETT |op1|
                                                       (SPADCALL |a1|
                                                                 (QREFELT $
                                                                          18)))
                                                 '- (QREFELT $ 22))
                                                (COND
                                                 ((EQL
                                                   (LENGTH
                                                    (LETT |args1|
                                                          (SPADCALL |a1|
                                                                    (QREFELT $
                                                                             20))))
                                                   1)
                                                  (EXIT
                                                   (SEQ
                                                    (LETT |a11|
                                                          (|SPADfirst|
                                                           |args1|))
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
                                (#6#
                                 (SPADCALL (SPADCALL |op| (QREFELT $ 26))
                                           |args| (QREFELT $ 23))))))))))))))) 

(DECLAIM (NOTINLINE |OutputFormTools;|)) 

(DEFUN |OutputFormTools| ()
  (SPROG NIL
         (PROG (#1=#:G501)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OutputFormTools|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OutputFormTools|
                             (LIST (CONS NIL (CONS 1 (|OutputFormTools;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|OutputFormTools|)))))))))) 

(DEFUN |OutputFormTools;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OutputFormTools|))
          (LETT $ (GETREFV 35))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
              (15 . |paren|) (20 . |elt|) (26 . SEGMENT) (32 . SEGMENT)
              (|NonNegativeInteger|) (37 . ~=))
           '#(|symbol?| 43 |symbol| 48 |string?| 53 |string| 58 |precondition|
              63 |operator| 68 |is_symbol?| 73 |integer?| 79 |integer| 84
              |has_op?| 89 |construct| 95 |atom?| 101 |arguments| 106)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|atom?| ((|Boolean|) (|OutputForm|))) T)
                                   '((|integer?| ((|Boolean|) (|OutputForm|)))
                                     T)
                                   '((|integer| ((|Integer|) (|OutputForm|)))
                                     T)
                                   '((|symbol?| ((|Boolean|) (|OutputForm|)))
                                     T)
                                   '((|symbol| ((|Symbol|) (|OutputForm|))) T)
                                   '((|string?| ((|Boolean|) (|OutputForm|)))
                                     T)
                                   '((|string| ((|String|) (|OutputForm|))) T)
                                   '((|operator|
                                      ((|OutputForm|) (|OutputForm|)))
                                     T)
                                   '((|arguments|
                                      ((|List| (|OutputForm|)) (|OutputForm|)))
                                     T)
                                   '((|has_op?|
                                      ((|Boolean|) (|OutputForm|) (|Symbol|)))
                                     T)
                                   '((|is_symbol?|
                                      ((|Boolean|) (|OutputForm|) (|Symbol|)))
                                     T)
                                   '((|construct|
                                      ((|OutputForm|) (|OutputForm|)
                                       (|List| (|OutputForm|))))
                                     T)
                                   '((|precondition|
                                      ((|OutputForm|) (|OutputForm|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 34
                                            '(1 7 0 13 24 1 7 0 10 25 1 7 0 27
                                              28 1 7 0 0 29 2 19 7 0 10 30 2 7
                                              0 0 0 31 1 7 0 0 32 2 33 6 0 0 34
                                              1 0 6 7 12 1 0 13 7 14 1 0 6 7 15
                                              1 0 16 7 17 1 0 7 7 26 1 0 7 7 18
                                              2 0 6 7 13 22 1 0 6 7 9 1 0 10 7
                                              11 2 0 6 7 13 21 2 0 7 7 19 23 1
                                              0 6 7 8 1 0 19 7 20)))))
           '|lookupComplete|)) 

(MAKEPROP '|OutputFormTools| 'NILADIC T) 
