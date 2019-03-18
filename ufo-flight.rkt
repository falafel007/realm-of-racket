#lang racket

(require 2htdp/universe 2htdp/image)

(define WIDTH 1180)
(define HEIGHT 680)

#|

-- b-b because GUI .: main for a UFO with CRASH 
-- two handlers:
++ to-draw : current state of bb -> image
++ on-tick : current state off bb -> current state of bb  

more wishes:
++ lowest-point
++ two drawing helper functions 

|#

(define (main)
  (big-bang 0
    (on-tick add-3-to-state)
    (to-draw draw-a-ufo-onto-an-empty-scene)))

(define (add-3-to-state current-state)
  [cond
    ((lowest-point current-state) (+ current-state 3))
    (else current-state)])

(define (draw-a-ufo-onto-an-empty-scene current-state)
  [cond
    ((lowest-point current-state) (make-image current-state IMAGE-of-UFO))
    (else (make-image current-state IMAGE-of-EXPLOSION))])

(define (make-image current-state the-image)
  (place-image the-image (/ WIDTH 2) current-state (empty-scene WIDTH HEIGHT)))

(define (lowest-point current-state)
  (< current-state (- HEIGHT (image-height IMAGE-of-UFO) -50)))


(define IMAGE-of-EXPLOSION (scale .5 (bitmap "crash.png")))

(define IMAGE-of-UFO (scale .25 (bitmap "ufo.png")))

