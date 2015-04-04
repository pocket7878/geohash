#geohash

Common Lisp geohash implementation.

## API

- (encode lat lng) => geohash

encoding lat lng to geohash.

```lisp
(encode 35.6588 139.7406 6)
#=> "xn76gg"
```

- (decode geohash) => (values (cons lat lng) (cons diff-lat diff-lng))

decoding geohash to lat-lng pair.
Also returning half-width of bounding-box.

```lisp
(decode "xn76gg")
#=> (35.658875 . 139.7406)
#=> (0.002746582 . 0.005493164)
```

- (neighbor geohash dir)

returning neighbor box geohash.

dir: (-1 . -1) (1 . 0)...etc

```lisp
(neighbor "xn76gg" (cons 1 0))
#=> "xn76gu"
```

- (neighbors geohash) => (list geohash)

returning neighbors geohash.

```lisp
(neighbors "xn76gg")
#=> ("xn76gd" "xn76gf" "xn76u4" "xn76ge" "xn76u5" "xn76gs" "xn76gu" "xn76uh")
```

## Licence

geohash is open-sourced under MIT license, check COPYING.
