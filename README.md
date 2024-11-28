<p align="center"><b>МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС</b></p>
<p align="center">
<b>Звіт з лабораторної роботи 2</b><br/>
"Рекурсія"<br/>
дисципліни "Вступ до функціонального програмування"
</p>
<p align="right"><b>Студент</b>: Давидюк Микола Юрійович КВ-12</p>
<p align="right"><b>Рік</b>: 2024</p>
## Загальне завдання
Реалізуйте дві рекурсивні функції, що виконують деякі дії з вхідним(и) списком(-ами), за
можливості/необхідності використовуючи різні види рекурсії. Функції, які необхідно
реалізувати, задаються варіантом (п. 2.1.1). Вимоги до функцій:
1. Зміна списку згідно із завданням має відбуватись за рахунок конструювання нового
списку, а не зміни наявного (вхідного).
2. Не допускається використання функцій вищого порядку чи стандартних функцій
для роботи зі списками, що не наведені в четвертому розділі навчального
посібника.
3. Реалізована функція не має бути функцією вищого порядку, тобто приймати функції
в якості аргументів.
4. Не допускається використання псевдофункцій (деструктивного підходу).
5. Не допускається використання циклів.
Кожна реалізована функція має бути протестована для різних тестових наборів. Тести
мають бути оформленні у вигляді модульних тестів (див. п. 2.3).
## Варіант 7
1. Написати функцію merge-lists-pairs , яка групує відповідні елементи двох
списків
2. Написати предикат sublist-after-p , який перевіряє, чи знаходиться після
визначеного елемента списку атомів визначена послідовність елементів (список)

## Лістинг функції merge-lists-pairs
```lisp
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
```
### Тестові набори
```lisp
 (defun test-my-merge ()
  (list
   (merge-lists-pairs '(a b c d e) '(k l m n o))
   (merge-lists-pairs '(1 2 3 4 5 6) '(7 8))
   (merge-lists-pairs '(1 2 3 4) nil)
   (merge-lists-pairs '() nil)))
```
### Тестування
```lisp
(test-my-merge)
(((A K) (B L) (C M) (D N) (E O)) ((1 7) (2 8) (3) (4) (5) (6))
 ((1) (2) (3) (4)) NIL)
```
## Лістинг функції sublist-after-p
```lisp
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

```
### Тестові набори
```lisp
 (defun test-my-sublist ()
           (list
            (sublist-after-p '(a b c d e f g) 'd '(e f g))
            (sublist-after-p '(1 2 3 4 5 6) 5 '(6 4))
            (sublist-after-p '() nil nil)))
```
### Тестування
```lisp
 (test-my-sublist)
(T NIL NIL)
```
