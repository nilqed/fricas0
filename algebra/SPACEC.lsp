
(DEFPARAMETER |ThreeSpaceCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |ThreeSpaceCategory;|)) 

(DEFPARAMETER |ThreeSpaceCategory;AL| 'NIL) 

(DEFUN |ThreeSpaceCategory| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |ThreeSpaceCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |ThreeSpaceCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|ThreeSpaceCategory;| #1#)))
                       |ThreeSpaceCategory;AL|))
      #2#)))) 

(DEFUN |ThreeSpaceCategory;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|ThreeSpaceCategory;CAT|)
                                    ('T
                                     (LETT |ThreeSpaceCategory;CAT|
                                           (|Join| (|SetCategory|)
                                                   (|mkCategory|
                                                    '(((|create3Space| ($)) T)
                                                      ((|create3Space|
                                                        ($
                                                         (|SubSpace| 3 |t#1|)))
                                                       T)
                                                      ((|numberOfComponents|
                                                        ((|NonNegativeInteger|)
                                                         $))
                                                       T)
                                                      ((|numberOfComposites|
                                                        ((|NonNegativeInteger|)
                                                         $))
                                                       T)
                                                      ((|merge| ($ (|List| $)))
                                                       T)
                                                      ((|merge| ($ $ $)) T)
                                                      ((|composite|
                                                        ($ (|List| $)))
                                                       T)
                                                      ((|components|
                                                        ((|List| $) $))
                                                       T)
                                                      ((|composites|
                                                        ((|List| $) $))
                                                       T)
                                                      ((|copy| ($ $)) T)
                                                      ((|enterPointData|
                                                        ((|NonNegativeInteger|)
                                                         $
                                                         (|List|
                                                          (|Point| |t#1|))))
                                                       T)
                                                      ((|modifyPointData|
                                                        ($ $
                                                         (|NonNegativeInteger|)
                                                         (|Point| |t#1|)))
                                                       T)
                                                      ((|point|
                                                        ($ $ (|Point| |t#1|)))
                                                       T)
                                                      ((|point|
                                                        ($ $ (|List| |t#1|)))
                                                       T)
                                                      ((|point|
                                                        ($ $
                                                         (|NonNegativeInteger|)))
                                                       T)
                                                      ((|point|
                                                        ($ (|Point| |t#1|)))
                                                       T)
                                                      ((|point|
                                                        ((|Point| |t#1|) $))
                                                       T)
                                                      ((|point?|
                                                        ((|Boolean|) $))
                                                       T)
                                                      ((|curve|
                                                        ($ $
                                                         (|List|
                                                          (|Point| |t#1|))))
                                                       T)
                                                      ((|curve|
                                                        ($ $
                                                         (|List|
                                                          (|List| |t#1|))))
                                                       T)
                                                      ((|curve|
                                                        ($
                                                         (|List|
                                                          (|Point| |t#1|))))
                                                       T)
                                                      ((|curve|
                                                        ((|List|
                                                          (|Point| |t#1|))
                                                         $))
                                                       T)
                                                      ((|curve?|
                                                        ((|Boolean|) $))
                                                       T)
                                                      ((|closedCurve|
                                                        ($ $
                                                         (|List|
                                                          (|Point| |t#1|))))
                                                       T)
                                                      ((|closedCurve|
                                                        ($ $
                                                         (|List|
                                                          (|List| |t#1|))))
                                                       T)
                                                      ((|closedCurve|
                                                        ($
                                                         (|List|
                                                          (|Point| |t#1|))))
                                                       T)
                                                      ((|closedCurve|
                                                        ((|List|
                                                          (|Point| |t#1|))
                                                         $))
                                                       T)
                                                      ((|closedCurve?|
                                                        ((|Boolean|) $))
                                                       T)
                                                      ((|polygon|
                                                        ($ $
                                                         (|List|
                                                          (|Point| |t#1|))))
                                                       T)
                                                      ((|polygon|
                                                        ($ $
                                                         (|List|
                                                          (|List| |t#1|))))
                                                       T)
                                                      ((|polygon|
                                                        ($
                                                         (|List|
                                                          (|Point| |t#1|))))
                                                       T)
                                                      ((|polygon|
                                                        ((|List|
                                                          (|Point| |t#1|))
                                                         $))
                                                       T)
                                                      ((|polygon?|
                                                        ((|Boolean|) $))
                                                       T)
                                                      ((|mesh|
                                                        ($ $
                                                         (|List|
                                                          (|List|
                                                           (|Point| |t#1|)))
                                                         (|List|
                                                          (|SubSpaceComponentProperty|))
                                                         (|SubSpaceComponentProperty|)))
                                                       T)
                                                      ((|mesh|
                                                        ($ $
                                                         (|List|
                                                          (|List|
                                                           (|List| |t#1|)))
                                                         (|List|
                                                          (|SubSpaceComponentProperty|))
                                                         (|SubSpaceComponentProperty|)))
                                                       T)
                                                      ((|mesh|
                                                        ($ $
                                                         (|List|
                                                          (|List|
                                                           (|Point| |t#1|)))
                                                         (|Boolean|)
                                                         (|Boolean|)))
                                                       T)
                                                      ((|mesh|
                                                        ($ $
                                                         (|List|
                                                          (|List|
                                                           (|List| |t#1|)))
                                                         (|Boolean|)
                                                         (|Boolean|)))
                                                       T)
                                                      ((|mesh|
                                                        ($
                                                         (|List|
                                                          (|List|
                                                           (|Point| |t#1|)))))
                                                       T)
                                                      ((|mesh|
                                                        ($
                                                         (|List|
                                                          (|List|
                                                           (|Point| |t#1|)))
                                                         (|Boolean|)
                                                         (|Boolean|)))
                                                       T)
                                                      ((|mesh|
                                                        ((|List|
                                                          (|List|
                                                           (|Point| |t#1|)))
                                                         $))
                                                       T)
                                                      ((|mesh?|
                                                        ((|Boolean|) $))
                                                       T)
                                                      ((|lp|
                                                        ((|List|
                                                          (|Point| |t#1|))
                                                         $))
                                                       T)
                                                      ((|lllip|
                                                        ((|List|
                                                          (|List|
                                                           (|List|
                                                            (|NonNegativeInteger|))))
                                                         $))
                                                       T)
                                                      ((|lllp|
                                                        ((|List|
                                                          (|List|
                                                           (|List|
                                                            (|Point| |t#1|))))
                                                         $))
                                                       T)
                                                      ((|llprop|
                                                        ((|List|
                                                          (|List|
                                                           (|SubSpaceComponentProperty|)))
                                                         $))
                                                       T)
                                                      ((|lprop|
                                                        ((|List|
                                                          (|SubSpaceComponentProperty|))
                                                         $))
                                                       T)
                                                      ((|objects|
                                                        ((|Record|
                                                          (|:| |points|
                                                               (|NonNegativeInteger|))
                                                          (|:| |curves|
                                                               (|NonNegativeInteger|))
                                                          (|:| |polygons|
                                                               (|NonNegativeInteger|))
                                                          (|:| |constructs|
                                                               (|NonNegativeInteger|)))
                                                         $))
                                                       T)
                                                      ((|check| ($ $)) T)
                                                      ((|subspace|
                                                        ((|SubSpace| 3 |t#1|)
                                                         $))
                                                       T)
                                                      ((|coerce|
                                                        ((|OutputForm|) $))
                                                       T))
                                                    NIL
                                                    '((|OutputForm|)
                                                      (|SubSpace| 3 |t#1|)
                                                      (|List|
                                                       (|SubSpaceComponentProperty|))
                                                      (|List|
                                                       (|List|
                                                        (|SubSpaceComponentProperty|)))
                                                      (|List|
                                                       (|List|
                                                        (|List|
                                                         (|Point| |t#1|))))
                                                      (|List|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                      (|List| (|Point| |t#1|))
                                                      (|Boolean|)
                                                      (|List|
                                                       (|List|
                                                        (|Point| |t#1|)))
                                                      (|List|
                                                       (|List| (|List| |t#1|)))
                                                      (|SubSpaceComponentProperty|)
                                                      (|List| (|List| |t#1|))
                                                      (|Point| |t#1|)
                                                      (|NonNegativeInteger|)
                                                      (|List| |t#1|)
                                                      (|List| $))
                                                    NIL))
                                           . #2=(|ThreeSpaceCategory|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|ThreeSpaceCategory| (|devaluate| |t#1|)))))) 
