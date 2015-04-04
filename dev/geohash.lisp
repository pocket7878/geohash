(in-package #:com.metabang.geohash)

(defvar *code-to-char*
  "0123456789bcdefghjkmnpqrstuvwxyz")

(defun encode (lat lon length)
  ;; we cons up a fresh lat.lon each time (otherwise, we've got
  ;; self modifying code -- the terror)
  (let ((lat.lon (cons (cons -90 90) (cons -180 180)))
	(value 0)
	(even/odd 0)
	(pair nil)
	(result nil))
    (flet ((midpoint (a b)
	     (float (/ (+ a b) 2))))
      (loop repeat length
	   for code = 0 do
	   (loop for bit in '(16 8 4 2 1) do
		(if (eql even/odd 0)
		    (setf pair (cdr lat.lon) value lon)
		    (setf pair (car lat.lon) value lat))
		(let ((midpoint (midpoint (car pair) (cdr pair))))
		  (if (> (cdr pair) value midpoint)
		      (setf (car pair) midpoint
			    code (+ code bit))
		      (setf (cdr pair) midpoint)))
		(setf even/odd (- 1 even/odd)))
	   (push (aref *code-to-char* code) result))
      (coerce (nreverse result) 'simple-string))))
 
(defun decode (string)
  ;; we cons up a fresh lat.lon each time (otherwise, we've got
  ;; self modifying code -- the horror)
  (let ((lat.lon (cons (cons -90 90) (cons -180 180)))
	(even/odd 0)
	(pair nil))
    (flet ((midpoint (a b)
	     (float (/ (+ a b) 2))))
      (loop for ch across string 
	 for base32 = (char-to-base32 ch) do
	 (loop for bit in '(16 8 4 2 1) do
	      (setf pair (if (eql even/odd 0) (cdr lat.lon) (car lat.lon)))
	      #+(or)
	      ;; debug
	      (unless (eql even/odd 0) 
		(print (list pair (format nil "~2,r" base32) base32
			     bit (eql (logand base32 bit) 0))))
	      (if (eql (logand base32 bit) 0)
		  (setf (cdr pair) (midpoint (car pair) (cdr pair)))
		  (setf (car pair) (midpoint (car pair) (cdr pair))))
	      #+(or)
	      ;; debug
	      (unless (eql even/odd 0) (print pair))
	      (setf even/odd (- 1 even/odd))))
      (let ((lat
             (midpoint (caar lat.lon) (cdar lat.lon)))
            (lng
             (midpoint (cadr lat.lon) (cddr lat.lon))))
        (values
         (cons lat lng)
         (cons (- (cdar lat.lon) lat)
               (- (cddr lat.lon) lng)))))))

(defun char-to-base32 (ch)
  (let ((code (char-code ch)))
    (cond ((<= (char-code #\0) code (char-code #\9))
	   (- code (char-code #\0)))
	  ((<= (char-code #\b) code (char-code #\h))
	   (+ (- code (char-code #\b)) 10))
	  ((<= (char-code #\j) code (char-code #\k))
	   (+ (- code (char-code #\j)) 17))
	  ((<= (char-code #\m) code (char-code #\n))
	   (+ (- code (char-code #\m)) 19))
	  ((<= (char-code #\p) code (char-code #\z))
	   (+ (- code (char-code #\p)) 21))
	  (t
	   (error "Bad character  ~a" ch)))))

#|
(decode "ez")

(decode "ezs42")

(encode 42.584 -5.59 5)
|#
