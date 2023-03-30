#lang racket/base
(provide (all-defined-out))


;DRIVE Contructor

(define make-drive
  (lambda (letra nombre capacidad)
    (list letra nombre capacidad)))