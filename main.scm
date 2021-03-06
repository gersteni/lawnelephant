#lang scheme/base

(require (planet "leftparen.scm" ("vegashacker" "leftparen.plt" 4 (= 1)))
         "app.scm"
         "view.ss"
         "data.ss"
         "admin.ss")

(define-session-page (index-page req sesh)
  #:blank #t
  (index-page-view sesh))

(define-session-page (popular-page req sesh)
  #:blank #t
  (list-page-view sesh "popular" get-feature-requests-popular))

(define-session-page (newest-page req sesh)
  #:blank #t
  (list-page-view sesh "newest" get-feature-requests-newest))

(define-session-page (completed-page req sesh)
  #:blank #t
  (list-page-view sesh "completed" get-feature-requests-completed))

(define-session-page (feature-detail-page req sesh feat-id)
  #:blank #t
  (only-rec-of-type feat-id feature-request (f)
                    (feature-detail-page-view sesh f)))

(define-session-page (signin-page req sesh)
  (welcome-message sesh #:no-register #t))

(define-admin-session-page (adminified-index-page req sesh)
  #:blank #t
  (admin-mode (index-page-view sesh)))


;; caches

(define-type-cache feature-request)
