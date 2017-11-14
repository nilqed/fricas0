
(DECLAIM (NOTINLINE |StringAggregate;|)) 

(DEFPARAMETER |StringAggregate;AL| 'NIL) 

(DEFUN |StringAggregate| ()
  (LET (#:G693)
    (COND (|StringAggregate;AL|)
          (T (SETQ |StringAggregate;AL| (|StringAggregate;|)))))) 

(DEFUN |StringAggregate;| ()
  (SPROG ((#1=#:G691 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(#2=#:G690) (LIST '(|Character|)))
                              (|Join| (|OneDimensionalArrayAggregate| '#2#)
                                      (|mkCategory|
                                       '(((|lowerCase| ($ $)) T)
                                         ((|lowerCase!| ($ $)) T)
                                         ((|upperCase| ($ $)) T)
                                         ((|upperCase!| ($ $)) T)
                                         ((|prefix?| ((|Boolean|) $ $)) T)
                                         ((|suffix?| ((|Boolean|) $ $)) T)
                                         ((|substring?|
                                           ((|Boolean|) $ $ (|Integer|)))
                                          T)
                                         ((|match?|
                                           ((|Boolean|) $ $ (|Character|)))
                                          T)
                                         ((|replace|
                                           ($ $
                                            (|UniversalSegment| (|Integer|))
                                            $))
                                          T)
                                         ((|position|
                                           ((|Integer|) $ $ (|Integer|)))
                                          T)
                                         ((|position|
                                           ((|Integer|) (|CharacterClass|) $
                                            (|Integer|)))
                                          T)
                                         ((|coerce| ($ (|Character|))) T)
                                         ((|split|
                                           ((|List| $) $ (|Character|)))
                                          T)
                                         ((|split|
                                           ((|List| $) $ (|CharacterClass|)))
                                          T)
                                         ((|trim| ($ $ (|CharacterClass|))) T)
                                         ((|leftTrim| ($ $ (|CharacterClass|)))
                                          T)
                                         ((|rightTrim|
                                           ($ $ (|CharacterClass|)))
                                          T)
                                         ((|elt| ($ $ $)) T))
                                       NIL
                                       '((|CharacterClass|) (|List| $)
                                         (|Character|) (|Integer|)
                                         (|UniversalSegment| (|Integer|))
                                         (|Boolean|))
                                       NIL)))
                   |StringAggregate|)
           (SETELT #1# 0 '(|StringAggregate|))))) 

(MAKEPROP '|StringAggregate| 'NILADIC T) 
