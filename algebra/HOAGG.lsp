
(DEFPARAMETER |HomogeneousAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |HomogeneousAggregate;|)) 

(DEFPARAMETER |HomogeneousAggregate;AL| 'NIL) 

(DEFUN |HomogeneousAggregate| (#1=#:G693)
  (LET (#2=#:G694)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |HomogeneousAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |HomogeneousAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|HomogeneousAggregate;| #1#)))
                       |HomogeneousAggregate;AL|))
      #2#)))) 

(DEFUN |HomogeneousAggregate;| (|t#1|)
  (SPROG ((#1=#:G692 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|HomogeneousAggregate;CAT|)
                                    ('T
                                     (LETT |HomogeneousAggregate;CAT|
                                           (|Join| (|Aggregate|)
                                                   (|mkCategory|
                                                    '(((|map|
                                                        ($
                                                         (|Mapping| |t#1|
                                                                    |t#1|)
                                                         $))
                                                       T)
                                                      ((|map!|
                                                        ($
                                                         (|Mapping| |t#1|
                                                                    |t#1|)
                                                         $))
                                                       (|has| $
                                                              (|shallowlyMutable|)))
                                                      ((|any?|
                                                        ((|Boolean|)
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|)
                                                         $))
                                                       (|has| $
                                                              (|finiteAggregate|)))
                                                      ((|every?|
                                                        ((|Boolean|)
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|)
                                                         $))
                                                       (|has| $
                                                              (|finiteAggregate|)))
                                                      ((|count|
                                                        ((|NonNegativeInteger|)
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|)
                                                         $))
                                                       (|has| $
                                                              (|finiteAggregate|)))
                                                      ((|parts|
                                                        ((|List| |t#1|) $))
                                                       (|has| $
                                                              (|finiteAggregate|)))
                                                      ((|members|
                                                        ((|List| |t#1|) $))
                                                       (|has| $
                                                              (|finiteAggregate|)))
                                                      ((|count|
                                                        ((|NonNegativeInteger|)
                                                         |t#1| $))
                                                       (AND
                                                        (|has| |t#1|
                                                               (|BasicType|))
                                                        (|has| $
                                                               (|finiteAggregate|))))
                                                      ((|member?|
                                                        ((|Boolean|) |t#1| $))
                                                       (AND
                                                        (|has| |t#1|
                                                               (|BasicType|))
                                                        (|has| $
                                                               (|finiteAggregate|)))))
                                                    '(((|CoercibleTo|
                                                        (|OutputForm|))
                                                       (|has| |t#1|
                                                              (|CoercibleTo|
                                                               (|OutputForm|))))
                                                      ((|SetCategory|)
                                                       (|has| |t#1|
                                                              (|SetCategory|)))
                                                      ((|Evalable| |t#1|)
                                                       (AND
                                                        (|has| |t#1|
                                                               (|Evalable|
                                                                |t#1|))
                                                        (|has| |t#1|
                                                               (|SetCategory|))))
                                                      ((|BasicType|)
                                                       (AND
                                                        (|has| |t#1|
                                                               (|BasicType|))
                                                        (|has| $
                                                               (|finiteAggregate|)))))
                                                    '((|Boolean|)
                                                      (|NonNegativeInteger|)
                                                      (|List| |t#1|))
                                                    NIL))
                                           . #2=(|HomogeneousAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|HomogeneousAggregate| (|devaluate| |t#1|)))))) 
