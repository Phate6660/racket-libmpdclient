#!/usr/bin/env racket

#lang racket/base

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer  define-libmpdclient  (ffi-lib "libmpdclient"))
(define-cstruct      _mpd_connection      ([*conn _string]))
(define-libmpdclient mpd_connection_new   (_fun _string _int _int            -> _mpd_connection))
(define-libmpdclient mpd_run_consume      (_fun _mpd_connection _bool        -> _bool))
(define-libmpdclient mpd_run_crossfade    (_fun _mpd_connection _int         -> _bool))
(define-libmpdclient mpd_run_next         (_fun _mpd_connection              -> _bool))
(define-libmpdclient mpd_run_pause        (_fun _mpd_connection _bool        -> _bool))
(define-libmpdclient mpd_run_previous     (_fun _mpd_connection              -> _bool))
(define-libmpdclient mpd_run_random       (_fun _mpd_connection _bool        -> _bool))
(define-libmpdclient mpd_run_repeat       (_fun _mpd_connection _bool        -> _bool))
(define-libmpdclient mpd_run_seek_current (_fun _mpd_connection _float _bool -> _bool))
(define-libmpdclient mpd_run_single       (_fun _mpd_connection _bool        -> _bool))
(define-libmpdclient mpd_run_stop         (_fun _mpd_connection              -> _bool))
(provide mpd_connection_new
         mpd_run_consume
         mpd_run_crossfade
         mpd_run_next
         mpd_run_pause
         mpd_run_previous
         mpd_run_random
         mpd_run_repeat
         mpd_run_seek_current
         mpd_run_single
         mpd_run_stop)
