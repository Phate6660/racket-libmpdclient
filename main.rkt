#!/usr/bin/env racket

#lang racket/base

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer  define-libmpdclient (ffi-lib "libmpdclient"))
(define-cstruct      _mpd_connection     ([*conn _string]))
(define-libmpdclient mpd_connection_new  (_fun _string _int _int -> _mpd_connection))
(define-libmpdclient mpd_send_pause      (_fun _mpd_connection _bool -> _bool))
(define-libmpdclient mpd_send_stop       (_fun _mpd_connection -> _bool))

;; To connect to MPD with the default settings:
;; (define conn (mpd_connection_new "localhost" 6600 1000))

;; Examples of basic commands:
;; (mpd_send_stop conn) -- stops music
;; (mpd_send_pause conn #t) -- pauses music
;; (mpd_send_pause conn #f) -- resumes music
