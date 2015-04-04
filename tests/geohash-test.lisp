(in-package #:com.metabang.geohash-test)

(deftestsuite geohash-test ()
  ())

(deftestsuite smoketest (geohash-test)
  ())

(addtest (smoketest)
  encode-1
  (ensure-same (encode-lat/lon-to-string 42.584 -5.59 1) "e" :test 'string=))

(addtest (smoketest)
  encode-2
  (ensure-same (encode-lat/lon-to-string 42.584 -5.59 2) "ez" :test 'string=))

(addtest (smoketest)
  encode-5
  (ensure-same (encode-lat/lon-to-string 42.584 -5.59 5) "ezs42"
	       :test 'string=))

(addtest (smoketest)
  decode-2
  (ensure-same (decode-string-to-lat/lon "ez")
	       (cons 42.1875 -5.625)
	       :test 'equal))
