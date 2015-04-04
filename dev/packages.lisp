(in-package #:common-lisp-user)

(defpackage #:com.metabang.geohash
  (:use #:common-lisp)
  (:nicknames #:geohash)
  (:export #:encode-lat/lon-to-string
	   #:decode-string-to-lat/lon))

