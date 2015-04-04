(defpackage #:geohash-system (:use #:asdf #:cl))
(in-package #:geohash-system)

(defsystem geohash
  :version "0.1.1"
  :author "Gary Warren King <gwking@metabang.com>"
  :maintainer "Gary Warren King <gwking@metabang.com>"
  :licence "MIT Style License; see file COPYING for details"
  :description "Geohash implementation"
  :long-description 
  "See http://en.wikipedia.org/wiki/Geohash and 
http://forums.groundspeak.com/GC/index.php?showtopic=186412. for details."  
  :components ((:module 
		"setup"
		:pathname "dev/"
		:components ((:file "packages")))
	       (:module
		"dev" 
		:depends-on ("setup")
		:components 
		((:file "geohash")))               
               (:module 
		"website"
		:components ((:module "source"
				      :components 
				      ((:static-file "index.md"))))))
  
  :in-order-to ((test-op (load-op geohash-test)))
  :depends-on ()
  :perform (test-op :after (op c)
		    (funcall
		      (intern (symbol-name '#:run-tests) :lift)
		      :config :generic)))

(defmethod operation-done-p 
           ((o test-op) (c (eql (find-system 'geohash))))
  (values nil))

