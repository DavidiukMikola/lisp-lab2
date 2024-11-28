(defun merge-lists-pairs (list1 list2)
  (cond
    ((and list1 list2)
     (cons (list (car list1) (car list2))
           (merge-lists-pairs (cdr list1) (cdr list2))))
    ((and (not (null list2)) (null list1))
     (cons (list (car list2))
           (merge-lists-pairs nil (cdr list2))))
    ((and (not (null list1)) (null list2))
     (cons (list (car list1))
           (merge-lists-pairs (cdr list1) nil)))
    (t nil)))

 (defun test-my-merge ()
  (list
   (merge-lists-pairs '(a b c d e) '(k l m n o))
   (merge-lists-pairs '(1 2 3 4 5 6) '(7 8))
   (merge-lists-pairs '(1 2 3 4) nil)
   (merge-lists-pairs '() nil)))

(test-my-merge)

(defun sublist-starts-p (list sublist)
  (cond
    ((null sublist) t)
    ((or (null list) (not (eql (car list) (car sublist)))) nil)
    (t (sublist-starts-p (cdr list) (cdr sublist)))))

(defun sublist-after-p (list atom sublist)
  (cond
    ((null list) nil)
    ((eql (car list) atom)
     (sublist-starts-p (cdr list) sublist))
    (t (sublist-after-p (cdr list) atom sublist))))

(defun test-my-sublist ()
           (list
            (sublist-after-p '(a b c d e f g) 'd '(e f g))
            (sublist-after-p '(1 2 3 4 5 6) 5 '(6 4))
            (sublist-after-p '() nil nil)))

 (test-my-sublist)