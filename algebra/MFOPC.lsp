
(DECLAIM (NOTINLINE |ModularFactorizationOperations;|)) 

(DEFPARAMETER |ModularFactorizationOperations;AL| 'NIL) 

(DEFUN |ModularFactorizationOperations| (|t#1| |t#2| |t#3| |t#4|)
  (LET (#1=#:G1
        (#2=#:G2
         (LIST (|devaluate| |t#1|) (|devaluate| |t#2|) (|devaluate| |t#3|)
               (|devaluate| |t#4|))))
    (COND
     ((SETQ #1# (|assoc| #2# |ModularFactorizationOperations;AL|)) (CDR #1#))
     (T
      (SETQ |ModularFactorizationOperations;AL|
              (|cons5|
               (CONS #2#
                     (SETQ #1#
                             (APPLY #'|ModularFactorizationOperations;| #2#)))
               |ModularFactorizationOperations;AL|))
      #1#)))) 

(DEFUN |ModularFactorizationOperations;| (|t#1| |t#2| |t#3| |t#4|)
  (SPROG ((#1=#:G0 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(|t#1| |t#2| |t#3| |t#4|)
                                   (LIST |t#1| |t#2| |t#3| |t#4|)
                                   (|Join|
                                    (|mkCategory|
                                     '(((|ini_rdata| (|t#4| |t#1| |t#3|)) T)
                                       ((|get_mod| (|t#3| |t#4|)) T)
                                       ((|get_char| ((|Integer|) |t#3|)) T)
                                       ((|get_extension_degree|
                                         ((|Integer|) |t#3|))
                                        T)
                                       ((|red_pol!| (|t#1| |t#1| |t#4|)) T)
                                       ((|mod_exp|
                                         (|t#1| |t#1| (|Integer|) |t#4|))
                                        T)
                                       ((|degree| ((|Integer|) |t#1|)) T)
                                       ((|monomial1| (|t#1| |t#3|)) T)
                                       ((|copy_poly|
                                         (|t#1| |t#1| (|Integer|) |t#3|))
                                        T)
                                       ((|sub1!| (|t#1| |t#1| |t#3|)) T)
                                       ((|add_poly| (|t#1| |t#1| |t#1| |t#3|))
                                        T)
                                       ((|sub_poly| (|t#1| |t#1| |t#1| |t#3|))
                                        T)
                                       ((|gcd| (|t#1| |t#1| |t#1| |t#3|)) T)
                                       ((|divide!| (|t#1| |t#1| |t#1| |t#3|))
                                        T)
                                       ((|random_poly|
                                         (|t#1| (|Integer|) |t#3|))
                                        T)
                                       ((|empty_poly| (|t#1|)) T)
                                       ((|empty_mat| (|t#2|)) T)
                                       ((|empty_mat?| ((|Boolean|) |t#2|)) T)
                                       ((|trim_mat!|
                                         ((|Void|) |t#2| (|Integer|)
                                          (|Integer|) |t#4|))
                                        T)
                                       ((|split_mat!|
                                         ((|Void|) |t#2| (|Integer|)
                                          (|Integer|) (|Integer|) |t#4| |t#4|))
                                        T)
                                       ((|shift_mat!|
                                         ((|Void|) |t#2| (|Integer|)
                                          (|Integer|)))
                                        T)
                                       ((|copy_mat_part|
                                         (|t#2| |t#2| (|Integer|)))
                                        T)
                                       ((|power_matrix|
                                         ((|Record| (|:| |matr| |t#2|)
                                                    (|:| |poly| |t#1|))
                                          |t#1| (|NonNegativeInteger|) |t#4|))
                                        T)
                                       ((|modular_compose|
                                         (|t#1| |t#1| |t#2| |t#1|
                                          (|NonNegativeInteger|) |t#4|))
                                        T))
                                     NIL NIL NIL))))
           (SETELT #1# 0
                   (LIST '|ModularFactorizationOperations| |t#1| |t#2| |t#3|
                         |t#4|))))) 
