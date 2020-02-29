;;; evil-nl-break-undo-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "evil-nl-break-undo" "evil-nl-break-undo.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from evil-nl-break-undo.el

(autoload 'evil-nl-break-undo-mode "evil-nl-break-undo" "\
Evil minor mode that breaks the current undo step when a
change in insert state includes a newline, i.e. when a change in
the buffer steps over a newline (either by inserting, or by
removing one).

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-nl-break-undo" '("evil-nl-break-undo-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; evil-nl-break-undo-autoloads.el ends here
