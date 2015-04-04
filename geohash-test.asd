(defpackage #:geohash-test-system (:use #:asdf #:cl))
(in-package #:geohash-test-system)

(defsystem geohash-test
  :author "Gary Warren King <gwking@metabang.com>"
  :maintainer "Gary Warren King <gwking@metabang.com>"
  :licence "MIT Style License; see file COPYING for details"
  :description "Tests for Geohash"
  :components ((:module 
		"setup"
		:pathname "tests/"
		:components ((:file "packages")
			     (:file "geohash-test"
				    :depends-on ("packages"))))
	       (:module 
		"test"
		:pathname "tests/"
		:depends-on ("setup")
		:components ()))  
  :depends-on (:lift :geohash))


