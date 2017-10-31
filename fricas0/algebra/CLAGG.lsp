
(DEFPARAMETER |Collection;CAT| 'NIL) 

(DECLAIM (NOTINLINE |Collection;|)) 

(DEFPARAMETER |Collection;AL| 'NIL) 

(DEFUN |Collection| (#1=#:G691)
  (LET (#2=#:G692)
    (COND ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |Collection;AL|)) (CDR #2#))
          (T
           (SETQ |Collection;AL|
                   (|cons5| (CONS #3# (SETQ #2# (|Collection;| #1#)))
                            |Collection;AL|))
           #2#)))) 

(DEFUN |Collection;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|Collection;CAT|)
                                    ('T
                                     (LETT |Collection;CAT|
                                           (|Join|
                                            (|HomogeneousAggregate| '|t#1|)
                                            (|mkCategory|
                                             '(((|construct|
                                                 ($ (|List| |t#1|)))
                                                T)
                                               ((|find|
                                                 ((|Union| |t#1| "failed")
                                                  (|Mapping| (|Boolean|) |t#1|)
                                                  $))
                                                T)
                                               ((|reduce|
                                                 (|t#1|
                                                  (|Mapping| |t#1| |t#1| |t#1|)
                                                  $))
                                                (|has| $ (|finiteAggregate|)))
                                               ((|reduce|
                                                 (|t#1|
                                                  (|Mapping| |t#1| |t#1| |t#1|)
                                                  $ |t#1|))
                                                (|has| $ (|finiteAggregate|)))
                                               ((|remove|
                                                 ($
                                                  (|Mapping| (|Boolean|) |t#1|)
                                                  $))
                                                (|has| $ (|finiteAggregate|)))
                                               ((|select|
                                                 ($
                                                  (|Mapping| (|Boolean|) |t#1|)
                                                  $))
                                                (|has| $ (|finiteAggregate|)))
                                               ((|reduce|
                                                 (|t#1|
                                                  (|Mapping| |t#1| |t#1| |t#1|)
                                                  $ |t#1| |t#1|))
                                                (AND
                                                 (|has| |t#1| (|BasicType|))
                                                 (|has| $
                                                        (|finiteAggregate|))))
                                               ((|remove| ($ |t#1| $))
                                                (AND
                                                 (|has| |t#1| (|BasicType|))
                                                 (|has| $
                                                        (|finiteAggregate|))))
                                               ((|removeDuplicates| ($ $))
                                                (AND
                                                 (|has| |t#1| (|BasicType|))
                                                 (|has| $
                                                        (|finiteAggregate|)))))
                                             '(((|ConvertibleTo| (|InputForm|))
                                                (|has| |t#1|
                                                       (|ConvertibleTo|
                                                        (|InputForm|)))))
                                             '((|List| |t#1|)) NIL))
                                           . #2=(|Collection|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|Collection| (|devaluate| |t#1|)))))) 
